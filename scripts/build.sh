#!/bin/bash

while getopts ":e:" opt; do
  case $opt in
    e) env="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    exit 1
    ;;
  esac
done

if [[ $CF_PAGES_BRANCH == "master" ]]; then
  bash ./scripts/db.push.sh pl &&
  bash ./scripts/db.push.sh ru &&
  astro check && 
  astro build
else
  astro check && 
  astro build
fi
