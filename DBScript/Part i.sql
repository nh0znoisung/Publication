-- Ban biên tập -> Create View, Role, Permission
-- Câu 1: Trigger Phân công phản biện
-- Bảng thực hiện phản biện có vấn đề

go 
CREATE OR ALTER PROCEDURE capnhat_phancongphanbien
(
@BAIPHANBIEN_ID nvarchar(100),
@ID_BAIBAO nvarchar(100),
@NGAYPHANBIEN varchar(20),
@DIADIEMPHANBIEN datetime
)
AS
BEGIN
INSERT INTO PHANCONGPHANBIEN VALUES (@BAIPHANBIEN_ID,@ID_BAIBAO,@NGAYPHANBIEN,@DIADIEMPHANBIEN);
--INSERT INTO THUCHIENPHANBIEN VALUES (@BAIPHANBIEN_ID,@ID_BAIBAO,@NHAKHOAHOC_ID);
END;
go


-- Câu 2: Trigger Trạng thái xử lý 1 bài báo # Chỉ được chuyển 1 bậc
CREATE OR ALTER PROCEDURE capnhat_trangthaixuly 
(
@id_baibao nvarchar(100),
@TRANGTHAIXULI varchar(20)
)
AS
BEGIN
UPDATE BAIBAO 
SET TRANGTHAIXULI = @TRANGTHAIXULI
WHERE ID_BAIBAO = @id_baibao
END;
go



-- Câu 3: Trigger kết quả sau phản biện của 1 bài báo
CREATE OR ALTER PROCEDURE capnhat_ketquasauphanbien
(
@ID_BAIBAO nvarchar(100),
@ID_baiphanbien nvarchar(100),
@ghichutacgia nvarchar(100),
@ghichubanbientap nvarchar(100),
@ngaythongbao datetime,
@ketqua Ketquabaiphanbien,
@cacchitietkhac nvarchar(1000)
)
as
	UPDATE BAIPHANBIEN
	SET GHICHU_BANBIENTAP=@ghichubanbientap ,GHICHU_TACGIA =@ghichutacgia , NGAYTHONGBAO=@ngaythongbao ,KETQUA=@ketqua, CACCHITIETKHAC=@cacchitietkhac
	where BAIPHANBIEN_ID = @ID_baiphanbien AND ID_BAIBAO = @ID_BAIBAO
go


-- Câu 4: Trigger kết quả sau hoàn tất phản biện của 1 bài báo
CREATE OR ALTER PROCEDURE capnhat_ketquasauhoantatphanbien
(
@ID_BAIBAO nvarchar(100),
@ID_baiphanbien nvarchar(100),
@ghichutacgia nvarchar(100),
@ghichubanbientap nvarchar(100),
@ngaythongbao datetime,
@ketqua Ketquabaiphanbien,
@cacchitietkhac nvarchar(1000)
)
as
	UPDATE BAIPHANBIEN
	SET GHICHU_BANBIENTAP=@ghichubanbientap ,GHICHU_TACGIA =@ghichutacgia , NGAYTHONGBAO=@ngaythongbao ,KETQUA=@ketqua, CACCHITIETKHAC=@cacchitietkhac
	where BAIPHANBIEN_ID = @ID_baiphanbien AND ID_BAIBAO = @ID_BAIBAO
go

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
go
CREATE OR ALTER FUNCTION Tacgia_Danhsach_Baibao_Xuatban(@tgID nvarchar(100))
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
go
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
