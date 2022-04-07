#!/bin/bash

# This is the progam that analyzes a single repository

dt=$(date -d "today" +"%Y_%m_%d_%H_%M")
token=$2
repositoryFolder=$(basename $1 .git)
githubShortCode=$(echo $1 | sed -e 's/https:\/\/github.com\///g')

jsonDir=json_$dt
graphsDir=graphs_$dt

mkdir $jsonDir
mkdir $graphsDir

exit
source env/bin/activate

git clone $1
git -C $repositoryFolder pull

# Extract commits
ssl-metrics-git-commits-loc-extract -d $repositoryFolder -b HEAD -o $jsonDir/commits_$repositoryFolder.json

# Extract issues
ssl-metrics-github-issues-collect -p -r $githubShortCode -o $jsonDir/issues_$repositoryFolder.json -t $token

# Compute bus factor
ssl-metrics-git-bus-factor-compute -i $jsonDir/commits_$repositoryFolder.json -o $jsonDir/bf_$repositoryFolder.json

# Graph bus factor
python graph.py -i $jsonDir/bf_$repositoryFolder.json -o $graphsDir/bf_$repositoryFolder.pdf

# Compute issue density
ssl-metrics-github-issue-density-compute -c $jsonDir/commits_$repositoryFolder.json -i $jsonDir/issues_$repositoryFolder.json -o $jsonDir/id_$repositoryFolder.json

# Graph issue density
python graph.py -i $jsonDir/id_$repositoryFolder.json -o $graphsDir/id_$repositoryFolder.pdf

# Compute productivity
ssl-metrics-git-productivity-compute -i $jsonDir/commits_$repositoryFolder.json -o $jsonDir/p_$repositoryFolder.json

# Graph productivity
python graph.py -i $jsonDir/p_$repositoryFolder.json -o $graphsDir/p_$repositoryFolder.pdf
