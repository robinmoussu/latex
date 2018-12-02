all: fr en

fr: cv_robin_moussu_fr.pdf
en: cv_robin_moussu_en.pdf

cv_robin_moussu_fr.pdf: cv_robin_moussu.tex moderncvstylecustom.sty photo.jpg
	 latexmk -pdf $<

cv_robin_moussu_en.pdf: cv_robin_moussu.tex moderncvstylecustom.sty photo.jpg
	 pdflatex -jobname=cv_robin_moussu_en "\def\isenglish{1} \input{$<}"

.PHONY: clean mrproper

clean:
	rm -rf *~ .*~
	latexmk -c

mrproper: clean
	rm -f cv_robin_moussu_fr.pdf cv_robin_moussu_en.pdf
