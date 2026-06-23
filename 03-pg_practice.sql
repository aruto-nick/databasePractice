-- 問題1. postgresqlでpracticeデータベースを生成するSQL文を記述してください。
CREATE DATABASE practice;

-- 問題2. postgresqlでpracticeデータベースのusersテーブルを生成するSQL文を記述してください。
\c practice;
CREATE TYPE users_gender AS ENUM ('Man', 'Woman', 'Other');
create table users(
    id SERIAL PRIMARY KEY NOT NULL,
    name CHARACTER(255) NOT NULL DEFAULT '',
    age INTEGER NOT NULL DEFAULT 0,
    gender users_gender NOT NULL DEFAULT 'Other'
    );
    COMMENT ON COLUMN users.name IS '氏名';
    COMMENT ON COLUMN users.age IS '年齢';
    COMMENT ON COLUMN users.gender IS '性別';


-- 問題3. postgresqlでpracticeデータベースのjobsテーブルを生成するSQL文を記述してください。
create table jobs(
    id SERIAL PRIMARY KEY NOT NULL,
    user_id INTEGER NOT NULL,
    name CHARACTER(255) NOT NULL DEFAULT '会社員',
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(id)
    );
    COMMENT ON COLUMN jobs.name IS '仕事名';
