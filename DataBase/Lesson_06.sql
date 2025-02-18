-- STORED PRODUCEDURE: Thủ tục lưu trữ
-- VD: Tạo thủ tục lưu trữ tìm kiếm phòng ban theo id

-- Xóa thủ tục nếu tồn tại 
DROP PROCEDURE IF EXISTS find_department_by_id;

-- Tạo thủ tục 
DELIMITER //
CREATE PROCEDURE find_department_by_id (IN in_department_id INT)
BEGIN
	SELECT *
    FROM department
    WHERE department_id = in_department_id;
END //
DELIMITER ;

-- Gọi thủ tục
CALL find_department_by_id(8);

-- Tạo thủ tục lấy ra tất cả DEV
DROP PROCEDURE IF EXISTS show_dev;
-- OUT out_info_dev
DELIMITER //
CREATE PROCEDURE show_dev()
BEGIN
	DECLARE v_position_id INT;
    
	SELECT position_id INTO v_position_id
	FROM position
	WHERE position_name = "Dev";
    
	SELECT *
    FROM account
    WHERE position_id = v_position_id;
END //
DELIMITER ;

CALL show_dev();

-- Từ khóa IN/ OUT/ INOUT
-- VD: Tạo thủ tục lấy ra tên phòng ban

DROP PROCEDURE IF EXISTS sp_03;
-- OUT
DELIMITER //
CREATE PROCEDURE sp_03(IN in_department_id INT,
						OUT out_department_name VARCHAR(50))
BEGIN
	SELECT department_name INTO out_department_name
    FROM department
	WHERE department_id = in_department_id;
END //
DELIMITER ;

SET @department_name = NULL;
CALL sp_03(8, @department_name);
SELECT @department_name;

-- FUNCTION: Hàm
-- VD: Tạo function trả về tên phòng ban theo id
SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION IF EXISTS fn_01;
DELIMITER $$
CREATE FUNCTION fn_01 (in_department_id INT) RETURNS VARCHAR(50)
BEGIN
    DECLARE v_department_name VARCHAR(50);
    
    SELECT department_name INTO v_department_name
    FROM department
    WHERE department_id = in_department_id;
    
    RETURN v_department_name;
END $$
DELIMITER ;

SELECT fn_01(10);

DROP FUNCTION IF EXISTS fn_02;

DELIMITER //
CREATE FUNCTION fn_02(in_type_id INT)
RETURNS INT
BEGIN
	DECLARE v_type_id INT;
    
	WITH q_counting AS(
    SELECT type_id, COUNT(question_id) AS counting_q
    FROM type_question
    LEFT JOIN question USING(type_id)
    GROUP BY type_id)
    SELECT type_id INTO v_type_id
    FROM q_counting
    WHERE counting_q = (
						SELECT MAX(counting_q)
                        FROM q_counting);
	RETURN v_type_id;
END //
DELIMITER ;

SELECT type_name
FROM type_question
WHERE type_id = fn_02();