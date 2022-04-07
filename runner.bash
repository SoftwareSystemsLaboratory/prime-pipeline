#!/bin/bash
# This is the progam that analyzes a single repository
dt=$(date -d "today" +"%Y_%m_%d_%H_%M")
token=$2
repositoryFolder=$(basename $1 .git)
githubShortCode=$(echo $1 | sed -e 's/https:\/\/github.com\///g')

rootDir=$(basename $3 .txt)
jsonDir=json-$dt
graphsDir=graphs-$dt

mkdir $rootDir
mkdir $rootDir/$rootDir/$jsonDir
mkdir $rootDir/$rootDir/$graphsDir

source env/bin/activate

git clone $1
git -C $repositoryFolder pull

# Extract commits
ssl-metrics-git-commits-loc-extract -d $repositoryFolder -b HEAD -o $rootDir/$jsonDir/commits_$repositoryFolder-$dt.json

# Extract issues
ssl-metrics-github-issues-collect -p -r $githubShortCode -o $rootDir/$jsonDir/issues_$repositoryFolder-$dt.json -t $token

# Compute bus factor
ssl-metrics-git-bus-factor-compute -i $rootDir/$jsonDir/commits_$repositoryFolder-$dt.json -o $rootDir/$jsonDir/bf_$repositoryFolder-$dt.json

# Graph bus factor
python graph.py -i $rootDir/$jsonDir/bf_$repositoryFolder-$dt.json -o $rootDir/$graphsDir/bf_$repositoryFolder-$dt.pdf

# Compute issue density
ssl-metrics-github-issue-density-compute -c $rootDir/$jsonDir/commits_$repositoryFolder-$dt.json -i $rootDir/$jsonDir/issues_$repositoryFolder-$dt.json -o $rootDir/$jsonDir/id_$repositoryFolder-$dt.json

# Graph issue density
python graph.py -i $rootDir/$jsonDir/id_$repositoryFolder-$dt.json -o $rootDir/$graphsDir/id_$repositoryFolder-$dt.pdf

# Compute productivity
ssl-metrics-git-productivity-compute -i $rootDir/$jsonDir/commits_$repositoryFolder-$dt.json -o $rootDir/$jsonDir/p_$repositoryFolder-$dt.json

# Graph productivity
python graph.py -i $rootDir/$jsonDir/p_$repositoryFolder-$dt.json -o $rootDir/$graphsDir/p_$repositoryFolder-$dt.pdf

# Sync outputs to GDrive
rclone copy $rootDir/$jsonDir gdrive:"Software and Systems Laboratory"/"Paper Writing"/"figures"/$rootDir/$jsonDir
rclone copy $rootDir/$graphsDir gdrive:"Software and Systems Laboratory"/"Paper Writing"/"figures"/$rootDir/$graphsDir
