#! /bin/bash
acc_log=$1
if [ -z "$1" ]
  then
    acc_log=access.log
fi
this_dir=/work/projects/python/apache2sqlite
log_dir=/var/log/apache2
tmp_dir=/work/tmp/traffic
mkdir -p $tmp_dir

apache_loc=$log_dir/$acc_log
db_loc=$tmp_dir/access.db
sqlite3 $db_loc 'drop table if exists logs;'

$this_dir/apache2sqlite.py $apache_loc $db_loc

sqlite3 $db_loc < $this_dir/log_rollup.sql

$this_dir/sqlite2apache.py $db_loc bots $tmp_dir/bots.log

$this_dir/sqlite2apache.py $db_loc logs $tmp_dir/traffic.log
