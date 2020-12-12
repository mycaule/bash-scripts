#!/bin/bash

# Checks for folder changes (useful for continuous integration)

# latest commit
LATEST_COMMIT=$(git rev-parse HEAD)

FOLDER1_COMMIT=$(git log -1 --format=format:%H --full-diff data-analysis)
FOLDER2_COMMIT=$(git log -1 --format=format:%H --full-diff documentation)
FOLDER3_COMMIT=$(git log -1 --format=format:%H --full-diff monitoring)

if [ "$FOLDER1_COMMIT" = "$LATEST_COMMIT" ];
    then
        echo "files in folder1 have changed"
elif [ "$FOLDER2_COMMIT" = "$LATEST_COMMIT" ];
    then
        echo "files in folder2 have changed"
elif [ "$FOLDER3_COMMIT" = "$LATEST_COMMIT" ];
    then
        echo "files in folder3 have changed"
else
     echo "no changes detected"
     exit 0;
fi
