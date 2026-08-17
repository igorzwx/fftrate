MODULE = riffio
FILES  = waveio.o mmsys.o
ROOT   = ../..

include ../makedef.mk
include ../makelib.mk

so:
	$(MAKE) -f ../makeso.mk MODULE=$(MODULE) FILES="$(FILES)" ROOT=$(ROOT)
