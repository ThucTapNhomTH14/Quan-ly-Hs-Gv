use [Quan ly Hs Gv]
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

drop proc if exists ThemHocSinh
go
create proc ThemHocSinh(@ten nvarchar(40),@birth date,@lop nvarchar(20))
as
begin
declare @idlop nvarchar(20) = (select Lop_ID from Lop where @lop = Lop_ten)
declare @ID varchar(10) = 'hs0001'
declare @i int = 1
while exists (select HS_ID from HocSinh where HS_ID=@ID)
begin
select @i = @i +1
select @ID = 
case 
when @i < 10 then 'hs000'+ convert(varchar(10),@i)
when @i >= 10 and @i <100 then 'hs00'+ convert(varchar(10),@i)
when @i >= 100 and @i <1000 then 'hs0'+ convert(varchar(10),@i)
when @i >= 1000 and @i <10000 then 'hs'+ convert(varchar(10),@i)
end
end
insert into HocSinh(HS_ID,HS_ten,ngaysinh,Lop_ID)
values (@ID,@ten,@birth,@idlop)
end
