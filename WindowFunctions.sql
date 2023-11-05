CREATE DATABASE IF NOT EXISTS WindowFunctions;

USE WindowFunctions;

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
    
    SELECT max(Salary) FROM Employee;
    
    SELECT Dept, max(Salary)
    FROM Employee 
    GROUP BY Dept;
    
    SELECT e.*, max(Salary) over () as max_salary
    FROM Employee as e; 
    
    SELECT e.*, max(Salary) over (partition by Dept) as max_salary
    FROM Employee as e; 
    
 #Row_number, rank, dense_rank,lead and lag
 
 SELECT e.*,
 row_number() over () as rn
 FROM Employee as e;
 
  SELECT e.*,
 row_number() over (partition by Dept) as rn
 FROM Employee as e;
 
  SELECT e.*,
 row_number() over (partition by Dept order by Salary DESC) as rn
 FROM Employee as e;
 
 # Get the first 2 employees who joined the company
 
 SELECT * FROM (
  SELECT e.*,
 row_number() over (partition by Dept order by Id) as rn
 FROM Employee as e) as Emp
WHERE rn < 3;

# Fetch the top 3 employees in each department earning the max salary

SELECT * FROM (
SELECT e.*, 
RANK() over (partition by Dept Order by Salary DESC) as rn 
FROM Employee as e) as Emp
WHERE rn < 4; 

 -- Fetch a query to display if the salary of an employee is higher, lower or equal to the previous employee
   
SELECT Emp.*, case when Emp.Salary > Emp.prev_salary then "Higher" 
when Emp.Salary < Emp.prev_salary then "Lower"
ELSE "Equal" end as Compare
FROM (
SELECT e.Id, e.Salary,
lag(Salary) over (ORDER BY Id) as prev_salary 
FROM Employee as e) as Emp;     


SELECT Emp.*, case when Emp.Salary > Emp.prev_salary then "Higher" 
when Emp.Salary < Emp.prev_salary then "Lower"
ELSE "Equal" end as Compare
FROM (
SELECT e.Id, e.Salary,
lag(Salary,2,0) over (ORDER BY Id) as prev_salary 
FROM Employee as e) as Emp;  