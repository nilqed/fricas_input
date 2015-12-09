#!/bin/bash
echo ======================================
echo Converting input files to ipynb format
echo ====================================== 
cd input
ls -l *.input | wc -l
fricas -nox -eval ")read inputToNotebook"
mv -v *.ipynb ../ipynb 
cd ../ipynb
echo =================
echo Execute notebooks
echo =================
ls -l *.ipynb | wc -l
for a in *.ipynb; do jupyter nbconvert --to notebook --allow-errors --execute $a ; done 
mv -v *.nbconvert.ipynb ../nbconvert.ipynb
cd ../nbconvert.ipynb
ls -l *.nbconvert.ipynb | wc -l
echo ====================================== 
echo Converting evaluated notebooks to HTML
echo ======================================
for a in *.nbconvert.ipynb; do jupyter nbconvert --to html $a ; done
mv -v *.html ../nbconvert.html
cd ../nbconvert.html
ls -l *.html | wc -l
echo ** completed **

