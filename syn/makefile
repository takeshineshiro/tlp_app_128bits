###################################################################
# Project Configuration: 
# 
# Specify the name of the design (project), the Quartus II Settings
# File (.qsf), and the list of source files used.
###################################################################

DEVICE = EP4SGX70HF35C2
FLASH_DEVICE = EPCS128
PROJECT = top
SOURCE_FILES =
ASSIGNMENT_FILES = $(PROJECT).qpf  
###################################################################
# Main Targets
#
# all: build everything
# clean: remove output files and database
###################################################################

all: asm tan 

map: $(PROJECT).map.rpt
fit: $(PROJECT).fit.rpt
asm: $(PROJECT).asm.rpt
tan: $(PROJECT).tan.rpt

###################################################################
# Executable Configuration
###################################################################

PUB_ARGS := --read_settings_files=on --write_settings_files=off
MAP_ARGS := --part=$(DEVICE) $(PUB_ARGS)
FIT_ARGS := --part=$(DEVICE) $(PUB_ARGS)
ASM_ARGS := $(PUB_ARGS)
TAN_ARGS :=

###################################################################
# Target implementations
###################################################################

$(PROJECT).map.rpt: 
	quartus_map $(MAP_ARGS) $(PROJECT)

$(PROJECT).fit.rpt: $(PROJECT).map.rpt
	quartus_fit $(FIT_ARGS) $(PROJECT)

$(PROJECT).asm.rpt: $(PROJECT).fit.rpt
	quartus_asm $(ASM_ARGS) $(PROJECT)

$(PROJECT).tan.rpt: $(PROJECT).fit.rpt
	quartus_sta $(TAN_ARGS) $(PROJECT)

# Project initialization
$(ASSIGNMENT_FILES): $(PROJECT).qsf
	quartus_sh --prepare $(PROJECT)

###################################################################
# convert file
# program file
###################################################################

GEN_PARAM = -o "bitstream_compression=on"
SOF_NM := $(patsubst %.sof, %, $(shell ls *.sof))

$(SOF_NM):
	echo -e 'JedecChain;' > pre.cdf
	echo -e '\tFileRevision(JESD32A);' >> pre.cdf
	echo -e '\tDefaultMfr(6E);' >> pre.cdf
	echo -e "" >> pre.cdf
	echo -e '\tP ActionCode(Cfg) ' >> pre.cdf
	echo -e '\t\tDevice PartName($(DEVICE)) Path("./") File("$@.sof") MfrSpec(OpMask(1));' >> pre.cdf
	echo -e "" >> pre.cdf
	echo -e 'ChainEnd;' >> pre.cdf
	echo -e "" >> pre.cdf
	echo -e 'AlteraBegin;' >> pre.cdf
	echo -e '\tChainType(JTAG);' >> pre.cdf
	echo -e 'AlteraEnd;' >> pre.cdf
	quartus_pgm pre.cdf	

%.jic: %.sof
	quartus_cpf -c -d $(FLASH_DEVICE) -s $(DEVICE) $(GEN_PARAM) $*.sof $*.jic

%.rbf: %.sof
	quartus_cpf -c $(GEN_PARAM) $*.sof $*.rbf

%.pg: %.jic
	echo -e 'JedecChain;' > pre.cdf
	echo -e '\tFileRevision(JESD32A);' >> pre.cdf
	echo -e '\tDefaultMfr(6E);' >> pre.cdf
	echo -e "" >> pre.cdf
	echo -e '\tP ActionCode(Cfg) ' >> pre.cdf
	echo -e '\t\tDevice PartName($(DEVICE)) Path("./") File("$*.jic") MfrSpec(OpMask(1) SEC_Device(EPCS128) Child_OpMask(1 1));' >> pre.cdf
	echo -e "" >> pre.cdf
	echo -e 'ChainEnd;' >> pre.cdf
	echo -e "" >> pre.cdf
	echo -e 'AlteraBegin;' >> pre.cdf
	echo -e '\tChainType(JTAG);' >> pre.cdf
	echo -e 'AlteraEnd;' >> pre.cdf
	quartus_pgm pre.cdf	


###################################################################
# Project clean
###################################################################

clean:
	rm -rf *.smsg *.summary *.rpt *.log *~ *.chg *.map *.ddb
	rm -rf db incremental_db *.qip *.txt *.vcd *.wlf *.xml greybox_tmp
	rm -rf *.done *.jdi *.qws *.pin *.dpf undo_redo.txt PLLJ_PLLSPE_INFO.txt 
clall:
	make clean
	rm -rf *.qdf $(PROJECT).qpf $(PROJECT).cdf $(PROJECT).sof $(PROJECT).pof $(PROJECT).jic $(PROJECT).rbf

