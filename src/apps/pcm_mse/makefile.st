MODULE = pcm_mse

FILES  = Main.o
LIBS   = -Wl,-Bstatic -lpcm_common -lconvert -lfft -lmathex -lriffio -lcmdline -lprofiler -Wl,-Bdynamic -lm

ROOT   = ../..

CMP    = $(CPP)
EXT    = cpp

include $(ROOT)/lib/makedef.mk
include $(ROOT)/lib/makeapp.mk
