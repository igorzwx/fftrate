MODULE = cmdline
FILES  = cmdline.o inifile.o kbhit.o str.o menu.o getopt.o
ROOT   = ../..

include ../makedef.mk
include ../makelib.mk

so:  
	$(MAKE) -f ../makeso.mk MODULE=$(MODULE) FILES="$(FILES)" ROOT=$(ROOT) LIBS="-lthr -lpthread"
