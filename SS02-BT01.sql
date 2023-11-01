drop database if exists quan_ly_vat_tu;
create database quan_ly_vat_tu;
use quan_ly_vat_tu;
create table PHIEUXUAT(
SoPX int primary key auto_increment,
NgayXuat date
);
create table VATTU(
MaVTU int primary key auto_increment,
TenVTU varchar(50)
);
-- biểu diễn <2> chi tiết phiếu xuất - mqh n-n
create table chi_tiet_phieu_xuat(
SoPX int,
MaVTU int,
DGXuat float,
SLXuat int,
foreign key (SoPX) references PHIEUXUAT(SoPX),
foreign key (MaVTU) references VATTU(MaVTU)
);
create table PHIEUNHAP(
SoPN int primary key auto_increment,
NgayNhap date
);
-- biểu diễn <3> chi tiết phiếu nhập - mqh n-n
create table chi_tiet_phieu_nhap(
SoPN int,
MaVTU int,
DGNhap float,
SLNhap int,
foreign key (SoPN) references PHIEUNHAP(SoPN),
foreign key (MaVTU) references VATTU(MaVTU)
);
create table DONDH(
SoDH int primary key auto_increment,
NgayDH date,
MaNCC int
);
-- biểu diễn <4> chi tiết đơn đặt hàng - mqh 1-n
create table chi_tiet_don_dat_hang (
MaVTU int,
SoDH int,
foreign key (MaVTU) references VATTU(MaVTU),
foreign key (SoDH) references DONDH(SoDH)
);
create table NHACC(
MaNCC int primary key auto_increment,
TenNCC varchar(50),
DiaChi varchar(100)
);
alter table DONDH
add constraint fk_ma_ncc foreign key (MaNCC) references NHACC(MaNCC);
-- tách thuộc tính đa trị và tạo thành một bảng mới - mqh 1-n
create table so_dien_thoai_nha_cung_cap (
id int primary key,
MaNCC int,
foreign key (MaCC) references NHACC(MaNCC),
phone varchar(11)
);