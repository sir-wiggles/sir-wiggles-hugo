#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

# Build the project.
hugo -d sir-wiggles.github.io

cd sir-wiggles.github.io
git add -A
git commit -m "$msg"
git push origin master

cd ..
git add -A
git commit -m "$msg"
git push origin master
