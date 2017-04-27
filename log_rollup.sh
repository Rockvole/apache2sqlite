#! /bin/bash
log_dir=/work/tmp
apache_loc=$log_dir/access.log
db_loc=$log_dir/out.db

./apache2sqlite.py $apache_loc $db_loc

sqlite3 $db_loc < log_rollup.sql

./sqlite2apache.py $db_loc bots $log_dir/bots.log
/usr/local/bin/goaccess $log_dir/bots.log --log-format COMBINED -o /work/tmp/bots.html
firefox $log_dir/bots.html &

./sqlite2apache.py $db_loc logs $log_dir/traffic.log
/usr/local/bin/goaccess $log_dir/traffic.log --log-format COMBINED -o /work/tmp/traffic.html
firefox $log_dir/traffic.html &
