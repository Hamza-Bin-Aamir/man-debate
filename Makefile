LATEXMK ?= latexmk
OUTDIR  ?= build

.PHONY: all clean full book-01 section-definitions

all: full

$(OUTDIR):
	mkdir -p $(OUTDIR)

full: $(OUTDIR)
	@echo "Generating build metadata..."
	@./scripts/generate-buildinfo.sh
	$(LATEXMK) -C -outdir=$(OUTDIR) src/main.tex || true; \
	$(LATEXMK) -pdf -interaction=nonstopmode -halt-on-error -outdir=$(OUTDIR) src/main.tex

book-01: $(OUTDIR)
	$(LATEXMK) -C -outdir=$(OUTDIR) -jobname=man-debate-book-01 src/targets/book-01.tex || true
	$(LATEXMK) -pdf -interaction=nonstopmode -halt-on-error -outdir=$(OUTDIR) -jobname=man-debate-book-01 src/targets/book-01.tex

section-definitions: $(OUTDIR)
	$(LATEXMK) -C -outdir=$(OUTDIR) -jobname=man-debate-section-definitions src/targets/section-definitions.tex || true
	$(LATEXMK) -pdf -interaction=nonstopmode -halt-on-error -outdir=$(OUTDIR) -jobname=man-debate-section-definitions src/targets/section-definitions.tex

.PHONY: lint validate-tabs title-preview
lint:
	./scripts/lint.sh

validate-tabs:
	./scripts/validate-tabs.sh

# Quick preview of title page only (for rapid iteration)
title-preview: $(OUTDIR)
	@./scripts/generate-buildinfo.sh
	$(LATEXMK) -pdf -interaction=nonstopmode -halt-on-error -outdir=$(OUTDIR) -jobname=man-debate-titlepage src/targets/titlepage-preview.tex || true

# Delta target: make delta-<shortsha>
.PHONY: delta-%
delta-%: $(OUTDIR)
	@HASH=$*; \
	CHANGED=`git diff --name-only $$HASH..HEAD -- content || true`; \
	if [ -z "$$CHANGED" ]; then echo "No content changes since $$HASH"; exit 0; fi; \
	TMP=build/delta-$$HASH.tex; mkdir -p build; \
	cat > $$TMP <<'TEX'
	\documentclass[11pt]{article}
	\input{src/metadata.tex}
	\input{src/preamble.tex}
	\begin{document}
	\input{src/titlepage.tex}
	TEX
	for f in $$CHANGED; do echo "Including $$f"; echo "\\input{$$f}" >> $$TMP; done; \
	echo "\\end{document}" >> $$TMP; \
	$(LATEXMK) -pdf -interaction=nonstopmode -halt-on-error -outdir=build -jobname=man-debate-delta-$$HASH $$TMP || true

clean:
	$(LATEXMK) -C -outdir=$(OUTDIR) src/main.tex || true
	rm -rf $(OUTDIR)
