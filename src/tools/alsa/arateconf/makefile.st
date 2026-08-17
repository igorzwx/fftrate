MODULE = arateconf
FILES  = alsa.o conf.o main.o
LIBS   = -Wl,-Bstatic -lmathex -lcmdline -lthr -Wl,-Bdynamic -lasound -lm -lpthread
ROOT   = ../../..

CMP    = $(CC)
EXT    = c

include $(ROOT)/lib/makedef.mk
include $(ROOT)/lib/makeapp.mk
