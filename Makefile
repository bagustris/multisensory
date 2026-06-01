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
	$(MARP) $< -o $*.pdf.html
	sed -i \
	  -e 's|@import "https://fonts.bunny.net[^"]*";|/* local fonts */|g' \
	  -e 's|src="https://cdn.jsdelivr.net/gh/jdecked/twemoji[^"]*"|src=""|g' \
	  -e 's|<pre is="marp-pre" data-auto-scaling="downscale-only">|<pre>|g' \
	  $*.pdf.html
	google-chrome --headless=new --no-sandbox --disable-gpu --disable-dev-shm-usage \
	  --print-to-pdf=$@ --no-pdf-header-footer \
	  "file://$(CURDIR)/$*.pdf.html"
	rm -f $*.pdf.html

clean:
	rm -f $(HTMLS) $(PDFS)
