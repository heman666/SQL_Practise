use college;

SELECT * FROM Student;

SET SQL_SAFE_UPDATES = 0;

UPDATE Student
SET grade = "O"
WHERE grade = "A";

SELECT * FROM Student;