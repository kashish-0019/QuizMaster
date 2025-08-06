create database if not exists quizzapp;

use quizzapp;

create table users(
  user_id int auto_increment primary key,
  name varchar(100),
  email varchar(100) unique,
  password varchar(100)
);

create table subjects(
  subject_id int auto_increment primary key,
  subject_name varchar(100)
);

create table questions(
  ques_id int auto_increment primary key,
  question text,
  option_a varchar(100),
  option_b varchar(100),
  option_c varchar(100),
  option_d varchar(100),
  correct_option char(1),
  subject_id int,
  foreign key (subject_id) references subjects(subject_id)
);

create table results(
  result_id int auto_increment primary key,
  user_id int,
  subject_id int,
  score int,
  attempted_on datetime default current_timestamp,
  foreign key (user_id) references users(user_id),
  foreign_key (subject_id) references subjects(subject_id)
);

CREATE TABLE admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100)
);
