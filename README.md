# apache2sqlite
Convert default apache logs to sqlite and vice versa
Given an apache log file, the example script log_rollup.sh produces output such as :

```
1     Googlebot        2684   
2     bingbot          6      
3     Yandex           1960   
4     Baiduspider      162    
5     Yahoo!           151    
6     Demo Pages       27     
7     Resource Pages   21     
8     Help Pages       62     
9     /                54
```

The python script apache2sqlite.py converts a given apache log file into a sqlite database.

The python script sqlite2apache.py converts a given log database table to an apache log file.

The database create tables are in [asql](https://steve.fi/Software/asql/) format.
