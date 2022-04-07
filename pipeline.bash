#!/bin/bash
# This is the executable to run an analysis on multiple repositories at once
token=$1
repositoryListFile=$2

cat $repositoryListFile | parallel -j 5 tmux new-session -d "./runner.bash {} $token"
