-- Question 01

DROP TRIGGER IF EXISTS question_01;

DELIMITER //
CREATE TRIGGER question_01
BEFORE INSERT ON `group`
FOR EACH ROW
BEGIN
	IF NEW.create_date < CURRENT_DATE - INTERVAL 1 YEAR THEN
		SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Không cho phép tạo group có ngày tạo trước 1 năm trước";
	END IF;
END //
DELIMITER ;

-- Tạo Group kiểm tra Trigger
INSERT INTO `group` (group_id, group_name, creator_id, create_date)
VALUES (11, "MySQL", 1, "2020-01-01");

-- Question 02
DROP TRIGGER IF EXISTS question_02;

DELIMITER //
CREATE TRIGGER question_02
BEFORE INSERT ON account
FOR EACH ROW
BEGIN
	DECLARE v_department_id INT;
    -- Lấy  department_id của "Sale"
	SELECT department_id INTO v_department_id
    FROM department
    WHERE department_name = "Sale";
    
	IF NEW.department_id = v_department_id THEN
    SIGNAL SQLSTATE "45000"
    SET MESSAGE_TEXT = "Department Sale cannot add more user";
    END IF;
END //
DELIMITER ;

INSERT INTO account (email                           , username      , full_name           , department_id, position_id)
VALUES              ("haidang@gmail.com", "dangblue"   , "Nguyen Hai Dang"   , 2            , 1          );


-- Question 03
DROP TRIGGER IF EXISTS question_03;

DELIMITER // 
CREATE TRIGGER question_03
BEFORE INSERT ON group_account
FOR EACH ROW
BEGIN
	DECLARE num_of_acc INT;
    SELECT COUNT(account_id) INTO num_of_acc
    FROM group_account
	WHERE group_id = NEW.group_id;
	IF num_of_acc >= 5  THEN
		SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Mỗi Group có tối đa 5 người";
	END IF;
END //
DELIMITER ;

-- Question 04
DROP TRIGGER IF EXISTS question_04;

DELIMITER //
CREATE TRIGGER question_04
BEFORE INSERT ON exam_question
FOR EACH ROW
BEGIN
	DECLARE num_of_question INT;
    
    SELECT  COUNT(question_id) INTO num_of_question
    FROM exam_question
    WHERE exam_id = NEW.exam_id;
    
    IF num_of_question >= 5 THEN
		SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Mỗi bài thi có tối đa 5 câu hỏi";
	END IF;
END //
DELIMITER ;

-- Question 05
DROP TRIGGER IF EXISTS question_05;

DELIMITER //
CREATE TRIGGER question_05
BEFORE DELETE ON account
FOR EACH ROW
BEGIN
    IF OLD.email = "admin@gmail.com" THEN
    SIGNAL SQLSTATE "45000"
    SET MESSAGE_TEXT = "Không thể xóa tài khoản admin";
    END IF;
END //
DELIMITER ;

-- Question 06
DROP TRIGGER IF EXISTS question_06;

DELIMITER //
CREATE TRIGGER question_06
BEFORE INSERT ON account
FOR EACH ROW
BEGIN
	DECLARE default_department_id INT;
    
    SELECT department_id INTO default_department_id
    FROM department
    WHERE department_name = "Phòng chờ";
    
    IF NEW.department_id IS NULL THEN
    SET NEW.department_id = default_department_id;
    END IF;
END //
DELIMITER ;

-- Question 07
DROP TRIGGER IF EXISTS question_07;

DELIMITER //
CREATE TRIGGER question_07
BEFORE INSERT ON answer 
FOR EACH ROW
BEGIN
    DECLARE num_of_answer INT;
    DECLARE num_of_is_correct INT;

    -- Đếm tổng số đáp án của câu hỏi
    SELECT COUNT(*) INTO num_of_answer
    FROM answer
    WHERE question_id = NEW.question_id;

    -- Đếm số đáp án đúng của câu hỏi
    SELECT COUNT(*) INTO num_of_is_correct
    FROM answer
    WHERE question_id = NEW.question_id AND is_correct = TRUE;

    -- Kiểm tra điều kiện: tối đa 4 đáp án và tối đa 2 đáp án đúng
    IF num_of_answer >= 4 THEN
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = 'Mỗi câu hỏi chỉ được có tối đa 4 đáp án.';
	END IF;
	IF  num_of_is_correct >= 2 AND NEW.is_correct = TRUE  THEN
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = 'Mỗi câu hỏi chỉ được có tối đa 2 câu trả lời đúng.';
    END IF;
END //
DELIMITER ;

-- Question 08


-- Question 09
DROP TRIGGER IF EXISTS question_09;

DELIMITER //
CREATE TRIGGER question_09
BEFORE DELETE ON exam
FOR EACH ROW
BEGIN
	IF OLD.create_date >= CURRENT_DATE - INTERVAL 2 DAY THEN
		SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Không thể xóa bài thi mới tạo được 2 ngày";
	END IF ;
END //
DELIMITER ;

-- Question 10
DROP TRIGGER IF EXISTS before_update_question;
DELIMITER //
CREATE TRIGGER before_update_question
BEFORE UPDATE ON exam_question
FOR EACH ROW
BEGIN
    DECLARE v_exam_count INT;
    
    SELECT COUNT(exam_id) INTO v_exam_count
    FROM exam_question
    WHERE question_id = OLD.question_id;

    IF v_exam_count > 0 THEN
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Không được phép cập nhật";
    END IF;
END //
DELIMITER ;  

DROP TRIGGER IF EXISTS before_delete_question;
DELIMITER //
CREATE TRIGGER before_delete_question
BEFORE DELETE ON question
FOR EACH ROW
BEGIN
	IF EXISTS (SELECT 1 FROM exam_question WHERE question_id = OLD.question_id) THEN 
		SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Câu hỏi đã có trong bài thi";
	END IF;
END //
DELIMITER ; 

-- Question 12
SELECT *,
    CASE
        WHEN duration <= 30 THEN "Short time"
        WHEN duration <= 60 THEN "Medium time"
        ELSE "Long time"
    END AS duration_type
FROM exam;

-- Question 13

WITH c1 AS (
	SELECT `group`.*, COUNT(account_id) AS account_count
    FROM group_account
    RIGHT JOIN `group` USING(group_id)
    GROUP BY group_id
)
SELECT *,
	CASE
		WHEN account_count <= 5 THEN "few"
        WHEN account_count <= 20 THEN "normal"
        ELSE "higher"
	END AS the_number_user_amount
FROM c1;

-- Question 14
WITH c1 AS(
	SELECT department.*, COUNT(account_id) AS account_count
    FROM department
    LEFT JOIN account USING(department_id)
    GROUP BY department_id
)
SELECT *,
	CASE
		WHEN account_count = 0 THEN "Không có user"
        ELSE account_count 
	END AS `status`
FROM c1;
