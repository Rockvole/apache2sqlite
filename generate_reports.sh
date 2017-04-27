#! /bin/bash
tmp_dir=/work/tmp/traffic
db_loc=$tmp_dir/access.db

/usr/local/bin/goaccess $tmp_dir/bots.log --log-format COMBINED -o $tmp_dir/bots.html
firefox $tmp_dir/bots.html &

/usr/local/bin/goaccess $tmp_dir/traffic.log --log-format COMBINED -o $tmp_dir/traffic.html
firefox $tmp_dir/traffic.html &
