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

static int pci_dump_buf(uint32_t *buf, int len)
{
	uint8_t type = buf[0] >> 24;
	uint16_t len0= buf[0] & 1023;
	uint8_t tag  = buf[1] >> 8;
	uint32_t adr0= buf[2];

	len0 ++;
	printf("type %x, tag %x, adr %08x, len %d\n", type, tag, adr0, len0);
}

static int pci_dump(uint32_t p0, uint32_t p1, uint32_t p2)
{
	printf("st_data %08x,%08x, be %02x, sop %d, eop %d, ready %d, bram_sel %d, counter %d\n",
			p0, p1,  /* st data */
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

	uint32_t pcie_buf[128];
	len = 0;
	printf("PCIE RX bram\n");
	int i;
	for (i = 0, len = 0; i < (1<<12); i ++) {
		uint32_t p0 =  *((uint32_t *)(0xd0000 + virt + i*4));
		uint32_t p1 =  *((uint32_t *)(0xe0000 + virt + i*4));
		uint32_t p2 =  *((uint32_t *)(0xf0000 + virt + i*4));
		pcie_buf[len*3+0] = p1;
		pcie_buf[len*3+1] = p0;
		pcie_buf[len*3+2] = p2;
		pci_dump(p0, p1, p2);
		len += 3;
		if (p2 & (1<<22)) {
			pci_dump_buf(pcie_buf, len);
			len = 0;
		}
	}
	
	printf("PCIE TX bram\n");
	for (i = 0, len = 0; i < (1<<12); i ++) {
		uint32_t p0 =  *((uint32_t *)(0x90000 + virt + i*4));
		uint32_t p1 =  *((uint32_t *)(0xa0000 + virt + i*4));
		uint32_t p2 =  *((uint32_t *)(0xb0000 + virt + i*4));
		pcie_buf[len*3+0] = p1;
		pcie_buf[len*3+1] = p0;
		pcie_buf[len*3+2] = p2;
		pci_dump(p0, p1, p2);
		len += 3;
		if (p2 & (1<<22)) {
			pci_dump_buf(pcie_buf, len);
			len = 0;
		}
	}
}
