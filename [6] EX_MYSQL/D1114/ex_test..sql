## =============================================
## Table 연동 연산 실습
## =============================================
## DB 선택 : use DB_NAME ;
use sakila;

## Table 정보 확인 : desc/describe Table_Name;
desc customer;

## [실습1] customer 테이블
## address_id가 2자리수인 고객 정보 추출
select address_id from customer
where address_id between 10 and 99;

select address_id from customer
where address_id >= 10 and address_id < 100;

select address_id from customer
where length(address_id) = 2;

## [실습2] customer 테이블
## 이름이 'C' ~ 'D'로 시작하는 고객 정보만 추출
select first_name, customer_id from customer
where first_name like 'C%' or first_name like 'D%';

## [실습3] city 테이블
## Cheju, Dallas 고객 정보만 추출
select * from city
where city = "CHEJU" or "DALLAS";

select * from city
where city in ("CHEJU", "DALLAS", 'Baku');


## [실습5] customer 테이블
## 성은 A로 시작하고 이름은 E로 끝나는 고객 정보만 추출
select first_name, last_name
from customer 
where first_name like 'E%' and last_name like '%A';


## [실습6] city 테이블
## 국가코드가 101인 도시들 출력
select city
from city
where country_id = 101;

## [실습7] city 테이블
## 국가코드가 101이 도시들 중 도시명에 사이에 h가 있는 도시
select city
from city
where country_id = 101 and city like '%h%';

## [실습8] address 테이블 
## address2가 입려되지 않는 주소 정보만 출력
select * from adress
where address2 is null;


## [실습9] address 테이블 
## address2와 phone이 입려되지 않는 주소 정보만 출력
select * from address
where address2 is null and phone ='';


## [실습10] payment 테이블
## 결제일이 7월인 데이터만 추출
select * from payment
where payment_date like '%-07-%'; 

DESC payment;


select * from payment
WHERE MONTH(payment_date) = 7;
