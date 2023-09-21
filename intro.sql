SELECT customer_id, AVG(amount), MAX(amount)
FROM orders
GROUP BY customer_id
ORDER BY AVG(amount) DESC
LIMIT 2


/* SELECT richiede i dati da vedere */

SELECT column_list FROM table_name WHERE condition;

