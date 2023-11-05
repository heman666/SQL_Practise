CREATE DATABASE IF NOT EXISTS college;
use college;

CREATE TABLE Student(
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
	city VARCHAR(20)
);

INSERT INTO Student VALUES
(101, "anil",78, "C","Pune"),
(102, "bhumika",93, "A","Mumbai"),
(103, "chetan",85, "B","Mumbai"),
(104, "dhruv",96, "A","Delhi"),
(105, "emanuel",12, "F","Delhi"),
(106, "farah",82, "B","Delhi");

SELECT city, AVG(marks) FROM Student group by city ORDER BY AVG(marks);

SELECT count(name),city FROM Student Group By city Having max(marks) > 80;

SELECT count(name),city FROM Student  where city = 'Mumbai' Group By city;
