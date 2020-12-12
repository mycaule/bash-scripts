#!/bin/bash

user=$1
# https://github.com/germanrcuriel/jira-cmd
jira jql "(reporter = $user OR assignee = $user OR watcher = $user) AND (worklogDate > startOfDay(-14) OR updatedDate > startOfDay(-14)) order by created DESC"

jira jql "(reporter = $user OR assignee = $user OR watcher = $user) AND worklogDate > startOfDay(-14) order by created DESC" \
  | grep -Eo "[A-Z]+-[0-9]+" \
  | while read -r task; do
      echo "Processing $task"
      jira worklog "$task"
    done
