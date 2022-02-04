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
    - [Default Usage](#default-usage)
    - [Custom URL](#custom-url)
    - [Iterating Over A List of URLS](#iterating-over-a-list-of-urls)
      - [Parallel Execution](#parallel-execution)

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

#### Optional Shell Software

For reasons why you might want to install this software, see the [Parallel Execution](#parallel-execution) section.

- `parallel`

### Python Software

All listed Python software assumes that you have downloaded and installed **Python 3.9.6** or greater.

- `ssl-metrics-meta`

You can install the Python software with this one-liner:

`pip install --upgrade pip ssl-metrics-meta`

## How To Use

### Default Usage

The default usage analyzes the [golang/go](https://github.com/golang/go) project.

`./ssl-metrics-pipeline.bash`

### Custom URL

By specifying the `-u` flag, you can point the pipeline at a GitHub project URL.

`./ssl-metrics-pipeline.bash -u https://github.com/numpy/numpy`

### Iterating Over A List of URLS

If you have a list of URLS, you can pipe it into the progam with the following (or similar) syntax:

`cat URLs.txt | xargs -l ./ssl-metrics-pipeline.bash -u`

**NOTE**: Replace `URLs.txt` with a `.txt` file with every line containing **1 (one)** GitHub URL.

#### Parallel Execution

If you have `parallel` installed, you can use the following (or similar) syntax to process mutliple repositories at once.

`cat URLs.txt | parallel -j 2 ./ssl-metrics-pipeline.bash -u`

**NOTE**: Replace `4` with a *n* number of jobs you want to execute in parallel.
