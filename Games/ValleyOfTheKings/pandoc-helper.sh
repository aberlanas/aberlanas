#!/bin/bash

mkdir -p PDFS

make-valley(){

for f in $(find . -name  "*.md"); do
    echo "Procesando : ${f}"
    DESTPDF=$(basename $f| cut -d "." -f1).pdf
	pandoc ${f} -o ./PDFS/${DESTPDF} --from markdown --template ../rsrc/templates/eisvogel.tex --listings

done
cd ..

}

make-valley