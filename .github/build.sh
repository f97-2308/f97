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
sed -i 's/Read Me/HUYNH DUC KHOAN cv/' index.html
rm -rf dist/
# HTML

# PDF
npx md-to-pdf README.md
mv README.pdf HUYNHDUCKHOAN_CV.pdf
echo 'cv.f97.xyz'> CNAME

# GIT PUSH
git add .
git commit -m ':zap: cv updated'
git push -f origin gh-pages:gh-pages