# The most amazing Makefile

[![GitHub Release Date](https://img.shields.io/github/release-date/t3n0/MostAmazingMakefile)](https://github.com/t3n0/MostAmazingMakefile/releases/latest)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/t3n0/MostAmazingMakefile)](https://github.com/t3n0/MostAmazingMakefile/releases/latest)
[![GitHub all releases](https://img.shields.io/github/downloads/t3n0/MostAmazingMakefile/total)](https://github.com/t3n0/MostAmazingMakefile/releases/latest)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

THE definitive makefile for simple `c++` projects, without scassamento di maroni!

## Description
This simple makefile compiles all your `c++` projects automatically.
It looks recursively into the folder tree for headers and sources.
It constructs the dependency rules, compiles them and links the main code in the base directory.

## Usage
Basis usage:
1. Place the [Makefile](Makefile) in the same folder as the `main.cpp` file.
2. Edit the location of the dependency files (default is `SRC_DIRS = .`)
3. Edit executable name, compiler flags and the like (optional)
4. Run `make all`

Other commands:
- `make` shows a default help message;
- `make ar` links all sources into a static library (default is `lib.a`) and collects all headers into the `include` folder;
- `make clean` removes all object files, dependency files, archive and executable.

## Requirements
This project runs on `unix` systems.
It requires a version of the `g++` compiler supporting the `-MMD` flags and uses `gcc-ar` for generating the archive.
