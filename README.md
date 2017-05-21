# apache2sqlite
Convert default apache logs to sqlite and vice versa
Given an apache log file, the example script log_rollup.sh produces output such as :
```
1     ----- Bots ---------  success  error 
2     Googlebot             1402     2     
3     bingbot               63       0     
4     Yandex                22277    19    
5     Baiduspider           2        192   
6     Yahoo!                234      0     
7     DuckDuckGo            2        0     
8     Seznambot             198      0     
9     MegaIndex             3202     0     
90                   TOTAL  27380    213   
99    ----- Other Pages --  -------  ------
100   Demo Pages            18       0     
101   Resource Pages        0        0     
102   Help Pages            6        0     
103   Product Search        8        0     
104   Indoor Air            5150     0     
105   /                     126      17    
199   ----- Analytics ----  -------  ----- 
200   Piwik                 99       1     
999   ----- Totals -------  -------  ----- 
1000  Remaining Traffic     427      43    

country               count
--------------------  -----
                      5    
Australia             2    
Brazil                1    
Canada                28   
China                 20   
Colombia              1    
Europe                3    
France                6    
Germany               3    
Hong Kong             1    
India                 1    
Ireland               5    
Italy                 2    
Japan                 5    
Netherlands           3    
New Zealand           1    
Romania               1    
Russian Federation    28   
Singapore             5    
Ukraine               165  
United Kingdom        7    
United States         177  
```
The python script apache2sqlite.py converts a given apache log file into a sqlite database.

The python script sqlite2apache.py converts a given log database table to an apache log file.

The database create tables are in [asql](https://steve.fi/Software/asql/) format, plus columns for additional information.
