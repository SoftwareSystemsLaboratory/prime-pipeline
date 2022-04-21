#!/bin/bash
# Setup a folder to run the pipeline
dt=$(date -d "today" +"%Y_%m_%d_%H_%M")
jobsDir=jobs-$dt

git clone https://github.com/SoftwareSystemsLaboratory/clime-pipeline $jobsDir

cd $jobsDir

python3.10 -m venv env
source env/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

echo ---
echo "New folder created at: "$jobsDir
