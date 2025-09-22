CREATE DATABASE StudentRecordsDB;
USE StudentRecordsDB;

CREATE TABLE Students(
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50)NOT NULL,
    last_name VARCHAR(50)NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR(100)UNIQUE NOT NULL,
    phone VARCHAR(20)
);
INSERT INTO Students(first_name,last_name,dob,email,phone)VALUES
('Alice','Wambui','2000-05-12','alicewambui@gmail.com','0734567889'),
('Alison','Wanjiru','2000-12-12','alison212@gmail.com','0712233445'),
('Marjory','Mumbi','1998-20-09','marjory35@gmail.com','0756677889'),
('Michael','Mugo','1997-31-07','mikael34@gmail.com','0790122334'),

CREATE TABLE Courses(
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    credits INT NOT NULL
);
INSERT INTO Courses(course_name,course_code,credits)VALUES
('Database Systems','DBS101',3),
('Computer Networks','NET201',4),
('Web Development','WEB301',3),
('Software Engineering','SWE501',3),
('Operating Systems','OPS401',4);

CREATE TABLE Instructors(
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50)NOT NULL,
    last_name VARCHAR(50)NOT NULL,
    email VARCHAR(100)UNIQUE NOT NULL,
);
INSERT INTO Instructors(first_name,last_name,email)VALUES
('David','Kamau','davidkamau@gmail.com'),
('Esther','Wanjiku','estherwanjiku@gmail.com'),
('George','Kariuki','georgekariuki@gmail.com');

CREATE TABLE Enrollments(
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    grade CHAR(2)
    CONSTRAINTS fk_student FREIGN KEY(student_id)REFERENCES Students(student_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINTS fk_course FOREIGN KEY(course_id)REFERENCES Courses(course_id)ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE(student_id,course_id)
);
INSERT INT Enrollments(student_id,course_id,grade)
(1,1,'A'),
(1,2,'B'),
(2,1,'B'),
(2,3,'A'),
(3,2,'C'),
(3,4,'B'),
(4,5,'A'),
(5,3,'B'),
(5,4,'A');

CREATE TABLE course_Instructors(
    ci_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    instructor_id INT NOT NULL,
    CONSTRAINTS fk_course_ci FOREIGN KEY(course_id)REFERENCES Course(course_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINTSfk_instructor_ci FOREIGN KEY(instructor_id)REFERENCES Instructors(instructor_id)ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE(course_id,instructor_id)
);
INSERT INTO course_Instructors(course_id,instructor_id)VALUES
(1,1),--David teaches Database Systems
(2,2),--Esther teaches Computer Networks
(3,1),--David also teaches Web Development
(4,3),--George teaches Operating Systems
(5,2);--Esther teaches Software Engineering