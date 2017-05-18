/*创建 university 数据库*/
create database university

/*使用university 数据库*/
use university

/*创建 department 表*/
create table department(
    dept_name varchar(20) NOT NUll,
    building varchar(20) ,
    budget DECIMAL(10,2),
    primary key (dept_name)
 
)engine = innodb default charset = utf8;

/*创建 student 表*/
create table student(
    ID int(5) not null,
    name varchar(20) not null,
    sex char(1),
    age int(3),
    emotion_state varchar(20),
    dept_name varchar(20) NOT NUll,
    primary key (ID),
    foreign key (dept_name) references department (dept_name)
)engine = innodb default charset = utf8;

/*创建 exam 表*/
create table exam(
    student_ID int(5) not null ,
    exam_name varchar(20) not null ,
    grade int(3) not null,
    primary key (student_ID, exam_name),
    foreign key (student_ID) references student (ID)
)engine = innodb default charset = utf8;