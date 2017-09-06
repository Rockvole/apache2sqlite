-- Bot pages

CREATE TABLE IF NOT EXISTS bots_graph (date text, type int, google int, bing int, yandex int, baidu int, 
                                       yahoo int, duck int, seznam int, megaindex int, ccbot int, mj12 int, unique(date, type));

insert or replace into bots_graph (date, type) values (strftime('%Y-%m-%d', 'now'), 0);
insert or replace into bots_graph (date, type) values (strftime('%Y-%m-%d', 'now'), 1);

update bots_graph set google = (select sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%Googlebot%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update bots_graph set google = (select sum(case when status <  300 then 1 else 0 end) from logs where agent like '%Googlebot%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

update bots_graph set bing = (select sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%bingbot%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update bots_graph set bing = (select sum(case when status <  300 then 1 else 0 end) from logs where agent like '%bingbot%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

update bots_graph set yandex = (select sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%Yandex%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update bots_graph set yandex = (select sum(case when status <  300 then 1 else 0 end) from logs where agent like '%Yandex%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

update bots_graph set baidu = (select sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%Baiduspider%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update bots_graph set baidu = (select sum(case when status <  300 then 1 else 0 end) from logs where agent like '%Baiduspider%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

update bots_graph set yahoo = (select sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%Yahoo!%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update bots_graph set yahoo = (select sum(case when status <  300 then 1 else 0 end) from logs where agent like '%Yahoo!%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

update bots_graph set duck = (select sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%DuckDuckGo%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update bots_graph set duck = (select sum(case when status <  300 then 1 else 0 end) from logs where agent like '%DuckDuckGo%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

update bots_graph set seznam = (select sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%Seznambot%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update bots_graph set seznam = (select sum(case when status <  300 then 1 else 0 end) from logs where agent like '%Seznambot%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

update bots_graph set megaindex = (select sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%MegaIndex%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update bots_graph set megaindex = (select sum(case when status <  300 then 1 else 0 end) from logs where agent like '%MegaIndex%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

update bots_graph set ccbot = (select sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%CCBot%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update bots_graph set ccbot = (select sum(case when status <  300 then 1 else 0 end) from logs where agent like '%CCBot%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

update bots_graph set mj12 = (select sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%MJ12bot%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update bots_graph set mj12 = (select sum(case when status <  300 then 1 else 0 end) from logs where agent like '%MJ12bot%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

-- Non Bot pages

CREATE TABLE IF NOT EXISTS page_graph (date text, type int, my_report int, aversion int, product int, ingredient int, symptom int, 
                                       demo int, resource int, help int, autocomplete int, report int, air int, root int, piwik int, unique(date, type));

insert or replace into page_graph (date, type) values (strftime('%Y-%m-%d', 'now'), 0);
insert or replace into page_graph (date, type) values (strftime('%Y-%m-%d', 'now'), 1);

update page_graph set my_report = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/reports/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set my_report = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/reports/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

update page_graph set aversion = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/aversions/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set aversion = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/aversions/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

update page_graph set product = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/products/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set product = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/products/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

update page_graph set ingredient = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/ingredients/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set ingredient = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/ingredients/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

update page_graph set symptom = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/symptoms/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set symptom = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/symptoms/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

update page_graph set demo = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/demo/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set demo = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/demo/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

update page_graph set resource = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/resources/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set resource = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/resources/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

update page_graph set help = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/help/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set help = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/help/%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

update page_graph set autocomplete = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/ajax/autocomplete/get%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set autocomplete = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/ajax/autocomplete/get%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

update page_graph set report = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/ajax/reports/symptoms%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set report = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/ajax/reports/symptoms%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

update page_graph set air = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/iaq%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set air = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/iaq%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

update page_graph set root = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set root = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

update page_graph set piwik = (select sum(case when status >= 400 then 1 else 0 end) from logs where request like '/js/p%')
                  where date = strftime('%Y-%m-%d', 'now') and type=0;
update page_graph set piwik = (select sum(case when status <  300 then 1 else 0 end) from logs where request like '/js/p%')
                  where date = strftime('%Y-%m-%d', 'now') and type=1;

.headers on
.mode column
.width 10 4 7 7 7 7 7 7 7 7 7 7
select * from bots_graph;

.width 10 4 7 7 7 7 7 7 7 7 7 7 7 7 7
select * from page_graph;
