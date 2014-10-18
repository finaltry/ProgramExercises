#!/bin/sh

TAB_LIS=`cat table.lis`
TMU_SH="run_tmu.sh"
TRG_DB=XYZ

for t in $TAB_LIS
do
    ## Generate load control file
    sed s/@@/$t/ load.tmp > $t.tmu

    ## Generate TMU command into TMU script
    echo "rb_tmu -d $TRG_DB $t.tmu system manager" >> $TMU_SH
done

