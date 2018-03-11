# doc/Makefile --- generate documentation files

TEXISRC = cadr.texi amber.texi chinual.texi wind.texi \
	wind1.1.texi \
	chinual2nd.texi chinual4th.texi chinual6th.texi \
	NFILE.texi

.DEFAULT_GOAL: all 

.PHONY: all all-info all-pdf all-html
all: all-info all-html
all-info: $(patsubst %.texi,%.info, $(TEXISRC))
all-pdf: $(patsubst %.texi,%.pdf, $(TEXISRC))
all-html: $(patsubst %.texi,%.html, $(TEXISRC))

%.info: %.texi
	makeinfo $^

%.pdf: %.texi
	makeinfo --pdf $^

%.html: %.texi
	makeinfo --html --no-split --css-ref=https://lm-3.github.io/static/texinfo.css $^

.PHONY: clean
clean:
	rm -f *.info
	rm -f *.pdf
	rm -f *.html

# doc/Makefile ends here.
