# doc/Makefile --- generate documentation files

TEXISRC = cadr.texi amber.texi

.DEFAULT_GOAL: all 

.PHONY: all all-info all-pdf
all: all-info #all-pdf
all-info: $(patsubst %.texi,%.info, $(TEXISRC))
all-pdf: $(patsubst %.texi,%.pdf, $(TEXISRC))

%.info: %.texi
	makeinfo $^

%.pdf: %.texi
	makeinfo --pdf $^

.PHONY: clean
clean:
	rm -f *.info
	rm -f *.pdf

# doc/Makefile ends here.
