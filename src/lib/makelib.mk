
all: mk_dir $(MODULE)

mk_dir:
	mkdir -p $(OBJD)
	mkdir -p $(LIBD)


$(MODULE): $(FILES)
	$(AR) rcs $(LIBD)/lib$(MODULE).a $(addprefix $(OBJD)/, $(FILES))

$(FILES):
	$(CMP) $(CFLAGS) -I $(INCD) -c $*.$(EXT) -o $(OBJD)/$@


clean:
	rm -rf $(OBJD)
