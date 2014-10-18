#!/bin/sh

. `cat /.dshome`/dsenv

$DSHOME/bin/dsjob -run -mode RESET $PROJECT $JOBNAME > /dev/null 2>&1
$DSHOME/bin/dsjob -run -mode NORMAL -warn 0 -jobstatus $PROJECT $JOBNAME > /dev/null 2>&1

exit $?

#echo $*

