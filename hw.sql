SELECT *
FROM customer;

SELECT *
FROM address;


-- 1. List all customers who live in Texas (use 
-- JOINs)  

-- Jennifer Davis, Kim Cruz, Richard Mccrary,
-- Bryan Hardison, Ian Still

SELECT first_name, last_name, address.district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE address.district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full 
-- Name  

SELECT *
FROM customer;

SELECT *
FROM payment
WHERE amount > 6.99;

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id, payment.amount
    HAVING amount > 6.99
);

-- 3. Show all customers names who have made payments over $175(use 
-- subqueries) 

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id, payment.amount
    HAVING SUM(amount) > 175
);

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id, payment.amount
    HAVING amount > 175
);
-- 4. List all customers that live in Nepal (use the city 
-- table)  

-- Kevin Schuler

SELECT first_name, last_name
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON city.city_id = address.city_id
INNER JOIN country
ON country.country_id = city.country_id
WHERE country = 'Nepal';

-- 5. Which staff member had the most 
-- transactions?  

-- Mike Hillyer

SELECT staff.first_name, staff.last_name, COUNT(rental.staff_id)
FROM staff
INNER JOIN rental
ON staff.staff_id = rental.staff_id
GROUP BY staff.staff_id, staff.first_name, staff.last_name
ORDER BY COUNT(rental.staff_id) DESC
LIMIT 1;


-- 6. How many movies of each rating are 
-- there?  

-- R = 195
-- NC-17 = 209
-- PG-13 = 223
-- PG = 194
-- G = 178
-- Null = 1

SELECT rating, COUNT(*)
FROM film
GROUP BY rating;

-- 7.Show all customers who have made a single payment 
-- above $6.99 (Use Subqueries) 

SELECT first_name, last_name, customer_id
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id, payment.amount
    HAVING amount > 6.99
)
GROUP BY customer_id HAVING COUNT(DISTINCT customer_id) = 1;

-- 8. How many free rentals did our stores give away?

-- No free rentals

SELECT amount
FROM payment;

SELECT COUNT(*) as free_rentals
FROM rental 
INNER JOIN payment
ON rental.rental_id = payment.rental_id
WHERE payment.amount = 0;