use college;

CREATE TABLE Dept(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO Dept VALUES
(101,"CS"),
(102,"ECE"),
(103,"Mechanical");

SELECT * from Dept;

CREATE TABLE teacher(
 id INT PRIMARY KEY,
 name VARCHAR(50),
 dept_id INT, 
 FOREIGN KEY(dept_id) REFERENCES Dept(id)
 ON UPDATE CASCADE
 ON DELETE CASCADE
); 

INSERT INTO teacher values
(101,"Hemanth",101),
(102,"Sai",102); 

INSERT INTO teacher values
(103,"Chandra",150); 


