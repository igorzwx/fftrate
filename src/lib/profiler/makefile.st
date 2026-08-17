MODULE = profiler
FILES  = clock.o profile.o
ROOT   = ../..

include ../makedef.mk
include ../makelib.mk

so:
	$(MAKE) -f ../makeso.mk MODULE=$(MODULE) FILES="$(FILES)" ROOT=$(ROOT)
