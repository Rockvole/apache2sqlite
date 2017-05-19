.mode column
.width 20 5
.headers on
select country, count(*) as count from logs group by country;
