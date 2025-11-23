## 4장
use world;
# Q1
select * from country
where Code = 'KOR'

# Q2
select * from country
where Region Like '%Asia%'

## Q3
select * from country
where length(NAME) = 5

# Q4
select * from country
ORDER BY Population DESC 

# Q5
select * from country
where LifeExpectancy >= 60 or LifeExpectancy <= 70

# Q6
select * from country
where Region not Like '%Asia%' and ( 'g' or 'u')

# Q7
select Region, count(*) from country
group by Region
ORDER BY count(Region) DESC;

use sakila;

## 5장
select a.customer_id , a.store_id , a.first_name , a.last_name , a.email , a.address_id as a_address_id,
b.address_id as b_address_id, b.address, b.district, b.city_id, b.postal_code, b.phone, b.location
from customer as a 
INNER JOIN
address as b on a.address_id=b.address_id 
where a.first_name='ROSA';

SELECT
	a.customer_id, a.first_name, a.last_name,
	b.address_id, b.address, b.district, b.postal_code
FROM customer AS a
	INNER join address AS b 
    ON a.address_id = b.address_id AND a.create_date = b.last_update
WHERE a.first_name = 'ROSA';

select
	a.customer_id, a.first_name, a.last_name,
	b.address_id, b.address, b.district, b.postal_code,
    c.city_id, c.city
from customer as a
    Inner JOIN address as b
    inner join city as c
        on c.city_id = c.city_id
where a.first_name='ROSA';

SELECT
	a.address, a.address_id AS a_address_id,
	b.address_id AS b_address_id, b.store_id
FROM address AS a
    LEFT OUTER join store as b
        on a.address = b.address_id;

SELECT
	a.address, a.address_id AS a_address_id,
	b.address_id AS b_address_id, b.store_id
FROM address AS a
	LEFT OUTER JOIN store AS b 
        ON a.address_id = b.address_id
WHERE b.address_id IS NULL;

SELECT
	a.address, a.address_id AS a_address_id,
	b.address_id AS b_address_id, b.store_id
FROM address AS a
	RIGHT OUTER JOIN store AS b 
        ON a.address_id = b.address_id;

SELECT
	a.address_id AS a_address_id, a.store_id,
	b.address, b.address_id AS b_address_id
FROM store AS a
	RIGHT OUTER JOIN address AS b 
        ON a.address_id = b.address_id
WHERE a.address_id IS NULL;    

SELECT
	a.address_id AS a_address_id, a.store_id,
	b.address, b.address_id AS b_address_id
FROM store AS a
	LEFT OUTER JOIN address AS b 
        ON a.address_id = b.address_id

UNION
SELECT
	a.address_id AS a_address_id, a.store_id,
	b.address, b.address_id AS b_address_id
FROM store AS a	
	RIGHT OUTER JOIN address AS b 
        ON a.address_id = b.address_id;

   SELECT
	a.address_id AS a_address_id, a.store_id,
	b.address, b.address_id AS b_address_id
FROM store AS a
	LEFT OUTER JOIN address AS b 
        ON a.address_id = b.address_id
WHERE b.address_id IS NULL
UNION
SELECT
	a.address_id AS a_address_id, a.store_id,
	b.address, b.address_id AS b_address_id
FROM store AS a
	RIGHT OUTER JOIN address AS b 
        ON a.address_id = b.address_id
WHERE a.address_id IS NULL;

create Table doit_cross1(num INT);
create Table doit_cross2(name VARCHAR(10));
insert INTO doit_cross1 VALUES (1),(2),(3);

INSERT INTO doit_cross2 VALUES ('Do'), ('It'), ('SQL');

select a.num, b.name
from doit_cross1 as a   
    cross join doit_cross2 as b
order by a.num;

select a.num, b.name
from doit_cross1 as a   
    cross join doit_cross2 as b
where a.num = 1;

SELECT 
	a.customer_id AS a_customer_id, b.customer_id AS b_customer_id
FROM customer AS a
	INNER JOIN customer AS b ON a.customer_id = b.customer_id

SELECT
	a.payment_id, a.amount, b.payment_id, b.amount, b.amount - a.amount AS profit_amount
FROM payment AS a
	LEFT OUTER JOIN payment AS b ON a.payment_id = b.payment_id -1;    