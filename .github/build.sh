#!/bin/bash
git config --global user.email "huynhduckhoan@gmail.com"
git config --global user.name "f97"
mkdir ./temp 
cd ./temp

rm -rf f97 gh-pages
git clone https://f97:$1@github.com/f97/f97.git 
git clone -b gh-pages  https://f97:$1@github.com/f97/f97.git gh-pages
rm -rf ./gh-pages/*

cp ./f97/README.md ./gh-pages/README.md 
cd gh-pages

# HTML
npx github-readme-to-html
mv dist/index.html .
npx replace-in-files-cli --string='Read Me' --replacement="HUYNH DUC KHOAN's cv" index.html
rm -rf dist/
# HTML

# PDF
cp README.md HUYNHDUCKHOAN_CV.md
npx replace-in-files-cli --string='|PDF|[HUYNHDUCKHOAN_CV.pdf](https://cv.f97.xyz/HUYNHDUCKHOAN_CV.pdf)|||' --replacement='' HUYNHDUCKHOAN_CV.md
npx md-to-pdf HUYNHDUCKHOAN_CV.md
echo 'cv.f97.xyz'> CNAME
rm HUYNHDUCKHOAN_CV.md
# PDF

# GIT PUSH
git add .
git commit -m ':zap: cv updated'
git push -f origin gh-pages:gh-pages
# GIT PUSH
