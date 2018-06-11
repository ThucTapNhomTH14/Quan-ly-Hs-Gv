use [Quan ly Hs Gv]
go

create view GV as
select GV_ID as N'Mã giáo viên',GV_ten as N'Tên giáo viên', FORMAT(GV_ngaysinh,'dd/MM/yyyy') as N'Ngày sinh' from GiaoVien