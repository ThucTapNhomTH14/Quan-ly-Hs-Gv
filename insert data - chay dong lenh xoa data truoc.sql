use [Quan ly Hs Gv]
INSERT [dbo].[GiaoVien] ([GV_ID], [GV_ten], [GV_ngaysinh]) VALUES (N'gv001', N'Ha Dai Duong', CAST(N'2018-06-10' AS Date))
INSERT [dbo].[GiaoVien] ([GV_ID], [GV_ten], [GV_ngaysinh]) VALUES (N'gv002', N'Nguyen Van Phuong', CAST(N'1974-07-28' AS Date))
INSERT [dbo].[GiaoVien] ([GV_ID], [GV_ten], [GV_ngaysinh]) VALUES (N'gv003', N'Bui Thu Ha', CAST(N'1967-12-01' AS Date))
INSERT [dbo].[GiaoVien] ([GV_ID], [GV_ten], [GV_ngaysinh]) VALUES (N'gv004', N'Le Thuy Duong', CAST(N'1981-10-10' AS Date))
INSERT [dbo].[GiaoVien] ([GV_ID], [GV_ten], [GV_ngaysinh]) VALUES (N'gv005', N'Bui Thu Huong', CAST(N'1990-09-23' AS Date))
INSERT [dbo].[HocSinh] ([HS_ID], [HS_ten], [ngaysinh], [Lop_ID]) VALUES (N'hs0001', N'Đặng Đức Trung', CAST(N'1997-04-05' AS Date), N'1')
INSERT [dbo].[HocSinh] ([HS_ID], [HS_ten], [ngaysinh], [Lop_ID]) VALUES (N'hs0002', N'Phạm Hồng Sơn', CAST(N'1997-01-04' AS Date), N'2')
INSERT [dbo].[HocSinh] ([HS_ID], [HS_ten], [ngaysinh], [Lop_ID]) VALUES (N'hs0003', N'Nguyễn Tiến Chung', CAST(N'1997-08-19' AS Date), N'3')
INSERT [dbo].[HocSinh] ([HS_ID], [HS_ten], [ngaysinh], [Lop_ID]) VALUES (N'hs0004', N'Nguyễn Trọng Dương', CAST(N'1997-03-14' AS Date), N'1')
INSERT [dbo].[HocSinh] ([HS_ID], [HS_ten], [ngaysinh], [Lop_ID]) VALUES (N'hs0005', N'Cao Tiến Trường', CAST(N'1997-07-23' AS Date), N'2')
INSERT [dbo].[HocSinh] ([HS_ID], [HS_ten], [ngaysinh], [Lop_ID]) VALUES (N'hs0006', N'test', CAST(N'1900-01-01' AS Date), N'5')
INSERT [dbo].[HocSinh] ([HS_ID], [HS_ten], [ngaysinh], [Lop_ID]) VALUES (N'hs0007', N'test', CAST(N'1900-01-01' AS Date), N'2')
SET IDENTITY_INSERT [dbo].[Lop] OFF
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


INSERT [dbo].[TTGiangDay] ([Lop_ID], [GV_ID]) VALUES (1, N'gv001')
INSERT [dbo].[TTGiangDay] ([Lop_ID], [GV_ID]) VALUES (2, N'gv002')
INSERT [dbo].[TTGiangDay] ([Lop_ID], [GV_ID]) VALUES (3, N'gv003')
INSERT [dbo].[TTGiangDay] ([Lop_ID], [GV_ID]) VALUES (4, N'gv004')

--xoa toan bo du lieu trong database
--EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL' 
--GO 

--EXEC sp_MSForEachTable 'DELETE FROM ?' 
--GO 

---- enable referential integrity again 
--EXEC sp_MSForEachTable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL' 
--GO

--select * from HS