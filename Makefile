##############################################################################
# luabreakurl
##############################################################################

BUILD := build
VERSION := 1.0

export TEXINPUTS := $(CURDIR)//:$(TEXINPUTS)

LATEX := lualatex
LATEXMK := latexmk

.PHONY: default all sty doc demo clean distclean check

##############################################################################

default: doc

check: doc demo

all: sty


##############################################################################

DIST := luabreakurl

.PHONY: dist

dist: check
	rm -rf $(DIST)
	rm -f $(DIST).zip

	mkdir $(DIST)

	cp \
	    luabreakurl.dtx \
	    luabreakurl.ins \
      luabreakurl.pdf \
	    README.md \
	    LICENSE \
	    CHANGES.md \
	    Makefile \
	    $(DIST)

	cp -r test $(DIST)
	zip -r $(DIST).zip $(DIST)

	rm -rf $(DIST)

##############################################################################

sty: luabreakurl.sty

luabreakurl.sty: luabreakurl.ins luabreakurl.dtx
	$(LATEX) luabreakurl.ins

##############################################################################

doc: sty
	$(LATEX) luabreakurl.dtx
	makeindex -s gind.ist -o luabreakurl.ind luabreakurl.idx
	makeindex -s gglo.ist -o luabreakurl.gls luabreakurl.glo
	$(LATEX) luabreakurl.dtx
	$(LATEX) luabreakurl.dtx

##############################################################################

demo: sty
	mkdir -p $(BUILD)
	$(LATEXMK) \
	    -pdf \
	    -pdflatex=$(LATEX) \
	    -outdir=$(BUILD) \
	    test/demo.tex

##############################################################################

clean:
	$(LATEXMK) -c -outdir=$(BUILD) test/demo.tex

	rm -f \
	    luabreakurl.aux         \
	    luabreakurl.glo         \
	    luabreakurl.gls         \
	    luabreakurl.hd          \
	    luabreakurl.idx         \
	    luabreakurl.ilg         \
	    luabreakurl.ind         \
	    luabreakurl.log         \
	    luabreakurl.out         \
	    luabreakurl.toc         \
      luabreakurl.fls         \
      luabreakurl.fdb_latexmk


##############################################################################

distclean: clean
	rm -rf $(BUILD)

	rm -f \
	    luabreakurl.pdf \
	    luabreakurl.sty
