#drop database homework;
create database homework charset utf8;
use homework;


create table class_grade(
gid int auto_increment,
gname char(100) not null,
primary key(gid)
);
 
 # Class table
create table class(
cid int auto_increment,
caption char(100) not null,
grade_id int,
foreign key(grade_id) references class_grade(gid),
primary key(cid)
);
 
create table student(
sid int auto_increment,
sname char(100) not null,
 gender enum ( "M", "F") not null default "M",
 class_id int,
foreign key(class_id) references class(cid),
primary key(sid)
);
 
create table teacher(
tid int auto_increment,
tname char(100) not null,
primary key(tid)
);
 
create table course(
cid int auto_increment,
cname char(100) not null,
teacher_id int,
foreign key(teacher_id) references teacher(tid),
primary key(cid)
);
 
 # Results table
create table score(
sid int auto_increment,
student_id int,
foreign key(student_id) references student(sid),
course_id int,
foreign key(course_id) references course(cid),
score int not null,
primary key(sid)
);
 
 # Class office table
create table teacher2cls(
tcid int auto_increment,
tid int,
foreign key(tid) references teacher(tid),
cid int,
foreign key(cid) references class(cid),
primary key(tcid)
);


insert into class_grade(gname) values
 ( 'Grade'), ( 'second grade'), ( 'third grade'),
 ( 'Fourth grade'), ( 'the fifth grade'), ( 'the sixth grade')
;
 
 # Class table
insert into class(caption,grade_id) values
 ( 'Year intervals', 1), ( 'second class year', 1), ( 'three times a year', 1),
 ( 'Class years', 2), ( 'two classes of', 2),
 ( 'Three-year intervals', 3),
 ( 'A group of four', 4), ( 'four second class', 4),
 ( 'A group of five', 5),
 ( 'A group of six', 6)
;
 
# Student table #
insert into student(sname,gender,class_id) values
 ( 'Jordan', 'M', 1), ( 'Iverson', 'F', 2), ( 'Bryant', 'F', 3),
 ( 'Olney', 'M', 4), ( 'Yao', 'M', 5), ( 'Madison', 'M', 6),
 ( 'Scola', 'M', 1), ( 'James', 'M', 2), ( 'Wade', 'F', 3),
 ( 'Fisher', 'M', 1), ( 'Paul', 'M', 4), ( 'Duncan', 'M', 4),
 ( 'Ginobili', 'F', 5), ( 'Rose', 'F', 6), ( 'Howard', 'F', 5),
 ( 'Massey', 'M', 2), ( 'Liu', 'M', 3), ( 'John Doe', 'M', 4),
 ( 'ZHANG Si', 'F', 4)
;
 
 insert into teacher(tname) values
 ( "Alex"), ( "Zhang"), ( "John Doe"), ("Wang Wu"), (" Li ");


 # Class Schedule 
insert into course(cname,teacher_id) values
 ( 'Language', 1), ( 'Mathematics', 2), ( 'English', 3), ( 'biological', 4),
 ( 'Physical', 1), ( 'chemical', 2), ( 'political', 4), ( 'sports', 4)
;
 # Results table
insert into score(student_id,course_id,score) values
(1,1,60),(1,2,80),(1,3,89),(1,4,90),(2,1,80),(2,3,90),
(3,2,81),(4,3,98),(5,1,90),(5,2,100),(5,3,98),(5,4,97),
(5,5,98),(5,6,99),(6,1,72),(6,5,80),(7,5,40),(7,6,87),
(8,5,80),(9,1,81),(10,2,30),(10,3,65),(10,4,80),(11,1,67),
(11,2,81),(11,3,38),(11,4,78),(12,2,28),(12,3,98),(13,5,95),
(14,4,81),(14,5,82),(15,1,78),(15,1,78),(16,4,79),(17,1,83)
;
 # Class office table
insert into teacher2cls(tid,cid) values
(1,1),(1,2),(2,1),(3,2),(3,4),(5,6);


select * from class_grade;


  select * from student;
