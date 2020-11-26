create database bedu_test;
use bedu_test;

create table movies(
movieid int PRIMARY KEY,
title varchar(80),
genres varchar(80)
);

create table users(
id INT PRIMARY KEY,
genero VARCHAR(1),
edad INT,
ocup INT,
cp VARCHAR(20)
);

create table ratings(
userid int,
movieid int,
rating int,
timestamp bigint
);










#UserID::MovieID::Rating::Timestamp