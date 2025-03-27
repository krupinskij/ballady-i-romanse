#!/bin/bash

if [[ $1 == "prod" ]]; then
  wrangler d1 migrations apply $2-ballady_i_romanse-prod --remote
elif [[ $1 == "preview" ]]; then
  wrangler d1 migrations apply $2-ballady_i_romanse-dev --remote
else
  wrangler d1 migrations apply $2-ballady_i_romanse-dev
fi