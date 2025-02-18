DROP DATABASE IF EXISTS final_exam;
CREATE DATABASE final_exam;
USE  final_exam;

CREATE TABLE GiangVien (
magv					INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
hoten					VARCHAR(50) NOT NULL,
luong					INT NOT NULL
);

CREATE TABLE SinhVien(
masv					INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
hoten					VARCHAR(50) NOT NULL,
namsinh					YEAR NOT NULL,
quequan					VARCHAR(100)
);

CREATE TABLE DeTai(
madt					INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
tendt					VARCHAR(150) NOT NULL,
kinhphi					INT NOT NULL,
noithuctap				VARCHAR(100)
);

CREATE TABLE HuongDan(
id						INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
masv					INT UNSIGNED NOT NULL,
madt					INT UNSIGNED NOT NULL,
magv					INT UNSIGNED NOT NULL,
ketqua					VARCHAR(50),
    FOREIGN KEY (masv)
        REFERENCES SinhVien (masv)
        ON UPDATE CASCADE ON DELETE CASCADE,
        
	FOREIGN KEY (madt)
        REFERENCES DeTai (madt)
        ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (magv)
        REFERENCES GiangVien (magv)
        ON UPDATE CASCADE ON DELETE CASCADE

);

INSERT INTO GiangVien	(hoten,					luong)
VALUES					("Nguyen Van Khoa",		15000000),
						("Nguyen Van Toan",		10000000),
						("Tran Thi Thuy Tien",	18000000);

INSERT INTO SinhVien	(hoten			 , namsinh			,quequan)
VALUES					("Xa Quy Toai" 	 ,2003, "Hoa Binh"),
						("Tran Ha Linh"  ,2003,"Ha Noi"),
                        ("Tran Quang Bao",2003, "Thai Binh");
                        
INSERT INTO DeTai	(tendt				 ,kinhphi   ,noithuctap	)
VALUES				("CONG NGHE SINH HOC", 20000000 ,"TP. HCM" 	),
					("TU DONG HOA"		 ,15000000  ,"Ha Noi"),
                    ("KHOA HOC LUONG TU" ,30000000  ,"Binh Duong");
                    
INSERT INTO HuongDan	(masv	,madt	,magv	,ketqua	)
VALUES					(1		,3		,1		,"DAT"	),
                        (3		,1		,3		,"DAT"	);

-- Lấy sinh viên chưa có đề tài hướng dẫn                        
SELECT *
FROM SinhVien SV
LEFT JOIN HuongDan HD ON SV.masv = HD.masv
WHERE HD.masv IS NULL;

-- Lấy số sinh viên làm đề tài "Công nghệ sinh học"
SELECT COUNT(masv) AS sv_count
FROM HuongDan
JOIN DeTai USING(madt)
WHERE tendt = "CONG NGHE SINH HOC"
GROUP BY madt;                        

-- Tạo view SinhVienInfo
CREATE OR REPLACE VIEW SinhVienInfo AS
SELECT masv, hoten,
					CASE
					WHEN tendt IS NULL THEN "Chua co"
					ELSE tendt
					END AS tendt
FROM HuongDan
RIGHT JOIN SinhVien USING(masv)
LEFT JOIN DeTai	USING(madt);

-- Tạo trigger không cho phép nhập sinh viên có năm sinh <= 1900
DROP TRIGGER IF EXISTS check_bd;
DELIMITER //
CREATE TRIGGER check_bd
BEFORE INSERT ON SinhVien
FOR EACH ROW
BEGIN
	IF NEW.namsinh <= 1910 THEN
    SIGNAL SQLSTATE "45000"
    SET MESSAGE_TEXT = "Nam sinh phai > 1900";
    END IF;
END //
DELIMITER ;

INSERT INTO SinhVien	(hoten			 , namsinh			,quequan)
VALUES					("XaA QuyY Toaii" 	 ,1900, "Hoa Binh");

-- Cấu hình (PROCEDURE) khi xóa sinh viên thì thông tin ở bảng hướng dẫn cũng bị xóa
DROP PROCEDURE IF EXISTS delete_sv;
DELIMITER //
CREATE PROCEDURE delete_sv (IN in_tensv VARCHAR(50))
BEGIN
	DECLARE v_masv INT;
    
    SELECT masv INTO v_masv
    FROM SinhVien
    WHERE hoten = in_tensv;
    
    DELETE FROM HuongDan
    WHERE masv = v_masv;
    
    DELETE FROM SinhVien
    WHERE masv = v_masv;
    
END //
DELIMITER ;

DELIMITER $$
DROP TRIGGER IF EXISTS before_delete_sinhvien;
CREATE TRIGGER before_delete_sinhvien
BEFORE DELETE ON SinhVien
FOR EACH ROW
BEGIN
	DELETE FROM HuongDan WHERE masv = OLD.masv;
END$$
DELIMITER ;

                        
