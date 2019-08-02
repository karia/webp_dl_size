#!/usr/bin/env bash

set -eu

echo -e "jpg/png\twebp"

OPTION_NORMAL=" -sS -o /dev/null -w %{size_download}\t -H Accept-encoding:gzip,deflate,br"
OPTION_WEBP=" -sS -o /dev/null -w %{size_download}\n -H Accept:image/webp -H Accept-encoding:gzip,deflate,br"

while read URL
do
  curl ${OPTION_NORMAL} ${URL}
  curl ${OPTION_WEBP} ${URL}
done < url.txt
