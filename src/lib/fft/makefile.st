MODULE = fft
FILES  = fft.o dct4.o mdct.o
ROOT   = ../..

include ../makedef.mk
include ../makelib.mk

so:
	$(MAKE) -f ../makeso.mk MODULE=$(MODULE) FILES="$(FILES)" ROOT=$(ROOT) LIBS="-lmathex -lm"
