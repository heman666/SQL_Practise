CREATE DATABASE IF NOT EXISTS Company_XYZ;

use Company_XYZ;

CREATE TABLE IF NOT EXISTS Employee(
	Employee_ID INT UNIQUE,
    Name VARCHAR(50),
	Age INT CHECK(Age >= 21)
);

INSERT INTO Employee VALUES(
	1, 'Hemanth', 25
);

INSERT INTO Employee VALUES
	(2, 'Ram',28),
    (3,'Shyam',35);
    
SELECT * FROM Employee;