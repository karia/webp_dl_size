#!/usr/bin/env bash

set -eu

OPTION_NORMAL=""
OPTION_WEBP="-H Accept:image/webp"

echo "<html><head></head><body>" >> result.html

i=1
while read URL
do
  curl -sS -o ${i}.png ${OPTION_NORMAL} ${URL}
  curl -sS -o ${i}.webp ${OPTION_WEBP} ${URL}
  i=`expr ${i} + 1`
  echo "<img src=${i}.png width=120 height=120 /><img src=${i}.webp width=120 height=120 /><br />" >> result.html
done < url.txt

echo "</body></html>" >> result.html

