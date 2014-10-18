#!/bin/bash   
 # filenames: db2_import.sh   
 # usages: ./db2_import.sh <dbname> <schema_name>   
 # created: 2007/4/27 A-lang(alang[dot]hsu[at]gmail[dot]com)   
    
 # Preload the profile, on AIX using .profile or on Linux using .bashrc   
 . $HOME/.bashrc   
    
 tab_list="tables.lst";   
 logf="db2_import.log";   
 commit="1000";   
    
 if [ $# -ne 2 ] ; then   
 echo "usage: $0 <dbname> <schema_name>"  
 exit 1   
 fi   
    
 db2 CONNECT TO $1 > $logf;   
 if [ $? -ne 0 ]; then   
 echo "warning!! It is not successful in connecting to $1";   
 exit 1   
 fi   
 db2 CONNECT RESET >> $logf;   
    
 if [ ! -f $tab_list ]; then   
 echo "warning!! The file [$tab_list] does not exist.";   
 exit 1   
 fi   
    
 db2 CONNECT TO $1 >> $logf;   
 for table in $(cat $tab_list); do  
 # With INSERT   
 #db2 IMPORT FROM $table.ixf OF IXF COMMITCOUNT $commit INSERT INTO $2.${table##*.} >> $logf;   
 # With REPLACE   
 db2 IMPORT FROM $table.ixf OF IXF COMMITCOUNT $commit REPLACE INTO $2.${table##*.} >> $logf;   
    
 db2 COMMIT WORK >> $logf;   
 db2 -v "runstats on table $2.${table##*.} with distribution and detailed indexes all shrlevel change" >> $logf;   
 done   
    
 db2 CONNECT RESET >> $logf;   
 db2 TERMINATE >> $logf;   
 echo "---------- EOF -----------" >> $logf;   
 echo "Process was done."  
 echo   
 echo "Log message is on file [$logf]."  

