#!/bin/sh

for line in `cat error.file`
do
  sed "4s/\[ERROR REASON\]/$line/g" template.txt
done
