#!/bin/sh

BCNT=$1
IOFILE=testio.out
cnt=0

test -f testio.out && rm -f testio.out

date +'%Y-%m-%d %H:%M:%S'
while [ $BCNT -gt $cnt ];
do
    echo -n " " >> testio.out
    cnt=`expr $cnt + 1`
done
date +'%Y-%m-%d %H:%M:%S'

