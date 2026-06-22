-- 問題1. postgresqlでpracticeデータベースを生成するSQL文を記述してください。
CREATE DATABASE practice;

-- 問題2. postgresqlでpracticeデータベースのusersテーブルを生成するSQL文を記述してください。
\c practice;
create table users(id SERIAL, name TEXT, age SMALLINT, gender TEXT);
INSERT INTO jobs(id, name, age, gender)VALUES
(1, '大谷 翔平', 29, 'Man'),
(2, 'ヒカキン', 34, 'Man'),
(3, '吉岡 里帆', 31,  'Woman'),
(4, '本田 翼', 31, 'Woman'),
(5, '八村 塁', 25, 'Man'),
(6, '深田 恭子', 41, 'Woman');

-- 問題3. postgresqlでpracticeデータベースのjobsテーブルを生成するSQL文を記述してください。
create table jobs(id SERIAL, user-id SERIAL,name TEXT, gender TEXT);
INSERT INTO jobs(id, name, age, gender)VALUES
(1, 1, 'プロ野球選手'),
(2, 2, 'YouTuber'),
(3, 3, '女優'),
(4, 4, '女優'),
(5, 4, 'ファッションモデル'),
(6, 5, 'プロバスケットボール選手'),
(7, 6, '女優');