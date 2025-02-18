DROP DATABASE IF EXISTS assignment_06;
CREATE DATABASE assignment_06;
USE assignment_06;

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
                        ("Bán hàng"     ),
                        ("Phòng chờ"    ); 

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
VALUES                  ("Câu hỏi về Java", 1          , 1      , 1         , "2020-01-05"),
                        ("Câu Hỏi về PHP" , 1          , 2      , 2         , "2020-02-05"),
                        ("Hỏi về C#"      , 9          , 2      , 5         , "2020-03-06"),
                        ("Hỏi về Ruby"    , 6          , 1      , 5         , "2020-04-06"),
                        ("Hỏi về Postman" , 5          , 1      , 5         , "2020-04-06"),
                        ("Hỏi về ADO.NET" , 5          , 2      , 6         , "2020-04-06"),
                        ("Hỏi về ASP.NET" , 5          , 1      , 1         , "2020-04-06"),
                        ("Hỏi về C++"     , 5          , 1      , 8         , "2020-04-07"),
                        ("Hỏi về SQL"     , 4          , 2      , 3         , "2020-05-07"),
                        ("Hỏi về Python"  , 7          , 1      , 10        , "2020-08-07");

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
                            
                            
-- 01
DROP PROCEDURE IF EXISTS show_account_by_department_name;
DELIMITER //
CREATE PROCEDURE show_account_by_department_name (IN in_department_name VARCHAR(50))
BEGIN
	DECLARE v_department_id INT;
    SELECT department_id INTO v_department_id
    FROM department
    WHERE department_name = in_department_name;
    
    SELECT *
    FROM account
    WHERE department_id = v_department_id;
END //

DELIMITER ;

CALL show_account_by_department_name ("Bảo vệ");
-- Q2
DROP PROCEDURE IF EXISTS counting_acc;

DELIMITER //
CREATE PROCEDURE counting_acc()
BEGIN
	SELECT `group`.*, COUNT(account_id) AS num_of_acc
	FROM group_account
	RIGHT JOIN `group` USING(group_id)
    GROUP BY group_id;
END //

DELIMITER ;

CALL counting_acc();
                                    
-- Q3
DROP PROCEDURE IF EXISTS counting_question;

DELIMITER //
CREATE PROCEDURE counting_question()

BEGIN
	WITH question_3 AS (
		SELECT *
		FROM question
        WHERE MONTH(create_date)= MONTH(CURRENT_DATE) AND YEAR(create_date) = YEAR(CURRENT_DATE)
    )
	SELECT type_question.*, COUNT(question_id)
    FROM question_3
	RIGHT JOIN type_question USING (type_id)
    GROUP BY type_id;
END //
DELIMITER ;

CALL counting_question();

-- Q4
DROP PROCEDURE IF EXISTS question_04;

DELIMITER //
CREATE PROCEDURE question_04(OUT out_type_id INT)
BEGIN
	WITH q_counting AS(
    SELECT type_id, COUNT(question_id) AS counting_q
    FROM type_question
    LEFT JOIN question USING(type_id)
    GROUP BY type_id)
    SELECT type_id INTO out_type_id
    FROM q_counting
    WHERE counting_q = (
						SELECT MAX(counting_q)
                        FROM q_counting);
END //
DELIMITER ;

SET @type_id = NULL;
CALL question_04(@type_id);
SELECT @type_id;

-- Q5
SET @type_id = NULL;
CALL question_04(@type_id);

SELECT type_name
FROM type_question
WHERE type_id = @type_id;

-- Q6
DROP PROCEDURE IF EXISTS question_06;

DELIMITER //
CREATE PROCEDURE question_06(IN in_system_in VARCHAR(50))
BEGIN
	SELECT group_name AS result_search
    FROM `group`
    WHERE group_name LIKE CONCAT("%", in_system_in, "%")
    
    UNION
    
    SELECT username AS result_search
    FROM account
    WHERE username LIKE CONCAT("%", in_system_in, "%");
END //

DELIMITER ;

CALL question_06("D");

-- Q7
DROP PROCEDURE IF EXISTS question_07;
DELIMITER //
CREATE PROCEDURE question_07(IN in_full_name VARCHAR(50),
							 IN in_email VARCHAR(50))
BEGIN
	DECLARE v_default_department_id INT;
    DECLARE v_position_id INT;
    DECLARE v_user_name VARCHAR(50);

 	-- Lấy ID của phòng ban "Phòng chờ"
    SELECT department_id INTO v_default_department_id
    FROM department
    WHERE department_name = "Phòng chờ";
    
    -- Lấy ID của vị trí "Dev"
    SELECT position_id INTO v_position_id
    FROM position
    WHERE position_name = "Dev";
    
    -- Cắt chuỗi sau @
    SELECT SUBSTRING_INDEX(in_email, "@", 1) INTO v_user_name;
    
	INSERT INTO account (email   , username      , full_name           ,  department_id  		 , position_id   )
	VALUES              (in_email, v_user_name   ,   in_full_name 	   , v_default_department_id , v_position_id );
    
    SELECT *
    FROM account
    WHERE username = v_user_name;
END //
DELIMITER ;


-- 08
DROP PROCEDURE IF EXISTS question_08;

DELIMITER //
CREATE PROCEDURE question_08(IN in_search ENUM("Essay", "Multi-choice"))
BEGIN
	DECLARE v_type_id INT;
    SELECT type_id INTO v_type_id
    FROM type_question
    WHERE type_name = in_search;

	WITH length_of_contents AS(
		SELECT *, CHAR_LENGTH(content) AS length_of_content
        FROM question
        WHERE type_id = v_type_id
    )
    SELECT *
    FROM length_of_contents
    WHERE length_of_content = (
								SELECT MAX(length_of_content)
                                FROM length_of_contents);
END //
DELIMITER ;

CALL question_08("Essay");

-- Q9
DROP PROCEDURE IF EXISTS question_09;

DELIMITER //
CREATE PROCEDURE question_09(IN in_id INT)
BEGIN
	DELETE FROM exam
    WHERE exam_id = in_id;
END //

DELIMITER ;

call question_09(1);

SELECT *
FROM exam;

-- Q10
DROP PROCEDURE IF EXISTS question_10;

DELIMITER //
CREATE PROCEDURE question_10()
BEGIN
	-- Hiện thị các exam sẽ dược xóa
	SELECT COUNT(exam_id) AS counting_exam 
    FROM exam
    WHERE YEAR(create_date) = YEAR(CURDATE()) - 6;
    
    -- Xóa các exam được tọa từ 6 năm trước
	DELETE FROM exam
    WHERE YEAR(create_date) = YEAR(CURDATE()) - 6;
END //
DELIMITER ;

CALL question_10();
-- Q11
DROP PROCEDURE IF EXISTS question_11;
DELIMITER //
CREATE PROCEDURE question_11(IN in_department_name VARCHAR(50))
BEGIN
    DECLARE v_department_id INT;
    DECLARE v_default_department_id INT;

    -- Lấy ID của phòng ban cần xóa
    SELECT department_id INTO v_department_id
    FROM department
    WHERE department_name = in_department_name;

    -- Lấy ID của phòng ban "Phòng chờ"
    SELECT department_id INTO v_default_department_id
    FROM department
    WHERE department_name = "Phòng chờ";

    -- Cập nhật account về phòng ban "Phòng chờ"
    UPDATE account
    SET department_id = v_default_department_id
    WHERE department_id = v_department_id;

    -- Xóa phòng ban
    DELETE FROM department
    WHERE department_id = v_department_id;
END //
DELIMITER ;

CALL question_11("Marketing");

SELECT *
FROM account;
select *
from department;
-- Q12
DROP PROCEDURE IF EXISTS question_12;

DELIMITER //
CREATE PROCEDURE question_12()
BEGIN
	-- Tạo tháng
    WITH c1 AS(
    SELECT 1 AS month
    UNION
    SELECT 2 AS month
    UNION
    SELECT 3 AS month
    UNION
    SELECT 4 AS month
    UNION
    SELECT 5 AS month
    UNION
    SELECT 6 AS month
    UNION
    SELECT 7 AS month
    UNION
    SELECT 8 AS month
    UNION
    SELECT 9 AS month
    UNION
    SELECT 10 AS month
    UNION
    SELECT 11 AS month
    UNION
    SELECT 12 AS month
    ), c2 AS(
    SELECT question_id, create_date, MONTH(create_date) AS month
	FROM question)
	-- Đếm câu hỏi 
    SELECT month, COUNT(question_id) 
	FROM c1
    LEFT JOIN c2 USING(month)
    GROUP BY month;	
END //
DELIMITER ;

CALL question_12();

SELECT * 
FROM question;


-- Q13
WITH c1 AS(
SELECT
    YEAR(CURRENT_DATE - INTERVAL 1 MONTH) AS year,
    MONTH(CURRENT_DATE - INTERVAL 1 MONTH) AS month
UNION
SELECT
    YEAR(CURRENT_DATE - INTERVAL 2 MONTH) AS year,
    MONTH(CURRENT_DATE - INTERVAL 2 MONTH) AS month
UNION
SELECT
    YEAR(CURRENT_DATE - INTERVAL 3 MONTH) AS year,
    MONTH(CURRENT_DATE - INTERVAL 3 MONTH) AS month
UNION
SELECT
    YEAR(CURRENT_DATE - INTERVAL 4 MONTH) AS year,
    MONTH(CURRENT_DATE - INTERVAL 4 MONTH) AS month
UNION
SELECT
    YEAR(CURRENT_DATE - INTERVAL 5 MONTH) AS year,
    MONTH(CURRENT_DATE - INTERVAL 5 MONTH) AS month
UNION
SELECT
    YEAR(CURRENT_DATE - INTERVAL 6 MONTH) AS year,
    MONTH(CURRENT_DATE - INTERVAL 6 MONTH) AS month
), c2 AS(
		SELECT question_id, YEAR(create_date) AS year, MONTH(create_date) AS month
        FROM question
)   SELECT year, month, COUNT(question_id) 
	FROM c1
    LEFT JOIN c2 USING(month, year)
    GROUP BY year, month;