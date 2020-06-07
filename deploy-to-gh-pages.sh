#!bash

git checkout -b gh-pages-deployer
jekyll build
git add -f _site
git commit -am "gh-pages deployment"
#git subtree push --prefix _site origin gh-pages
git subtree split --prefix _site -b gh-pages
git checkout gh-pages
git push -f origin gh-pages
#git push origin `git subtree split --prefix _site -b gh-pages`:gh-pages --force
git checkout master
git branch -D gh-pages-deployer
git branch -D gh-pages
