all: fr en

fr: cv_robin_moussu.pdf
en: cv_robin_moussu_en.pdf

%.pdf: %.tex moderncvstylecustom.sty photo.jpg
	 latexmk -pdf $<

.PHONY: clean mrproper

clean:
	rm -rf *~ .*~
	latexmk -c

mrproper: clean
	rm -f cv_robin_moussu.pdf cv_robin_moussu_en.pdf
