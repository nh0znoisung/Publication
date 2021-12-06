----- Create necessary stored procedure

Create OR ALTER PROCEDURE Capnhatprofile_TG (
@ID_TG Nvarchar(100),
@ho nvarchar(100),
@ten nvarchar(100),
@mail nvarchar(100) ,
@diachi nvarchar(200),
@chuyenmon nvarchar(100),
@coquancongtac nvarchar(500),
@nghenghiep nvarchar(100)
)
AS
BEGIN
UPDATE NHAKHOAHOC 
SET HO=@ho,TEN=@ten,EMAILCANHAN=@mail,DIACHI=@diachi,CHUYENMON=@chuyenmon,COQUANCONGTAC=@coquancongtac,NGHENGHIEP=@nghenghiep 
 WHERE NHAKHOAHOC_ID = @ID_TG
END
go

-- Thêm ID BPB
Create OR ALTER PROCEDURE ThemBaibao_TG (
@ID_BB Nvarchar(100),
@ID_BPB nvarchar(100),
@trangthaixuli nvarchar(20),
@file nvarchar(100),
@tieude nvarchar(100) ,
@tomtat nvarchar(1500),
@sotrang int,
@nhakhochocID nvarchar(500),
@ngaynhan date
)
AS
BEGIN
INSERT INTO BAIBAO VALUES (@ID_BB,@trangthaixuli,@file,@tieude,@tomtat,@sotrang,@nhakhochocID,@ngaynhan)
INSERT INTO BAIPHANBIEN(BAIPHANBIEN_ID,ID_BAIBAO,NGAYTHONGBAO) VALUES (@ID_BPB,@ID_BB,@ngaynhan)
END
go

-- Xóa BPB trước
Create OR ALTER PROCEDURE XoaBaibao_TG (
@ID_BB Nvarchar(100)
)
AS
BEGIN
DELETE FROM BAIPHANBIEN WHERE ID_BAIBAO=@ID_BB;
DELETE FROM BAIBAO WHERE ID_BAIBAO=@ID_BB;
END
go

Create OR ALTER PROCEDURE CapnhatBaibao_TG (
@ID_BB Nvarchar(100),
@file nvarchar(100),
@tieude nvarchar(100) ,
@tomtat nvarchar(1500),
@sotrang int
)
AS
BEGIN
UPDATE BAIBAO
SET FILEBAIBAO=@file,TIEUDE=@tieude,TOMTAT=@tomtat,TONGSOTRANG=@sotrang
 WHERE ID_BAIBAO=@ID_BB;
END
go


-------------- BBT
Create OR ALTER PROCEDURE Capnhatprofile_BBT (
@ID_TG Nvarchar(100),
@ho nvarchar(100),
@ten nvarchar(100),
@mail nvarchar(100) ,
@diachi nvarchar(200),
@chuyenmon nvarchar(100),
@coquancongtac nvarchar(500),
@nghenghiep nvarchar(100),
@email nvarchar(200)
)
AS
BEGIN
UPDATE NHAKHOAHOC 
SET HO=@ho,TEN=@ten,EMAILCANHAN=@mail,DIACHI=@diachi,CHUYENMON=@chuyenmon,COQUANCONGTAC=@coquancongtac,NGHENGHIEP=@nghenghiep 
 WHERE NHAKHOAHOC_ID = @ID_TG

UPDATE BIENTAPVIEN
SET EMAILCOQUAN=@email
 WHERE NHAKHOAHOC_ID = @ID_TG
END
go


------------- NPB
Create OR ALTER PROCEDURE Capnhatprofile_NPB (
@ID_TG Nvarchar(100),
@ho nvarchar(100),
@ten nvarchar(100),
@mail nvarchar(100) ,
@diachi nvarchar(200),
@chuyenmon nvarchar(100),
@coquancongtac nvarchar(500),
@nghenghiep nvarchar(100),

@email nvarchar(200),
@sdt nvarchar(100),
@trinhdo nvarchar(100),
@ngaycongtac date
)
AS
BEGIN
UPDATE NHAKHOAHOC 
SET HO=@ho,TEN=@ten,EMAILCANHAN=@mail,DIACHI=@diachi,CHUYENMON=@chuyenmon,COQUANCONGTAC=@coquancongtac,NGHENGHIEP=@nghenghiep 
 WHERE NHAKHOAHOC_ID = @ID_TG

UPDATE NGUOIPHANBIEN
SET EMAILCOQUAN=@email, SODIENTHOAI=@sdt, TRINHDO=@trinhdo, NGAYCONGTAC=@ngaycongtac
 WHERE NHAKHOAHOC_ID = @ID_TG
END
go

-- Change status, split 2 parts
Create OR ALTER PROCEDURE ThemPhancong_BBT_1 (
@ID_BB Nvarchar(100),
@ID_BPB Nvarchar(100),
@diadiem nvarchar(200),
@ngayPB date
)
AS
BEGIN
UPDATE BAIBAO SET TRANGTHAIXULI = 'PHANBIEN' WHERE ID_BAIBAO = @ID_BB -- Change status
INSERT INTO PHANCONGPHANBIEN VALUES (@ID_BPB,@ID_BB,@ngayPB,@diadiem) --one
END
go

--for each
Create OR ALTER PROCEDURE ThemPhancong_BBT_2 (
@ID_BB Nvarchar(100),
@ID_BPB Nvarchar(100),
@ID_NKH nvarchar(100)
)
AS
BEGIN
INSERT INTO THUCHIENPHANBIEN VALUES (@ID_BPB,@ID_BB,@ID_NKH) --foreach
END
go


Create OR ALTER PROCEDURE ThemChamdiem_NPB (
@ID_BB Nvarchar(100),
@ID_BPB Nvarchar(100),
@ID_NKH nvarchar(100),
@mota varchar(20),
@diem int
)
AS
BEGIN
INSERT INTO THUCHIENPHANBIEN_TIEUCHIPHANBIEN VALUES (@mota,@diem,@ID_BPB,@ID_BB,@ID_NKH) --foreach
--UPDATE BAIBAO SET TRANGTHAIXULI = 'PHANHOIPHANBIEN' WHERE ID_BAIBAO = @ID_BB -- Change status
END
go

----------- Select 
---- NPB
--select b.BAIPHANBIEN_ID,b.ID_BAIBAO,t.NHAKHOAHOC_ID as ID_NGUOIPHANBIEN,CONCAT(n.HO, ' ', n.TEN) as TENNGUOICHAMDIEM from BAIPHANBIEN b JOIN THUCHIENPHANBIEN t ON b.ID_BAIBAO = t.ID_BAIBAO AND b.BAIPHANBIEN_ID = t.BAIPHANBIEN_ID JOIN NHAKHOAHOC n ON t.NHAKHOAHOC_ID = n.NHAKHOAHOC_ID
----JOIN THUCHIENPHANBIEN_TIEUCHIPHANBIEN tt on b.ID_BAIBAO = tt.ID_BAIBAO AND b.BAIPHANBIEN_ID = tt.BAIPHANBIEN_ID AND t.NHAKHOAHOC_ID = tt.NHAKHOAHOC_ID

---- BBT
--select p.BAIPHANBIEN_ID, p.ID_BAIBAO, t.NHAKHOAHOC_ID ,CONCAT(n.HO, ' ', n.TEN) as TENNGUOIPHANBIEN, p.DIADIEMPHANBIEN, p.NGAYPHANBIEN from THUCHIENPHANBIEN t join PHANCONGPHANBIEN p on t.BAIPHANBIEN_ID = p.BAIPHANBIEN_ID and t.ID_BAIBAO = p.ID_BAIBAO join NHAKHOAHOC n on n.NHAKHOAHOC_ID = t.NHAKHOAHOC_ID


--select b.ID_BAIBAO,bb.BAIPHANBIEN_ID,b.NHAKHOAHOC_ID,CONCAT(n.HO, ' ', n.TEN) as TENTACGIA,TIEUDE,FILEBAIBAO,TONGSOTRANG,TOMTAT from BAIBAO b JOIN NHAKHOAHOC n on b.NHAKHOAHOC_ID = n.NHAKHOAHOC_ID JOIN BAIPHANBIEN bb on b.ID_BAIBAO = bb.ID_BAIBAO where TRANGTHAIXULI='CHUAPHANBIEN'

--- NPB Task
--select BAIPHANBIEN_ID,t.ID_BAIBAO,b.NHAKHOAHOC_ID as ID_TENTACGIA,CONCAT(n.HO, ' ', n.TEN) as TENTACGIA,TIEUDE from THUCHIENPHANBIEN t join BAIBAO b on t.ID_BAIBAO = b.ID_BAIBAO join NHAKHOAHOC n on n.NHAKHOAHOC_ID = b.NHAKHOAHOC_ID where (SELECT COUNT(*) FROM THUCHIENPHANBIEN_TIEUCHIPHANBIEN where MOTA='HINHTHUC' and BAIPHANBIEN_ID=t.BAIPHANBIEN_ID and ID_BAIBAO=t.ID_BAIBAO and NHAKHOAHOC_ID=t.NHAKHOAHOC_ID) = 0 and t.NHAKHOAHOC_ID='200002' 


