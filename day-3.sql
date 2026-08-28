-- CTE FUnction
WITH department_avg AS (
    SELECT department_id,
           AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT e.name, e.salary
FROM employees e
JOIN department_avg d
    ON e.department_id = d.department_id
WHERE e.salary > d.avg_salary;

-- Window Function

SELECT name , department_id , salary , AVG(salary) OVER (PARTITION BY department_id ) AS avg_salary FROM employees;

SELECT
    name,
    department_id,
    salary,
    ROW_NUMBER() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS row_num
FROM employees;


SELECT name , salary ,department_id , dense_rank() OVER ( ORDER BY salary DESC ) AS Dense FROM employees;

SELECT name ,salary , LAG(salary) OVER(ORDER BY salary ) AS previous_salary FROM employees; 

SELECT name , salary , LEAD(salary) OVER (ORDER BY salary) AS next_salary FROM employees;


SELECT name , salary, FIRST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY salary DESC)  AS highest_salary_in_department FROM employees;

SELECT name , salary, LAST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY salary )  AS lowest_salary_in_department FROM employees;