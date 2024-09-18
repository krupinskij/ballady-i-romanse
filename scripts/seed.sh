#!/bin/bash

while getopts ":l:e:" opt; do
  case $opt in
    l) lang="$OPTARG"
    ;;
    e) env="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    exit 1
    ;;
  esac
done

if [[ $env == "prod" ]]; then
  tsx ./drizzle/seed.ts $lang
else
  tsx --env-file .env ./drizzle/seed.ts $lang
fi
