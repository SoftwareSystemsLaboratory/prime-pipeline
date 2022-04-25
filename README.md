# CLIME Pipeline

[![DOI](https://zenodo.org/badge/455386614.svg)](https://zenodo.org/badge/latestdoi/455386614)
[![Release Project](https://github.com/SoftwareSystemsLaboratory/clime-pipeline/actions/workflows/release.yml/badge.svg)](https://github.com/SoftwareSystemsLaboratory/clime-pipeline/actions/workflows/release.yml)

> An example pipeline that computes metrics of a repository

## Table of Contents

- [CLIME Pipeline](#clime-pipeline)
  - [Table of Contents](#table-of-contents)
  - [About](#about)
    - [Licensing](#licensing)
  - [Tooling](#tooling)
    - [Operating System](#operating-system)
    - [Shell Software](#shell-software)
      - [Required Shell Software](#required-shell-software)
    - [Python Software](#python-software)
  - [How To Use](#how-to-use)
    - [Setting up the Pipeline](#setting-up-the-pipeline)
    - [Executing the Pipeline](#executing-the-pipeline)
    - [Google Drive Upload](#google-drive-upload)

## About

The Software Systems Laboratory (SSL) CLIME Pipeline Project is an example pipeline that computes metrics of a repository.

The pipeline *only* calculates metrics for the `HEAD` branch of a repository.

### Licensing

This project is licensed under the BSD-3-Clause. See the [LICENSE](LICENSE) for more information.

## Tooling

To maximize the utility of this project the following software packages are **required**:

### Operating System

All tools developed for the greater SSL Metrics project **target** Mac OS and Linux. SSL Metrics software is not supported or recommended to run on Windows *but can be modified to do so at your own risk*.

It is recomendded to run on Mac OS or Linux. However, if you are on a Windows machine, you can use WSL to run this software as well.

### Shell Software

#### Required Shell Software

- `git`
- `parallel`
- `wget`
- `rclone`
- `tmux`
- `python3.10`

### Python Software

All listed Python software assumes that you have downloaded and installed **Python 3.10** or greater.

- `clime-metrics`

You can install the Python software with this one-liner:

`pip install --upgrade pip clime-metrics` or `./setup.bash`

## How To Use

### Setting up the Pipeline

Run the following one liner to setup the pipeline:

- `wget -qO- https://raw.githubusercontent.com/SoftwareSystemsLaboratory/clime-pipeline/main/setup.bash | bash`

### Executing the Pipeline

`pipeline.bash` contains the code to start the pipeline.
It takes a GitHub Personal Access Token and a file containing a list of Github Repository URLs as positional arguements.

For an example GitHub Repository URL file, see [githubRepositories.txt](githubRepositories.txt).

- `./pipeline.bash $GH_TOKEN githubRepositories.txt`

Where `$GH_TOKEN` is a GitHub Personal Access Token or shell variable referencing it.

`githubRepositories.txt` can be replaced with any file containing GitHub Repository URLs.

**NOTE:** The name of this text file will be used to create a folder containing all of the repositories analyzed and their analysis files.

### Google Drive Upload

This pipeline is configured to upload results to a Google Drive folder via `rclone`.
If you don't want to do this, comment out or change the last lines in the `runner.bash` file.
