USE [master]
GO
/****** Object:  Database [ShopHouseWare]    Script Date: 5/25/2023 5:50:18 PM ******/
CREATE DATABASE [ShopHouseWare]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopVegistDetail', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShopVegistDetail.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopVegistDetail_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShopVegistDetail_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopHouseWare] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopHouseWare].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopHouseWare] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopHouseWare] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopHouseWare] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopHouseWare] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopHouseWare] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopHouseWare] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopHouseWare] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopHouseWare] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopHouseWare] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopHouseWare] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopHouseWare] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopHouseWare] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopHouseWare] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopHouseWare] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopHouseWare] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopHouseWare] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopHouseWare] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopHouseWare] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopHouseWare] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopHouseWare] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopHouseWare] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopHouseWare] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopHouseWare] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopHouseWare] SET  MULTI_USER 
GO
ALTER DATABASE [ShopHouseWare] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopHouseWare] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopHouseWare] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopHouseWare] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopHouseWare] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopHouseWare] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShopHouseWare] SET QUERY_STORE = OFF
GO
USE [ShopHouseWare]
GO
/****** Object:  Table [dbo].[Categone]    Script Date: 5/25/2023 5:50:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categone](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categone] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 5/25/2023 5:50:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 5/25/2023 5:50:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[IdProduct] [int] NOT NULL,
	[IdOrder] [int] NOT NULL,
	[SL] [int] NULL,
	[Price] [numeric](18, 0) NULL,
	[Money] [numeric](18, 0) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[IdProduct] ASC,
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/25/2023 5:50:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[Total money] [numeric](18, 0) NULL,
	[IdPayment] [int] NULL,
	[IdUser] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 5/25/2023 5:50:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/25/2023 5:50:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Gia] [decimal](18, 0) NULL,
	[Producer] [nvarchar](50) NULL,
	[Available] [bit] NULL,
	[Quantity] [int] NULL,
	[Img] [nvarchar](50) NULL,
	[IdCategone] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/25/2023 5:50:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/25/2023 5:50:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[IdRole] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categone] ON 

INSERT [dbo].[Categone] ([ID], [Name]) VALUES (1, N'Xoong-nồi')
INSERT [dbo].[Categone] ([ID], [Name]) VALUES (2, N'Chảo')
INSERT [dbo].[Categone] ([ID], [Name]) VALUES (3, N'Dụng cụ làm bánh')
SET IDENTITY_INSERT [dbo].[Categone] OFF
GO
INSERT [dbo].[OrderDetail] ([IdProduct], [IdOrder], [SL], [Price], [Money]) VALUES (3, 1, 2, CAST(20000 AS Numeric(18, 0)), CAST(40000 AS Numeric(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID], [Date], [Total money], [IdPayment], [IdUser]) VALUES (1, CAST(N'2022-02-05T00:00:00.000' AS DateTime), CAST(250000 AS Numeric(18, 0)), 1, 2)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentType] ON 

INSERT [dbo].[PaymentType] ([ID], [Name]) VALUES (1, N'ATM')
INSERT [dbo].[PaymentType] ([ID], [Name]) VALUES (2, N'Tiền mặt')
SET IDENTITY_INSERT [dbo].[PaymentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Gia], [Producer], [Available], [Quantity], [Img], [IdCategone]) VALUES (3, N'Set of 2 ProCast', CAST(3000 AS Decimal(18, 0)), N'Nordic Ware', 1, 20, N'White_1.jpg', 1)
INSERT [dbo].[Product] ([ID], [Name], [Gia], [Producer], [Available], [Quantity], [Img], [IdCategone]) VALUES (4, N'Bundt Quartet Pan', CAST(15000 AS Decimal(18, 0)), N'Nordic Ware', 1, 20, N'Bundt_Quartet_Pan.jpg', 3)
INSERT [dbo].[Product] ([ID], [Name], [Gia], [Producer], [Available], [Quantity], [Img], [IdCategone]) VALUES (5, N'Geo Bundtlette Pan', CAST(23000 AS Decimal(18, 0)), N'Nordic Ware', 1, 20, N'Geo_Bundtlette_Pan.jpg', 3)
INSERT [dbo].[Product] ([ID], [Name], [Gia], [Producer], [Available], [Quantity], [Img], [IdCategone]) VALUES (6, N'Heritage Bundt Pan
', CAST(20000 AS Decimal(18, 0)), N'Nordic Ware', 1, 20, N'White_2.jpg', 3)
INSERT [dbo].[Product] ([ID], [Name], [Gia], [Producer], [Available], [Quantity], [Img], [IdCategone]) VALUES (7, N'Covered Sauce Pan', CAST(16000 AS Decimal(18, 0)), N'Nordic Ware', 1, 20, N'21860_White_1.jpg', 2)
INSERT [dbo].[Product] ([ID], [Name], [Gia], [Producer], [Available], [Quantity], [Img], [IdCategone]) VALUES (8, N'Saucepan With Lid', CAST(23000 AS Decimal(18, 0)), N'Nordic Ware', 1, 20, N'Qt_Stock_Pot.jpg', 1)
INSERT [dbo].[Product] ([ID], [Name], [Gia], [Producer], [Available], [Quantity], [Img], [IdCategone]) VALUES (9, N'Traditions Dutch Oven', CAST(15000 AS Decimal(18, 0)), N'Nordic Ware', 1, 20, N'21626_White_1.jpg', 3)
INSERT [dbo].[Product] ([ID], [Name], [Gia], [Producer], [Available], [Quantity], [Img], [IdCategone]) VALUES (10, N'11 inch Grill pan with Stainless Steel handle', CAST(14000 AS Decimal(18, 0)), N'Nordic Ware', 1, 20, N'11_in_Red_Grill_Pan_White.jpg', 3)
INSERT [dbo].[Product] ([ID], [Name], [Gia], [Producer], [Available], [Quantity], [Img], [IdCategone]) VALUES (11, N'8” Wok', CAST(17000 AS Decimal(18, 0)), N'Nordic Ware', 1, 20, N'16400_White.jpg', 2)
INSERT [dbo].[Product] ([ID], [Name], [Gia], [Producer], [Available], [Quantity], [Img], [IdCategone]) VALUES (12, N'12” Big Bowl Wok', CAST(20000 AS Decimal(18, 0)), N'Nordic Ware', 1, 20, N'Rangeware_Wok_Grey.jpg', 2)
INSERT [dbo].[Product] ([ID], [Name], [Gia], [Producer], [Available], [Quantity], [Img], [IdCategone]) VALUES (13, N'2 Burner High Sided Griddle', CAST(8000 AS Decimal(18, 0)), N'Nordic Ware', 1, 20, N'High-Sided.jpg', 3)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[Role] ([ID], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (2, N'Member')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [FullName], [Address], [UserName], [Password], [Phone], [IdRole]) VALUES (1, N'Bùi Văn Kiên', N'Thái Bình', N'Kien', N'202cb962ac59075b964b07152d234b70', N'02365478', 1)
INSERT [dbo].[Users] ([ID], [FullName], [Address], [UserName], [Password], [Phone], [IdRole]) VALUES (2, N'Lê Nam Huy', N'Nam Định', N'Huy', N'4428c6c474502e61151877825bb41961', N'032654789', 2)
INSERT [dbo].[Users] ([ID], [FullName], [Address], [UserName], [Password], [Phone], [IdRole]) VALUES (11, N'Bùi Xuân Khải', N'Bắc Giang', N'Khai', N'25d55ad283aa400af464c76d713c07ad', N'0136547892', 2)
INSERT [dbo].[Users] ([ID], [FullName], [Address], [UserName], [Password], [Phone], [IdRole]) VALUES (13, N'Nguyễn Quang Linh', N'Hà Nội', N'Linh', N'c20ad4d76fe97759aa27a0c99bff6710', N'0326547893', 2)
INSERT [dbo].[Users] ([ID], [FullName], [Address], [UserName], [Password], [Phone], [IdRole]) VALUES (15, N'Bui Kien', N'thái bình', N'min', N'202cb962ac59075b964b07152d234b70', N'0326548971', 2)
INSERT [dbo].[Users] ([ID], [FullName], [Address], [UserName], [Password], [Phone], [IdRole]) VALUES (16, N'gfdg', N'gdf', N'Kien', N'c4ca4238a0b923820dcc509a6f75849b', N'012', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order1] FOREIGN KEY([IdOrder])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order1]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product1] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product1]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_PaymentType] FOREIGN KEY([IdPayment])
REFERENCES [dbo].[PaymentType] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_PaymentType]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Categone] FOREIGN KEY([IdCategone])
REFERENCES [dbo].[Categone] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Categone]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [ShopHouseWare] SET  READ_WRITE 
GO
