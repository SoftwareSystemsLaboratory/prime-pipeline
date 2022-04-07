# Software Systems Laboratory Metrics Pipeline

> A `bash` script to calculate the metrics of a remote GitHub repository

![[https://img.shields.io/badge/shell-bash-blue](https://img.shields.io/badge/shell-bash-blue)](https://img.shields.io/badge/shell-bash-blue)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5967365.svg)](https://doi.org/10.5281/zenodo.5967365)
[![Release Project](https://github.com/SoftwareSystemsLaboratory/ssl-metrics-pipeline/actions/workflows/release.yml/badge.svg)](https://github.com/SoftwareSystemsLaboratory/ssl-metrics-pipeline/actions/workflows/release.yml)
![[https://img.shields.io/badge/license-BSD--3-yellow](https://img.shields.io/badge/license-BSD--3-yellow)](https://img.shields.io/badge/license-BSD--3-yellow)

## Table of Contents

- [Software Systems Laboratory Metrics Pipeline](#software-systems-laboratory-metrics-pipeline)
  - [Table of Contents](#table-of-contents)
  - [About](#about)
  - [Tooling](#tooling)
    - [Operating System](#operating-system)
    - [Shell Software](#shell-software)
      - [Required Shell Software](#required-shell-software)
    - [Python Software](#python-software)
  - [How To Use](#how-to-use)
    - [Setting up the Pipeline](#setting-up-the-pipeline)
    - [Executing the Pipeline](#executing-the-pipeline)

## About

The Software Systems Laboratory (SSL) Pipeline Project is a `bash` script that can be executed within a *configured* environment to calculate metrics for a (or multiple) **remote** repositories hosted on GitHub.

The pipeline *only* calculates metrics for the `HEAD` branch of a repository.

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

### Python Software

All listed Python software assumes that you have downloaded and installed **Python 3.10** or greater.

- `ssl-metrics-meta`

You can install the Python software with this one-liner:

`pip install --upgrade pip ssl-metrics-meta` or `./setup.bash`

## How To Use

### Setting up the Pipeline

Run the following one liner to setup the pipeline:

- `wget -qO- https://raw.githubusercontent.com/NicholasSynovic/3-ssl-metrics-pipeline/main/setup.bash | bash`

### Executing the Pipeline

`pipeline.bash` contains the code to start the pipeline.
It takes a GitHub Personal Access Token and a file containing a list of Github Repository URLs as positional arguements.

For an example GitHub Repository URL file, see [githubRepositories.txt](githubRepositories.txt).

- `./pipeline.bash $GH_TOKEN`

Where $GH_TOKEN is a GitHub Personal Access Token or shell variable referencing it.
