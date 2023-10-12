CREATE DATABASE [5078_DB];
GO

USE [5078_DB];
GO

CREATE TABLE Courses(
   CourseID INT NOT NULL,
   CourseName VARCHAR(10),
   PRIMARY KEY (CourseID)
);

CREATE TABLE Students(
   StudentID INT NOT NULL,
   FirstName VARCHAR(20),
   LastName VARCHAR(20),
   Age INT,
   CourseID INT,
   PRIMARY KEY (StudentID),
   FOREIGN KEY (CourseID) REFERENCES [Courses](CourseID) 
);


INSERT INTO Courses (CourseID, CourseName)
VALUES (200, 'GEOGRAPHY'),
       (202, 'PHYSICS'),
       (203, 'CHEMISTRY'),
       (204, 'BIOLOGY'),
	   (201, 'ISLAMIYAT');

INSERT INTO Students (StudentID, FirstName, LastName, Age, CourseID)
VALUES
  (1, 'John', 'Doe', 20, 201),
  (2, 'Jane', 'Smith', 22, 202),
  (3, 'Michael', 'Johnson', 19, 203),
  (4, 'Emily', 'Wilson', 21, 204),
  (5, 'David', 'Brown', 23, 201),
  (6, 'Sarah', 'Lee', 20, 202),
  (7, 'Robert', 'Taylor', 22, 203),
  (8, 'Olivia', 'Anderson', 19, 204),
  (9, 'James', 'Harris', 21, 201),
  (10, 'Sophia', 'Clark', 23, 202);

UPDATE students SET Age=22 WHERE StudentID=3
DELETE FROM students WHERE StudentId=2

select * from Courses;
select * from Students;

SELECT * FROM students WHERE Age>20

SELECT Students.StudentID, Students.FirstName, Students.LastName, Courses.CourseName
FROM Students
JOIN Courses ON Students.CourseID = Courses.CourseID;


SELECT COUNT(*) as CountOFStudents FROM students	

SELECT AVG(Age) as AverageAge FROM students

SELECT * FROM students WHERE CourseID=NULL

SELECT Courses.CourseName, COUNT(Students.StudentID) AS StudentCount
FROM Courses
JOIN Students ON Courses.CourseID = Students.CourseID
GROUP BY Courses.CourseName
ORDER BY StudentCount DESC

SELECT * FROM students WHERE Age> (SELECT AVG(Age) FROM students)

SELECT
    Courses.CourseName,
    COUNT(Students.StudentID) AS TotalStudents,
    AVG(Students.Age) AS AverageAge
FROM Courses
LEFT JOIN Students ON Courses.CourseID = Students.CourseID
GROUP BY Courses.CourseName;

SELECT Courses.CourseName
FROM Courses
LEFT JOIN Students ON Courses.CourseID = Students.CourseID
WHERE Students.CourseID IS NULL;

SELECT A.StudentID, A.FirstName, A.LastName, B.StudentID AS SharedStudentID, B.FirstName AS SharedFirstName, B.LastName AS SharedLastName, A.CourseID
FROM Students A
JOIN Students B ON A.CourseID = B.CourseID AND A.StudentID <> B.StudentID;

SELECT Courses.CourseName, MAX(Students.Age) AS Oldest, MIN(Students.Age) AS Youngest
FROM Courses
JOIN Students ON Courses.CourseID = Students.CourseID
GROUP BY Courses.CourseName