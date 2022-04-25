#!/bin/bash
# Sync outputs to GDrive
rclone copy $rootDir gdrive:"Software and Systems Laboratory"/"Paper Writing"/"figures"/$dt/$rootDir
