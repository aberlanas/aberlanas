#!/usr/bin/make -f

#TEMPLATE_TEX_PD="rsrc/templates/pd-nologo-tpl.latex"
# Colors
BLUE= \e[1;34m
LIGHTBLUE= \e[94m
LIGHTGREEN= \e[92m
LIGHTYELLOW= \e[93m

RESET= \e[0m

# Templates 
TEMPLATE_TEX_PD="../rsrc/templates/eisvogel.tex"
PANDOC_OPTIONS="-V fontsize=12pt -V mainfont="Ubuntu" --pdf-engine=xelatex "
TEMPLATE_TEX_TASK="../rsrc/templates/eisvogel.tex"

# PDFS
PDF_PATH:=$(shell readlink -f PDFS)

# Units 
ARTICLES2022:=$(shell readlink -f 2022-Senia-Cookie/)
ARTICLES2022_FILES := $(wildcard $(ARTICLES2022)/*.md)



# RULES

clean:
	@echo " [${BLUE} * Step : Clean ${RESET}] "
	@echo "${LIGHTBLUE} -- PDFS ${RESET}"
	rm -f PDFS/*.pdf
	rm -f PDFS/*.odt


files:
	@echo " [${BLUE} * Step : Files ${RESET}] "
	@echo "${LIGHTBLUE} * Creating folder [ PDFS ]${RESET}"
	mkdir -p PDFS


articles-22: clean files

	@echo " [${BLUE} * Step : Compiling PDF ${RESET}] "
	@echo " [${LIGHTGREEN} Articles 2022 ${RESET}] "

	@for f in $(ARTICLES2022_FILES); do \
		#echo $$f ;\
    	echo " - ${LIGHTYELLOW} Working${RESET} with: `basename $$f`";\
		cd $(ARTICLES2022) && pandoc $$f --template $(TEMPLATE_TEX_TASK) $(PANDOC_OPTIONS) --bibliography=senia-cookie-references.bib --from markdown --listings -o $(PDF_PATH)/`basename $$f .md`.pdf ;\
    done

