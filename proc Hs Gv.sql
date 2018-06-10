use [Quan ly Hs Gv]
go

drop proc if exists ThemGiaoVien
go
create proc ThemGiaoVien(@ID varchar(20),@ten nvarchar(20),@birth date)
as
begin
insert into GiaoVien(GV_ID,GV_ten,GV_ngaysinh)
values (@ID,@ten,@birth)
end

go

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



drop proc if exists ThemSinhVien
go
create proc ThemSinhVien(@ID varchar(20),@ten nvarchar(20),@lop varchar(20),@birth date=null)
as
if exists (select Lop_ID from Lop where @lop = Lop_ID) 
begin
insert into HocSinh(HS_ID,HS_ten,Lop_ID,ngaysinh)
values (@ID,@ten,@lop,@birth)
end
else begin
print N'error, no class is founded';
end


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




use [Quan ly Hs Gv]
select * from HocSinh


exec SuaHocSinh '0006','Pham Hong Son','006'
exec ThemSinhVien '0006','Pham Hoang Son','005'