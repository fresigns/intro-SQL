-- SELECT customer_id, AVG(amount), MAX(amount)
-- FROM orders
-- GROUP BY customer_id
-- ORDER BY AVG(amount) DESC
-- LIMIT 2


/* SELECT richiede i dati da vedere */

-- SELECT column_list FROM table_name WHERE condition;

/* 

Linguaggio strutturato di query

DQL: Data Query Language
DML: Data Manipulation Language

CRUD
C: Create
R: Read
U: Update
D: Delate

*/ 

-- UPDATE customers
-- SET age = 35; /*se non specifico il cliente lo cambia a tutti*/


-- UPDATE customers
-- SET age = 35
-- WHERE customer_id = 1;

/* 
WHERE first_name = 'John' and last_name = 'Doe';
meglio specificare l'id per potere identificare il cliente giusto (così è inequivocabile!)
*/

-- UPDATE customers
-- SET 
-- 	age = 37,
--     first_name = 'John'
-- WHERE customer_id = 1;

-- UPDATE customers
-- SET age = (
--     SELECT age
--     FROM customers
--     WHERE customer_id = 4
--  )
-- WHERE customer_id = 1;

/* modificare il prezzo di keyboard, rendendolo identico a quello di mouse */
-- UPDATE Orders
-- SET amount = (
-- 	SELECT amount
--  	FROM Orders
--   	WHERE item = 'Mouse'
-- ) /* sottoquery / subquery */ 
-- WHERE item = 'Keyboard'


/* paginazione */
-- SELECT *
-- FROM Orders
-- LIMIT 2
-- OFFSET 2 
/* OFFSET in questo caso parte dal 3 in poi.. */

/* seleziona tutti tranne il c_id 4 */
-- SELECT *
-- FROM Orders
-- WHERE not customer_id = 4
/* ----------------------------- */
/* svuota tutto il db (lascia la tabella vuota) */ 
-- DELETE FROM customers; 
/* ----------------------------- */
/* elimina solo il primo customer_id */
-- DELETE FROM Customers
-- WHERE customer_id = 1;
/* ----------------------------- */
-- DELETE FROM Orders
-- WHERE item = 'Keyboard';
/* avendo cancellato il customer 1
la conseguenza è che non ha più a disposizione il suo ordine
risultato: the result set is empty. 
Questo si chiama Cascade / Cascading */

/* INSERIMENTI */

/* aggiungo il customer Mario Rossi */
-- INSERT INTO Customers(customer_id, age, country, first_name, last_name)
-- VALUES(6, 40, 'IT', 'Mario', 'Rossi');

-- SELECT order_id, item, amount, 6
-- FROM Orders
-- WHERE customer_id = 4

-- INSERT INTO Customers(customer_id, first_name, last_name)
-- VALUES(7, 'Pippo', 'Lintonaco')
--NULL -> UNKNOWN, SCONOSCIUTO

-- SELECT *
-- FROM Customers
-- WHERE age = null
/* the result set is empty */

-- SELECT 5 = 5 /* 1 = TRUE */
-- SELECT 5 = 6 /* 0 = FALSE */
-- SELECT 5 = null /* UNKNOWN */

-- SELECT null = null; /* UNKNOWN */

SELECT *
FROM Customers
WHERE age IS null
/* IS si utilizza solo con NULL */

Logica binaria: TRUE, FALSE
Logica ternaria: TRUE, FALSE, NULL(UNKNOWN)
NULL /* UNKNOWN, SCONOSCIUTO */

UPDATE Customers
SET country = null
WHERE customer_id = 4;

SELECT customer_id
FROM Orders
WHERE item = 'Keyboard'

/* filtrare la ricerca */
SELECT customer_id
FROM Customers
WHERE country IS 'USA'

/* aggiorno con UPDATE*/
-- UPDATE Customers
-- SET country = 'IT'
-- WHERE customer_id = 4;

-- SELECT country
-- FROM Customers
-- WHERE customer_id IN ( 
--     SELECT customer_id
--     FROM Orders
--     WHERE item = 'Keyboard'
-- );

/* IN = include */

/* Seleziono solo le spedizioni in sospeso */
-- SELECT customer
-- FROM Shippings
-- WHERE status = 'Pending'
/* ----------------------------- */

/* Seleziono solo le spedizioni in sospeso, prendendo in dettaglio anche il customer_id  */
-- SELECT *
-- FROM customers
-- WHERE customer_id IN (
--     SELECT customer 
--     FROM Shippings
--     WHERE status = 'Pending'
-- );

/* ----------------------------- */

/* Seleziono solo le spedizioni in sospeso */
-- SELECT * 
-- FROM customers 
-- WHERE customer_id IN /* IN => .includes() */
-- (
--  	SELECT customer_id
--   	FROM Orders
--   	WHERE amount > 350
-- ) /* lista/array di valori nell'includes */

/* ----------------------------- */

/*
----------------------------- ESERCIZIO 1 -----------------------------
Per tutti gli ordini voglio vedere.. 
1) Oggetto acquistato
2) soldi spesi per quell'oggetto
3) Nome e Cognome del cliente

RISULTATO: 
item
amount
first name
last name
*/

SELECT * 
FROM Orders, Customers
WHERE Orders.customer_id = customers.customer_id
/* ------------------------------------------------------------------ */

SELECT orders.item, orders.amount, customers.first_name, customers.last_name 
FROM Orders, Customers
WHERE Orders.customer_id = customers.customer_id

/* ----------------------------- */
/* FROM Orders as o, Customers as c
gli assegno degli ALIAS */
SELECT o.item, o.amount, c.first_name, c.last_name 
FROM Orders as o, Customers as c
WHERE Orders.customer_id = customers.customer_id
/* posso anche omettere AS */

/* ----------------------------- */
----------------------------- ESERCIZIO 2 -----------------------------
/* Vedere per tutte le spedizioni 
id
stato
nazionalità cliente
*/
SELECT s.shipping_id, s.status, c.country
FROM Shippings as s, Customers as C
WHERE s.customer = c.customer_id
/* solitamente NON si usa questo metodo*/
/* prodotto cartesiano (vedi assets) */
/* ----------------------------- */
---------------------------- ESERCIZIO 2 V2 ----------------------------
SELECT s.shipping_id, s.status, c.country, c.first_name, c.last_name 
FROM Shippings as s
JOIN Customers as C 
ON s.customer = c.customer_id;

/* JOIN / unire, congiungere */

SELECT o.item, s.shipping_id, s.status, c.country, c.first_name, c.last_name 
FROM Shippings as s
JOIN Customers as C 
ON s.customer = c.customer_id
JOIN Orders as O;

/* DDL Data Definition Language */
/* aggiungi tabella */
ALTER TABLE customers
ADD column telephone VARCHAR(50);
/* ----------------------------- */
ALTER TABLE customers
ADD column is_married boolean default false;
/* ----------------------------- */
/* elimina colonna */
ALTER TABLE customers
DROP column is_married;
/* ----------------------------- */

SELECT c.first_name, c.last_name, o.item 
FROM Customers as C JOIN Orders as O ON c.customer_id = o.customer_id;

/*LEFT JOIN*/
SELECT c.first_name, c.last_name, o.item 
FROM Customers as C LEFT JOIN Orders as O ON c.customer_id = o.customer_id;

/*INNER JOIN*/
SELECT c.first_name, c.last_name, o.item 
FROM Customers as C INNER JOIN Orders as O ON c.customer_id = o.customer_id;

/*CREARE TABELLE*/

CREATE TABLE addresses (
  address_id int,
  customer_id int,
  city VARCHAR(256),
  zip_code VARCHAR(16),
  street VARCHAR(256),
  number int
);
/* devo indicare quali colonne voglio */

CREATE TABLE addresses (
  address_id int primary key,
  customer_id int,
  city VARCHAR(256) not null,
  zip_code VARCHAR(16) not null,
  street VARCHAR(256) not null,
  number int,
  
  unique(customer_id, city, zip_code, street, number),
  foreign key(customer_id) references Customers(customer_id)
);

/* ----------------------------- */
/* Inserire dati dentro la tabella */
INSERT INTO addresses(address_id, city, zip_code, street)
VALUE(1, 'Chiavari', 'Via Ugolini', '16042')

