FILE=cv_robin_moussu

all: $(FILE).pdf

$(FILE).pdf: $(FILE).tex moderncvstylecustom.sty photo.jpg
	 latexmk -pdf $<

.PHONY: clean mrproper

clean:
	rm -rf *~ .*~
	latexmk -c

mrproper: clean
	rm -f rapport.pdf
