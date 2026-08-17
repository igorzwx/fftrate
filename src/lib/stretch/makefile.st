MODULE = stretch
FILES  = stretch.o
ROOT   = ../..

include ../makedef.mk
include ../makelib.mk

so:
	$(MAKE) -f ../makeso.mk MODULE=$(MODULE) FILES="$(FILES)" ROOT=$(ROOT) LIBS="-lfft -lmathex -lm"
