USE [master]
GO
/****** Object:  Database [QLVT]    Script Date: 5/16/2022 2:17:17 PM ******/
CREATE DATABASE [QLVT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLVT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLVT.mdf' , SIZE = 37888KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLVT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLVT_log.ldf' , SIZE = 57664KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLVT] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLVT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLVT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLVT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLVT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLVT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLVT] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLVT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLVT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLVT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLVT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLVT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLVT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLVT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLVT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLVT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLVT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLVT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLVT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLVT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLVT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLVT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLVT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLVT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLVT] SET RECOVERY FULL 
GO
ALTER DATABASE [QLVT] SET  MULTI_USER 
GO
ALTER DATABASE [QLVT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLVT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLVT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLVT] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLVT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLVT', N'ON'
GO
USE [QLVT]
GO
/****** Object:  User [HTKN]    Script Date: 5/16/2022 2:17:17 PM ******/
CREATE USER [HTKN] FOR LOGIN [HTKN] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [MSmerge_PAL_role]    Script Date: 5/16/2022 2:17:17 PM ******/
CREATE ROLE [MSmerge_PAL_role]
GO
/****** Object:  DatabaseRole [MSmerge_E957F033835A4FF29BF67EB20EAB137D]    Script Date: 5/16/2022 2:17:17 PM ******/
CREATE ROLE [MSmerge_E957F033835A4FF29BF67EB20EAB137D]
GO
/****** Object:  DatabaseRole [MSmerge_DE43AD8ECF784E4DA42F925A25EBDABF]    Script Date: 5/16/2022 2:17:17 PM ******/
CREATE ROLE [MSmerge_DE43AD8ECF784E4DA42F925A25EBDABF]
GO
/****** Object:  DatabaseRole [MSmerge_B229952CBB9D4914877BCAE40ACABFB1]    Script Date: 5/16/2022 2:17:17 PM ******/
CREATE ROLE [MSmerge_B229952CBB9D4914877BCAE40ACABFB1]
GO
ALTER ROLE [db_owner] ADD MEMBER [HTKN]
GO
ALTER ROLE [MSmerge_PAL_role] ADD MEMBER [MSmerge_E957F033835A4FF29BF67EB20EAB137D]
GO
ALTER ROLE [MSmerge_PAL_role] ADD MEMBER [MSmerge_DE43AD8ECF784E4DA42F925A25EBDABF]
GO
ALTER ROLE [MSmerge_PAL_role] ADD MEMBER [MSmerge_B229952CBB9D4914877BCAE40ACABFB1]
GO
/****** Object:  Schema [MSmerge_PAL_role]    Script Date: 5/16/2022 2:17:17 PM ******/
CREATE SCHEMA [MSmerge_PAL_role]
GO
/****** Object:  Table [dbo].[ChiNhanh]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiNhanh](
	[MACN] [nchar](10) NOT NULL,
	[ChiNhanh] [nvarchar](100) NOT NULL,
	[DIACHI] [nvarchar](100) NOT NULL,
	[SoDT] [nvarchar](15) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_6B90B0E45F324116BB24B65B381AB24F]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_ChiNhanh] PRIMARY KEY CLUSTERED 
(
	[MACN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTDDH]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDDH](
	[MasoDDH] [nchar](8) NOT NULL,
	[MAVT] [nchar](4) NOT NULL,
	[SOLUONG] [int] NULL,
	[DONGIA] [float] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_C2DE95E1F38A4FEBB42F7D5FD28954C3]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_CTDDH] PRIMARY KEY CLUSTERED 
(
	[MasoDDH] ASC,
	[MAVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTPN]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPN](
	[MAPN] [nchar](8) NOT NULL,
	[MAVT] [nchar](4) NOT NULL,
	[SOLUONG] [int] NOT NULL,
	[DONGIA] [float] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_118D97542D204F488FB126C47D869454]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_CTPN] PRIMARY KEY CLUSTERED 
(
	[MAPN] ASC,
	[MAVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTPX]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPX](
	[MAPX] [nchar](8) NOT NULL,
	[MAVT] [nchar](4) NOT NULL,
	[SOLUONG] [int] NOT NULL,
	[DONGIA] [float] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_9D93A024BB0D4C3DA4969471FEBDA56E]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_CTPX] PRIMARY KEY CLUSTERED 
(
	[MAPX] ASC,
	[MAVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DatHang]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatHang](
	[MasoDDH] [nchar](8) NOT NULL CONSTRAINT [DF_DatHang_MasoDDH]  DEFAULT (getdate()),
	[NGAY] [date] NOT NULL CONSTRAINT [DF_DatHang_NGAY]  DEFAULT (getdate()),
	[NhaCC] [nvarchar](100) NOT NULL,
	[MAKHO] [nchar](4) NOT NULL,
	[MANV] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_2912BDF516644630964A70FED8D61BEA]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_DatHang] PRIMARY KEY CLUSTERED 
(
	[MasoDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kho]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kho](
	[MAKHO] [nchar](4) NOT NULL,
	[TENKHO] [nvarchar](30) NOT NULL,
	[DIACHI] [nvarchar](100) NULL,
	[MACN] [nchar](10) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_A4DE777028C04C9598EF23E2480C60A0]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_Kho] PRIMARY KEY CLUSTERED 
(
	[MAKHO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MANV] [int] NOT NULL,
	[HO] [nvarchar](40) NULL,
	[TEN] [nvarchar](10) NULL,
	[DIACHI] [nvarchar](100) NULL,
	[NGAYSINH] [datetime] NULL,
	[LUONG] [float] NULL,
	[MACN] [nchar](10) NULL,
	[TrangThaiXoa] [int] NULL CONSTRAINT [DF_NhanVien_TrangThaiXoa]  DEFAULT ((0)),
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_04A49F80B2244E46BE30A173B2562EFA]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MAPN] [nchar](8) NOT NULL CONSTRAINT [DF_PhieuNhap_MAPN]  DEFAULT (getdate()),
	[NGAY] [date] NOT NULL CONSTRAINT [DF_PhieuNhap_NGAY]  DEFAULT (getdate()),
	[MasoDDH] [nchar](8) NOT NULL,
	[MANV] [int] NOT NULL,
	[MAKHO] [nchar](4) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_E6BCB56833D641FFB2589A4FE4B44B28]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MAPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuXuat]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuXuat](
	[MAPX] [nchar](8) NOT NULL,
	[NGAY] [date] NOT NULL CONSTRAINT [DF_PX_NGAY]  DEFAULT (getdate()),
	[HOTENKH] [nvarchar](100) NOT NULL,
	[MAKHO] [nchar](4) NOT NULL,
	[MANV] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_E7058915B41440C1B47DED41953295C2]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_PX] PRIMARY KEY CLUSTERED 
(
	[MAPX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vattu]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vattu](
	[MAVT] [nchar](4) NOT NULL,
	[TENVT] [nvarchar](30) NOT NULL,
	[DVT] [nvarchar](15) NOT NULL,
	[SOLUONGTON] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_6CE66C4074B14D029013C5B999E75F2B]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_VatTu] PRIMARY KEY CLUSTERED 
(
	[MAVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  UserDefinedFunction [dbo].[F_MAVTDDH]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[F_MAVTDDH](@MasoDDH nchar(8), @MAPN nchar(8))
returns table
as
return
	select MAVT from Vattu
	where MAVT in
	(
		select MAVT from CTDDH
		where MasoDDH = @MasoDDH
	)
	and MAVT not in
	(
		select MAVT from CTPN
		where MAPN = @MAPN
	)
GO
/****** Object:  UserDefinedFunction [dbo].[F_MAVTKHO]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[F_MAVTKHO](@MAKHO nchar(4), @MAPX nchar(8))
returns table
as
return
	select * from Vattu
	where MAVT in 
	(
		select MAVT from CTPN
		where MAPN in
		(select MAPN from PhieuNhap
		where @MAKHO = MAKHO
		)
	)
	and MAVT not in
	(select MAVT from CTPX
	where @MAPX = MAPX)
GO
/****** Object:  View [dbo].[V_DanhSachDDH]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[V_DanhSachDDH]
as
select MasoDDH from DatHang
where MasoDDH not in 
(select MasoDDH from PhieuNhap)
GO
/****** Object:  View [dbo].[V_DS_PHANMANH]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_DS_PHANMANH]
AS
SELECT  TENCN=PUBS.description, TENSERVER= subscriber_server
   FROM dbo.sysmergepublications PUBS,  dbo.sysmergesubscriptions SUBS
   WHERE PUBS.pubid= SUBS.PUBID  AND PUBS.publisher <> SUBS.subscriber_server
GO
/****** Object:  View [dbo].[V_InDanhSachNhanVien]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[V_InDanhSachNhanVien]
as
	select top (99.99) PERCENT MANV, HO + ' '+ TEN as HOTEN, DIACHI, NGAYSINH, LUONG from NhanVien
	order by TEN, HO
GO
INSERT [dbo].[ChiNhanh] ([MACN], [ChiNhanh], [DIACHI], [SoDT], [rowguid]) VALUES (N'CN1       ', N'Chi nhánh 1 TP HCM', N'35 Trần Hưng Đạo P1 Q1', N'999111888', N'fd2835ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[ChiNhanh] ([MACN], [ChiNhanh], [DIACHI], [SoDT], [rowguid]) VALUES (N'CN2       ', N'Chi nhánh 2 TP Cần Thơ', N'27 Nguyễn Huệ', N'333222111', N'fe2835ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[CTDDH] ([MasoDDH], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'MDDH01  ', N'M01 ', 10, 400000, N'1b2935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[CTDDH] ([MasoDDH], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'MDDH01  ', N'MG01', 5, 100000, N'b598ae51-ddd2-ec11-8509-c0b883cbcb49')
INSERT [dbo].[CTDDH] ([MasoDDH], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'MDDH02  ', N'MU01', 6, 500000, N'1c2935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[CTDDH] ([MasoDDH], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'MDDH03  ', N'MX02', 20, 700000, N'1d2935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[CTDDH] ([MasoDDH], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'MDDH04  ', N'MG01', 20, 500000, N'f9c25685-42d0-ec11-8505-c0b883cbcb49')
INSERT [dbo].[CTPN] ([MAPN], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'PN01    ', N'M01 ', 10, 500, N'202935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[CTPN] ([MAPN], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'PN03    ', N'M01 ', 3, 4, N'8a0be896-69d3-ec11-8509-c0b883cbcb49')
INSERT [dbo].[CTPN] ([MAPN], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'PN03    ', N'MG01', 2, 50000, N'9e13f286-61d3-ec11-8509-c0b883cbcb49')
INSERT [dbo].[CTPX] ([MAPX], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'PX01    ', N'M01 ', 3, 4, N'8c100768-abd3-ec11-8509-c0b883cbcb49')
INSERT [dbo].[CTPX] ([MAPX], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'PX01    ', N'MG01', 4, 4, N'2b1bde35-b3d3-ec11-8509-c0b883cbcb49')
INSERT [dbo].[CTPX] ([MAPX], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'PX03    ', N'M01 ', 5, 7000, N'1f2935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[DatHang] ([MasoDDH], [NGAY], [NhaCC], [MAKHO], [MANV], [rowguid]) VALUES (N'MDDH01  ', CAST(N'2017-09-15' AS Date), N'CTY Điện máy xanh', N'K1N1', 1, N'132935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[DatHang] ([MasoDDH], [NGAY], [NhaCC], [MAKHO], [MANV], [rowguid]) VALUES (N'MDDH02  ', CAST(N'2017-09-15' AS Date), N'CTY Panasonic', N'K2N1', 1, N'142935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[DatHang] ([MasoDDH], [NGAY], [NhaCC], [MAKHO], [MANV], [rowguid]) VALUES (N'MDDH03  ', CAST(N'2017-09-15' AS Date), N'CTY Samsung', N'K1N2', 8, N'152935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[DatHang] ([MasoDDH], [NGAY], [NhaCC], [MAKHO], [MANV], [rowguid]) VALUES (N'MDDH04  ', CAST(N'2018-09-12' AS Date), N'CTY LG', N'K1N2', 5, N'251c255d-42d0-ec11-8505-c0b883cbcb49')
INSERT [dbo].[DatHang] ([MasoDDH], [NGAY], [NhaCC], [MAKHO], [MANV], [rowguid]) VALUES (N'MDDH05  ', CAST(N'2019-05-23' AS Date), N'CT LG', N'K1N1', 9, N'fce352ca-c0d2-ec11-8509-c0b883cbcb49')
INSERT [dbo].[DatHang] ([MasoDDH], [NGAY], [NhaCC], [MAKHO], [MANV], [rowguid]) VALUES (N'MDDH06  ', CAST(N'2020-04-16' AS Date), N'CT Điện máy xanh', N'K1N1', 10, N'6d959049-c1d2-ec11-8509-c0b883cbcb49')
INSERT [dbo].[Kho] ([MAKHO], [TENKHO], [DIACHI], [MACN], [rowguid]) VALUES (N'K1N1', N'KHO A', N'28-30 Ngô Quyền P1 Q5', N'CN1       ', N'052935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[Kho] ([MAKHO], [TENKHO], [DIACHI], [MACN], [rowguid]) VALUES (N'K1N2', N'LONG PHÚ', N'127 Ngô Thì Nhậm', N'CN2       ', N'0a2935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[Kho] ([MAKHO], [TENKHO], [DIACHI], [MACN], [rowguid]) VALUES (N'K2N1', N'KHO B', N'78 Nguyen Trai, TPHCM', N'CN1       ', N'062935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[Kho] ([MAKHO], [TENKHO], [DIACHI], [MACN], [rowguid]) VALUES (N'K2N2', N'KHO VT', N'23,Hoàng Diệu 2', N'CN2       ', N'082935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[Kho] ([MAKHO], [TENKHO], [DIACHI], [MACN], [rowguid]) VALUES (N'K3N1', N'CONG NGHIEP', N'555 Trần Hưng đạo', N'CN1       ', N'042935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[Kho] ([MAKHO], [TENKHO], [DIACHI], [MACN], [rowguid]) VALUES (N'K3N2', N'KHO XD', N'34,Quang Trung THủ Đức TPHCM', N'CN2       ', N'092935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[Kho] ([MAKHO], [TENKHO], [DIACHI], [MACN], [rowguid]) VALUES (N'K4N1', N'KHO C', N'97 Man Thiện', N'CN1       ', N'a2b6df41-bbd4-ec11-8509-c0b883cbcb49')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (1, N'Lương', N'Trang', N'Thủ Đức', CAST(N'2000-05-06 00:00:00.000' AS DateTime), 7000000, N'CN1       ', 0, N'0b2935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (2, N'Nguyễn', N'Hà', N'Quận 9', CAST(N'2001-03-05 00:00:00.000' AS DateTime), 4000000, N'CN2       ', 1, N'0c2935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (3, N'Trần', N'Thanh', N'Quận 10', CAST(N'1994-07-04 00:00:00.000' AS DateTime), 5000000, N'CN1       ', 0, N'0d2935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (4, N'Thái', N'Hà', N'Quận 6', CAST(N'2001-07-06 00:00:00.000' AS DateTime), 7000000, N'CN1       ', 1, N'0e2935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (5, N'Hồ', N'Thái', N'Bình Thạnh', CAST(N'2001-02-05 00:00:00.000' AS DateTime), 6000000, N'CN2       ', 0, N'0f2935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (6, N'Hà', N'An', N'Q9', CAST(N'2022-05-11 00:00:00.000' AS DateTime), 9000000, N'CN1       ', 0, N'bfa78e20-d8d4-ec11-8509-c0b883cbcb49')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (7, N'Lê', N'Trà', N'Phú Nhuận', CAST(N'1996-03-07 00:00:00.000' AS DateTime), 7000000, N'CN2       ', 1, N'112935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (8, N'Nguyễn', N'Hợp', N'Thủ Đức', CAST(N'1997-07-06 00:00:00.000' AS DateTime), 8000000, N'CN1       ', 0, N'122935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (9, N'Trần Tấn', N'Phong', N'Quận 9', CAST(N'2000-06-14 00:00:00.000' AS DateTime), 6000000, N'CN1       ', 1, N'be840f34-31d0-ec11-8505-c0b883cbcb49')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (10, N'Lại Đức', N'Mạnh', N'Thủ Đức', CAST(N'2001-06-14 00:00:00.000' AS DateTime), 5000000, N'CN1       ', 1, N'dab5b8ca-37d0-ec11-8505-c0b883cbcb49')
INSERT [dbo].[PhieuNhap] ([MAPN], [NGAY], [MasoDDH], [MANV], [MAKHO], [rowguid]) VALUES (N'PN01    ', CAST(N'2017-09-15' AS Date), N'MDDH02  ', 1, N'K1N1', N'192935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[PhieuNhap] ([MAPN], [NGAY], [MasoDDH], [MANV], [MAKHO], [rowguid]) VALUES (N'PN02    ', CAST(N'2020-06-14' AS Date), N'MDDH03  ', 2, N'K1N2', N'2e8b734e-c4d2-ec11-8509-c0b883cbcb49')
INSERT [dbo].[PhieuNhap] ([MAPN], [NGAY], [MasoDDH], [MANV], [MAKHO], [rowguid]) VALUES (N'PN03    ', CAST(N'2017-09-15' AS Date), N'MDDH01  ', 3, N'K1N1', N'1a2935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[PhieuNhap] ([MAPN], [NGAY], [MasoDDH], [MANV], [MAKHO], [rowguid]) VALUES (N'PN04    ', CAST(N'2021-02-22' AS Date), N'MDDH04  ', 5, N'K2N2', N'0982eb5c-c4d2-ec11-8509-c0b883cbcb49')
INSERT [dbo].[PhieuNhap] ([MAPN], [NGAY], [MasoDDH], [MANV], [MAKHO], [rowguid]) VALUES (N'PN05    ', CAST(N'2022-05-13' AS Date), N'MDDH05  ', 9, N'K2N1', N'8466d8f0-c6d2-ec11-8509-c0b883cbcb49')
INSERT [dbo].[PhieuNhap] ([MAPN], [NGAY], [MasoDDH], [MANV], [MAKHO], [rowguid]) VALUES (N'PN06    ', CAST(N'2022-05-14' AS Date), N'MDDH06  ', 9, N'K2N1', N'8f462e9b-a1d3-ec11-8509-c0b883cbcb49')
INSERT [dbo].[PhieuXuat] ([MAPX], [NGAY], [HOTENKH], [MAKHO], [MANV], [rowguid]) VALUES (N'PX01    ', CAST(N'2017-09-15' AS Date), N'Nguyễn Thị Ánh Hồng', N'K1N1', 1, N'162935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[PhieuXuat] ([MAPX], [NGAY], [HOTENKH], [MAKHO], [MANV], [rowguid]) VALUES (N'PX02    ', CAST(N'2017-09-15' AS Date), N'Trần Thị Mỹ Hà', N'K2N1', 3, N'172935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[PhieuXuat] ([MAPX], [NGAY], [HOTENKH], [MAKHO], [MANV], [rowguid]) VALUES (N'PX03    ', CAST(N'2017-09-15' AS Date), N'Trần Bích Phương', N'K2N1', 7, N'182935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[PhieuXuat] ([MAPX], [NGAY], [HOTENKH], [MAKHO], [MANV], [rowguid]) VALUES (N'PX04    ', CAST(N'2017-09-15' AS Date), N'Trần Ái Thủy', N'K2N1', 9, N'243872e6-99d1-ec11-8507-c0b883cbcb49')
INSERT [dbo].[PhieuXuat] ([MAPX], [NGAY], [HOTENKH], [MAKHO], [MANV], [rowguid]) VALUES (N'PX05    ', CAST(N'2022-05-16' AS Date), N'Trần Tấn Phong', N'K2N1', 8, N'45f5177d-abd3-ec11-8509-c0b883cbcb49')
INSERT [dbo].[Vattu] ([MAVT], [TENVT], [DVT], [SOLUONGTON], [rowguid]) VALUES (N'M01 ', N'Máy giặt tự động cửa trước', N'Cái', 0, N'ff2835ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[Vattu] ([MAVT], [TENVT], [DVT], [SOLUONGTON], [rowguid]) VALUES (N'MG01', N'Máy Giặt LG', N'Cái', 3, N'b8491a16-3ad0-ec11-8505-c0b883cbcb49')
INSERT [dbo].[Vattu] ([MAVT], [TENVT], [DVT], [SOLUONGTON], [rowguid]) VALUES (N'MG02', N'Máy giặt tay', N'Cái', 50, N'fb915a64-02d1-ec11-8506-c0b883cbcb49')
INSERT [dbo].[Vattu] ([MAVT], [TENVT], [DVT], [SOLUONGTON], [rowguid]) VALUES (N'MG03', N'Máy giặt ', N'cái', 5, N'31d81387-a1d3-ec11-8509-c0b883cbcb49')
INSERT [dbo].[Vattu] ([MAVT], [TENVT], [DVT], [SOLUONGTON], [rowguid]) VALUES (N'MU01', N'Máy uốn tóc', N'Cái', 10, N'022935ee-68a7-ec11-84f0-c0b883cbcb49')
INSERT [dbo].[Vattu] ([MAVT], [TENVT], [DVT], [SOLUONGTON], [rowguid]) VALUES (N'MX02', N'Máy sấy', N'Cái', 1, N'012935ee-68a7-ec11-84f0-c0b883cbcb49')
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_ChiNhanh]    Script Date: 5/16/2022 2:17:17 PM ******/
ALTER TABLE [dbo].[ChiNhanh] ADD  CONSTRAINT [UK_ChiNhanh] UNIQUE NONCLUSTERED 
(
	[ChiNhanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_245575913]    Script Date: 5/16/2022 2:17:17 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_245575913] ON [dbo].[ChiNhanh]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_485576768]    Script Date: 5/16/2022 2:17:17 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_485576768] ON [dbo].[CTDDH]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_597577167]    Script Date: 5/16/2022 2:17:17 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_597577167] ON [dbo].[CTPN]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_565577053]    Script Date: 5/16/2022 2:17:17 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_565577053] ON [dbo].[CTPX]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_421576540]    Script Date: 5/16/2022 2:17:17 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_421576540] ON [dbo].[DatHang]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_TENKHO]    Script Date: 5/16/2022 2:17:17 PM ******/
ALTER TABLE [dbo].[Kho] ADD  CONSTRAINT [UK_TENKHO] UNIQUE NONCLUSTERED 
(
	[TENKHO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_373576369]    Script Date: 5/16/2022 2:17:17 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_373576369] ON [dbo].[Kho]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_341576255]    Script Date: 5/16/2022 2:17:17 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_341576255] ON [dbo].[NhanVien]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_MaSoDDH]    Script Date: 5/16/2022 2:17:17 PM ******/
ALTER TABLE [dbo].[PhieuNhap] ADD  CONSTRAINT [UK_MaSoDDH] UNIQUE NONCLUSTERED 
(
	[MasoDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_517576882]    Script Date: 5/16/2022 2:17:17 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_517576882] ON [dbo].[PhieuNhap]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_453576654]    Script Date: 5/16/2022 2:17:17 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_453576654] ON [dbo].[PhieuXuat]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_TENVT]    Script Date: 5/16/2022 2:17:17 PM ******/
ALTER TABLE [dbo].[Vattu] ADD  CONSTRAINT [UK_TENVT] UNIQUE NONCLUSTERED 
(
	[TENVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_293576084]    Script Date: 5/16/2022 2:17:17 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_293576084] ON [dbo].[Vattu]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CTDDH]  WITH NOCHECK ADD  CONSTRAINT [FK_CTDDH_DatHang] FOREIGN KEY([MasoDDH])
REFERENCES [dbo].[DatHang] ([MasoDDH])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[CTDDH] CHECK CONSTRAINT [FK_CTDDH_DatHang]
GO
ALTER TABLE [dbo].[CTDDH]  WITH NOCHECK ADD  CONSTRAINT [FK_CTDDH_VatTu] FOREIGN KEY([MAVT])
REFERENCES [dbo].[Vattu] ([MAVT])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[CTDDH] CHECK CONSTRAINT [FK_CTDDH_VatTu]
GO
ALTER TABLE [dbo].[CTPN]  WITH NOCHECK ADD  CONSTRAINT [FK_CTPN_PhieuNhap] FOREIGN KEY([MAPN])
REFERENCES [dbo].[PhieuNhap] ([MAPN])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[CTPN] CHECK CONSTRAINT [FK_CTPN_PhieuNhap]
GO
ALTER TABLE [dbo].[CTPN]  WITH NOCHECK ADD  CONSTRAINT [FK_CTPN_VatTu] FOREIGN KEY([MAVT])
REFERENCES [dbo].[Vattu] ([MAVT])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[CTPN] CHECK CONSTRAINT [FK_CTPN_VatTu]
GO
ALTER TABLE [dbo].[CTPX]  WITH NOCHECK ADD  CONSTRAINT [FK_CTPX_PX] FOREIGN KEY([MAPX])
REFERENCES [dbo].[PhieuXuat] ([MAPX])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[CTPX] CHECK CONSTRAINT [FK_CTPX_PX]
GO
ALTER TABLE [dbo].[CTPX]  WITH NOCHECK ADD  CONSTRAINT [FK_CTPX_VatTu] FOREIGN KEY([MAVT])
REFERENCES [dbo].[Vattu] ([MAVT])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[CTPX] CHECK CONSTRAINT [FK_CTPX_VatTu]
GO
ALTER TABLE [dbo].[DatHang]  WITH NOCHECK ADD  CONSTRAINT [FK_DatHang_Kho] FOREIGN KEY([MAKHO])
REFERENCES [dbo].[Kho] ([MAKHO])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[DatHang] CHECK CONSTRAINT [FK_DatHang_Kho]
GO
ALTER TABLE [dbo].[DatHang]  WITH NOCHECK ADD  CONSTRAINT [FK_DatHang_NhanVien] FOREIGN KEY([MANV])
REFERENCES [dbo].[NhanVien] ([MANV])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[DatHang] CHECK CONSTRAINT [FK_DatHang_NhanVien]
GO
ALTER TABLE [dbo].[Kho]  WITH NOCHECK ADD  CONSTRAINT [FK_Kho_Kho] FOREIGN KEY([MACN])
REFERENCES [dbo].[ChiNhanh] ([MACN])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Kho] CHECK CONSTRAINT [FK_Kho_Kho]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChiNhanh] FOREIGN KEY([MACN])
REFERENCES [dbo].[ChiNhanh] ([MACN])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ChiNhanh]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH NOCHECK ADD  CONSTRAINT [FK_PhieuNhap_DatHang] FOREIGN KEY([MasoDDH])
REFERENCES [dbo].[DatHang] ([MasoDDH])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_DatHang]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH NOCHECK ADD  CONSTRAINT [FK_PhieuNhap_Kho] FOREIGN KEY([MAKHO])
REFERENCES [dbo].[Kho] ([MAKHO])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_Kho]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH NOCHECK ADD  CONSTRAINT [FK_PhieuNhap_NhanVien] FOREIGN KEY([MANV])
REFERENCES [dbo].[NhanVien] ([MANV])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhanVien]
GO
ALTER TABLE [dbo].[PhieuXuat]  WITH NOCHECK ADD  CONSTRAINT [FK_PX_Kho] FOREIGN KEY([MAKHO])
REFERENCES [dbo].[Kho] ([MAKHO])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PhieuXuat] CHECK CONSTRAINT [FK_PX_Kho]
GO
ALTER TABLE [dbo].[PhieuXuat]  WITH NOCHECK ADD  CONSTRAINT [FK_PX_NhanVien] FOREIGN KEY([MANV])
REFERENCES [dbo].[NhanVien] ([MANV])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PhieuXuat] CHECK CONSTRAINT [FK_PX_NhanVien]
GO
ALTER TABLE [dbo].[CTDDH]  WITH NOCHECK ADD  CONSTRAINT [CK_DONGIA] CHECK NOT FOR REPLICATION (([DONGIA]>(0)))
GO
ALTER TABLE [dbo].[CTDDH] CHECK CONSTRAINT [CK_DONGIA]
GO
ALTER TABLE [dbo].[CTDDH]  WITH NOCHECK ADD  CONSTRAINT [CK_SOLUONG] CHECK NOT FOR REPLICATION (([SOLUONG]>(0)))
GO
ALTER TABLE [dbo].[CTDDH] CHECK CONSTRAINT [CK_SOLUONG]
GO
ALTER TABLE [dbo].[CTPN]  WITH NOCHECK ADD  CONSTRAINT [CK_DONGIACTPN] CHECK NOT FOR REPLICATION (([DONGIA]>=(0)))
GO
ALTER TABLE [dbo].[CTPN] CHECK CONSTRAINT [CK_DONGIACTPN]
GO
ALTER TABLE [dbo].[CTPN]  WITH NOCHECK ADD  CONSTRAINT [CK_SOLUONGCTPN] CHECK NOT FOR REPLICATION (([SOLUONG]>(0)))
GO
ALTER TABLE [dbo].[CTPN] CHECK CONSTRAINT [CK_SOLUONGCTPN]
GO
ALTER TABLE [dbo].[CTPX]  WITH NOCHECK ADD  CONSTRAINT [CK_DONGIACTPX] CHECK NOT FOR REPLICATION (([DONGIA]>=(0)))
GO
ALTER TABLE [dbo].[CTPX] CHECK CONSTRAINT [CK_DONGIACTPX]
GO
ALTER TABLE [dbo].[CTPX]  WITH NOCHECK ADD  CONSTRAINT [CK_SOLUONGCTPX] CHECK NOT FOR REPLICATION (([SOLUONG]>(0)))
GO
ALTER TABLE [dbo].[CTPX] CHECK CONSTRAINT [CK_SOLUONGCTPX]
GO
ALTER TABLE [dbo].[NhanVien]  WITH NOCHECK ADD  CONSTRAINT [CK_LUONG] CHECK NOT FOR REPLICATION (([LUONG]>=(4000000)))
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [CK_LUONG]
GO
ALTER TABLE [dbo].[Vattu]  WITH NOCHECK ADD  CONSTRAINT [CK_SOLUONGTON] CHECK NOT FOR REPLICATION (([SOLUONGTON]>=(0)))
GO
ALTER TABLE [dbo].[Vattu] CHECK CONSTRAINT [CK_SOLUONGTON]
GO
/****** Object:  StoredProcedure [dbo].[SP_ChoPhepThemCTPN]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_ChoPhepThemCTPN]
@MAPN nchar(8), @MasoDDH nchar(8)
as
	declare @PN int
	declare @DH int
	select @DH = COUNT(*) from CTDDH
	where @MasoDDH = MasoDDH
	select @PN = COUNT(*) from CTPN
	where @MAPN = MAPN
	if @PN = @DH
		return 1
	return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_ChoPhepThemCTPX]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_ChoPhepThemCTPX]
@MAKHO nchar(4), @MAPX nchar(8)
as
	declare @MAVT nchar(4)
	select top 1 @MAVT = MAVT from dbo.F_MAVTKHO(@MAKHO, @MAPX)
	if @MAVT <> null
		return 0
	return 1
GO
/****** Object:  StoredProcedure [dbo].[SP_ChoPhepThemPN]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_ChoPhepThemPN]
as
	declare @MasoDDH nchar(8)
	select top 1 @MasoDDH = MasoDDH from V_DanhSachDDH
	if (@MasoDDH is NULL)
		return 1
	else
		return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_DANGNHAP]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DANGNHAP]
@TENLOGIN NVARCHAR (50)
AS
DECLARE @TENUSER NVARCHAR(50)
SELECT @TENUSER=NAME FROM sys.sysusers WHERE sid = SUSER_SID(@TENLOGIN)
 
 SELECT USERNAME = @TENUSER, 
  HOTEN = (SELECT HO+ ' '+ TEN FROM NHANVIEN  WHERE MANV = @TENUSER ),
   TENNHOM= NAME
   FROM sys.sysusers 
   WHERE UID = (SELECT GROUPUID 
                 FROM SYS.SYSMEMBERS 
                   WHERE MEMBERUID= (SELECT UID FROM sys.sysusers 
                                      WHERE NAME=@TENUSER))
GO
/****** Object:  StoredProcedure [dbo].[SP_KiemTraMaNV]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_KiemTraMaNV]
@MaNV int
as
	if exists(select 1 from NhanVien where @MaNV = MANV)
		return 1
	else
		if exists(select 1 from LINK2.QLVT.dbo.NhanVien where @MaNV = MANV)
			return 1
		else
			return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_KiemTraMaPN]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_KiemTraMaPN]
@MaPN nchar(8)
as
	if exists(select 1 from PhieuNhap where @MaPN = MAPN)
		return 1
	else
		if exists(select 1 from LINK0.QLVT.dbo.PhieuNhap where @MaPN = MAPN)
			return 1
	return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_KiemTraMaPX]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_KiemTraMaPX]
@MaPX nchar(8)
as
	if exists(select 1 from PhieuXuat where @MaPX = MAPX)
		return 1
	else
		if exists(select 1 from LINK0.QLVT.dbo.PhieuXuat where MAPX = @MaPX)
			return 1
		else
			return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_KiemTraMaVT]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_KiemTraMaVT]
@MaVT nchar(4)
as
	if exists(select 1 from Vattu where MAVT = @MaVT)
		return 1
	else
		return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_KiemTraMaVTCNKhac]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_KiemTraMaVTCNKhac]
@MaVT nchar(4)
as
	if exists(select 1 from LINK1.QLVT.dbo.CTDDH where MAVT = @MaVT)
		return 1
	if exists(select 1 from LINK1.QLVT.dbo.CTPX where MAVT = @MaVT)
		return 2
	if exists(select 1 from LINK1.QLVT.dbo.CTPN where MAVT = @MaVT)
		return 3
	return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_TraCuuMaKho]    Script Date: 5/16/2022 2:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_TraCuuMaKho]
@MaKho NCHAR(4)
as
	if exists(select 1 from KHO where @MaKho = MAKHO)
		return 1
	else
		if exists(select 1 from LINK2.QLVT.dbo.KHO where @MaKho = MAKHO)
			return 1
		else
			return 0

GO
USE [master]
GO
ALTER DATABASE [QLVT] SET  READ_WRITE 
GO
