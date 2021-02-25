SELECT *
FROM customer;

SELECT *
FROM address;

--1. List all customers who live in Texas (use JOINs) 
SELECT first_name,last_name,customer_id,customer.address_id,address.address_id, address.district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE address.district = 'Texas'
--jennifer davis, Kim Cruz, Richard McCary, Bryan Hardison and Ian Still all live in Texas
SELECT *
FROM payment;
SELECT *
FROM customer;

--2. Get all payments above $6.99 with the Customer's Full Name 
SELECT first_name, last_name, customer.customer_id, amount
FROM customer
LEFT JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99
-- 1406 rows

--3. Show all customers names who have made payments over $175(use subqueries) 
SELECT first_name, last_name, customer_id
FROM customer
WHERE customer_id IN( 
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
);
-- rhonda, clara, elenor,marion, tommy and karl all have made payment above $175

SELECT *
FROM city;
SELECT *
FROM address;
SELECT *
FROM customer;
SELECT *
FROM country;

--4. List all customers that live in Nepal (use the city table)
SELECT first_name,last_name, city.city_id,customer.address_id, country.country
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON city.city_id = address.city_id
JOIN country
ON country.country_id = city.country_id
WHERE country.country_id IN(
	SELECT country_id
	FROM country
	WHERE country = 'Nepal'
);
-- kevin lives in Nepal

SELECT *
FROM staff;
SELECT *
FROM rental;
--5. Which staff member had the most transactions?  
SELECT rental.staff_id,first_name, last_name, count(rental.staff_id)
FROM rental
LEFT JOIN staff
ON staff.staff_id = rental.staff_id
GROUP BY rental.staff_id,first_name, last_name
-- mike has more sales

select*
from actor;
select *
FROM film;
select *
FROM film_actor;

--6. What film had the most actors in it? 
SELECT title, count(film_actor.actor_id)AS cnt
FROM film
JOIN film_actor
ON film.film_id = film_actor.film_id
GROUP BY title
ORDER BY cnt DESC;
-- lambs Cincinatti has the most actors with the count of 15

SELECT *
FROM PAYMENT;

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries), amount
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	WHERE amount>6.99
);
-- 539 rows

SELECT *
FROM film_category;
select *
FROM category;
--8. Which Category is most prevalent in the films?
SELECT film_category.category_id,count(film_category.category_id) as cnt, name
FROM film_category
INNER JOIN category
ON category.category_id = film_category.category_id
GROUP BY film_category.category_id, name
ORDER BY cnt DESC
-- sports is the most prevalnt category


