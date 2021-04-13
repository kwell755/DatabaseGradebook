
DROP TABLE IF EXISTS `STUDENTS`;
CREATE TABLE `STUDENTS` (
    `StudentID` int(11) NOT NULL AUTO_INCREMENT,
    `FirstName` varchar(255) DEFAULT NULL,
    `LastName` varchar(255) DEFAULT NULL,
    `Major` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`StudentID`)
);

DROP TABLE IF EXISTS `REGISTRATION`;
CREATE TABLE `REGISTRATION` (
  `StudentID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  PRIMARY KEY (StudentID, CourseID)
);

DROP TABLE IF EXISTS `COURSES`;
CREATE TABLE `COURSES` (

    `CourseID` int(11) NOT NULL AUTO_INCREMENT,
    `CourseName` varchar(255) DEFAULT NULL,
    `Department` varchar(255) DEFAULT NULL,
    `CourseNumber` varchar(255) DEFAULT NULL,
    `Semester` varchar(255) DEFAULT NULL,
    `SchoolYear` int(4) DEFAULT NULL,
    PRIMARY KEY (`CourseID`)
 );

DROP TABLE IF EXISTS `DISTRIBUTION`;
CREATE TABLE `DISTRIBUTION` (
  `DistributionID` int(11) NOT NULL AUTO_INCREMENT,
  `CourseID` int(11) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Percent` int(3) DEFAULT NULL,
  PRIMARY KEY (`DistributionID`),
  FOREIGN KEY (`CourseID`) REFERENCES COURSES(CourseID)
);

DROP TABLE IF EXISTS `ASSIGNMENTS`;
CREATE TABLE `ASSIGNMENTS` (
  `AssignmentID` int(11) NOT NULL AUTO_INCREMENT,
  `DistributionID` int(11) DEFAULT NULL,
  `Instance` int(11) DEFAULT NULL,
  `PointsPossible` int(3) DEFAULT NULL,
  PRIMARY KEY (`AssignmentID`),
  FOREIGN KEY (`DistributionID`) REFERENCES DISTRIBUTION(DistributionID)
);

DROP TABLE IF EXISTS `GRADE`;
CREATE TABLE `GRADE` (
    `StudentID` int(11) NOT NULL,
    `AssignmentID` int(11) NOT NULL,
  	`Points` int(11) DEFAULT 0 NOT NULL,
    PRIMARY KEY (StudentID, AssignmentID),
    FOREIGN KEY (`StudentID`) REFERENCES STUDENTS(StudentID),
    FOREIGN KEY (`AssignmentID`) REFERENCES ASSIGNMENTS(AssignmentID)
);

INSERT INTO `STUDENTS` (FirstName, LastName, Major)
VALUES ('Vasanta', 'Thorsten', 'Computer Science'),
('Pascal', 'Regina', 'Computer Science'),
('Christie', 'Debbie', 'Computer Science'),
('Melissa', 'Dorthy', 'Computer Science'),
('Jenni', 'Quinn', 'Computer Science');

INSERT INTO `COURSES` (CourseID, CourseName, Department, CourseNumber, Semester, SchoolYear)
VALUES (CourseID, 'Database Systems', 'CSCI', '432', 'Spring', 2021),
(CourseID, 'Programming Languages', 'CSCI', '123', 'Fall', 2020),
(CourseID, 'Technical Writing', 'ENGL', '456', 'Spring', 2021),
(CourseID, 'Comp Org', 'CSSI', '769', 'Fall', 2020),
(CourseID, 'Speech', 'ENGL', '658', 'Fall', 2019);


INSERT INTO `REGISTRATION` (StudentID, CourseID)
VALUES (1,2),(1,4),(1,3),(2,2),(2,3),(2,1),(3,1),(3,4),(3,2),(4,4),(4,5),(4,1),(5,1),(5,3),(5,2);


INSERT INTO `DISTRIBUTION` (DistributionID, CourseID, Type, Percent)
VALUES (DistributionID, 1, 'Participation', 50),(DistributionID, 1, 'Homework', 10),(DistributionID, 1, 'Tests', 20),(DistributionID, 1, 'Projects', 20),
(DistributionID, 2, 'Participation', 30),(DistributionID, 2, 'Homework', 30),(DistributionID, 2, 'Tests', 20),(DistributionID, 2, 'Projects', 20),
(DistributionID, 3, 'Participation', 10),(DistributionID, 3, 'Homework', 30),(DistributionID, 3, 'Tests', 20),(DistributionID, 3, 'Projects', 40),
(DistributionID, 4, 'Participation', 15),(DistributionID, 4, 'Homework', 35),(DistributionID, 4, 'Tests', 30),(DistributionID, 4, 'Projects', 20),
(DistributionID, 5, 'Participation', 10),(DistributionID, 5, 'Homework', 20),(DistributionID, 5, 'Tests', 40),(DistributionID, 5, 'Projects', 30);

INSERT INTO `ASSIGNMENTS` (AssignmentID, DistributionID, Instance, PointsPossible)
VALUES (AssignmentID, 1, 1, 100),(AssignmentID, 2, 3, 100),(AssignmentID, 3, 2, 100),(AssignmentID, 4, 1, 100),
(AssignmentID, 5, 1, 100),(AssignmentID, 6, 5, 100),(AssignmentID, 7, 2, 100),(AssignmentID, 8, 2, 100),
(AssignmentID, 9, 1, 100),(AssignmentID, 10, 2, 100),(AssignmentID, 11, 1, 100),(AssignmentID, 12, 1, 100),
(AssignmentID, 13, 1, 100),(AssignmentID, 14, 1, 100),(AssignmentID, 15, 1, 100),(AssignmentID, 16, 2, 100),
(AssignmentID, 17, 1, 100),(AssignmentID, 18, 1, 100),(AssignmentID, 19, 1, 100),(AssignmentID, 20, 1, 100);


INSERT INTO `GRADE` (StudentID, AssignmentID, Points)
VALUES (1, 6, 80), (1, 7, 80), (1, 8, 80),(1, 9, 61), (1, 10, 70), (1, 11, 85), (1, 12, 66), (1, 13, 58), (1, 14, 97), (1, 15, 87), (1, 16, 85),
(2, 1, 77), (2, 2, 98), (2, 3, 75), (2, 4, 80), (2, 5, 74), (2, 6, 94), (2, 7, 90), (2, 8, 84), (2, 9, 83), (2, 10, 74), (2, 11, 92), (2, 12, 90),
(3, 1, 94), (3, 2, 92), (3, 3, 91), (3, 4, 90), (3, 5, 93), (3, 6, 82), (3, 7, 95), (3, 8, 83), (3, 13, 73), (3, 14, 80), (3, 15, 100), (3, 16, 80),
(4, 1, 96), (4, 2, 80), (4, 3, 70), (4, 4, 96), (4, 13, 8), (4, 14, 99), (4, 15, 6), (4, 16, 50), (4, 17, 97), (4, 18, 76), (4, 19, 88), (4, 20, 74),
(5, 1, 73), (5, 2, 20), (5, 3, 94), (5, 4, 96), (5, 5, 83), (5, 6, 90), (5, 7, 92), (5, 8, 76), (5, 9, 94), (5, 10, 83), (5, 11, 83), (5, 12, 74);

select * from `DISTRIBUTION`;
select * from `COURSES`;

-- distribution by course
select COURSES.CourseName, Type, Percent  from `DISTRIBUTION`, `COURSES`
where (COURSES.courseID = DISTRIBUTION.CourseID)
order by CourseName;

-- assignments by distribution
select AssignmentID, COURSES.CourseName, Instance, PointsPossible, DISTRIBUTION.Type
from `ASSIGNMENTS`
left join `DISTRIBUTION` on (DISTRIBUTION.DistributionID = ASSIGNMENTS.DistributionID)
left join `COURSES` on (COURSES.CourseID = DISTRIBUTION.courseID);

-- student grades by assignment
select GRADE.AssignmentID, GRADE.StudentID, FirstName, LastName, Points, PointsPossible, Instance
from `GRADE`
right JOIN `ASSIGNMENTS` ON (ASSIGNMENTS.AssignmentID = GRADE.AssignmentID)
LEFT JOIN `STUDENTS` ON (STUDENTS.StudentID = GRADE.StudentID);

-- 4 Compute the average/highest/lowest GRADE of an assignment
select a.AssignmentID, a.PointsPossible, avg(s.POINTS) AS PointAVG, max(s.POINTS) AS BestGRADE, min(s.POINTS) AS WorstGRADE
from ASSIGNMENTS a, GRADE s
where a.AssignmentID=2 AND s.AssignmentID=a.AssignmentID;

-- 5 List all of the students in a given course
select LastName, FirstName, CourseName from `REGISTRATION`
inner join `STUDENTS` on (STUDENTS.StudentID = REGISTRATION.StudentID)
inner join `COURSES` on (COURSES.CourseID = REGISTRATION.CourseID) where (COURSES.CourseID = 2)
-- feel free to change the CourseID to get the student list for the other courses
order by LastName asc;

-- 6 List all of the students in a course and all of their GRADEs on every assignment
select LastName, FirstName, CourseName, ASSIGNMENTS.AssignmentID, Points, PointsPossible from `REGISTRATION`
inner join `STUDENTS` on (STUDENTS.StudentID = REGISTRATION.StudentID)
inner join `GRADE` on (GRADE.StudentID = REGISTRATION.StudentID)
inner join `ASSIGNMENTS` on (ASSIGNMENTS.AssignmentID = GRADE.AssignmentID)
inner join `COURSES` on (COURSES.CourseID = REGISTRATION.CourseID) where (COURSES.CourseID = 1)
order by AssignmentID, LastName asc;

-- 7 Add an assignment to a course
insert into ASSIGNMENTS(DistributionID, Instance, PointsPossible)
VALUES (1, 3, 100);
SELECT * FROM ASSIGNMENTS;

-- 8 Change the percentages of the categories for a course

update DISTRIBUTION set Percent = 30
where DistributionID = 1;
update DISTRIBUTION set Percent = 40
where DistributionID = 3;
SELECT * FROM DISTRIBUTION;

-- 9 Add 2 points to the GRADE of each student on an assignment
UPDATE GRADE SET Points = Points + 2
WHERE AssignmentID = 4;
SELECT * FROM `GRADE`
LEFT JOIN `ASSIGNMENTS` ON (GRADE.AssignmentID = ASSIGNMENTS.AssignmentID) WHERE (GRADE.AssignmentID = 4)
order by StudentID;

-- 10 Add 2 points just to those students whose last name contains a ‘Q’
SELECT * FROM `GRADE`
LEFT JOIN `ASSIGNMENTS` ON (GRADE.AssignmentID = ASSIGNMENTS.AssignmentID) 
WHERE (GRADE.StudentID = 5)
order by StudentID;

update `GRADE`
left join `STUDENTS` 
on (GRADE.StudentID = STUDENTS.StudentID)
set Points = Points + 2
where (STUDENTS.LastName LIKE '%q%')
or (STUDENTS.LastName LIKE '%Q%')
and (STUDENTS.StudentID = 5);

SELECT * FROM `GRADE`
LEFT JOIN `ASSIGNMENTS` ON (GRADE.AssignmentID = ASSIGNMENTS.AssignmentID) 
WHERE (GRADE.StudentID = 5)
order by StudentID;


-- 11 compute the grade for student 2
Select SUM(((sg.Points * 100) / a.PointsPossible) * (Percent / 100)) AS FINALGRADE
FROM DISTRIBUTION d, ASSIGNMENTS a, GRADE sg
WHERE d.DistributionID = a.DistributionID
AND sg.AssignmentID = a.AssignmentID
AND d.CourseID = 2
AND StudentID = 2;

-- 12 query: Compute the grade for a student, where the lowest GRADE for a given category is dropped
Select SUM(((sg.Points * 100) / a.PointsPossible) * (Percent / 100)) AS FINALGRADE
FROM DISTRIBUTION d, ASSIGNMENTS a, GRADE sg
WHERE d.DistributionID = a.DistributionID
AND sg.AssignmentID = a.AssignmentID
AND d.CourseID = 3
AND StudentID = 1;                

SELECT min(s.Points) as WorstGrade FROM GRADE s
left join `ASSIGNMENTS` a on (s.AssignmentID = a.AssignmentID)
left join `DISTRIBUTION` d on (d.DistributionID = a.DistributionID)
left join `COURSES` c on (c.CourseID = d.courseID)
WHERE  s.StudentID = 1
and d.CourseID = 3
order by s.StudentID asc;
SELECT * FROM GRADE where StudentID = 1;

Delete from `GRADE` 
where StudentID = 1 and AssignmentID = 9;

Select SUM(((sg.Points * 100) / a.PointsPossible) * (Percent / 100)) AS FINALGRADE
FROM DISTRIBUTION d, ASSIGNMENTS a, GRADE sg
WHERE d.DistributionID = a.DistributionID
AND sg.AssignmentID = a.AssignmentID
AND d.CourseID = 3
AND StudentID = 1;
