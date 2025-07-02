target='./build'
rel='./miterra-site'

rm -f $target/.nojekyll
rm -f $target/googleeb9c46405b5f49a5.html
rm -f $target/404.html
rm -f $target/robots.txt
rm -f $target/sitemap*.xml

brew install --cask prince

html=$target/miterra-docs/main/print.html
prince --javascript $html -o ./miterra-docs.pdf

rm -f $html

mv $target $rel
zip -qq -r miterra-site.zip $rel