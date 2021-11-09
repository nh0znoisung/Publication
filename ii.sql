
-- ii.1

Create PROCEDURE capnhatthongtinnhaphanbien (
@ID_phanbienvien Nvarchar(100),
@ho nvarchar(100),
@ten nvarchar(100),
@mail nvarchar(100) ,
@diachi nvarchar(200),
@chuyenmon nvarchar(100),
@vaitro nvarchar(100),
@ngaysinh date,
@coquancongtac nvarchar(500),
@nghenghiep nvarchar(100)
)
AS
BEGIN
UPDATE NHAKHOAHOC 
SET HO=@ho,TEN=@ten,EMAILCANHAN=@mail,DIACHI=@diachi,CHUYENMON=@chuyenmon,VAITRO=@vaitro,NGAYSINH=@ngaysinh,COQUANCONGTAC=@coquancongtac,NGHENGHIEP=@nghenghiep 
 WHERE NHAKHOAHOC_ID = @ID_phanbienvien
END
go
-- ii.2


CREATE PROCEDURE capnhapbaiphanbien (
@ID_phanbienvien Nvarchar(100),
@ID_baiphanbien nvarchar(100),
@ghichutacgia nvarchar(100),
@ghichubanbientap nvarchar(100),
@ngaythongbao datetime,
@ketqua Ketquabaiphanbien,
@cacchitietkhac nvarchar(1000)

)
as
	UPDATE BAIPHANBIEN
	SET GHICHU_BANBIENTAP=@ghichubanbientap ,GHICHU_TACGIA =@ghichutacgia , NGAYTHONGBAO=@ngaythongbao ,KETQUA=@ngaythongbao, CACCHITIETKHAC=@cacchitietkhac
	where BAIPHANBIEN_ID = @ID_baiphanbien AND 
	BAIPHANBIEN_ID IN (
		SELECT BNT.BAIPHANBIEN_ID FROM  BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN BNT
		WHERE BNT.NHAKHOAHOC_ID= @ID_phanbienvien 
	)
go

-- ii.3
create procedure Xemdanhsachcacbaibaotheomoiloai
(@ID_phanbienvien Nvarchar(100))
as
begin
	begin
		select B.*
		from  BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN BNT INNER JOIN  BAIBAO B ON BNT.ID_BAIBAO = B.ID_BAIBAO
		WHERE BNT.NHAKHOAHOC_ID =  @ID_phanbienvien and B.ID_BAIBAO like 'a0%'
	end
	begin
		select B.*
		from  BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN BNT INNER JOIN  BAIBAO B ON BNT.ID_BAIBAO = B.ID_BAIBAO
		WHERE BNT.NHAKHOAHOC_ID =  @ID_phanbienvien and B.ID_BAIBAO like 'a1%'
	end
	begin
		select B.*
		from  BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN BNT INNER JOIN  BAIBAO B ON BNT.ID_BAIBAO = B.ID_BAIBAO
		WHERE BNT.NHAKHOAHOC_ID =  @ID_phanbienvien and B.ID_BAIBAO like 'a2%'
	end
end
go
-- ii.4
create procedure Danhsachcacbaibao_Theomoiloai_Duoi3nam
(@ID_phanbienvien Nvarchar(100))
as
begin
	begin
		select B.*
		from  BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN BNT INNER JOIN  BAIBAO B ON BNT.ID_BAIBAO = B.ID_BAIBAO
			  INNER JOIN  PHANCONGPHANBIEN PCPB ON BNT.BAIPHANBIEN_ID = PCPB.BAIPHANBIEN_ID
		WHERE BNT.NHAKHOAHOC_ID =  @ID_phanbienvien  AND YEAR(CURRENT_TIMESTAMP)- YEAR(PCPB.NGAYPHANBIEN) <= 3 and B.ID_BAIBAO like 'a0%'
	end
	begin
		select B.*
		from  BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN BNT INNER JOIN  BAIBAO B ON BNT.ID_BAIBAO = B.ID_BAIBAO
			  INNER JOIN  PHANCONGPHANBIEN PCPB ON BNT.BAIPHANBIEN_ID = PCPB.BAIPHANBIEN_ID
		WHERE BNT.NHAKHOAHOC_ID =  @ID_phanbienvien  AND YEAR(CURRENT_TIMESTAMP)- YEAR(PCPB.NGAYPHANBIEN) <= 3 and B.ID_BAIBAO like 'a1%'
	end
	begin
		select B.*
		from  BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN BNT INNER JOIN  BAIBAO B ON BNT.ID_BAIBAO = B.ID_BAIBAO
			  INNER JOIN  PHANCONGPHANBIEN PCPB ON BNT.BAIPHANBIEN_ID = PCPB.BAIPHANBIEN_ID
		WHERE BNT.NHAKHOAHOC_ID =  @ID_phanbienvien  AND YEAR(CURRENT_TIMESTAMP)- YEAR(PCPB.NGAYPHANBIEN) <= 3 and B.ID_BAIBAO like 'a2%'
	end
end
go
--ii.5
create procedure Danhsachbaibao_Theotacgia (
@ID_phanbienvien Nvarchar(100), 
 @ID_tentacgia Nvarchar(100) 
 )
 as
 select B.*
from  BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN BNT INNER JOIN  BAIBAO B ON BNT.ID_BAIBAO = B.ID_BAIBAO
  INNER JOIN SANGTAC S ON S.ID_BAIBAO=B.ID_BAIBAO
  INNER JOIN NHAKHOAHOC NKH ON NKH.NHAKHOAHOC_ID= S.NHAKHOAHOC_ID
WHERE BNT.NHAKHOAHOC_ID =  @ID_phanbienvien and NKH.TEN = @ID_tentacgia
go
--ii.6
create procedure Danhsachbaibao_Theotacgia_Duoi3nam (
@ID_phanbienvien Nvarchar(100), 
 @ID_tentacgia Nvarchar(100) 
 )
 as
 select B.*
from  BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN BNT INNER JOIN  BAIBAO B ON BNT.ID_BAIBAO = B.ID_BAIBAO
  INNER JOIN SANGTAC S ON S.ID_BAIBAO=B.ID_BAIBAO
  INNER Join PHANCONGPHANBIEN PCPB ON BNT.BAIPHANBIEN_ID = PCPB.BAIPHANBIEN_ID
  INNER JOIN NHAKHOAHOC NKH ON NKH.NHAKHOAHOC_ID= S.NHAKHOAHOC_ID
WHERE BNT.NHAKHOAHOC_ID =  @ID_phanbienvien and NKH.TEN = @ID_tentacgia and YEAR(CURRENT_TIMESTAMP)- YEAR(PCPB.NGAYPHANBIEN) <= 3
go
--ii.7
create procedure Danhsachbaibao_Theotacgia_Conhieubaibaonhat 
(@ID_phanbienvien Nvarchar(100))
as
begin
	declare @ID_Tacgia_Nhieubaibaonhat Nvarchar(100)
	set @ID_Tacgia_Nhieubaibaonhat = 
		(select top 1 A.NHAKHOAHOC_ID from
		(
		select top 1 NKH.NHAKHOAHOC_ID, COUNT(*) as COUNT_BAIBAO
		from  BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN BNT INNER JOIN  BAIBAO B ON BNT.ID_BAIBAO = B.ID_BAIBAO
			  INNER JOIN SANGTAC S ON S.ID_BAIBAO=B.ID_BAIBAO
			  INNER JOIN NHAKHOAHOC NKH ON NKH.NHAKHOAHOC_ID= S.NHAKHOAHOC_ID
		where BNT.NHAKHOAHOC_ID = @ID_phanbienvien
		group by NKH.NHAKHOAHOC_ID
		order by COUNT(*) DESC
		) A
		)
	begin 
		select B.*
		from  BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN BNT INNER JOIN  BAIBAO B ON BNT.ID_BAIBAO = B.ID_BAIBAO
		  INNER JOIN SANGTAC S ON S.ID_BAIBAO=B.ID_BAIBAO
		  INNER JOIN NHAKHOAHOC NKH ON NKH.NHAKHOAHOC_ID= S.NHAKHOAHOC_ID
		WHERE BNT.NHAKHOAHOC_ID =  @ID_phanbienvien and NKH.TEN = @ID_Tacgia_Nhieubaibaonhat
	end
end
go
--ii.8
create procedure Ketquaphanbien_Daphanbientrongnamnay
(@ID_phanbienvien Nvarchar(100))
as
begin 
	select BPB.BAIPHANBIEN_ID,BPB.KETQUA from 
	BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN BNT inner join BAIPHANBIEN BPB on BNT.BAIPHANBIEN_ID = BPB.BAIPHANBIEN_ID 
	where BNT.NHAKHOAHOC_ID= @ID_phanbienvien AND year(BPB.NGAYTHONGBAO) = year(CURRENT_TIMESTAMP)
end
go
--ii.9
create procedure _3nam_Nhieubaiphanbiennhat
(@ID_phanbienvien Nvarchar(100))
as
begin 
	select top 3 year(BPB.NGAYTHONGBAO),COUNT(*) from 
	BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN BNT inner join BAIPHANBIEN BPB on BNT.BAIPHANBIEN_ID = BPB.BAIPHANBIEN_ID 
	where BNT.NHAKHOAHOC_ID= @ID_phanbienvien
	group by year(BPB.NGAYTHONGBAO)  
end
go
-- ii.10
create procedure _3baibao_Phanbien_tot_nhat
(@ID_phanbienvien Nvarchar(100))
as
begin 
	select top 3 * from 
	BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN BNT inner join BAIPHANBIEN BPB on BNT.BAIPHANBIEN_ID = BPB.BAIPHANBIEN_ID 
	where BNT.NHAKHOAHOC_ID= @ID_phanbienvien and BPB.KETQUA = 'ACCEPTANCE'
end
go
--ii.11
create procedure _3baibao_Phanbien_te_nhat
(@ID_phanbienvien Nvarchar(100))
as
begin 
	select top 3 * from 
	BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN BNT inner join BAIPHANBIEN BPB on BNT.BAIPHANBIEN_ID = BPB.BAIPHANBIEN_ID 
	where BNT.NHAKHOAHOC_ID= @ID_phanbienvien and BPB.KETQUA = 'REJECTION'
end
go
--ii.12
create procedure Trungbinh_Sobaibaodaphanbien_Trong5nam
(@ID_phanbienvien Nvarchar(100))
as
begin
select AVG(A.count_Baibao) from 
(
	
	select year(BPB.NGAYTHONGBAO) as [year] ,count(*) as count_Baibao from 
	BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN BNT inner join BAIPHANBIEN BPB on BNT.BAIPHANBIEN_ID = BPB.BAIPHANBIEN_ID 
	where BNT.NHAKHOAHOC_ID= @ID_phanbienvien and( YEAR( CURRENT_TIMESTAMP) - year(BPB.NGAYTHONGBAO) <=5 )
	group by year(BPB.NGAYTHONGBAO)
) A 
END


