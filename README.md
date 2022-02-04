# Software Systems Laboratory Metrics Pipeline

> A bash script to calculate the metrics of a remote repository

![[https://img.shields.io/badge/shell-bash-blue](https://img.shields.io/badge/shell-bash-blue)](https://img.shields.io/badge/shell-bash-blue)
![[https://img.shields.io/badge/DOI-Example-red](https://img.shields.io/badge/DOI-Example-red)](https://img.shields.io/badge/DOI-Example-red)
![[https://img.shields.io/badge/license-BSD--3-yellow](https://img.shields.io/badge/license-BSD--3-yellow)](https://img.shields.io/badge/license-BSD--3-yellow)

## Table of Contents

- [Software Systems Laboratory Metrics Pipeline](#software-systems-laboratory-metrics-pipeline)
  - [Table of Contents](#table-of-contents)
  - [About](#about)
  - [Tooling](#tooling)
    - [Operating System](#operating-system)
    - [Shell Software](#shell-software)
    - [Python Software](#python-software)
  - [How To Use](#how-to-use)
  - [Changes To Make To Your Project](#changes-to-make-to-your-project)

## About

The Software Systems Laboratory (SSL) Pipeline Project is a `bash` script that can be executed within a *configured* environment to calculate metrics for a (or multiple) **remote** repositories hosted on GitHub.

This project is licensed under the BSD-3-Clause. See the [LICENSE](LICENSE) for more information.

## Tooling

To maximize the utility of this project and the greater SSL Metrics project, the following software packages are **required**:

### Operating System

All tools developed for the greater SSL Metrics project **must target** Mac OS and Linux. SSL Metrics software is not supported or recommended to run on Windows *but can be modified to do so at your own risk*.

It is recomendded to develop on Mac OS or Linux. However, if you are on a Windows machine, you can use WSL to develop as well.

### Shell Software

- `git`
- `jq`
- `wc`

### Python Software

> The software listed in this section is meant for developing tools

All listed Python software assumes that you have downloaded and installed **Python 3.9.6** or greater.

- `black`
- `build`
- `isort`
- `pylint`

You can install all of the Python software with this one-liner:

`pip install --upgrade black build isort pip pylint`

## How To Use

It is recomended to create a new repository with GitHub referencing this template and then cloning the new repository.

## Changes To Make To Your Project

1. Change the name of the package folder from `ssl_metrics_MODULE_NAME` to your packages name
2. Fix all `TODOs`
