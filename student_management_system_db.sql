create database student_management_system_db;
use student_management_system_db;

create table student_detail(stu_id int primary key auto_increment,
stu_name varchar(100), 
stu_DOB date,
stu_email varchar (100),
stu_city varchar(100),
stu_grade varchar(50),
stu_mobile varchar(50),
stu_gender varchar(20));

select* from student_detail;

create table Course_Detail(cou_id int primary key auto_increment,
cou_name varchar (100),
cou_discription text,
cou_fee decimal(10,2),
stu_id int unique,
foreign key (stu_id) references student_detail (stu_id));

create table stu_mark(stu_id int,
Tamil int,
Math int,
English int,
Computer_Science int,
Physics int,
Chemistry int,
foreign key (stu_id) references student_detail (stu_id));

insert into student_detail(stu_name,stu_DOB ,stu_email ,stu_city ,stu_grade ,stu_mobile ,stu_gender)
values('Ram', '2000-01-03', 'ram@gmail.com', 'Chennai', 'Higherseondary', '1234567890', 'male'),
('Prabhu', '2000-02-17', 'prabhu@gmail.com', 'Vellore', 'Higherseondary', '1234567891', 'male'),
('Kural', '2000-03-01', 'kural@gmail.com', 'Vellore', 'Higherseondary', '1234567892', 'male'),
('Shaan', '2000-04-10', 'shaan@gmail.com', 'Chennai', 'Higherseondary', '1234567893', 'male'),
('Subu', '2000-05-18', 'subu@gmail.com', 'Chennai', 'Higherseondary', '1234567894', 'male');

insert into Course_Detail(cou_name, cou_discription, cou_fee, stu_id)
values ('commerce', 'Accounting and finance', '45000.00', '1'),
('commerce', 'Accounting and finance', '45000.00', '2'),
('Bio', 'Accounting and finance', '65000.00', '3'),
('Computer Science', 'Accounting and finance', '55000.00', '4'),
('Bio', 'Accounting and finance', '65000.00', '5');
update Course_Detail set cou_discription='Biology and science' where stu_id = 3;
update Course_Detail set cou_discription='Biology and science' where stu_id = 5;
update Course_Detail set cou_discription='Computer science' where stu_id = 4;

insert into stu_mark(stu_id, Tamil, Math, English, Computer_Science, Physics, Chemistry)
values ('1', '85', '92', '78', '88', '90', '87'),
('2',' 75', '80', '70', '85', '82', '78'),
('3', '90', '95', '88', '92', '94', '89'),
('4',' 65', '70', '60', '72', '68', '64');

alter table student_detail add stu_bloodgroup varchar (20);
select stu_name, Tamil+ Math+ English+ Computer_Science+ Physics+ Chemistry as total_Mark 
from stu_mark join student_detail on student_detail.stu_id=stu_mark.stu_id;

create user 'user1@localhost' identified by '3198@us';
grant all privileges on student_management_system_db.*to 'user1@localhost';

