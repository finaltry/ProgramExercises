#!/bin/sh

all_content=`cat $1`
#echo $all_content

for token in `cat $1`
do
    if [ `echo $token | grep "<" | grep ">" | wc -l` -eq 1 ]; then
        echo
        echo -n $token
    else
        echo -n ",$token"
    fi
done
echo

