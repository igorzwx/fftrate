MODULE = pcm_conv

FILES  = Main.o
LIBS   = -Wl,-Bstatic -lpcm_common -lconvert -lfft -lmathex -lprofiler -lcmdline -lriffio -lthr -Wl,-Bdynamic -lm -lpthread

ROOT   = ../..

CMP    = $(CPP)
EXT    = cpp

include $(ROOT)/lib/makedef.mk
include $(ROOT)/lib/makeapp.mk
