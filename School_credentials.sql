CREATE DATABASE 11a_21_school;

use 11a_21_school;

CREATE TABLE Students (
    Id INTEGER AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Num NUMERIC(2),
    Class VARCHAR(3) NOT NULL,
    EntStudentsranceExamResult NUMERIC(3, 2),
    EGN CHAR(10),
    Birthday DATE
);

INSERT INTO Students VALUE (NULL, 'Ognian Baruh', 21, '11A', 6.00, '0250280000', '2002-10-28');