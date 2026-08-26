DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS client;

CREATE TABLE employees (id int, name VARCHAR , salary int ,department_id int);

INSERT INTO employees VALUES 
(1,'Arun',30000,10) ,
(2,'Bala',50000,20) ,
(3,'Kumar',70000,10),
(4,'Ravi',40000,30) ,
(5,'Siva',60000,20) ,
(6,'Mani', 80000,30);

CREATE TABLE client(id int,name VARCHAR);

INSERT INTO client VALUES
(1,'Arun') ,
(2,'Bala') ,
(3,'Kumar');


CREATE TABLE orders (id int , clint_id int);

INSERT INTO orders VALUES 
(10,1),
(20,2),
(30,1);

CREATE TABLE department(id int , name VARCHAR);

INSERT INTO department VALUES
(10,'IT'),
(20,'HR'),
(30,'SALES');

SELECT AVG(salary) FROM employees ;
SELECT name,salary FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT name,salary FROM employees WHERE salary < (SELECT AVG(salary) FROM employees);

SELECT name,salary FROM employees WHERE salary  =  (SELECT MAX(salary) FROM employees);

SELECT name,salary FROM employees WHERE salary  =  (SELECT MIN(salary) FROM employees);


SELECT e.name from employees e WHERE e.department_id IN (SELECT d.id FROM department d WHERE d.name IN ('IT','HR') );

SELECT e.name from employees e WHERE e.department_id IN (SELECT d.id FROM department d WHERE d.name IN ('SALES') );

SELECT c.name FROM client c WHERE  EXISTS (SELECT 1 FROM orders o WHERE o.clint_id = c.id);

SELECT c.name FROM client c WHERE NOT EXISTS (SELECT 1 FROM orders o WHERE o.clint_id = c.id);


SELECT name from employees e WHERE salary > (SELECT AVG(e2.salary) FROM employees e2 WHERE e2.department_id = e.department_id);

SELECT name from employees e WHERE salary = (SELECT MAX(e2.salary) FROM employees e2 WHERE e2.department_id = e.department_id);