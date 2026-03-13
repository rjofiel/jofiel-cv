# Makefile for Jofiel CV
# Generates PDF versions in Spanish and English

# Compiler
XELATEX = xelatex -interaction=nonstopmode

# Main targets
.PHONY: all help clean pdf pdf-es pdf-en check-sync

all: pdf-es pdf-en

help:
	@echo "Jofiel CV Makefile"
	@echo ""
	@echo "Available targets:"
	@echo "  make pdf        - Generate both Spanish and English PDFs"
	@echo "  make pdf-es     - Generate Spanish version only"
	@echo "  make pdf-en     - Generate English version only"
	@echo "  make check-sync - Verify both CVs are in sync (dates)"
	@echo "  make clean      - Remove generated PDF and auxiliary files"
	@echo ""

check-sync:
	@echo "Checking CV synchronization..."
	@ES_FILES="$$(ls -t content/es/*.tex 2>/dev/null | head -1)"; \
	EN_FILES="$$(ls -t content/en/*.tex 2>/dev/null | head -1)"; \
	if [ -z "$$ES_FILES" ] || [ -z "$$EN_FILES" ]; then \
		echo "ERROR: Missing files in content/es or content/en"; \
		exit 1; \
	fi; \
	ES_DATE=$$(stat -c %Y "$$ES_FILES" 2>/dev/null || stat -f %m "$$ES_FILES"); \
	EN_DATE=$$(stat -c %Y "$$EN_FILES" 2>/dev/null || stat -f %m "$$EN_FILES"); \
	DIFF=$$(echo "$$ES_DATE - $$EN_DATE" | bc 2>/dev/null || echo "$$((ES_DATE - EN_DATE))"); \
	ABS_DIFF=$$(echo "$$DIFF" | tr -d '-'); \
	if [ "$$ABS_DIFF" -gt 86400 ] 2>/dev/null; then \
		echo "WARNING: CVs may be out of sync!"; \
		echo "  Most recent ES: $$ES_FILES"; \
		echo "  Most recent EN: $$EN_FILES"; \
		echo ""; \
		echo "Run 'make pdf' to regenerate both PDFs with current content."; \
		exit 1; \
	fi; \
	echo "OK: Both CVs appear to be in sync."

pdf: pdf-es pdf-en

pdf-es:
	@echo "Generating Spanish version..."
	@$(XELATEX) curriculum-es.tex
	@$(XELATEX) curriculum-es.tex
	@mv curriculum-es.pdf curriculum.pdf
	@echo "Done! -> curriculum.pdf (Spanish)"

pdf-en:
	@echo "Generating English version..."
	@$(XELATEX) curriculum-en.tex
	@$(XELATEX) curriculum-en.tex
	@echo "Done! -> curriculum-en.pdf (English)"

clean:
	@echo "Cleaning auxiliary files..."
	@rm -f *.aux *.log *.out *.toc *.bbl *.blg *.nav *.snm
	@rm -f curriculum.pdf curriculum-en.pdf
	@echo "Clean complete!"
