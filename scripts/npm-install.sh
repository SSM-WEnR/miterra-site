npm install antora @antora/lunr-extension @djencks/asciidoctor-mathjax @springio/antora-xref-extension antora-shiki-extension asciidoctor-treeview

# Ubuntu path is case sensitive, and `asciidoctor-mathjax` could not correctly process the name of `colorv2` package (expect `ColorV2Configuration.js` but get `Colorv2Configuration.js`).
# Therefore, we need to rename the file to bypass the issue.
mv ./node_modules/mathjax-full/js/input/tex/colorv2/ColorV2Configuration.js ./node_modules/mathjax-full/js/input/tex/colorv2/Colorv2Configuration.js
