create table if not exists temp(
	id int primary key,
    name varchar(50)
);

ALTER TABLE temp
ADD COLUMN Age INT CHECK(Age > 18);

ALTER TABLE temp
DROP COLUMN Age;

ALTER TABLE temp
RENAME TO temp_table;

ALTER TABLE temp_table
CHANGE COLUMN id stud_id INT;

SELECT * FROM temp_table;

ALTER TABLE temp_table
MODIFY stud_id INT;