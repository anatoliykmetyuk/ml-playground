#!/usr/bin/env bash

for f in docker-base/*.dockerfile; do
  # See https://stackoverflow.com/a/965072/3895471
  filename=$(basename -- "$f")
  filename_no_id=${filename:3}
  tag="${filename_no_id%.*}"
  echo "Building file $filename and tagging it with $tag"
  docker build -t $tag -f $f .
done
