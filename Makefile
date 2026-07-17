BUILD=build
SRC=test/demo.tex
export TEXINPUTS := $(CURDIR)//:$(TEXINPUTS)
all:
	mkdir -p $(BUILD)
	latexmk -pdf -pdflatex=lualatex -outdir=$(BUILD) $(SRC)
clean:
	latexmk -c -outdir=$(BUILD) $(SRC)
distclean:
	rm -rf $(BUILD)
