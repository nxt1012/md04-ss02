drop database if exists QuanLyBanHang;
create database QuanLyBanHang;
use QuanLyBanHang;
create table Customer (
cID int primary key auto_increment,
cName varchar(50),
cAge int
);
-- có thể có nhiều hóa đơn cho mỗi khách - mqh n-1
create table `Order` (
oID int primary key auto_increment,
cId int,
oDate date,
oTotalPrice float,
foreign key (cID) references Customer(cID)
);

create table OrderDetail (
oID int,
pID int,
odQTY int
);
create table Product (
pID int primary key auto_increment,
pName varchar(50),
pPrice float);
-- mỗi hóa đơn có thể có nhiều mặt hàng => mqh Order - OrderDetail là mqh 1-n
alter table OrderDetail
add constraint fk_order_id foreign key (oID) references `Order`(oID);
-- mỗi mặt hàng trong hóa đơn có thể được mua với số lượng nhiều hơn 1 => mqh Product - OrderDetail là 1-n
alter table OrderDetail
add constraint fk_product_id foreign key (pID) references Product(pID);

alter table OrderDetail
add constraint pk_product_id foreign key (pID) references Product(pID);
