USE [master]
GO
/****** Object:  Database [ProjectPRJ321]    Script Date: 9/16/2020 11:44:08 PM ******/
CREATE DATABASE [ProjectPRJ321]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectPRJ321', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ProjectPRJ321.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjectPRJ321_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ProjectPRJ321_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProjectPRJ321] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectPRJ321].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectPRJ321] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectPRJ321] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectPRJ321] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProjectPRJ321] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectPRJ321] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET RECOVERY FULL 
GO
ALTER DATABASE [ProjectPRJ321] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectPRJ321] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectPRJ321] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectPRJ321] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjectPRJ321] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProjectPRJ321', N'ON'
GO
ALTER DATABASE [ProjectPRJ321] SET QUERY_STORE = OFF
GO
USE [ProjectPRJ321]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 9/16/2020 11:44:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[CTHD_IDHD] [int] NOT NULL,
	[CTHD_IDSP] [varchar](50) NOT NULL,
	[CTHD_SL] [int] NOT NULL,
	[CTHD_GIA] [float] NOT NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[CTHD_IDHD] ASC,
	[CTHD_IDSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietLoaiSanPham]    Script Date: 9/16/2020 11:44:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietLoaiSanPham](
	[CTLSP_LSPID] [varchar](50) NOT NULL,
	[CTLSP_ID] [varchar](50) NOT NULL,
	[CTLSP_NAME] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ChiTietLoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[CTLSP_LSPID] ASC,
	[CTLSP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangSanXuat]    Script Date: 9/16/2020 11:44:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangSanXuat](
	[HSX_ID] [varchar](50) NOT NULL,
	[HSX_NAME] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_HangSanXuat] PRIMARY KEY CLUSTERED 
(
	[HSX_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 9/16/2020 11:44:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[HD_ID] [int] IDENTITY(1,1) NOT NULL,
	[HD_KHID] [varchar](50) NOT NULL,
	[HD_IDNV] [varchar](50) NOT NULL,
	[HD_IDSHIP] [varchar](50) NOT NULL,
	[HD_NGAY] [date] NOT NULL,
	[HD_DIACHI] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[HD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khachhang]    Script Date: 9/16/2020 11:44:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khachhang](
	[KH_Acount] [varchar](50) NOT NULL,
	[KH_Name] [nvarchar](50) NULL,
	[KH_Dob] [date] NOT NULL,
	[KH_Gender] [bit] NOT NULL,
	[KH_Sdt] [varchar](50) NOT NULL,
	[KH_Email] [varchar](50) NOT NULL,
	[KH_Pass] [varchar](50) NOT NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[KH_Acount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 9/16/2020 11:44:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[LSP_ID] [varchar](50) NOT NULL,
	[LSP_NAME] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[LSP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 9/16/2020 11:44:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[NV_ID] [varchar](50) NOT NULL,
	[NV_NAME] [nvarchar](50) NOT NULL,
	[NV_GENDER] [bit] NOT NULL,
	[NV_DOB] [date] NOT NULL,
	[NV_PHONE] [varchar](50) NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[NV_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 9/16/2020 11:44:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OD_ID] [int] IDENTITY(1,1) NOT NULL,
	[KH_Account] [nvarchar](50) NOT NULL,
	[SP_ID] [varchar](50) NOT NULL,
	[OD_Status] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 9/16/2020 11:44:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[SP_ID] [varchar](50) NOT NULL,
	[SP_NAME] [nvarchar](100) NOT NULL,
	[SP_SL] [int] NOT NULL,
	[SP_GIA] [int] NOT NULL,
	[SP_LOAISP] [varchar](50) NOT NULL,
	[SP_HANGSX] [varchar](50) NOT NULL,
	[SP_IMAGE] [varchar](500) NOT NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[SP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ship]    Script Date: 9/16/2020 11:44:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ship](
	[SHIP_ID] [varchar](50) NOT NULL,
	[SHIP_NAME] [varchar](50) NOT NULL,
	[SHIP_GENDER] [bit] NOT NULL,
	[SHIP_DOB] [date] NOT NULL,
	[SHIP_PHONE] [varchar](50) NOT NULL,
	[SHIP_TRANGTHAI] [bit] NOT NULL,
 CONSTRAINT [PK_Ship] PRIMARY KEY CLUSTERED 
(
	[SHIP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table1]    Script Date: 9/16/2020 11:44:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table1](
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[HangSanXuat] ([HSX_ID], [HSX_NAME]) VALUES (N'H1', N'Apple')
INSERT [dbo].[HangSanXuat] ([HSX_ID], [HSX_NAME]) VALUES (N'H10', N'Accessories')
INSERT [dbo].[HangSanXuat] ([HSX_ID], [HSX_NAME]) VALUES (N'H2', N'Samsung')
INSERT [dbo].[HangSanXuat] ([HSX_ID], [HSX_NAME]) VALUES (N'H3', N'Oppo')
INSERT [dbo].[HangSanXuat] ([HSX_ID], [HSX_NAME]) VALUES (N'H4', N'Huawei')
INSERT [dbo].[HangSanXuat] ([HSX_ID], [HSX_NAME]) VALUES (N'H5', N'Xiaomi')
INSERT [dbo].[HangSanXuat] ([HSX_ID], [HSX_NAME]) VALUES (N'H6', N'Nokia')
INSERT [dbo].[HangSanXuat] ([HSX_ID], [HSX_NAME]) VALUES (N'H7', N'Vivo')
INSERT [dbo].[HangSanXuat] ([HSX_ID], [HSX_NAME]) VALUES (N'H8', N'Vsmart')
INSERT [dbo].[HangSanXuat] ([HSX_ID], [HSX_NAME]) VALUES (N'H9', N'Ipad')
INSERT [dbo].[Khachhang] ([KH_Acount], [KH_Name], [KH_Dob], [KH_Gender], [KH_Sdt], [KH_Email], [KH_Pass]) VALUES (N'kha', N'kha lon', CAST(N'1999-01-02' AS Date), 0, N'12345', N'kha@fpt.vn', N'kha12345')
INSERT [dbo].[Khachhang] ([KH_Acount], [KH_Name], [KH_Dob], [KH_Gender], [KH_Sdt], [KH_Email], [KH_Pass]) VALUES (N'long', N'Nguyen Thanh Long', CAST(N'1999-01-02' AS Date), 1, N'0888839515', N'long123@fpt.edu.vn', N'long1234')
INSERT [dbo].[Khachhang] ([KH_Acount], [KH_Name], [KH_Dob], [KH_Gender], [KH_Sdt], [KH_Email], [KH_Pass]) VALUES (N'minhcnn', N'Chu Nguyen Nhat Minh', CAST(N'1999-06-14' AS Date), 1, N'0123456789', N'minhfire99@gmail.com', N'12345678')
INSERT [dbo].[Khachhang] ([KH_Acount], [KH_Name], [KH_Dob], [KH_Gender], [KH_Sdt], [KH_Email], [KH_Pass]) VALUES (N'tuyen', N'Nguyen duc tuyen ', CAST(N'1999-01-03' AS Date), 1, N'123', N'tuyen123@fpt.edu.vn', N'tuyen123')
INSERT [dbo].[Khachhang] ([KH_Acount], [KH_Name], [KH_Dob], [KH_Gender], [KH_Sdt], [KH_Email], [KH_Pass]) VALUES (N'tuyen1', N'Nguyen Tuyen', CAST(N'1999-01-02' AS Date), 1, N'13456789', N'Tuyendz6996@gmail.com', N'tuyen123')
INSERT [dbo].[Khachhang] ([KH_Acount], [KH_Name], [KH_Dob], [KH_Gender], [KH_Sdt], [KH_Email], [KH_Pass]) VALUES (N'tuyen123', N'Nguyen Tuyen', CAST(N'1999-01-02' AS Date), 1, N'0888839515', N'Tuyendz6996@gmail.com', N'tuyen123')
INSERT [dbo].[LoaiSanPham] ([LSP_ID], [LSP_NAME]) VALUES (N'L1', N'Điện thoại')
INSERT [dbo].[LoaiSanPham] ([LSP_ID], [LSP_NAME]) VALUES (N'L2', N'Máy tính bảng')
INSERT [dbo].[LoaiSanPham] ([LSP_ID], [LSP_NAME]) VALUES (N'L3', N'Phụ kiện')
INSERT [dbo].[NhanVien] ([NV_ID], [NV_NAME], [NV_GENDER], [NV_DOB], [NV_PHONE]) VALUES (N'NV1', N'Nguyen Duc Tuyen', 1, CAST(N'1999-09-09' AS Date), N'1234')
INSERT [dbo].[NhanVien] ([NV_ID], [NV_NAME], [NV_GENDER], [NV_DOB], [NV_PHONE]) VALUES (N'Nv2', N'Nguyen Thanh Long', 1, CAST(N'1999-01-02' AS Date), N'1234')
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OD_ID], [KH_Account], [SP_ID], [OD_Status]) VALUES (1, N'kha', N'SP13', 0)
INSERT [dbo].[Order] ([OD_ID], [KH_Account], [SP_ID], [OD_Status]) VALUES (2, N'kha', N'SP2', 0)
INSERT [dbo].[Order] ([OD_ID], [KH_Account], [SP_ID], [OD_Status]) VALUES (3, N'kha', N'SP55', 0)
INSERT [dbo].[Order] ([OD_ID], [KH_Account], [SP_ID], [OD_Status]) VALUES (4, N'kha', N'SP28', 0)
INSERT [dbo].[Order] ([OD_ID], [KH_Account], [SP_ID], [OD_Status]) VALUES (5, N'kha', N'SP17', 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP1', N'Apple Iphone 11 Pro max 64GB', 100, 30000000, N'L1', N'H1', N'iphone2/promax-green.jpg')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP10', N'Apple iphone 8 64gb ', 100, 15000000, N'L1', N'H1', N'iphone2/ip8.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP11', N'Apple iphone X 64gb', 100, 18000000, N'L1', N'H1', N'iphone2/iphonex.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP12', N'Apple iphone X 256gb', 100, 19000000, N'L1', N'H1', N'iphone2/iphonex.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP13', N'Samsung Galaxy S10+ 128GB', 100, 22790000, N'L1', N'H2', N'samsung/s10plus-128.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP14', N'Samsung Galaxy S10+ 512gb', 100, 23490000, N'L1', N'H2', N'samsung/s10plus-512.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP15', N'Samsung Galaxy S10 128GB', 100, 18000000, N'L1', N'H2', N'samsung/s10.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP16', N'Samsung Galaxy Note 10 ', 100, 21990000, N'L1', N'H2', N'samsung/note10.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP17', N'Samsung Galaxy Note 10+', 100, 24000000, N'L1', N'H2', N'samsung/note10plus.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP18', N'Samsung Galaxy Note 9', 100, 18490000, N'L1', N'H2', N'samsung/note9.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP19', N'Samsung Galaxy A30s', 100, 5790000, N'L1', N'H2', N'samsung/a30s.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP2', N'Apple iphone 11 Pro max 256GB', 100, 33000000, N'L1', N'H1', N'iphone2/promax-gold.jpg')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP20', N'Samsung Galaxy A30', 100, 6000000, N'L1', N'H2', N'samsung/a30.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP21', N'Samsung Galaxy A20', 100, 3990000, N'L1', N'H2', N'samsung/a20.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP22', N'Samsung Galaxy A10s', 100, 3490000, N'L1', N'H2', N'samsung/a10s.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP23', N'Samsung Galaxy A50 64GB', 100, 6190000, N'L1', N'H2', N'samsung/a50.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP24', N'Samsung Galaxy A50 128gb', 100, 6990000, N'L1', N'H2', N'samsung/a50.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP25', N'OPPO A9 2020', 100, 6890000, N'L1', N'H3', N'oppo/a9.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP26', N'OPPO Reno', 100, 10790000, N'L1', N'H3', N'oppo/renopink.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP27', N'Oppo Reno 10x Zoom Edition', 100, 16990000, N'L1', N'H3', N'oppo/reno1.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP28', N'Oppoo F11 Pro 128GB', 100, 6990000, N'L1', N'H3', N'oppo/f11.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP29', N'OPPO R17 Pro', 100, 9490000, N'L1', N'H3', N'oppo/r17.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP3', N'Apple iphone 11 Pro max 512 gb', 100, 35000000, N'L1', N'H1', N'iphone2/promax-green.jpg')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP30', N'OPPO F11', 100, 5900000, N'L1', N'H3', N'oppo/reno1.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP31', N'Huawei Nova 3i', 100, 4590000, N'L1', N'H4', N'huawei/nova3i.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP32', N'Huawei Y7 Pro 2019', 100, 3140000, N'L1', N'H4', N'huawei/y7pro.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP33', N'Huawei P30 Pro', 100, 20690000, N'L1', N'H4', N'huawei/p30.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP34', N'Huawei P30 Lite ', 100, 5990000, N'L1', N'H4', N'huawei/30lite.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP35', N'Huawei Y9 Prime 2019', 100, 5440000, N'L1', N'H4', N'huawei/y9x.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP36', N'Huawei Y9 2019', 100, 4690000, N'L1', N'H4', N'huawei/y91.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP37', N'Xiaomi Redmi note 5', 100, 2890000, N'L1', N'H5', N'xiaomi/note5.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP38', N'Xiaomi Redmi 7a', 100, 2250000, N'L1', N'H5', N'xiaomi/redmi7a.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP39', N'Xiaomi Mi A2 Lite', 100, 2300000, N'L1', N'H5', N'xiaomi/mia2.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP4', N'Apple iphone 11 pro 64gb', 100, 28000000, N'L1', N'H1', N'iphone2/promax-gold.jpg')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP40', N'Xiaomi Mi A2', 100, 3500000, N'L1', N'H5', N'xiaomi/mia2blue.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP41', N'Xiaomi Mi 9 SE', 100, 7290000, N'L1', N'H5', N'xiaomi/se.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP42', N'Xiaomi Mi 9T', 100, 8390000, N'L1', N'H5', N'xiaomi/mi9t.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP43', N'Vivo S1 -Hàng Chính Hãng', 100, 6090000, N'L1', N'H7', N'vivo/vivos1.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP44', N'Vivo V11i Hàng chính hãng', 100, 4690000, N'L1', N'H7', N'vivo/v11i.jpg')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP45', N'Vivo V15 128 Hàng chính hãng', 100, 5990000, N'L1', N'H7', N'vivo/v15.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP46', N'Vivo V15 64GB', 100, 5490000, N'L1', N'H7', N'vivo/v15.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP47', N'Vivo Y12 Hàng chính hãng', 100, 3690000, N'L1', N'H7', N'vivo/y12.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP48', N'Vivo Y15 Hàng chính hãng', 100, 4290000, N'L1', N'H7', N'vivo/y15.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP49', N'iPad wifi cellular 32gb', 100, 11090000, N'L1', N'H9', N'ipad/ipadwifi.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP5', N'Apple iphone 11 pro 256gb', 100, 31000000, N'L1', N'H1', N'iphone2/promax-green.jpg')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP50', N'iPad Pro 11 inch 64gb (2018)', 100, 20800000, N'L1', N'H9', N'ipad/ipadpro11.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP51', N'iPad Pro 10.5 inch 64gb (2017)', 100, 14990000, N'L1', N'H9', N'ipad/ipad105.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP52', N'iPad Mini 7.9 64GB', 100, 13990000, N'L1', N'H9', N'ipad/ipad79.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP53', N'iPad Air 10.5 inch 64GB (2019) ', 100, 12800000, N'L1', N'H9', N'ipad/ipadair79.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP54', N'iPad Wifi 128gb (2018)', 100, 10790000, N'L1', N'H9', N'ipad/ipad128.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP55', N'Apple Airpods 2 hộp sạc không dây', 100, 5990000, N'L3', N'H10', N'phukien/airpod2.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP56', N'Apple Airpods 2 hộp sạc có dây', 100, 4990000, N'L3', N'H10', N'phukien/airpod2.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP57', N'Apple sạc nguồn 5w', 100, 490000, N'L3', N'H10', N'phukien/charge.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP58', N'Apple cáp lightning', 100, 490000, N'L3', N'H10', N'phukien/cable.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP59', N'Apple tai nghe Earpods', 100, 790000, N'L3', N'H10', N'phukien/earpods.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP6', N'Apple iphone 11 pro 512', 100, 33000000, N'L1', N'H1', N'iphone2/promax-gold.jpg')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP60', N'Apple bút cảm ứng Apple 2017', 100, 2990000, N'L3', N'H10', N'phukien/pen2017.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP61', N'Apple bút cảm ứng 2018', 100, 3990000, N'L3', N'H10', N'phukien/pen2018.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP62', N'Apple bàn phím iPad pro 11 inch', 100, 5990000, N'L3', N'H10', N'phukien/banphim.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP63', N'Apple Watch Series 5, 40mm Silver', 100, 11990000, N'L3', N'H10', N'phukien/awbac.jpg')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP64', N'Apple Watch Series 5, 40mm Black ', 100, 11990000, N'L3', N'H10', N'phukien/awden.jpg')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP65', N'Apple Watch Series 5, 40mm Rose Gold', 100, 11990000, N'L3', N'H10', N'phukien/awhong.jpg')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP66', N'Apple Watch Series 5, 44mm Rose Gold ', 100, 9990000, N'L3', N'H10', N'phukien/awnylon.jpg')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP7', N'Apple iphone XS Max 64gb', 100, 20000000, N'L1', N'H1', N'iphone2/xsmax-gold.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP8', N'Apple iphone XS max 256gb', 100, 23000000, N'L1', N'H1', N'iphone2/xsmax-gold.png')
INSERT [dbo].[SanPham] ([SP_ID], [SP_NAME], [SP_SL], [SP_GIA], [SP_LOAISP], [SP_HANGSX], [SP_IMAGE]) VALUES (N'SP9', N'Apple iphone 11 64gb', 100, 21000000, N'L1', N'H1', N'iphone2/iphone11-den.png')
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([CTHD_IDHD])
REFERENCES [dbo].[HoaDon] ([HD_ID])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_SanPham] FOREIGN KEY([CTHD_IDSP])
REFERENCES [dbo].[SanPham] ([SP_ID])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_SanPham]
GO
ALTER TABLE [dbo].[ChiTietLoaiSanPham]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietLoaiSanPham_LoaiSanPham] FOREIGN KEY([CTLSP_LSPID])
REFERENCES [dbo].[LoaiSanPham] ([LSP_ID])
GO
ALTER TABLE [dbo].[ChiTietLoaiSanPham] CHECK CONSTRAINT [FK_ChiTietLoaiSanPham_LoaiSanPham]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([HD_KHID])
REFERENCES [dbo].[Khachhang] ([KH_Acount])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([HD_IDNV])
REFERENCES [dbo].[NhanVien] ([NV_ID])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_Ship] FOREIGN KEY([HD_IDSHIP])
REFERENCES [dbo].[Ship] ([SHIP_ID])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_Ship]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_HangSanXuat] FOREIGN KEY([SP_HANGSX])
REFERENCES [dbo].[HangSanXuat] ([HSX_ID])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_HangSanXuat]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([SP_LOAISP])
REFERENCES [dbo].[LoaiSanPham] ([LSP_ID])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
USE [master]
GO
ALTER DATABASE [ProjectPRJ321] SET  READ_WRITE 
GO
