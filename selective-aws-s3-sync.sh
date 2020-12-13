#!/bin/bash

SOURCE_BUCKET="s3://bucket-one/path/to"
DEST_BUCKET="s3://bucket-two/path/to"

aws s3 sync $SOURCE_BUCKET $DEST_BUCKET --exclude "*" --include "*[0-9].jpg"
