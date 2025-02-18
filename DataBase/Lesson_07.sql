-- LOCAL VARIABLE: Biến cục bộ
	-- Phạm vi: trong khối BEGIN ... END
	-- DECLARE v_department_id INT;
		DROP PROCEDURE IF EXISTS sp_01;
		DELIMITER $$
		CREATE PROCEDURE sp_01 ()
		BEGIN
			DECLARE a INT DEFAULT 100;
			SELECT a;
		END $$
		DELIMITER ;

		CALL sp_01();
		SELECT a;
-- SESSION VARIABLE: Biến session
	-- Phạm vi: trong một phiên làm việc session
    -- VD:
    SET @b = 1000;
    
-- GLOBAL VARIABLE: Biến toàn cục 
	-- Phạm vi: Trong tất cả MySQL
    -- Hiện thị danh sách các biến
	SHOW VARIABLES;
    -- Thay đổi giá trị
    SET connect_timeout = 3;
    
-- TRIGGER
	-- Thời điểm: BEFORE / AFTER
    -- Sự kiện: INSERT / UPDATE / DELETE
    -- Tham chiếu: NEW / OLD
    DROP TRIGGER IF EXISTS trigger_01;
	DELIMITER $$
	CREATE TRIGGER trigger_01
	BEFORE INSERT ON group_account
	FOR EACH ROW
	BEGIN
		IF NEW.join_date > CURRENT_DATE THEN
			SIGNAL SQLSTATE "45000"
			SET MESSAGE_TEXT = "Ngày tham gia không hợp lệ";
		END IF;
	END $$
	DELIMITER ;
    
    INSERT INTO group_account(account_id, group_id, join_date)
    VALUES(1, 10, "2000-01-01");
    
-- case when

SELECT *,
    CASE
        WHEN duration <= 30 THEN "Short time"
        WHEN duration <= 60 THEN "Medium time"
        ELSE "Long time"
    END AS duration_type
FROM exam;