#!/bin/bash

# This is the executable to run an analysis on multiple repositories at once

cat githubRepositories.txt | parallel
