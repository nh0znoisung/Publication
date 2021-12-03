--iii.1
Create PROCEDURE Capnhatthongtin_Tacgiall (
@ID_tacgiall Nvarchar(100),
@ho nvarchar(100),
@ten nvarchar(100),
@mail nvarchar(100) ,
@diachi nvarchar(200),
@chuyenmon nvarchar(100),
@ngaysinh date,
@coquancongtac nvarchar(500),
@nghenghiep nvarchar(100)
)
AS
BEGIN
UPDATE NHAKHOAHOC 
SET HO=@ho,TEN=@ten,EMAILCANHAN=@mail,DIACHI=@diachi,CHUYENMON=@chuyenmon,NGAYSINH=@ngaysinh,COQUANCONGTAC=@coquancongtac,NGHENGHIEP=@nghenghiep 
 WHERE NHAKHOAHOC_ID = @ID_tacgiall
END
go
--iii.2
create Procedure Capnhapthongtin_BaiBao (
	@ID_tacgiall nvarchar(100),
	@id_BAIBAO NVARCHAR(100),
	@trangthaixuli Trangthaixuli,
	@file nvarchar(100),
	@tieude nvarchar(150),
	@tomtat nvarchar(1500),
	@tongsotrang int
)
as
begin
UPdate BAIBAO 
set 	
    TRANGTHAIXULI = @trangthaixuli ,
	FILEBAIBAO = @file ,
	TIEUDE = @tieude ,
	TOMTAT=  @tomtat ,
	TONGSOTRANG= @tongsotrang 
where ID_BAIBAO = @id_BAIBAO 
	AND @ID_tacgiall IN (
	SELECT  NHAKHOAHOC_ID FROM TACGIALIENLAC 
	)
	AND NHAKHOAHOC_ID = @ID_tacgiall  
end
go
--iii.3
create procedure Xemtacgia_Cuabaibao 
(@id_BAIBAO NVARCHAR(100))
as 
select ST.ID_BAIBAO,NKH.* from 
 SANGTAC ST inner join NHAKHOAHOC NKH on ST.NHAKHOAHOC_ID=NKH.NHAKHOAHOC_ID
Where  ST.ID_BAIBAO=@id_BAIBAO 
go
--iii.4
create procedure Xemtrangthaixuli_Cuabaibao 
(@id_BAIBAO NVARCHAR(100))
as 
select BB.ID_BAIBAO,BB.TRANGTHAIXULI from 
BAIBAO BB 
Where BB.ID_BAIBAO=@id_BAIBAO
go
--iii.5
create procedure Xemketquaphanbien_Cuabaibao 
(@id_BAIBAO NVARCHAR(100))
as 
select BPB.ID_BAIBAO,BPB.KETQUA from 
 BAIPHANBIEN BPB 
Where  BPB.ID_BAIBAO=@id_BAIBAO
go
--	iii.6
create procedure Xemds_Cacbaibao_trong1nam 
(@year int)
as 
select BB.NHAKHOAHOC_ID,BB.NGAYNHAN,BB.* from 
 BAIBAO BB 
Where  YEAR(BB.NGAYNHAN)=@year
go
-- iii.7
create procedure Xemds_Cacbaibao_dadcdang_trong1nam 
(@year int)
as 
select BBDDCN.*,BB.* from 
BAIBAODADUOCCHAPNHAN BBDDCN inner join BAIBAO BB on BBDDCN.ID_BAIBAO=BB.ID_BAIBAO
Where  BBDDCN.NAMXUATBAN=@year
go
-- iii.8
create procedure Xemds_Cacbaibao_dangdcxuatban 
as 
select BBDDCN.*,BB.* from 
BAIBAODADUOCCHAPNHAN BBDDCN 
inner join BAIBAO BB on BBDDCN.ID_BAIBAO=BB.ID_BAIBAO
Where BBDDCN.NAMXUATBAN=YEAR( CURRENT_TIMESTAMP)
go
-- iii.9 
create procedure ds_Baibao_ketquate 
AS
select BB.* ,BPB.KETQUA from
BAIBAO BB INNER JOIN BAIPHANBIEN BPB ON BB.ID_BAIBAO=BPB.ID_BAIBAO 
WHERE BPB.KETQUA = 'REJECTION'
GO
-- iii.10
create procedure Tongbb_daguitapchi_trong5namgannhat
as
select count(*) AS TONG from
BAIBAO
where YEAR( CURRENT_TIMESTAMP) - Year( NGAYNHAN) <=5
go
-- iii.11
create procedure Tongbb_Nghiencuu_dadang_trong5namgannhat
as
select count(*) from
BAIBAO BB inner join BAIBAODADUOCCHAPNHAN BBDDCN on BB.ID_BAIBAO=BBDDCN.ID_BAIBAO
where BB.ID_BAIBAO like 'a0%' AND YEAR( CURRENT_TIMESTAMP)-BBDDCN.NHAXUATBAN <=5
go
-- iii.12
create procedure Tongbb_Tongquan_dadang_trong5namgannhat
as
select count(*) from
BAIBAO BB inner join BAIBAODADUOCCHAPNHAN BBDDCN on BB.ID_BAIBAO=BBDDCN.ID_BAIBAO
where BB.ID_BAIBAO like 'a1%' AND YEAR( CURRENT_TIMESTAMP)-BBDDCN.NHAXUATBAN <=5
