CREATE DATABASE IF NOT EXISTS school;

USE school;

CREATE TABLE IF NOT EXISTS Students (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) UNIQUE,
    class VARCHAR(3)
);

INSERT INTO Students VALUE(NULL, 'Ognian Baruh', '11A');
INSERT INTO Students VALUE(NULL, 'Ivan Petrov', '11A');
INSERT INTO Students VALUE(NULL, 'Alex Dimitrov', '11A');

CREATE TABLE IF NOT EXISTS Subjects (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) UNIQUE
);

INSERT INTO Subjects VALUE(NULL, 'Bulgarian');
INSERT INTO Subjects VALUE(NULL, 'Mathematics');
INSERT INTO Subjects VALUE(NULL, 'DBMS');

CREATE TABLE IF NOT EXISTS FinalMarks (
	studentId INTEGER NOT NULL,
    subjectId INTEGER NOT NULL,
    mark INTEGER(1) NOT NULL,
    PRIMARY KEY(studentId, subjectId),
    FOREIGN KEY (studentId) REFERENCES Students(id) ON DELETE CASCADE,
    FOREIGN KEY (subjectId) REFERENCES Subjects(id) ON DELETE NO ACTION
);

INSERT INTO FinalMarks VALUE(1, 1, 5);
INSERT INTO FinalMarks VALUE(1, 2, 6);
INSERT INTO FinalMarks VALUE(1, 3, 6);
INSERT INTO FinalMarks VALUE(2, 1, 6);
INSERT INTO FinalMarks VALUE(2, 2, 4);
INSERT INTO FinalMarks VALUE(2, 3, 5);
INSERT INTO FinalMarks VALUE(3, 1, 4);
INSERT INTO FinalMarks VALUE(3, 2, 4);
INSERT INTO FinalMarks VALUE(3, 3, 2);

-- Names of students who failed a subject:
SELECT s.name FROM Students AS s INNER JOIN FinalMarks AS f ON s.id = f.studentId WHERE f.mark = 2;

-- Names of students who will receive a scholarship (avg >= 5,50):
SELECT studentId, AVG(mark) AS average FROM FinalMarks GROUP BY studentId HAVING average >= 5.5;