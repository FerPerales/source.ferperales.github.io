#!/bin/bash

git checkout gh-pages
bundle exec middleman build
mv build docs
git add .
git commit -m "New release"
git push origin gh-pages
