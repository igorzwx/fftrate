MODULE = pcm_common

FILES  = Common.o  InfoConv.o
ROOT   = ../..

include $(ROOT)/lib/makedef.mk
include $(ROOT)/lib/makelib.mk

so:
	$(MAKE) -f $(ROOT)/lib/makeso.mk MODULE=$(MODULE) FILES="$(FILES)" ROOT=$(ROOT) LIBS="-lconvert -lfft -lmathex"
