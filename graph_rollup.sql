DROP TABLE IF EXISTS bots;
DROP TABLE IF EXISTS analytics;
DROP TABLE IF EXISTS logs_err;
CREATE TABLE IF NOT EXISTS bots AS SELECT * from logs where id=null;
CREATE TABLE IF NOT EXISTS analytics AS SELECT * from logs where id=null;
CREATE TABLE IF NOT EXISTS logs_err AS SELECT * from logs where id=null;

-- Bot pages

CREATE TABLE IF NOT EXISTS bots_graph (date text, type int, google int, bing int, yandex int, baidu int, 
                                       yahoo int, duck int, seznam int, megaindex int, ccbot int, mj12 int, unique(date, type));

insert or replace into bots_graph (date, type, google, bing, yandex, baidu, yahoo, duck, seznam, megaindex, ccbot, mj12) 
                                   values (strftime('%Y-%m-%d', 'now'), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert or replace into bots_graph (date, type, google, bing, yandex, baidu, yahoo, duck, seznam, megaindex, ccbot, mj12) 
                                   values (strftime('%Y-%m-%d', 'now'), 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Google
update bots_graph set google = (select sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%Googlebot%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update bots_graph set google = (select sum(case when status <  300 then 1 else 0 end) from logs where agent like '%Googlebot%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;
insert into bots select * from logs where agent like '%Googlebot%';
delete from logs where agent like '%Googlebot%';

-- Bing
update bots_graph set bing = (select sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%bingbot%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update bots_graph set bing = (select sum(case when status <  300 then 1 else 0 end) from logs where agent like '%bingbot%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;
insert into bots select * from logs where agent like '%bingbot%';
delete from logs where agent like '%bingbot%';

-- Yandex
update bots_graph set yandex = (select sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%Yandex%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update bots_graph set yandex = (select sum(case when status <  300 then 1 else 0 end) from logs where agent like '%Yandex%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;
insert into bots select * from logs where agent like '%Yandex%';
delete from logs where agent like '%Yandex%';

-- Baidu
update bots_graph set baidu = (select sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%Baiduspider%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update bots_graph set baidu = (select sum(case when status <  300 then 1 else 0 end) from logs where agent like '%Baiduspider%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;
insert into bots select * from logs where agent like '%Baiduspider%';
delete from logs where agent like '%Baiduspider%';

-- Yahoo
update bots_graph set yahoo = (select sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%Yahoo!%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update bots_graph set yahoo = (select sum(case when status <  300 then 1 else 0 end) from logs where agent like '%Yahoo!%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;
insert into bots select * from logs where agent like '%Yahoo!%';
delete from logs where agent like '%Yahoo!%';

-- DuckDuckGo
update bots_graph set duck = (select sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%DuckDuckGo%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update bots_graph set duck = (select sum(case when status <  300 then 1 else 0 end) from logs where agent like '%DuckDuckGo%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;
insert into bots select * from logs where agent like '%DuckDuckGo%';
delete from logs where agent like '%DuckDuckGo%';

-- Seznam
update bots_graph set seznam = (select sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%Seznambot%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update bots_graph set seznam = (select sum(case when status <  300 then 1 else 0 end) from logs where agent like '%Seznambot%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;
insert into bots select * from logs where agent like '%Seznambot%';
delete from logs where agent like '%Seznambot%';

-- MegaIndex
update bots_graph set megaindex = (select sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%MegaIndex%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update bots_graph set megaindex = (select sum(case when status <  300 then 1 else 0 end) from logs where agent like '%MegaIndex%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;
insert into bots select * from logs where agent like '%MegaIndex%';
delete from logs where agent like '%MegaIndex%';

-- CCBot
update bots_graph set ccbot = (select sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%CCBot%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update bots_graph set ccbot = (select sum(case when status <  300 then 1 else 0 end) from logs where agent like '%CCBot%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;
insert into bots select * from logs where agent like '%CCBot%';
delete from logs where agent like '%CCBot%';

-- MJ12Bot
update bots_graph set mj12 = (select sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%MJ12bot%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update bots_graph set mj12 = (select sum(case when status <  300 then 1 else 0 end) from logs where agent like '%MJ12bot%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;
insert into bots select * from logs where agent like '%MJ12bot%';
delete from logs where agent like '%MJ12bot%';

-- Non Bot pages

CREATE TABLE IF NOT EXISTS page_graph (date text, type int, my_report int, aversion int, product int, ingredient int, symptom int, 
                                       demo int, resource int, help int, autocomplete int, report int, air int, root int, piwik int, unique(date, type));

insert or replace into page_graph (date, type, my_report, aversion, product, ingredient, symptom, demo, resource, help, autocomplete, report, air, root, piwik) 
                                   values (strftime('%Y-%m-%d', 'now'), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
insert or replace into page_graph (date, type, my_report, aversion, product, ingredient, symptom, demo, resource, help, autocomplete, report, air, root, piwik) 
                                   values (strftime('%Y-%m-%d', 'now'), 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- My Report Pages
update page_graph set my_report = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/reports/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set my_report = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/reports/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

-- Aversions Pages
update page_graph set aversion = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/aversions/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set aversion = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/aversions/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

-- Products Pages
update page_graph set product = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/products/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set product = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/products/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

-- Ingredients Pages
update page_graph set ingredient = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/ingredients/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set ingredient = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/ingredients/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

-- Symptoms Pages
update page_graph set symptom = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/symptoms/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set symptom = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/symptoms/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

-- Demo Pages
update page_graph set demo = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/demo/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set demo = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/demo/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

-- Resources Pages
update page_graph set resource = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/resources/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set resource = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/resources/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

-- Help Pages
update page_graph set help = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/help/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set help = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/help/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

-- Autocomplete
update page_graph set autocomplete = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/ajax/autocomplete/get%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set autocomplete = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/ajax/autocomplete/get%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

-- Generate Report
update page_graph set report = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/ajax/reports/symptoms%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set report = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/ajax/reports/symptoms%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

-- Indoor Air
update page_graph set air = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/iaq%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set air = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/iaq%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

-- Root Page
update page_graph set root = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set root = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

-- Piwik
update page_graph set piwik = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/js/p%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set piwik = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/js/p%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

-- Archive
insert into logs_err select * from logs where status >= 400;
delete from logs where status >= 400;

insert into analytics select * from logs where request like '/js/p%';
delete from logs where request like '/js/p%';

-- Cleanup
delete from logs where request like '/piwik/%';
delete from logs where request like '/iaq%';
delete from logs where request like '/robots.txt';
delete from logs where request like '/favicon.ico';
delete from logs where request like '/sitemap%';
delete from logs where request like '/images/%';
delete from logs where request like '/css/%';
delete from logs where request like '/js/%';
delete from logs where request like '%wp-content%';
delete from logs where request like '%wp-login.php%';
delete from logs where request like '%wp-admin%';
delete from logs where request like '%wlwmanifest.xml%';
delete from logs where request like '%phpmyadmin%';
delete from logs where request like '/xmlrpc.php';

-- Display
.headers on
.mode column
.width 10 4 7 7 7 7 7 7 7 7 7 7 7 7 7
.print -------------------------------------------- Bot Access
select * from bots_graph where type=1;
.print -------------------------------------------- Page Access
select * from page_graph where type=1;

.print -------------------------------------------- Bot Errors
select * from bots_graph where type=0;
.print -------------------------------------------- Page Errors
select * from page_graph where type=0;
