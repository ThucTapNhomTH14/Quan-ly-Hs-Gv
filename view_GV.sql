use [Quan ly Hs Gv]
go

create view GV as
select GV_ID as N'M� gi�o vi�n',GV_ten as N'T�n gi�o vi�n', FORMAT(GV_ngaysinh,'dd/MM/yyyy') as N'Ng�y sinh' from GiaoVien