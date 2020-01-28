EX_TEX = $(wildcard sources/list*tex)
EX_PDF = $(EX_TEX:sources/%.tex=exercises/%.pdf)
LEC_TEX = $(wildcard sources/lecture*tex)
LEC_PDF = $(LEC_TEX:sources/%.tex=lectures/%.pdf)

.PHONY: all
all: $(EX_PDF) $(LEC_PDF) git

git:
	git add $(EX_PDF) $(LEC_PDF) $(EX_TEX) $(LEC_TEX)

lectures/%.pdf: sources/%.pdf
	cp $< $@

exercises/%.pdf: sources/%.pdf
	cp $< $@

sources/%.pdf: sources/%.tex
	cd sources; pdflatex $(notdir $<); bibtex $($(notdir $<):tex=auf); pdflatex $(notdir $<); pdflatex $(notdir $<)

clean:
	cd sources; rm *aux *log *synctex.gz
