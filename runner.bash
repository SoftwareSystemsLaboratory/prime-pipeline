#!/bin/bash

# This is the progam that analyzes a single repository
token=$2
repositoryFolder=$(basename $1 .git)
githubShortCode=$(echo $1 | sed -e 's/https:\/\/github.com\///g')

mkdir json graphs

source env/bin/activate

git clone $1
git -C $repositoryFolder pull

# Extract commits
ssl-metrics-git-commits-loc-extract -d $repositoryFolder -b HEAD -o json/commits_$repositoryFolder.json

# Extract issues
ssl-metrics-github-issues-collect -p -r $githubShortCode -o json/issues_$repositoryFolder.json -t $token

# Compute bus factor
ssl-metrics-git-bus-factor-compute -i json/commits_$repositoryFolder.json -o json/bf_$repositoryFolder.json

# Graph bus factor
python graph.py -i json/bf_$repositoryFolder.json -o graphs/bf_$repositoryFolder.pdf

# Compute issue density
ssl-metrics-github-issue-density-compute -c json/commits_$repositoryFolder.json -i json/issues_$repositoryFolder.json -o json/id_$repositoryFolder.json

# Graph issue density
python graph.py -i json/id_$repositoryFolder.json -o graphs/id_$repositoryFolder.pdf

# Compute productivity
ssl-metrics-git-productivity-compute -i json/commits_$repositoryFolder.json -o json/p_$repositoryFolder.json

# Graph productivity
python graph.py -i json/p_$repositoryFolder.json -o graphs/p_$repositoryFolder.pdf
