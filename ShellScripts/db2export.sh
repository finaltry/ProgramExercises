#!/bin/sh

DB2_DSN=$1
DB2_SCH=$2
DB2_USR=$3
DB2_PWD=$4
TBL_FIL=${DB2_SCH}_tables.txt
IMP_CMD=${DB2_SCH}_import.cmd

## Connect to DB2 and export tables for schema
db2 "connect to $DB2_DSN user $DB2_USR using $DB2_PWD"
db2 "list tables for schema $DB2_SCH" > $TBL_FILE
echo "db2 \"connect to ${DB2_DSN} user ${DB2_USR} using ${DB2_PWD}\"" > $IMP_CMD

table_names=`cat $TBL_FIL | awk '{print $1}' | grep -e '^[a-zA-Z]' | grep -v 'Table/View'`
for t in $table_names
do
    tn="${DB2_SCH}.${t}"
    fn="${DB2_SCH}_${t}"
    db2 "export to ${fn}.ixf of ixf messages ${fn}.log select * from ${tn} where 1 < 0"
    echo "db2 \"import from ${fn}.ixf of ixf messages ${fn}.log create into ${tn}\"" >> $IMP_CMD
    db2 "export to ${fn}.dmp of del messages ${fn}.log select * from ${tn}"
    echo "db2 \"import from ${fn}.dmp of del messages ${fn}.log commitcount 100 insert into ${tn}\"" >> $IMP_CMD
done

db2 terminate

