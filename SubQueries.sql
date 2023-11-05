CREATE DATABASE IF NOT EXISTS SubQuery;

USE SUBQUERY;

SHOW TABLES;

CREATE TABLE IF NOT EXISTS Employee(
	Id INT PRIMARY KEY,
    Name VARCHAR(50),
    Dept VARCHAR(20),
    Salary INT
);

INSERT INTO Employee VALUES
(1, 'John Doe', 'HR', 50000),
    (2, 'Jane Smith', 'IT', 60000),
    (3, 'Bob Johnson', 'Finance', 55000),
    (4, 'Alice Brown', 'Marketing', 52000),
    (5, 'Michael Lee', 'HR', 51000),
    (6, 'Sarah Davis', 'IT', 58000),
    (7, 'William Wilson', 'Finance', 54000),
    (8, 'Linda Moore', 'Marketing', 52500),
    (9, 'David Taylor', 'HR', 49500),
    (10, 'Emily Anderson', 'IT', 61000),
    (11, 'James Jones', 'Finance', 54500),
    (12, 'Mary White', 'Marketing', 52800),
    (13, 'Robert Harris', 'HR', 50500),
    (14, 'Jennifer Martin', 'IT', 59000),
    (15, 'Charles Clark', 'Finance', 56000),
    (16, 'Patricia Garcia', 'Marketing', 53500),
    (17, 'Joseph Martinez', 'HR', 49500),
    (18, 'Susan Rodriguez', 'IT', 59500),
    (19, 'Thomas Lopez', 'Finance', 55000),
    (20, 'Nancy Hall', 'Marketing', 52300),
    (21, 'Daniel Young', 'HR', 50500),
    (22, 'Karen Turner', 'IT', 60500),
    (23, 'Richard Hernandez', 'Finance', 54000),
    (24, 'Betty King', 'Marketing', 51500),
    (25, 'Paul Scott', 'HR', 50000);
    
SELECT * FROM Employee;

-- Scalar SubQuery
-- It always returns 1 row and 1 column 

SELECT e.*
FROM Employee as e
WHERE e.Salary > (SELECT avg(Salary) from Employee);

-- OR

SELECT e.*
FROM Employee as e
JOIN (SELECT avg(Salary) as Salary FROM Employee) as emp
ON e.Salary > emp.Salary;


-- Multiple Row Subquery
-- Subquery which returns 1 column/ multiple columns and multiple rows




-- Correlated Subquery
-- A sub query which is related to the outer query
-- Find the employees whose salary is greater than the avg salary of each department

SELECT e.*, Emp.avg_salary
FROM Employee as e
JOIN (SELECT Dept, avg(Salary) as avg_salary FROM Employee GROUP BY Dept) as Emp
ON e.Dept = Emp.Dept
WHERE e.Salary > Emp.avg_salary;
 
SELECT * 
FROM Employee e1
where Salary > (
	select avg(Salary) from Employee e2
    where e2.Dept = e1.Dept
);

-- Find the department who do not have any employees

SELECT e.* 
from Employee e;