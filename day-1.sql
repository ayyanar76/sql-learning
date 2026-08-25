DROP TABLE if EXISTS customers;
DROP TABLE if EXISTS orders;

CREATE TABLE customers(
    customer_id INTEGER PRIMARY KEY,
    name VARCHAR NOT NULL,
    email VARCHAR UNIQUE
);

INSERT INTO customers(customer_id,name,email) VALUES
(1,'Ravi','ravi@gmail.com'),
(2,'Arun','arun@gmail.com'),
(3,'vasanth','vasanth@gmail.com'),
(4,'priya','priya@gmail.com');


CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    amount INTEGER
);

INSERT INTO orders(order_id,customer_id,amount) VALUES
(1,1,700),
(2,1,800),
(3,2,1500),
(4,3,2000);

SELECT * FROM customers;

SELECT name FROM customers;

SELECT * FROM customers WHERE customer_id = 2;


SELECT * FROM customers WHERE customer_id  > 1;

SELECT * FROM customers ORDER BY name DESC;

INSERT INTO customers VALUES(5,'anu','anu@gmail.com');

UPDATE customers 
SET email = 'anu1@gmail.com'
WHERE name = 'anu';

SELECT * FROM customers;

DELETE FROM customers WHERE customer_id = 5;

SELECT * FROM orders WHERE amount > 700;

SELECT amount FROM orders;
