#!/bin/bash
# This is the progam that analyzes a single repository
dt=$(date -d "today" +"%Y_%m_%d_%H_%M")
token=$2
repositoryFolder=$(basename $1 .git)
githubShortCode=$(echo $1 | sed -e 's/https:\/\/github.com\///g')

rootDir=$(basename $3 .txt)
jsonDir=json-$dt
graphsDir=graphs-$dt
logDir=log-$dt

mkdir $rootDir
mkdir $rootDir/$jsonDir
mkdir $rootDir/$graphsDir
mkdir $rootDir/$logDir

source env/bin/activate

git clone $1
git -C $repositoryFolder pull

# Extract commits
ssl-metrics-git-commits-loc-extract -d $repositoryFolder -b HEAD -o $rootDir/$jsonDir/commits_$repositoryFolder-$dt.json --log $rootDir/$logDir/commits_$repositoryFolder-$dt.log

# Extract issues
ssl-metrics-github-issues-collect -p -r $githubShortCode -o $rootDir/$jsonDir/issues_$repositoryFolder-$dt.json -t $token --log $rootDir/$logDir/issues_$repositoryFolder-$dt.log

# Compute bus factor
ssl-metrics-git-bus-factor-compute -i $rootDir/$jsonDir/commits_$repositoryFolder-$dt.json -o $rootDir/$jsonDir/bf_$repositoryFolder-$dt.json

# Graph bus factor
ssl-metrics-git-bus-factor-graph -i $rootDir/$jsonDir/bf_$repositoryFolder-$dt.json -o $rootDir/$graphsDir/bf_$repositoryFolder-$dt.pdf --type bar --title $githubShortCode" Bus Factor" --x-label "Day" --y-label "Bus Factor" --stylesheet style.mplstyle

# Compute issue density
ssl-metrics-github-issue-density-compute -c $rootDir/$jsonDir/commits_$repositoryFolder-$dt.json -i $rootDir/$jsonDir/issues_$repositoryFolder-$dt.json -o $rootDir/$jsonDir/id_$repositoryFolder-$dt.json

# Graph issue density
ssl-metrics-github-issue-density-graph -i $rootDir/$jsonDir/id_$repositoryFolder-$dt.json -o $rootDir/$graphsDir/id_$repositoryFolder-$dt.pdf --title $githubShortCode" Issue Density" --x-label "Day" --y-label "Issue Density" --stylesheet style.mplstyle

# Compute productivity
ssl-metrics-git-productivity-compute -i $rootDir/$jsonDir/commits_$repositoryFolder-$dt.json -o $rootDir/$jsonDir/p_$repositoryFolder-$dt.json

# Graph productivity
ssl-metrics-git-productivity-graph -i $rootDir/$jsonDir/p_$repositoryFolder-$dt.json -o $rootDir/$graphsDir/p_$repositoryFolder-$dt.pdf --title $githubShortCode" Productivity" --x-label "Day" --y-label "Productivity" --stylesheet style.mplstyle

# Compute issue spoilage
ssl-metrics-github-issue-spoilage-compute -i $rootDir/$jsonDir/issues_$repositoryFolder-$dt.json -o $rootDir/$jsonDir/is_$repositoryFolder-$dt.json

# Graph issue spoilage
ssl-metrics-github-issue-spoilage-graph -i $rootDir/$jsonDir/is_$repositoryFolder-$dt.json -o $rootDir/$graphsDir/is_$repositoryFolder-$dt.pdf --title $githubShortCode" Issue Spoilage" --x-label "Day" --y-label "Issue Spoilage" --stylesheet style.mplstyle

# Sync outputs to GDrive
rclone copy $rootDir/$jsonDir gdrive:"Software and Systems Laboratory"/"Paper Writing"/"figures"/$dt/$rootDir/$jsonDir
rclone copy $rootDir/$graphsDir gdrive:"Software and Systems Laboratory"/"Paper Writing"/"figures"/$dt/$rootDir/$graphsDir
rclone copy $rootDir/$graphsDir gdrive:"Software and Systems Laboratory"/"Paper Writing"/"figures"/$dt/$rootDir/$logDir
