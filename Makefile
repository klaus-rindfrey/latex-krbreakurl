##############################################################################
# krbreakurl
##############################################################################

BUILD := build

export TEXINPUTS := $(CURDIR)//:$(TEXINPUTS)

LATEX := lualatex
LATEXMK := latexmk

.PHONY: default all sty doc demo clean distclean check

##############################################################################

default: doc

check: doc demo

all: sty

##############################################################################

sty: krbreakurl.sty

krbreakurl.sty: krbreakurl.ins krbreakurl.dtx
	$(LATEX) krbreakurl.ins

##############################################################################

doc: sty
#latexmk -lualatex krbreakurl.dtx
	$(LATEX) krbreakurl.dtx
	makeindex -s gind.ist -o krbreakurl.ind krbreakurl.idx
	makeindex -s gglo.ist -o krbreakurl.gls krbreakurl.glo
	$(LATEX) krbreakurl.dtx
	$(LATEX) krbreakurl.dtx

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
	    krbreakurl.aux         \
	    krbreakurl.glo         \
	    krbreakurl.gls         \
	    krbreakurl.hd          \
	    krbreakurl.idx         \
	    krbreakurl.ilg         \
	    krbreakurl.ind         \
	    krbreakurl.log         \
	    krbreakurl.out         \
	    krbreakurl.toc         \
      krbreakurl.fls         \
      krbreakurl.fdb_latexmk


##############################################################################

distclean: clean
	rm -rf $(BUILD)

	rm -f \
	    krbreakurl.pdf \
	    krbreakurl.sty
