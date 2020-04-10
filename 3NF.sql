CREATE DATABASE third_nf;

USE third_nf;

CREATE TABLE IF NOT EXISTS Students (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    number INTEGER NOT NULL,
    clASs CHAR(3) NOT NULL
);

CREATE TABLE IF NOT EXISTS Subjects (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS MarkWords (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    rangeStart NUMERIC(3, 2) NOT NULL,
    rangeEnd NUMERIC(3, 2) NOT NULL,
    markASWord VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS StudentMarks (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    studentId INTEGER NOT NULL,
    subjectId INTEGER NOT NULL,
    examDate DATE NOT NULL,
    studentMark NUMERIC(3, 2) NOT NULL,
    FOREIGN KEY (studentId) REFERENCES Students(id),
    FOREIGN KEY (subjectId) REFERENCES Subjects(id)
);

INSERT INTO Students VALUES (NULL, 'Alex', 1, '11a');
INSERT INTO Students VALUES (NULL, 'Boris', 2, '11a');
INSERT INTO Students VALUES (NULL, 'Ceco', 3, '11a');
INSERT INTO Students VALUES (NULL, 'Dido', 4, '11a');
INSERT INTO Students VALUES (NULL, 'Emil', 5, '11a');
INSERT INTO Students VALUES (NULL, 'Filip', 6, '11a');

INSERT INTO Subjects VALUES (NULL, 'Bulgarian');
INSERT INTO Subjects VALUES (NULL, 'English');

INSERT INTO MarkWords VALUES (NULL, 2.00, 2.50, 'Poor');
INSERT INTO MarkWords VALUES (NULL, 2.50, 3.50, 'Intermidiate');
INSERT INTO MarkWords VALUES (NULL, 3.50, 4.50, 'Good');
INSERT INTO MarkWords VALUES (NULL, 4.50, 5.50, 'Very Good');
INSERT INTO MarkWords VALUES (NULL, 5.50, 6.00, 'Excellent');

INSERT INTO StudentMarks VALUES (NULL, 1, 1, '2020-03-03', '5.75');
INSERT INTO StudentMarks VALUES (NULL, 1, 2, '2020-03-03', '3.20');
INSERT INTO StudentMarks VALUES (NULL, 2, 1, '2020-03-03', '6.00');
INSERT INTO StudentMarks VALUES (NULL, 2, 2, '2020-03-03', '5.60');
INSERT INTO StudentMarks VALUES (NULL, 3, 1, '2020-03-03', '2.90');
INSERT INTO StudentMarks VALUES (NULL, 3, 2, '2020-03-03', '4.30');
INSERT INTO StudentMarks VALUES (NULL, 4, 1, '2020-03-03', '5.15');
INSERT INTO StudentMarks VALUES (NULL, 4, 2, '2020-03-03', '4.90');

-- Име на ученик, име на предмет, дата на изпитване, оценка с думи, оценка с цифри, където оценката е над 4.00

SELECT st.name AS studentName, subj.name AS subjectName, sm.examDate, sm.studentMark, mw.markAsWord FROM Students AS st 
INNER JOIN StudentMarks AS sm ON st.id = sm.studentId 
INNER JOIN Subjects AS subj ON subj.id = sm.subjectId 
INNER JOIN MarkWords AS mw ON sm.studentMark BETWEEN mw.rangeStart AND mw.rangeEnd 
WHERE sm.studentmark > 4;

-- Име, номер в класа и клас на всички ученици, които нямат оценки

SELECT * FROM Students WHERE Students.id NOT IN (SELECT studentId FROM StudentMarks);