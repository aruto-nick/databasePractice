-- 問題1. postgresqlでpracticeデータベースを生成するSQL文を記述してください。
CREATE DATABASE practice;

-- 問題2. postgresqlでpracticeデータベースのusersテーブルを生成するSQL文を記述してください。
\c practice;
create table users(
    "id" SERIAL PRIMARY KEY NOT NULL,
    "name" CHARACTER(255) NOT NULL DEFAULT "" COMMENT "氏名",
    "age" INTEGER NOT NULL DEFAULT 0 COMMENT "年齢",
    "gender" ENUM("Man", "Woman", "Other") NOT NULL DEFAULT "Other" COMMENT "性別", )


-- 問題3. postgresqlでpracticeデータベースのjobsテーブルを生成するSQL文を記述してください。
create table jobs(
    "id" SERIAL PRIMARY KEY NOT NULL,
    "user-id" INTEGER NOT NULL,
    "name" CHARACTER(255) NOT NULL DEFAULT "会社員" COMMENT "仕事名",
    FOREIGN KEY "fk_user_id" ("user_id") REFERENCES "users"("id")
    );
