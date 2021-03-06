#!/bin/sh

VERSION=`cat VERSION`

cp README.mkd ..
./bin/middleman build
git commit -am "Release $VERSION"
git push origin
git checkout gh-pages
rm -R js css img
mv build/* .
mv ../README.mkd .
git add .
git commit -am 'Update pages. See main branch for changes'
git push origin gh-pages
git checkout master
