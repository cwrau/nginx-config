#!/bin/sh

UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @{0})
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @{0} "$UPSTREAM")

if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
    exit 1
elif [ $LOCAL = $BASE ]; then
    echo "Need to pull"
    exit 0
elif [ $REMOTE = $BASE ]; then
    echo "Need to push"
    exit 1
else
    echo "Diverged"
    exit 1
fi

# https://stackoverflow.com/a/3278427
