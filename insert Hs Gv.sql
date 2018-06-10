use [Quan ly Hs Gv]

insert dbo.Lop(
Lop_ID,Lop_ten) values ('001','Lop chuyen toan')
insert dbo.Lop(
Lop_ID,Lop_ten) values ('002','Lop chuyen van')
insert dbo.Lop(
Lop_ID,Lop_ten) values ('003','Lop chuyen anh')
insert dbo.Lop(
Lop_ID,Lop_ten) values ('004','Lop chuyen ly')
insert dbo.Lop(
Lop_ID,Lop_ten) values ('005','Lop chuyen hoa')

insert dbo.HocSinh(
HS_ID,HS_ten,Lop_ID) values ('0001','Nguyen Hai Duong','001')
insert dbo.HocSinh(
HS_ID,HS_ten,Lop_ID) values ('0002','Phan Hoang Hai','002')
insert dbo.HocSinh(
HS_ID,HS_ten,Lop_ID) values ('0003','Nguyen Tri Trung','003')
insert dbo.HocSinh(
HS_ID,HS_ten,Lop_ID) values ('0004','Tran Hai Nam','004')
insert dbo.HocSinh(
HS_ID,HS_ten,Lop_ID) values ('0005','Nguyen Hai Phuong','005')

insert dbo.GiaoVien(
GV_ID,GV_ten,GV_ngaysinh) values ('gv001','Ha Dai Duong','8-8-1987')
insert dbo.GiaoVien(
GV_ID,GV_ten,GV_ngaysinh) values ('gv002','Nguyen Van Phuong','8-8-1987')
insert dbo.GiaoVien(
GV_ID,GV_ten,GV_ngaysinh) values ('gv003','Bui Thu Ha','8-8-1987')
insert dbo.GiaoVien(
GV_ID,GV_ten,GV_ngaysinh) values ('gv004','Le Thuy Duong','8-8-1987')
insert dbo.GiaoVien(
GV_ID,GV_ten,GV_ngaysinh) values ('gv005','Bui Thu Huong','8-8-1987')

insert dbo.TTGiangDay(
GV_ID,Lop_ID) values ('gv001','001')
insert dbo.TTGiangDay(
GV_ID,Lop_ID) values ('gv002','002')
insert dbo.TTGiangDay(
GV_ID,Lop_ID) values ('gv002','003')
insert dbo.TTGiangDay(
GV_ID,Lop_ID) values ('gv001','005')
insert dbo.TTGiangDay(
GV_ID,Lop_ID) values ('gv004','005')



--xoa toan bo du lieu trong database
EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL' 
GO 

EXEC sp_MSForEachTable 'DELETE FROM ?' 
GO 

-- enable referential integrity again 
EXEC sp_MSForEachTable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL' 
GO
