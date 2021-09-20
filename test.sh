#!/bin/bash

# checkout the repo
if [ -n "${USE_GIT_URI}" ]; then
  GITHUB="git://github.com"
else
  GITHUB="https://github.com"
fi



echo $GITHUB
git clone "${GITHUB}/xavierosee/setup.git"            "${SETUP_LOC}"
cd $SETUP_LOC && ls -al
