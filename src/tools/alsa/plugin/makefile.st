MODULE = asound_module_rate_fftrate
FILES  = plugin.o
LIBS   = -Wl,-Bstatic -lconvert -lfft -lriffio -lmathex -lcmdline -Wl,-Bdynamic -lm -lasound 
ROOT   = ../../..

CMP    = $(CC)
EXT    = c

include $(ROOT)/lib/makedef.mk
include $(ROOT)/lib/makeso.mk
