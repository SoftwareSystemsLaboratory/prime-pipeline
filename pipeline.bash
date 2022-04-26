#!/bin/bash
# This is the executable to run an analysis on multiple repositories at once
token=$1
repositoryListFile=$2

rootDir=$(basename $2 .txt)
mkdir $rootDir
mkdir $rootDir/$jsonDir
mkdir $rootDir/$pdfDir
mkdir $rootDir/$logDir

cat $repositoryListFile | parallel tmux new-session -d "./runner.bash {} $token $repositoryListFile"
