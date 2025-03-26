#!/bin/bash

if [[ $CF_PAGES_BRANCH == "master" || $CF_PAGES_BRANCH == "develop" ]]; then
  bash ./scripts/db.push.sh pl &&
  bash ./scripts/db.push.sh ru &&
  astro check && 
  astro build
else
  astro check && 
  astro build
fi
