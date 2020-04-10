CREATE DATABASE numbers;

USE numbers;

CREATE TABLE IF NOT EXISTS Numbers (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    number INTEGER NOT NULL
);

INSERT INTO Numbers VALUES (NULL, 1), (NULL, 2), (NULL, 3), (NULL, 4), (NULL, 5), (NULL, 6), (NULL, 7);

CREATE TABLE IF NOT EXISTS Fibonacci (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    fibonacci INTEGER NOT NULL
);

INSERT INTO Fibonacci VALUES (NULL, 1), (NULL, 1), (NULL, 2), (NULL, 3), (NULL, 5), (NULL, 8), (NULL, 13);

CREATE TABLE IF NOT EXISTS Primes (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    prime INTEGER NOT NULL
);

INSERT INTO Primes VALUES (NULL, 2), (NULL, 3), (NULL, 5), (NULL, 7), (NULL, 11), (NULL, 13), (NULL, 17);

-- training inner join
SELECT * FROM Numbers AS n INNER JOIN Fibonacci AS f ON n.number = f.fibonacci JOIN Primes AS p on n.number = p.prime;

-- training left join
SELECT * FROM Fibonacci AS f LEFT JOIN Primes AS p ON f.fibonacci = p.prime;

-- Just have 2 questions:

-- What is the point of having right joins since right-joining table 1 and table 2 is the same as left-joining table 2 and table 1?
-- The only possible reason I could think of is that it was easy to implement it after implementing left join,
-- but I still can't find any particular reason to use it.

-- In the presentation you said that joining lines with the same id for example will right that same id multiple times in every occasion.
-- Is there any difference in this exact behaviour between inner, left and right joins? 