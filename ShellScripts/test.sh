#!/bin/sh

str=ABC
out=`echo "123 '${str}'"`

#echo $out

data="2011-11-01 00:00:00"
#data=""
if [ "X`echo $data | grep -E \"[^ ]\"`" = "X" ]; then
    data="`date +'%Y-%m-%d'` 00:00:00"
fi
echo $data

echo -n "hello..."
echo -e "hello...\c"
echo "hello, `date`"
echo "hello, $(date)"

