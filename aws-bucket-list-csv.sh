#!/bin/bash

# Exports S3 ls to CSV file
# https://unix.stackexchange.com/questions/19014/

echo 'date,time,size,path'
aws s3 ls --recursive $1 | sed 's/ \{1,\}/,/g'
