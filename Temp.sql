USE SUBQUERY;

SELECT MAX(LENGTH(Name)), MIN(LENGTH(NAME))
FROM Employee;

SELECT e.*, LENGTH(NAME),
row_number() over (ORDER BY LENGTH(NAME)) as rn,
FIRST_VALUE(Name) over (ORDER BY LENGTH(NAME)),
last_value(Name) over (ORDER BY LENGTH(NAME))
FROM Employee e;

SELECT DISTINCT Dept
FROM EMPLOYEE
WHERE Dept rlike '^[aeiou].*';

SELECT DISTINCT Dept
FROM EMPLOYEE
WHERE Dept rlike '*[aeiou]$';

SELECT DISTINCT Dept
FROM EMPLOYEE
WHERE Dept rlike '^[AEIOU][AEIOU]$';

SELECT DISTINCT Dept, Name, RIGHT(Name,3)
FROM EMPLOYEE
ORDER BY RIGHT(Name,3) ASC, Name ASC;

SELECT Dept, COUNT(Name)
FROM EMPLOYEE
GROUP BY Dept;