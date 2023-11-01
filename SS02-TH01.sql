-- TH01
-- Bước 01
CREATE SCHEMA `QUAN_LY_DON_DAT_HANG`;
USE `QUAN_LY_DON_DAT_HANG`;
CREATE TABLE `DAT_HANG`(
so_dh INT PRIMARY KEY NOT NULL,
ten_dv_dh VARCHAR(45) NOT NULL,
dia_chi TEXT,
dien_thoai VARCHAR(11) NOT NULL,
ngay_dat DATETIME NOT NULL,
ten_hang VARCHAR(45) NOT NULL,
mo_ta_hang TEXT,
don_vi_tinh VARCHAR(6),
so_luong INT,
nguoi_dh VARCHAR(45)
);
ALTER TABLE QUAN_LY_DON_DAT_HANG.DAT_HANG
MODIFY so_dh INT AUTO_INCREMENT;

CREATE TABLE `GIAO_HANG`(
so_phieu_giao_hang INT PRIMARY KEY NOT NULL,
ten_dv_dh VARCHAR(45) NOT NULL,
dia_chi TEXT,
dia_chi_gh TEXT,
ngay_gh DATETIME,
ten_hang VARCHAR(45) NOT NULL,
don_vi_tinh VARCHAR(6),
so_luong INT,
don_gia FLOAT,
thanh_tien FLOAT,
ten_ng VARCHAR(45) NOT NULL,
ten_nn VARCHAR(45) NOT NULL
);

-- Bước 02
CREATE TABLE DONVI_DH(
ma_dv INT PRIMARY KEY NOT NULL,
ten_dv VARCHAR(45),
dia_chi VARCHAR(100),
dien_thoai VARCHAR(11)
);
CREATE TABLE DONVI_KH(
ma_dv INT,
ten_dv VARCHAR(45),
diachi VARCHAR(100)
);
CREATE TABLE HANG(
ma_hang INT PRIMARY KEY NOT NULL,
ten_hang VARCHAR(45),
don_vi_tinh VARCHAR(6),
mo_ta_hang TEXT
);
CREATE TABLE NGUOI_DAT(
ma_nd INT,
ten_nd VARCHAR(45)
);
CREATE TABLE NOI_GIAO (
ma_ng INT,
ten_ng VARCHAR(45)
);
CREATE TABLE NGUOI_NHAN (
ma_nn INT,
ten_nn VARCHAR(45)
);

-- TODO: Thêm mối quan hệ vào các thực thể tương ứng và vẽ ERD
