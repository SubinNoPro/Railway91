DROP DATABASE IF EXISTS assignment_04;
CREATE DATABASE assignment_04;
USE assignment_04;

-- Tạo bảng department
DROP TABLE IF EXISTS department;
CREATE TABLE department (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50)
);

-- Tạo bảng position
DROP TABLE IF EXISTS position;
CREATE TABLE position (
    position_id INT PRIMARY KEY AUTO_INCREMENT,
    position_name ENUM("Dev", "Test", "Scrum Master", "PM")
);

-- Tạo bảng account
DROP TABLE IF EXISTS account;
CREATE TABLE account (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(50),
    username VARCHAR(50) UNIQUE NOT NULL,
    full_name VARCHAR(50),
    department_id INT,
    position_id INT,
    create_date DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (department_id)
        REFERENCES department (department_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (position_id)
        REFERENCES position (position_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tạo bảng group
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
    group_id INT PRIMARY KEY AUTO_INCREMENT,
    group_name VARCHAR(50),
    creator_id INT,
    create_date DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (creator_id)
        REFERENCES account (account_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tạo bảng group_account
DROP TABLE IF EXISTS group_account;
CREATE TABLE group_account (
    group_id INT,
    account_id INT,
    join_date DATE DEFAULT (CURRENT_DATE),
    PRIMARY KEY (group_id, account_id),
    FOREIGN KEY (group_id)
        REFERENCES `group` (group_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (account_id)
        REFERENCES account (account_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tạo bảng type_question
DROP TABLE IF EXISTS type_question;
CREATE TABLE type_question (
    type_id INT PRIMARY KEY AUTO_INCREMENT,
    type_name ENUM("Essay", "Multiple-Choice")
);

-- Tạo bảng category_question
DROP TABLE IF EXISTS category_question;
CREATE TABLE category_question (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50)
);

-- Tạo bảng question
DROP TABLE IF EXISTS question;
CREATE TABLE question (
    question_id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(50),
    category_id INT,
    type_id INT,
    creator_id INT,
    create_date DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (category_id)
        REFERENCES category_question (category_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (type_id)
        REFERENCES type_question (type_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (creator_id)
        REFERENCES account (account_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tạo bảng answer
DROP TABLE IF EXISTS answer;
CREATE TABLE answer (
    answer_id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(50),
    question_id INT,
    is_correct BOOLEAN,
    FOREIGN KEY (question_id)
        REFERENCES question (question_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tạo bảng exam
DROP TABLE IF EXISTS exam;
CREATE TABLE exam (
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    code CHAR(10),
    title VARCHAR(50),
    category_id INT,
    duration INT,
    creator_id INT,
    create_date DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (category_id)
        REFERENCES category_question (category_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (creator_id)
        REFERENCES account (account_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tạo bảng exam_question
DROP TABLE IF EXISTS exam_question;
CREATE TABLE exam_question (
    exam_id INT,
    question_id INT,
    PRIMARY KEY (exam_id, question_id),
    FOREIGN KEY (exam_id)
        REFERENCES exam (exam_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (question_id)
        REFERENCES question (question_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- Thêm dữ liệu cho bảng department
INSERT INTO department  (department_name)
VALUES                  ("Marketing"    ),
                        ("Sale"         ),
                        ("Bảo vệ"       ),
                        ("Nhân sự"      ),
                        ("Kỹ thuật"     ),
                        ("Tài chính"    ),
                        ("Phó giám đốc" ),
                        ("Giám đốc"     ),
                        ("Thư kí"       ),
                        ("Bán hàng"     ); 

-- Thêm dữ liệu cho bảng position
INSERT INTO position    (position_name )
VALUES                  ("Dev"         ),
                        ("Test"        ),
                        ("Scrum Master"),
                        ("PM"          );

-- Thêm dữ liệu cho bảng account
INSERT INTO account (email                           , username      , full_name           , department_id, position_id, create_date )
VALUES              ("haidang29productions@gmail.com", "dangblack"   , "Nguyen Hai Dang"   , 1            , 1          , "2019-01-15"),
                    ("account1@gmail.com"            , "quanganh"    , "Tong Quang Anh"    , 1            , 2          , "2020-02-25"),
                    ("account2@gmail.com"            , "vanchien"    , "Nguyen Van Chien"  , 1            , 3          , "2021-03-17"),
                    ("account3@gmail.com"            , "cocoduongqua", "Duong Do"          , 3            , 4          , "2022-03-08"),
                    ("account4@gmail.com"            , "doccocaubai" , "Nguyen Chien Thang", 4            , 4          , "2015-03-20"),
                    ("dapphatchetngay@gmail.com"     , "khabanh"     , "Ngo Ba Kha"        , 6            , 3          , "2016-04-05"),
                    ("songcodaoly@gmail.com"         , "huanhoahong" , "Bui Xuan Huan"     , 2            , 2          , "2017-04-14"),
                    ("sontungmtp@gmail.com"          , "tungnui"     , "Nguyen Thanh Tung" , 8            , 1          , "2018-04-18"),
                    ("duongghuu@gmail.com"           , "duongghuu"   , "Duong Van Huu"     , 9            , 2          , "2023-04-07"),
                    ("vtiaccademy@gmail.com"         , "vtiaccademy" , "Vi Ti Ai"          , 2            , 1          , "2024-04-29");

-- Thêm dữ liệu cho bảng group
INSERT INTO `group` (group_name        , creator_id, create_date )
VALUES              ("Testing System"  , 1         , "2019-03-15"),
                    ("Developement"    , 1         , "2020-03-27"),
                    ("VTI Sale 01"     , 2         , "2021-03-09"),
                    ("VTI Sale 02"     , 3         , "2022-01-10"),
                    ("VTI Sale 03"     , 3         , "2023-08-28"),
                    ("VTI Creator"     , 6         , "2024-08-06"),
                    ("VTI Marketing 01", 3         , "2024-10-17"),
                    ("Management"      , 8         , "2020-11-28"),
                    ("Chat with love"  , 9         , "2022-11-09"),
                    ("Vi Ti Ai"        , 3         , "2022-12-10");

-- Thêm dữ liệu cho bảng group_account
INSERT INTO group_account   (group_id, account_id, join_date   )
VALUES                      (1       , 1         , "2019-03-05"),
                            (2       , 1         , "2020-11-17"),
                            (3       , 1         , "2021-09-29"),
                            (4       , 1         , "2022-12-10"),
                            (5       , 5         , "2022-04-28"),
                            (2       , 6         , "2023-08-26"),
                            (7       , 2         , "2024-02-07"),
                            (3       , 8         , "2020-05-18"),
                            (2       , 2         , "2020-02-04"),
                            (10      , 10        , "2020-12-10");

-- Thêm dữ liệu cho bảng type_question
INSERT INTO type_question (type_name)
VALUES ("Essay"), ("Multiple-Choice"); 

-- Thêm dữ liệu cho bảng category_question
INSERT INTO category_question   (category_name)
VALUES                          ("Java"       ),
                                ("ASP.NET"    ),
                                ("ADO.NET"    ),
                                ("SQL"        ),
                                ("Postman"    ),
                                ("Ruby"       ),
                                ("Python"     ),
                                ("C++"        ),
                                ("C Sharp"    ),
                                ("PHP"        ); 

-- Thêm dữ liệu cho bảng question
INSERT INTO question    (content          , category_id, type_id, creator_id, create_date )
VALUES                  ("Câu hỏi về Java", 1          , 1      , 1         , "2020-04-05"),
                        ("Câu Hỏi về PHP" , 1          , 2      , 2         , "2020-04-05"),
                        ("Hỏi về C#"      , 9          , 2      , 5         , "2020-04-06"),
                        ("Hỏi về Ruby"    , 6          , 1      , 5         , "2020-04-06"),
                        ("Hỏi về Postman" , 5          , 1      , 5         , "2020-04-06"),
                        ("Hỏi về ADO.NET" , 5          , 2      , 6         , "2020-04-06"),
                        ("Hỏi về ASP.NET" , 5          , 1      , 1         , "2020-04-06"),
                        ("Hỏi về C++"     , 5          , 1      , 8         , "2020-04-07"),
                        ("Hỏi về SQL"     , 4          , 2      , 3         , "2020-04-07"),
                        ("Hỏi về Python"  , 7          , 1      , 10        , "2020-04-07");

-- Thêm dữ liệu cho bảng answer
INSERT INTO answer  (content     , question_id, is_correct)
VALUES              ("Trả lời 01", 1          , 0         ),
                    ("Trả lời 02", 1          , 1         ),
                    ("Trả lời 03", 1          , 0         ),
                    ("Trả lời 04", 1          , 1         ),
                    ("Trả lời 05", 2          , 1         ),
                    ("Trả lời 06", 3          , 1         ),
                    ("Trả lời 07", 4          , 0         ),
                    ("Trả lời 08", 8          , 0         ),
                    ("Trả lời 09", 9          , 1         ),
                    ("Trả lời 10", 10         , 1         );

-- Thêm dữ liệu cho bảng exam
INSERT INTO exam    (code     , title           , category_id, duration, creator_id, create_date )
VALUES              ("VTIQ001", "Đề thi C#"     , 1          , 60      , 1         , "2019-04-05"),
                    ("VTIQ002", "Đề thi PHP"    , 1          , 60      , 1         , "2019-04-05"),
                    ("VTIQ003", "Đề thi C++"    , 9          , 120     , 2         , "2019-04-07"),
                    ("VTIQ004", "Đề thi Java"   , 2          , 60      , 3         , "2020-04-08"),
                    ("VTIQ005", "Đề thi Ruby"   , 2          , 120     , 4         , "2020-04-10"),
                    ("VTIQ006", "Đề thi Postman", 2          , 60      , 6         , "2020-04-05"),
                    ("VTIQ007", "Đề thi SQL"    , 2          , 60      , 1         , "2020-04-05"),
                    ("VTIQ008", "Đề thi Python" , 8          , 60      , 8         , "2020-04-07"),
                    ("VTIQ009", "Đề thi ADO.NET", 4          , 90      , 3         , "2020-04-07"),
                    ("VTIQ010", "Đề thi ASP.NET", 7          , 90      , 1         , "2020-04-08");

-- Thêm dữ liệu cho bảng exam_question
INSERT INTO exam_question   (question_id, exam_id)
VALUES                      (1         , 1      ),
                            (2         , 2      ),
                            (3         , 1      ),
                            (4         , 4      ),
                            (5         , 1      ),
                            (6         , 2      ),
                            (7         , 1      ),
                            (8         , 8      ),
                            (9         , 2      ),
                            (10        , 10     );
                            
                            
-- Q1
SELECT full_name, department_name
FROM account
INNER JOIN department USING(department_id);

-- Q2
SELECT *
FROM account
WHERE create_date > "2010-12-20";

-- Q3
SELECT full_name
FROM account
INNER JOIN position USING(position_id)
WHERE position_name = "Dev";


-- Q4
SELECT department_name
FROM account
INNER JOIN department USING(department_id)
GROUP BY department_id
HAVING COUNT(department_id) > 3
;

-- 05
SELECT question.*
FROM exam_question
RIGHT JOIN question USING (question_id)
GROUP BY question_id
ORDER BY COUNT(exam_id) DESC
LIMIT 1;
-- 06
SELECT category_question.*,COUNT(question_id)
FROM question
RIGHT JOIN category_question USING(category_id)
GROUP BY category_id
;

-- 07
SELECT question.*, COUNT(exam_id)
FROM exam_question
RIGHT JOIN question USING (question_id)
GROUP BY question_id;

-- 08
SELECT question.*, COUNT(answer_id)
FROM answer
RIGHT JOIN question USING(question_id)
GROUP BY question_id
ORDER BY COUNT(answer_id) DESC
LIMIT 1;

-- Q9
SELECT COUNT(account_id) AS sl_ac
FROM account
RIGHT JOIN group_account USING(account_id)
GROUP BY group_id;

-- Q10
SELECT COUNT(position_id), position_name
FROM account
RIGHT JOIN position USING (position_id)
GROUP BY position_id
ORDER BY COUNT(position_id) ASC
LIMIT 1 ;

-- 11
SELECT department.*, position.*, COUNT(account_id)
FROM department
CROSS JOIN position
LEFT JOIN account USING(department_id, position_id)
GROUP BY department_id, position_id
;

-- Q12
SELECT q.content, answer.content, type_name, full_name
FROM question q
INNER JOIN account a ON a. account_id = q.creator_id
INNER JOIN answer USING(question_id)
INNER JOIN type_question USING (type_id)
;

-- 13
SELECT type_question.*, COUNT(type_id)
FROM question
RIGHT JOIN type_question USING (type_id)
GROUP BY type_id;

-- 14
SELECT group_name, group_id
FROM group_account
INNER JOIN `group` USING(group_id)
LEFT JOIN account USING(account_id)
WHERE account_id IS NULL;

-- 15/16
SELECT q.content
FROM question q
LEFT JOIN answer USING (question_id)
WHERE question_id IS NULL;



-- UNION
-- 17
-- a)
SELECT full_name 
FROM group_account
INNER JOIN account USING(account_id)
WHERE group_id = 1;

-- b)
SELECT full_name 
FROM group_account
INNER JOIN account USING(account_id)
WHERE group_id = 2;

-- c)
SELECT full_name 
FROM group_account
INNER JOIN account USING(account_id)
WHERE group_id = 1

UNION

SELECT full_name 
FROM group_account
INNER JOIN account USING(account_id)
WHERE group_id = 2;

-- 18
-- a)
SELECT group_name, group_id, COUNT(account_id)
FROM group_account
INNER JOIN `group` USING (group_id)
GROUP BY group_id
HAVING COUNT(account_id) > 2;

-- b)
SELECT group_name, group_id, COUNT(account_id)
FROM group_account
INNER JOIN `group` USING (group_id)
GROUP BY group_id
HAVING COUNT(account_id) < 3;

-- c)
SELECT group_name, group_id, COUNT(account_id)
FROM group_account
INNER JOIN `group` USING (group_id)
GROUP BY group_id
HAVING COUNT(account_id) > 2

UNION

SELECT group_name, group_id, COUNT(account_id)
FROM group_account
INNER JOIN `group` USING (group_id)
GROUP BY group_id
HAVING COUNT(account_id) < 3;