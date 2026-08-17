MODULE = pcm_info

FILES  = Main.o
LIBS   = -Wl,-Bstatic -lpcm_common -lriffio -lmathex -lcmdline -Wl,-Bdynamic

ROOT   = ../..

CMP    = $(CPP)
EXT    = cpp

include $(ROOT)/lib/makedef.mk
include $(ROOT)/lib/makeapp.mk
