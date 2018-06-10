use [Quan ly Hs Gv]
go
drop view if exists GV
go
create view GV as
select GiaoVien.GV_ID as N'Mã giáo viên', GiaoVien.GV_ten as N'Tên giáo viên', FORMAT(GiaoVien.GV_ngaysinh,'dd/MM/yyyy') as N'Ngày sinh', Lop.Lop_ten as N'Lớp'
from GiaoVien
inner join TTGiangDay on TTGiangDay.GV_ID = GiaoVien.GV_ID
inner join Lop on TTGiangDay.Lop_ID = Lop.Lop_ID
