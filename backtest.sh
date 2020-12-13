#!/bin/bash

folderPath=$1
endpoint='http://url/endpoint'

function predict() {
  file=$1
  report=$2
  hash=$(md5 -r "$file" | awk '{print $1}')

  shortPath=${file#"$folderPath/"}
  echo "$shortPath"

  preds=$(curl -s --request POST $endpoint --form "image=@$file" \
    | jq -r 'sort_by(.className) | [.[].probability] | @csv' \
    | awk 'BEGIN{ FS=OFS="," }NR>1{ $3=sprintf("%.2f",$3) }1')

  echo "$shortPath,$hash,$preds" >> "$report"
}

report='reports/results.csv'

echo "== Available file types"
find "$folderPath" -type f | awk -F. '!a[$NF]++{print $NF}'

echo "== Running predictions on all files in $folderPath"

find "$folderPath" -maxdepth 6 -type f \( \
  -name '*.JPG' -o -name '*.jpg' -o -name '*.jpeg' \
\) \
  | head -600 \
  | while read -r path; do predict "$path" "$report"; done
