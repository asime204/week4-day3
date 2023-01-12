-- MULTI JOIN
SELECT *
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id;

SELECT title, film.film_id
FROM film_actor
INNER JOIN film
ON film.film_id = film_actor.film_id;

SELECT title, first_name, last_name
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film.film_id = film_actor.film_id;

-- Now add on constraints
SELECT title, first_name, last_name
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film.film_id = film_actor.film_id
WHERE title LIKE 'A%'
ORDER by title;

-- SUBQUERIES

--Two queries split apart that later become 1
-- query 1:
-- through the payment table, find out which customers (customer_id)
-- spent more than $175
SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 250
ORDER BY SUM(amount) DESC;
-- query 2:
-- in the customer table, figure out their names and email
SELECT first_name, last_name, email
FROM customer;

-- Subquery
--they can occur in the WHERE, FROM, and SELECT

-- WHERE CLAUSE
SELECT first_name, last_name, email
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 250
    ORDER BY SUM(amount) DESC
);

-- FROM CLAUSE
-- get all the actors who acted in the movie Mulan Moon
SELECT first_name, last_name
FROM (
    SELECT title, first_name, last_name
    FROM film_actor
    INNER JOIN actor
    ON actor.actor_id = film_actor.actor_id
    INNER JOIN film
    ON film.film_id = film_actor.film_id
) AS film_actor_combined
WHERE title = 'Mulan Moon';

-- SELECT CLAUSE
SELECT first_name, last_name, (
    SELECT COUNT(*)
    FROM rental
)
FROM customer;