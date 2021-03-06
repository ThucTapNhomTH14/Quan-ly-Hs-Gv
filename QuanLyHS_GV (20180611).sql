USE [master]
GO
/****** Object:  Database [Quan ly Hs Gv]    Script Date: 6/10/2018 11:37:24 PM ******/
CREATE DATABASE [Quan ly Hs Gv]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Quan ly Hs Gv', FILENAME = N'E:\SQLServerMS\MSSQL13.SQLEXPRESS\MSSQL\DATA\Quan ly Hs Gv.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Quan ly Hs Gv_log', FILENAME = N'E:\SQLServerMS\MSSQL13.SQLEXPRESS\MSSQL\DATA\Quan ly Hs Gv_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Quan ly Hs Gv] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Quan ly Hs Gv].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Quan ly Hs Gv] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Quan ly Hs Gv] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Quan ly Hs Gv] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Quan ly Hs Gv] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Quan ly Hs Gv] SET ARITHABORT OFF 
GO
ALTER DATABASE [Quan ly Hs Gv] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Quan ly Hs Gv] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Quan ly Hs Gv] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Quan ly Hs Gv] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Quan ly Hs Gv] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Quan ly Hs Gv] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Quan ly Hs Gv] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Quan ly Hs Gv] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Quan ly Hs Gv] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Quan ly Hs Gv] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Quan ly Hs Gv] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Quan ly Hs Gv] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Quan ly Hs Gv] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Quan ly Hs Gv] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Quan ly Hs Gv] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Quan ly Hs Gv] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Quan ly Hs Gv] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Quan ly Hs Gv] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Quan ly Hs Gv] SET  MULTI_USER 
GO
ALTER DATABASE [Quan ly Hs Gv] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Quan ly Hs Gv] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Quan ly Hs Gv] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Quan ly Hs Gv] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Quan ly Hs Gv] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Quan ly Hs Gv] SET QUERY_STORE = OFF
GO
USE [Quan ly Hs Gv]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Quan ly Hs Gv]
GO
/****** Object:  Table [dbo].[HocSinh]    Script Date: 6/10/2018 11:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocSinh](
	[HS_ID] [varchar](20) NOT NULL,
	[HS_ten] [nvarchar](40) NULL,
	[ngaysinh] [date] NULL,
	[Lop_ID] [varchar](20) NULL,
 CONSTRAINT [PK__HocSinh__76CFDB54DBDEF3B1] PRIMARY KEY CLUSTERED 
(
	[HS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lop]    Script Date: 6/10/2018 11:37:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lop](
	[Lop_ID] [int] IDENTITY(1,1) NOT NULL,
	[Lop_ten] [nvarchar](20) NULL,
	[khoa_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Lop_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 6/10/2018 11:37:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[khoa_ID] [int] IDENTITY(1,1) NOT NULL,
	[nam_bd] [int] NULL,
	[nam_kt] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[khoa_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[HS]    Script Date: 6/10/2018 11:37:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[HS] as
select A.HS_ID as 'Mã học sinh', A.HS_ten as 'Tên học sinh',convert(varchar(10),A.ngaysinh,103) as 'Ngày sinh', B.Lop_ten as 'Lớp' , convert(varchar(10),C.nam_bd)+' - '+convert(varchar(10),C.nam_kt) as 'Năm học' from HocSinh as A
inner join Lop as B on A.Lop_ID = B.Lop_ID
inner join Khoa as C on C.khoa_ID = B.khoa_ID
GO
/****** Object:  Table [dbo].[GiaoVien]    Script Date: 6/10/2018 11:37:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoVien](
	[GV_ID] [varchar](20) NOT NULL,
	[GV_ten] [nvarchar](40) NULL,
	[GV_ngaysinh] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[GV_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[GV]    Script Date: 6/10/2018 11:37:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[GV] as
select GV_ID as N'Mã giáo viên',GV_ten as N'Tên giáo viên', FORMAT(GV_ngaysinh,'dd/MM/yyyy') as N'Ngày sinh' from GiaoVien
GO
/****** Object:  Table [dbo].[TTGiangDay]    Script Date: 6/10/2018 11:37:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TTGiangDay](
	[Lop_ID] [int] NOT NULL,
	[GV_ID] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[GiaoVien] ([GV_ID], [GV_ten], [GV_ngaysinh]) VALUES (N'01', N'Ha Dai Duong', CAST(N'2018-06-10' AS Date))
INSERT [dbo].[GiaoVien] ([GV_ID], [GV_ten], [GV_ngaysinh]) VALUES (N'02', N'Nguyen Van Phuong', CAST(N'1974-07-28' AS Date))
INSERT [dbo].[GiaoVien] ([GV_ID], [GV_ten], [GV_ngaysinh]) VALUES (N'03', N'Bui Thu Ha', CAST(N'1967-12-01' AS Date))
INSERT [dbo].[GiaoVien] ([GV_ID], [GV_ten], [GV_ngaysinh]) VALUES (N'04', N'Le Thuy Duong', CAST(N'1981-10-10' AS Date))
INSERT [dbo].[GiaoVien] ([GV_ID], [GV_ten], [GV_ngaysinh]) VALUES (N'05', N'Bui Thu Huong', CAST(N'1990-09-23' AS Date))
INSERT [dbo].[HocSinh] ([HS_ID], [HS_ten], [ngaysinh], [Lop_ID]) VALUES (N'00001', N'Đặng Đức Trung', CAST(N'1997-04-05' AS Date), N'1')
INSERT [dbo].[HocSinh] ([HS_ID], [HS_ten], [ngaysinh], [Lop_ID]) VALUES (N'00002', N'Phạm Hồng Sơn', CAST(N'1997-01-04' AS Date), N'2')
INSERT [dbo].[HocSinh] ([HS_ID], [HS_ten], [ngaysinh], [Lop_ID]) VALUES (N'00003', N'Nguyễn Tiến Chung', CAST(N'1997-08-19' AS Date), N'3')
INSERT [dbo].[HocSinh] ([HS_ID], [HS_ten], [ngaysinh], [Lop_ID]) VALUES (N'00004', N'Nguyễn Trọng Dương', CAST(N'1997-03-14' AS Date), N'1')
INSERT [dbo].[HocSinh] ([HS_ID], [HS_ten], [ngaysinh], [Lop_ID]) VALUES (N'00005', N'Cao Tiến Trường', CAST(N'1997-07-23' AS Date), N'2')
INSERT [dbo].[HocSinh] ([HS_ID], [HS_ten], [ngaysinh], [Lop_ID]) VALUES (N'HS0006', N'test', CAST(N'1900-01-01' AS Date), N'5')
INSERT [dbo].[HocSinh] ([HS_ID], [HS_ten], [ngaysinh], [Lop_ID]) VALUES (N'HS0007', N'test', CAST(N'1900-01-01' AS Date), N'2')
SET IDENTITY_INSERT [dbo].[Khoa] ON 

INSERT [dbo].[Khoa] ([khoa_ID], [nam_bd], [nam_kt]) VALUES (1, 2016, 2017)
INSERT [dbo].[Khoa] ([khoa_ID], [nam_bd], [nam_kt]) VALUES (2, 2017, 2018)
SET IDENTITY_INSERT [dbo].[Khoa] OFF
SET IDENTITY_INSERT [dbo].[Lop] ON 

INSERT [dbo].[Lop] ([Lop_ID], [Lop_ten], [khoa_ID]) VALUES (1, N'10A1', 1)
INSERT [dbo].[Lop] ([Lop_ID], [Lop_ten], [khoa_ID]) VALUES (2, N'10A2', 1)
INSERT [dbo].[Lop] ([Lop_ID], [Lop_ten], [khoa_ID]) VALUES (3, N'11A1', 1)
INSERT [dbo].[Lop] ([Lop_ID], [Lop_ten], [khoa_ID]) VALUES (4, N'11A2', 1)
INSERT [dbo].[Lop] ([Lop_ID], [Lop_ten], [khoa_ID]) VALUES (5, N'12A1', 1)
INSERT [dbo].[Lop] ([Lop_ID], [Lop_ten], [khoa_ID]) VALUES (6, N'12A2', 1)
SET IDENTITY_INSERT [dbo].[Lop] OFF
INSERT [dbo].[TTGiangDay] ([Lop_ID], [GV_ID]) VALUES (1, N'01')
INSERT [dbo].[TTGiangDay] ([Lop_ID], [GV_ID]) VALUES (2, N'02')
INSERT [dbo].[TTGiangDay] ([Lop_ID], [GV_ID]) VALUES (3, N'03')
INSERT [dbo].[TTGiangDay] ([Lop_ID], [GV_ID]) VALUES (4, N'04')
ALTER TABLE [dbo].[TTGiangDay]  WITH CHECK ADD  CONSTRAINT [FK_GiaoVien_TTGiangDay] FOREIGN KEY([GV_ID])
REFERENCES [dbo].[GiaoVien] ([GV_ID])
GO
ALTER TABLE [dbo].[TTGiangDay] CHECK CONSTRAINT [FK_GiaoVien_TTGiangDay]
GO
ALTER TABLE [dbo].[TTGiangDay]  WITH CHECK ADD  CONSTRAINT [FK_Lop_TTGiangDay] FOREIGN KEY([Lop_ID])
REFERENCES [dbo].[Lop] ([Lop_ID])
GO
ALTER TABLE [dbo].[TTGiangDay] CHECK CONSTRAINT [FK_Lop_TTGiangDay]
GO
/****** Object:  StoredProcedure [dbo].[HS_List]    Script Date: 6/10/2018 11:37:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[HS_List] (@khoa_ID int,@lop_ten nvarchar(20))
as
begin
select A.HS_ID as 'ID',A.HS_ten as N'Họ tên',A.ngaysinh as N'Ngày sinh' from HocSinh as A 
inner join Lop as B on B.Lop_ID = A.Lop_ID
where B.khoa_ID = @khoa_ID and B.Lop_ten = @lop_ten
end
GO
/****** Object:  StoredProcedure [dbo].[search_HS_List]    Script Date: 6/10/2018 11:37:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[search_HS_List](@search nvarchar(40),@khoa_ID int, @lop_ten nvarchar(20))
as
begin
select C.HS_ID,C.HS_ten,C.ngaysinh from
(select A.HS_ID,A.HS_ten,A.ngaysinh from HocSinh as A 
inner join Lop as B on B.Lop_ID = A.Lop_ID
where B.khoa_ID = @khoa_ID and B.Lop_ten = @lop_ten) as C
where C.HS_ID like '%'+@search+'%' or C.HS_ten like '%'+@search+'%' or C.ngaysinh like '%'+@search+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[SuaGiaoVien]    Script Date: 6/10/2018 11:37:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SuaGiaoVien](@ID varchar(20),@ten nvarchar(40),@birth date)
as
begin
update GiaoVien set GV_ten=@ten,GV_ngaysinh=@birth where @ID=GV_ID
end
GO
/****** Object:  StoredProcedure [dbo].[SuaHocSinh]    Script Date: 6/10/2018 11:37:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SuaHocSinh](@id varchar(10),@ten nvarchar(40),@birth date ,@tenlop varchar(20))
as
begin
declare @class_ID int = (select A.Lop_ID from Lop as A where A.Lop_ten = @tenlop)
update HocSinh
set HS_ten = @ten, ngaysinh=@birth, Lop_ID=@class_ID
where HS_ID = @id
end
GO
/****** Object:  StoredProcedure [dbo].[ThemGiaoVien]    Script Date: 6/10/2018 11:37:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ThemGiaoVien](@ID varchar(20),@ten nvarchar(40),@birth date)
as
begin
insert into GiaoVien(GV_ID,GV_ten,GV_ngaysinh)
values (@ID,@ten,@birth)
end
GO
/****** Object:  StoredProcedure [dbo].[ThemSinhVien]    Script Date: 6/10/2018 11:37:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ThemSinhVien](@ten nvarchar(40),@birth date,@classname nvarchar(20))
as
begin
declare @class_ID int = (select A.Lop_ID from Lop as A where A.Lop_ten = @classname)
declare @row_num int = 1 + (select count(*) from HocSinh)
declare @id_tag varchar(10) = convert(varchar(10),@row_num)
while len(@id_tag)<4
begin
	set @id_tag = '0'+@id_tag
end
declare @id varchar(10)= 'HS'+ @id_tag
insert into HocSinh(HS_ID,HS_ten,ngaysinh,Lop_ID)
values(@id,@ten,@birth,@class_ID)
end

GO
/****** Object:  StoredProcedure [dbo].[TimGiaoVien]    Script Date: 6/10/2018 11:37:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[TimGiaoVien](@string varchar(40))
as
begin
select * from GV as A
where A.[Mã giáo viên] like N'%'+@string+N'%' or A.[Tên giáo viên] like N'%'+@string+N'%' or A.[Ngày sinh] like N'%'+@string+N'%'
end
GO
/****** Object:  StoredProcedure [dbo].[TimHocSinh]    Script Date: 6/10/2018 11:37:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[TimHocSinh](@string varchar(40))
as begin
select * from HS as A
where A.[Mã học sinh] like N'%'+@string+N'%' or A.[Tên học sinh] like N'%'+@string+N'%' or A.Lớp like N'%'+@string+N'%' or A.[Ngày sinh] like N'%'+@string+N'%' or A.[Năm học] like N'%'+@string+N'%'
end
GO
/****** Object:  StoredProcedure [dbo].[XoaGiaoVien]    Script Date: 6/10/2018 11:37:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[XoaGiaoVien](@ID varchar(20)=null,@ten nvarchar(40)=null,@birth date=null)
as
begin
delete from GiaoVien where @ID=GV_ID
end
GO
/****** Object:  StoredProcedure [dbo].[XoaHocSinh]    Script Date: 6/10/2018 11:37:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[XoaHocSinh](@ID varchar(20),@ten nvarchar(40)=null,@lop varchar(20)=null,@birth date=null)
as begin
delete from HocSinh where HS_ID=@ID
end
GO
USE [master]
GO
ALTER DATABASE [Quan ly Hs Gv] SET  READ_WRITE 
GO
