-- Xóa database nếu tồn tại
DROP DATABASE IF EXISTS lesson_01;

-- Hiện thi danh sách database
SHOW DATABASES;

-- Tạo database
CREATE DATABASE lesson_01;

-- Tạo bảng
USE lesson_01;

CREATE TABLE customer(
	id				INT UNSIGNED,
    name			VARCHAR(50),
    birthdate		DATE,
    gender			ENUM("Male","Female"),
    active			BOOLEAN
);

-- Mô tả bảng
DESCRIBE customer;

-- DDL TABLE
SHOW CREATE TABLE customer;