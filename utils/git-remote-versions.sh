#!/usr/bin/env bash

echo "Finding latest tags available..."

sources=$(grep "source.*github.com/bitrockteam" ./*tf | sed -E "s@^.*github.com\/bitrockteam\/([^?/\"]+).*\$@\1@" | uniq)

while read source
do
  tag=$(git ls-remote --tags "git@github.com:bitrockteam/$source" | tail -n1 | awk '{ print $2;}' | tr -d '^{}')
  echo "$source = $tag"

done <<< "$sources"
