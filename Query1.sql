CREATE DATABASE IF NOT EXISTS College;

USE College;

CREATE TABLE IF NOT EXISTS Student(
id INT PRIMARY KEY,
name VARCHAR(50),
age INT NOT NULL
);

INSERT INTO Student values(
	1,
    "Hemanth",
    23
);

INSERT INTO Student(Id, Age) VALUES(
	2,
    25
);

SELECT * FROM Student;