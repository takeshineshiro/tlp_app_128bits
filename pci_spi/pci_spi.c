#include <getopt.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include <stdio.h>
#include <sys/mman.h>

#include <errno.h>

#if __linux__
#include <endian.h>
#include <linux/types.h>
#if __BYTE_ORDER == __BIG_ENDIAN
#include <linux/byteorder/big_endian.h>
#endif
#if __BYTE_ORDER == __LITTLE_ENDIAN
#include <linux/byteorder/little_endian.h>
#endif
#define get16(x) __le16_to_cpu(x)
#define get32(x) __le32_to_cpu(x)
#define set16(x) __cpu_to_le16(x)
#define set32(x) __cpu_to_le32(x)
#endif
#include <stdint.h>
#include <linux/pci.h>

#define get64(x) (((uint64_t)get32(((uint32_t*)&(x))[1])<<32) | get32(((uint32_t*)&(x))[0]))

#define PCI_DEVFN(slot,func)    ((((slot) & 0x1f) << 3) | ((func) & 0x07))
#define PCI_SLOT(devfn)         (((devfn) >> 3) & 0x1f)
#define PCI_FUNC(devfn)         ((devfn) & 0x07)

static int debug = 0;

static char *
find_pci_device(long id)
{
        FILE *fp = fopen("/proc/bus/pci/devices", "r");
        int dfn;
        long dev;
        char *buf = NULL;
        int res = 0;

        while (getline(&buf, &res, fp) != 0) {
                sscanf(buf, "%4x\t%x", &dfn, &dev);
                //printf("found %x, %x, %s\n", bus, dev, buf);
                if (dev == id)
                        goto found;
                free(buf);
                buf = NULL;
        }

        return NULL;
found:
        sprintf(buf, "/proc/bus/pci/%02d/%02d.%d", 
                        dfn >> 8,
                        PCI_SLOT(dfn & 0xff),
                        PCI_FUNC(dfn & 0xff));
        printf("found %x, %x, %s\n", dfn, dev, buf);
        return buf;
}

#include <stdlib.h>
#include <string.h>
#include "linuxlist.h"

struct pci_buf {
	struct list_head entry;
	struct pci_buf *cmpl, *req;
	int write_req, read_req, read_cmpl, bro;
	uint32_t seq;

	uint8_t type;
	uint8_t tag;
	uint16_t len;
	uint32_t addr;

	int buf_sz;
	uint32_t buf[0];
};

static struct pci_buf *
find_read_cmpl(uint8_t tag, uint16_t addr, struct list_head *head, struct pci_buf *req)
{
	struct pci_buf *p;
	list_for_each_entry(p, head, entry) {
		if (p->read_cmpl == 0) /* is not read comple packet */
			continue;
		if (p->read_req) /* is read request */
			continue;
		if (p->req) /* already used */
			continue;
		if (/*((p->addr & 127) == addr) && */(p->tag == tag)) {
			p->req = req;
			return p;
		}
	}
	return NULL;
}

static LIST_HEAD(tx_fifo);
static LIST_HEAD(rx_fifo);

static int pci_dump_buf(uint32_t *buf, int len, struct list_head *head, char *pre, uint32_t seq)
{
	uint8_t type = buf[0] >> 24;
	uint16_t len0= buf[0] & 1023;
	uint8_t tag  = type == 0x4a ? buf[2] >> 8 : buf[1] >> 8;
	uint32_t adr0= buf[2] & 0xfffffffc;

	len0 ++;

	printf("%s: type %x, tag %x, adr %08x, len %d, %08x,%08x,%08x,%08x\n", 
			pre, type, tag, adr0, len0, buf[0], buf[1], buf[2],
			buf[3]);

	struct pci_buf *p = malloc(sizeof(*p) + len*4);
	p->type = type;
	p->tag  = tag;
	p->len  = len0;
	p->addr = adr0;
	p->cmpl = NULL;
	p->req  = NULL;
	p->read_req = type == 0x00;
	p->read_cmpl= type == 0x4a;
	p->write_req= type == 0x40;
	p->bro      = type == 0x34;
	p->seq      = seq;

	memcpy(p->buf, buf, len*4);
	list_add_tail(&p->entry, head);
}

static int pci_dump(uint32_t p0, uint32_t p1, uint32_t p2, char *pre)
{
	printf("%s: st_data %08x,%08x,%08x, be %02x, sop %d, eop %d, ready %d, bram_sel %d, counter %d\n",
			pre,
			p0, p1, p2,  /* st data */
			p2 >> 24, /* be */
			((p2 & (1<<23)) != 0), /* sop */
			((p2 & (1<<22)) != 0), /* eop */
			((p2 & (1<<21)) != 0),
			((p2 & (1<<12)) != 0),
			p2 & 4095);
	return 0;
}

int main(int argc, char *argv[])
{
        char *dev = NULL;
        int fd;
        unsigned char config[64];
        int memPhys;
        uint32_t val, c = 0;
        int opt, flags = 0;
        unsigned long ops = 0;
        char *file = "/tmp/flash.rom";
        int len = 210 * 1024;
        int found = 0;

        while ((opt = getopt(argc, argv, "d:D:f:rweisl:")) != -1) {
                switch (opt) {
                        case 'd':
                                dev = strdup(optarg);
                                break;
                        case 'l':
                                len = atoi(optarg);
                                break;
                        case 'D':
                                debug = atoi(optarg);
                                break;
                        case 'f':
                                file = strdup(optarg);
                                break;
                }
        }
        if (dev == NULL)
                dev = find_pci_device(0x11720004);

        fd = open(dev, O_RDWR);
        if (fd == -1) {
                perror("open:");
                return -1;
        }

        if (read(fd, config, sizeof(config)) == sizeof(config)) {
                if (config[1] == 0x11 && config[0] == 0x72 && 
                                config[3] == 0x00 && config[2] == 0x04)
                        found = 1;
                printf("PCI device %02x%02x:%02x%02x  %s\n", 
                                config[1], config[0], config[3], config[2], 
                                found ? "supported" : "unknow device");
        }
        if (found == 0)
                return 0;

        memPhys = get64(         config[0x10]) & ~0xF;
        printf("memPhys %x\n", memPhys);

        errno = ioctl(fd, PCIIOC_MMAP_IS_MEM);
        if (errno) {
                perror("ioctl");
                return -1;
        }
        int mem_fd = open("/dev/mem", O_RDWR);
        char *virt = mmap(NULL, 1024*1024, PROT_READ | PROT_WRITE, MAP_SHARED, mem_fd, memPhys);
        if (virt == MAP_FAILED) {
                perror("mmap");
                return -1;
        }

	uint32_t pcie_buf[1024];
	len = 0;
	printf("PCIE RX bram\n");
	int i;
	for (i = 0, len = 0; i < (1<<12); i ++) {
		uint32_t p0 =  *((uint32_t *)(0xd0000 + virt + i*4));
		uint32_t p1 =  *((uint32_t *)(0xe0000 + virt + i*4));
		uint32_t p2 =  *((uint32_t *)(0xf0000 + virt + i*4));
		pcie_buf[len*2+1] = p0;
		pcie_buf[len*2+0] = p1;
		//pcie_buf[len*3+2] = p2;
		pci_dump(p0, p1, p2, "RX FIFO");
		len ++;
		if (p2 & (1<<22)) {
			pci_dump_buf(pcie_buf, len, &rx_fifo, "RX FIFO",
					p2&4095);
			memset(pcie_buf, 0, sizeof(pcie_buf));
			len = 0;
		}
	}
	
	printf("PCIE TX bram\n");
	for (i = 0, len = 0; i < (1<<12); i ++) {
		uint32_t p0 =  *((uint32_t *)(0x90000 + virt + i*4));
		uint32_t p1 =  *((uint32_t *)(0xa0000 + virt + i*4));
		uint32_t p2 =  *((uint32_t *)(0xb0000 + virt + i*4));
		pcie_buf[len*2+1] = p0;
		pcie_buf[len*2+0] = p1;
		//pcie_buf[len*3+2] = p2;
		pci_dump(p0, p1, p2, "TX FIFO");
		len ++;
		if (p2 & (1<<22)) {
			pci_dump_buf(pcie_buf, len, &tx_fifo, "TX FIFO",
					p2 & 4095);
			memset(pcie_buf, 0, sizeof(pcie_buf));
			len = 0;
		}
	}

	struct pci_buf *tp, *tt;
	/* Host -> Device */
	list_for_each_entry(tp, &rx_fifo, entry) {
		if (tp->read_req) { /* Read Reuqest */
			tp->cmpl = find_read_cmpl(tp->tag, tp->addr & 127, &tx_fifo, tp);
			continue;
		}
	}

	/* Device -> Host */
	list_for_each_entry(tp, &tx_fifo, entry) {
		if (tp->read_req) { /* Read Reuqest */
			tp->cmpl = find_read_cmpl(tp->tag, tp->addr & 127, &rx_fifo, tp);
			continue;
		}
	}
	printf("-----------------------------------------------------\n");

	list_for_each_entry_safe(tp, tt, &rx_fifo, entry) {
		if (tp->bro) /* bro */
			continue;
		if (tp->write_req) /* write request */
			continue;
		if (tp->read_cmpl) /* read cmpl */
			continue;
		if (tp->cmpl) {
			struct pci_buf *p = tp;
			printf("HD-I [REQ] type %02x, tag %02x, addr %08x, len %d, seq %d\n",
					p->type, p->tag, p->addr, p->len, p->seq);
			p = tp->cmpl;
			printf("     [CPL] type %02x, tag %02x, addr %08x, len %d, seq %d\n",
					p->type, p->tag, p->addr, p->len, p->seq);
			continue;
		}
		if (tp->req == NULL) {
			struct pci_buf *p = tp;
			printf("HD-E [REQ] type %02x, tag %02x, addr %08x, len %d, seq %d\n",
					p->type, p->tag, p->addr, p->len, p->seq);
		}
	}

	printf("-----------------------------------------------------\n");
	list_for_each_entry_safe(tp, tt, &tx_fifo, entry) {
		if (tp->bro) /* bro */
			continue;
		if (tp->write_req) /* write request */
			continue;
		if (tp->read_cmpl) /* read cmpl */
			continue;
		if (tp->cmpl) {
			struct pci_buf *p = tp;
			printf("DH-I [REQ] type %02x, tag %02x, addr %08x, len %d, seq %d\n",
					p->type, p->tag, p->addr, p->len, p->seq);
			p = tp->cmpl;
			printf("     [CPL] type %02x, tag %02x, addr %08x, len %d, seq %d\n",
					p->type, p->tag, p->addr, p->len, p->seq);
			continue;
		}
		if (tp->req == NULL) {
			struct pci_buf *p = tp;
			printf("DH-E [REQ] type %02x, tag %02x, addr %08x, len %d, seq %d\n",
					p->type, p->tag, p->addr, p->len, p->seq);
		}
	}
}
