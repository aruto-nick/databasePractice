-- 問1
-- 国名を全て抽出してください。
 \c world
 \pset null 'NULL'
select name from countries;

-- 問2
-- ヨーロッパに属する国をすべて抽出してください。
select code, name, continent, region, surface_area from countries 
where countries.continent = 'Europe';

-- 問3
-- ヨーロッパ以外に属する国をすべて抽出してください。
select code, name, continent, region, surface_area from countries 
where NOT (countries.continent =  'Europe'); 

-- 問4
-- 人口が10万人以上の国をすべて抽出してください。
select code, name, continent, region, surface_area, indep_year, population from countries 
where population >= 100000;

-- 問5
-- 平均寿命が56歳から76歳の国をすべて抽出してください。
select * from countries where life_expectancy <= 76 and life_expectancy >= 56;

-- 問6
-- 国コードがNLB,ALB,DZAのもの市区町村をすべて抽出してください。
select id, name, country_code, district, population from cities 
where cities.country_code = 'ALB' or cities.country_code = 'DZA' or cities.country_code = 'NLB';

-- 問7
-- 独立独立記念日がない国をすべて抽出してください。
select code, name, continent, region, surface_area, indep_year from countries 
where indep_year is null;

-- 問8
-- 独立独立記念日がある国をすべて抽出してください。
select code, name, continent, region, surface_area, indep_year from countries 
where indep_year is not null;

-- 問9
-- 名前の末尾が「ia」で終わる国を抽出してください。
select code, name, continent, region, surface_area from countries 
where trim(countries.name) like '%ia';

-- 問10
-- 名前の中に「st」が含まれる国を抽出してください。
select code, name, continent, region, surface_area from countries 
where countries.name like '%st%';

-- 問11
-- 名前が「an」で始まる国を抽出してください。
select code, name, continent, region, surface_area, indep_year from countries 
where countries.name like 'An%';

-- 問12
-- 全国の中から独立記念日が1990年より前または人口が10万人より多い国を全て抽出してください。
select code, name, continent, region, surface_area, indep_year from countries 
where indep_year < 1990 or population > 100000;

-- 問13
-- コードがDZAもしくはALBかつ独立記念日が1990年より前の国を全て抽出してください。
select code, name, continent, region, surface_area, indep_year from countries 
where (countries.code = 'DZA' or countries.code = 'ALB')and countries.indep_year < 1990;

-- 問14
-- 全ての地方をグループ化せずに表示してください。
select distinct region from countries;

-- 問15
-- 国名と人口を以下のように表示させてください。シングルクォートに注意してください。
-- 「Arubaの人口は103000人です」
select
name || 'の人口は'|| population|| '人です' as POPULATION from countries;

-- 問16
-- 平均寿命が短い順に国名を表示させてください。ただしNULLは表示させないでください。
select name, life_expectancy from countries 
where life_expectancy is not null 
order by life_expectancy;

-- 問17
-- 平均寿命が長い順に国名を表示させてください。ただしNULLは表示させないでください。
select name, life_expectancy from countries 
where life_expectancy is not null 
order by life_expectancy desc;

-- 問18
-- 平均寿命が長い順、独立記念日が新しい順に国を表示させてください。
select name, life_expectancy, indep_year from countries 
where life_expectancy is not null 
order by life_expectancy desc, indep_year asc;

-- 問19
-- 全ての国の国コードの一文字目と国名を表示させてください。
select substring(name,1,1) as "SUBSTRING(code,1,1)", name from countries;

-- 問20
-- 国名が長いものから順に国名と国名の長さを出力してください。
select name, length(name) as "LENGTH(name)" from countries 
order by length(name) desc;

-- 問21
-- 全ての地方の平均寿命、平均人口を表示してください。(NULLも表示)
select region, AVG(life_expectancy) as "平均寿命", AVG(population) as "平均人口" from countries 
group by region 
order by region asc;

-- 問22
-- 全ての地方の最長寿命、最大人口を表示してください。(NULLも表示)
select region, MAX(life_expectancy) as "最大寿命",MAX(population) as "最大人口" from countries 
group by region 
order by region asc;

-- 問23
-- アジア大陸の中で最小の表面積を表示してください
select MIN(surface_area) as "アジアの最小表面積" from countries where continent = 'Asia';

-- 問24
-- アジア大陸の表面積の合計を表示してください。
select SUM(surface_area) as "アジア大陸の表面積の合計" from countries where continent = 'Asia';

-- 問25
-- 全ての国と言語を表示してください。一つの国に複数言語があると思いますので同じ国名を言語数だけ出力してください。
select countries.name, country_languages.language from countries join country_languages on countries.code = country_languages.country_code;

-- 問26
-- 全ての国と言語と市区町村を表示してください。
select countries.name as "国名", cities.district as "市区町村名" , country_languages.language 
from countries 
join cities on countries.code = cities.country_code
join country_languages on countries.code = country_languages.country_code;

-- 問27
-- 全ての有名人を出力してください。左側外部結合を使用して国名なし（country_codeがNULL）も表示してください。
select celebrities.name, countries.name from celebrities left join countries on celebrities.country_code = countries.code;

-- 問28
-- 全ての有名人の名前,国名、第一言語を出力してください。
select celebrities.name, countries.name, country_languages.language 
from celebrities 
join countries on celebrities.country_code = countries.code
join country_languages on celebrities.country_code = country_languages.country_code
WHERE country_languages.is_official = 'T';

-- 問29
-- 全ての有名人の名前と国名をに出力してください。 ただしテーブル結合せずサブクエリを使用してください。
select celebrities.name,
(select countries.name from countries where countries.code = celebrities.country_code) as 国名
from celebrities;

-- 問30
-- 最年長が50歳以上かつ最年少が30歳以下の国を表示させてください。
select celebrities.country_code, max(celebrities.age), min(celebrities.age) from celebrities
where celebrities.country_code is not null
and celebrities.country_code is not ''
group by celebrities.country_code
having max (celebrities.age) >= 50
and min(celebrities.age) <= 30;

-- 問31
-- 1991年生まれと、1981年生まれの有名人が何人いるか調べてください。ただし、日付関数は使用せず、UNION句を使用してください。
select '1991' as "誕生年", count(celebrities.birth) from celebrities where celebrities.birth::text like '1991-%'
union
select '1981' as "誕生年", count(celebrities.birth) from celebrities where celebrities.birth::text like '1981-%';

-- 問32
-- 有名人の出身国の平均年齢を高い方から順に表示してください。ただし、FROM句はcountriesテーブルとしてください。
select countries.name as "国名", avg(celebrities.age) as "平均年齢" from countries
join celebrities on countries.code = celebrities.country_code 
group by countries.name
order by avg(celebrities.age) desc;