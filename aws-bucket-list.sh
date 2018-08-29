#!/bin/bash

# List only files from S3 ls
aws s3 ls --recursive $1 | cut -c32-
