#!/bin/bash

if [[ $CF_PAGES_BRANCH == "master" ]]; then
  wrangler d1 migrations apply $1-ballady_i_romanse-prod --remote
elif [[ $CF_PAGES_BRANCH == "develop" ]]; then
  wrangler d1 migrations apply $1-ballady_i_romanse-dev --remote
else
  wrangler d1 migrations apply $1-ballady_i_romanse-dev
fi