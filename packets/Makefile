DEBD = debian
USRD = usr

all:
	( cd ../; $(MAKE) all )

purge: clean
	( cd ../; $(MAKE) purge )
	rm -rf $(USRD)

clean:
	( cd $(DEBD); find -mindepth 1 -maxdepth 1 -type d ! -name source | xargs rm -rf )
	rm -rf $(DEBD)/tmp
	rm -rf $(DEBD)/*-utils
	rm -f $(DEBD)/*substvars
	rm -f $(DEBD)/*.log
	rm -f $(DEBD)/files
	rm -f build-stamp
