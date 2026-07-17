.PHONY: default doc demo clean distclean

default: doc

doc:
	latexmk -pdf -pdflatex=lualatex krbreakurl.dtx

demo:
	mkdir -p build
	latexmk -pdf -pdflatex=lualatex \
	    -outdir=build test/demo.tex

clean:
	latexmk -c krbreakurl.dtx
	latexmk -c -outdir=build test/demo.tex

distclean: clean
	rm -rf build
