#!/bin/bash
set -ev

git clone https://github.com/${GitHubUser}/${GitHubRepo}.git hexo/.blog_deploy #git clone site file to hexo/.blog_deploy
cd hexo/.blog_deploy 
git checkout master

cd ../  #in hexo folder

mv .blog_deploy/.git/ ./public/

cd ./public

#  - git init
#  - git config --global push.default matching
git config --global user.name "${GitHubUser}"
git config --global user.email "${GitHubEmail}"

git add --all .
git commit -m "site updated: `date +"%Y-%m-%d %H:%M:%S"`"

git push --quiet --force https://${GitHubToken}@github.com/${GitHubUser}/${GitHubRepo}.git master:master 
