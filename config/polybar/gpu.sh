#!/usr/bin/env bash

nvidia-smi --query-gpu=utilization.gpu,temperature.gpu \
           --format=csv,noheader,nounits \
  | awk -F',' '{printf "%s%%", $1}'

