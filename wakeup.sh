#!/bin/bash

function wolWallboard {
  # shellcheck disable=SC2001
  echo -e "$(echo "$(printf 'f%.0s' {1..12}; printf "$(echo "84:bb:bb:aa:dd:bb" \
  | sed 's/://g')%.0s" {1..16})" \
  | sed -e 's/../\\x&/g')" \
  | socat - UDP-DATAGRAM:255.255.255.255:4000,broadcast
}

wolWallboard
