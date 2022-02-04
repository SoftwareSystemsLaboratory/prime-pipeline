# Software Systems Laboratory Metrics Pipeline

> A `bash` script to calculate the metrics of a remote GitHub repository

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
      - [Required Shell Software](#required-shell-software)
      - [Optional Shell Software](#optional-shell-software)
    - [Python Software](#python-software)
  - [How To Use](#how-to-use)

## About

The Software Systems Laboratory (SSL) Pipeline Project is a `bash` script that can be executed within a *configured* environment to calculate metrics for a (or multiple) **remote** repositories hosted on GitHub.

This project is licensed under the BSD-3-Clause. See the [LICENSE](LICENSE) for more information.

## Tooling

To maximize the utility of this project the following software packages are **required**:

### Operating System

All tools developed for the greater SSL Metrics project **must target** Mac OS and Linux. SSL Metrics software is not supported or recommended to run on Windows *but can be modified to do so at your own risk*.

It is recomendded to develop on Mac OS or Linux. However, if you are on a Windows machine, you can use WSL to develop as well.

### Shell Software

#### Required Shell Software

- `git`

#### Optional Shell Software

For reasons why you might want to install this software, see the [Parallel Execution](#parallel-execution) section.

- `jq`
- `parallel`

### Python Software

All listed Python software assumes that you have downloaded and installed **Python 3.9.6** or greater.

- `ssl-metrics-meta`

You can install the Python software with this one-liner:

`pip install --upgrade pip ssl-metrics-meta`

## How To Use
