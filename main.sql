-- Question #1.
-- list all customers who live in Texas using joins
SELECT * FROM customers
JOIN states
ON customers.state_id = states.id
WHERE states.name = 'Texas';

-- Question #2.
-- Query to get all payments above $6.99 with the customers full name
SELECT customers.first_name, customers.last_name, payments.amount
FROM customers
JOIN payments
ON customers.id = payments.customer_id
WHERE payments.amount > 6.99;

-- Question #3.
-- Query that shows all customers names who have made payments over $175 using subqueries
SELECT first_name, last_name
FROM customers
WHERE id IN (SELECT customer_id FROM payments WHERE amount > 175);

-- Question #4.
-- Query that lists all customers that live in Nepal using city table
SELECT first_name, last_name
FROM customers
JOIN cities

-- Question #5.
-- Query that lists which staff member had the most transactions
SELECT staff.first_name, staff.last_name, COUNT(transactions.id) as transaction_count
FROM staff
JOIN transactions
ON staff.id = transactions.staff_id
GROUP BY staff.id
ORDER BY transaction_count DESC
LIMIT 1;

-- Question #6.
-- Query that lists how many movies of each rating are there
SELECT rating, COUNT(id) as movie_count
FROM movies
GROUP BY rating;

-- Question #7.
-- Query that lists all customers who have made a single payment above $6.99 using subqueries
SELECT first_name, last_name
FROM customers
WHERE id IN (SELECT customer_id FROM payments GROUP BY customer_id HAVING COUNT(id) = 1 AND MAX(amount) > 6.99);

-- Question #8.
-- Query that lists how many free rentals our stores give to customers
SELECT store_id, COUNT(id) as free_rental_count
FROM rentals
WHERE amount = 0
GROUP BY store_id;