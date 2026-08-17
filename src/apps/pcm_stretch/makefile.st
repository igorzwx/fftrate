MODULE = pcm_stretch
DIRC   = ../pcm_common

FILES  = Main.o
LIBS   = -Wl,-Bstatic -lpcm_common -lfft -lmathex -lprofiler -lcmdline -lriffio -lthr -Wl,-Bdynamic -lm -lpthread

ROOT   = ../..

CMP    = $(CPP)
EXT    = cpp

include $(ROOT)/lib/makedef.mk
include $(ROOT)/lib/makeapp.mk
