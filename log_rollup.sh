#! /bin/bash
acc_log=$1
if [ -z "$1" ]
  then
    acc_log=access.log
fi
log_dir=/var/log/apache2
tmp_dir=/work/tmp/traffic
mkdir -p $tmp_dir

apache_loc=$log_dir/$acc_log
db_loc=$tmp_dir/access.db

./apache2sqlite.py $apache_loc $db_loc

sqlite3 $db_loc < log_rollup.sql

./sqlite2apache.py $db_loc bots $tmp_dir/bots.log

./sqlite2apache.py $db_loc logs $tmp_dir/traffic.log
