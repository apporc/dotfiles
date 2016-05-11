#!/bin/bash

PROJECT=$1


create_directory_tree () {
  mkdir -p $PROJECT/$PROJECT/tests
  touch $PROJECT/$PROJECT/__init__.py
  touch $PROJECT/$PROJECT/options.py
  touch $PROJECT/$PROJECT/tests/__init__.py
  touch $PROJECT/requirements.txt
  touch $PROJECT/test-requirements.txt
  touch $PROJECT/README.md
}

prepare_setuptools () {
  cat >> $PROJECT/setup.py << EOF
from setuptools import setup

setup(
    setup_requires=['pbr>=1.9', 'setuptools>=17.1'],
    pbr=True,
    test_suite='$PROJECT.tests',
)
EOF

  cat >> $PROJECT/setup.cfg << EOF
[metadata]
name = $PROJECT
summary = $PROJECT library
author = 
author_email = 
classifiers =
    Environment :: Console
    Intended Audience :: Information Technology
    Intended Audience :: System Administrators
    Operating System :: POSIX :: Linux
    Programming Language :: Python
    Programming Language :: Python :: 2
    Programming Language :: Python :: 2.6
    Programming Language :: Python :: 2.7

[global]
setup-hooks =
    pbr.hooks.setup_hook

[files]
packages =
    $PROJECT

[entry_points]
oslo.config.opts =
    $PROJECT  =  $PROJECT.options:list_opts
EOF
}

prepare_tox () {
  cat >> $PROJECT/tox.ini << EOF
# Tox (http://tox.testrun.org/) is a tool for running tests
# in multiple virtualenvs. This configuration file will run the
# test suite on all supported python versions. To use it, "pip install tox"
# and then run "tox" from this directory.

[tox]
skipsdist = True
envlist = py27, pep8

[testenv]
usedevelop = True
whitelist_externals =
    find
    flake8
deps =
    -r{toxinidir}/requirements.txt
    -r{toxinidir}/test-requirements.txt
commands =
    find . -type f -name "*.pyc" -delete
    python setup.py test

[testenv:pep8]
usedevelop = False
deps =
commands =
    flake8 $PROJECT
EOF
}

main () {
  create_directory_tree
  prepare_setuptools
  prepare_tox
}

main
