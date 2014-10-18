#!/bin/sh

DB2_DSN=$1
DB2_SCH=$2
DB2_USR=$3
DB2_PWD=$4
TBL_FIL=${DB2_SCH}_tables.txt

## Connect to DB2 and export tables for schema
db2 "connect to $DB2_DSN user $DB2_USR using $DB2_PWD"

for t in `cat $TBL_FIL`
do
    tn="${DB2_SCH}.${t}"
    fn="${DB2_SCH}_${t}"
    db2 "import from ${fn}.ixf of ixf messages ${fn}.log create into ${tn}"
    db2 "import from ${fn}.dmp of del messages ${fn}.log commitcount 100 insert into ${tn}"
done

db2 terminate

