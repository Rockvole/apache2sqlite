DROP TABLE IF EXISTS bots;
DROP TABLE IF EXISTS display;
CREATE TABLE IF NOT EXISTS bots AS SELECT * from logs where id=null;
CREATE TABLE IF NOT EXISTS display (id INTEGER PRIMARY KEY, name, cnt);

delete from logs where request like '/iaq/%';
delete from logs where request like '/robots.txt';
delete from logs where request like '/favicon.ico';
delete from logs where request like '/sitemap%';
delete from logs where request like '/images/%';
delete from logs where request like '/css/%';
delete from logs where request like '/js/%';

insert into bots select * from logs where agent like '%Googlebot%';
delete from logs where agent like '%Googlebot%';
insert or replace into display select 1, 'Googlebot', count(*) from bots where agent like '%Googlebot%';

insert into bots select * from logs where agent like '%bingbot%';
delete from logs where agent like '%bingbot%';
insert or replace into display select 2, 'bingbot', count(*) from bots where agent like '%bingbot%';

insert into bots select * from logs where agent like '%Yandex%';
delete from logs where agent like '%Yandex%';
insert or replace into display select 3, 'Yandex', count(*) from bots where agent like '%Yandex%';

insert into bots select * from logs where agent like '%Baiduspider%';
delete from logs where agent like '%Baiduspider%';
insert or replace into display select 4, 'Baiduspider', count(*) from bots where agent like '%Baiduspider%';

insert into bots select * from logs where agent like '%Yahoo!%';
delete from logs where agent like '%Yahoo!%';
insert or replace into display select 5, 'Yahoo!', count(*) from bots where agent like '%Yahoo!%';

insert or replace into display select 6, 'Demo Pages', count(*) from logs where request like '/demo/%';

insert or replace into display select 7, 'Resource Pages', count(*) from logs where request like '/resources/%';

insert or replace into display select 8, 'Help Pages', count(*) from logs where request like '/help/%';

insert or replace into display select 9, '/', count(*) from logs where request like '/';

.mode column
.width 4 15 7
select * from display;
