-- SS02 - Lecture
-- Thiết kế cơ sở dữ liệu đặt tên là student_management với các yêu cầu sau
-- thực thể sinh viên có các thông tin id, name, age, class
-- thực thể class có các thông tin id, name. 1 lớp có nhiều học sinh
-- thực thể subject có các thông tin id, name.
-- 1 sinh viên có nhiều môn học
-- 1 môn học có nhiều sinh viên đăng ký
-- sinh viên sau khi học 1 môn thì có thể có điểm
drop database if exists student_management;
create database student_management;
use student_management;


CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT,
    class_id INT
);
CREATE TABLE classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
CREATE TABLE subjects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
-- Cách 1: Tạo bảng scores riêng
/*
CREATE TABLE scores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    score FLOAT
);
CREATE TABLE student_subjects (
    student_id INT,
    subject_id INT
);

alter table students
add constraint fk_class_id foreign key (class_id) references classes(id);
alter table scores
add constraint fk_st_student_id foreign key (student_id) references students(id);
alter table scores
add constraint fk_st_subject_id foreign key (subject_id) references subjects(id);
alter table student_subjects
add constraint fk_ss_student_id foreign key (student_id) references students(id);
alter table student_subjects
add constraint fk_ss_subject_id foreign key (subject_id) references subjects(id);
alter table student_subjects
add constraint pk_ss_student_subjects primary key (student_id, subject_id);
-- Add sample data
insert into classes (name) values ('Toán học'),('Lịch sử'),('Khoa học');
insert into subjects (name) values ('Số học'),('Hình học'),('Lịch sử thế giới'),('Sinh học'),('Vật lý');
insert into students (name, age, class_id) values
('Nguyễn Văn Minh', 20, 1),
('Hoàng Thiên Phú', 19, 2),
('Nguyễn Mạnh Thắng', 18, 3),
('Đào Xuân Nam', 21, 2);
insert into scores (student_id, subject_id, score) values
-- Nguyễn Văn Minh đạt 90.0 điểm Số học và 85.5 điểm Hình học
(1, 1, 90.0),
(1, 2, 85.5),
-- Hoàng Thiên Phú đạt 70.0 điểm Lịch sử thế giới
(2, 3, 70.0),
-- Nguyễn Mạnh Thắng đạt 75.5 điểm Sinh học và 91.0 điểm Vật lý
(3, 4, 75.5),
(3, 5, 91.0),
-- Đào Xuân Nam đạt 100 điểm Lịch sử thế giới
(4, 3, 100);

-- Query
-- Lấy ra danh sách id của sinh viên theo lớp
-- Lấy ra danh sách điểm của 1 sinh viên
-- Lấy ra danh sách id của sinh viên theo 1 môn học đã đăng ký
select id from students where class_id = 2;
select subjects.name, scores.score from scores
inner join subjects on scores.subject_id = subjects.id
 where scores.student_id = 1;
select student_id from scores where subject_id = 3;
*/
-- Cách 2: Lưu điểm vào bảng student_subjects
CREATE TABLE student_subjects (
    student_id INT,
    subject_id INT
);
alter table students
add constraint fk_class_id foreign key (class_id) references classes(id);
alter table student_subjects
add constraint fk_ss_student_id foreign key (student_id) references students(id);
alter table student_subjects
add constraint fk_ss_subject_id foreign key (subject_id) references subjects(id);
alter table student_subjects
add constraint pk_ss_student_subjects primary key (student_id, subject_id);
alter table student_subjects
add column score float;
-- Add sample data
insert into classes (name) values ('Toán học'),('Lịch sử'),('Khoa học');
insert into subjects (name) values ('Số học'),('Hình học'),('Lịch sử thế giới'),('Sinh học'),('Vật lý');
insert into students (name, age, class_id) values
('Nguyễn Văn Minh', 20, 1),
('Hoàng Thiên Phú', 19, 2),
('Nguyễn Mạnh Thắng', 18, 3),
('Đào Xuân Nam', 21, 2);
insert into student_subjects (student_id, subject_id, score) values
-- Nguyễn Văn Minh đạt 90.0 điểm Số học và 85.5 điểm Hình học
(1, 1, 90.0),
(1, 2, 85.5),
-- Hoàng Thiên Phú đạt 70.0 điểm Lịch sử thế giới
(2, 3, 70.0),
-- Nguyễn Mạnh Thắng đạt 75.5 điểm Sinh học và 91.0 điểm Vật lý
(3, 4, 75.5),
(3, 5, 91.0),
-- Đào Xuân Nam đạt 100 điểm Lịch sử thế giới
(4, 3, 100);
;
-- Query
-- Lấy ra danh sách id của sinh viên theo lớp
-- Lấy ra danh sách điểm của 1 sinh viên
-- Lấy ra danh sách id của sinh viên theo 1 môn học đã đăng ký
select id from students where class_id = 2;
select subjects.name, student_subjects.score from student_subjects
inner join subjects on student_subjects.subject_id = subjects.id
 where student_subjects.student_id = 1;
select student_id from student_subjects where subject_id = 3;