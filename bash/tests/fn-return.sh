#!/usr/bin/env bash

gt_ten() {
  echo -n "$1 is greater than 10? "
  [[ $1 -gt 10 ]] && return 0 || return 1
}

bool() {
  [[ $1 -eq 0 ]] && echo true || echo false
}

gt_ten 7
echo $(bool $?)

gt_ten 11
echo $(bool $?)
