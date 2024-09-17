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

if [[ $env == "prod" ]]; then
  tsx ./drizzle/migrate.ts
else
  tsx --env-file .env ./drizzle/migrate.ts
fi
