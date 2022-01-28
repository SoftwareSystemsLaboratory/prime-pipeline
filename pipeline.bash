#!/bin/bash

# Get the current working git branch
gitBranch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Set defaults
cwd=$PWD
githubURL=${githubURL:-https://github.com/LoyolaChicagoCS/coursedescriptions}

while getopts u:p: flag
do
    case "${flag}" in
        u) githubURL=${OPTARG};;
    esac
done

# Split input string into an array seperated by forward slashes
IFS='/'
read -ra splitURL <<< $githubURL

# Stop removing forward slashes from text
IFS=''

# Save the owner and repo name
owner=${splitURL[3]}
repo=${splitURL[4]}
repoFolder=$owner-$repo

# Git clone/pull the repository to a folder
gitDate=$(date +%F)
git clone $githubURL $repoFolder --progress

if [ $? -eq 128 ]
then
    cd $repoFolder
    gitDate=$(date +%F)
    git pull --progress
    echo ""
else
    cd $repoFolder
fi

# Run ssl-metrics-git-commits-loc
echo "Running ssl-metrics-git-commits-loc"
tool=ssl-metrics-git-commits-loc
jsonFilename=../${repoFolder}_${tool}_${gitDate}.json
ssl-metrics-git-commits-loc-extract -d . -b $(gitBranch) -o $jsonFilename
cd $cwd
echo ""
