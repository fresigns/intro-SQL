-- Online SQL Editor to Run SQL Online.
-- Use the editor to create new tables, insert data and all other SQL operations.

-- commenti
  
/* 
SELECT
FROM tabella di riferimento 
*/

-- SELECT age
-- FROM customers 

-- SELECT DISTINCT item
-- FROM orders;

-- SELECT DISTINCT country
-- FROM customers

-- SELECT DISTINCT item, amount
-- FROM orders
-- ORDER BY amount DESC; /* DESCEND */

-- SELECT first_name, last_name
-- FROM customers
-- ORDER BY last_name, first_name; 

/* 
se ci sono più persone con una stessa proprietà, 
mettere due order by che andranno in ordine di gerarchia:
quello che metto per primo ha la priorità. 
*/

-- SELECT DISTINCT item, amount
-- FROM orders
-- ORDER BY amount DESC
-- LIMIT 3;

-- SELECT *  
/* seleziona tutto */
-- FROM customers
-- WHERE NOT (age > 24 OR country = 'USA')
-- ORDER BY age

-- SELECT * 
-- FROM orders
-- WHERE amount >= 300 AND item != 'Keyboard'

-- SELECT *
-- FROM orders
-- WHERE item in ('Keyboard', 'Mouse')

-- SELECT DISTINCT country
-- FROM customers

-- SELECT COUNT(*)
-- FROM customers 

-- SELECT COUNT(DISTINCT country)
-- FROM customers

-- SELECT COUNT(*)
-- FROM customers
-- WHERE country = 'UK'

-- SELECT COUNT(*)
-- FROM shippings
-- WHERE lower(status) = 'pending'

-- SELECT AVG(age)
-- FROM customers;
/* AVG Average */

-- SELECT MAX(age)
-- FROM customers;

-- SELECT MIN(age)
-- FROM customers;

-- SELECT MIN(age), MAX(age), (MAX(age) - MIN(age)) as Diff
-- FROM customers

-- SELECT country, COUNT(*) as Value
-- FROM customers 
-- GROUP BY country;

-- SELECT country, AVG(age) as Value
-- FROM customers
-- GROUP BY country;

-- SELECT item, SUM(amount)
-- FROM orders
-- GROUP BY item;

SELECT customer_id, AVG(amount), MAX(amount)
FROM orders
GROUP BY customer_id
ORDER BY AVG(amount) DESC
LIMIT 2