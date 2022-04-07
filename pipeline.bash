#!/bin/bash

# This is the executable to run an analysis on multiple repositories at once

token=$2
command="./runner.bash $1 $token"
echo $command
tmux new-session $command
