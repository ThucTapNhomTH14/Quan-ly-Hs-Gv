USE master;
GO
ALTER DATABASE [Quan ly Hs Gv] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
drop database if exists [Quan ly Hs Gv]
--dung doan code tren de drop database in use
create database [Quan ly Hs Gv]
go
use [Quan ly Hs Gv]
go

drop table if exists Lop
create table Lop (
Lop_ID varchar(20) not null primary key,
Lop_ten nvarchar(20),
)
drop table if exists HocSinh
create table HocSinh (
HS_ID varchar(20) not null primary key,
HS_ten nvarchar(40),
Lop_ID varchar(20) not null foreign key references Lop(Lop_ID)
)

drop table if exists GiaoVien
create table GiaoVien (
GV_ID varchar(20) not null primary key,
GV_ten nvarchar (40),
)

drop table if exists TTGiangDay
create table TTGiangDay (
Lop_ID varchar(20) not null foreign key references Lop(Lop_ID),
GV_ID varchar(20) not null foreign key references GiaoVien(GV_ID),
)