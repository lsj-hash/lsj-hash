use sakila;
select * from customer
where first_name = 'MARIA';

select * from customer
where address_id = 200;

select * from customer
where address_id < 200;

select * from customer
where first_name = 'MARIA';

select * from customer
where first_name < 'MARIA' ;

select * from payment
where payment_date = '2005-07-09 13:24:07';

select * from payment
where payment_date < '2005-07-09';

select * from customer
where address_id >= 5 and address_id <=10 ;

select * from payment
where payment_date > '2005-06-17' and payment_date < '2005-07-19';

select * from payment
where payment_date = '2005-07-08 07:33:56' ;

select * from customer
where first_name between 'M' and 'O' ;
select * from customer
where first_name > 'M' and  first_name < 'O' ;

select * from customer
where first_name not between 'M' and 'O' ;
select * from customer
where not (first_name > 'M' and  first_name < 'O') ;

select * from city
where city = 'Sunnyvale' and country_id = 103;

select * from payment
where payment_date >= '2005-06-01' and payment_date <= '2005-07-05' ;

select * from customer
where first_name = "MARIA" or first_name = "LINDA";

select * from customer
where first_name = "MARIA" or first_name = "LINDA" or first_name = 'NANCY';

select * from customer
where first_name in ('MARIA',"LINDA", 'NANCY');

select * from city
where country_id = 103 or country_id = 86 and city in ("Cheju",'Sunnyvale','Dallas');

select * from city
where (country_id = 103 or country_id = 86) and city in ("Cheju",'Sunnyvale','Dallas');

select * from city
where country_id in (103, 86) and city in ("Cheju",'Sunnyvale','Dallas');

select * from address;

select * from address
where address2 = null;

select * from address
where address2 is null;

select * from address
where address2 is not null;

select * from address
where address2 = '';