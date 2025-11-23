/* Test 데이터베이스 생성*/
create database if not exists TEST;

/* Test 데이터베이스 삭제*/
drop database if exists TEST;

/* Test 데이터베이스 선택*/
use TEST;

/* 테이블 생성 */
create table tbl_product(
pid int,
pname varchar(10),
price int not null);

/* 데이터 추가 */
insert into tbl_product
value(1,"ABC",1000);

insert into tbl_product(pid, pname)
values(2.3, "TV");

insert into tbl_product(pid,pname)
values(11,"ABC"),
(13,"Good"),
(14, "bbc");


select * from tbl_product;
