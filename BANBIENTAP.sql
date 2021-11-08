-- Ban biên tập -> Create View, Role, Permission
-- Câu 1: Trigger Phân công phản biện
--CREATE OR ALTER TRIGGER tên_trigger ON tên_bảng after
--FOR {DELETE, INSERT, UPDATE}
--AS 
--câu_lệnh_sql       old value



-- Câu 2: Trigger Trạng thái xử lý 1 bài báo # Chỉ được chuyển 1 bậc
-- CHuyển thành procedure để mỗi khi gọi thì nó sẽ chỉnh lên 1 bậc, dùng If_else
-- Chưa phản biện, Proceduce -> có 1 input, vì Function phải return gì đó
CREATE OR ALTER FUNCTION capnhat_trangthaixuly (@id_baibao nvarchar(100))

AS
BEGIN
	UPDATE BAIBAO
	IF TRANGTHAIXULI = 'CHUAPHANBIEN'
		SET TRANGTHAIXULI = 'PHANBIEN'
	IF TRANGTHAIXULI = 'PHANBIEN'
		SET TRANGTHAIXULI = 'PHANHOIPHANBIEN'
	IF TRANGTHAIXULI = 'PHANHOIPHANBIEN'
		SET TRANGTHAIXULI = 'HOANTATPHANBIEN'
	IF TRANGTHAIXULI = 'HOANTATPHANBIEN'
		SET TRANGTHAIXULI = 'XUATBAN'
	IF TRANGTHAIXULI = 'XUATBAN'
		SET TRANGTHAIXULI = 'DADANG'
	--IF TRANGTHAIXULI = 'DADANG'
	--	SET TRANGTHAIXULI = ''
	WHERE b.ID_BAIBAO = @id_baibao
END;

CREATE OR ALTER FUNCTION Tacgia_Danhsach_Baibao_Dadang(@tgID nvarchar(100))
RETURNS TABLE
AS
RETURN
(
	SELECT * 
	FROM BAIBAO b
	WHERE TRANGTHAIXULI='DADANG' AND 
		   b.ID_BAIBAO IN (SELECT ID_BAIBAO FROM SANGTAC WHERE NHAKHOAHOC_ID = @tgID)
)
GO


-- Câu 3: Trigger kết quả sau phản biện của 1 bài báo

-- Câu 4: Trigger kết quả sau hoàn tất phản biện của 1 bài báo
-- IF trạng thái xử lý 



--------------- Nghiên cứu là code thuần or Procedure và how to convert it
--------Procedure return table
--CREATE PROCEDURE SelectAllCustomers
--AS
--SELECT * FROM Customers
--GO;

--EXEC update_trangthaixuly
--------Procedure return 1 biến
--CREATE PROCEDURE spNhanvien
--@nhanvien_name VARCHAR(50) OUT
--AS
--BEGIN
--DECLARE @nhanvien_id INT;
--SET @nhanvien_id = 8;
--IF @nhanvien_id < 10
--SET @nhanvien_name = 'Smith';
--ELSE
--SET @nhanvien_name = 'Lawrence';

--END;


-- Câu 5: Xem bài báo theo (nghiên cứu, PB sách, tổng quan) chưa được xử lý PB -> Trước cái Phản biện
-- Trang thai xu ly = PhanBien (CHUAPHANBIEN)

-- Câu 5.1: Nghiêncuu
SELECT * 
FROM BAIBAO b
WHERE TRANGTHAIXULI='PHANBIEN' AND b.ID_BAIBAO IN (SELECT ID_BAIBAO FROM NGHIENCUU)

-- Câu 5.2: Phanbiensach
SELECT * 
FROM BAIBAO b
WHERE TRANGTHAIXULI='PHANBIEN' AND b.ID_BAIBAO IN (SELECT ID_BAIBAO FROM PHANBIENSACH)

-- Câu 5.3: Tổng quan
SELECT * 
FROM BAIBAO b
WHERE TRANGTHAIXULI='PHANBIEN' AND b.ID_BAIBAO IN (SELECT ID_BAIBAO FROM TONGQUAN)

--------------------------------------------------
-- Câu 6: Xem bài báo theo (nghiên cứu, PB sách, tổng quan) được xuất bản
-- Trang thai xu ly = XUATBAN
-- Câu 6.1: Nghiêncuu
SELECT * 
FROM BAIBAO b
WHERE TRANGTHAIXULI='XUATBAN' AND b.ID_BAIBAO IN (SELECT ID_BAIBAO FROM NGHIENCUU)

-- Câu 6.2: Phanbiensach
SELECT * 
FROM BAIBAO b
WHERE TRANGTHAIXULI='XUATBAN' AND b.ID_BAIBAO IN (SELECT ID_BAIBAO FROM PHANBIENSACH)

-- Câu 6.3: Tổng quan
SELECT * 
FROM BAIBAO b
WHERE TRANGTHAIXULI='XUATBAN' AND b.ID_BAIBAO IN (SELECT ID_BAIBAO FROM TONGQUAN)

--------------------------------------------------
-- Câu 7: Xem bài báo theo (nghiên cứu, PB sách, tổng quan) đã đăng - Bài báo đã được chấp nhận(Năm xuất bản)->year, trong 3 năm gần nhất 
-- Trang thai xu ly = DADANG, 'TRUYENTHONG', 'OPENACCESS'
-- Câu 7.1: Nghiêncuu
SELECT * 
FROM BAIBAO b
WHERE TRANGTHAIXULI='DADANG' AND 
	   b.ID_BAIBAO IN (SELECT ID_BAIBAO FROM NGHIENCUU) AND
	   b.ID_BAIBAO IN (SELECT ID_BAIBAO FROM BAIBAODADUOCCHAPNHAN c WHERE YEAR(GETDATE())-c.NAMXUATBAN <= 3)

-- Câu 7.2: Phanbiensach
SELECT * 
FROM BAIBAO b
WHERE TRANGTHAIXULI='DADANG' AND 
	   b.ID_BAIBAO IN (SELECT ID_BAIBAO FROM PHANBIENSACH) AND
	   b.ID_BAIBAO IN (SELECT ID_BAIBAO FROM BAIBAODADUOCCHAPNHAN c WHERE YEAR(GETDATE())-c.NAMXUATBAN <= 3)

-- Câu 7.3: Tổng quan
SELECT * 
FROM BAIBAO b
WHERE TRANGTHAIXULI='DADANG' AND 
	   b.ID_BAIBAO IN (SELECT ID_BAIBAO FROM TONGQUAN) AND
	   b.ID_BAIBAO IN (SELECT ID_BAIBAO FROM BAIBAODADUOCCHAPNHAN c WHERE YEAR(GETDATE())-c.NAMXUATBAN <= 3)


--------------------------------------------------
-- Câu 8: Xem bài báo  đã xuất bản của 1 Tác giả - Function input là ID của Tác giả (NHAKHOAHOC_ID)
-- Trang thai xu ly = XUATBAN, Có cần check id là Tacgia
-- 

CREATE OR ALTER OR ALTER FUNCTION Tacgia_Danhsach_Baibao_Xuatban(@tgID nvarchar(100))
RETURNS TABLE
AS
RETURN
(
	SELECT * 
	FROM BAIBAO b
	WHERE TRANGTHAIXULI='XUATBAN' AND 
		   b.ID_BAIBAO IN (SELECT ID_BAIBAO FROM SANGTAC WHERE NHAKHOAHOC_ID = @tgID)
)
GO


SELECT * FROM Tacgia_Danhsach_Baibao_Xuatban('200001')


--------------------------------------------------
-- Câu 9: Xem bài báo  đã đăng của 1 Tác giả - Function input là ID của Tác giả (NHAKHOAHOC_ID)
-- Trang thai xu ly = DADANG, Có cần check id là Tacgia
-- Phải có Tác giả trước -> Người có quyền tác giả 

CREATE OR ALTER FUNCTION Tacgia_Danhsach_Baibao_Dadang(@tgID nvarchar(100))
RETURNS TABLE
AS
RETURN
(
	SELECT * 
	FROM BAIBAO b
	WHERE TRANGTHAIXULI='DADANG' AND 
		   b.ID_BAIBAO IN (SELECT ID_BAIBAO FROM SANGTAC WHERE NHAKHOAHOC_ID = @tgID)
)
GO

SELECT * FROM Tacgia_Danhsach_Baibao_Dadang('200002')

--------------------------------------------------
-- Câu 10: Xem tổng bài báo đang phản biện
SELECT COUNT(b.ID_BAIBAO) AS TONGSOBAIBAO
FROM BAIBAO b
WHERE TRANGTHAIXULI='PHANBIEN' 

--------------------------------------------------
-- Câu 11: Xem tổng bài báo đang phản hồi phản biện
SELECT COUNT(b.ID_BAIBAO) AS TONGSOBAIBAO
FROM BAIBAO b
WHERE TRANGTHAIXULI='PHANHOIPHANBIEN'

--------------------------------------------------
-- Câu 12: Xem tổng bài báo đang xuất bản
SELECT COUNT(b.ID_BAIBAO) AS TONGSOBAIBAO
FROM BAIBAO b
WHERE TRANGTHAIXULI='XUATBAN'