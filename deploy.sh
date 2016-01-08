#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

echo -e "\033[0;33mBuilding pages...\033[0m"
hugo -d sir-wiggles.github.io

echo -e "\033[0;33mPushing public...\033[0m"
cd sir-wiggles.github.io
git add -A
git commit -m "$msg"
git push origin master

echo -e "\033[0;33mPushing source...\033[0m"
cd ..
git add -A
git commit -m "$msg"
git push origin master
