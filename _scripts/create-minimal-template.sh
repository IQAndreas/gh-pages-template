#!/bin/bash

# Create the new branch for the minimal template
git checkout -b gh-pages-minimal || exit 1;

# Few projects are going to have their own domain
git rm CNAME

# Remove spreadsheets accessible from "static.iqandreas.com"
git rm assets/stylesheets/slate/* -r
git rm assets/stylesheets/*.css -r

# Gods forgive me for this horrible, very "sensitive" code:
url='https://github.com/IQAndreas/gh-pages-template'
github_url='https://github.com/IQAndreas/gh-pages-template/tree/gh-pages-minimal'
sed -i -e "/^url:/        s|: .*|: '$url'|"        _config.yml
sed -i -e "/^github_url:/ s|: .*|: '$github_url'|" _config.yml
git add _config.yml

git commit -m "Create minimal template"

