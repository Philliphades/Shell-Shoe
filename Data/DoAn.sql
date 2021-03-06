USE [master]
GO
/****** Object:  Database [doantotnghiep_webbangiay]    Script Date: 05/30/2016 11:14:40 ******/
CREATE DATABASE [doantotnghiep_webbangiay] ON  PRIMARY 
( NAME = N'doantotnghiep_webbangiay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\doantotnghiep_webbangiay.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'doantotnghiep_webbangiay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\doantotnghiep_webbangiay_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [doantotnghiep_webbangiay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET ANSI_NULLS OFF
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET ANSI_PADDING OFF
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET ARITHABORT OFF
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET  DISABLE_BROKER
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET  READ_WRITE
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET RECOVERY SIMPLE
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET  MULTI_USER
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [doantotnghiep_webbangiay] SET DB_CHAINING OFF
GO
USE [doantotnghiep_webbangiay]
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 05/30/2016 11:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TenTaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [varchar](32) NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[Email] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[QuyenHan] [int] NULL,
	[NgayTao] [datetime] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_TAIKHOAN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TAIKHOAN] ON
INSERT [dbo].[TAIKHOAN] ([ID], [TenTaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [QuyenHan], [NgayTao], [TrangThai]) VALUES (1, N'admin', N'202cb962ac59075b964b07152d234b70', N'Đỗ Trọng Hiếu', N'Hưng Yên', N'hieutk10@gmail.com', N'01679323265', 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[TAIKHOAN] OFF
/****** Object:  Table [dbo].[SLIDE]    Script Date: 05/30/2016 11:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLIDE](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TenSlide] [nvarchar](100) NULL,
	[Metatitle] [nvarchar](100) NULL,
	[Anh] [nvarchar](500) NULL,
	[Link] [nvarchar](150) NULL,
	[NgayTao] [datetime] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_SLIDE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SLIDE] ON
INSERT [dbo].[SLIDE] ([ID], [TenSlide], [Metatitle], [Anh], [Link], [NgayTao], [TrangThai]) VALUES (1, N'GIÀY NAM HÀN QUỐC - T2C3', N'GIÀY-NAM-HÀN-QUỐC-T2C3', N'/Data/images/Upload/sanpham/files/Slider1_adidasjpg.jpg', N'#1', CAST(0x0000A605012654F1 AS DateTime), 2)
INSERT [dbo].[SLIDE] ([ID], [TenSlide], [Metatitle], [Anh], [Link], [NgayTao], [TrangThai]) VALUES (2, N'GIÀY TÂY DA BÓNG TS007 - TS007', N'GIÀY-TDY-DA-BONG-TS007-TS007', N'/Data/images/Upload/sanpham/files/Slider2_adidasjpg.jpg', N'#2', CAST(0x0000A60501265C3D AS DateTime), 2)
INSERT [dbo].[SLIDE] ([ID], [TenSlide], [Metatitle], [Anh], [Link], [NgayTao], [TrangThai]) VALUES (3, N'GIÀY TÂY DA BÓNG TS007 - TS007', N'GIAY TAY DA BONg', N'/Data/images/Upload/sanpham/files/Pride231232sktop.jpg', N'#3', CAST(0x0000A605014A674F AS DateTime), 2)
INSERT [dbo].[SLIDE] ([ID], [TenSlide], [Metatitle], [Anh], [Link], [NgayTao], [TrangThai]) VALUES (4, N'GIÀY TÂY DA BÓNG TS007 - TS007', NULL, N'/Data/images/Upload/sanpham/files/Slider3_adidasjpg11.jpg', N'#4', CAST(0x0000A605014A69C0 AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[SLIDE] OFF
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 05/30/2016 11:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NULL,
	[Code] [varchar](30) NULL,
	[Metatitle] [nvarchar](150) NULL,
	[MoTaSP] [nvarchar](500) NULL,
	[AnhDaiDien] [nvarchar](500) NULL,
	[Gia] [decimal](18, 0) NULL,
	[GiaKhuyenMai] [decimal](18, 0) NULL,
	[ChiTietSP] [ntext] NULL,
	[BaoHanh] [int] NULL,
	[NgayTao] [datetime] NULL,
	[NgaySuaDoi] [datetime] NULL,
	[LuotXem] [int] NULL,
	[TrangThai] [int] NULL,
	[IDDanhMuc] [bigint] NULL,
	[NguoiTao] [bigint] NULL,
	[IDHang] [bigint] NULL,
 CONSTRAINT [PK_SANPHAM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SANPHAM] ON
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang]) VALUES (1, N'GIÀY NAM HÀN QUỐC - T2C3', N'T2C3', N'GIÀY-NAM-HÀN-QUỐC-T2C3', N'Sản phẩm giày nam hàn quốc mới nhất!', N'/Data/images/Upload/sanpham/files/dd3d72_simg_70aaf2_700x700_maxb.jpg', CAST(350000 AS Decimal(18, 0)), NULL, N'Đang cập nhật', 12, CAST(0x0000A60401740549 AS DateTime), NULL, 13, 2, 4, 1, 1)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang]) VALUES (2, N'Tăng cao 6.5cm: Giày tây nam không dây DA BÒ THẬT - Đen - VNG06<', N'VNG06', N'Tang-cao-6-5cm-Giay-tay-nam-khong-day-DA-BO-THDT-Den-VNG06-', N'Đang cập nhật', N'/Data/images/Upload/sanpham/files/6d3d6f_simg_70aaf2_700x700_maxb.jpg', CAST(800000 AS Decimal(18, 0)), CAST(460000 AS Decimal(18, 0)), N'Đang cập nhật', 12, CAST(0x0000A604017C4648 AS DateTime), NULL, 11, 2, 4, 1, 1)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang]) VALUES (3, N'GIÀY TÂY DA BÓNG TS007 - TS007', N'TS007', N'GIÀY-TDY-DA-BONG-TS007-TS007', N'Đang cập nhật', N'/Data/images/Upload/sanpham/files/d31d09_simg_70aaf2_700x700_maxb.jpg', CAST(430000 AS Decimal(18, 0)), NULL, N'Đang cập nhật', 12, CAST(0x0000A605000CDD38 AS DateTime), NULL, 5, 2, 4, 1, 2)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang]) VALUES (5, N'Giày cao gót nữ quý phái sang trọng - 177 - Giày nữ - 96177', N'96177', N'Giay-cao-got-nu-quy-phai-sang-trong-177-Giay-nu-96177', N'Đang cập nhật', N'/Data/images/Upload/sanpham/files/d30c32_simg_70aaf2_700x700_maxb.jpg', CAST(630000 AS Decimal(18, 0)), CAST(297000 AS Decimal(18, 0)), N'Đang cập nhật', 1, CAST(0x0000A6050179091C AS DateTime), NULL, 7, 2, 10, 1, 3)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang]) VALUES (6, N'Giày da lười công sở sang trọng, lịch lãm, đế tăng chiều cao 6,5cm - GL45.1', N'GL45.1', N'Giay-da-luoi-cong-so-sang-trong-lich-lam-de-tang-chieu-cao-6-5cm-GL45-1', N'Đang cập nhật', N'/Data/images/Upload/sanpham/files/bcf926_simg_70aaf2_700x700_maxb.jpg', CAST(1050000 AS Decimal(18, 0)), CAST(540000 AS Decimal(18, 0)), N'Đang cập nhật', 12, CAST(0x0000A605017A6403 AS DateTime), NULL, 31, 2, 4, 1, 3)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang]) VALUES (7, N'DA BÒ SAN MARCOS - Đen, nâu - VNG05', N'VNG05', N'DA-BO-SAN-MARCOS-Den-nau-VNG05', N'Đang cập nhật', N'/Data/images/Upload/sanpham/files/59ef34_simg_70aaf2_700x700_maxb.jpg', CAST(1500000 AS Decimal(18, 0)), CAST(640000 AS Decimal(18, 0)), N'Đang cập nhật', 12, CAST(0x0000A605017B20DD AS DateTime), NULL, 67, 2, 4, 1, 3)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang]) VALUES (8, N' Giày tây nam Zapas dáng xỏ - GT03 (Nâu)', N'GT03 ', N'-Giày-tay-nam-Zapas-dáng-xỏ-GT03-Nau-', N'<p>Sản phẩm gi&agrave;y chất lượng cao!</p>
', N'/Data/images/Upload/sanpham/files/Giay-tay-da-nam-dang-xo%20(1).png', CAST(450000 AS Decimal(18, 0)), CAST(350000 AS Decimal(18, 0)), N'<div>Giới thiệu sản phẩm Giày t&acirc;y nam Zapas dáng xỏ - GT03 (N&acirc;u)</div>

<p>GIỚI THI&Ecirc;̣U SẢN PH&Acirc;̉M GIÀY T&Acirc;Y Đ&Ecirc;́ PHÁP ZAPAS</p>

<p>&nbsp;</p>

<p><br />
Đ&ocirc;i gi&agrave;y l&agrave; phụ kiện thể hiện niềm đam m&ecirc; v&agrave; c&aacute; t&iacute;nh của người mang. Giày t&acirc;y da nam Zapas với thiết kế thời trang, năng động, trẻ trung ph&ugrave; hợp với mọi lứa tuổi sẽ l&agrave;m nổi bật l&ecirc;n c&aacute; t&iacute;nh, phong c&aacute;ch của bạn.</p>

<p><img alt="image" src="https://lh3.googleusercontent.com/B5lH5kkZ1C1cgz6MxRbbZg6W-_Cdb7DG7QwhLjF5BMptSHt1tixu_lvifzuqmmy9oLT7T4-jWAvCtccE8-mEaLaWRuEYRqL2x7Sv4WIPdaUpbOqXtx7Wj7zNqUivmiLlr9YYKii0CIm0ADhWPhpgjph-mo_2fD7znTSJjoh_8dEOTemqi6XlXn8ZvV5XMhjBBOLHYVEodDCR_y4N8Z7mAy3UdQgP9Sc3a-VcKiqSvaWAekT4JF4xRicFCKSmo-frKq_j77zhlZr8bfCjlSLgnruKIAfo-uvQJkMDEMwIA_CrpPDGGkWpjHzDQ_6ocfjGTt7RBJzHutD8kYnmA5cd30STGvn1Ke9U5Cm-EgQs_BUCKF1l4dMgbMmnxCifolV2oiOaLs0KisjuCXHzQ7MpVj_kYXsrvoAVwFLhrdN8xxS1UVWrynLeztjWVwdiDePpDOkTxTGi5hsFmLFEJxrbQn98iRv2Of2w1HHZP2KrQ0OGzFXeoznJ8BU4Dc0QEOKud5bYgonRN01_zWEMXDPjKPepZgkpxCN_d9R-DSFoOlL57gvc_r9A006R5Peu_jwTM2wm=s641-no" /></p>

<p>&nbsp;</p>

<p>- Nhiều m&agrave;u sắc, mẫu để lựa chọn l&agrave;m mới phong c&aacute;ch h&agrave;ng ng&agrave;y.<br />
- Kh&ocirc;ng chỉ phụ nữ, hiện nay, thời trang d&agrave;nh cho nam giới ng&agrave;y c&agrave;ng phong ph&uacute;, đa dạng v&agrave; được nhiều người quan t&acirc;m. Để thể hiện m&igrave;nh l&agrave; người lịch sự, c&aacute;c bạn nam đều phải để &yacute; để vẻ ngo&agrave;i của m&igrave;nh mỗi khi đi ra ngo&agrave;i. Đặc biệt, kết hợp trang phục với c&aacute; phụ kiện thời trang l&agrave; v&ocirc; c&ugrave;ng quan trong. Một đ&ocirc;i gi&agrave;y sẽ gi&uacute;p bạn thể hiện phong c&aacute;ch của ri&ecirc;ng m&igrave;nh. Gi&agrave;y t&acirc;y da nam Zapas l&agrave; sản phẩm đang được ph&aacute;i nam ưa chuộng.</p>

<p>&nbsp;</p>

<p><img alt="image" src="https://lh3.googleusercontent.com/1Wm7SyCTgSkR6qAvjUZG0b8PfsNyTPmW6OsLopG629hvuwsWNIhnwVcXTtqd8ZmxnEwlYZ8l_4vKwpJXbfBUNA_tBc9kufiKi2wk46uD22ndXYuZNCPOJjYfpfmm6cR_nbRLM7qOQOBLfRJtx0Hl3V_4ztzNpdLKuOnZbePOI9a9Vpk0IS00Q_quhIkxmVOKms3FbYLc_9JUBUelZYCp7GnFYUEqmVTGSA6XxCMdBCiHV_2Q_Yw491izPq23pX0beWWsmyzNWEMvlzjcYD7RIG7KeZ4ST2Jqzts1Rr-Y6ZXHnDoEJbZjJTxYZiYxsmMM5tthr_G1nap7zVGB_2P6nh3lbGK91lFOyfFKK8V1dBZgUg8VhGBmxYgv2vKqIasoTUDSSWCgJdzSNesD1OOQ-UTVQrr7mRcWIDHagn_BVJzShFkFmoMunwYjdFvJwQKPdaMgPU1tcq1gqaZ-rVggjjrMu8hOj8f3NwfgzwiVMogHV2h3RPZnUSvrnavEkahXstiZWjgD4042CXcf7l8rkp4SAx8RMhaQyeA-zPyzxdL8JeZFrLp15wo7GUC_LTPbwCPq=s641-no" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>Đặc điểm nổi bật của sản phẩm<br />
- Chất liệu bền đẹp: Được l&agrave;m từ chất liệu t&ocirc;̉ng hợp ch&acirc;́t lượng cao, giày t&acirc;y da nam d&acirc;y lu&ocirc;n mềm mại v&agrave; bền chắc. Do đ&oacute;, bạn sẽ dễ d&agrave;ng bảo quản v&agrave; vệ sinh.</p>

<p><img alt="image" src="https://lh3.googleusercontent.com/_aZ7RmxADDD4BDQhFPrU6syOvA44ZwlUdk5ecUGeoQnGCvflY_Z9yyHB3DK--PX2fEbOd7E8wlG_yysitFnsAK155V8KrShodxYz8UfxYNuAY01p54xP3R4bZH-iAqHSsKEhNq9x7v5efXvsqSqAZasZBEQf1EFYVSiTRWu2KCY0bO0Xna2J2tDn5IZsQPSkx9gbu7A0AG6k1hZPuaxGgi9uh35SMYjyiQYIhh0cAEgjxkMBSfXQivsn9qn4hgOQ9q0lVWOIjWhVZ14PW8ABGFMDV1nsnqGdQDKMswZoGTfdLNPcTKDhcdBBBVzkqAAXIlveFiGf0-k5Pcm1GK0iRZuRQP29DpxCeAp6HVGeGvBz38a5tE29-9ikvrcXfeZ2LoiHGY_2wI_Xs1j59DSdGcKRVqOaf2YevP5KdJn1W0zz4A7mZ9DrzP54LmHM1c-sDN_ncDoZXWdpQjh2E2pD8AVwvIw-ksfc4YRjcTgJniKsz1KbuVRAkirlnaBHRGxJDoNFJQPcr-84U7vnZaNTfYpCVNzruYIRMs7_giXLdUE2mnZtzu5pOo8C-apMtl6va0Jd=s641-no" /></p>

<p>- Thiết kế trẻ trung: Giày t&acirc;y da nam Zapas được thiết kế trẻ trung, kiểu d&aacute;ng h&igrave;nh chữ nhật ngang kết hợp tinh tế giữa n&eacute;t cổ điển v&agrave; hiện đại, tạo n&ecirc;n sự h&agrave;i h&ograve;a tuyệt đối l&agrave;m bạn kh&oacute; c&oacute; thể từ chối được.</p>

<p><img alt="image" src="https://lh3.googleusercontent.com/1YIHSGbXilThChUoYpJTowa28ptlXa_XoKOJ_vPfyiYMHZX26WEZVKTOKlLQ_KbH78BghDkzEk5zrwnSrB1asg2QFIHTTbmBKOHWDONhhzmVR_DTcAsTOnaBSR1_6klyU8evyJ_0Bw4Ro6P3wjorvKjo23NxMGrXI58ddy-pJnpx0pfWyG47LrZeNUwVm_3uVMjidStCXDnGkO2tm3ht2q3HzUxXT3cXy7bws1xKgCmPo1ZwccQWOj-p8vCymJPgAa4oAk2slncjMTQLELuAlcbsVUKa2FyvaMaW3cQkCQ_9LP1SmjouE5ei-E9qDzgfp59Q3YeJcx8j4N4kBexr4yS7SuXUmz_F6hhSvGDK_nb1sNj4oG1nAOGwMLFgYFMyNTilXBTiLQoV1wk6I1gznBZJVokSnyPSVVctGQt4NU72joh_VNVRyriQ0Wa2V40ACTf2BBtPhxGT35QE6a4UpfIYTVOLkikpZtQVj0lIVkOEvjf9YQCOksispaJc7tOM7ZYY_rhDCe61Tf0-AddpORl19Xre0RwAaEqs9z7o58kZ_BU530lizLcIdfGEzj2tr-r7=s641-no" /></p>

<p>- Đường may tỉ mỉ chắc chắn: Với đường may tỉ mỉ v&agrave; tinh tế đảm bảo độ bền chắc trong suốt thời gian bạn sử dụng, giày nam sẽ mang đến cho bạn vẻ đẹp thật c&aacute; t&iacute;nh v&agrave; lịch l&atilde;m.</p>

<p><img alt="image" src="https://lh3.googleusercontent.com/krHSHDiA-NNiA2PTX0hD44RZ9WcM7YAW-SLj1CvhzkH0AvUOcJRvSDBaI8ARRz19L1iR9xGYgtftkLqwG-NDJcf06WhM01nebTyAE5z8W6StBJgO47rCOdyf5t5Ggo7OKb8s5ML41AgIKry2DQEHd5AzPQZ7t3iRctBiPVGREWTf5HR2akciEnCjJhx60Eqf2ekPtkszCHEHNeS-RxxI-1f4oLtdVcPWtUm4quEICJsy0Bvt7IcICH7YvXehWtv6FQ7EETuYUeCRoTy18FSY9X4L3ZZ5GsjjWqdJGkOaNmpsHYLMbtlPe-Cir6Q-uOhq8rpL9f7tNyLYl5Ig7dji0hVuKcWJjAHo-qwA7M3J2XMVKgsg-0aSUINShZFyMMRVLO0V1gWeCbQ0AVImo599C7O6qEpn_3zZ3credOzcywEb74KaB5NBaUCVwIkoN7fv5LfcYz5P7Wc3AhfzPNYFs0W0NHM__dI9pRuaJVcLvCXaYOE1ijPZhJgW6UUM3hAac2LsvmeHZFgJbrTOmJGIIqS8ubJYievJObKRaytcpCj3FHYxtT78vraWdpQu4km6evDl=s641-no" /></p>

<p>- Dễ phối trang phục: Sản phẩm với gam m&agrave;u truy&ecirc;̀n th&ocirc;́ng, kh&ocirc;ng chỉ gi&uacute;p bạn thể hiện phong c&aacute;ch thời trang cực kỳ nam t&iacute;nh v&agrave; lịch l&atilde;m m&agrave; c&ograve;n gi&uacute;p dễ d&agrave;ng khi ph&ocirc;́i c&ugrave;ng nhiều trang phục như: quần jean, &aacute;o thun hay phụ kiện kh&aacute;c để trở n&ecirc;n thật cá tính và thời trang.</p>

<p><img alt="image" src="https://lh3.googleusercontent.com/TC-0tSvVaKGbZzNaqSLABmmwy70fdtfhU5Ai5P3SmzpNu70lK_tO5omMI27Y2hwYdcIogTO4_qYZAw7fOUJ5LVZhMdqAGTMo9K4Pxt9STzRGE-eZLWu27ZA4VbcX5Jni8O2yXDj7VwOCpJFyPdAhuTads5MZHCPjKu9wDZoQoTyGD9XvgFRxcfZmASx7cxsE_83rDjmv5l86uPFPpeSP-flbAvaPllIzW0aWSs2XKDO218E6FDVtp4uAgjaPYn9Iu7YydpmUHbSspwkZzSAblZzI31488zdy9V6hwyN9Q-UT-vPOuv-N_3bW6Vjw47S-d9SukQ_-4T-hLhKKcb5kLjEP06-6UnEoNY2vYzl_JSlqJ3VKAkWhSLjzsNbiAfS0dcFj7cCHNEkuMJLWuXe8pEgftg9w5AkCYAqrmbFj0MqxC7LYfBxRu3rfaslmIjQXVbxAxsR9r0Y8WkHloBRfhlMMR9lBpIgMq4lIFUhFKbmgr7pBBskTXfHCTeqhQh062hq_lFUtoIe-k9ZNKtCs6roj9ATfXonSH66MF2kUf-lPW8EdY7OQ6lRo1VcpHwtPk4v6=s641-no" /></p>
', 12, CAST(0x0000A606004DA279 AS DateTime), CAST(0x0000A61301721487 AS DateTime), 26, 2, 4, 1, 4)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang]) VALUES (9, N'Giày Lười - GU001', N'GU001', N'Giay-Luoi-GU001', N'<ul>
	<li>Sản xuất tại Việt Nam</li>
	<li>Chất liệu da cao cấp</li>
	<li>Loại gi&agrave;y t&acirc;y nam</li>
	<li>Bảo h&agrave;nh 4 th&aacute;ng (bằng phiếu bảo h&agrave;nh)</li>
</ul>
', N'/Data/images/Upload/sanpham/files/fca3ef_simg_b67891_761-761-0-246_cropf_simg_70aaf2_700x700_maxb.jpg', CAST(193000 AS Decimal(18, 0)), NULL, N'<p>Đang cập nhật</p>
', 4, CAST(0x0000A6060051FB46 AS DateTime), NULL, 48, 2, 12, 1, 3)
INSERT [dbo].[SANPHAM] ([ID], [TenSP], [Code], [Metatitle], [MoTaSP], [AnhDaiDien], [Gia], [GiaKhuyenMai], [ChiTietSP], [BaoHanh], [NgayTao], [NgaySuaDoi], [LuotXem], [TrangThai], [IDDanhMuc], [NguoiTao], [IDHang]) VALUES (10, N'Giày Sneakers Vải Sporty1', N'Z1123', N'Giay-Sneakers-Vai-Sporty', N'<p>Cập nhật phong c&aacute;ch đường phố năng động v&agrave; trẻ trung c&ugrave;ng gi&agrave;y sneakers từ thương hiệu ZALORA. Chất liệu vải mềm nhẹ, tạo cảm gi&aacute;c thoải m&aacute;i trong từng bước ch&acirc;n.<br />
<br />
- Chất liệu vải<br />
- Mũi gi&agrave;y tr&ograve;n<br />
- Thiết kế thắt d&acirc;y<br />
- Mặt l&oacute;t in t&ecirc;n thương hiệu</p>
', N'/Data/images/Upload/sanpham/files/zalora-8760-844465-1.jpg', CAST(549000 AS Decimal(18, 0)), NULL, N'<table>
	<tbody>
		<tr>
			<td>SKU (simple)</td>
			<td>AABUOZZ0000089GS</td>
		</tr>
		<tr>
			<td>Chất liệu mặt tr&ecirc;n</td>
			<td>Vải</td>
		</tr>
		<tr>
			<td>Chất liệu mặt trong</td>
			<td>Cao su</td>
		</tr>
		<tr>
			<td>Chất liệu đế</td>
			<td>Cao su</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc</td>
			<td>X&aacute;m</td>
		</tr>
	</tbody>
</table>
', 4, CAST(0x0000A606005FC319 AS DateTime), CAST(0x0000A611014E6556 AS DateTime), 238, 2, 4, 1, 1)
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
/****** Object:  Table [dbo].[MENU]    Script Date: 05/30/2016 11:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MENU](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NULL,
	[IDCha] [int] NULL,
	[Link] [nvarchar](200) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](50) NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_MENU] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MENU] ON
INSERT [dbo].[MENU] ([ID], [Ten], [IDCha], [Link], [NgayTao], [NguoiTao], [TrangThai]) VALUES (1, N'Trang Chủ', 0, N'/', CAST(0x0000A615010EEC60 AS DateTime), N'admin', 2)
INSERT [dbo].[MENU] ([ID], [Ten], [IDCha], [Link], [NgayTao], [NguoiTao], [TrangThai]) VALUES (2, N'Sản Phẩm Mới', 0, N'/Home/DanhSachTatCaSanPhamMoi', CAST(0x0000A615010F1385 AS DateTime), N'admin', 2)
INSERT [dbo].[MENU] ([ID], [Ten], [IDCha], [Link], [NgayTao], [NguoiTao], [TrangThai]) VALUES (3, N'Sản phẩm khuyến mại', 0, N'/Home/DanhSachTatCaSanPhamKhuyenMai', CAST(0x0000A615010F204D AS DateTime), N'Đang cập nhật', 2)
INSERT [dbo].[MENU] ([ID], [Ten], [IDCha], [Link], [NgayTao], [NguoiTao], [TrangThai]) VALUES (4, N'Đăng Nhập', 0, N'/Admin/Login', CAST(0x0000A615010F4067 AS DateTime), N'admin', 2)
SET IDENTITY_INSERT [dbo].[MENU] OFF
/****** Object:  Table [dbo].[HANG]    Script Date: 05/30/2016 11:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HANG](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TenHang] [nvarchar](50) NULL,
	[ThongTinHang] [ntext] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_HANG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[HANG] ON
INSERT [dbo].[HANG] ([ID], [TenHang], [ThongTinHang], [TrangThai]) VALUES (1, N'ADIDAS', N'Đang cập nhật', 2)
INSERT [dbo].[HANG] ([ID], [TenHang], [ThongTinHang], [TrangThai]) VALUES (2, N'CONVERSE', N'Đang cập nhật', 2)
INSERT [dbo].[HANG] ([ID], [TenHang], [ThongTinHang], [TrangThai]) VALUES (3, N'ZALORA ', N'Đang cập nhật', 2)
INSERT [dbo].[HANG] ([ID], [TenHang], [ThongTinHang], [TrangThai]) VALUES (4, N'KHÁC', N'Đang cập nhật', 2)
SET IDENTITY_INSERT [dbo].[HANG] OFF
/****** Object:  Table [dbo].[DONHANG]    Script Date: 05/30/2016 11:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONHANG](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[NgayTao] [datetime] NULL,
	[TenKhachHang] [nvarchar](100) NULL,
	[DienThoaiKhachHang] [nvarchar](50) NULL,
	[DiaChiKhachHang] [nvarchar](200) NULL,
	[EmailKhachHang] [nvarchar](50) NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_DONHANG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DONHANG] ON
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai]) VALUES (3, CAST(0x0000A60D000FB3A5 AS DateTime), N'Nguyễn Anh Ngọc', N'01679323297', N'Hưng Yên', N'ngocngocnghech@gmail.com', 0)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai]) VALUES (4, CAST(0x0000A60D0013A60B AS DateTime), N'hiếu1', N'01679323297', N'Khoái Châu - Hưng Yên ', N'hieutk10@gmail.com', 2)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai]) VALUES (5, CAST(0x0000A60D00152FE4 AS DateTime), N'Nguyễn Văn Hậu', N'01245352652', N'Kim Động - Hưng Yên', N'hautk10@gmail.com', 2)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai]) VALUES (9, CAST(0x0000A61000E1F1C6 AS DateTime), N'hiếu', N'01679323297', N'Kim Động - Hưng Yên', N'hieutk10@gmail.com', 0)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai]) VALUES (10, CAST(0x0000A614009EA4E5 AS DateTime), N'Nguyễn Anh Ngọc1', N'123', N'123', N'123', 2)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai]) VALUES (11, CAST(0x0000A614017F4278 AS DateTime), N'Nguyễn xx', N'01678929392', N'Hưng yên', N'hieutk10@gmail.com', 0)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai]) VALUES (12, CAST(0x0000A6140186B5D6 AS DateTime), N'test 1 ', N'01245352652', N'Lào Cai', N'claskdj@gmail.com', 0)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai]) VALUES (13, CAST(0x0000A61500C7A61B AS DateTime), N'Đỗ Văn Đức', N'01245352654', N'Hà Nam', N'ducdv@gmail.com', -1)
INSERT [dbo].[DONHANG] ([ID], [NgayTao], [TenKhachHang], [DienThoaiKhachHang], [DiaChiKhachHang], [EmailKhachHang], [TrangThai]) VALUES (14, CAST(0x0000A61500CCA699 AS DateTime), N'Đoàn Văn Thắng', N'01245352654', N'Hồ Chí Minh', N'thangdv@gm', 1)
SET IDENTITY_INSERT [dbo].[DONHANG] OFF
/****** Object:  Table [dbo].[DANHMUCSANPHAM]    Script Date: 05/30/2016 11:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHMUCSANPHAM](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NULL,
	[Metatitle] [nvarchar](150) NULL,
	[IDCha] [int] NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](50) NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_DANHMUCSANPHAM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DANHMUCSANPHAM] ON
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (1, N'GIÀY NAM', N'giay-nam', 0, NULL, N'Đang cập nhật', 2)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (2, N'GIÀY NỮ', N'giay-nu', 0, NULL, N'Đang cập nhật', 2)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (4, N'GIÀY DA NAM', N'giay-da-nam', 1, NULL, N'Đang cập nhật', 2)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (5, N'GIÀY DA NỮ', N'giay-da-nu', 2, NULL, N'Đang cập nhật', 2)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (6, N'GIÀY THỂ THAO NAM', N'giay-the-thao-nam', 1, NULL, N'Đang cập nhật', 2)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (7, N'GIÀY THỂ THAO NỮ', N'giay-the-thao-nu', 2, NULL, N'Đang cập nhật', 2)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (8, N'GIÀY TRẺ EM', N'giay-tre-em', 0, NULL, N'Đang cập nhật', 2)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (9, N'GIÀY VẢI TRẺ EM', N'giay-vai-tre-em', 8, CAST(0x0000A6050173322D AS DateTime), N'Đang cập nhật', 2)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (10, N'GIÀY CAO GÓT NỮ', N'giay-cao-got-nu', 2, CAST(0x0000A6050176A4B0 AS DateTime), N'Đang cập nhật', 2)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (11, N'KHÁC', N'khac', 99999, CAST(0x0000A6050177CD44 AS DateTime), N'Đang cập nhật', 2)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (12, N'GIÀY VẢI NAM', N'giay-vai-nam', 1, CAST(0x0000A6050179B915 AS DateTime), N'Đang cập nhật', 2)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (13, N'GIÀY VẢI NỮ', N'giay-vai-nu', 2, CAST(0x0000A6050179C8DF AS DateTime), N'Đang cập nhật', 2)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (14, N'GIÀY LƯỜI TRẺ EM', N'giay-luoi-tre-em', 8, CAST(0x0000A6060025D541 AS DateTime), N'Đang cập nhật', 2)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (16, N'TEST', N'TEST', 0, CAST(0x0000A6140007C4CF AS DateTime), NULL, 0)
INSERT [dbo].[DANHMUCSANPHAM] ([ID], [TenDanhMuc], [Metatitle], [IDCha], [NgayTao], [NguoiTao], [TrangThai]) VALUES (17, N'Danh mục test', N'Danh-muc-test', 0, CAST(0x0000A61600ADFBC4 AS DateTime), N'admin', 0)
SET IDENTITY_INSERT [dbo].[DANHMUCSANPHAM] OFF
/****** Object:  Table [dbo].[COGIAY]    Script Date: 05/30/2016 11:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COGIAY](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDSP] [bigint] NULL,
	[Co] [int] NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_CO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[COGIAY] ON
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (1, 3, 38, 100)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (2, 3, 39, 100)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (3, 3, 40, 100)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (4, 5, 38, 100)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (5, 5, 39, 100)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (6, 5, 40, 10)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (7, 6, 38, 100)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (8, 6, 39, 100)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (9, 7, 38, 99)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (10, 7, 39, 100)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (11, 7, 40, 30)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (12, 7, 41, 36)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (13, 8, 42, 8)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (14, 9, 38, 20)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (15, 9, 39, 27)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (16, 10, 40, 10)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (17, 10, 41, 10)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (18, 10, 42, 9)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (19, 10, 43, 10)
INSERT [dbo].[COGIAY] ([ID], [IDSP], [Co], [SoLuong]) VALUES (20, 10, 44, 10)
SET IDENTITY_INSERT [dbo].[COGIAY] OFF
/****** Object:  Table [dbo].[CHITIETDONHANG]    Script Date: 05/30/2016 11:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDONHANG](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDCo] [bigint] NULL,
	[IDDonHang] [bigint] NULL,
	[SoLuong] [int] NULL,
	[Gia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_CHITIETDONHANG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CHITIETDONHANG] ON
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia]) VALUES (3, 16, 3, 2, CAST(1098000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia]) VALUES (4, 18, 4, 1, CAST(549000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia]) VALUES (5, 13, 5, 2, CAST(700000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia]) VALUES (6, 15, 5, 3, CAST(579000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia]) VALUES (8, 16, 7, 1, CAST(549000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia]) VALUES (9, 14, 8, 4, CAST(772000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia]) VALUES (10, 5, 9, 3, CAST(891000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia]) VALUES (11, 5, 10, 1, CAST(297000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia]) VALUES (12, 14, 11, 1, CAST(193000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia]) VALUES (13, 16, 12, 2, CAST(1098000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia]) VALUES (14, 16, 13, 1, CAST(549000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia]) VALUES (15, 14, 13, 1, CAST(193000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia]) VALUES (16, 18, 13, 1, CAST(549000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONHANG] ([ID], [IDCo], [IDDonHang], [SoLuong], [Gia]) VALUES (17, 9, 14, 1, CAST(640000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[CHITIETDONHANG] OFF
/****** Object:  Default [DF_TAIKHOAN_QuyenHan]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[TAIKHOAN] ADD  CONSTRAINT [DF_TAIKHOAN_QuyenHan]  DEFAULT ((0)) FOR [QuyenHan]
GO
/****** Object:  Default [DF_TAIKHOAN_NgayTao]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[TAIKHOAN] ADD  CONSTRAINT [DF_TAIKHOAN_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
/****** Object:  Default [DF_TAIKHOAN_TrangThai]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[TAIKHOAN] ADD  CONSTRAINT [DF_TAIKHOAN_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
/****** Object:  Default [DF_SLIDE_NgayTao]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[SLIDE] ADD  CONSTRAINT [DF_SLIDE_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
/****** Object:  Default [DF_SLIDE_TrangThai]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[SLIDE] ADD  CONSTRAINT [DF_SLIDE_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
/****** Object:  Default [DF_SANPHAM_MoTaSP]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[SANPHAM] ADD  CONSTRAINT [DF_SANPHAM_MoTaSP]  DEFAULT (N'Đang cập nhật') FOR [MoTaSP]
GO
/****** Object:  Default [DF_SANPHAM_ChiTietSP]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[SANPHAM] ADD  CONSTRAINT [DF_SANPHAM_ChiTietSP]  DEFAULT (N'Đang cập nhật') FOR [ChiTietSP]
GO
/****** Object:  Default [DF_SANPHAM_NgayTao]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[SANPHAM] ADD  CONSTRAINT [DF_SANPHAM_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
/****** Object:  Default [DF_SANPHAM_LuotXem]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[SANPHAM] ADD  CONSTRAINT [DF_SANPHAM_LuotXem]  DEFAULT ((0)) FOR [LuotXem]
GO
/****** Object:  Default [DF_SANPHAM_TrangThai]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[SANPHAM] ADD  CONSTRAINT [DF_SANPHAM_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
/****** Object:  Default [DF_MENU_Ten]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[MENU] ADD  CONSTRAINT [DF_MENU_Ten]  DEFAULT (N'Đang cập nhật') FOR [Ten]
GO
/****** Object:  Default [DF_MENU_IDCha]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[MENU] ADD  CONSTRAINT [DF_MENU_IDCha]  DEFAULT ((0)) FOR [IDCha]
GO
/****** Object:  Default [DF_MENU_Link]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[MENU] ADD  CONSTRAINT [DF_MENU_Link]  DEFAULT (N'#') FOR [Link]
GO
/****** Object:  Default [DF_MENU_NgayTao]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[MENU] ADD  CONSTRAINT [DF_MENU_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
/****** Object:  Default [DF_MENU_NguoiTao]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[MENU] ADD  CONSTRAINT [DF_MENU_NguoiTao]  DEFAULT (N'Đang cập nhật') FOR [NguoiTao]
GO
/****** Object:  Default [DF_MENU_TrangThai]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[MENU] ADD  CONSTRAINT [DF_MENU_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
/****** Object:  Default [DF_HANG_ThongTinHang]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[HANG] ADD  CONSTRAINT [DF_HANG_ThongTinHang]  DEFAULT (N'Đang cập nhật') FOR [ThongTinHang]
GO
/****** Object:  Default [DF_HANG_TrangThai]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[HANG] ADD  CONSTRAINT [DF_HANG_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
/****** Object:  Default [DF_DONHANG_NgayTao]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[DONHANG] ADD  CONSTRAINT [DF_DONHANG_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
/****** Object:  Default [DF_DONHANG_TenKhachHang]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[DONHANG] ADD  CONSTRAINT [DF_DONHANG_TenKhachHang]  DEFAULT (N'Đang cập nhật') FOR [TenKhachHang]
GO
/****** Object:  Default [DF_DONHANG_TrangThai]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[DONHANG] ADD  CONSTRAINT [DF_DONHANG_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
/****** Object:  Default [DF_DANHMUCSANPHAM_TenDanhMuc]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[DANHMUCSANPHAM] ADD  CONSTRAINT [DF_DANHMUCSANPHAM_TenDanhMuc]  DEFAULT (N'Đang cập nhật') FOR [TenDanhMuc]
GO
/****** Object:  Default [DF_DANHMUCSANPHAM_IDCha]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[DANHMUCSANPHAM] ADD  CONSTRAINT [DF_DANHMUCSANPHAM_IDCha]  DEFAULT ((0)) FOR [IDCha]
GO
/****** Object:  Default [DF_DANHMUCSANPHAM_NgayTao]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[DANHMUCSANPHAM] ADD  CONSTRAINT [DF_DANHMUCSANPHAM_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
/****** Object:  Default [DF_DANHMUCSANPHAM_NguoiTao]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[DANHMUCSANPHAM] ADD  CONSTRAINT [DF_DANHMUCSANPHAM_NguoiTao]  DEFAULT (N'Đang cập nhật') FOR [NguoiTao]
GO
/****** Object:  Default [DF_DANHMUCSANPHAM_TrangThai]    Script Date: 05/30/2016 11:14:40 ******/
ALTER TABLE [dbo].[DANHMUCSANPHAM] ADD  CONSTRAINT [DF_DANHMUCSANPHAM_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
