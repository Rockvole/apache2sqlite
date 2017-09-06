-- Bot pages

CREATE TABLE IF NOT EXISTS bots_graph (date text, type int, google int, bing int, yandex int, baidu int, yahoo int, duck int, seznam int, megaindex int, ccbot int, mj12 int);

insert or replace into bots_graph (date, type, google) select datetime('now'), 0, sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%Googlebot%';
insert or replace into bots_graph (date, type, google) select datetime('now'), 1, sum(case when status <  300 then 1 else 0 end) from logs where agent like '%Googlebot%';

insert or replace into bots_graph (date, type, bing) select datetime('now'), 0, sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%bingbot%';
insert or replace into bots_graph (date, type, bing) select datetime('now'), 1, sum(case when status <  300 then 1 else 0 end) from logs where agent like '%bingbot%';

insert or replace into bots_graph (date, type, yandex) select datetime('now'), 0, sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%Yandex%';
insert or replace into bots_graph (date, type, yandex) select datetime('now'), 1, sum(case when status <  300 then 1 else 0 end) from logs where agent like '%Yandex%';

insert or replace into bots_graph (date, type, baidu) select datetime('now'), 0, sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%Baiduspider%';
insert or replace into bots_graph (date, type, baidu) select datetime('now'), 1, sum(case when status <  300 then 1 else 0 end) from logs where agent like '%Baiduspider%';

insert or replace into bots_graph (date, type, yahoo) select datetime('now'), 0, sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%Yahoo!%';
insert or replace into bots_graph (date, type, yahoo) select datetime('now'), 1, sum(case when status <  300 then 1 else 0 end) from logs where agent like '%Yahoo!%';

insert or replace into bots_graph (date, type, duck) select datetime('now'), 0, sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%DuckDuckGo%';
insert or replace into bots_graph (date, type, duck) select datetime('now'), 1, sum(case when status <  300 then 1 else 0 end) from logs where agent like '%DuckDuckGo%';

insert or replace into bots_graph (date, type, seznam) select datetime('now'), 0, sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%Seznambot%';
insert or replace into bots_graph (date, type, seznam) select datetime('now'), 1, sum(case when status <  300 then 1 else 0 end) from logs where agent like '%Seznambot%';

insert or replace into bots_graph (date, type, megaindex) select datetime('now'), 0, sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%MegaIndex%';
insert or replace into bots_graph (date, type, megaindex) select datetime('now'), 1, sum(case when status <  300 then 1 else 0 end) from logs where agent like '%MegaIndex%';

insert or replace into bots_graph (date, type, ccbot) select datetime('now'), 0, sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%CCBot%';
insert or replace into bots_graph (date, type, ccbot) select datetime('now'), 1, sum(case when status <  300 then 1 else 0 end) from logs where agent like '%CCBot%';

insert or replace into bots_graph (date, type, mj12) select datetime('now'), 0, sum(case when status >= 400 then 1 else 0 end) from logs where agent like '%MJ12bot%';
insert or replace into bots_graph (date, type, mj12) select datetime('now'), 1, sum(case when status <  300 then 1 else 0 end) from logs where agent like '%MJ12bot%';

-- Non Bot pages

CREATE TABLE IF NOT EXISTS page_graph (date text, type int, my_report int, aversion int, product int, ingredient int, symptom int, demo int, resource int, help int, autocomplete int, report int, air int, root int, piwik int);

insert or replace into page_graph (date, type, my_report) select datetime('now'), 0, sum(case when status >= 400 then 1 else 0 end) from logs where request like '/reports/%'
insert or replace into page_graph (date, type, my_report) select datetime('now'), 1, sum(case when status <  300 then 1 else 0 end) from logs where request like '/reports/%'

insert or replace into page_graph (date, type, aversion) select datetime('now'), 0, sum(case when status >= 400 then 1 else 0 end) from logs where request like '/aversions/%'
insert or replace into page_graph (date, type, aversion) select datetime('now'), 1, sum(case when status <  300 then 1 else 0 end) from logs where request like '/aversions/%'

insert or replace into page_graph (date, type, product) select datetime('now'), 0, sum(case when status >= 400 then 1 else 0 end) from logs where request like '/products/%'
insert or replace into page_graph (date, type, product) select datetime('now'), 1, sum(case when status <  300 then 1 else 0 end) from logs where request like '/products/%'

insert or replace into page_graph (date, type, ingredient) select datetime('now'), 0, sum(case when status >= 400 then 1 else 0 end) from logs where request like '/ingredients/%'
insert or replace into page_graph (date, type, ingredient) select datetime('now'), 1, sum(case when status <  300 then 1 else 0 end) from logs where request like '/ingredients/%'

insert or replace into page_graph (date, type, symptom) select datetime('now'), 0, sum(case when status >= 400 then 1 else 0 end) from logs where request like '/symptoms/%'
insert or replace into page_graph (date, type, symptom) select datetime('now'), 1, sum(case when status <  300 then 1 else 0 end) from logs where request like '/symptoms/%'

insert or replace into page_graph (date, type, demo) select datetime('now'), 0, sum(case when status >= 400 then 1 else 0 end) from logs where request like '/demo/%'
insert or replace into page_graph (date, type, demo) select datetime('now'), 1, sum(case when status <  300 then 1 else 0 end) from logs where request like '/demo/%'

insert or replace into page_graph (date, type, resource) select datetime('now'), 0, sum(case when status >= 400 then 1 else 0 end) from logs where request like '/resources/%'
insert or replace into page_graph (date, type, resource) select datetime('now'), 1, sum(case when status <  300 then 1 else 0 end) from logs where request like '/resources/%'

insert or replace into page_graph (date, type, help) select datetime('now'), 0, sum(case when status >= 400 then 1 else 0 end) from logs where request like '/help/%'
insert or replace into page_graph (date, type, help) select datetime('now'), 1, sum(case when status <  300 then 1 else 0 end) from logs where request like '/help/%'

insert or replace into page_graph (date, type, autocomplete) select datetime('now'), 0, sum(case when status >= 400 then 1 else 0 end) from logs where request like '/ajax/autocomplete/get%'
insert or replace into page_graph (date, type, autocomplete) select datetime('now'), 1, sum(case when status <  300 then 1 else 0 end) from logs where request like '/ajax/autocomplete/get%'

insert or replace into page_graph (date, type, report) select datetime('now'), 0, sum(case when status >= 400 then 1 else 0 end) from logs where request like '/ajax/reports/symptoms%'
insert or replace into page_graph (date, type, report) select datetime('now'), 1, sum(case when status <  300 then 1 else 0 end) from logs where request like '/ajax/reports/symptoms%'

insert or replace into page_graph (date, type, air) select datetime('now'), 0, sum(case when status >= 400 then 1 else 0 end) from logs where request like '/iaq%'
insert or replace into page_graph (date, type, air) select datetime('now'), 1, sum(case when status <  300 then 1 else 0 end) from logs where request like '/iaq%'

insert or replace into page_graph (date, type, root) select datetime('now'), 0, sum(case when status >= 400 then 1 else 0 end) from logs where request like '/'
insert or replace into page_graph (date, type, root) select datetime('now'), 1, sum(case when status <  300 then 1 else 0 end) from logs where request like '/'

insert or replace into page_graph (date, type, piwik) select datetime('now'), 0, sum(case when status >= 400 then 1 else 0 end) from logs where request like '/js/p%'
insert or replace into page_graph (date, type, piwik) select datetime('now'), 1, sum(case when status <  300 then 1 else 0 end) from logs where request like '/js/p%'
