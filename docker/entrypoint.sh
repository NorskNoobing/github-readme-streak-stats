#!/bin/sh
if [ -n "$GITHUB_TOKEN" ] || grep -q "TOKEN=" "$GITHUB_README_STREAK_STATS_PATH/.env"; then
  echo "TOKEN=$GITHUB_TOKEN" > $GITHUB_README_STREAK_STATS_PATH/.env
else
  echo "Error: GITHUB_TOKEN is not set or is empty. Please provide a value for the ENV variable GITHUB_TOKEN or create a valid .env file."
  exit 1
fi

composer start