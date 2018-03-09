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
GV_ID,GV_ten) values ('01','Ha Dai Duong')
insert dbo.GiaoVien(
GV_ID,GV_ten) values ('02','Nguyen Van Phuong')
insert dbo.GiaoVien(
GV_ID,GV_ten) values ('03','Bui Thu Ha')
insert dbo.GiaoVien(
GV_ID,GV_ten) values ('04','Le Thuy Duong')
insert dbo.GiaoVien(
GV_ID,GV_ten) values ('05','Bui Thu Huong')

insert dbo.TTGiangDay(
GV_ID,Lop_ID) values ('01','001')
insert dbo.TTGiangDay(
GV_ID,Lop_ID) values ('02','002')
insert dbo.TTGiangDay(
GV_ID,Lop_ID) values ('02','003')
insert dbo.TTGiangDay(
GV_ID,Lop_ID) values ('01','005')
insert dbo.TTGiangDay(
GV_ID,Lop_ID) values ('04','005')