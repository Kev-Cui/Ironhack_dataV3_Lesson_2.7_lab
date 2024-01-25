-- Lab Lesson 2.7
USE sakila;
-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT c.name AS category, COUNT(fc.film_id) AS film_count
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
GROUP BY c.category_id
ORDER BY film_count DESC;
-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT s.staff_id, SUM(p.amount) AS total_amount
FROM staff s
JOIN payment p 
ON p.staff_id = s.staff_id
WHERE MONTH(p.payment_date) = 8 AND YEAR(p.payment_date) = 2005
GROUP BY s.staff_id
ORDER BY total_amount DESC;
-- 3. Which actor has appeared in the most films?
SELECT CONCAT(a.first_name, ' ', a.last_name) AS actor_name, COUNT(fa.film_id) AS film_count
FROM actor a
JOIN film_actor fa 
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY film_count DESC
LIMIT 1;
-- 4. Most active customer (the customer that has rented the most number of films)
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, COUNT(r.rental_id) AS rental_count
FROM customer c
JOIN rental r 
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY rental_count DESC
LIMIT 1;
-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address
FROM staff s
JOIN address a 
ON s.address_id = a.address_id;
-- 6. List each film and the number of actors who are listed for that film.
SELECT f.title AS film, COUNT(fa.actor_id) AS actor_count
FROM film f
JOIN film_actor fa 
ON f.film_id = fa.film_id
GROUP BY f.film_id
ORDER BY actor_count DESC;
-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_paid
FROM customer c
JOIN payment p 
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name ASC;
-- 8. List the titles of films per category.
SELECT f.title AS film, c.name AS category
FROM category c
JOIN film_category fc 
ON c.category_id = fc.category_id

JOIN film f 
ON f.film_id = fc.film_id

ORDER BY category ASC;