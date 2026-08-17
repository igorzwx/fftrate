MODULE = mathex
FILES  = mathex.o fpux86.o
ROOT   = ../..

include ../makedef.mk
include ../makelib.mk

so:
	$(MAKE) -f ../makeso.mk MODULE=$(MODULE) FILES="$(FILES)" ROOT=$(ROOT)
