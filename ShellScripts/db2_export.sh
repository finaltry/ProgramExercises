#!/usr/bin/bash   
 # filenames: db2_export.sh   
 # usages: ./db2_export.sh <dbname> <schema_name>   
 # created: 2007/4/27 A-lang(alang[dot]hsu[at]gmail[dot]com)   
    
 # Preload the profile, on AIX using .profile or on Linux using .bashrc   
 . $HOME/.profile   
    
 tab_list="tables.lst";   
 logf="db2_export.log";   
    
 if [ $# -ne 2 ] ; then   
 echo "usage: $0 <dbname> <schema_name>"  
 exit 1   
 fi   
    
 db2 connect to $1 > $logf;   
 if [ $? -ne 0 ]; then   
 echo "warning!! It is not successful in connecting to $1";   
 exit 1   
 fi   
 db2 terminate >> $logf;   
    
 db2 connect to $1 >> $logf;   
 tab_name=$(db2 "list tables for schema $2");   
    
 tab_name=$(echo "$tab_name" | sed  "1,3d" | grep -v "record(s) selected." | awk '{print $2".",$1".",$3}' | sed "s/ *//g" | sed -n "/.T$/p" | awk -F "." '{print $1".",$2}' | sed "s/ *//g");   
    
 if [ -f $tab_list ]; then   
 rm -f $tab_list;   
 fi   
    
 if [ -z "$tab_name" ]; then   
 echo "warning!! No tables be found at schema $2";   
 db2 terminate > /dev/null;   
 exit 1   
 fi   
    
 for table in $(echo "$tab_name"); do  
 echo $table >> $tab_list;   
 db2 "export to $table.ixf of ixf select * from $table" >> $logf;   
 done   
    
 db2 terminate >> $logf;   
 echo "---------- EOF -----------" >> $logf;   
 echo "Process was done."  
 echo   
 echo "All Tables list is on file [$tab_list]."  
 echo "Log message is on file [$logf]."  

