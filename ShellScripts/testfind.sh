#!/bin/bash

target_dir=$1
#rm -rf $1/*
find $target_dir -name '*.txt' -exec ls -l {} \;
#for txt in `find $target_dir -name '*.txt'`
#do
#    ls -l $txt
#done


