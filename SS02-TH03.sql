drop database if exists `quanlysinhvien`;
create database quanlysinhvien;
use quanlysinhvien;
create table Class(
ClassID int primary key auto_increment not null,
ClassName varchar(60) not null,
StartDate datetime not null,
`Status` bit(1)
);
create table Student (
StudentID int primary key auto_increment not null,
StudentName varchar(30),
Address varchar(50),
Phone varchar(20),
`Status` bit(1),
ClassID int not null,
foreign key (ClassID) references Class(ClassID)
);
create table Subject (
SubID int primary key auto_increment not null,
SubName varchar(30) not null,
Credit tinyint default 1,
check(credit > 0),
`Status` bit(1) default 1
);
create table Mark (
MarkID int primary key auto_increment not null,
SubID int unique key not null,
StudentID int unique key not null,
Mark float default 0,
check(Mark >= 0 and Mark <= 100),
ExamTimes tinyint default 1
);
