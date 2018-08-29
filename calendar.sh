#!/bin/bash

# Prints a calendar of the current week
# https://unix.stackexchange.com/questions/343096/

for (( i = 0; i < 8; ++i )); do
  printf '%s\t' "$( date -d "now +$i days" +"%a" )"
done

echo

for (( i = 0; i < 8; ++i )); do
  printf ' %d\t' "$( date -d "now +$i days" +"%e" )"
done

echo
