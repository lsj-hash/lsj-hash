-- ======================================================
-- 실습용 DB : DoItsql
--       TB : doit_tb 
-- ======================================================
-- DB 생성
CREATE DATABASE IF NOT EXISTS doitsql;

-- DB 선택
USE doitsql;

-- TB 생성
CREATE TABLE IF NOT EXISTS doit_tb
(
    col_1 INT PRIMARY KEY AUTO_INCREMENT,      
    col_2 VARCHAR(50),
    col_3 int
);

CREATE TABLE IF NOT EXISTS data_tb
(
    col_2 VARCHAR(50),
    col_3 int,
    col_4 char(2)
);

-- TB 확인
SHOW TABLES;

desc doit_tb;

-- 데이터 추가 
INSERT INTO data_tb VALUES
("TEST", 10, 'T'),("gone", 122, 'S'),("LOVE", 8, 'Z'),
("hola", 3, 'A'),("bin", 8, 'E'),("soso", 32, 'Y'),
("skaly", 1, 'G'),("vien", 6, 'F'),("SKT", 6, 'B');

-- AUTO_INCREMENT 자동증가

insert into doit_tb (col_2, col_3)
VALUES('OK', 100); 

insert into doit_tb (col_2, col_3)
VALUES('OK', 100),
      ('YES',90),
      ("Good", 1);

-- AE 컬럼도 값 지정
INSERT INTO doit_tb VALUES
(8, "TEST", 10);
-- ==========================================
-- select => insert
-- data_tb ==> doit_tb
-- ==========================================
INSERT INTO doit_tb(col_2, col_3)
SELECT col_2, col_3 from data_tb;

-- ==========================================
-- select => create
-- ==========================================
CREATE TABLE CopyTB as (select * from data_tb);



-- 전체 데이터 조회
select * from doit_tb; 
select * from data_tb; 

-- AE 설정값 변경 
set @@AUTO_INCREMENT_increment = 5;



-- 현재 마지막 AE 값 확인
select LAST_INSERT_ID() '마지막 AE 번호';