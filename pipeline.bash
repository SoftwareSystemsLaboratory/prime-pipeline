#!/bin/bash

# This is the executable to run an analysis on multiple repositories at once

token=$1

cat githubRepositories.txt | parallel tmux new-session -d "./runner.bash {} $token"
