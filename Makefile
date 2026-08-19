
include src/lib/makedef.mk

PREFIX ?= /usr
ARCH := $(shell gcc -dumpmachine)
ifneq ($(DSTD),)
ARCH := $(DSTD)
endif

# Version: prefer git describe, persist to VERSION, fall back to VERSION if git fails
GIT_VERSION := $(strip $(shell git describe --tags --always --dirty 2>/dev/null))
ifneq ($(GIT_VERSION),)
VERSION_NUM := $(GIT_VERSION)
$(shell echo "$(VERSION_NUM)" > VERSION)
else 
VERSION_NUM := $(strip $(shell cat VERSION 2>/dev/null || echo unknown))
endif
export VERSION_NUM

all: libs apps tools
	( cd src/tests; $(MAKE) -f $(MAKEF) )  
	@# relocate core .so files that landed in bin/ due to makeso.mk's BIND
	mkdir -p lib
	for f in cmdline convert fft mathex profiler riffio stretch thr; do \
		mv bin/lib$$f.so lib/ 2>/dev/null || true; \
	done
	@# stage headers
	mkdir -p include/fftrate
	cp src/lib/*.h include/fftrate/
	for d in cmdline convert fft mathex profiler riffio stretch thr; do \
		mkdir -p include/fftrate/$$d; \
		cp src/lib/$$d/*.h include/fftrate/$$d/ 2>/dev/null || true; \
	done
	@# stage pkg-config
	mkdir -p lib/$(ARCH)/pkgconfig
	printf 'prefix=%s\nexec_prefix=$${prefix}\nlibdir=$${exec_prefix}/lib\nincludedir=$${prefix}/include/fftrate\n\nName: fftrate\nDescription: FFT-based sample rate conversion library\nVersion: 1.0\nLibs: -L$${libdir} -lconvert -lfft -lmathex -lriffio -lcmdline -lprofiler -lstretch -lthr\nCflags: -I$${includedir}\n' "$(PREFIX)" > lib/$(ARCH)/pkgconfig/fftrate.pc
	@# stage config
	mkdir -p etc
	cp packets/etc/fftrate.conf etc/
	@# stage ALSA plugin  
	mkdir -p lib/$(ARCH)/alsa-lib
	mv bin/libasound_module_rate_fftrate.so lib/$(ARCH)/alsa-lib/ 2>/dev/null || true

libs:
	( cd src/lib; $(MAKE) -f $(MAKEF) )

apps:
	( cd src/apps; $(MAKE) -f $(MAKEF) )

tools:
	( cd src/tools; $(MAKE) -f $(MAKEF) )

clean:
	( cd src/lib; $(MAKE) -f $(MAKEF) clean )
	( cd src/apps; $(MAKE) -f $(MAKEF) clean )
	( cd src/tests; $(MAKE) -f $(MAKEF) clean )
	( cd src/tools; $(MAKE) -f $(MAKEF) clean )
	rm -rf build-*-*-*

purge: clean
	rm -rf bin lib include etc

install:  
	install -dm755 "$(DESTDIR)$(PREFIX)/bin" "$(DESTDIR)$(PREFIX)/lib" \
		"$(DESTDIR)$(PREFIX)/include/fftrate" "$(DESTDIR)$(PREFIX)/lib/$(ARCH)/pkgconfig" \
		"$(DESTDIR)$(PREFIX)/lib/$(ARCH)/alsa-lib" "$(DESTDIR)/etc"
	cp -r bin/* "$(DESTDIR)$(PREFIX)/bin/"
	cp -r lib/*.a lib/*.so "$(DESTDIR)$(PREFIX)/lib/" 2>/dev/null || true
	cp -r include/fftrate/* "$(DESTDIR)$(PREFIX)/include/fftrate/"
	cp lib/$(ARCH)/pkgconfig/fftrate.pc "$(DESTDIR)$(PREFIX)/lib/$(ARCH)/pkgconfig/"
	cp lib/$(ARCH)/alsa-lib/libasound_module_rate_fftrate.so "$(DESTDIR)$(PREFIX)/lib/$(ARCH)/alsa-lib/"
	cp etc/fftrate.conf "$(DESTDIR)/etc/"
