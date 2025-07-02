export FORCE_SHOW_EDIT_PAGE_LINK=true
npx antora antora-playbook.yml

target='./build'
# sed -i -e 's/noindex/all/g' $target/index.html
perl -i -pe's/noindex/all/g' $target/index.html
cp ./supplemental/googleeb9c46405b5f49a5.html $target/googleeb9c46405b5f49a5.html
rm -r $target/ui/partials
rm -f $target/ui/css/*.map
rm -f $target/ui/js/*.map
