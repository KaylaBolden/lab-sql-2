-- 1. Select all the actors with the first name ‘Scarlett’.
select *
from sakila.actor 
where first_name='Scarlett';

-- 2. Select all the actors with the last name ‘Johansson’.
select *
from sakila.actor 
where last_name='Johansson';

-- 3. How many films (movies) are available for rent?
select count(distinct(title)) from (
select distinct title
from  sakila.rental as r 
inner join sakila.inventory as i on r.inventory_id = i.inventory_id
inner join sakila.film as f on i.film_id=f.film_id
where return_date is not null)sub1;

-- 4. How many films have been rented?
select count(distinct(title)) from (
select distinct title
from  sakila.rental as r 
inner join sakila.inventory as i on r.inventory_id = i.inventory_id
inner join sakila.film as f on i.film_id=f.film_id
where return_date is null)sub1;
-- 5. What is the shortest and longest rental period?
select min(return_date - rental_date)
from  sakila.rental;
-- longest
select max(return_date - rental_date)
from  sakila.rental;
-- 6. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
-- shortest
select min(length) as min_duration
from sakila.film;
-- longest
select max(length) as max_duration
from sakila.film;
-- 7. What's the average movie duration?
select avg(length) as avg_duration
from sakila.film;
-- 8. What's the average movie duration expressed in format (hours, minutes)?
-- select CONVERT(varchar(5),avg(length), 114) as avg_duration
-- from sakila.film;
select concat(floor(avg(length)/60), "Hrs ", round(avg(length)%60,0),  "Mins") as hoursMinutes
from sakila.film;
-- 9. How many movies longer than 3 hours?
select count(title)
from sakila.film
where length/60> 3;
-- 10. Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
select trim(lower(email)) as email
from sakila.customer;
-- 11. What's the length of the longest film title?
select max(length(title))
from sakila.film;