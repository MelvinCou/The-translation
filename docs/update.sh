#!/bin/sh

git pull --recurse-submodules
git submodule update --remote --recursive

find ../wiki -name "*.md" -exec pandoc -F mermaid-filter -f markdown -t latex -o {}.pdf {} \;
mv ../wiki/*.pdf .
# Remove ".md" from pdf filenames
for i in *.pdf; do mv "$i" "`echo $i | sed 's/\.md//'`" | true; done
