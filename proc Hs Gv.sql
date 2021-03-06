﻿﻿use [Quan ly Hs Gv]
go

drop proc if exists ThemGiaoVien
go
create proc ThemGiaoVien(@ten nvarchar(40),@birth date)
as
begin
declare @ID varchar(10) = 'gv001'
declare @i int = 1
while exists (select GV_ID from GiaoVien where GV_ID=@ID)
begin
select @i = @i +1
select @ID = 
case 
when @i < 10 then 'gv00'+ convert(varchar(10),@i)
when @i >= 10 and @i <100 then 'gv0'+ convert(varchar(10),@i)
when @i >= 100 and @i <1000 then 'gv'+ convert(varchar(10),@i)
end
end
insert into GiaoVien(GV_ID,GV_ten,GV_ngaysinh)
values (@ID,@ten,@birth)
end

go
--exec ThemGiaoVien 'a', '1912-10-25'
--select * from GiaoVien
--go

drop proc if exists SuaGiaoVien
go
create proc SuaGiaoVien(@ID varchar(20),@ten nvarchar(20),@birth date)
as
begin
update GiaoVien set GV_ten=@ten,GV_ngaysinh=@birth where @ID=GV_ID
end

go

drop proc if exists XoaGiaoVien
go
create proc XoaGiaoVien(@ID varchar(20)=null,@ten nvarchar(20)=null,@birth date=null)
as
begin
delete from GiaoVien where @ID=GV_ID
end

go

drop proc if exists TimGiaoVien
go
create proc TimGiaoVien(@ID varchar(20)=null,@ten nvarchar(20)=null,@birth date=null)
as
begin
select * from GiaoVien
where @ID=GV_ID or @ten=GV_ten or @birth=GV_ngaysinh or 
(@ID=GV_ID and @ten=GV_ten) or
(@ID=GV_ID and @ten=GV_ten and @birth=GV_ngaysinh)
end

go

--drop proc if exists TimLop
--go
--create proc TimLop(@ID varchar(20)=null,@ten nvarchar(20)=null)
--as
--begin
--select * from Lop
--where @ID=Lop_ID or
--@ten= Lop_ten or
--(@ID=Lop_ID and @ten=Lop_ten)
--end



drop proc if exists ThemHocSinh
go
create proc ThemHocSinh(@ten nvarchar(40),@birth date,@lop nvarchar(20))
as
begin
declare @idlop nvarchar(20) = (select Lop_ID from Lop where @lop = Lop_ten)
declare @ID varchar(10) = 'gv001'
declare @i int = 1
while exists (select HS_ID from HocSinh where HS_ID=@ID)
begin
select @i = @i +1
select @ID = 
case 
when @i < 10 then 'hs00'+ convert(varchar(10),@i)
when @i >= 10 and @i <100 then 'hs0'+ convert(varchar(10),@i)
when @i >= 100 and @i <1000 then 'hs'+ convert(varchar(10),@i)
end
end
insert into HocSinh(HS_ID,HS_ten,ngaysinh,Lop_ID)
values (@ID,@ten,@birth,@idlop)
end

go
drop proc if exists SuaHocSinh
go
create proc SuaHocSinh(@ID varchar(20),@ten nvarchar(20),@lop varchar(20),@birth date=null)
as
if exists (select Lop_ID from Lop where @lop = Lop_ID)
begin
update HocSinh set HS_ten=@ten, Lop_ID=@lop, ngaysinh=@birth where HS_ID=@ID 
end
else begin
update HocSinh set HS_ten=@ten, ngaysinh=@birth where HS_ID=@ID
print N'no class is founded'
end

go

drop proc if exists XoaHocSinh
go
create proc XoaHocSinh(@ID varchar(20),@ten nvarchar(20)=null,@lop varchar(20)=null,@birth date=null)
as begin
delete from HocSinh where HS_ID=@ID
end

go


drop proc if exists TimHocSinh
go
create proc TimHocSinh(@ID varchar(20)=null,@ten nvarchar(20)=null,@lop varchar(20)=null,@birth date=null)
as begin
select * from HocSinh
where @ID=HS_ID or @ten=HS_ten or @lop=Lop_ID or @birth=ngaysinh or
(@ID=HS_ID and @ten=HS_ten) or
(@ID=HS_ID and @ten=HS_ten and @birth=ngaysinh)
end

go


drop proc if exists getHocSinh
go
create proc getHocSinh
as
begin
select HocSinh.HS_ID as N'Mã học sinh', HocSinh.HS_ten as N'Tên học sinh', HocSinh.ngaysinh as N'Ngày sinh', Lop.Lop_ten as N'Lớp'
from HocSinh
inner join Lop on Lop.Lop_ID = HocSinh.Lop_ID
end


--use [Quan ly Hs Gv]
--select * from GiaoVien

--exec getHocSinh
--exec SuaHocSinh '0006','Pham Hong Son','006'
--exec ThemSinhVien '0006','Pham Hoang Son','005'