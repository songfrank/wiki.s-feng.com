#!/bin/bash

cd output

git add .
git commit . -m "Update wiki"
git push origin gh-pages

cd -
