MODULE = pcm_common

FILES  = Common.o  InfoConv.o
ROOT   = ../..

CMP    = $(CPP)
EXT    = cpp

include $(ROOT)/lib/makedef.mk
include $(ROOT)/lib/makelib.mk

so:
	$(MAKE) -f $(ROOT)/lib/makeso.mk MODULE=$(MODULE) FILES="$(FILES)" ROOT=$(ROOT) CMP=$(CPP) EXT=cpp
