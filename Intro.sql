CREATE DATABASE school;

USE school;

CREATE TABLE students (
	-- auto_increment -> automatic increment of ids as integers
    -- primary key -> unique, the way the row is recognised  
    Id INTEGER AUTO_INCREMENT PRIMARY KEY,     
    -- not null -> upon creating row, we have to put value     
    -- empty string is also a value     
    Name VARCHAR(150) NOT NULL,     
    Class VARCHAR(3) NOT NULL,     
    -- NUMERIC(a, b)  -- a -> count of digits  
    -- b -> count of digits after the comma     
    EntranceExamResult NUMERIC(3, 2),     
    Birthday DATE,     
    EGN CHAR(10) 
);

INSERT INTO students VALUE (NULL, 'Ognian Baruh', '11A', 6.0, '2002-10-28', NULL);
INSERT INTO students VALUE (NULL, 'Ivan Ivanov', '11A', 5, '2002-07-31', NULL);
INSERT INTO students VALUE (NULL, 'Alex Petrov', '11A', 5.35, '2002-03-14', NULL);
INSERT INTO students VALUE (NULL, 'Mariq Petrova', '11A', 4.3, '2002-04-20', NULL);
INSERT INTO students VALUE (NULL, 'Joan Petrov', '11A', 5.9, '2002-12-17', NULL);
INSERT INTO students VALUE (NULL, 'Boris Borisov', '11A', 5.30, '2002-01-10', NULL);
INSERT INTO students VALUE (NULL, 'Simeon Alexandrov', '11A', 5.42, '2002-05-30', NULL);
INSERT INTO students VALUE (NULL, 'Ivan Nikolov', '11A', 5.5, '2002-03-23', NULL);
INSERT INTO students VALUE (NULL, 'Nikolaj Petrov', '11A', 3.4, '2002-11-04', NULL);


SELECT * FROM students;

UPDATE students SET EntranceExamResult = 1.1 * EntranceExamResult;

UPDATE students SET EntranceExamResult = 6 WHERE EntranceExamResult > 6;

-- auto_increment never goes back and returns +1 of the latest value so far

-- % -> any symbols in that part of the string
-- LIKE -> checks for substring in field
SELECT * FROM students WHERE (Name LIKE '% Petrov' OR Name LIKE '% Petrova') AND EntranceExamResult > 4;


