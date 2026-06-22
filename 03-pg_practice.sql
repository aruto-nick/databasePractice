-- 問題1. postgresqlでpracticeデータベースを生成するSQL文を記述してください。
CREATE DATABASE practice;

-- 問題2. postgresqlでpracticeデータベースのusersテーブルを生成するSQL文を記述してください。
use practice;
create table users(id int, name varchar(10));

-- 問題3. postgresqlでpracticeデータベースのjobsテーブルを生成するSQL文を記述してください。
create table jobs(id int, name varchar(10));