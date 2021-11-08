
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
	AS @col IN ('NHAKHOAHOC', 'NGUOIPHANBIEN', 'BIENTAPVIEN')
go




exec sp_bindrule 'Val_Rule_Gender', 'Gender'
go




exec sp_bindrule 'Val_Rule_KETQUABAIPHANBIEN', 'Ketquabaiphanbien'
go




exec sp_bindrule 'Val_Rule_DANGXUATBAN', 'Dangxuatban'
go




exec sp_bindrule 'Val_Rule_TRANGTHAIXULI', 'Trangthaixuli'
go



CREATE TABLE BAIBAO
( 
	ID_BAIBAO            nvarchar(100)  NOT NULL ,
	TRANGTHAIXULI        Trangthaixuli ,
	FILEBAIBAO           nvarchar(100)  NULL ,
	TIEUDE               nvarchar(150)  NULL ,
	TOMTAT               nvarchar(1500)  NULL ,
	TONGSOTRANG          integer  NULL 
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
	GHICHU_TACGIA        nvarchar(1000)  NULL ,
	GHICHU_BANBIENTAP    nvarchar(1000)  NULL ,
	NGAYTHONGBAO         datetime  NOT NULL ,
	KETQUA               Ketquabaiphanbien ,
	ID_BAIBAO            nvarchar(100)  NOT NULL ,
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



CREATE TABLE BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN
( 
	BAIPHANBIEN_ID       nvarchar(100)  NOT NULL ,
	ID_BAIBAO            nvarchar(100)  NOT NULL ,
	TENTIEUCHI           nvarchar(100)  NOT NULL ,
	NHAKHOAHOC_ID        nvarchar(100)  NOT NULL 
)
go



ALTER TABLE BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN
	ADD CONSTRAINT XPKBAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN PRIMARY KEY  CLUSTERED (BAIPHANBIEN_ID ASC,ID_BAIBAO ASC,TENTIEUCHI ASC,NHAKHOAHOC_ID ASC)
go



CREATE TABLE BIENTAPVIEN
( 
	EMAILCOQUAN          nvarchar(100)  NULL ,
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



CREATE TABLE NGUOICOQUYENPHANBIEN
( 
	TRINHDO              nvarchar(100)  NULL ,
	SODIENTHOAI          nvarchar(100)  NULL ,
	NGAYCONGTAC          datetime  NULL ,
	NHAKHOAHOC_ID        nvarchar(100)  NOT NULL 
)
go



ALTER TABLE NGUOICOQUYENPHANBIEN
	ADD CONSTRAINT XPKNGUOICOQUYENPHANBIEN PRIMARY KEY  CLUSTERED (NHAKHOAHOC_ID ASC)
go



CREATE TABLE NGUOICOQUYENTACGIA
( 
	NHAKHOAHOC_ID        nvarchar(100)  NOT NULL 
)
go



ALTER TABLE NGUOICOQUYENTACGIA
	ADD CONSTRAINT XPKNGUOICOQUYENTACGIA PRIMARY KEY  CLUSTERED (NHAKHOAHOC_ID ASC)
go



CREATE TABLE NGUOIPHANBIEN
( 
	NHAKHOAHOC_ID        nvarchar(100)  NOT NULL ,
	EMAILCOQUAN          nvarchar(200)  NULL 
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
	VAITRO               nvarchar(100)  NOT NULL ,
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
	NGAYPHANBIEN         datetime  NULL ,
	DIADIEMPHANBIEN      nvarchar(200)  NULL ,
	NHAKHOAHOC_ID        nvarchar(100)  NOT NULL 
)
go



ALTER TABLE PHANCONGPHANBIEN
	ADD CONSTRAINT XPKPHANCONGPHANBIEN PRIMARY KEY  CLUSTERED (BAIPHANBIEN_ID ASC,ID_BAIBAO ASC,NHAKHOAHOC_ID ASC)
go



CREATE TABLE SANGTAC
( 
	ID_BAIBAO            nvarchar(100)  NOT NULL ,
	NHAKHOAHOC_ID        nvarchar(100)  NOT NULL 
)
go



ALTER TABLE SANGTAC
	ADD CONSTRAINT XPKSANGTAC PRIMARY KEY  CLUSTERED (ID_BAIBAO ASC,NHAKHOAHOC_ID ASC)
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
	TENBAIBAO            nvarchar(100)  NULL ,
	THOIGIANGUI          datetime  NULL ,
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
	ADD CONSTRAINT XPKBAIPHANBIEN_NGUOICOQUYENPHANBIEN PRIMARY KEY  CLUSTERED (BAIPHANBIEN_ID ASC,ID_BAIBAO ASC,NHAKHOAHOC_ID ASC)
go



CREATE TABLE TIEUCHIPHANBIEN
( 
	DIEM                 integer  NOT NULL ,
	MOTA                 varchar(40)  NULL ,
	TENTIEUCHI           nvarchar(100)  NOT NULL 
)
go



ALTER TABLE TIEUCHIPHANBIEN
	ADD CONSTRAINT XPKTIEUCHIPHANBIEN PRIMARY KEY  CLUSTERED (TENTIEUCHI ASC)
go



CREATE TABLE TONGQUAN
( 
	ID_BAIBAO            nvarchar(100)  NOT NULL 
)
go



ALTER TABLE TONGQUAN
	ADD CONSTRAINT XPKBAO PRIMARY KEY  CLUSTERED (ID_BAIBAO ASC)
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




ALTER TABLE BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN
	ADD CONSTRAINT R_1022 FOREIGN KEY (BAIPHANBIEN_ID,ID_BAIBAO,NHAKHOAHOC_ID) REFERENCES THUCHIENPHANBIEN(BAIPHANBIEN_ID,ID_BAIBAO,NHAKHOAHOC_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN
	ADD CONSTRAINT R_1024 FOREIGN KEY (TENTIEUCHI) REFERENCES TIEUCHIPHANBIEN(TENTIEUCHI)
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




ALTER TABLE NGUOICOQUYENPHANBIEN
	ADD CONSTRAINT R_1054 FOREIGN KEY (NHAKHOAHOC_ID) REFERENCES NGUOIPHANBIEN(NHAKHOAHOC_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE NGUOICOQUYENPHANBIEN
	ADD CONSTRAINT R_1055 FOREIGN KEY (NHAKHOAHOC_ID) REFERENCES BIENTAPVIEN(NHAKHOAHOC_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE NGUOICOQUYENTACGIA
	ADD CONSTRAINT R_1056 FOREIGN KEY (NHAKHOAHOC_ID) REFERENCES NGUOIPHANBIEN(NHAKHOAHOC_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE NGUOICOQUYENTACGIA
	ADD CONSTRAINT R_1057 FOREIGN KEY (NHAKHOAHOC_ID) REFERENCES TACGIA(NHAKHOAHOC_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE NGUOIPHANBIEN
	ADD  FOREIGN KEY (NHAKHOAHOC_ID) REFERENCES NHAKHOAHOC(NHAKHOAHOC_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go




exec sp_bindrule 'Val_Rule_VAITRO', 'NHAKHOAHOC.VAITRO'
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




ALTER TABLE PHANCONGPHANBIEN
	ADD CONSTRAINT R_1035 FOREIGN KEY (NHAKHOAHOC_ID) REFERENCES NGUOICOQUYENPHANBIEN(NHAKHOAHOC_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE SANGTAC
	ADD CONSTRAINT R_244 FOREIGN KEY (ID_BAIBAO) REFERENCES BAIBAO(ID_BAIBAO)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE SANGTAC
	ADD CONSTRAINT R_242 FOREIGN KEY (NHAKHOAHOC_ID) REFERENCES NGUOICOQUYENTACGIA(NHAKHOAHOC_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE TACGIA
	ADD  FOREIGN KEY (NHAKHOAHOC_ID) REFERENCES NHAKHOAHOC(NHAKHOAHOC_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go




ALTER TABLE TACGIALIENLAC
	ADD  FOREIGN KEY (NHAKHOAHOC_ID) REFERENCES NGUOICOQUYENTACGIA(NHAKHOAHOC_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go




ALTER TABLE THUCHIENPHANBIEN
	ADD CONSTRAINT R_1000 FOREIGN KEY (BAIPHANBIEN_ID,ID_BAIBAO) REFERENCES BAIPHANBIEN(BAIPHANBIEN_ID,ID_BAIBAO)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE THUCHIENPHANBIEN
	ADD CONSTRAINT R_1002 FOREIGN KEY (NHAKHOAHOC_ID) REFERENCES NGUOICOQUYENPHANBIEN(NHAKHOAHOC_ID)
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




CREATE TRIGGER tD_BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN ON BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* THUCHIENPHANBIEN  BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0004044e", PARENT_OWNER="", PARENT_TABLE="THUCHIENPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1022", FK_COLUMNS="NHAKHOAHOC_ID""BAIPHANBIEN_ID""ID_BAIBAO" */
    IF EXISTS (SELECT * FROM deleted,THUCHIENPHANBIEN
      WHERE
        /* %JoinFKPK(deleted,THUCHIENPHANBIEN," = "," AND") */
        deleted.BAIPHANBIEN_ID = THUCHIENPHANBIEN.BAIPHANBIEN_ID AND
        deleted.ID_BAIBAO = THUCHIENPHANBIEN.ID_BAIBAO AND
        deleted.NHAKHOAHOC_ID = THUCHIENPHANBIEN.NHAKHOAHOC_ID AND
        NOT EXISTS (
          SELECT * FROM BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN
          WHERE
            /* %JoinFKPK(BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN,THUCHIENPHANBIEN," = "," AND") */
            BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN.BAIPHANBIEN_ID = THUCHIENPHANBIEN.BAIPHANBIEN_ID AND
            BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN.ID_BAIBAO = THUCHIENPHANBIEN.ID_BAIBAO AND
            BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN.NHAKHOAHOC_ID = THUCHIENPHANBIEN.NHAKHOAHOC_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN because THUCHIENPHANBIEN exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* TIEUCHIPHANBIEN  BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="TIEUCHIPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1024", FK_COLUMNS="TENTIEUCHI" */
    IF EXISTS (SELECT * FROM deleted,TIEUCHIPHANBIEN
      WHERE
        /* %JoinFKPK(deleted,TIEUCHIPHANBIEN," = "," AND") */
        deleted.TENTIEUCHI = TIEUCHIPHANBIEN.TENTIEUCHI AND
        NOT EXISTS (
          SELECT * FROM BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN
          WHERE
            /* %JoinFKPK(BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN,TIEUCHIPHANBIEN," = "," AND") */
            BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN.TENTIEUCHI = TIEUCHIPHANBIEN.TENTIEUCHI
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN because TIEUCHIPHANBIEN exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go


CREATE TRIGGER tU_BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN ON BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insBAIPHANBIEN_ID nvarchar(100), 
           @insID_BAIBAO nvarchar(100), 
           @insTENTIEUCHI nvarchar(100), 
           @insNHAKHOAHOC_ID nvarchar(100),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* THUCHIENPHANBIEN  BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000396a0", PARENT_OWNER="", PARENT_TABLE="THUCHIENPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1022", FK_COLUMNS="NHAKHOAHOC_ID""BAIPHANBIEN_ID""ID_BAIBAO" */
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
             @errmsg = 'Cannot update BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN because THUCHIENPHANBIEN does not exist.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* TIEUCHIPHANBIEN  BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="TIEUCHIPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1024", FK_COLUMNS="TENTIEUCHI" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(TENTIEUCHI)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,TIEUCHIPHANBIEN
        WHERE
          /* %JoinFKPK(inserted,TIEUCHIPHANBIEN) */
          inserted.TENTIEUCHI = TIEUCHIPHANBIEN.TENTIEUCHI
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN because TIEUCHIPHANBIEN does not exist.'
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
    /* BIENTAPVIEN  NGUOICOQUYENPHANBIEN on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00025b72", PARENT_OWNER="", PARENT_TABLE="BIENTAPVIEN"
    CHILD_OWNER="", CHILD_TABLE="NGUOICOQUYENPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1055", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (
      SELECT * FROM deleted,NGUOICOQUYENPHANBIEN
      WHERE
        /*  %JoinFKPK(NGUOICOQUYENPHANBIEN,deleted," = "," AND") */
        NGUOICOQUYENPHANBIEN.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete BIENTAPVIEN because NGUOICOQUYENPHANBIEN exists.'
      GOTO ERROR
    END

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
  /* BIENTAPVIEN  NGUOICOQUYENPHANBIEN on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000288a1", PARENT_OWNER="", PARENT_TABLE="BIENTAPVIEN"
    CHILD_OWNER="", CHILD_TABLE="NGUOICOQUYENPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1055", FK_COLUMNS="NHAKHOAHOC_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,NGUOICOQUYENPHANBIEN
      WHERE
        /*  %JoinFKPK(NGUOICOQUYENPHANBIEN,deleted," = "," AND") */
        NGUOICOQUYENPHANBIEN.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update BIENTAPVIEN because NGUOICOQUYENPHANBIEN exists.'
      GOTO ERROR
    END
  END

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




CREATE TRIGGER tD_NGUOICOQUYENPHANBIEN ON NGUOICOQUYENPHANBIEN FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on NGUOICOQUYENPHANBIEN */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* NGUOICOQUYENPHANBIEN  THUCHIENPHANBIEN on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0004fcca", PARENT_OWNER="", PARENT_TABLE="NGUOICOQUYENPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="THUCHIENPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1002", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (
      SELECT * FROM deleted,THUCHIENPHANBIEN
      WHERE
        /*  %JoinFKPK(THUCHIENPHANBIEN,deleted," = "," AND") */
        THUCHIENPHANBIEN.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete NGUOICOQUYENPHANBIEN because THUCHIENPHANBIEN exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* NGUOICOQUYENPHANBIEN  PHANCONGPHANBIEN on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NGUOICOQUYENPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="PHANCONGPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1035", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (
      SELECT * FROM deleted,PHANCONGPHANBIEN
      WHERE
        /*  %JoinFKPK(PHANCONGPHANBIEN,deleted," = "," AND") */
        PHANCONGPHANBIEN.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete NGUOICOQUYENPHANBIEN because PHANCONGPHANBIEN exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* NGUOIPHANBIEN  NGUOICOQUYENPHANBIEN on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NGUOIPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="NGUOICOQUYENPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1054", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (SELECT * FROM deleted,NGUOIPHANBIEN
      WHERE
        /* %JoinFKPK(deleted,NGUOIPHANBIEN," = "," AND") */
        deleted.NHAKHOAHOC_ID = NGUOIPHANBIEN.NHAKHOAHOC_ID AND
        NOT EXISTS (
          SELECT * FROM NGUOICOQUYENPHANBIEN
          WHERE
            /* %JoinFKPK(NGUOICOQUYENPHANBIEN,NGUOIPHANBIEN," = "," AND") */
            NGUOICOQUYENPHANBIEN.NHAKHOAHOC_ID = NGUOIPHANBIEN.NHAKHOAHOC_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last NGUOICOQUYENPHANBIEN because NGUOIPHANBIEN exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* BIENTAPVIEN  NGUOICOQUYENPHANBIEN on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BIENTAPVIEN"
    CHILD_OWNER="", CHILD_TABLE="NGUOICOQUYENPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1055", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (SELECT * FROM deleted,BIENTAPVIEN
      WHERE
        /* %JoinFKPK(deleted,BIENTAPVIEN," = "," AND") */
        deleted.NHAKHOAHOC_ID = BIENTAPVIEN.NHAKHOAHOC_ID AND
        NOT EXISTS (
          SELECT * FROM NGUOICOQUYENPHANBIEN
          WHERE
            /* %JoinFKPK(NGUOICOQUYENPHANBIEN,BIENTAPVIEN," = "," AND") */
            NGUOICOQUYENPHANBIEN.NHAKHOAHOC_ID = BIENTAPVIEN.NHAKHOAHOC_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last NGUOICOQUYENPHANBIEN because BIENTAPVIEN exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go


CREATE TRIGGER tU_NGUOICOQUYENPHANBIEN ON NGUOICOQUYENPHANBIEN FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on NGUOICOQUYENPHANBIEN */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insNHAKHOAHOC_ID nvarchar(100),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* NGUOICOQUYENPHANBIEN  THUCHIENPHANBIEN on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00054110", PARENT_OWNER="", PARENT_TABLE="NGUOICOQUYENPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="THUCHIENPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1002", FK_COLUMNS="NHAKHOAHOC_ID" */
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
             @errmsg = 'Cannot update NGUOICOQUYENPHANBIEN because THUCHIENPHANBIEN exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* NGUOICOQUYENPHANBIEN  PHANCONGPHANBIEN on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NGUOICOQUYENPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="PHANCONGPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1035", FK_COLUMNS="NHAKHOAHOC_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,PHANCONGPHANBIEN
      WHERE
        /*  %JoinFKPK(PHANCONGPHANBIEN,deleted," = "," AND") */
        PHANCONGPHANBIEN.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update NGUOICOQUYENPHANBIEN because PHANCONGPHANBIEN exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* NGUOIPHANBIEN  NGUOICOQUYENPHANBIEN on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NGUOIPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="NGUOICOQUYENPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1054", FK_COLUMNS="NHAKHOAHOC_ID" */
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
             @errmsg = 'Cannot update NGUOICOQUYENPHANBIEN because NGUOIPHANBIEN does not exist.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* BIENTAPVIEN  NGUOICOQUYENPHANBIEN on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BIENTAPVIEN"
    CHILD_OWNER="", CHILD_TABLE="NGUOICOQUYENPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1055", FK_COLUMNS="NHAKHOAHOC_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,BIENTAPVIEN
        WHERE
          /* %JoinFKPK(inserted,BIENTAPVIEN) */
          inserted.NHAKHOAHOC_ID = BIENTAPVIEN.NHAKHOAHOC_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update NGUOICOQUYENPHANBIEN because BIENTAPVIEN does not exist.'
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




CREATE TRIGGER tD_NGUOICOQUYENTACGIA ON NGUOICOQUYENTACGIA FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on NGUOICOQUYENTACGIA */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* NGUOICOQUYENTACGIA  TACGIALIENLAC on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="000464aa", PARENT_OWNER="", PARENT_TABLE="NGUOICOQUYENTACGIA"
    CHILD_OWNER="", CHILD_TABLE="TACGIALIENLAC"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="NHAKHOAHOC_ID" */
    DELETE TACGIALIENLAC
      FROM TACGIALIENLAC,deleted
      WHERE
        /*  %JoinFKPK(TACGIALIENLAC,deleted," = "," AND") */
        TACGIALIENLAC.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID

    /* ERwin Builtin Trigger */
    /* NGUOICOQUYENTACGIA  SANGTAC on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NGUOICOQUYENTACGIA"
    CHILD_OWNER="", CHILD_TABLE="SANGTAC"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_242", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (
      SELECT * FROM deleted,SANGTAC
      WHERE
        /*  %JoinFKPK(SANGTAC,deleted," = "," AND") */
        SANGTAC.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete NGUOICOQUYENTACGIA because SANGTAC exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* NGUOIPHANBIEN  NGUOICOQUYENTACGIA on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NGUOIPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="NGUOICOQUYENTACGIA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1056", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (SELECT * FROM deleted,NGUOIPHANBIEN
      WHERE
        /* %JoinFKPK(deleted,NGUOIPHANBIEN," = "," AND") */
        deleted.NHAKHOAHOC_ID = NGUOIPHANBIEN.NHAKHOAHOC_ID AND
        NOT EXISTS (
          SELECT * FROM NGUOICOQUYENTACGIA
          WHERE
            /* %JoinFKPK(NGUOICOQUYENTACGIA,NGUOIPHANBIEN," = "," AND") */
            NGUOICOQUYENTACGIA.NHAKHOAHOC_ID = NGUOIPHANBIEN.NHAKHOAHOC_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last NGUOICOQUYENTACGIA because NGUOIPHANBIEN exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* TACGIA  NGUOICOQUYENTACGIA on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="TACGIA"
    CHILD_OWNER="", CHILD_TABLE="NGUOICOQUYENTACGIA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1057", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (SELECT * FROM deleted,TACGIA
      WHERE
        /* %JoinFKPK(deleted,TACGIA," = "," AND") */
        deleted.NHAKHOAHOC_ID = TACGIA.NHAKHOAHOC_ID AND
        NOT EXISTS (
          SELECT * FROM NGUOICOQUYENTACGIA
          WHERE
            /* %JoinFKPK(NGUOICOQUYENTACGIA,TACGIA," = "," AND") */
            NGUOICOQUYENTACGIA.NHAKHOAHOC_ID = TACGIA.NHAKHOAHOC_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last NGUOICOQUYENTACGIA because TACGIA exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go


CREATE TRIGGER tU_NGUOICOQUYENTACGIA ON NGUOICOQUYENTACGIA FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on NGUOICOQUYENTACGIA */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insNHAKHOAHOC_ID nvarchar(100),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* NGUOICOQUYENTACGIA  TACGIALIENLAC on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00057bf2", PARENT_OWNER="", PARENT_TABLE="NGUOICOQUYENTACGIA"
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
             @errmsg = 'Cannot cascade NGUOICOQUYENTACGIA update because more than one row has been affected.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* NGUOICOQUYENTACGIA  SANGTAC on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NGUOICOQUYENTACGIA"
    CHILD_OWNER="", CHILD_TABLE="SANGTAC"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_242", FK_COLUMNS="NHAKHOAHOC_ID" */
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
             @errmsg = 'Cannot update NGUOICOQUYENTACGIA because SANGTAC exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* NGUOIPHANBIEN  NGUOICOQUYENTACGIA on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NGUOIPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="NGUOICOQUYENTACGIA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1056", FK_COLUMNS="NHAKHOAHOC_ID" */
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
             @errmsg = 'Cannot update NGUOICOQUYENTACGIA because NGUOIPHANBIEN does not exist.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* TACGIA  NGUOICOQUYENTACGIA on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="TACGIA"
    CHILD_OWNER="", CHILD_TABLE="NGUOICOQUYENTACGIA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1057", FK_COLUMNS="NHAKHOAHOC_ID" */
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
             @errmsg = 'Cannot update NGUOICOQUYENTACGIA because TACGIA does not exist.'
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
    /* NGUOIPHANBIEN  NGUOICOQUYENPHANBIEN on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00036f30", PARENT_OWNER="", PARENT_TABLE="NGUOIPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="NGUOICOQUYENPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1054", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (
      SELECT * FROM deleted,NGUOICOQUYENPHANBIEN
      WHERE
        /*  %JoinFKPK(NGUOICOQUYENPHANBIEN,deleted," = "," AND") */
        NGUOICOQUYENPHANBIEN.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete NGUOIPHANBIEN because NGUOICOQUYENPHANBIEN exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* NGUOIPHANBIEN  NGUOICOQUYENTACGIA on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NGUOIPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="NGUOICOQUYENTACGIA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1056", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (
      SELECT * FROM deleted,NGUOICOQUYENTACGIA
      WHERE
        /*  %JoinFKPK(NGUOICOQUYENTACGIA,deleted," = "," AND") */
        NGUOICOQUYENTACGIA.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete NGUOIPHANBIEN because NGUOICOQUYENTACGIA exists.'
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
  /* NGUOIPHANBIEN  NGUOICOQUYENPHANBIEN on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0003c948", PARENT_OWNER="", PARENT_TABLE="NGUOIPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="NGUOICOQUYENPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1054", FK_COLUMNS="NHAKHOAHOC_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,NGUOICOQUYENPHANBIEN
      WHERE
        /*  %JoinFKPK(NGUOICOQUYENPHANBIEN,deleted," = "," AND") */
        NGUOICOQUYENPHANBIEN.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update NGUOIPHANBIEN because NGUOICOQUYENPHANBIEN exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* NGUOIPHANBIEN  NGUOICOQUYENTACGIA on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NGUOIPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="NGUOICOQUYENTACGIA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1056", FK_COLUMNS="NHAKHOAHOC_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,NGUOICOQUYENTACGIA
      WHERE
        /*  %JoinFKPK(NGUOICOQUYENTACGIA,deleted," = "," AND") */
        NGUOICOQUYENTACGIA.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update NGUOIPHANBIEN because NGUOICOQUYENTACGIA exists.'
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
    /* NGUOICOQUYENPHANBIEN  PHANCONGPHANBIEN on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NGUOICOQUYENPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="PHANCONGPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1035", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (SELECT * FROM deleted,NGUOICOQUYENPHANBIEN
      WHERE
        /* %JoinFKPK(deleted,NGUOICOQUYENPHANBIEN," = "," AND") */
        deleted.NHAKHOAHOC_ID = NGUOICOQUYENPHANBIEN.NHAKHOAHOC_ID AND
        NOT EXISTS (
          SELECT * FROM PHANCONGPHANBIEN
          WHERE
            /* %JoinFKPK(PHANCONGPHANBIEN,NGUOICOQUYENPHANBIEN," = "," AND") */
            PHANCONGPHANBIEN.NHAKHOAHOC_ID = NGUOICOQUYENPHANBIEN.NHAKHOAHOC_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PHANCONGPHANBIEN because NGUOICOQUYENPHANBIEN exists.'
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
           @insNHAKHOAHOC_ID nvarchar(100),
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
  /* NGUOICOQUYENPHANBIEN  PHANCONGPHANBIEN on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NGUOICOQUYENPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="PHANCONGPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1035", FK_COLUMNS="NHAKHOAHOC_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,NGUOICOQUYENPHANBIEN
        WHERE
          /* %JoinFKPK(inserted,NGUOICOQUYENPHANBIEN) */
          inserted.NHAKHOAHOC_ID = NGUOICOQUYENPHANBIEN.NHAKHOAHOC_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PHANCONGPHANBIEN because NGUOICOQUYENPHANBIEN does not exist.'
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
    /* NGUOICOQUYENTACGIA  SANGTAC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00026582", PARENT_OWNER="", PARENT_TABLE="NGUOICOQUYENTACGIA"
    CHILD_OWNER="", CHILD_TABLE="SANGTAC"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_242", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (SELECT * FROM deleted,NGUOICOQUYENTACGIA
      WHERE
        /* %JoinFKPK(deleted,NGUOICOQUYENTACGIA," = "," AND") */
        deleted.NHAKHOAHOC_ID = NGUOICOQUYENTACGIA.NHAKHOAHOC_ID AND
        NOT EXISTS (
          SELECT * FROM SANGTAC
          WHERE
            /* %JoinFKPK(SANGTAC,NGUOICOQUYENTACGIA," = "," AND") */
            SANGTAC.NHAKHOAHOC_ID = NGUOICOQUYENTACGIA.NHAKHOAHOC_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last SANGTAC because NGUOICOQUYENTACGIA exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* BAIBAO  SANGTAC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
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
  /* NGUOICOQUYENTACGIA  SANGTAC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002b87b", PARENT_OWNER="", PARENT_TABLE="NGUOICOQUYENTACGIA"
    CHILD_OWNER="", CHILD_TABLE="SANGTAC"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_242", FK_COLUMNS="NHAKHOAHOC_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,NGUOICOQUYENTACGIA
        WHERE
          /* %JoinFKPK(inserted,NGUOICOQUYENTACGIA) */
          inserted.NHAKHOAHOC_ID = NGUOICOQUYENTACGIA.NHAKHOAHOC_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update SANGTAC because NGUOICOQUYENTACGIA does not exist.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* BAIBAO  SANGTAC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BAIBAO"
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
    /* TACGIA  NGUOICOQUYENTACGIA on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00023f7c", PARENT_OWNER="", PARENT_TABLE="TACGIA"
    CHILD_OWNER="", CHILD_TABLE="NGUOICOQUYENTACGIA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1057", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (
      SELECT * FROM deleted,NGUOICOQUYENTACGIA
      WHERE
        /*  %JoinFKPK(NGUOICOQUYENTACGIA,deleted," = "," AND") */
        NGUOICOQUYENTACGIA.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete TACGIA because NGUOICOQUYENTACGIA exists.'
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
  /* TACGIA  NGUOICOQUYENTACGIA on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00028579", PARENT_OWNER="", PARENT_TABLE="TACGIA"
    CHILD_OWNER="", CHILD_TABLE="NGUOICOQUYENTACGIA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1057", FK_COLUMNS="NHAKHOAHOC_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,NGUOICOQUYENTACGIA
      WHERE
        /*  %JoinFKPK(NGUOICOQUYENTACGIA,deleted," = "," AND") */
        NGUOICOQUYENTACGIA.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update TACGIA because NGUOICOQUYENTACGIA exists.'
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
    /* NGUOICOQUYENTACGIA  TACGIALIENLAC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000169f9", PARENT_OWNER="", PARENT_TABLE="NGUOICOQUYENTACGIA"
    CHILD_OWNER="", CHILD_TABLE="TACGIALIENLAC"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (SELECT * FROM deleted,NGUOICOQUYENTACGIA
      WHERE
        /* %JoinFKPK(deleted,NGUOICOQUYENTACGIA," = "," AND") */
        deleted.NHAKHOAHOC_ID = NGUOICOQUYENTACGIA.NHAKHOAHOC_ID AND
        NOT EXISTS (
          SELECT * FROM TACGIALIENLAC
          WHERE
            /* %JoinFKPK(TACGIALIENLAC,NGUOICOQUYENTACGIA," = "," AND") */
            TACGIALIENLAC.NHAKHOAHOC_ID = NGUOICOQUYENTACGIA.NHAKHOAHOC_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last TACGIALIENLAC because NGUOICOQUYENTACGIA exists.'
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
  /* NGUOICOQUYENTACGIA  TACGIALIENLAC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00017a0f", PARENT_OWNER="", PARENT_TABLE="NGUOICOQUYENTACGIA"
    CHILD_OWNER="", CHILD_TABLE="TACGIALIENLAC"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="NHAKHOAHOC_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,NGUOICOQUYENTACGIA
        WHERE
          /* %JoinFKPK(inserted,NGUOICOQUYENTACGIA) */
          inserted.NHAKHOAHOC_ID = NGUOICOQUYENTACGIA.NHAKHOAHOC_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update TACGIALIENLAC because NGUOICOQUYENTACGIA does not exist.'
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
    /* THUCHIENPHANBIEN  BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0004b633", PARENT_OWNER="", PARENT_TABLE="THUCHIENPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1022", FK_COLUMNS="NHAKHOAHOC_ID""BAIPHANBIEN_ID""ID_BAIBAO" */
    IF EXISTS (
      SELECT * FROM deleted,BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN
      WHERE
        /*  %JoinFKPK(BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN,deleted," = "," AND") */
        BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN.BAIPHANBIEN_ID = deleted.BAIPHANBIEN_ID AND
        BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN.ID_BAIBAO = deleted.ID_BAIBAO AND
        BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete THUCHIENPHANBIEN because BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN exists.'
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
    /* NGUOICOQUYENPHANBIEN  THUCHIENPHANBIEN on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NGUOICOQUYENPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="THUCHIENPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1002", FK_COLUMNS="NHAKHOAHOC_ID" */
    IF EXISTS (SELECT * FROM deleted,NGUOICOQUYENPHANBIEN
      WHERE
        /* %JoinFKPK(deleted,NGUOICOQUYENPHANBIEN," = "," AND") */
        deleted.NHAKHOAHOC_ID = NGUOICOQUYENPHANBIEN.NHAKHOAHOC_ID AND
        NOT EXISTS (
          SELECT * FROM THUCHIENPHANBIEN
          WHERE
            /* %JoinFKPK(THUCHIENPHANBIEN,NGUOICOQUYENPHANBIEN," = "," AND") */
            THUCHIENPHANBIEN.NHAKHOAHOC_ID = NGUOICOQUYENPHANBIEN.NHAKHOAHOC_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last THUCHIENPHANBIEN because NGUOICOQUYENPHANBIEN exists.'
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
  /* THUCHIENPHANBIEN  BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0004ee44", PARENT_OWNER="", PARENT_TABLE="THUCHIENPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1022", FK_COLUMNS="NHAKHOAHOC_ID""BAIPHANBIEN_ID""ID_BAIBAO" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(BAIPHANBIEN_ID) OR
    UPDATE(ID_BAIBAO) OR
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN
      WHERE
        /*  %JoinFKPK(BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN,deleted," = "," AND") */
        BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN.BAIPHANBIEN_ID = deleted.BAIPHANBIEN_ID AND
        BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN.ID_BAIBAO = deleted.ID_BAIBAO AND
        BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN.NHAKHOAHOC_ID = deleted.NHAKHOAHOC_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update THUCHIENPHANBIEN because BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN exists.'
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
  /* NGUOICOQUYENPHANBIEN  THUCHIENPHANBIEN on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NGUOICOQUYENPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="THUCHIENPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1002", FK_COLUMNS="NHAKHOAHOC_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(NHAKHOAHOC_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,NGUOICOQUYENPHANBIEN
        WHERE
          /* %JoinFKPK(inserted,NGUOICOQUYENPHANBIEN) */
          inserted.NHAKHOAHOC_ID = NGUOICOQUYENPHANBIEN.NHAKHOAHOC_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update THUCHIENPHANBIEN because NGUOICOQUYENPHANBIEN does not exist.'
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




CREATE TRIGGER tD_TIEUCHIPHANBIEN ON TIEUCHIPHANBIEN FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on TIEUCHIPHANBIEN */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* TIEUCHIPHANBIEN  BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000156e0", PARENT_OWNER="", PARENT_TABLE="TIEUCHIPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1024", FK_COLUMNS="TENTIEUCHI" */
    IF EXISTS (
      SELECT * FROM deleted,BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN
      WHERE
        /*  %JoinFKPK(BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN,deleted," = "," AND") */
        BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN.TENTIEUCHI = deleted.TENTIEUCHI
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete TIEUCHIPHANBIEN because BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror (@errmsg, @errno, 1)
    rollback transaction
END

go


CREATE TRIGGER tU_TIEUCHIPHANBIEN ON TIEUCHIPHANBIEN FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on TIEUCHIPHANBIEN */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insTENTIEUCHI nvarchar(100),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* TIEUCHIPHANBIEN  BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0001676b", PARENT_OWNER="", PARENT_TABLE="TIEUCHIPHANBIEN"
    CHILD_OWNER="", CHILD_TABLE="BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1024", FK_COLUMNS="TENTIEUCHI" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(TENTIEUCHI)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN
      WHERE
        /*  %JoinFKPK(BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN,deleted," = "," AND") */
        BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN.TENTIEUCHI = deleted.TENTIEUCHI
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update TIEUCHIPHANBIEN because BAIPHANBIEN_NGUOICOQUYENPHANBIEN_TIEUCHIPHANBIEN exists.'
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


