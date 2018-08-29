#!/bin/bash

# Removes secrets from a git repository

if [ -d ".git" ];then
    rm -rf ./.git/
    find . -type f -iname '.travis.yml*' -delete
    find . -type f -iname '*.conf' -delete
    find . -type f -iname '*.yml' -delete
    rm -f README.md
    rm -rf ./ci
    rm -f LICENSE
else
    echo -e "[33m[error]\e[39m Not in a git repository"
    exit 1
fi
