#!/bin/bash

set -eu

COPY_TO=$PWD
COPY_FROM="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if [[ "$COPY_TO" == "$COPY_FROM" ]]; then
  echo "Cannot copy to self"
  exit 1
fi

shopt -s extglob

cd $COPY_FROM

rsync -r -v \
  --exclude .git \
  --exclude node_modules \
  --exclude \*.sh \
  --exclude .DS_Store \
  . $COPY_TO

echo "Done"
