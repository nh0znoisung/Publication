---------------------------- CREATE DATABASE

CREATE TYPE ID
	FROM INTEGER NOT NULL
go



CREATE TYPE Gender
	FROM VARCHAR(1) NULL
go



CREATE TYPE Ketquabaiphanbien
	FROM VARCHAR(20) NULL
go



CREATE TYPE Dangxuatban
	FROM VARCHAR(20) NULL
go



CREATE TYPE Trangthaixuli
	FROM VARCHAR(20) NULL
go



CREATE TYPE Tieuchi
	FROM VARCHAR(20) NULL
go



CREATE TYPE DiemTieuChi
	FROM INTEGER NULL
go



CREATE RULE Val_Rule_Gender
	AS @col IN ('M', 'F', 'U')
go



CREATE RULE Val_Rule_SOTRANG
	AS @col BETWEEN 3 AND 20
go



CREATE RULE Val_Rule_TRANGTHAIXULI
	AS @col IN ('HOANTATPHANBIEN', 'PHANHOIPHANBIEN', 'PHANBIEN', 'XUATBAN', 'DADANG', 'CHUAPHANBIEN')
go



CREATE RULE Val_Rule_DANGXUATBAN
	AS @col IN ('TRUYENTHONG', 'OPENACCESS')
go



CREATE RULE Val_Rule_KETQUABAIPHANBIEN
	AS @col IN ('REJECTION', 'MINOR_REVISION', 'MAJOR_REVISION', 'ACCEPTANCE')
go



CREATE RULE Val_Rule_VAITRO
	AS @col IN ('TACGIA', 'NGUOIPHANBIEN', 'BIENTAPVIEN')
go



CREATE RULE Val_Rule_TIEUCHI
	AS @col IN ('HINHTHUC', 'TINHKHATHI', 'TINHTHUYETPHUC', 'TINHCHINHXAC')
go



CREATE RULE Val_Rule_DIEMTIEUCHI
	AS @col BETWEEN 0 AND 100
go




exec sp_bindrule 'Val_Rule_DIEMTIEUCHI', 'ID'
go




exec sp_bindrule 'Val_Rule_Gender', 'Gender'
go




exec sp_bindrule 'Val_Rule_KETQUABAIPHANBIEN', 'Ketquabaiphanbien'
go




exec sp_bindrule 'Val_Rule_DANGXUATBAN', 'Dangxuatban'
go




exec sp_bindrule 'Val_Rule_TRANGTHAIXULI', 'Trangthaixuli'
go




exec sp_bindrule 'Val_Rule_TIEUCHI', 'Tieuchi'
go




exec sp_bindrule 'Val_Rule_DIEMTIEUCHI', 'DiemTieuChi'
go



CREATE TABLE BAIBAO
( 
	ID_BAIBAO            nvarchar(100)  NOT NULL ,
	TRANGTHAIXULI        Trangthaixuli ,
	FILEBAIBAO           nvarchar(100)  NULL ,
	TIEUDE               nvarchar(150)  NULL ,
	TOMTAT               nvarchar(1500)  NULL ,
	TONGSOTRANG          integer  NULL , 
  NHAKHOAHOC_ID        nvarchar(100) NULL, --tác giả liên lạc,
	NGAYNHAN             date  NULL
)
go



ALTER TABLE BAIBAO
	ADD CONSTRAINT XPKBAIBAO PRIMARY KEY  CLUSTERED (ID_BAIBAO ASC)
go



CREATE NONCLUSTERED INDEX XIE1BAIBAO ON BAIBAO
( 
	ID_BAIBAO             ASC
)
go



CREATE TABLE BAIBAODADUOCCHAPNHAN
( 
	DOI                  nvarchar(100)  NOT NULL ,
	ID_BAIBAO            nvarchar(100)  NOT NULL ,
	DANGXUATBAN          Dangxuatban ,
	NHAXUATBAN           nvarchar(100)  NULL ,
	NAMXUATBAN           integer  NULL 
)
go



ALTER TABLE BAIBAODADUOCCHAPNHAN
	ADD CONSTRAINT XPKBAIBAODADUOCCHAPNHAN PRIMARY KEY  CLUSTERED (DOI ASC,ID_BAIBAO ASC)
go



CREATE TABLE BAIPHANBIEN
( 
	BAIPHANBIEN_ID       nvarchar(100)  NOT NULL ,
    ID_BAIBAO            nvarchar(100)  NOT NULL ,
	GHICHU_TACGIA        nvarchar(1000)  NULL ,
	GHICHU_BANBIENTAP    nvarchar(1000)  NULL ,
	NGAYTHONGBAO         date  NOT NULL ,
	KETQUA               Ketquabaiphanbien ,
	CACCHITIETKHAC       nvarchar(1000)  NULL 
)
go



ALTER TABLE BAIPHANBIEN
	ADD CONSTRAINT XPKBAIPHANBIEN PRIMARY KEY  CLUSTERED (BAIPHANBIEN_ID ASC,ID_BAIBAO ASC)
go



CREATE NONCLUSTERED INDEX XIE1BAIPHANBIEN ON BAIPHANBIEN
( 
	GHICHU_TACGIA         ASC,
	GHICHU_BANBIENTAP     ASC
)
go



CREATE TABLE BIENTAPVIEN
( 
  EMAILCOQUAN          nvarchar(200)  NULL,
  NHAKHOAHOC_ID        nvarchar(100)  NOT NULL
)
go



ALTER TABLE BIENTAPVIEN
	ADD CONSTRAINT XPKBIENTAPVIEN PRIMARY KEY  CLUSTERED (NHAKHOAHOC_ID ASC)
go



CREATE TABLE NGHIENCUU
( 
	ID_BAIBAO            nvarchar(100)  NOT NULL 
)
go



ALTER TABLE NGHIENCUU
	ADD CONSTRAINT XPKNGHIENCUU PRIMARY KEY  CLUSTERED (ID_BAIBAO ASC)
go



CREATE TABLE NGUOIPHANBIEN
( 
	NHAKHOAHOC_ID        nvarchar(100)  NOT NULL ,
	EMAILCOQUAN          nvarchar(200)  NULL ,
	SODIENTHOAI          nvarchar(100)  NULL ,
	TRINHDO              nvarchar(100)  NULL ,
	NGAYCONGTAC          date  NULL 
)
go



ALTER TABLE NGUOIPHANBIEN
	ADD CONSTRAINT XPKNGUOIPHANBIEN PRIMARY KEY  CLUSTERED (NHAKHOAHOC_ID ASC)
  go


CREATE TABLE NHAKHOAHOC
( 
	HO                   nvarchar(100)  NULL ,
	TEN                  nvarchar(100)  NULL ,
	EMAILCANHAN          nvarchar(100)  NULL ,
	DIACHI               nvarchar(200)  NULL ,
	CHUYENMON            nvarchar(100)  NULL ,
	NGAYSINH             DATE  NULL ,
	NHAKHOAHOC_ID        nvarchar(100)  NOT NULL ,
	COQUANCONGTAC        nvarchar(500)  NULL ,
	NGHENGHIEP           nvarchar(100)  NULL 
)
go



ALTER TABLE NHAKHOAHOC
	ADD CONSTRAINT XPKNHAKHOAHOC PRIMARY KEY  CLUSTERED (NHAKHOAHOC_ID ASC)
go



CREATE TABLE PHANBIENSACH
( 
	ISBN                 nvarchar(100)  NOT NULL ,
	TENSACH              nvarchar(150)  NULL ,
	NHAXUATBAN           nvarchar(100)  NULL ,
	NAMXUATBAN           nvarchar(4)  NULL ,
	ID_BAIBAO            nvarchar(100)  NOT NULL 
)
go



ALTER TABLE PHANBIENSACH
	ADD CONSTRAINT XPKPHANBIENSACH PRIMARY KEY  CLUSTERED (ISBN ASC,ID_BAIBAO ASC)
go



CREATE TABLE PHANBIENSACHHASTACGIABAIBAO
( 
	ISBN                 nvarchar(100)  NOT NULL ,
	ID_BAIBAO            nvarchar(100)  NOT NULL ,
	HOTENTACGIA          nvarchar(200)  NOT NULL 
)
go



ALTER TABLE PHANBIENSACHHASTACGIABAIBAO
	ADD CONSTRAINT XPKPHANBIENSACH_TACGIABAIBAO PRIMARY KEY  CLUSTERED (HOTENTACGIA ASC,ISBN ASC,ID_BAIBAO ASC)
go



CREATE TABLE PHANCONGPHANBIEN
( 
	BAIPHANBIEN_ID       nvarchar(100)  NOT NULL ,
	ID_BAIBAO            nvarchar(100)  NOT NULL ,
	NGAYPHANBIEN         date  NULL ,
	DIADIEMPHANBIEN      nvarchar(200)  NULL
)
go



ALTER TABLE PHANCONGPHANBIEN
	ADD CONSTRAINT XPKPHANCONGPHANBIEN PRIMARY KEY  CLUSTERED (BAIPHANBIEN_ID ASC,ID_BAIBAO ASC)
go



CREATE TABLE SANGTAC
( 
	ID_BAIBAO            nvarchar(100)  NOT NULL ,
	NHAKHOAHOC_ID        nvarchar(100)  NOT NULL 
)
go



ALTER TABLE SANGTAC
	ADD CONSTRAINT XPKSANGTAC PRIMARY KEY  CLUSTERED (NHAKHOAHOC_ID ASC,ID_BAIBAO ASC)
go



CREATE TABLE TACGIA
( 
	NHAKHOAHOC_ID        nvarchar(100)  NOT NULL 
)
go



ALTER TABLE TACGIA
	ADD CONSTRAINT XPKTACGIA PRIMARY KEY  CLUSTERED (NHAKHOAHOC_ID ASC)
go



CREATE TABLE TACGIALIENLAC
( 
	NHAKHOAHOC_ID        nvarchar(100)  NOT NULL 
)
go



ALTER TABLE TACGIALIENLAC
	ADD CONSTRAINT XPKTACGIALIENLAC PRIMARY KEY  CLUSTERED (NHAKHOAHOC_ID ASC)
go



CREATE TABLE THUCHIENPHANBIEN
( 
	BAIPHANBIEN_ID       nvarchar(100)  NOT NULL ,
	ID_BAIBAO            nvarchar(100)  NOT NULL ,
	NHAKHOAHOC_ID        nvarchar(100)  NOT NULL 
)
go



ALTER TABLE THUCHIENPHANBIEN
	ADD CONSTRAINT XPKTHUCHIENPHANBIEN PRIMARY KEY  CLUSTERED (BAIPHANBIEN_ID ASC,ID_BAIBAO ASC,NHAKHOAHOC_ID ASC)
go



CREATE TABLE THUCHIENPHANBIEN_TIEUCHIPHANBIEN
(
	MOTA                 varchar(20)  NOT NULL ,
	DIEM                 integer  NOT NULL ,
	BAIPHANBIEN_ID       nvarchar(100)  NOT NULL ,
	ID_BAIBAO            nvarchar(100)  NOT NULL ,
	NHAKHOAHOC_ID        nvarchar(100)  NOT NULL
)
go



ALTER TABLE THUCHIENPHANBIEN_TIEUCHIPHANBIEN
	ADD CONSTRAINT XPKTHUCHIENPHANBIEN_TIEUCHIPHANBIEN PRIMARY KEY  CLUSTERED (BAIPHANBIEN_ID ASC,ID_BAIBAO ASC,NHAKHOAHOC_ID ASC,MOTA ASC)
go



CREATE TABLE TONGQUAN
( 
	ID_BAIBAO            nvarchar(100)  NOT NULL 
)
go



ALTER TABLE TONGQUAN
	ADD CONSTRAINT XPKTONGQUAN PRIMARY KEY  CLUSTERED (ID_BAIBAO ASC)
go



CREATE TABLE TU_KHOA
( 
	TU_KHOA              nvarchar(100)  NOT NULL ,
	ID_BAIBAO            nvarchar(100)  NOT NULL 
)
go



ALTER TABLE TU_KHOA
	ADD CONSTRAINT XPKTU_KHOA PRIMARY KEY  CLUSTERED (TU_KHOA ASC,ID_BAIBAO ASC)
go




exec sp_bindrule 'Val_Rule_TRANGTHAIXULI', 'BAIBAO.TRANGTHAIXULI'
go




exec sp_bindrule 'Val_Rule_SOTRANG', 'BAIBAO.TONGSOTRANG'
go




ALTER TABLE BAIBAO
	ADD CONSTRAINT R_1058 FOREIGN KEY (NHAKHOAHOC_ID) REFERENCES TACGIALIENLAC(NHAKHOAHOC_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE BAIBAODADUOCCHAPNHAN
	ADD  FOREIGN KEY (ID_BAIBAO) REFERENCES BAIBAO(ID_BAIBAO)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go




exec sp_bindrule 'Val_Rule_KETQUABAIPHANBIEN', 'BAIPHANBIEN.KETQUA'
go




ALTER TABLE BAIPHANBIEN
	ADD CONSTRAINT DUOCPHANBIEN FOREIGN KEY (ID_BAIBAO) REFERENCES BAIBAO(ID_BAIBAO)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE BIENTAPVIEN
	ADD  FOREIGN KEY (NHAKHOAHOC_ID) REFERENCES NHAKHOAHOC(NHAKHOAHOC_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go




ALTER TABLE NGHIENCUU
	ADD  FOREIGN KEY (ID_BAIBAO) REFERENCES BAIBAO(ID_BAIBAO)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go




ALTER TABLE NGUOIPHANBIEN
	ADD  FOREIGN KEY (NHAKHOAHOC_ID) REFERENCES NHAKHOAHOC(NHAKHOAHOC_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go




ALTER TABLE PHANBIENSACH
	ADD  FOREIGN KEY (ID_BAIBAO) REFERENCES BAIBAO(ID_BAIBAO)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go




ALTER TABLE PHANBIENSACHHASTACGIABAIBAO
	ADD CONSTRAINT R_825 FOREIGN KEY (ISBN,ID_BAIBAO) REFERENCES PHANBIENSACH(ISBN,ID_BAIBAO)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE PHANCONGPHANBIEN
	ADD CONSTRAINT R_1033 FOREIGN KEY (BAIPHANBIEN_ID,ID_BAIBAO) REFERENCES BAIPHANBIEN(BAIPHANBIEN_ID,ID_BAIBAO)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE SANGTAC
	ADD CONSTRAINT R_244 FOREIGN KEY (ID_BAIBAO) REFERENCES BAIBAO(ID_BAIBAO)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE SANGTAC
  ADD CONSTRAINT R_1063 FOREIGN KEY (NHAKHOAHOC_ID) REFERENCES TACGIA(NHAKHOAHOC_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE TACGIA
	ADD  FOREIGN KEY (NHAKHOAHOC_ID) REFERENCES NHAKHOAHOC(NHAKHOAHOC_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go




ALTER TABLE TACGIALIENLAC
	ADD  FOREIGN KEY (NHAKHOAHOC_ID) REFERENCES TACGIA(NHAKHOAHOC_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go




ALTER TABLE THUCHIENPHANBIEN
	ADD CONSTRAINT R_1000 FOREIGN KEY (BAIPHANBIEN_ID,ID_BAIBAO) REFERENCES BAIPHANBIEN(BAIPHANBIEN_ID,ID_BAIBAO)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE THUCHIENPHANBIEN
	ADD CONSTRAINT R_1065 FOREIGN KEY (NHAKHOAHOC_ID) REFERENCES NGUOIPHANBIEN(NHAKHOAHOC_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




exec sp_bindrule 'Val_Rule_TIEUCHI', 'THUCHIENPHANBIEN_TIEUCHIPHANBIEN.MOTA'
go




exec sp_bindrule 'Val_Rule_DIEMTIEUCHI', 'THUCHIENPHANBIEN_TIEUCHIPHANBIEN.DIEM'
go




ALTER TABLE THUCHIENPHANBIEN_TIEUCHIPHANBIEN
	ADD CONSTRAINT R_1064 FOREIGN KEY (BAIPHANBIEN_ID,ID_BAIBAO,NHAKHOAHOC_ID) REFERENCES THUCHIENPHANBIEN(BAIPHANBIEN_ID,ID_BAIBAO,NHAKHOAHOC_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE TONGQUAN
	ADD  FOREIGN KEY (ID_BAIBAO) REFERENCES BAIBAO(ID_BAIBAO)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go




ALTER TABLE TU_KHOA
	ADD CONSTRAINT R_1052 FOREIGN KEY (ID_BAIBAO) REFERENCES BAIBAO(ID_BAIBAO)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




CREATE TRIGGER tD_BAIBAO ON BAIBAO FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on BAIBAO */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* BAIBAO  NGHIENCUU on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0005b35f", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="NGHIENCUU"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="ID_BAIBAO" */
    DELETE NGHIENCUU
      FROM NGHIENCUU,deleted
      WHERE
        /*  %JoinFKPK(NGHIENCUU,deleted," = "," AND") */
        NGHIENCUU.ID_BAIBAO = deleted.ID_BAIBAO

    /* ERwin Builtin Trigger */
    /* BAIBAO  TONGQUAN on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="TONGQUAN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="ID_BAIBAO" */
    DELETE TONGQUAN
      FROM TONGQUAN,deleted
      WHERE
        /*  %JoinFKPK(TONGQUAN,deleted," = "," AND") */
        TONGQUAN.ID_BAIBAO = deleted.ID_BAIBAO

    /* ERwin Builtin Trigger */
    /* BAIBAO  PHANBIENSACH on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="PHANBIENSACH"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="ID_BAIBAO" */
    DELETE PHANBIENSACH
      FROM PHANBIENSACH,deleted
      WHERE
        /*  %JoinFKPK(PHANBIENSACH,deleted," = "," AND") */
        PHANBIENSACH.ID_BAIBAO = deleted.ID_BAIBAO

    /* ERwin Builtin Trigger */
    /* BAIBAO  BAIBAODADUOCCHAPNHAN on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="BAIBAODADUOCCHAPNHAN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="ID_BAIBAO" */
    DELETE BAIBAODADUOCCHAPNHAN
      FROM BAIBAODADUOCCHAPNHAN,deleted
      WHERE
        /*  %JoinFKPK(BAIBAODADUOCCHAPNHAN,deleted," = "," AND") */
        BAIBAODADUOCCHAPNHAN.ID_BAIBAO = deleted.ID_BAIBAO

    /* ERwin Builtin Trigger */
    /* BAIBAO  BAIPHANBIEN on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="BAIPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="DUOCPHANBIEN", FK_COLUMNS="ID_BAIBAO" */
    IF EXISTS (
      SELECT * FROM deleted,BAIPHANBIEN
      WHERE
        /*  %JoinFKPK(BAIPHANBIEN,deleted," = "," AND") */
        BAIPHANBIEN.ID_BAIBAO = deleted.ID_BAIBAO
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete BAIBAO because BAIPHANBIEN exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* BAIBAO  SANGTAC on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="SANGTAC"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_244", FK_COLUMNS="ID_BAIBAO" */
    IF EXISTS (
      SELECT * FROM deleted,SANGTAC
      WHERE
        /*  %JoinFKPK(SANGTAC,deleted," = "," AND") */
        SANGTAC.ID_BAIBAO = deleted.ID_BAIBAO
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete BAIBAO because SANGTAC exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* BAIBAO  TU_KHOA on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="TU_KHOA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1052", FK_COLUMNS="ID_BAIBAO" */
    IF EXISTS (
      SELECT * FROM deleted,TU_KHOA
      WHERE
        /*  %JoinFKPK(TU_KHOA,deleted," = "," AND") */
        TU_KHOA.ID_BAIBAO = deleted.ID_BAIBAO
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete BAIBAO because TU_KHOA exists.'
      GOTO ERROR
    END

   /* ERwin Builtin Trigger */
    /* TACGIALIENLAC  BAIBAO on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="TACGIALIENLAC"
    CHILD_OWNER="", CHILD_TABLE="BAIBAO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1058", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (SELECT * FROM deleted,TACGIALIENLAC
      WHERE
        /* %JoinFKPK(deleted,TACGIALIENLAC," = "," AND") */
        deleted.NHAKHOAHOC_ID = TACGIALIENLAC.NHAKHOAHOC_ID AND
        NOT EXISTS (
          SELECT * FROM BAIBAO
          WHERE
            /* %JoinFKPK(BAIBAO,TACGIALIENLAC," = "," AND") */
            BAIBAO.NHAKHOAHOC_ID = TACGIALIENLAC.NHAKHOAHOC_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last BAIBAO because TACGIALIENLAC exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go


CREATE TRIGGER tU_BAIBAO ON BAIBAO FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on BAIBAO */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insID_BAIBAO nvarchar(100),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* BAIBAO  NGHIENCUU on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="0008a43c", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="NGHIENCUU"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="ID_BAIBAO" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ID_BAIBAO)
  BEGIN
    IF @NUMROWS = 1
    BEGIN
      SELECT @insID_BAIBAO = inserted.ID_BAIBAO
        FROM inserted
      UPDATE NGHIENCUU
      SET
        /*  %JoinFKPK(NGHIENCUU,@ins," = ",",") */
        NGHIENCUU.ID_BAIBAO = @insID_BAIBAO
      FROM NGHIENCUU,inserted,deleted
      WHERE
        /*  %JoinFKPK(NGHIENCUU,deleted," = "," AND") */
        NGHIENCUU.ID_BAIBAO = deleted.ID_BAIBAO
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade BAIBAO update because more than one row has been affected.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* BAIBAO  TONGQUAN on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="TONGQUAN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="ID_BAIBAO" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ID_BAIBAO)
  BEGIN
    IF @NUMROWS = 1
    BEGIN
      SELECT @insID_BAIBAO = inserted.ID_BAIBAO
        FROM inserted
      UPDATE TONGQUAN
      SET
        /*  %JoinFKPK(TONGQUAN,@ins," = ",",") */
        TONGQUAN.ID_BAIBAO = @insID_BAIBAO
      FROM TONGQUAN,inserted,deleted
      WHERE
        /*  %JoinFKPK(TONGQUAN,deleted," = "," AND") */
        TONGQUAN.ID_BAIBAO = deleted.ID_BAIBAO
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade BAIBAO update because more than one row has been affected.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* BAIBAO  PHANBIENSACH on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="PHANBIENSACH"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="ID_BAIBAO" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ID_BAIBAO)
  BEGIN
    IF @NUMROWS = 1
    BEGIN
      SELECT @insID_BAIBAO = inserted.ID_BAIBAO
        FROM inserted
      UPDATE PHANBIENSACH
      SET
        /*  %JoinFKPK(PHANBIENSACH,@ins," = ",",") */
        PHANBIENSACH.ID_BAIBAO = @insID_BAIBAO
      FROM PHANBIENSACH,inserted,deleted
      WHERE
        /*  %JoinFKPK(PHANBIENSACH,deleted," = "," AND") */
        PHANBIENSACH.ID_BAIBAO = deleted.ID_BAIBAO
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade BAIBAO update because more than one row has been affected.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* BAIBAO  BAIBAODADUOCCHAPNHAN on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="BAIBAODADUOCCHAPNHAN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="ID_BAIBAO" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ID_BAIBAO)
  BEGIN
    IF @NUMROWS = 1
    BEGIN
      SELECT @insID_BAIBAO = inserted.ID_BAIBAO
        FROM inserted
      UPDATE BAIBAODADUOCCHAPNHAN
      SET
        /*  %JoinFKPK(BAIBAODADUOCCHAPNHAN,@ins," = ",",") */
        BAIBAODADUOCCHAPNHAN.ID_BAIBAO = @insID_BAIBAO
      FROM BAIBAODADUOCCHAPNHAN,inserted,deleted
      WHERE
        /*  %JoinFKPK(BAIBAODADUOCCHAPNHAN,deleted," = "," AND") */
        BAIBAODADUOCCHAPNHAN.ID_BAIBAO = deleted.ID_BAIBAO
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade BAIBAO update because more than one row has been affected.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* BAIBAO  BAIPHANBIEN on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="BAIPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="DUOCPHANBIEN", FK_COLUMNS="ID_BAIBAO" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ID_BAIBAO)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,BAIPHANBIEN
      WHERE
        /*  %JoinFKPK(BAIPHANBIEN,deleted," = "," AND") */
        BAIPHANBIEN.ID_BAIBAO = deleted.ID_BAIBAO
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update BAIBAO because BAIPHANBIEN exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* BAIBAO  SANGTAC on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="SANGTAC"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_244", FK_COLUMNS="ID_BAIBAO" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ID_BAIBAO)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,SANGTAC
      WHERE
        /*  %JoinFKPK(SANGTAC,deleted," = "," AND") */
        SANGTAC.ID_BAIBAO = deleted.ID_BAIBAO
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update BAIBAO because SANGTAC exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* BAIBAO  TU_KHOA on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="TU_KHOA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1052", FK_COLUMNS="ID_BAIBAO" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ID_BAIBAO)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,TU_KHOA
      WHERE
        /*  %JoinFKPK(TU_KHOA,deleted," = "," AND") */
        TU_KHOA.ID_BAIBAO = deleted.ID_BAIBAO
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update BAIBAO because TU_KHOA exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* TACGIALIENLAC  BAIBAO on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="TACGIALIENLAC"
    CHILD_OWNER="", CHILD_TABLE="BAIBAO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1058", FK_COLUMNS="NHAKHOAHOC_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,TACGIALIENLAC
        WHERE
          /* %JoinFKPK(inserted,TACGIALIENLAC) */
          inserted.NHAKHOAHOC_ID = TACGIALIENLAC.NHAKHOAHOC_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.NHAKHOAHOC_ID IS NULL
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update BAIBAO because TACGIALIENLAC does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go




CREATE TRIGGER tD_BAIBAODADUOCCHAPNHAN ON BAIBAODADUOCCHAPNHAN FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on BAIBAODADUOCCHAPNHAN */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* BAIBAO  BAIBAODADUOCCHAPNHAN on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001517e", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="BAIBAODADUOCCHAPNHAN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="ID_BAIBAO" */
    IF EXISTS (SELECT * FROM deleted,BAIBAO
      WHERE
        /* %JoinFKPK(deleted,BAIBAO," = "," AND") */
        deleted.ID_BAIBAO = BAIBAO.ID_BAIBAO AND
        NOT EXISTS (
          SELECT * FROM BAIBAODADUOCCHAPNHAN
          WHERE
            /* %JoinFKPK(BAIBAODADUOCCHAPNHAN,BAIBAO," = "," AND") */
            BAIBAODADUOCCHAPNHAN.ID_BAIBAO = BAIBAO.ID_BAIBAO
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last BAIBAODADUOCCHAPNHAN because BAIBAO exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go


CREATE TRIGGER tU_BAIBAODADUOCCHAPNHAN ON BAIBAODADUOCCHAPNHAN FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on BAIBAODADUOCCHAPNHAN */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insDOI nvarchar(100), 
           @insID_BAIBAO nvarchar(100),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* BAIBAO  BAIBAODADUOCCHAPNHAN on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000155bc", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="BAIBAODADUOCCHAPNHAN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="ID_BAIBAO" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ID_BAIBAO)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,BAIBAO
        WHERE
          /* %JoinFKPK(inserted,BAIBAO) */
          inserted.ID_BAIBAO = BAIBAO.ID_BAIBAO
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update BAIBAODADUOCCHAPNHAN because BAIBAO does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go




CREATE TRIGGER tD_BAIPHANBIEN ON BAIPHANBIEN FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on BAIPHANBIEN */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* BAIPHANBIEN  THUCHIENPHANBIEN on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0003798d", PARENT_OWNER="", PARENT_TABLE="BAIPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="THUCHIENPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1000", FK_COLUMNS="BAIPHANBIEN_ID""ID_BAIBAO" */
    IF EXISTS (
      SELECT * FROM deleted,THUCHIENPHANBIEN
      WHERE
        /*  %JoinFKPK(THUCHIENPHANBIEN,deleted," = "," AND") */
        THUCHIENPHANBIEN.BAIPHANBIEN_ID = deleted.BAIPHANBIEN_ID AND
        THUCHIENPHANBIEN.ID_BAIBAO = deleted.ID_BAIBAO
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete BAIPHANBIEN because THUCHIENPHANBIEN exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* BAIPHANBIEN  PHANCONGPHANBIEN on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BAIPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="PHANCONGPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1033", FK_COLUMNS="BAIPHANBIEN_ID""ID_BAIBAO" */
    IF EXISTS (
      SELECT * FROM deleted,PHANCONGPHANBIEN
      WHERE
        /*  %JoinFKPK(PHANCONGPHANBIEN,deleted," = "," AND") */
        PHANCONGPHANBIEN.BAIPHANBIEN_ID = deleted.BAIPHANBIEN_ID AND
        PHANCONGPHANBIEN.ID_BAIBAO = deleted.ID_BAIBAO
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete BAIPHANBIEN because PHANCONGPHANBIEN exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* BAIBAO  BAIPHANBIEN on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="BAIPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="DUOCPHANBIEN", FK_COLUMNS="ID_BAIBAO" */
    IF EXISTS (SELECT * FROM deleted,BAIBAO
      WHERE
        /* %JoinFKPK(deleted,BAIBAO," = "," AND") */
        deleted.ID_BAIBAO = BAIBAO.ID_BAIBAO AND
        NOT EXISTS (
          SELECT * FROM BAIPHANBIEN
          WHERE
            /* %JoinFKPK(BAIPHANBIEN,BAIBAO," = "," AND") */
            BAIPHANBIEN.ID_BAIBAO = BAIBAO.ID_BAIBAO
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last BAIPHANBIEN because BAIBAO exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go


CREATE TRIGGER tU_BAIPHANBIEN ON BAIPHANBIEN FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on BAIPHANBIEN */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insBAIPHANBIEN_ID nvarchar(100), 
           @insID_BAIBAO nvarchar(100),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* BAIPHANBIEN  THUCHIENPHANBIEN on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0003fb89", PARENT_OWNER="", PARENT_TABLE="BAIPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="THUCHIENPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1000", FK_COLUMNS="BAIPHANBIEN_ID""ID_BAIBAO" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(BAIPHANBIEN_ID) OR
    UPDATE(ID_BAIBAO)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,THUCHIENPHANBIEN
      WHERE
        /*  %JoinFKPK(THUCHIENPHANBIEN,deleted," = "," AND") */
        THUCHIENPHANBIEN.BAIPHANBIEN_ID = deleted.BAIPHANBIEN_ID AND
        THUCHIENPHANBIEN.ID_BAIBAO = deleted.ID_BAIBAO
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update BAIPHANBIEN because THUCHIENPHANBIEN exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* BAIPHANBIEN  PHANCONGPHANBIEN on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BAIPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="PHANCONGPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1033", FK_COLUMNS="BAIPHANBIEN_ID""ID_BAIBAO" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(BAIPHANBIEN_ID) OR
    UPDATE(ID_BAIBAO)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,PHANCONGPHANBIEN
      WHERE
        /*  %JoinFKPK(PHANCONGPHANBIEN,deleted," = "," AND") */
        PHANCONGPHANBIEN.BAIPHANBIEN_ID = deleted.BAIPHANBIEN_ID AND
        PHANCONGPHANBIEN.ID_BAIBAO = deleted.ID_BAIBAO
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update BAIPHANBIEN because PHANCONGPHANBIEN exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* BAIBAO  BAIPHANBIEN on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="BAIPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="DUOCPHANBIEN", FK_COLUMNS="ID_BAIBAO" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ID_BAIBAO)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,BAIBAO
        WHERE
          /* %JoinFKPK(inserted,BAIBAO) */
          inserted.ID_BAIBAO = BAIBAO.ID_BAIBAO
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update BAIPHANBIEN because BAIBAO does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go




CREATE TRIGGER tD_BIENTAPVIEN ON BIENTAPVIEN FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on BIENTAPVIEN */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* NHAKHOAHOC  BIENTAPVIEN on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NHAKHOAHOC"
    CHILD_OWNER="", CHILD_TABLE="BIENTAPVIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (SELECT * FROM deleted,NHAKHOAHOC
      WHERE
        /* %JoinFKPK(deleted,NHAKHOAHOC," = "," AND") */
        deleted.NHAKHOAHOC_ID = NHAKHOAHOC.NHAKHOAHOC_ID AND
        NOT EXISTS (
          SELECT * FROM BIENTAPVIEN
          WHERE
            /* %JoinFKPK(BIENTAPVIEN,NHAKHOAHOC," = "," AND") */
            BIENTAPVIEN.NHAKHOAHOC_ID = NHAKHOAHOC.NHAKHOAHOC_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last BIENTAPVIEN because NHAKHOAHOC exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go


CREATE TRIGGER tU_BIENTAPVIEN ON BIENTAPVIEN FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on BIENTAPVIEN */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insNHAKHOAHOC_ID nvarchar(100),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* NHAKHOAHOC  BIENTAPVIEN on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NHAKHOAHOC"
    CHILD_OWNER="", CHILD_TABLE="BIENTAPVIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="NHAKHOAHOC_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,NHAKHOAHOC
        WHERE
          /* %JoinFKPK(inserted,NHAKHOAHOC) */
          inserted.NHAKHOAHOC_ID = NHAKHOAHOC.NHAKHOAHOC_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update BIENTAPVIEN because NHAKHOAHOC does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go




CREATE TRIGGER tD_NGHIENCUU ON NGHIENCUU FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on NGHIENCUU */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* BAIBAO  NGHIENCUU on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000127b7", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="NGHIENCUU"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="ID_BAIBAO" */
    IF EXISTS (SELECT * FROM deleted,BAIBAO
      WHERE
        /* %JoinFKPK(deleted,BAIBAO," = "," AND") */
        deleted.ID_BAIBAO = BAIBAO.ID_BAIBAO AND
        NOT EXISTS (
          SELECT * FROM NGHIENCUU
          WHERE
            /* %JoinFKPK(NGHIENCUU,BAIBAO," = "," AND") */
            NGHIENCUU.ID_BAIBAO = BAIBAO.ID_BAIBAO
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last NGHIENCUU because BAIBAO exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go


CREATE TRIGGER tU_NGHIENCUU ON NGHIENCUU FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on NGHIENCUU */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insID_BAIBAO nvarchar(100),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* BAIBAO  NGHIENCUU on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00014caa", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="NGHIENCUU"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="ID_BAIBAO" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ID_BAIBAO)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,BAIBAO
        WHERE
          /* %JoinFKPK(inserted,BAIBAO) */
          inserted.ID_BAIBAO = BAIBAO.ID_BAIBAO
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update NGHIENCUU because BAIBAO does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go




CREATE TRIGGER tD_NGUOIPHANBIEN ON NGUOIPHANBIEN FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on NGUOIPHANBIEN */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* NGUOIPHANBIEN  THUCHIENPHANBIEN on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00011316", PARENT_OWNER="", PARENT_TABLE="NGUOIPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="THUCHIENPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1062", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (
      SELECT * FROM deleted,THUCHIENPHANBIEN
      WHERE
        /*  %JoinFKPK(THUCHIENPHANBIEN,deleted," = "," AND") */
        THUCHIENPHANBIEN.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete NGUOIPHANBIEN because THUCHIENPHANBIEN exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* NHAKHOAHOC  NGUOIPHANBIEN on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NHAKHOAHOC"
    CHILD_OWNER="", CHILD_TABLE="NGUOIPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (SELECT * FROM deleted,NHAKHOAHOC
      WHERE
        /* %JoinFKPK(deleted,NHAKHOAHOC," = "," AND") */
        deleted.NHAKHOAHOC_ID = NHAKHOAHOC.NHAKHOAHOC_ID AND
        NOT EXISTS (
          SELECT * FROM NGUOIPHANBIEN
          WHERE
            /* %JoinFKPK(NGUOIPHANBIEN,NHAKHOAHOC," = "," AND") */
            NGUOIPHANBIEN.NHAKHOAHOC_ID = NHAKHOAHOC.NHAKHOAHOC_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last NGUOIPHANBIEN because NHAKHOAHOC exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go


CREATE TRIGGER tU_NGUOIPHANBIEN ON NGUOIPHANBIEN FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on NGUOIPHANBIEN */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insNHAKHOAHOC_ID nvarchar(100),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* NGUOIPHANBIEN  THUCHIENPHANBIEN on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00013b76", PARENT_OWNER="", PARENT_TABLE="NGUOIPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="THUCHIENPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1062", FK_COLUMNS="NHAKHOAHOC_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,THUCHIENPHANBIEN
      WHERE
        /*  %JoinFKPK(THUCHIENPHANBIEN,deleted," = "," AND") */
        THUCHIENPHANBIEN.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update NGUOIPHANBIEN because THUCHIENPHANBIEN exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* NHAKHOAHOC  NGUOIPHANBIEN on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NHAKHOAHOC"
    CHILD_OWNER="", CHILD_TABLE="NGUOIPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="NHAKHOAHOC_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,NHAKHOAHOC
        WHERE
          /* %JoinFKPK(inserted,NHAKHOAHOC) */
          inserted.NHAKHOAHOC_ID = NHAKHOAHOC.NHAKHOAHOC_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update NGUOIPHANBIEN because NHAKHOAHOC does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go




CREATE TRIGGER tD_NHAKHOAHOC ON NHAKHOAHOC FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on NHAKHOAHOC */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* NHAKHOAHOC  TACGIA on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00026558", PARENT_OWNER="", PARENT_TABLE="NHAKHOAHOC"
    CHILD_OWNER="", CHILD_TABLE="TACGIA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="NHAKHOAHOC_ID" */
    DELETE TACGIA
      FROM TACGIA,deleted
      WHERE
        /*  %JoinFKPK(TACGIA,deleted," = "," AND") */
        TACGIA.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID

    /* ERwin Builtin Trigger */
    /* NHAKHOAHOC  BIENTAPVIEN on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NHAKHOAHOC"
    CHILD_OWNER="", CHILD_TABLE="BIENTAPVIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="NHAKHOAHOC_ID" */
    DELETE BIENTAPVIEN
      FROM BIENTAPVIEN,deleted
      WHERE
        /*  %JoinFKPK(BIENTAPVIEN,deleted," = "," AND") */
        BIENTAPVIEN.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID

    /* ERwin Builtin Trigger */
    /* NHAKHOAHOC  NGUOIPHANBIEN on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NHAKHOAHOC"
    CHILD_OWNER="", CHILD_TABLE="NGUOIPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="NHAKHOAHOC_ID" */
    DELETE NGUOIPHANBIEN
      FROM NGUOIPHANBIEN,deleted
      WHERE
        /*  %JoinFKPK(NGUOIPHANBIEN,deleted," = "," AND") */
        NGUOIPHANBIEN.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go


CREATE TRIGGER tU_NHAKHOAHOC ON NHAKHOAHOC FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on NHAKHOAHOC */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insNHAKHOAHOC_ID nvarchar(100),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* NHAKHOAHOC  TACGIA on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00045e43", PARENT_OWNER="", PARENT_TABLE="NHAKHOAHOC"
    CHILD_OWNER="", CHILD_TABLE="TACGIA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="NHAKHOAHOC_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    IF @NUMROWS = 1
    BEGIN
      SELECT @insNHAKHOAHOC_ID = inserted.NHAKHOAHOC_ID
        FROM inserted
      UPDATE TACGIA
      SET
        /*  %JoinFKPK(TACGIA,@ins," = ",",") */
        TACGIA.NHAKHOAHOC_ID = @insNHAKHOAHOC_ID
      FROM TACGIA,inserted,deleted
      WHERE
        /*  %JoinFKPK(TACGIA,deleted," = "," AND") */
        TACGIA.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade NHAKHOAHOC update because more than one row has been affected.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* NHAKHOAHOC  BIENTAPVIEN on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NHAKHOAHOC"
    CHILD_OWNER="", CHILD_TABLE="BIENTAPVIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="NHAKHOAHOC_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    IF @NUMROWS = 1
    BEGIN
      SELECT @insNHAKHOAHOC_ID = inserted.NHAKHOAHOC_ID
        FROM inserted
      UPDATE BIENTAPVIEN
      SET
        /*  %JoinFKPK(BIENTAPVIEN,@ins," = ",",") */
        BIENTAPVIEN.NHAKHOAHOC_ID = @insNHAKHOAHOC_ID
      FROM BIENTAPVIEN,inserted,deleted
      WHERE
        /*  %JoinFKPK(BIENTAPVIEN,deleted," = "," AND") */
        BIENTAPVIEN.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade NHAKHOAHOC update because more than one row has been affected.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* NHAKHOAHOC  NGUOIPHANBIEN on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NHAKHOAHOC"
    CHILD_OWNER="", CHILD_TABLE="NGUOIPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="NHAKHOAHOC_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    IF @NUMROWS = 1
    BEGIN
      SELECT @insNHAKHOAHOC_ID = inserted.NHAKHOAHOC_ID
        FROM inserted
      UPDATE NGUOIPHANBIEN
      SET
        /*  %JoinFKPK(NGUOIPHANBIEN,@ins," = ",",") */
        NGUOIPHANBIEN.NHAKHOAHOC_ID = @insNHAKHOAHOC_ID
      FROM NGUOIPHANBIEN,inserted,deleted
      WHERE
        /*  %JoinFKPK(NGUOIPHANBIEN,deleted," = "," AND") */
        NGUOIPHANBIEN.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade NHAKHOAHOC update because more than one row has been affected.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go




CREATE TRIGGER tD_PHANBIENSACH ON PHANBIENSACH FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on PHANBIENSACH */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* PHANBIENSACH  PHANBIENSACHHASTACGIABAIBAO on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00026583", PARENT_OWNER="", PARENT_TABLE="PHANBIENSACH"
    CHILD_OWNER="", CHILD_TABLE="PHANBIENSACHHASTACGIABAIBAO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_825", FK_COLUMNS="ISBN""ID_BAIBAO" */
    IF EXISTS (
      SELECT * FROM deleted,PHANBIENSACHHASTACGIABAIBAO
      WHERE
        /*  %JoinFKPK(PHANBIENSACHHASTACGIABAIBAO,deleted," = "," AND") */
        PHANBIENSACHHASTACGIABAIBAO.ISBN = deleted.ISBN AND
        PHANBIENSACHHASTACGIABAIBAO.ID_BAIBAO = deleted.ID_BAIBAO
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete PHANBIENSACH because PHANBIENSACHHASTACGIABAIBAO exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* BAIBAO  PHANBIENSACH on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="PHANBIENSACH"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="ID_BAIBAO" */
    IF EXISTS (SELECT * FROM deleted,BAIBAO
      WHERE
        /* %JoinFKPK(deleted,BAIBAO," = "," AND") */
        deleted.ID_BAIBAO = BAIBAO.ID_BAIBAO AND
        NOT EXISTS (
          SELECT * FROM PHANBIENSACH
          WHERE
            /* %JoinFKPK(PHANBIENSACH,BAIBAO," = "," AND") */
            PHANBIENSACH.ID_BAIBAO = BAIBAO.ID_BAIBAO
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PHANBIENSACH because BAIBAO exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go


CREATE TRIGGER tU_PHANBIENSACH ON PHANBIENSACH FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on PHANBIENSACH */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insISBN nvarchar(100), 
           @insID_BAIBAO nvarchar(100),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* PHANBIENSACH  PHANBIENSACHHASTACGIABAIBAO on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002a79e", PARENT_OWNER="", PARENT_TABLE="PHANBIENSACH"
    CHILD_OWNER="", CHILD_TABLE="PHANBIENSACHHASTACGIABAIBAO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_825", FK_COLUMNS="ISBN""ID_BAIBAO" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ISBN) OR
    UPDATE(ID_BAIBAO)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,PHANBIENSACHHASTACGIABAIBAO
      WHERE
        /*  %JoinFKPK(PHANBIENSACHHASTACGIABAIBAO,deleted," = "," AND") */
        PHANBIENSACHHASTACGIABAIBAO.ISBN = deleted.ISBN AND
        PHANBIENSACHHASTACGIABAIBAO.ID_BAIBAO = deleted.ID_BAIBAO
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update PHANBIENSACH because PHANBIENSACHHASTACGIABAIBAO exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* BAIBAO  PHANBIENSACH on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="PHANBIENSACH"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="ID_BAIBAO" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ID_BAIBAO)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,BAIBAO
        WHERE
          /* %JoinFKPK(inserted,BAIBAO) */
          inserted.ID_BAIBAO = BAIBAO.ID_BAIBAO
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PHANBIENSACH because BAIBAO does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go




CREATE TRIGGER tD_PHANBIENSACHHASTACGIABAIBAO ON PHANBIENSACHHASTACGIABAIBAO FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on PHANBIENSACHHASTACGIABAIBAO */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* PHANBIENSACH  PHANBIENSACHHASTACGIABAIBAO on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00019964", PARENT_OWNER="", PARENT_TABLE="PHANBIENSACH"
    CHILD_OWNER="", CHILD_TABLE="PHANBIENSACHHASTACGIABAIBAO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_825", FK_COLUMNS="ISBN""ID_BAIBAO" */
    IF EXISTS (SELECT * FROM deleted,PHANBIENSACH
      WHERE
        /* %JoinFKPK(deleted,PHANBIENSACH," = "," AND") */
        deleted.ISBN = PHANBIENSACH.ISBN AND
        deleted.ID_BAIBAO = PHANBIENSACH.ID_BAIBAO AND
        NOT EXISTS (
          SELECT * FROM PHANBIENSACHHASTACGIABAIBAO
          WHERE
            /* %JoinFKPK(PHANBIENSACHHASTACGIABAIBAO,PHANBIENSACH," = "," AND") */
            PHANBIENSACHHASTACGIABAIBAO.ISBN = PHANBIENSACH.ISBN AND
            PHANBIENSACHHASTACGIABAIBAO.ID_BAIBAO = PHANBIENSACH.ID_BAIBAO
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PHANBIENSACHHASTACGIABAIBAO because PHANBIENSACH exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go


CREATE TRIGGER tU_PHANBIENSACHHASTACGIABAIBAO ON PHANBIENSACHHASTACGIABAIBAO FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on PHANBIENSACHHASTACGIABAIBAO */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insISBN nvarchar(100), 
           @insID_BAIBAO nvarchar(100), 
           @insHOTENTACGIA nvarchar(200),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* PHANBIENSACH  PHANBIENSACHHASTACGIABAIBAO on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00018576", PARENT_OWNER="", PARENT_TABLE="PHANBIENSACH"
    CHILD_OWNER="", CHILD_TABLE="PHANBIENSACHHASTACGIABAIBAO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_825", FK_COLUMNS="ISBN""ID_BAIBAO" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ISBN) OR
    UPDATE(ID_BAIBAO)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,PHANBIENSACH
        WHERE
          /* %JoinFKPK(inserted,PHANBIENSACH) */
          inserted.ISBN = PHANBIENSACH.ISBN and
          inserted.ID_BAIBAO = PHANBIENSACH.ID_BAIBAO
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PHANBIENSACHHASTACGIABAIBAO because PHANBIENSACH does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go




CREATE TRIGGER tD_PHANCONGPHANBIEN ON PHANCONGPHANBIEN FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on PHANCONGPHANBIEN */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* BAIPHANBIEN  PHANCONGPHANBIEN on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002f2d2", PARENT_OWNER="", PARENT_TABLE="BAIPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="PHANCONGPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1033", FK_COLUMNS="BAIPHANBIEN_ID""ID_BAIBAO" */
    IF EXISTS (SELECT * FROM deleted,BAIPHANBIEN
      WHERE
        /* %JoinFKPK(deleted,BAIPHANBIEN," = "," AND") */
        deleted.BAIPHANBIEN_ID = BAIPHANBIEN.BAIPHANBIEN_ID AND
        deleted.ID_BAIBAO = BAIPHANBIEN.ID_BAIBAO AND
        NOT EXISTS (
          SELECT * FROM PHANCONGPHANBIEN
          WHERE
            /* %JoinFKPK(PHANCONGPHANBIEN,BAIPHANBIEN," = "," AND") */
            PHANCONGPHANBIEN.BAIPHANBIEN_ID = BAIPHANBIEN.BAIPHANBIEN_ID AND
            PHANCONGPHANBIEN.ID_BAIBAO = BAIPHANBIEN.ID_BAIBAO
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PHANCONGPHANBIEN because BAIPHANBIEN exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go


CREATE TRIGGER tU_PHANCONGPHANBIEN ON PHANCONGPHANBIEN FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on PHANCONGPHANBIEN */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insBAIPHANBIEN_ID nvarchar(100), 
           @insID_BAIBAO nvarchar(100),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* BAIPHANBIEN  PHANCONGPHANBIEN on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00031b46", PARENT_OWNER="", PARENT_TABLE="BAIPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="PHANCONGPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1033", FK_COLUMNS="BAIPHANBIEN_ID""ID_BAIBAO" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(BAIPHANBIEN_ID) OR
    UPDATE(ID_BAIBAO)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,BAIPHANBIEN
        WHERE
          /* %JoinFKPK(inserted,BAIPHANBIEN) */
          inserted.BAIPHANBIEN_ID = BAIPHANBIEN.BAIPHANBIEN_ID and
          inserted.ID_BAIBAO = BAIPHANBIEN.ID_BAIBAO
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PHANCONGPHANBIEN because BAIPHANBIEN does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go




CREATE TRIGGER tD_SANGTAC ON SANGTAC FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on SANGTAC */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* BAIBAO  SANGTAC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000256b0", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="SANGTAC"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_244", FK_COLUMNS="ID_BAIBAO" */
    IF EXISTS (SELECT * FROM deleted,BAIBAO
      WHERE
        /* %JoinFKPK(deleted,BAIBAO," = "," AND") */
        deleted.ID_BAIBAO = BAIBAO.ID_BAIBAO AND
        NOT EXISTS (
          SELECT * FROM SANGTAC
          WHERE
            /* %JoinFKPK(SANGTAC,BAIBAO," = "," AND") */
            SANGTAC.ID_BAIBAO = BAIBAO.ID_BAIBAO
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last SANGTAC because BAIBAO exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* TACGIA  SANGTAC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="TACGIA"
    CHILD_OWNER="", CHILD_TABLE="SANGTAC"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1063", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (SELECT * FROM deleted,TACGIA
      WHERE
        /* %JoinFKPK(deleted,TACGIA," = "," AND") */
        deleted.NHAKHOAHOC_ID = TACGIA.NHAKHOAHOC_ID AND
        NOT EXISTS (
          SELECT * FROM SANGTAC
          WHERE
            /* %JoinFKPK(SANGTAC,TACGIA," = "," AND") */
            SANGTAC.NHAKHOAHOC_ID = TACGIA.NHAKHOAHOC_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last SANGTAC because TACGIA exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go


CREATE TRIGGER tU_SANGTAC ON SANGTAC FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on SANGTAC */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insID_BAIBAO nvarchar(100), 
           @insNHAKHOAHOC_ID nvarchar(100),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
    /* ERwin Builtin Trigger */
  /* BAIBAO  SANGTAC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002976f", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="SANGTAC"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_244", FK_COLUMNS="ID_BAIBAO" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ID_BAIBAO)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,BAIBAO
        WHERE
          /* %JoinFKPK(inserted,BAIBAO) */
          inserted.ID_BAIBAO = BAIBAO.ID_BAIBAO
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update SANGTAC because BAIBAO does not exist.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* TACGIA  SANGTAC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="TACGIA"
    CHILD_OWNER="", CHILD_TABLE="SANGTAC"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1063", FK_COLUMNS="NHAKHOAHOC_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,TACGIA
        WHERE
          /* %JoinFKPK(inserted,TACGIA) */
          inserted.NHAKHOAHOC_ID = TACGIA.NHAKHOAHOC_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update SANGTAC because TACGIA does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go




CREATE TRIGGER tD_TACGIA ON TACGIA FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on TACGIA */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* TACGIA  TACGIALIENLAC on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0002e56a", PARENT_OWNER="", PARENT_TABLE="TACGIA"
    CHILD_OWNER="", CHILD_TABLE="TACGIALIENLAC"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="NHAKHOAHOC_ID" */
    DELETE TACGIALIENLAC
      FROM TACGIALIENLAC,deleted
      WHERE
        /*  %JoinFKPK(TACGIALIENLAC,deleted," = "," AND") */
        TACGIALIENLAC.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID

    /* ERwin Builtin Trigger */
    /* TACGIA  SANGTAC on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="TACGIA"
    CHILD_OWNER="", CHILD_TABLE="SANGTAC"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1063", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (
      SELECT * FROM deleted,SANGTAC
      WHERE
        /*  %JoinFKPK(SANGTAC,deleted," = "," AND") */
        SANGTAC.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete TACGIA because SANGTAC exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* NHAKHOAHOC  TACGIA on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NHAKHOAHOC"
    CHILD_OWNER="", CHILD_TABLE="TACGIA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (SELECT * FROM deleted,NHAKHOAHOC
      WHERE
        /* %JoinFKPK(deleted,NHAKHOAHOC," = "," AND") */
        deleted.NHAKHOAHOC_ID = NHAKHOAHOC.NHAKHOAHOC_ID AND
        NOT EXISTS (
          SELECT * FROM TACGIA
          WHERE
            /* %JoinFKPK(TACGIA,NHAKHOAHOC," = "," AND") */
            TACGIA.NHAKHOAHOC_ID = NHAKHOAHOC.NHAKHOAHOC_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last TACGIA because NHAKHOAHOC exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go


CREATE TRIGGER tU_TACGIA ON TACGIA FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on TACGIA */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insNHAKHOAHOC_ID nvarchar(100),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* TACGIA  TACGIALIENLAC on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="0003c816", PARENT_OWNER="", PARENT_TABLE="TACGIA"
    CHILD_OWNER="", CHILD_TABLE="TACGIALIENLAC"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="NHAKHOAHOC_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    IF @NUMROWS = 1
    BEGIN
      SELECT @insNHAKHOAHOC_ID = inserted.NHAKHOAHOC_ID
        FROM inserted
      UPDATE TACGIALIENLAC
      SET
        /*  %JoinFKPK(TACGIALIENLAC,@ins," = ",",") */
        TACGIALIENLAC.NHAKHOAHOC_ID = @insNHAKHOAHOC_ID
      FROM TACGIALIENLAC,inserted,deleted
      WHERE
        /*  %JoinFKPK(TACGIALIENLAC,deleted," = "," AND") */
        TACGIALIENLAC.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade TACGIA update because more than one row has been affected.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* TACGIA  SANGTAC on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="TACGIA"
    CHILD_OWNER="", CHILD_TABLE="SANGTAC"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1063", FK_COLUMNS="NHAKHOAHOC_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,SANGTAC
      WHERE
        /*  %JoinFKPK(SANGTAC,deleted," = "," AND") */
        SANGTAC.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update TACGIA because SANGTAC exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* NHAKHOAHOC  TACGIA on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NHAKHOAHOC"
    CHILD_OWNER="", CHILD_TABLE="TACGIA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="NHAKHOAHOC_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,NHAKHOAHOC
        WHERE
          /* %JoinFKPK(inserted,NHAKHOAHOC) */
          inserted.NHAKHOAHOC_ID = NHAKHOAHOC.NHAKHOAHOC_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update TACGIA because NHAKHOAHOC does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go




CREATE TRIGGER tD_TACGIALIENLAC ON TACGIALIENLAC FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on TACGIALIENLAC */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* TACGIALIENLAC  BAIBAO on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002286f", PARENT_OWNER="", PARENT_TABLE="TACGIALIENLAC"
    CHILD_OWNER="", CHILD_TABLE="BAIBAO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1058", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (
      SELECT * FROM deleted,BAIBAO
      WHERE
        /*  %JoinFKPK(BAIBAO,deleted," = "," AND") */
        BAIBAO.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete TACGIALIENLAC because BAIBAO exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* TACGIA  TACGIALIENLAC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="TACGIA"
    CHILD_OWNER="", CHILD_TABLE="TACGIALIENLAC"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (SELECT * FROM deleted,TACGIA
      WHERE
        /* %JoinFKPK(deleted,TACGIA," = "," AND") */
        deleted.NHAKHOAHOC_ID = TACGIA.NHAKHOAHOC_ID AND
        NOT EXISTS (
          SELECT * FROM TACGIALIENLAC
          WHERE
            /* %JoinFKPK(TACGIALIENLAC,TACGIA," = "," AND") */
            TACGIALIENLAC.NHAKHOAHOC_ID = TACGIA.NHAKHOAHOC_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last TACGIALIENLAC because TACGIA exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go


CREATE TRIGGER tU_TACGIALIENLAC ON TACGIALIENLAC FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on TACGIALIENLAC */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insNHAKHOAHOC_ID nvarchar(100),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* TACGIALIENLAC  BAIBAO on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00025e04", PARENT_OWNER="", PARENT_TABLE="TACGIALIENLAC"
    CHILD_OWNER="", CHILD_TABLE="BAIBAO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1058", FK_COLUMNS="NHAKHOAHOC_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,BAIBAO
      WHERE
        /*  %JoinFKPK(BAIBAO,deleted," = "," AND") */
        BAIBAO.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update TACGIALIENLAC because BAIBAO exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* TACGIA  TACGIALIENLAC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="TACGIA"
    CHILD_OWNER="", CHILD_TABLE="TACGIALIENLAC"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="NHAKHOAHOC_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,TACGIA
        WHERE
          /* %JoinFKPK(inserted,TACGIA) */
          inserted.NHAKHOAHOC_ID = TACGIA.NHAKHOAHOC_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update TACGIALIENLAC because TACGIA does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go




CREATE TRIGGER tD_THUCHIENPHANBIEN ON THUCHIENPHANBIEN FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on THUCHIENPHANBIEN */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* THUCHIENPHANBIEN  THUCHIENPHANBIEN_TIEUCHIPHANBIEN on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0004817c", PARENT_OWNER="", PARENT_TABLE="THUCHIENPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="THUCHIENPHANBIEN_TIEUCHIPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1059", FK_COLUMNS="BAIPHANBIEN_ID""ID_BAIBAO""NHAKHOAHOC_ID" */
    IF EXISTS (
      SELECT * FROM deleted,THUCHIENPHANBIEN_TIEUCHIPHANBIEN
      WHERE
        /*  %JoinFKPK(THUCHIENPHANBIEN_TIEUCHIPHANBIEN,deleted," = "," AND") */
        THUCHIENPHANBIEN_TIEUCHIPHANBIEN.BAIPHANBIEN_ID = deleted.BAIPHANBIEN_ID AND
        THUCHIENPHANBIEN_TIEUCHIPHANBIEN.ID_BAIBAO = deleted.ID_BAIBAO AND
        THUCHIENPHANBIEN_TIEUCHIPHANBIEN.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete THUCHIENPHANBIEN because THUCHIENPHANBIEN_TIEUCHIPHANBIEN exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* BAIPHANBIEN  THUCHIENPHANBIEN on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BAIPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="THUCHIENPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1000", FK_COLUMNS="BAIPHANBIEN_ID""ID_BAIBAO" */
    IF EXISTS (SELECT * FROM deleted,BAIPHANBIEN
      WHERE
        /* %JoinFKPK(deleted,BAIPHANBIEN," = "," AND") */
        deleted.BAIPHANBIEN_ID = BAIPHANBIEN.BAIPHANBIEN_ID AND
        deleted.ID_BAIBAO = BAIPHANBIEN.ID_BAIBAO AND
        NOT EXISTS (
          SELECT * FROM THUCHIENPHANBIEN
          WHERE
            /* %JoinFKPK(THUCHIENPHANBIEN,BAIPHANBIEN," = "," AND") */
            THUCHIENPHANBIEN.BAIPHANBIEN_ID = BAIPHANBIEN.BAIPHANBIEN_ID AND
            THUCHIENPHANBIEN.ID_BAIBAO = BAIPHANBIEN.ID_BAIBAO
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last THUCHIENPHANBIEN because BAIPHANBIEN exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* NGUOIPHANBIEN  THUCHIENPHANBIEN on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NGUOIPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="THUCHIENPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1062", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (SELECT * FROM deleted,NGUOIPHANBIEN
      WHERE
        /* %JoinFKPK(deleted,NGUOIPHANBIEN," = "," AND") */
        deleted.NHAKHOAHOC_ID = NGUOIPHANBIEN.NHAKHOAHOC_ID AND
        NOT EXISTS (
          SELECT * FROM THUCHIENPHANBIEN
          WHERE
            /* %JoinFKPK(THUCHIENPHANBIEN,NGUOIPHANBIEN," = "," AND") */
            THUCHIENPHANBIEN.NHAKHOAHOC_ID = NGUOIPHANBIEN.NHAKHOAHOC_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last THUCHIENPHANBIEN because NGUOIPHANBIEN exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go


CREATE TRIGGER tU_THUCHIENPHANBIEN ON THUCHIENPHANBIEN FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on THUCHIENPHANBIEN */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insBAIPHANBIEN_ID nvarchar(100), 
           @insID_BAIBAO nvarchar(100), 
           @insNHAKHOAHOC_ID nvarchar(100),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* THUCHIENPHANBIEN  THUCHIENPHANBIEN_TIEUCHIPHANBIEN on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00049773", PARENT_OWNER="", PARENT_TABLE="THUCHIENPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="THUCHIENPHANBIEN_TIEUCHIPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1059", FK_COLUMNS="BAIPHANBIEN_ID""ID_BAIBAO""NHAKHOAHOC_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(BAIPHANBIEN_ID) OR
    UPDATE(ID_BAIBAO) OR
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,THUCHIENPHANBIEN_TIEUCHIPHANBIEN
      WHERE
        /*  %JoinFKPK(THUCHIENPHANBIEN_TIEUCHIPHANBIEN,deleted," = "," AND") */
        THUCHIENPHANBIEN_TIEUCHIPHANBIEN.BAIPHANBIEN_ID = deleted.BAIPHANBIEN_ID AND
        THUCHIENPHANBIEN_TIEUCHIPHANBIEN.ID_BAIBAO = deleted.ID_BAIBAO AND
        THUCHIENPHANBIEN_TIEUCHIPHANBIEN.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update THUCHIENPHANBIEN because THUCHIENPHANBIEN_TIEUCHIPHANBIEN exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* BAIPHANBIEN  THUCHIENPHANBIEN on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BAIPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="THUCHIENPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1000", FK_COLUMNS="BAIPHANBIEN_ID""ID_BAIBAO" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(BAIPHANBIEN_ID) OR
    UPDATE(ID_BAIBAO)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,BAIPHANBIEN
        WHERE
          /* %JoinFKPK(inserted,BAIPHANBIEN) */
          inserted.BAIPHANBIEN_ID = BAIPHANBIEN.BAIPHANBIEN_ID and
          inserted.ID_BAIBAO = BAIPHANBIEN.ID_BAIBAO
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update THUCHIENPHANBIEN because BAIPHANBIEN does not exist.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* NGUOIPHANBIEN  THUCHIENPHANBIEN on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NGUOIPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="THUCHIENPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1062", FK_COLUMNS="NHAKHOAHOC_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,NGUOIPHANBIEN
        WHERE
          /* %JoinFKPK(inserted,NGUOIPHANBIEN) */
          inserted.NHAKHOAHOC_ID = NGUOIPHANBIEN.NHAKHOAHOC_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update THUCHIENPHANBIEN because NGUOIPHANBIEN does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go




CREATE TRIGGER tD_THUCHIENPHANBIEN_TIEUCHIPHANBIEN ON THUCHIENPHANBIEN_TIEUCHIPHANBIEN FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on THUCHIENPHANBIEN_TIEUCHIPHANBIEN */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* THUCHIENPHANBIEN  THUCHIENPHANBIEN_TIEUCHIPHANBIEN on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00020f33", PARENT_OWNER="", PARENT_TABLE="THUCHIENPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="THUCHIENPHANBIEN_TIEUCHIPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1059", FK_COLUMNS="BAIPHANBIEN_ID""ID_BAIBAO""NHAKHOAHOC_ID" */
    IF EXISTS (SELECT * FROM deleted,THUCHIENPHANBIEN
      WHERE
        /* %JoinFKPK(deleted,THUCHIENPHANBIEN," = "," AND") */
        deleted.BAIPHANBIEN_ID = THUCHIENPHANBIEN.BAIPHANBIEN_ID AND
        deleted.ID_BAIBAO = THUCHIENPHANBIEN.ID_BAIBAO AND
        deleted.NHAKHOAHOC_ID = THUCHIENPHANBIEN.NHAKHOAHOC_ID AND
        NOT EXISTS (
          SELECT * FROM THUCHIENPHANBIEN_TIEUCHIPHANBIEN
          WHERE
            /* %JoinFKPK(THUCHIENPHANBIEN_TIEUCHIPHANBIEN,THUCHIENPHANBIEN," = "," AND") */
            THUCHIENPHANBIEN_TIEUCHIPHANBIEN.BAIPHANBIEN_ID = THUCHIENPHANBIEN.BAIPHANBIEN_ID AND
            THUCHIENPHANBIEN_TIEUCHIPHANBIEN.ID_BAIBAO = THUCHIENPHANBIEN.ID_BAIBAO AND
            THUCHIENPHANBIEN_TIEUCHIPHANBIEN.NHAKHOAHOC_ID = THUCHIENPHANBIEN.NHAKHOAHOC_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last THUCHIENPHANBIEN_TIEUCHIPHANBIEN because THUCHIENPHANBIEN exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go


CREATE TRIGGER tU_THUCHIENPHANBIEN_TIEUCHIPHANBIEN ON THUCHIENPHANBIEN_TIEUCHIPHANBIEN FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on THUCHIENPHANBIEN_TIEUCHIPHANBIEN */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insBAIPHANBIEN_ID nvarchar(100), 
           @insID_BAIBAO nvarchar(100), 
           @insMOTA varchar(20),
           @insNHAKHOAHOC_ID nvarchar(100),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* THUCHIENPHANBIEN  THUCHIENPHANBIEN_TIEUCHIPHANBIEN on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001d418", PARENT_OWNER="", PARENT_TABLE="THUCHIENPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="THUCHIENPHANBIEN_TIEUCHIPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1059", FK_COLUMNS="BAIPHANBIEN_ID""ID_BAIBAO""NHAKHOAHOC_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(BAIPHANBIEN_ID) OR
    UPDATE(ID_BAIBAO) OR
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,THUCHIENPHANBIEN
        WHERE
          /* %JoinFKPK(inserted,THUCHIENPHANBIEN) */
          inserted.BAIPHANBIEN_ID = THUCHIENPHANBIEN.BAIPHANBIEN_ID and
          inserted.ID_BAIBAO = THUCHIENPHANBIEN.ID_BAIBAO and
          inserted.NHAKHOAHOC_ID = THUCHIENPHANBIEN.NHAKHOAHOC_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update THUCHIENPHANBIEN_TIEUCHIPHANBIEN because THUCHIENPHANBIEN does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go




CREATE TRIGGER tD_TONGQUAN ON TONGQUAN FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on TONGQUAN */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* BAIBAO  TONGQUAN on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001253e", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="TONGQUAN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="ID_BAIBAO" */
    IF EXISTS (SELECT * FROM deleted,BAIBAO
      WHERE
        /* %JoinFKPK(deleted,BAIBAO," = "," AND") */
        deleted.ID_BAIBAO = BAIBAO.ID_BAIBAO AND
        NOT EXISTS (
          SELECT * FROM TONGQUAN
          WHERE
            /* %JoinFKPK(TONGQUAN,BAIBAO," = "," AND") */
            TONGQUAN.ID_BAIBAO = BAIBAO.ID_BAIBAO
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last TONGQUAN because BAIBAO exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go


CREATE TRIGGER tU_TONGQUAN ON TONGQUAN FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on TONGQUAN */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insID_BAIBAO nvarchar(100),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* BAIBAO  TONGQUAN on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00014cf8", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="TONGQUAN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="ID_BAIBAO" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ID_BAIBAO)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,BAIBAO
        WHERE
          /* %JoinFKPK(inserted,BAIBAO) */
          inserted.ID_BAIBAO = BAIBAO.ID_BAIBAO
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update TONGQUAN because BAIBAO does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go




CREATE TRIGGER tD_TU_KHOA ON TU_KHOA FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on TU_KHOA */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* BAIBAO  TU_KHOA on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00013512", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="TU_KHOA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1052", FK_COLUMNS="ID_BAIBAO" */
    IF EXISTS (SELECT * FROM deleted,BAIBAO
      WHERE
        /* %JoinFKPK(deleted,BAIBAO," = "," AND") */
        deleted.ID_BAIBAO = BAIBAO.ID_BAIBAO AND
        NOT EXISTS (
          SELECT * FROM TU_KHOA
          WHERE
            /* %JoinFKPK(TU_KHOA,BAIBAO," = "," AND") */
            TU_KHOA.ID_BAIBAO = BAIBAO.ID_BAIBAO
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last TU_KHOA because BAIBAO exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go


CREATE TRIGGER tU_TU_KHOA ON TU_KHOA FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on TU_KHOA */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insTU_KHOA nvarchar(100), 
           @insID_BAIBAO nvarchar(100),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* BAIBAO  TU_KHOA on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00014e5c", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
    CHILD_OWNER="", CHILD_TABLE="TU_KHOA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1052", FK_COLUMNS="ID_BAIBAO" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ID_BAIBAO)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,BAIBAO
        WHERE
          /* %JoinFKPK(inserted,BAIBAO) */
          inserted.ID_BAIBAO = BAIBAO.ID_BAIBAO
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update TU_KHOA because BAIBAO does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go


---------------------- INSERT DATA

--------------------------------------------------
-- INSERT NHAKHOAHOC:  Họ - Email cá nhân - tên - địa chỉ - chuyên môn - vai trò
-- Vai trò: TACGIA, BIENTAPVIEN, NGUOIPHANBIEN


-- 6 biên tập viên
INSERT INTO NHAKHOAHOC VALUES (N'Quách Minh',N'Tuấn','minhtuan2001@gmail.com',N'Đồng Nai','Computer Science','2001-07-10','100001',N'Hồ Chí Minh',N'Biên tập viên');
INSERT INTO NHAKHOAHOC VALUES (N'Nguyễn Thành',N'Nhân','nhannguyen464@gmail.com',N'Nghệ An','Computer Science','1997-03-11','100002',N'Huế',N'Biên tập viên');
INSERT INTO NHAKHOAHOC VALUES (N'Lê Phú',N'Lộc','locle543@gmail.com',N'Hà Tĩnh','Mechanical Engineering','2000-12-22','100003',N'Đà Nẵng',N'Biên tập viên');
INSERT INTO NHAKHOAHOC VALUES (N'Nguyễn Phúc Kiều',N'Ly','lyly2001@gmail.com',N'Hồ Chí Minh','Mechanical Engineering','2000-12-22','100004',N'Đà Nẵng',N'Biên tập viên');
INSERT INTO NHAKHOAHOC VALUES (N'Võ Anh',N'Nguyên','rongAkka@gmail.com',N'Kon Tum','Architecture','1997-12-12','100005',N'Hồ Chí Minh',N'Biên tập viên');
INSERT INTO NHAKHOAHOC VALUES (N'Võ Hồng',N'Phúc','hongphucvo0809@gmail.com',N'Cần Thơ','Computer Engineering','1997-03-11','100006',N'Hồ Chí Minh',N'Biên tập viên');

--8 người phản biện
INSERT INTO NHAKHOAHOC VALUES (N'Nguyễn Trường Hải',N'Đăng','seadan456@gmail.com',N'An Giang','Computer Science','2000-07-14','200001',N'Hồ Chí Minh','Fresher');
INSERT INTO NHAKHOAHOC VALUES (N'Trương Yến',N'Nhi','hellokitty@gmail.com',N'An Giang','Computer Science','1995-11-22','200002',N'Hồ Chí Minh','Senior');
INSERT INTO NHAKHOAHOC VALUES (N'Lưu Ngọc Thùy',N'An','anan@gmail.com',N'Đồng Nai','Mechanical Engineering','1997-01-03','200003',N'Hồ Chí Minh','Product Manager');
INSERT INTO NHAKHOAHOC VALUES (N'Lý Thanh',N'Bách','lyback@gmail.com',N'An Giang','Electrical Engineering','1995-09-29','200004',N'Hồ Chí Minh',N'Kỹ sư điện');
INSERT INTO NHAKHOAHOC VALUES (N'Ngô Lê Quốc',N'Dũng','koldunj@gmail.com',N'Thanh Hóa','Architecture','1994-12-10','200005',N'Đà Nẵng',N'Kiến trúc sư');
INSERT INTO NHAKHOAHOC VALUES (N'Châu Trần Hồng',N'Hà','hongha@gmail.com',N'Bạc Liêu','Electrical Engineering','2001-10-28','200006',N'Hồ Chí Minh',N'Kỹ sư điện');
INSERT INTO NHAKHOAHOC VALUES (N'Lương Thị Quỳnh',N'Hương','helloworld@gmail.com',N'Bình Thuận','Computer Engineering','2001-05-05','200007',N'Hồ Chí Minh','Web design');
INSERT INTO NHAKHOAHOC VALUES (N'Nguyễn Gia',N'Khiêm','khiemne@gmail.com',N'Cà Mau','Mechanical Engineering','1999-01-29','200008',N'Hồ Chí Minh',N'Kỹ sư cơ khí');

--11 người tác giả
INSERT INTO NHAKHOAHOC VALUES (N'Nguyễn Kim Phương','Trang','ngkimphuongtrang@gmail.com',N'Phú Yên','Computer Science','1999-09-18','300001',N'Huế','Data science');
INSERT INTO NHAKHOAHOC VALUES (N'Nguyễn Ngọc Kim',N'Ngân','kina@gmail.com',N'Quảng Ngãi','Computer Science','2000-03-26','300002',N'Đà Nẵng','Machine Learning engineering');
INSERT INTO NHAKHOAHOC VALUES (N'Trần Trung',N'Tuấn','trantt@gmail.com',N'Quảng Bình','Electrical Engineering','1998-08-27','300003',N'Hồ Chí Minh',N'Kỹ sư điện');
INSERT INTO NHAKHOAHOC VALUES (N'Thái Khắc Đức',N'An','ankhacthai@gmail.com',N'Đà Lạt','Electrical Engineering','1993-12-08','300004',N'Hồ Chí Minh',N'Kỹ sư điện');
INSERT INTO NHAKHOAHOC VALUES (N'Lương Thị Hồng',N'Vân','hongvan987@gmail.com',N'Hồ Chí Minh','Mechanical Engineering','1991-03-04','300005',N'Hồ Chí Minh',N'Kỹ sư cơ khí');
INSERT INTO NHAKHOAHOC VALUES (N'Mai Thị Khánh',N'Huyền','HuyenKhanh@gmail.com',N'Vũng Tàu','Computer Science','1990-06-28','300006',N'Hồ Chí Minh',N'Senior');
INSERT INTO NHAKHOAHOC VALUES (N'Đặng Phước Vĩnh',N'Hưng','vihu012@gmail.com',N'Hồ Chí Minh','Architecture','2000-02-29','300007',N'Hồ Chí Minh',N'Kiến trúc sư');
INSERT INTO NHAKHOAHOC VALUES (N'Tô Thanh',N'Phong','ttphong0121@gmail.com',N'Hà Nội','Computer Engineering','1999-07-24','300008',N'Hà Nội','Junior programming');
INSERT INTO NHAKHOAHOC VALUES (N'Võ Trịnh Xuân',N'Nguyên','nguyenvotrinh@gmail.com',N'Huế','Computer Engineering','1999-05-04','300009',N'Hồ Chí Minh',N'Thiết bị nhúng'); 
INSERT INTO NHAKHOAHOC VALUES ('Kim So','Huyn','nguyenvotrinh@gmail.com','Busan','Architecture','1999-01-20','300010',N'Hà Nội',N'Kiến trúc sư'); 
INSERT INTO NHAKHOAHOC VALUES ('Lee Min','Ho','nguyenvotrinh@gmail.com','Seoul','Computer Science','2001-01-23','300011',N'Hà Nội','Senior'); 

--------------------------------------------------
-- INSERT BIENTAPVIEN : ID - Email cơ quan
INSERT INTO BIENTAPVIEN VALUES ('quachminhtuan@publication.com','100001');
INSERT INTO BIENTAPVIEN VALUES ('nguyenthanhnhan@publication.com','100002');
INSERT INTO BIENTAPVIEN VALUES ('lephuloc@publication.com','100003');
INSERT INTO BIENTAPVIEN VALUES ('nguyenphuckieuly@publication.com','100004');
INSERT INTO BIENTAPVIEN VALUES ('voanhnguyen@publication.com','100005');
INSERT INTO BIENTAPVIEN VALUES ('vohongphuc@publication.com','100006');

-- INSERT NGUOIPHANBIEN : ID - Email cơ quan - SDT - TRINH DO - NGAYCONGTAC
INSERT INTO NGUOIPHANBIEN VALUES ('200001','nguyentruonghaidang@publication.com','0734851321','TIENSI','2001-7-2');
INSERT INTO NGUOIPHANBIEN VALUES ('200002','truongyennhi@publication.com','0734852341','GIAOSU','2001-8-4');
INSERT INTO NGUOIPHANBIEN VALUES ('200003','luungocthuyan@publication.com','0734852381','THACSI','2001-9-6');
INSERT INTO NGUOIPHANBIEN VALUES ('200004','lythanhbach@publication.com','0734842321','PHOGIAOSU','2001-10-8');
INSERT INTO NGUOIPHANBIEN VALUES ('200005','ngolequocdung@publication.com','0734852381','THACSI','2001-12-10');
INSERT INTO NGUOIPHANBIEN VALUES ('200006','chautranhongha@publication.com','0734852391','TIENSI','2001-12-13');
INSERT INTO NGUOIPHANBIEN VALUES ('200007','luongthiquynhhuong@publication.com','0734802321','PHOGIAOSU','2001-2-1');
INSERT INTO NGUOIPHANBIEN VALUES ('200008','nguyengiakhiem@publication.com','0734852351','TIENSI','2001-2-16');

-- INSERT TACGIA: NHAKHOAHOC_ID
INSERT INTO TACGIA VALUES ('200002');
INSERT INTO TACGIA VALUES ('300001');
INSERT INTO TACGIA VALUES ('300002');
INSERT INTO TACGIA VALUES ('300003');
INSERT INTO TACGIA VALUES ('300004');
INSERT INTO TACGIA VALUES ('300005');
INSERT INTO TACGIA VALUES ('300006');
INSERT INTO TACGIA VALUES ('300007');
INSERT INTO TACGIA VALUES ('300008');
INSERT INTO TACGIA VALUES ('300009');
INSERT INTO TACGIA VALUES ('300010');
INSERT INTO TACGIA VALUES ('300011');

-- TÁC GIẢ LIÊN LẠC: 
INSERT INTO TACGIALIENLAC VALUES ('200002');
INSERT INTO TACGIALIENLAC VALUES ('300001');
INSERT INTO TACGIALIENLAC VALUES ('300004');
INSERT INTO TACGIALIENLAC VALUES ('300002');
INSERT INTO TACGIAlIENLAC VALUES ('300003');


--------------------------------------------------
-- INSERT BAIBAO : ID_BAIBAO(axxxxx)


-- Nghiên cứu
INSERT INTO BAIBAO VALUES ('a00001','DADANG','CNN.pdf','Convolutional Neural Networks','A basic technique of model in deep learning for image processing','12','200002','2016-3-1')
INSERT INTO BAIBAO VALUES ('a00002','DADANG','LSTM.pdf','Long Short Term Memory Networks','A basic technique of model in deep learning for natural language','18','300001','2016-4-1')
INSERT INTO BAIBAO VALUES ('a00003','DADANG','RNN.pdf','Recurrent Neural Networks','A basic technique of model in deep learning ','14','300002','2016-3-12')
INSERT INTO BAIBAO VALUES ('a00004','DADANG','GAN.pdf','Generative Adversarial Networks','A basic technique of model in deep learning','15','300003','2016-7-19')
INSERT INTO BAIBAO VALUES ('a00005','XUATBAN','MLP.pdf','Multilayer Perceptrons','A basic technique of model in deep learning','10','300004','2016-4-18')
INSERT INTO BAIBAO VALUES ('a00006','XUATBAN','RBFN.pdf','Radial Basis Function Networks','A basic technique of model in deep learning','20','200002','2016-5-7')
INSERT INTO BAIBAO VALUES ('a00007','XUATBAN','SOM.pdf','Self Organizing Maps','A basic technique of model in deep learning','12','300001','2016-10-8')
INSERT INTO BAIBAO VALUES ('a00008','HOANTATPHANBIEN','DBN.pdf','Deep Belief Networks','A basic technique of model in deep learning','13','300002','2016-3-19')
INSERT INTO BAIBAO VALUES ('a00009','HOANTATPHANBIEN','RBM.pdf','Restricted Boltzmann Machines ','A basic technique of model in deep learning','11','300003','2016-4-21')
INSERT INTO BAIBAO VALUES ('a00010','HOANTATPHANBIEN','DAE.pdf','Denoising Autoencode','A basic technique of model in deep learning','15','300004','2016-7-8')
INSERT INTO BAIBAO VALUES ('a00011','PHANBIEN','MTCS.pdf','Monte Carlo Tree Search','Reinforcement algorithms in Turnbase game','17','200002','2016-1-30')
INSERT INTO BAIBAO VALUES ('a00012','PHANHOIPHANBIEN','Minimax.pdf','Minimax algorithm','A basic technique in Turnbase game','18','300001','2016-12-19')
INSERT INTO BAIBAO VALUES ('a00013','PHANHOIPHANBIEN','AlphaZero.pdf','Alpha Zero','Neural network in Turnbase game','12','300002','2016-8-3')
INSERT INTO BAIBAO VALUES ('a00014','PHANBIEN','Q-learning.pdf','Q-learning','Reinforcement algorithms in Turnbase game','18','300003','2016-7-15')
INSERT INTO BAIBAO VALUES ('a00015','PHANBIEN','Genetic.pdf','Genetic Algorithm','Genetic algorithms in Turnbase game','19','300004','2016-10-21')

-- Tổng quan
INSERT INTO BAIBAO VALUES ('a10001','DADANG','LR.pdf','Linear Regression','A basic algorithm in machine learning','7','300001','2016-6-1')
INSERT INTO BAIBAO VALUES ('a10002','DADANG','Decision_Tree.pdf','Decision Tree','A basic algorithm in machine learning','10','200002','2016-12-21')
INSERT INTO BAIBAO VALUES ('a10003','XUATBAN','SVM.pdf','Support Vector Machine','A basic algorithm in machine learning','6','300002','2016-6-19')
INSERT INTO BAIBAO VALUES ('a10004','DADANG','Naive Bayes.pdf','Naive Bayes','A basic algorithm in machine learning','8','300003','2016-8-20')
INSERT INTO BAIBAO VALUES ('a10005','HOANTATPHANBIEN','kNN.pdf','k-Nearest Neighbors','A basic algorithm in machine learning','7','300004','2016-3-31')
INSERT INTO BAIBAO VALUES ('a10006','HOANTATPHANBIEN','Random_forest.pdf','Random Forest','A basic algorithm in machine learning','9','200002','2016-2-14')
INSERT INTO BAIBAO VALUES ('a10007','PHANHOIPHANBIEN','DRA.pdf','Dimensionality Reduction Algorithms','A basic technique for reducing dimension','8','300003','2016-3-2')
INSERT INTO BAIBAO VALUES ('a10008','PHANBIEN','XGBoost.pdf','XGBoost','A basic algorithm in machine learning','6','300004','2016-4-10')


-- Phản biện sách
INSERT INTO BAIBAO VALUES ('a20001','DADANG',N'PB_Đắc_nhân_tâm.pdf',N'Phản biện sách Đắc nhân tâm',N'Đắc Nhân Tâm của tác giả Dale Carnegie được mệnh danh là một trong những quyển sách hay nhất, bán chạy nhất và có tầm ảnh hưởng nhất mọi thời đại. Đây thực sự  là một cuốn sách tuyệt với mang lại nhiều giá trị cho người đọc về nghệ thuật thu phục lòng người khiến cho những người xung quanh phải khâm phục và yêu mến mình.','6','200002','2016-7-21') --– Dale Carnegie

INSERT INTO BAIBAO VALUES ('a20002','DADANG',N'PB_Điều ý nghĩa nhất trong từng khoảnh khắc cuộc đời.pdf',N'Phản biện sách Điều ý nghĩa nhất trong từng khoảnh khắc cuộc đời',N'Nếu Điều ý nghĩa nhất trong từng khoảnh khắc cuộc đời (có tên tiếng Anh là The One Thing) không nằm trong danh sách những cuốn sách hay giúp thay đổi cuộc đời bạn thì quả thật là một thiếu sót nghiêm trong. Đây là cuốn sách có tầm ảnh hưởng và đã làm thay đổi cuộc đời của hàng triệu người.','3','300004','2017-9-21') --- Gary Keller và Jay Papasan


INSERT INTO BAIBAO VALUES ('a20003','XUATBAN',N'PB_Đời thay đổi khi chúng ta thay đổi.pdf',N'Phản biện sách Đời thay đổi khi chúng ta thay đổi',N'Đời thay đổi khi chúng ta thay đổi của tác giả Andrew Matthews là một quyển sách hay mà ai cũng nên đọc một lần trong đời để thay đổi cuộc sống của mình, đặc biệt là những ai có lối sống tiêu cực.','4','300001','2016-8-8') --– Andrew Matthews

INSERT INTO BAIBAO VALUES ('a20004','HOANTATPHANBIEN',N'PB_Dám nghĩ lớn.pdf',N'Phản biện sách Dám nghĩ lớn',N'Dám nghĩ lớn có tên tiếng Anh là The Magic of Thinking Big là một quyển sách hay đã làm thay đổi cuộc đời của rất nhiều người một cách kỳ diệu nhất. Cuốn sách được sáng tác bởi nhà văn David Joseph Schwartz đồng thời vừa là một vị giáo sư Đại học tại bang Georgia – Mỹ.','3','300002','2016-10-11') --David J. Schwartz

INSERT INTO BAIBAO VALUES ('a20005','PHANHOIPHANBIEN',N'PB_Nhà giả kim.pdf',N'Phản biện sách Nhà giả kim',N'Một trong những cuốn sách hay giúp thay đổi cuộc đời mà bạn không thể không nhắc đến đó là Nhà giả Kim của tác giả Paulo Coelho. Tác phẩm nói về hành trình đi tìm vận mệnh và chinh phục ước mơ của chàng trai Santiago. Với những câu chuyện sâu sắc được lồng ghép trong tác phẩm giúp người đọc có thể hiểu rõ hơn về tình yêu, về bản chất con người, về lẽ sống, về ước mơ, ...','4','300003','2016-12-10') --- Paulo Coelho 

INSERT INTO BAIBAO VALUES ('a20006','PHANBIEN',N'PB_Thức tỉnh mục đích sống.pdf',N'Phản biện sách Thức tỉnh mục đích sống',N'Thức tỉnh mục đích sống của tác giả Eckhart Tolle được mệnh danh là một cuốn sách hay làm bừng tỉnh cả thế giới. Quyển sách mang lại cho chúng ta cái nhìn tổng hợp nhất về con người.','5','200002','2016-1-15') -- - Eckhart Tolle


------------------- Nghiên Cứu - Tổng quan - Phản biện sách
-- NGHIENCUU
INSERT INTO NGHIENCUU VALUES ('a00001')
INSERT INTO NGHIENCUU VALUES ('a00002')
INSERT INTO NGHIENCUU VALUES ('a00003')
INSERT INTO NGHIENCUU VALUES ('a00004')
INSERT INTO NGHIENCUU VALUES ('a00005')
INSERT INTO NGHIENCUU VALUES ('a00006')
INSERT INTO NGHIENCUU VALUES ('a00007')
INSERT INTO NGHIENCUU VALUES ('a00008')
INSERT INTO NGHIENCUU VALUES ('a00009')
INSERT INTO NGHIENCUU VALUES ('a00010')
INSERT INTO NGHIENCUU VALUES ('a00011')
INSERT INTO NGHIENCUU VALUES ('a00012')
INSERT INTO NGHIENCUU VALUES ('a00013')
INSERT INTO NGHIENCUU VALUES ('a00014')
INSERT INTO NGHIENCUU VALUES ('a00015')

--TONGQUAN
INSERT INTO TONGQUAN VALUES ('a10001')
INSERT INTO TONGQUAN VALUES ('a10002')
INSERT INTO TONGQUAN VALUES ('a10003')
INSERT INTO TONGQUAN VALUES ('a10004')
INSERT INTO TONGQUAN VALUES ('a10005')
INSERT INTO TONGQUAN VALUES ('a10006')
INSERT INTO TONGQUAN VALUES ('a10007')
INSERT INTO TONGQUAN VALUES ('a10008')

--PHANBIENSACH (ISBN-10, tên sách, NXB, năm xuất bản, ID)
INSERT INTO PHANBIENSACH VALUES ('3-598-21500-2',N'Đắc Nhân Tâm',N'Nhà xuất bản Hà Nội','2016','a20001')
INSERT INTO PHANBIENSACH VALUES ('3-598-21501-0',N'Điều ý nghĩa nhất trong từng khoảnh khắc cuộc đời',N'Nhà xuất bản Giáo dục','2015','a20002')
INSERT INTO PHANBIENSACH VALUES ('3-598-21502-9',N'Đời thay đổi khi chúng ta thay đổi',N'Nhà xuất bản Văn học','2009','a20003')
INSERT INTO PHANBIENSACH VALUES ('3-598-21503-7',N'Dám nghĩ lớn',N'Nhà xuất bản Giáo dục','2011','a20004')
INSERT INTO PHANBIENSACH VALUES ('3-598-21504-5',N'Nhà giả kim',N'Nhà xuất bản Văn học','2020','a20005')
INSERT INTO PHANBIENSACH VALUES ('3-598-21505-3',N'Thức tỉnh mục đích sống',N'Nhà xuất bản Hà Nội','2006','a20006')


-------------------- INSERT TU_KHOA (ID_BAIBAO,TU_KHOA) (ID_baibao, từ khóa)

INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00001','Convolutional Neural Networks')
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00001','CNN')
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00001','Deep Learning CNN')

INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00002','Long Short Term Memory Networks')
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00002','LSTM')
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00002','Deep Learning LSTM')
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00002','NLP_LSTM')

INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00003','Recurrent Neural Networks')
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00003','RNN')
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00003','Sequential_RNN')

INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00004','GAN')
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00004','Generative Adversarial Networks')

INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00005','Multilayer Perceptrons')
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00005','MLP')

INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00006','Radial Basis Function Networks')
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00006','RBFN')

INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00007','Self Organizing Maps')
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00007','SOM')

INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00008','DBN')
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00008','Deep Belief Networks')

INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00009','Restricted Boltzmann Machines')
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00009','RBM')

INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00010','Denoising Autoencode')
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00010','DAE')

INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00011','Monte Carlo Tree Search')
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00011','MTCS')

INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00012','Minimax')
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00012','Minimax algorithm')

INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00013','Alpha Zero')

INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00014','Q-learning')

INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a00015','Genetic Algorithm')

-- Tổng quan
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a10001','Linear Regression')
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a10002','Decision Tree')
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a10003','Support Vector Machine')
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a10003','SVM')

INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a10004','Naive Bayes')

INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a10005','k-Nearest Neighbors')
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a10005','kNN')

INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a10006','Random Forest')
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a10007','Dimensionality Reduction Algorithms')
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a10007','DRA')

INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a10008','XGBoost')

-- Phản biện sách
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a20001',N'Phản biện sách Đắc nhân tâm') --– Dale Carnegie
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a20001',N'PB_Đắc_nhân_tâm')

INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a20002',N'Phản biện sách Điều ý nghĩa nhất trong từng khoảnh khắc cuộc đời') --- Gary Keller và Jay Papasan
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a20002',N'PB_Điều ý nghĩa nhất trong từng khoảnh khắc cuộc đời')

INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a20003',N'PB_Đời thay đổi khi chúng ta thay đổi') --– Andrew Matthews
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a20003',N'Phản biện sách Đời thay đổi khi chúng ta thay đổi')

INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a20004',N'Phản biện sách Dám nghĩ lớn') --David J. Schwartz
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a20004',N'PB_Dám nghĩ lớn')

INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a20005',N'PB_Nhà giả kim') --- Paulo Coelho 
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a20005',N'Phản biện sách Nhà giả kim')

INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a20006',N'PB_Thức tỉnh mục đích sống') -- - Eckhart Tolle
INSERT INTO TU_KHOA (ID_BAIBAO,TU_KHOA) VALUES ('a20006',N'Phản biện sách Thức tỉnh mục đích sống')


--------------------
-- INSERT INTO PHANBIENSACHHASTACGIABAIBAO VALUES (ISBN, ID_bài báo, họ tên tác giả)
INSERT INTO PHANBIENSACHHASTACGIABAIBAO VALUES ('3-598-21500-2','a20001','Dale Carnegie')

INSERT INTO PHANBIENSACHHASTACGIABAIBAO VALUES ('3-598-21501-0','a20002','Jay Papasan')
INSERT INTO PHANBIENSACHHASTACGIABAIBAO VALUES ('3-598-21501-0','a20002','Gary Keller')

INSERT INTO PHANBIENSACHHASTACGIABAIBAO VALUES ('3-598-21502-9','a20003','Andrew Matthews')
INSERT INTO PHANBIENSACHHASTACGIABAIBAO VALUES ('3-598-21503-7','a20004','David J. Schwartz')
INSERT INTO PHANBIENSACHHASTACGIABAIBAO VALUES ('3-598-21504-5','a20005','Paulo Coelho')
INSERT INTO PHANBIENSACHHASTACGIABAIBAO VALUES ('3-598-21505-3','a20006','Eckhart Tolle')


--------------------------------------
-- Bài phản biện: Được phản biện
-- INSERT FORMAT: BAIPHANBIENID (4xxxxx) - ID_BAIBAO - GHICHU_TACGIA - GHICHU_BANBIENTAP - NGAYTHONGBAO - KQ - CACCHITIETKHAC
-- KETQUABAIPHANBIEN: 'REJECTION', 'MINOR_REVISION', 'MAJOR_REVISION', 'ACCEPTANCE'
INSERT INTO BAIPHANBIEN VALUES ('400001','a10001',N'Need some more documents',N'Postpone until enough docs','2019-5-28','MINOR_REVISION','Nothing');
INSERT INTO BAIPHANBIEN VALUES ('400002','a20001',N'Good',N'Defend thesis next week','2018-4-23','MINOR_REVISION','Need full inspections');
INSERT INTO BAIPHANBIEN VALUES ('400003','a10003',N'Verify the reference',N'OK','2020-2-18','MAJOR_REVISION','Nothing');
INSERT INTO BAIPHANBIEN VALUES ('400004','a10007',N'OK',N'completed','2018-9-6','ACCEPTANCE',N'Deliver to IEEE for publish');
INSERT INTO BAIPHANBIEN VALUES ('400005','a20002',N'OK',N'Delay until nextweek','2018-9-10','REJECTION',N'None');




---------------------------------------
-- Thực hiện phản biện 
-- Format: BAIPHANBIEN_ID + ID_BAIBAO + NHAKHOAHOC_ID

INSERT INTO THUCHIENPHANBIEN VALUES ('400004', 'a10007', '200004');
INSERT INTO THUCHIENPHANBIEN VALUES ('400002', 'a20001', '200002');
INSERT INTO THUCHIENPHANBIEN VALUES ('400002', 'a20001', '200005');
INSERT INTO THUCHIENPHANBIEN VALUES ('400002', 'a20001', '200007');


-- Tiêu chí: Hình thức, tính khả thi, tính thuyết phục, tính chính xác
-- INSERT TABLE THUCHIENPHANBIEN_TIEUCHIPHANBIEN
-- INSERT FORMAT: MOTA - DIEM - BAIPHANBIEN_ID (4xxxxx) - ID_BAIBAO - NHAKHOAHOC_ID
-- MOTA: Val_Rule_TIEUCHI: 'HINHTHUC', 'TINHKHATHI', 'TINHTHUYETPHUC', 'TINHCHINHXAC'
-- DIEMTIEUCHI : 0-100

INSERT INTO THUCHIENPHANBIEN_TIEUCHIPHANBIEN VALUES('HINHTHUC', 78, '400004', 'a10007','200004')
INSERT INTO THUCHIENPHANBIEN_TIEUCHIPHANBIEN VALUES('TINHKHATHI', 80, '400004', 'a10007','200004')
INSERT INTO THUCHIENPHANBIEN_TIEUCHIPHANBIEN VALUES('TINHTHUYETPHUC', 85, '400004', 'a10007','200004')
INSERT INTO THUCHIENPHANBIEN_TIEUCHIPHANBIEN VALUES('TINHCHINHXAC', 79, '400004', 'a10007','200004')

INSERT INTO THUCHIENPHANBIEN_TIEUCHIPHANBIEN VALUES('HINHTHUC', 90, '400002', 'a20001','200002')
INSERT INTO THUCHIENPHANBIEN_TIEUCHIPHANBIEN VALUES('TINHKHATHI', 94, '400002', 'a20001','200002')
INSERT INTO THUCHIENPHANBIEN_TIEUCHIPHANBIEN VALUES('TINHTHUYETPHUC', 85, '400002', 'a20001','200002')
INSERT INTO THUCHIENPHANBIEN_TIEUCHIPHANBIEN VALUES('TINHCHINHXAC', 87, '400002', 'a20001','200002')


INSERT INTO THUCHIENPHANBIEN_TIEUCHIPHANBIEN VALUES('HINHTHUC', 95, '400002', 'a20001','200005')
INSERT INTO THUCHIENPHANBIEN_TIEUCHIPHANBIEN VALUES('TINHKHATHI', 90, '400002', 'a20001','200005')
INSERT INTO THUCHIENPHANBIEN_TIEUCHIPHANBIEN VALUES('TINHTHUYETPHUC', 85, '400002', 'a20001','200005')
INSERT INTO THUCHIENPHANBIEN_TIEUCHIPHANBIEN VALUES('TINHCHINHXAC', 91, '400002', 'a20001','200005')


INSERT INTO THUCHIENPHANBIEN_TIEUCHIPHANBIEN VALUES('HINHTHUC', 98, '400002', 'a20001','200007')
INSERT INTO THUCHIENPHANBIEN_TIEUCHIPHANBIEN VALUES('TINHKHATHI', 100, '400002', 'a20001','200007')
INSERT INTO THUCHIENPHANBIEN_TIEUCHIPHANBIEN VALUES('TINHTHUYETPHUC', 89, '400002', 'a20001','200007')
INSERT INTO THUCHIENPHANBIEN_TIEUCHIPHANBIEN VALUES('TINHCHINHXAC', 82, '400002', 'a20001','200007')
---------------------------------------



-- SÁNG TÁC:
-- Format: ID_BAIBAO + NHAKHOAHOC_ID

INSERT INTO SANGTAC VALUES ('a10001','300001');
INSERT INTO SANGTAC VALUES ('a10001','200002');
INSERT INTO SANGTAC VALUES ('a20001','200002');
INSERT INTO SANGTAC VALUES ('a20001','300010');
INSERT INTO SANGTAC VALUES ('a20001','300011');
INSERT INTO SANGTAC VALUES ('a10003','300002');
INSERT INTO SANGTAC VALUES ('a10003','300005');
INSERT INTO SANGTAC VALUES ('a10007','300003');
INSERT INTO SANGTAC VALUES ('a20002','300004');
INSERT INTO SANGTAC VALUES ('a00002','300001');
INSERT INTO SANGTAC VALUES ('a00002','300006');


-------------------------------------
-- Bài báo được chấp nhận
-- Format: DOI - ID_BAIBAO - DANGXUATBAN - NHAXUATBAN - NAMXUATBAN

INSERT INTO BAIBAODADUOCCHAPNHAN VALUES ('10.1080/15588742.2010. 1017687','a10007','OPENACCESS','Oxford', 2010)
INSERT INTO BAIBAODADUOCCHAPNHAN VALUES ('10.1090/45589742.2015. 1017687','a20004','TRUYENTHONG',N'Đại học Quốc gia TP.HCM',2015);
INSERT INTO BAIBAODADUOCCHAPNHAN VALUES ('10.1090/45589742.2018. 4236274','a10008','OPENACCESS',N'MIT',2018);


----------------------------------------
-- Phân công phản biện
-- Format:BAIPHANBIEN_ID + ID_BAIBAO + NGAYPHANBIEN + DIADIEMPHANBIEN + NHAKHOAHOC_ID
INSERT INTO PHANCONGPHANBIEN VALUES ('400004', 'a10007', '2018-4-20','HOCHIMINH');
INSERT INTO PHANCONGPHANBIEN VALUES ('400002', 'a20001', '2017-10-21','HOCHIMINH');





----------------------- Trigger and Stored Procedure
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


-- ii.1
go
Create PROCEDURE capnhatthongtinnhaphanbien (
@ID_phanbienvien Nvarchar(100),
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
		SELECT BNT.BAIPHANBIEN_ID FROM  THUCHIENPHANBIEN_TIEUCHIPHANBIEN BNT
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
		from  THUCHIENPHANBIEN_TIEUCHIPHANBIEN BNT INNER JOIN  BAIBAO B ON BNT.ID_BAIBAO = B.ID_BAIBAO
		WHERE BNT.NHAKHOAHOC_ID =  @ID_phanbienvien and B.ID_BAIBAO like 'a0%'
	end
	begin
		select B.*
		from  THUCHIENPHANBIEN_TIEUCHIPHANBIEN BNT INNER JOIN  BAIBAO B ON BNT.ID_BAIBAO = B.ID_BAIBAO
		WHERE BNT.NHAKHOAHOC_ID =  @ID_phanbienvien and B.ID_BAIBAO like 'a1%'
	end
	begin
		select B.*
		from  THUCHIENPHANBIEN_TIEUCHIPHANBIEN BNT INNER JOIN  BAIBAO B ON BNT.ID_BAIBAO = B.ID_BAIBAO
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
		from  THUCHIENPHANBIEN_TIEUCHIPHANBIEN BNT INNER JOIN  BAIBAO B ON BNT.ID_BAIBAO = B.ID_BAIBAO
			  INNER JOIN  PHANCONGPHANBIEN PCPB ON BNT.BAIPHANBIEN_ID = PCPB.BAIPHANBIEN_ID
		WHERE BNT.NHAKHOAHOC_ID =  @ID_phanbienvien  AND YEAR(CURRENT_TIMESTAMP)- YEAR(PCPB.NGAYPHANBIEN) <= 3 and B.ID_BAIBAO like 'a0%'
	end
	begin
		select B.*
		from  THUCHIENPHANBIEN_TIEUCHIPHANBIEN BNT INNER JOIN  BAIBAO B ON BNT.ID_BAIBAO = B.ID_BAIBAO
			  INNER JOIN  PHANCONGPHANBIEN PCPB ON BNT.BAIPHANBIEN_ID = PCPB.BAIPHANBIEN_ID
		WHERE BNT.NHAKHOAHOC_ID =  @ID_phanbienvien  AND YEAR(CURRENT_TIMESTAMP)- YEAR(PCPB.NGAYPHANBIEN) <= 3 and B.ID_BAIBAO like 'a1%'
	end
	begin
		select B.*
		from  THUCHIENPHANBIEN_TIEUCHIPHANBIEN BNT INNER JOIN  BAIBAO B ON BNT.ID_BAIBAO = B.ID_BAIBAO
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
from  THUCHIENPHANBIEN_TIEUCHIPHANBIEN BNT INNER JOIN  BAIBAO B ON BNT.ID_BAIBAO = B.ID_BAIBAO
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
from  THUCHIENPHANBIEN_TIEUCHIPHANBIEN BNT INNER JOIN  BAIBAO B ON BNT.ID_BAIBAO = B.ID_BAIBAO
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
		from  THUCHIENPHANBIEN_TIEUCHIPHANBIEN BNT INNER JOIN  BAIBAO B ON BNT.ID_BAIBAO = B.ID_BAIBAO
			  INNER JOIN SANGTAC S ON S.ID_BAIBAO=B.ID_BAIBAO
			  INNER JOIN NHAKHOAHOC NKH ON NKH.NHAKHOAHOC_ID= S.NHAKHOAHOC_ID
		where BNT.NHAKHOAHOC_ID = @ID_phanbienvien
		group by NKH.NHAKHOAHOC_ID
		order by COUNT(*) DESC
		) A
		)
	begin 
		select B.*
		from  THUCHIENPHANBIEN_TIEUCHIPHANBIEN BNT INNER JOIN  BAIBAO B ON BNT.ID_BAIBAO = B.ID_BAIBAO
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
	THUCHIENPHANBIEN_TIEUCHIPHANBIEN BNT inner join BAIPHANBIEN BPB on BNT.BAIPHANBIEN_ID = BPB.BAIPHANBIEN_ID 
	where BNT.NHAKHOAHOC_ID= @ID_phanbienvien AND year(BPB.NGAYTHONGBAO) = year(CURRENT_TIMESTAMP)
end
go
--ii.9
create procedure _3nam_Nhieubaiphanbiennhat
(@ID_phanbienvien Nvarchar(100))
as
begin 
	select top 3 year(BPB.NGAYTHONGBAO),COUNT(*) from 
	THUCHIENPHANBIEN_TIEUCHIPHANBIEN BNT inner join BAIPHANBIEN BPB on BNT.BAIPHANBIEN_ID = BPB.BAIPHANBIEN_ID 
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
	THUCHIENPHANBIEN_TIEUCHIPHANBIEN BNT inner join BAIPHANBIEN BPB on BNT.BAIPHANBIEN_ID = BPB.BAIPHANBIEN_ID 
	where BNT.NHAKHOAHOC_ID= @ID_phanbienvien and BPB.KETQUA = 'ACCEPTANCE'
end
go
--ii.11
create procedure _3baibao_Phanbien_te_nhat
(@ID_phanbienvien Nvarchar(100))
as
begin 
	select top 3 * from 
	THUCHIENPHANBIEN_TIEUCHIPHANBIEN BNT inner join BAIPHANBIEN BPB on BNT.BAIPHANBIEN_ID = BPB.BAIPHANBIEN_ID 
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
	THUCHIENPHANBIEN_TIEUCHIPHANBIEN BNT inner join BAIPHANBIEN BPB on BNT.BAIPHANBIEN_ID = BPB.BAIPHANBIEN_ID 
	where BNT.NHAKHOAHOC_ID= @ID_phanbienvien and( YEAR( CURRENT_TIMESTAMP) - year(BPB.NGAYTHONGBAO) <=5 )
	group by year(BPB.NGAYTHONGBAO)
) A 
END


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
