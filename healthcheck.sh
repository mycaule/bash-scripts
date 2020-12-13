#!/bin/bash

set -o errexit
set -o nounset
# set -o xtrace
set -o pipefail

debug=false

function notify {
  level=$1
  title=$2
  message=$3

  if $debug; then
    echo "[$level] $title - $message"
  else
    WEBHOOK="https://hooks.slack.com/services/ABC/DEF/GHI"

    # operational, under_maintenance, degraded_performance, partial_outage, major_outage
    if [ "$level" -eq 0 ]; then
      fallback="Operational"
      color="good"
    elif [ "$level" -eq 1 ]; then
      fallback="Under Maintenance"
      color="warning"
    elif [ "$level" -eq 2 ]; then
      fallback="Degraded Performance"
      color="warning"
    elif [ "$level" -eq 3 ]; then
      fallback="Partial Outage"
      color="warning"
    elif [ "$level" -eq 4 ]; then
      fallback="Major Outage"
      color="danger"
    else
      fallback="Information"
      color="#439FE0"
    fi

    escapedText=$(echo "$message" | sed 's/"/\"/g' | sed "s/'/\\'/g")
    json="{\"text\": \"$title\", \"attachments\": [ {\"fallback\": \"$fallback\", \"color\": \"$color\", \"title\": \"$fallback\", \"text\": \"$escapedText\"}] }"
    curl -s -d "payload=$json" "$WEBHOOK"
  fi
}

function check_website {
  STATUS=$(curl -sI "$1" | head -n1)
  echo "$STATUS"
}

H=$(date +"%-H")

(( 9 <= H && H < 12 )) && check_website https://google.fr
