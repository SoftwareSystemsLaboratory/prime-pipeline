#!/bin/bash
# Sync outputs to GDrive
rclone copy $1 gdrive:"Software and Systems Laboratory"/"Paper Writing"/"figures"/$dt/$1
