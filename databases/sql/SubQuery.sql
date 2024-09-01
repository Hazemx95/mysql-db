-- Active: 1720175661655@@mysql-db@3306@collegeDB
DROP DATABASE IF EXISTS collegeDB;
CREATE DATABASE collegeDB;
use collegeDB;

CREATE TABLE Course
(
    CourseId int primary key , 
    CourseTitle varchar(20) NULL, 
    Cost DECIMAL(10.2) NULL,
    Credit_Hours int NULL 
);

CREATE Table Student
(
    stdid int PRIMARY KEY AUTO_INCREMENT , 
    First_Name VARCHAR(30) NULL , 
    LastName VARCHAR(30) NULL, 
    Depart VARCHAR(10),
    CONSTRAINT stu_id_unique UNIQUE (stdid)
);

CREATE Table Semester
( 
    semesterID VARCHAR(10) PRIMARY KEY ,
    SemesterCode INT NULL , 
    SemsterYear DATE NULL
);

CREATE Table Register
(
    stdid int ,
    CourseId int ,
    semesterID VARCHAR(10), 
    grade VARCHAR(10) , 
    mark VARCHAR(20), 
    FOREIGN KEY (stdid) REFERENCES Student(stdid),
    FOREIGN KEY (CourseId) REFERENCES Course(CourseId),
    FOREIGN KEY (semesterID) REFERENCES Semester(semesterID)
);

--Insert Course Data 
INSERT INTO Course 
VALUES  (1, 'Math' , 10.2, 3), 
        (2, 'Programming', 30.4,4  ), 
        (10, 'OOP',50.22,5   ), 
        (5, 'Database',60.30,2 ),
        (9, 'java',80.00,3  );   
  

TABLE Course;

--Insert Student Data 

INSERT INTO Student(First_Name,LastName,Depart) 
VALUES  ('Ahmed' ,'Mostafa' , 'CS'), 
       ('Omar' ,'Ali' , 'CS'), 
       ('Adham' ,'Tarek' , 'IS'), 
       ('Khaled' ,'Mostafa' , 'IT'), 
       ('Ibrahim' ,'Ame' , 'AI');    

Table Student;

--Insert Semster Data 

INSERT INTO Semester 
VALUES  ('SM01', 1 , '2012-03-24'), 
       ('SM02', 2 , '2012-08-20'), 
       ('SM03', 1 , '2012-05-23'), 
       ('SM04', 2 , '2012-02-5'), 
       ('SM05', 1 , '2012-01-6');

Table Semester;

--Insert Register Data 
INSERT INTO Register 
VALUES  (1, 1, 'SM01', 'A', '92'), 
(1,2, 'SM01', 'B+', '80'),
(1,5, 'SM01', 'C+', '75'),
(2,1, 'SM02', 'A', '90'),
(2,2  , 'SM02', 'B+', '82'),
(3,5  , 'SM01', 'D+', '65'),
(3, 10 , 'SM01', 'C+', '75'),
(1, 10 , 'SM03', 'A', '90'),
(3, 10, 'SM02', 'F', '55'),
(1,  9, 'SM01', 'B+', '82');
      
Table Register;

--Get the Student Information but higher mark
--Sub Query consise of Inner Query and then Outer Query 
--Note In the Sub Query Concept Must be first excute inner query and then excute the outter query
Table Register;
SELECT MAX(mark)from Register;
Select stdid from Register where mark =(SELECT MAX(mark)from Register); 

Select stdid , mark from Register where mark =(SELECT MAX(mark)from Register); 
Select S.stdid , R.mark , S.First_Name from Register AS R JOIN Student AS S ON R.stdid=S.stdid where mark =(SELECT MAX(mark)from Register); 

--Get All the student Information but under condition (higher than the average mark)
SELECT AVG(mark) from Register ;
SELECT stdid, mark from Register where mark > --error need sub query 

SELECT stdid, mark from Register where mark >(SELECT AVG(mark) from Register );


--Get All the Student ID and Name but Register with the Studetn Name Called Ahmed 
Table Student;

SELECT R.CourseId , S.First_Name 
FROM Student AS S
JOIN Register AS R
ON S.stdid = R.stdid
WHERE S.First_Name='Ahmed';

