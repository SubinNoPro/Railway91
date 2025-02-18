-- SUBQUERY: Truy vấn con
SELECT *
FROM account
WHERE department_id = 
	(SELECT department_id
	FROM department
	WHERE department_name = "Giám đốc");

-- nguyen
-- Toán tử: IN, ANY, ALL, EXISTS
SELECT department_name
FROM department
WHERE department_id IN 
	(SELECT DISTINCT department_id
	FROM account
	WHERE full_name LIKE "Nguyễn%");

-- VD: Lấy ra câu hỏi có nhiều câu trả lời nhất
-- Bước 1
SELECT COUNT(answer_id) AS answer_count
FROM answer
RIGHT JOIN question USING(question_id)
GROUP BY question_id
;

-- Bước 2
SELECT MAX(answer_count)
FROM (
	SELECT COUNT(answer_id) AS answer_count
	FROM answer
	RIGHT JOIN question USING(question_id)
	GROUP BY question_id) AS count_answer;

-- Bước 3
SELECT question.*
FROM answer
RIGHT JOIN question USING(question_id)
GROUP BY question_id
HAVING COUNT(answer_id) = (
							SELECT MAX(answer_count)
							FROM (
									SELECT COUNT(answer_id) AS answer_count
									FROM answer
									RIGHT JOIN question USING(question_id)
									GROUP BY question_id) AS count_answer);
                                    
                                    
-- VIEW: Bảng ảo 
-- Syntax
CREATE OR REPLACE VIEW view_01 AS
SELECT *
FROM department;

-- SD VIEW
SELECT *
FROM view_01;

-- Xóa view: DROP VIEW IF EXISTS tên view


-- CTE: Bảng tạm

WITH count_answer AS (
					SELECT question.*, COUNT(answer_id) AS answer_count
					FROM answer
					RIGHT JOIN question USING(question_id)
					GROUP BY question_id
)
SELECT *
FROM count_answer
WHERE answer_count=(SELECT MAX(answer_count)
					FROM count_answer)
;

