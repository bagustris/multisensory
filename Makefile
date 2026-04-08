MARP ?= marp

SOURCES := integration.md computation.md
HTMLS := $(SOURCES:.md=.html)
PDFS := $(SOURCES:.md=.pdf)

.PHONY: all html pdf clean

all: html pdf

html: $(HTMLS)

pdf: $(PDFS)

%.html: %.md
	$(MARP) $< -o $@

%.pdf: %.md
	$(MARP) --pdf $< -o $@

clean:
	rm -f $(HTMLS) $(PDFS)