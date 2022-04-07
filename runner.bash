#!/bin/bash

# This is the progam that analyzes a single repository
token=$2
repositoryFolder=$(basename $1 .git)
githubShortCode=$(echo $1 | sed -e 's/https:\/\/github.com\///g')

source env/bin/activate

git clone $1

# Extract commits
ssl-metrics-git-commits-loc-extract -d $repositoryFolder -b HEAD -o commits_$repositoryFolder.json

# Extract issues
ssl-metrics-github-issues-collect -p -r $githubShortCode -o issues_$repositoryFolder.json -t $token
