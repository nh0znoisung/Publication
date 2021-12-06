--CREATE LOGIN Nguyen
--	with PASSWORD = '1';
--GO

--CREATE USER Nguyen FOR LOGIN Nguyen;


--CREATE LOGIN Khang
--	with PASSWORD = '1';
--GO

--CREATE USER Khang FOR LOGIN Khang;
--GO

--CREATE LOGIN Khoa
--	with PASSWORD = '1';
--GO

--CREATE USER Khoa FOR LOGIN Khoa;
--GO

sp_addrolemember @rolename = NGUOIPHANBIEN, @membername = Nguyen;
GO

sp_addrolemember @rolename = BIENTAPVIEN, @membername = Khang;
GO

sp_addrolemember @rolename = TACGIA, @membername = Khoa;
GO