DROP TABLE IF EXISTS bots;
DROP TABLE IF EXISTS analytics;
DROP TABLE IF EXISTS display;
CREATE TABLE IF NOT EXISTS bots AS SELECT * from logs where id=null;
CREATE TABLE IF NOT EXISTS analytics AS SELECT * from logs where id=null;
CREATE TABLE IF NOT EXISTS display (id INTEGER PRIMARY KEY, name, cnt, err);

insert or replace into display values(1, '----- Bots ---------', 'success', 'error');

insert into bots select * from logs where agent like '%Googlebot%';
delete from logs where agent like '%Googlebot%';
insert or replace into display select 2, 'Googlebot', sum(case when status < 400 then 1 else 0 end), sum(case when status >= 400 then 1 else 0 end) from bots where agent like '%Googlebot%';

insert into bots select * from logs where agent like '%bingbot%';
delete from logs where agent like '%bingbot%';
insert or replace into display select 3, 'bingbot', sum(case when status < 400 then 1 else 0 end), sum(case when status >= 400 then 1 else 0 end) from bots where agent like '%bingbot%';

insert into bots select * from logs where agent like '%Yandex%';
delete from logs where agent like '%Yandex%';
insert or replace into display select 4, 'Yandex', sum(case when status < 400 then 1 else 0 end), sum(case when status >= 400 then 1 else 0 end) from bots where agent like '%Yandex%';

insert into bots select * from logs where agent like '%Baiduspider%';
delete from logs where agent like '%Baiduspider%';
insert or replace into display select 5, 'Baiduspider', sum(case when status < 400 then 1 else 0 end), sum(case when status >= 400 then 1 else 0 end) from bots where agent like '%Baiduspider%';

insert into bots select * from logs where agent like '%Yahoo!%';
delete from logs where agent like '%Yahoo!%';
insert or replace into display select 6, 'Yahoo!', sum(case when status < 400 then 1 else 0 end), sum(case when status >= 400 then 1 else 0 end) from bots where agent like '%Yahoo!%';

insert into bots select * from logs where agent like '%DuckDuckGo%';
delete from logs where agent like '%DuckDuckGo%';
insert or replace into display select 7, 'DuckDuckGo', sum(case when status < 400 then 1 else 0 end), sum(case when status >= 400 then 1 else 0 end) from bots where agent like '%DuckDuckGo%';

insert into bots select * from logs where agent like '%Seznambot%';
delete from logs where agent like '%Seznambot%';
insert or replace into display select 8, 'Seznambot', sum(case when status < 400 then 1 else 0 end), sum(case when status >= 400 then 1 else 0 end) from bots where agent like '%Seznambot%';

insert into bots select * from logs where agent like '%MegaIndex%';
delete from logs where agent like '%MegaIndex%';
insert or replace into display select 9, 'MegaIndex', sum(case when status < 400 then 1 else 0 end), sum(case when status >= 400 then 1 else 0 end) from bots where agent like '%MegaIndex%';

insert or replace into display select 90, '               TOTAL', sum(case when status < 400 then 1 else 0 end), sum(case when status >= 400 then 1 else 0 end) from bots;

-- Non Bot pages

insert or replace into display values(99, '----- Other Pages --', '-------', '------');

insert or replace into display select 100, 'Demo Pages', sum(case when status < 400 then 1 else 0 end), sum(case when status >= 400 then 1 else 0 end) from logs where request like '/demo/%';

insert or replace into display select 101, 'Resource Pages', sum(case when status < 400 then 1 else 0 end), sum(case when status >= 400 then 1 else 0 end) from logs where request like '/resources/%';

insert or replace into display select 102, 'Help Pages', sum(case when status < 400 then 1 else 0 end), sum(case when status >= 400 then 1 else 0 end) from logs where request like '/help/%';

insert or replace into display select 103, 'Product Search', sum(case when status < 400 then 1 else 0 end), sum(case when status >= 400 then 1 else 0 end) from logs where request like '/ajax/product/get%';

insert or replace into display select 104, 'Indoor Air', sum(case when status < 400 then 1 else 0 end), sum(case when status >= 400 then 1 else 0 end) from logs where request like '/iaq%';

insert or replace into display select 105, '/', sum(case when status < 400 then 1 else 0 end), sum(case when status >= 400 then 1 else 0 end) from logs where request like '/';

-- Analytics

delete from logs where request like '/piwik/%';

insert or replace into display values(199, '----- Analytics ----', '-------', '-----');

insert into analytics select * from logs where request like '/js/p%';
insert or replace into display select 200, 'Piwik', sum(case when status < 400 then 1 else 0 end), sum(case when status >= 400 then 1 else 0 end) from analytics where request like '/js/p%';
delete from logs where request like '/js/p%';

-- Cleanup

delete from logs where request like '/iaq%';
delete from logs where request like '/robots.txt';
delete from logs where request like '/favicon.ico';
delete from logs where request like '/sitemap%';
delete from logs where request like '/images/%';
delete from logs where request like '/css/%';
delete from logs where request like '/js/%';
delete from logs where request like '%wp-content%';
delete from logs where request like '%wp-login.php%';
delete from logs where request like '%wlwmanifest.xml%';
delete from logs where request like '%phpmyadmin%';
delete from logs where request like '/xmlrpc.php';

-- Remaining Totals
insert or replace into display values(999, '----- Totals -------', '-------', '-----');

insert or replace into display select 1000, 'Remaining Traffic', sum(case when status < 400 then 1 else 0 end), sum(case when status >= 400 then 1 else 0 end) from logs;

update display set cnt=0, err=0 where cnt is null and err is null;

.mode column
.width 4 20 7 6
select * from display;
