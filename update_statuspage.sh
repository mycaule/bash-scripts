#!/bin/bash

api_key="..."
page_id="..."
api_base="api.statuspage.io"

function send_fake_metric {
  metric_id=$1
  for i in $(seq 1 288)
  do
    ts=$(($(date +%s)-i*300))
    value=$(((RANDOM%99)+0))
    http -h POST "https://$api_base/v1/pages/$page_id/metrics/$metric_id/data.json" data:="{\"timestamp\": $ts, \"value\": $value }" Authorization:"OAuth $api_key"

    echo "$i/288"
    sleep 1
  done
}

## Update a component
## List components
function list_components {
  http "https://$api_base/v1/pages/$page_id/components" Authorization:"OAuth $api_key"
}

function set_status {
  status=$1
  # operational, under_maintenance, degraded_performance, partial_outage, major_outage
  component_id=$2
  http PATCH "https://$api_base/v1/pages/$page_id/components/$component_id" component:="{\"status\": \"$status\"}" Authorization:"OAuth $api_key"
}

# list_components

set_status "degraded_performance" "..."
set_status "operational" "..."

send_fake_metric "..."
send_fake_metric "..."
