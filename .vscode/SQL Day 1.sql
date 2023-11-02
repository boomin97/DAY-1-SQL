
SELECT *
FROM actor ;

-- SELECT first_name and last_name
-- FROM actor TABLE
SELECT first_name, last_name
FROM actor;


-- Query first_name which equals 'Nick'
-- Using the WHERE Clause
SELECT first_name, last_name
FROM actor
WHERE first_name = "Nick";


-- Query first_name which equals 'Nick'
-- Using LIKE clause
-- NOTE: ( = ) is looking for a literal string
-- while the LIKE Clause allows use for wildcards
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE "Nick"


-- Using LIKE Clause and WILD CARD ( % )
-- Get all J names
SELECT first_name,last_name
FROM actor
WHERE first_name LIKE 'J%';


-- Single Character Wild Card ( _ )
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K___';


-- Query for all first_names that start with 'K__%' has two letters, anything goes after
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__%';


----- Comparasion Operators:
-- = Equals to
-- > Greater Than
-- < Less Than
-- >= Greater Than or Equal to
-- <= Less Than or Equal to
-- <> Not equals

-- Using Comparasion Operators with the Payment Table
SELECT * FROM payment;


-- Query WHERE amount GREATER THAN $10.
SELECT amount
FROM payment
WHERE amount >10;

-- Query amounts BETWEEN $10-$15
-- NOTE: When using BETWEEN both values are inclusive

SELECT amount
FROM payment 
WHERE amount BETWEEN 10 and 15;

-- Order the payments by amount
-- Using the ORDER BY
-- ASC for ascending order (Default)
-- DESC for decending order
SELECT amount
FROM payment
ORDER BY amount DESC;

-- Query all payments NOT EQUAL to 2.99
SELECT amount
FROM payment 
WHERE amount <>2.99;


----- Aggregate Functions
-- MIN()
-- MAX()
-- SUM()
-- AVG()
-- COUNT()

-- Query the SUM of amounts GREATER THAN OR EQUAL TO 5.99
SELECT SUM(amount) 
FROM payment 
WHERE amount >= 5.99;


-- Query the AVG of amounts GREATER THAN OR EQUAL TO 5.99
SELECT AVG(amount)
 FROM payment 
 WHERE amount >= 5.99;


-- Query the COUNT of amounts GREATER THAN OR EQUAL TO 5.99
SELECT COUNT(amount)
FROM payment 
WHERE amount >= 5.99;

-- Query to display the count of DISTINCT amounts paid
SELECT COUNT(DISTINCT amount)
FROM payment;

-- Query to display the MIN paid using alias
SELECT MIN(amount) AS min_amount_paid
FROM payment;

-- Query to display the MAX paid using alias
SELECT MAX(amount) AS min_amount_paid
FROM payment;

-- GROUP BY (Used with aggregate functions)
SELECT customer_id,SUM(amount), payment_date
FROM payment;
GROUP BY customer_id;


-- Query the customer that paid the most
SELECT SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

SELECT customer_id, SUM(amount)
FROM payment
WHERE amount > 10
GROUP BY customer_id
HAVING SUM(amount) > 100;













--1. How many actors are there with the last name ‘Wahlberg’?
SELECT first_name,last_name
FROM actor 
WHERE last_name = 'Wahlberg';
--Reasoning -- There's two actors with that last name.

--2.How many payments were made between $3.99 and $5.99?
SELECT COUNT(*)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
--Reasoning -- ther's about zero.

--What film does the store have the most of? (search in inventory)
SELECT COUNT(inventory_id),film_id
FROM inventory
GROUP BY film_id
ORDER BY COUNT(inventory_id)DESC;
--reasoning there's a lot of films with the count of 6. 

--How many customers have the last name ‘William’?
SELECT COUNT(*)
FROM customers
WHERE last_name = 'William';
--reasoning, there's 0 customers.

--What store employee (get the id) sold the most rentals?
SELECT staff_id, COUNT(rental_id) AS rental_date
FROM rental
GROUP BY staff_id
ORDER BY rental_date DESC;
--reasoning ... employee number 1 had more bookings

--How many different district names are there?

SELECT COUNT(DISTINCT City) AS distinct_CITY_count
FROM City;
-- there is about 599 different districts.

--What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(actor_id) AS actor_count
FROM film_actor
GROUP BY film_id
ORDER BY actor_count DESC;

-- reasoning film 508 has the most actors in it 

--From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(customer_id)
FROM customer
GROUP BY store_id = 1 and last_name like "%es";


--How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)
SELECT amount, COUNT(rental_id) AS rental_count
FROM payment 
WHERE customer_id BETWEEN 380 and 430 
GROUP BY amount
HAVING COUNT(rental_id) > 250;
--reasoning, only 3 customers 

--Within the film table, how many rating categories are there? And what rating has the most movies total?
SELECT COUNT(category_id)
FROM rating
GROUP BY category_id
ORDER BY SUM(amount) DESC

--??