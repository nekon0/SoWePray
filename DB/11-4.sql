USE [master]
GO
/****** Object:  Database [BOOKIE]    Script Date: 11/4/2022 2:25:57 PM ******/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'BOOKIE')
BEGIN
	ALTER DATABASE [BOOKIE] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [BOOKIE] SET ONLINE;
	DROP DATABASE [BOOKIE];
END
GO
CREATE DATABASE [BOOKIE]
GO
ALTER DATABASE [BOOKIE] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BOOKIE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BOOKIE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BOOKIE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BOOKIE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BOOKIE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BOOKIE] SET ARITHABORT OFF 
GO
ALTER DATABASE [BOOKIE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BOOKIE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BOOKIE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BOOKIE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BOOKIE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BOOKIE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BOOKIE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BOOKIE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BOOKIE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BOOKIE] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BOOKIE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BOOKIE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BOOKIE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BOOKIE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BOOKIE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BOOKIE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BOOKIE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BOOKIE] SET RECOVERY FULL 
GO
ALTER DATABASE [BOOKIE] SET  MULTI_USER 
GO
ALTER DATABASE [BOOKIE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BOOKIE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BOOKIE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BOOKIE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BOOKIE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BOOKIE] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BOOKIE', N'ON'
GO
ALTER DATABASE [BOOKIE] SET QUERY_STORE = OFF
GO
USE [BOOKIE]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 11/4/2022 2:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[name] [nvarchar](50) NULL,
	[date] [date] NULL,
 CONSTRAINT [PK_author] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 11/4/2022 2:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[authorId] [int] NULL,
	[rating] [decimal](10, 2) NULL,
	[favourite] [int] NULL,
	[price] [decimal](10, 2) NULL,
	[is_sale] [bit] NULL,
	[image] [varchar](4000) NULL,
	[description] [nvarchar](4000) NULL,
	[views] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_book] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book_Own]    Script Date: 11/4/2022 2:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Own](
	[userId] [int] NOT NULL,
	[bookId] [int] NOT NULL,
	[recentTime] [datetime] NULL,
	[recentChapterId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/4/2022 2:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryBook]    Script Date: 11/4/2022 2:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryBook](
	[bookId] [int] NOT NULL,
	[categoryId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chapter]    Script Date: 11/4/2022 2:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chapter](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[volumeId] [int] NOT NULL,
	[no] [int] NOT NULL,
	[title] [nvarchar](100) NULL,
	[status] [bit] NOT NULL,
	[content] [ntext] NOT NULL,
 CONSTRAINT [PK_chapter] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 11/4/2022 2:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bookId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[comment] [nvarchar](2000) NOT NULL,
	[sonOf] [int] NULL,
	[replyTo] [int] NULL,
	[createdAt] [datetime] NOT NULL,
	[editedAt] [datetime] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favourite]    Script Date: 11/4/2022 2:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favourite](
	[uid] [int] NOT NULL,
	[bid] [int] NOT NULL,
 CONSTRAINT [PK_favourite] PRIMARY KEY CLUSTERED 
(
	[uid] ASC,
	[bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment_Account]    Script Date: 11/4/2022 2:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_Account](
	[accountNumber] [bigint] NOT NULL,
	[balance] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Payment_Account] PRIMARY KEY CLUSTERED 
(
	[accountNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment_Method]    Script Date: 11/4/2022 2:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_Method](
	[paymentId] [int] IDENTITY(45678,3) NOT NULL,
	[userId] [int] NOT NULL,
	[accountNumber] [bigint] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_Payment_Method] PRIMARY KEY CLUSTERED 
(
	[paymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/4/2022 2:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productId] [varchar](30) NOT NULL,
	[bookId] [int] NOT NULL,
	[chapterId] [int] NULL,
	[price] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Own]    Script Date: 11/4/2022 2:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Own](
	[userId] [int] NOT NULL,
	[productId] [varchar](30) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 11/4/2022 2:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reportType] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[objectId] [int] NULL,
	[note] [nvarchar](2000) NULL,
	[sent] [datetime] NOT NULL,
	[received] [datetime] NULL,
	[status] [bit] NULL,
	[action] [nvarchar](2000) NULL,
 CONSTRAINT [PK_reportdetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report_Violation]    Script Date: 11/4/2022 2:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report_Violation](
	[reportId] [int] NOT NULL,
	[violationId] [int] NOT NULL,
 CONSTRAINT [PK_Report_Violation] PRIMARY KEY CLUSTERED 
(
	[reportId] ASC,
	[violationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Star]    Script Date: 11/4/2022 2:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Star](
	[bid] [int] NOT NULL,
	[uid] [int] NOT NULL,
	[star] [int] NOT NULL,
 CONSTRAINT [PK_star] PRIMARY KEY CLUSTERED 
(
	[uid] ASC,
	[bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Token]    Script Date: 11/4/2022 2:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Token](
	[userId] [int] NOT NULL,
	[token] [varchar](20) NOT NULL,
	[expiredDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 11/4/2022 2:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[transactionId] [bigint] IDENTITY(3000000,1) NOT NULL,
	[userId] [int] NOT NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[balanceAfter] [decimal](10, 2) NOT NULL,
	[transactionTime] [datetime] NULL,
	[type] [int] NOT NULL,
	[status] [int] NOT NULL,
	[description] [nvarchar](500) NULL,
	[productID] [varchar](30) NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[transactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/4/2022 2:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[gender] [bit] NULL,
	[dob] [date] NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](11) NULL,
	[address] [nvarchar](200) NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[is_super] [int] NOT NULL,
	[walletNumber] [bigint] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Violation]    Script Date: 11/4/2022 2:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Violation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reportType] [int] NOT NULL,
	[title] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_report] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Volume]    Script Date: 11/4/2022 2:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Volume](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bookId] [int] NOT NULL,
	[no] [int] NOT NULL,
	[title] [nvarchar](100) NULL,
	[summary] [nvarchar](2000) NULL,
 CONSTRAINT [PK_vol] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Author] ON 
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (1, NULL, N'Gillian Flynn', CAST(N'2021-01-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (2, NULL, N'Agatha Christie', CAST(N'2021-01-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (3, NULL, N'Alex Michaelides', CAST(N'2021-01-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (4, NULL, N'Paula Hawkins', CAST(N'2021-01-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (5, NULL, N'Cuttlefish That Loves Diving', CAST(N'2021-01-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (6, NULL, N'Stephen King', CAST(N'2021-01-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (7, NULL, N'George RR Martin', CAST(N'2021-01-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (8, NULL, N'Suzanne Collins', CAST(N'2021-01-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (9, NULL, N'H.G. Wells, Greg Bear', CAST(N'2021-01-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (10, NULL, N'Diana Gabaldon', CAST(N'2021-01-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (11, NULL, N'Anthony Doerr', CAST(N'2021-02-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (12, NULL, N'Hiromu Arakawa', CAST(N'2021-02-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (13, NULL, N'Tsugumi Ohba', CAST(N'2021-02-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (14, NULL, N'Eiichiro Oda', CAST(N'2021-02-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (15, NULL, N'Syougo Kinugasa', CAST(N'2021-02-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (16, 2, N'Vinh Nguyen', CAST(N'2021-03-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (17, 3, N'Ivory Marcel', CAST(N'2021-03-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (18, 4, N'Mary Barisol', CAST(N'2021-03-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (19, 5, N'Eden Frost', CAST(N'2021-03-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (20, 6, N'Benidict Robinett', CAST(N'2021-03-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (21, 7, N'Zera Farmer', CAST(N'2021-03-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (22, 8, N'Ceil Howell', CAST(N'2021-03-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (23, 9, N'Taylor Marcel', CAST(N'2021-03-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (24, 10, N'Wisley Ray', CAST(N'2021-03-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (25, 11, N'Aiken Pope', CAST(N'2021-03-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (26, 12, N'Rodolphe Blossom', CAST(N'2021-03-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (27, 13, N'Alex Rogze', CAST(N'2021-03-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (28, 14, N'Jean Padilla', CAST(N'2021-03-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (29, 15, N'Dana Franklin', CAST(N'2021-04-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (30, 16, N'Elluka Bush', CAST(N'2021-04-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (31, 17, N'Kenelm Binder', CAST(N'2021-04-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (32, 18, N'Narcissus Freezis', CAST(N'2021-04-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (33, 19, N'Michelle Reynolds', CAST(N'2021-04-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (34, 20, N'Callie Banica', CAST(N'2021-04-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (35, 21, N'Malceria Freezis', CAST(N'2021-04-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (36, 22, N'Jasmine Shepard', CAST(N'2021-04-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (37, 23, N'Mia Franklin', CAST(N'2021-04-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (38, 24, N'Schick Reyes', CAST(N'2021-06-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (39, 25, N'Allen Reese', CAST(N'2021-06-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (40, 26, N'Elman Baxter', CAST(N'2021-06-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (41, 27, N'Willard Jordan', CAST(N'2021-06-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (42, 28, N'Winona Walton', CAST(N'2021-06-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (43, 29, N'Sophia Knight', CAST(N'2021-06-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (44, 30, N'Hank Wade', CAST(N'2021-06-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (45, 31, N'Mia Dinwiddie', CAST(N'2021-06-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (46, 32, N'Ronald Chandler', CAST(N'2021-06-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (47, 33, N'Elluka Ackerman', CAST(N'2021-06-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (48, 34, N'Jude Gilbert', CAST(N'2021-08-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (49, 35, N'Philbert Schultz', CAST(N'2021-08-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (50, 36, N'Lamia Fowler', CAST(N'2021-08-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (51, 37, N'Gererd Pope', CAST(N'2021-08-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (52, 38, N'Thetal Shepard', CAST(N'2021-08-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (53, 39, N'Yocaski Blossom', CAST(N'2021-08-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (54, 40, N'Danielle Hodges', CAST(N'2021-08-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (55, 41, N'Darlene Feron', CAST(N'2021-10-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (56, 42, N'Hadden Chandler', CAST(N'2021-10-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (57, 43, N'Sateriasis Hardy', CAST(N'2021-10-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (58, 44, N'Mia Carpenter', CAST(N'2021-10-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (59, 45, N'Kit Nerune', CAST(N'2021-10-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (60, 46, N'Rodolphe Frost', CAST(N'2021-10-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (61, 47, N'Jesse Watts', CAST(N'2021-10-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (62, 48, N'Carl Crawford', CAST(N'2021-12-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (63, 49, N'Ronald Robinett', CAST(N'2021-12-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (64, 50, N'Zera Stanley', CAST(N'2021-12-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (65, 51, N'Harley Avadonia', CAST(N'2021-12-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (66, 52, N'Butglar Gray', CAST(N'2021-12-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (67, 53, N'Joe Baxter', CAST(N'2022-01-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (68, 54, N'Ward Wagner', CAST(N'2022-01-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (69, 55, N'Charlie Reese', CAST(N'2022-01-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (70, 56, N'Windsor Dinwiddie', CAST(N'2022-01-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (71, 57, N'Charon Walton', CAST(N'2022-01-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (72, 58, N'Hank Michaelis', CAST(N'2022-02-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (73, 59, N'Seth Manning', CAST(N'2022-02-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (74, 60, N'Seth Manning', CAST(N'2022-02-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (75, 61, N'Light Jenning', CAST(N'2022-02-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (76, 62, N'David Barisol', CAST(N'2022-03-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (77, 63, N'Michaela Kelley', CAST(N'2022-04-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (78, 64, N'Melody Elphen', CAST(N'2022-04-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (79, 65, N'Elluka Norman', CAST(N'2022-04-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (80, 66, N'Strange Feron', CAST(N'2022-04-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (81, 67, N'Taylor Valdez', CAST(N'2022-05-15' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (82, 68, N'Dana Macy', CAST(N'2022-06-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (83, 69, N'Jean Valdez', CAST(N'2022-06-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (84, 70, N'Minis Goodwin', CAST(N'2022-06-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (85, 71, N'Clay Marlon', CAST(N'2022-06-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (86, 72, N'Phil Powers', CAST(N'2022-06-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (87, 73, N'Butglar Hardy', CAST(N'2022-06-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (88, 74, N'Camelia Mullins', CAST(N'2022-07-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (89, 75, N'Lionel Stanley', CAST(N'2022-07-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (90, 76, N'Linda Payne', CAST(N'2022-07-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (91, 77, N'Philbert Cross', CAST(N'2022-07-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (92, 78, N'Phil Jordan', CAST(N'2022-07-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (93, 79, N'Robert Kissos', CAST(N'2022-07-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (94, 80, N'Ronald Rios', CAST(N'2022-07-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (95, 81, N'Elluka Manning', CAST(N'2022-07-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (96, 82, N'Ceil Payne', CAST(N'2022-07-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (97, 83, N'Lizzy Meld', CAST(N'2022-07-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (98, 84, N'Camelia Miller', CAST(N'2022-07-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (99, 85, N'Diana Macy', CAST(N'2022-07-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (100, 86, N'Windsor Badman', CAST(N'2022-07-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (101, 87, N'Diana Obrien', CAST(N'2022-07-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (102, 88, N'Adam Hodges', CAST(N'2022-07-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (103, 89, N'Hansel May', CAST(N'2022-07-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (104, 90, N'Oswald Pope', CAST(N'2022-07-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (105, 91, N'Alex Hardy', CAST(N'2022-07-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (106, 92, N'Butglar Michaelis', CAST(N'2022-08-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (107, 93, N'Elman Blair', CAST(N'2022-08-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (108, 94, N'Lucifer Blair', CAST(N'2022-08-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (109, 95, N'Philbert Phantomhive', CAST(N'2022-08-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (110, 96, N'Albion Alexdander', CAST(N'2022-08-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (111, 97, N'Melody Chandler', CAST(N'2022-08-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (112, 98, N'Katya Corbyn', CAST(N'2022-09-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (113, 99, N'Rahab Octo', CAST(N'2022-09-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (114, 100, N'Hansel May', CAST(N'2022-09-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (115, 101, N'Luke Thayne', CAST(N'2022-09-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (116, 102, N'Cyril Watson', CAST(N'2022-09-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (117, 109, N'I Am Tester', CAST(N'2022-09-05' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (118, 110, N'Test Author', CAST(N'2022-10-20' AS Date))
GO
INSERT [dbo].[Author] ([id], [userId], [name], [date]) VALUES (119, 111, N'Thanh Hien', CAST(N'2022-10-20' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (1, N'Gone Girl ', 1, NULL, 0, CAST(11.99 AS Decimal(10, 2)), 1, N'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1554086139l/19288043.jpg', N'Marriage can be a real killer.<br>
On a warm summer morning in North Carthage, Missouri, it is Nick and Amy Dunne???s fifth wedding anniversary. Presents are being wrapped and reservations are being made when Nick???s clever and beautiful wife disappears from their rented McMansion on the Mississippi River. Husband-of-the-Year Nick isn???t doing himself any favors with cringe-worthy daydreams about the slope and shape of his wife???s head, but passages from Amy''s diary reveal the alpha-girl perfectionist could have put anyone dangerously on edge. Under mounting pressure from the police and the media???as well as Amy???s fiercely doting parents???the town golden boy parades an endless series of lies, deceits, and inappropriate behavior. Nick is oddly evasive, and he???s definitely bitter???but is he really a killer?<br>
As the cops close in, every couple in town is soon wondering how well they know the one that they love. With his twin sister, Margo, at his side, Nick stands by his innocence. Trouble is, if Nick didn???t do it, where is that beautiful wife? And what was in that silvery gift box hidden in the back of her bedroom closet?', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (2, N'And Then There Were None', 2, NULL, 0, CAST(12.99 AS Decimal(10, 2)), 0, N'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1638425885l/16299._SY475_.jpg', N'First, there were ten???a curious assortment of strangers summoned as weekend guests to a little private island off the coast of Devon. Their host, an eccentric millionaire unknown to all of them, is nowhere to be found. All that the guests have in common is a wicked past they''re unwilling to reveal???and a secret that will seal their fate. For each has been marked for murder. A famous nursery rhyme is framed and hung in every room of the mansion:<br>
"Ten little boys went out to dine; One choked his little self and then there were nine. Nine little boys sat up very late; One overslept himself and then there were eight. Eight little boys traveling in Devon; One said he''d stay there then there were seven. Seven little boys chopping up sticks; One chopped himself in half and then there were six. Six little boys playing with a hive; A bumblebee stung one and then there were five. Five little boys going in for law; One got in Chancery and then there were four. Four little boys going out to sea; A red herring swallowed one and then there were three. Three little boys walking in the zoo; A big bear hugged one and then there were two. Two little boys sitting in the sun; One got frizzled up and then there was one. One little boy left all alone; He went out and hanged himself and then there were none."<br>
When they realize that murders are occurring as described in the rhyme, terror mounts. One by one they fall prey. Before the weekend is out, there will be none. Who has choreographed this dastardly scheme? And who will be left to tell the tale? Only the dead are above suspicion.', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (3, N'The Silent Patient', 3, NULL, 0, CAST(10.50 AS Decimal(10, 2)), 0, N'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1582759969l/40097951._SX318_.jpg', N'Alicia Berenson???s life is seemingly perfect. A famous painter married to an in-demand fashion photographer, she lives in a grand house with big windows overlooking a park in one of London???s most desirable areas. One evening her husband Gabriel returns home late from a fashion shoot, and Alicia shoots him five times in the face, and then never speaks another word.<br>
Alicia???s refusal to talk, or give any kind of explanation, turns a domestic tragedy into something far grander, a mystery that captures the public imagination and casts Alicia into notoriety. The price of her art skyrockets, and she, the silent patient, is hidden away from the tabloids and spotlight at the Grove, a secure forensic unit in North London.<br>
Theo Faber is a criminal psychotherapist who has waited a long time for the opportunity to work with Alicia. His determination to get her to talk and unravel the mystery of why she shot her husband takes him down a twisting path into his own motivations???a search for the truth that threatens to consume him....', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (4, N'The Girl on the Train', 4, NULL, 0, CAST(13.99 AS Decimal(10, 2)), 0, N'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1574805682l/22557272.jpg', N'Rachel catches the same commuter train every morning. She knows it will wait at the same signal each time, overlooking a row of back gardens. She???s even started to feel like she knows the people who live in one of the houses. ???Jess and Jason,??? she calls them. Their life???as she sees it???is perfect. If only Rachel could be that happy. And then she sees something shocking. It???s only a minute until the train moves on, but it???s enough. Now everything???s changed. Now Rachel has a chance to become a part of the lives she???s only watched from afar. Now they???ll see; she???s much more than just the girl on the train...', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (5, N'Lord of the Mysteries', 5, NULL, 0, CAST(11.99 AS Decimal(10, 2)), 1, N'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1598845986l/55176693._SX318_.jpg', N'Waking up to be faced with a string of mysteries, Zhou Mingrui finds himself reincarnated as Klein Moretti in an alternate Victorian era world where he sees a world filled with machinery, cannons, dreadnoughts, airships, difference machines, as well as Potions, Divination, Hexes, Tarot Cards, Sealed Artifacts??? The Light continues to shine but the mystery has never gone far. Follow Klein as he finds himself entangled with the Churches of the world???both orthodox and unorthodox???while he slowly develops newfound powers thanks to the Beyonder potions.', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (6, N'The Shining', 6, NULL, 0, CAST(12.99 AS Decimal(10, 2)), 0, N'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1353277730l/11588.jpg', N'Jack Torrance''s new job at the Overlook Hotel is the perfect chance for a fresh start. As the off-season caretaker at the atmospheric old hotel, he''ll have plenty of time to spend reconnecting with his family and working on his writing. But as the harsh winter weather sets in, the idyllic location feels ever more remote...and more sinister. And the only one to notice the strange and terrible forces gathering around the Overlook is Danny Torrance, a uniquely gifted five-year-old.', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (7, N'It', 6, NULL, 0, CAST(10.50 AS Decimal(10, 2)), 0, N'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1334416842l/830502.jpg', N'Welcome to Derry, Maine ...<br>
It???s a small city, a place as hauntingly familiar as your own hometown. Only in Derry the haunting is real ...<br>
They were seven teenagers when they first stumbled upon the horror. Now they are grown-up men and women who have gone out into the big world to gain success and happiness. But none of them can withstand the force that has drawn them back to Derry to face the nightmare without an end, and the evil without a name.', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (8, N'A Game Of Thrones: A Song of Ice and Fire', 7, NULL, 0, CAST(13.99 AS Decimal(10, 2)), 0, N'https://m.media-amazon.com/images/P/0553386794.01._SCLZZZZZZZ_SX500_.jpg', N'Long ago, in a time forgotten, a preternatural event threw the seasons out of balance. In a land where summers can last decades and winters a lifetime, trouble is brewing. The cold is returning, and in the frozen wastes to the north of Winterfell, sinister and supernatural forces are massing beyond the kingdom???s protective Wall. At the center of the conflict lie the Starks of Winterfell, a family as harsh and unyielding as the land they were born to. Sweeping from a land of brutal cold to a distant summertime kingdom of epicurean plenty, here is a tale of lords and ladies, soldiers and sorcerers, assassins and bastards, who come together in a time of grim omens.
<br>
Here an enigmatic band of warriors bear swords of no human metal; a tribe of fierce wildlings carry men off into madness; a cruel young dragon prince barters his sister to win back his throne; and a determined woman undertakes the most treacherous of journeys. Amid plots and counterplots, tragedy and betrayal, victory and terror, the fate of the Starks, their allies, and their enemies hangs perilously in the balance, as each endeavors to win that deadliest of conflicts: the game of thrones.', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (9, N'The Hunger Games', 8, NULL, 0, CAST(15.00 AS Decimal(10, 2)), 0, N'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1586722975l/2767052.jpg', N'Could you survive on your own in the wild, with every one out to make sure you don''t live to see the morning?
<br>
In the ruins of a place once known as North America lies the nation of Panem, a shining Capitol surrounded by twelve outlying districts. The Capitol is harsh and cruel and keeps the districts in line by forcing them all to send one boy and one girl between the ages of twelve and eighteen to participate in the annual Hunger Games, a fight to the death on live TV.
<br>
Sixteen-year-old Katniss Everdeen, who lives alone with her mother and younger sister, regards it as a death sentence when she steps forward to take her sister''s place in the Games. But Katniss has been close to dead before???and survival, for her, is second nature. Without really meaning to, she becomes a contender. But if she is to win, she will have to start making choices that weight survival against humanity and life against love.', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (10, N'The Time Machine', 9, NULL, 0, CAST(12.50 AS Decimal(10, 2)), 0, N'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1327942880l/2493.jpg', N'???I???ve had a most amazing time....???<br>
So begins the Time Traveller???s astonishing firsthand account of his journey 800,000 years beyond his own era???and the story that launched H.G. Wells???s successful career and earned him his reputation as the father of science fiction. With a speculative leap that still fires the imagination, Wells sends his brave explorer to face a future burdened with our greatest hopes...and our darkest fears. A pull of the Time Machine???s lever propels him to the age of a slowly dying Earth.  There he discovers two bizarre races???the ethereal Eloi and the subterranean Morlocks???who not only symbolize the duality of human nature, but offer a terrifying portrait of the men of tomorrow as well.  Published in 1895, this masterpiece of invention captivated readers on the threshold of a new century.', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (11, N'Outlander', 10, NULL, 0, CAST(13.99 AS Decimal(10, 2)), 0, N'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1529065012l/10964._SY475_.jpg', N'The year is 1945. Claire Randall, a former combat nurse, is just back from the war and reunited with her husband on a second honeymoon when she walks through a standing stone in one of the ancient circles that dot the British Isles. Suddenly she is a Sassenach???an ???outlander??????in a Scotland torn by war and raiding border clans in the year of Our Lord...1743.
<br>
Hurled back in time by forces she cannot understand, Claire is catapulted into the intrigues of lairds and spies that may threaten her life, and shatter her heart. For here James Fraser, a gallant young Scots warrior, shows her a love so absolute that Claire becomes a woman torn between fidelity and desire???and between two vastly different men in two irreconcilable lives.', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (12, N'All the Light We Cannot See', 11, NULL, 0, CAST(10.99 AS Decimal(10, 2)), 0, N'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1451445646l/18143977.jpg', N'Marie-Laure lives in Paris near the Museum of Natural History, where her father works. When she is twelve, the Nazis occupy Paris and father and daughter flee to the walled citadel of Saint-Malo, where Marie-Laure???s reclusive great uncle lives in a tall house by the sea. With them they carry what might be the museum???s most valuable and dangerous jewel.
<br>In a mining town in Germany, Werner Pfennig, an orphan, grows up with his younger sister, enchanted by a crude radio they find that brings them news and stories from places they have never seen or imagined. Werner becomes an expert at building and fixing these crucial new instruments and is enlisted to use his talent to track down the resistance. Deftly interweaving the lives of Marie-Laure and Werner, Doerr illuminates the ways, against all odds, people try to be good to one another.', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (13, N'Fullmetal Alchemist, Vol. 1', 12, NULL, 0, CAST(9.35 AS Decimal(10, 2)), 1, N'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1388179331l/870.jpg', N'Breaking the laws of nature is a serious crime!
<br>In an alchemical ritual gone wrong, Edward Elric lost his arm and his leg, and his brother Alphonse became nothing but a soul in a suit of armor. Equipped with mechanical ???auto-mail??? limbs, Edward becomes a state alchemist, seeking the one thing that can restore his and his brother???s bodies...the legendary Philosopher???s Stone.
<br>Alchemy: the mystical power to alter the natural world; something between magic, art and science. When two brothers, Edward and Alphonse Elric, dabbled in this power to grant their dearest wish, one of them lost an arm and a leg???and the other became nothing but a soul locked into a body of living steel. Now Edward is an agent of the government, a slave of the military-alchemical complex, using his unique powers to obey orders???even to kill. Except his powers aren''t unique. The world has been ravaged by the abuse of alchemy. And in pursuit of the ultimate alchemical treasure, the Philosopher''s Stone, their enemies are even more ruthless than they are???', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (14, N'Death Note, Vol. 1: Boredom', 13, NULL, 0, CAST(10.40 AS Decimal(10, 2)), 0, N'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1419952134l/13615.jpg', N'Light Yagami is an ace student with great prospects - and he''s bored out of his mind. But all that changes when he finds the Death Note, a notebook dropped by a rogue Shinigami, a death god. Any human whose name is written in the notebook dies, and now Light has vowed to use the power of the Death Note to rid the world of evil. But when criminals begin dropping dead, the authorities send the legendary detective L to track down the killer. With L hot on his heels, will Light lose sight of his noble goal... or his life?', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (15, N'One Piece, Volume 1: Romance Dawn', 14, NULL, 0, CAST(11.00 AS Decimal(10, 2)), 1, N'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1318523719l/1237398.jpg', N'A new shonen sensation in Japan, this series features Monkey D. Luffy, whose main ambition is to become a pirate. Eating the Gum-Gum Fruit gives him strange powers but also invokes the fruit''s curse: anybody who consumes it can never learn to swim. Nevertheless, Monkey and his crewmate Roronoa Zoro, master of the three-sword fighting style, sail the Seven Seas of swashbuckling adventure in search of the elusive treasure "One Piece."', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (16, N'Classroom of the Elite Vol. 1', 15, NULL, 0, CAST(9.69 AS Decimal(10, 2)), 0, N'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1540974678l/41085104.jpg', N'Students of the prestigious Tokyo Metropolitan Advanced Nurturing High School are given remarkable freedom???if they can win, barter, or save enough points to work their way up the ranks! Ayanokoji Kiyotaka has landed at the bottom in the scorned Class D, where he meets Horikita Suzune, who???s determined to rise up the ladder to Class A. Can they beat the system in a school where cutthroat competition is the name of the game?', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (17, N'L???c', 16, NULL, 0, CAST(0.10 AS Decimal(10, 2)), 1, NULL, N'M???t ?????a tr??? l???c l???i gi???a th??? gi???i ?????y k???t n???i...', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (18, N'Doraemon', 118, NULL, 0, CAST(11.00 AS Decimal(10, 2)), 0, N'https://i.ebayimg.com/images/g/LMYAAOSw8Zhib4cD/s-l640.jpg', N'Nobita''s failures in school and subsequently, his career, have left his family line with endless financial problems. Thus, his great-great-grandson, Sewashi (a clumsy and very unlucky fourth-grader), sends a blue robotic cat called Doraemon to Nobita''s generation to help improve Nobita''s circumstances. In doing so he hopes that Nobita and all of his descendants will be able to enjoy a better future.', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (22, N'Detective Conan', 118, NULL, 0, CAST(11.00 AS Decimal(10, 2)), 0, N'https://www.detectiveconanworld.com/wiki/images/thumb/0/00/Volume_100.jpg/275px-Volume_100.jpg', N'Shinichi Kudo, a great mystery expert at only seventeen, is already well known for having solved several challenging cases. One day, when Shinichi sees two suspicious men and decides to follow them, he inadvertently becomes witness to a disturbing illegal activity. When the men catch Shinichi, they dose him with an Experimental Drug formulated by the Black Organization and abandon him to die. However, to his own astonishment, Shinichi is still alive and soon wakes up, but now, he has the body of a seven-year-old, perfectly preserving his original intelligence. He hides his real identity from everyone, including his childhood friend Ran Mouri and her father, private detective Kogoro Mouri. He eventually takes on the alias of Conan Edogawa, inspired by the mystery writers Arthur Conan Doyle and Ranpo Edogawa.', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (23, N'Gangsta Granny', 118, NULL, 0, CAST(25.00 AS Decimal(10, 2)), 0, N'https://m.media-amazon.com/images/I/81Jw7-+FtFL.jpg', N'Ben, a curious boy, hates having to stay with his old Granny every Friday because his parents go to see a dancing show named "Strictly Stars Dancing" (a parody of Strictly Come Dancing). He finds it boring and repetitive as his Granny always feeds him cabbage-related dishes, most commonly cabbage soup and cabbage chocolate, and they are constantly playing Scrabble, plus her television hasn''t been working since the 1990s. Ben loves plumbing and is a long-term subscriber to the magazine Plumbing Weekly, which he buys every week from Raj''s news-agency. Ben''s parents disapprove of him being a plumber, as their ambition for their only child was to be a professional ballet dancer like the one they used to watch every Friday.', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (24, N'Demon Dentist', 118, NULL, 0, CAST(25.00 AS Decimal(10, 2)), 1, N'https://d3ddkgxe55ca6c.cloudfront.net/assets/t1496536687/a/86/b8/153606-ml-1144102.jpg', N'Walliams makes going to the dentist a wacky adventure with his signature humor???this is one dentist appointment you don???t want to miss.

Something strange is happening in Alfie''s town. Instead of shiny coins from the Tooth Fairy, kids are waking up to dead slugs, live spiders, and other dreadfully icky things under their pillows.

Who would do something so horrific? Alfie is sure that Miss Root, the creepy new dentist in town, is behind it all. There''s nothing Alfie hates more than going to the dentist, but to solve this mystery, he may have to book a dreaded appointment???.', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (25, N'L??ng t???t c???a b???n c???n th??m ????i ph???n s???c s???o', 118, NULL, 0, CAST(19.00 AS Decimal(10, 2)), 0, N'https://sach86.com/wp-content/uploads/2020/01/long-tot-cua-ban-can-them-doi-phan-sac-sao.jpg', N'Ch??ng ta kh??ng gi??y ph??t n??o kh??ng b??? th??? gi???i b??n ngo??i ch??? tr???, l??u d???n s??? qu??n m???t t??m t?? ban s??, m???t ??i kh??? n??ng suy ngh?? ?????c l???p v?? gi??? v???ng c??i t??i.

 

So v???i t???ng c??u t???ng c??u an ???i d???u d??ng, t??i ngh?? ch??ng ta c???n m???t ch???u n?????c l???nh h??n. N?? s??? gi??p ch??ng ta t???nh t??o ?? th???c ???????c t??nh t??nh c??u b???n c???a m??nh, t???m nh??n v?? l??ng d??? h???n h???p c???a m??nh, EQ th???p c???a m??nh, v?? t???t c??? nh???ng v???n ????? m?? b???n th??n ch??ng ta kh??ng nh??n r??, nh??ng ng?????i kh??c th???y r?? m???n m???t m?? kh??ng mu???n n??i cho ch??ng ta bi???t.

 

Khi b???n kh???n ?????n, hoang mang, n???u ?????c ???????c cu???n s??ch n??y, mong r???ng b???n c?? th??? r??t ra s???c m???nh t??? trong c??u ch??? c???a n??, ?????ng n???p v?? kh?? ?????u h??ng th??? gi???i n??y. Nguy???n cho t???t c??? nh???ng ng?????i kh??ng hi???u v?? th???u hi???u tr??n ?????i kh??ng ng???ng tr?????ng th??nh nh??ng v???n t???t b???ng nh?? x??a!', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (26, N'Men are from Mars, Women from Venus', 118, NULL, 0, CAST(30.00 AS Decimal(10, 2)), 0, N'https://m.media-amazon.com/images/I/81RfW9mFkEL.jpg', N'Once upon a time Martians and Venusians met, fell in love, and had happy relationships together because they respected and accepted their differences. Then they came to Earth and amnesia set in: they forgot they were from different planets.

Based on years of successful counseling of couples and individuals, Men Are from Mars, Women Are from Venus has helped millions of couples transform their relationships. Now viewed as a modern classic, this timeless book has helped men and women realize how different they can be in their communication styles, their emotional needs, and their modes of behavior, and offers the secrets of communicating without conflicts, allowing couples to give intimacy every chance to grow. ', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (27, N'The Miracles of the Namiya General Store

', 118, NULL, 0, CAST(30.00 AS Decimal(10, 2)), 0, N'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1564085721l/44287550.jpg', N'When three delinquents hole up in an abandoned general store after their most recent robbery, to their great surprise, a letter drops through the mail slot in the store''s shutter. This seemingly simple request for advice sets the trio on a journey of discovery as, over the course of a single night, they step into the role of the kindhearted former shopkeeper who devoted his waning years to offering thoughtful counsel to his correspondents. Through the lens of time, they share insight with those seeking guidance, and by morning, none of their lives will ever be the same.', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (28, N'5cm per Second', 118, NULL, 0, CAST(25.00 AS Decimal(10, 2)), 0, N'https://cdn.verasia.eu/15367/byosoku-go-senchimetoru-5-centimeters-per-second-japanese-novel-written-by-shinkai.jpg', N'Love can move at the speed of terminal velocity, but as award-winning director Makoto Shinkai reveals in his latest comic, it can only be shared and embraced by those who refuse to see it stop.

Takaki Tohno quickly befriends Akari Shinohara when she transfers to his school. They grow closer to each other due to similar interests and attitudes; for instance, they both prefer to stay inside during recess due to their constitutions. As a result, they form a strong bond.

Upon ending their school year, Akari moves to Tochigi, due to her parents'' jobs. The two keep in contact by writing letters, but eventually begin to drift apart.', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (30, N'The Boy wear Striped Pyjamas', 118, NULL, 0, CAST(19.00 AS Decimal(10, 2)), 0, N'https://m.media-amazon.com/images/I/914nabSHOsL.jpg', N'John Boyne has described the conception of his novel as an idea popping into his head of "two boys, the mirror of each other, sitting either side of a wire fence". While the conception of the book came about fast, his inspiration for writing has a more lengthy foundation. Boyne has stated that his style and writing process has been influenced by Malcolm Bradbury at the University of East Anglia, who suggested he write every day without rest days.', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (31, N'Weathering with you', 118, NULL, 0, CAST(19.00 AS Decimal(10, 2)), 0, N'https://cdn.verasia.eu/12673-big_default_2x/tenki-no-ko-weathering-with-you-japanese-novel-written-by-makoto-shinkai.jpg', N'Longing to escape his island home, a boy named Hodaka runs away during his first summer of high school to find a new life in Tokyo. As rain falls for days on end and Hodaka struggles to adjust, he meets a girl named Hina who holds a mysterious power: With a single prayer, she can part the clouds and bring back the sun. But her power comes at a price, and as the weather spirals further and further out of control, they must choose what future they truly want for themselves.', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (32, N'The After-Dinner Mysterie', 118, NULL, 0, CAST(25.00 AS Decimal(10, 2)), 0, N'https://japanesebooks.jp/wp-content/uploads/2021/09/4cbbd83b531db57c281b6790fdd0c987-400x581.jpg', N'Reiko is the only daughter to the CEO of a major enterprise, "Hosho Group," known worldwide. Hiding her true identity behind her day time job as a rookie police officer, Reiko comes home to her butler and driver, Kageyama whenever she is faced with a complex case, being a perfectionist, Kageyama is flawless when it comes to serving meals full course from hors d''oeuvre to dessert. He sharply points out the lack of reasoning on Reiko''s side, keeping the comment one fine line away from being offensive. The cutting remarks by Kageyama and appearances by unique characters, as well as the play on words and light tempo of witty conversations...and most of all, being referred to as the "Armchair detective" who solves mysteries without encountering the suspects together create a daring mystery solving roller-coaster ride.', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (33, N'Sau khi g??y th?? v???i ch??? th???n', 118, NULL, 0, CAST(0.10 AS Decimal(10, 2)), 1, NULL, N'', 0, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (34, N'Classroom of the Elite Vol. 1', 25, NULL, 0, CAST(9.69 AS Decimal(10, 2)), 0, N'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1540974678l/41085104.jpg', N'Students of the prestigious Tokyo Metropolitan Advanced Nurturing High School are given remarkable freedom???if they can win, barter, or save enough points to work their way up the ranks! Ayanokoji Kiyotaka has landed at the bottom in the scorned Class D, where he meets Horikita Suzune, who???s determined to rise up the ladder to Class A. Can they beat the system in a school where cutthroat competition is the name of the game?', 1000, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (35, N'Classroom of the Elite Vol. 1', 25, NULL, 0, CAST(9.69 AS Decimal(10, 2)), 0, N'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1540974678l/41085104.jpg', N'Students of the prestigious Tokyo Metropolitan Advanced Nurturing High School are given remarkable freedom???if they can win, barter, or save enough points to work their way up the ranks! Ayanokoji Kiyotaka has landed at the bottom in the scorned Class D, where he meets Horikita Suzune, who???s determined to rise up the ladder to Class A. Can they beat the system in a school where cutthroat competition is the name of the game?', 2000, 1)
GO
INSERT [dbo].[Book] ([id], [title], [authorId], [rating], [favourite], [price], [is_sale], [image], [description], [views], [status]) VALUES (36, N'Classroom of the Elite Vol. 1', 25, NULL, 0, CAST(9.69 AS Decimal(10, 2)), 0, N'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1540974678l/41085104.jpg', N'Students of the prestigious Tokyo Metropolitan Advanced Nurturing High School are given remarkable freedom???if they can win, barter, or save enough points to work their way up the ranks! Ayanokoji Kiyotaka has landed at the bottom in the scorned Class D, where he meets Horikita Suzune, who???s determined to rise up the ladder to Class A. Can they beat the system in a school where cutthroat competition is the name of the game?', 3000, 1)
GO
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
INSERT [dbo].[Book_Own] ([userId], [bookId], [recentTime], [recentChapterId]) VALUES (109, 4, NULL, NULL)
GO
INSERT [dbo].[Book_Own] ([userId], [bookId], [recentTime], [recentChapterId]) VALUES (109, 7, NULL, NULL)
GO
INSERT [dbo].[Book_Own] ([userId], [bookId], [recentTime], [recentChapterId]) VALUES (109, 1, CAST(N'2022-10-10T00:00:00.000' AS DateTime), 2)
GO
INSERT [dbo].[Book_Own] ([userId], [bookId], [recentTime], [recentChapterId]) VALUES (111, 1, NULL, NULL)
GO
INSERT [dbo].[Book_Own] ([userId], [bookId], [recentTime], [recentChapterId]) VALUES (111, 2, NULL, NULL)
GO
INSERT [dbo].[Book_Own] ([userId], [bookId], [recentTime], [recentChapterId]) VALUES (111, 3, NULL, NULL)
GO
INSERT [dbo].[Book_Own] ([userId], [bookId], [recentTime], [recentChapterId]) VALUES (111, 5, NULL, NULL)
GO
INSERT [dbo].[Book_Own] ([userId], [bookId], [recentTime], [recentChapterId]) VALUES (111, 11, NULL, NULL)
GO
INSERT [dbo].[Book_Own] ([userId], [bookId], [recentTime], [recentChapterId]) VALUES (111, 10, NULL, NULL)
GO
INSERT [dbo].[Book_Own] ([userId], [bookId], [recentTime], [recentChapterId]) VALUES (111, 9, NULL, NULL)
GO
INSERT [dbo].[Book_Own] ([userId], [bookId], [recentTime], [recentChapterId]) VALUES (111, 8, NULL, NULL)
GO
INSERT [dbo].[Book_Own] ([userId], [bookId], [recentTime], [recentChapterId]) VALUES (111, 13, NULL, NULL)
GO
INSERT [dbo].[Book_Own] ([userId], [bookId], [recentTime], [recentChapterId]) VALUES (111, 7, NULL, NULL)
GO
INSERT [dbo].[Book_Own] ([userId], [bookId], [recentTime], [recentChapterId]) VALUES (111, 14, NULL, NULL)
GO
INSERT [dbo].[Book_Own] ([userId], [bookId], [recentTime], [recentChapterId]) VALUES (111, 16, NULL, NULL)
GO
INSERT [dbo].[Book_Own] ([userId], [bookId], [recentTime], [recentChapterId]) VALUES (111, 12, NULL, NULL)
GO
INSERT [dbo].[Book_Own] ([userId], [bookId], [recentTime], [recentChapterId]) VALUES (111, 6, NULL, NULL)
GO
INSERT [dbo].[Book_Own] ([userId], [bookId], [recentTime], [recentChapterId]) VALUES (111, 4, NULL, NULL)
GO
INSERT [dbo].[Book_Own] ([userId], [bookId], [recentTime], [recentChapterId]) VALUES (111, 15, NULL, NULL)
GO
INSERT [dbo].[Book_Own] ([userId], [bookId], [recentTime], [recentChapterId]) VALUES (2, 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Art')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Biography')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Business')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Chick Lit')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (5, N'Christian')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (6, N'Classics')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (7, N'Comics')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (8, N'Contemporary')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (9, N'Cookbooks')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (10, N'Crime')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (12, N'Fantasy')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (13, N'Fiction')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (14, N'Gay and Lesbian')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (15, N'Graphic Novels')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (16, N'Historical Fiction')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (17, N'History')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (18, N'Horror')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (19, N'Humor and Comedy')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (20, N'Manga')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (21, N'Memoir')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (22, N'Music')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (23, N'Mystery')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (24, N'Nonfiction')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (25, N'Paranormal')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (26, N'Philosophy')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (27, N'Poetry')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (28, N'Psychology')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (29, N'Religion')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (30, N'Romance')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (31, N'Science')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (32, N'Science Fiction')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (33, N'Self Help')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (34, N'Suspense')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (35, N'Spirituality')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (36, N'Sports')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (37, N'Thriller')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (38, N'Travel')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (39, N'Young Adult')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (40, N'Light Novel')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (41, N'Adventure')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (42, N'Action')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (43, N'Adult')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (44, N'Wars')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (45, N'Slice of Life')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (1, 13)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (1, 23)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (1, 37)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (2, 6)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (2, 13)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (2, 23)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (3, 13)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (3, 23)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (3, 37)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (4, 13)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (4, 23)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (4, 37)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (5, 6)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (5, 12)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (5, 13)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (6, 18)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (6, 13)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (6, 37)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (6, 6)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (7, 18)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (7, 13)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (7, 37)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (7, 12)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (8, 12)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (8, 13)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (8, 41)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (8, 43)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (9, 39)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (9, 13)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (9, 32)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (11, 16)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (9, 30)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (9, 41)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (10, 6)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (10, 32)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (10, 13)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (10, 12)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (11, 30)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (11, 12)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (11, 13)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (11, 32)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (11, 43)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (12, 16)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (12, 44)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (12, 43)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (13, 20)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (13, 12)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (13, 39)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (13, 32)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (13, 41)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (14, 20)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (14, 12)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (14, 18)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (14, 13)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (14, 23)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (15, 20)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (15, 12)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (15, 41)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (15, 13)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (16, 40)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (16, 45)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (16, 13)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (16, 39)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (17, 41)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (17, 12)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (17, 19)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (18, 20)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (22, 20)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (23, 13)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (24, 13)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (25, 28)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (28, 28)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (30, 13)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (27, 18)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (27, 13)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (32, 10)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (32, 13)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (27, 30)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (28, 30)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (33, 43)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (33, 41)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (33, 12)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (33, 14)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (33, 40)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (33, 23)
GO
INSERT [dbo].[CategoryBook] ([bookId], [categoryId]) VALUES (33, 30)
GO
SET IDENTITY_INSERT [dbo].[Chapter] ON 
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (1, 1, 1, N'Nick Dunne', 1, N'When I think of my wife, I always think of her head. The shape of it, to begin with. The very first time I saw her, it was the back of the head I saw, and there was something lovely about it, the angles of it. Like a shiny, hard corn kernel or a riverbed fossil. She had what the Victorians would call a finely shaped head. You could imagine the skull quite easily.
I???d know her head anywhere.
And what???s inside it. I think of that, too: her mind. Her brain, all those coils, and her thoughts shuttling through those coils like fast, frantic centipedes. Like a child, I picture opening her skull, unspooling her brain and sifting through it, trying to catch and pin down her thoughts. What are you thinking, Amy? The question I???ve asked most often during our marriage, if not out loud, if not to the person who could answer. I suppose these questions stormcloud over every marriage: What are you thinking? How are you feeling? Who are you? What have we done to each other? What will we do?
My eyes flipped open at exactly six a.m. This was no avian fluttering of the lashes, no gentle blink toward consciousness. The awakening was mechanical. A spooky ventriloquist-dummy click of the lids: The world is black and then, showtime! 6-0-0 the clock said ??? in my face, first thing I saw. 6-0-0. It felt different. I rarely woke at such a rounded time. I was a man of jagged risings: 8:43, 11:51, 9:26. My life was alarmless.
At that exact moment, 6-0-0, the sun climbed over the skyline of oaks, revealing its full summer angry-God self. Its reflection flared across the river toward our house, a long, blaring finger aimed at me through our frail bedroom curtains. Accusing: You have been seen. You will be seen.
I wallowed in bed, which was our New York bed in our new house, which we still called the new house, even though we???d been back here for two years. It???s a rented house right along the Mississippi River, a house that screams Suburban Nouveau Riche, the kind of place I aspired to as a kid from my split-level, shag-carpet side of town. The kind of house that is immediately familiar: a generically grand, unchallenging, new, new, new house that my wife would ??? and did ??? detest.
???Should I remove my soul before I come inside???? Her first line upon arrival. It had been a compromise: Amy demanded we rent, not buy, in my little Missouri hometown, in her firm hope that we wouldn???t be stuck here long. But the only houses for rent were clustered in this failed development: a miniature ghost town of bank-owned, recession-busted, price-reduced mansions, a neighborhood that closed before it ever opened. It was a compromise, but Amy didn???t see it that way, not in the least. To Amy, it was a punishing whim on my part, a nasty, selfish twist of the knife. I would drag her, caveman-style, to a town she had aggressively avoided, and make her live in the kind of house she used to mock. I suppose it???s not a compromise if only one of you considers it such, but that was what our compromises tended to look like. One of us was always angry. Amy, usually.
Do not blame me for this particular grievance, Amy. The Missouri Grievance. Blame the economy, blame bad luck, blame my parents, blame your parents, blame the Internet, blame people who use the Internet. I used to be a writer. I was a writer who wrote about TV and movies and books. Back when people read things on paper, back when anyone cared about what I thought. I???d arrived in New York in the late ???90s, the last gasp of the glory days, although no one knew it then. New York was packed with writers, real writers, because there were magazines, real magazines, loads of them. This was back when the Internet was still some exotic pet kept in the corner of the publishing world ??? throw some kibble at it, watch it dance on its little leash, oh quite cute, it definitely won???t kill us in the night. Think about it: a time when newly graduated college kids could come to New York and get paid to write. We had no clue that we were embarking on careers that would vanish within a decade.
I had a job for eleven years and then I didn???t, it was that fast. All around the country, magazines began shuttering, succumbing to a sudden infection brought on by the busted economy. Writers (my kind of writers: aspiring novelists, ruminative thinkers, people whose brains don???t work quick enough to blog or link or tweet, basically old, stubborn blowhards) were through. We were like women???s hat makers or buggy-whip manufacturers: Our time was done. Three weeks after I got cut loose, Amy lost her job, such as it was. (Now I can feel Amy looking over my shoulder, smirking at the time I???ve spent discussing my career, my misfortune, and dismissing her experience in one sentence. That, she would tell you, is typical. Just like Nick, she would say. It was a refrain of hers: Just like Nick to ??? and whatever followed, whatever was just like me, was bad.) Two jobless grown-ups, we spent weeks wandering around our Brooklyn brownstone in socks and pajamas, ignoring the future, strewing unopened mail across tables and sofas, eating ice cream at ten a.m. and taking thick afternoon naps.
Then one day the phone rang. My twin sister was on the other end. Margo had moved back home after her own New York layoff a year before ??? the girl is one step ahead of me in everything, even shitty luck. Margo, calling from good ole North Carthage, Missouri, from the house where we grew up, and as I listened to her voice, I saw her at age ten, with a dark cap of hair and overall shorts, sitting on our grandparents??? back dock, her body slouched over like an old pillow, her skinny legs dangling in the water, watching the river flow over fish-white feet, so intently, utterly self-possessed even as a child.
Go???s voice was warm and crinkly even as she gave this cold news: Our indomitable mother was dying. Our dad was nearly gone ??? his (nasty) mind, his (miserable) heart, both murky as he meandered toward the great gray beyond. But it looked like our mother would beat him there. About six months, maybe a year, she had. I could tell that Go had gone to meet with the doctor by herself, taken her studious notes in her slovenly handwriting, and she was teary as she tried to decipher what she???d written. Dates and doses.
???Well, fuck, I have no idea what this says, is it a nine? Does that even make sense???? she said, and I interrupted. Here was a task, a purpose, held out on my sister???s palm like a plum. I almost cried with relief.
???I???ll come back, Go. We???ll move back home. You shouldn???t have to do this all by yourself.???
She didn???t believe me. I could hear her breathing on the other end.
???I???m serious, Go. Why not? There???s nothing here.???
A long exhale. ???What about Amy????
That is what I didn???t take long enough to consider. I simply assumed I would bundle up my New York wife with her New York interests, her New York pride, and remove her from her New York parents ??? leave the frantic, thrilling futureland of Manhattan behind ??? and transplant her to a little town on the river in Missouri, and all would be fine.
I did not yet understand how foolish, how optimistic, how, yes, just like Nick I was for thinking this. The misery it would lead to.
???Amy will be fine. Amy ?????? Here was where I should have said, ???Amy loves Mom.??? But I couldn???t tell Go that Amy loved our mother, because after all that time, Amy still barely knew our mother. Their few meetings had left them both baffled. Amy would dissect the conversations for days after ??? ???And what did she mean by ???,??? ??? as if my mother were some ancient peasant tribeswoman arriving from the tundra with an armful of raw yak meat and some buttons for bartering, trying to get something from Amy that wasn???t on offer.
Amy didn???t care to know my family, didn???t want to know my birthplace, and yet for some reason, I thought moving home would be a good idea.
My morning breath warmed the pillow, and I changed the subject in my mind. Today was not a day for second-guessing or regret, it was a day for doing. Downstairs, I could hear the return of a long-lost sound: Amy making breakfast. Banging wooden cupboards (rump-thump!), rattling containers of tin and glass (ding-ring!), shuffling and sorting a collection of metal pots and iron pans (ruzz-shuzz!). A culinary orchestra tuning up, clattering vigorously toward the finale, a cake pan drumrolling along the floor, hitting the wall with a cymballic crash. Something impressive was being created, probably a crepe, because crepes are special, and today Amy would want to cook something special.
It was our five-year anniversary.
I walked barefoot to the edge of the steps and stood listening, working my toes into the plush wall-to-wall carpet Amy detested on principle, as I tried to decide whether I was ready to join my wife. Amy was in the kitchen, oblivious to my hesitation. She was humming something melancholy and familiar. I strained to make it out ??? a folk song? a lullabye? ??? and then realized it was the theme to M.A.S.H. Suicide is painless. I went downstairs.
I hovered in the doorway, watching my wife. Her yellow-butter hair was pulled up, the hank of ponytail swinging cheerful as a jumprope, and she was sucking distractedly on a burnt fingertip, humming around it. She hummed to herself because she was an unrivaled botcher of lyrics. When we were first dating, a Genesis song came on the radio: ???She seems to have an invisible touch, yeah.??? And Amy crooned instead, ???She takes my hat and puts it on the top shelf.??? When I asked her why she???d ever think her lyrics were remotely, possibly, vaguely right, she told me she always thought the woman in the song truly loved the man because she put his hat on the top shelf. I knew I liked her then, really liked her, this girl with an explanation for everything.
There???s something disturbing about recalling a warm memory and feeling utterly cold.
Amy peered at the crepe sizzling in the pan and licked something off her wrist. She looked triumphant, wifely. If I took her in my arms, she would smell like berries and powdered sugar.
When she spied me lurking there in grubby boxers, my hair in full Heat Miser spike, she leaned against the kitchen counter and said, ???Well, hello, handsome.???
Bile and dread inched up my throat. I thought to myself: Okay, go.
I was very late getting to work. My sister and I had done a foolish thing when we both moved back home. We had done what we always talked about doing. We opened a bar. We borrowed money from Amy to do this, eighty thousand dollars, which was once nothing to Amy but by then was almost everything. I swore I would pay her back, with interest. I would not be a man who borrowed from his wife ??? I could feel my dad twisting his lips at the very idea. Well, there are all kinds of men, his most damning phrase, the second half left unsaid, and you are the wrong kind.
But truly, it was a practical decision, a smart business move. Amy and I both needed new careers; this would be mine. She would pick one someday, or not, but in the meantime, here was an income, made possible by the last of Amy???s trust fund. Like the McMansion I rented, the bar featured symbolically in my childhood memories ??? a place where only grown-ups go, and do whatever grown-ups do. Maybe that???s why I was so insistent on buying it after being stripped of my livelihood. It???s a reminder that I am, after all, an adult, a grown man, a useful human being, even though I lost the career that made me all these things. I won???t make that mistake again: The once plentiful herds of magazine writers would continue to be culled ??? by the Internet, by the recession, by the American public, who would rather watch TV or play video games or electronically inform friends that, like, rain sucks! But there???s no app for a bourbon buzz on a warm day in a cool, dark bar. The world will always want a drink.
Our bar is a corner bar with a haphazard, patchwork aesthetic. Its best feature is a massive Victorian backbar, dragon heads and angel faces emerging from the oak ??? an extravagant work of wood in these shitty plastic days. The remainder of the bar is, in fact, shitty, a showcase of the shabbiest design offerings of every decade: an Eisenhower-era linoleum floor, the edges turned up like burnt toast; dubious wood-paneled walls straight from a ???70s home-porn video; halogen floor lamps, an accidental tribute to my 1990s dorm room. The ultimate effect is strangely homey ??? it looks less like a bar than someone???s benignly neglected fixer-upper. And jovial: We share a parking lot with the local bowling alley, and when our door swings wide, the clatter of strikes applauds the customer???s entrance.
We named the bar The Bar. ???People will think we???re ironic instead of creatively bankrupt,??? my sister reasoned.
Yes, we thought we were being clever New Yorkers ??? that the name was a joke no one else would really get, not get like we did. Not meta-get. We pictured the locals scrunching their noses: Why???d you name it The Bar? But our first customer, a gray-haired woman in bifocals and a pink jogging suit, said, ???I like the name. Like in Breakfast at Tiffany???s and Audrey Hepburn???s cat was named Cat.???
We felt much less superior after that, which was a good thing.
I pulled into the parking lot. I waited until a strike erupted from the bowling alley ??? thank you, thank you, friends ??? then stepped out of the car. I admired the surroundings, still not bored with the broken-in view: the squatty blond-brick post office across the street (now closed on Saturdays), the unassuming beige office building just down the way (now closed, period). The town wasn???t prosperous, not anymore, not by a long shot. Hell, it wasn???t even original, being one of two Carthage, Missouris ??? ours is technically North Carthage, which makes it sound like a twin city, although it???s hundreds of miles from the other and the lesser of the two: a quaint little 1950s town that bloated itself into a basic midsize suburb and dubbed it progress. Still, it was where my mom grew up and where she raised me and Go, so it had some history. Mine, at least.
As I walked toward the bar across the concrete-and-weed parking lot, I looked straight down the road and saw the river. That???s what I???ve always loved about our town: We aren???t built on some safe bluff overlooking the Mississippi ??? we are on the Mississippi. I could walk down the road and step right into the sucker, an easy three-foot drop, and be on my way to Tennessee. Every building downtown bears hand-drawn lines from where the river hit during the Flood of ???61, ???75, ???84, ???93, ???07, ???08, ???11. And so on.
The river wasn???t swollen now, but it was running urgently, in strong ropy currents. Moving apace with the river was a long single-file line of men, eyes aimed at their feet, shoulders tense, walking steadfastly nowhere. As I watched them, one suddenly looked up at me, his face in shadow, an oval blackness. I turned away.
I felt an immediate, intense need to get inside. By the time I???d gone twenty feet, my neck bubbled with sweat. The sun was still an angry eye in the sky. You have been seen.
My gut twisted, and I moved quicker. I needed a drink.')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (2, 1, 2, N'AMY ELLIOTT JANUARY 8, 2005', 1, N'??? Diary entry ???
Tra and la! I am smiling a big adopted-orphan smile as I write this. I am embarrassed at how happy I am, like some Technicolor comic of a teenage girl talking on the phone with my hair in a ponytail, the bubble above my head saying: I met a boy!
But I did. This is a technical, empirical truth. I met a boy, a great, gorgeous dude, a funny, cool-ass guy. Let me set the scene, because it deserves setting for posterity (no, please, I???m not that far gone, posterity! feh). But still. It???s not New Year???s, but still very much the new year. It???s winter: early dark, freezing cold.
Carmen, a newish friend ??? semi-friend, barely friend, the kind of friend you can???t cancel on ??? has talked me into going out to Brooklyn, to one of her writers??? parties. Now, I like a writer party, I like writers, I am the child of writers, I am a writer. I still love scribbling that word ??? WRITER ??? any time a form, questionnaire, document asks for my occupation. Fine, I write personality quizzes, I don???t write about the Great Issues of the Day, but I think it???s fair to say I am a writer. I???m using this journal to get better: to hone my skills, to collect details and observations. To show don???t tell and all that other writery crap. (Adopted-orphan smile, I mean, that???s not bad, come on.) But really, I do think my quizzes alone qualify me on at least an honorary basis. Right?
At a party you find yourself surrounded by genuine talented writers, employed at high-profile, respected newspapers and magazines.
You merely write quizzes for women???s rags. When someone asks what you do for a living, you:
a) Get embarrassed and say, ???I???m just a quiz writer, it???s silly stuff!???
b) Go on the offense: ???I???m a writer now, but I???m considering something more challenging and worthwhile ??? why, what do you do????
c) Take pride in your accomplishments: ???I write personality quizzes using the knowledge gleaned from my master???s degree in psychology ??? oh, and fun fact: I am the inspiration for a beloved children???s-book series, I???m sure you know it, Amazing Amy? Yeah, so suck it, snobdouche!
Answer: C, totally C
Anyway, the party is being thrown by one of Carmen???s good friends who writes about movies for a movie magazine, and is very funny, according to Carmen. I worry for a second that she wants to set us up: I am not interested in being set up. I need to be ambushed, caught unawares, like some sort of feral love-jackal. I???m too self-conscious otherwise. I feel myself trying to be charming, and then I realize I???m obviously trying to be charming, and then I try to be even more charming to make up for the fake charm, and then I???ve basically turned into Liza Minnelli: I???m dancing in tights and sequins, begging you to love me. There???s a bowler and jazz hands and lots of teeth.
But no, I realize, as Carmen gushes on about her friend: She likes him. Good.
We climb three flights of warped stairs and walk into a whoosh of body heat and writerness: many black-framed glasses and mops of hair; faux western shirts and heathery turtlenecks; black wool pea-coats flopped all across the couch, puddling to the floor; a German poster for The Getaway (Ihre Chance war gleich Null!) covering one paint-cracked wall. Franz Ferdinand on the stereo: ???Take Me Out.???
A clump of guys hovers near a card table where all the alcohol is set up, tipping more booze into their cups after every few sips, all too aware of how little is left to go around. I nudge in, aiming my plastic cup in the center like a busker, get a clatter of ice cubes and a splash of vodka from a sweet-faced guy wearing a Space Invaders T-shirt.
A lethal-looking bottle of green-apple liqueur, the host???s ironic purchase, will soon be our fate unless someone makes a booze run, and that seems unlikely, as everyone clearly believes they made the run last time. It is a January party, definitely, everyone still glutted and sugar-pissed from the holidays, lazy and irritated simultaneously. A party where people drink too much and pick cleverly worded fights, blowing cigarette smoke out an open window even after the host asks them to go outside. We???ve already talked to one another at a thousand holiday parties, we have nothing left to say, we are collectively bored, but we don???t want to go back into the January cold; our bones still ache from the subway steps.
I have lost Carmen to her host-beau ??? they are having an intense discussion in a corner of the kitchen, the two of them hunching their shoulders, their faces toward each other, the shape of a heart. Good. I think about eating to give myself something to do besides standing in the center of the room, smiling like the new kid in the lunchroom. But almost everything is gone. Some potato-chip shards sit in the bottom of a giant Tupperware bowl. A supermarket deli tray full of hoary carrots and gnarled celery and a semeny dip sits untouched on a coffee table, cigarettes littered throughout like bonus vegetable sticks. I am doing my thing, my impulse thing: What if I leap from the theater balcony right now? What if I tongue the homeless man across from me on the subway? What if I sit down on the floor of this party by myself and eat everything on that deli tray, including the cigarettes?
???Please don???t eat anything in that area,??? he says. It is him (bum bum BUMMM!), but I don???t yet know it???s him (bum-bum-bummm). I know it???s a guy who will talk to me, he wears his cockiness like an ironic T-shirt, but it fits him better. He is the kind of guy who carries himself like he gets laid a lot, a guy who likes women, a guy who would actually fuck me properly. I would like to be fucked properly! My dating life seems to rotate around three types of men: preppy Ivy Leaguers who believe they???re characters in a Fitzgerald novel; slick Wall Streeters with money signs in their eyes, their ears, their mouths; and sensitive smart-boys who are so self-aware that everything feels like a joke. The Fitzgerald fellows tend to be ineffectively porny in bed, a lot of noise and acrobatics to very little end. The finance guys turn rageful and flaccid. The smart-boys fuck like they???re composing a piece of math rock: This hand strums around here, and then this finger offers a nice bass rhythm ??? I sound quite slutty, don???t I? Pause while I count how many ??? eleven. Not bad. I???ve always thought twelve was a solid, reasonable number to end at.
???Seriously,??? Number 12 continues. (Ha!) ???Back away from the tray. James has up to three other food items in his refrigerator. I could make you an olive with mustard. Just one olive, though.???
Just one olive, though. It is a line that is only a little funny, but it already has the feel of an inside joke, one that will get funnier with nostalgic repetition. I think: A year from now, we will be walking along the Brooklyn Bridge at sunset and one of us will whisper, ???Just one olive, though,??? and we???ll start to laugh. (Then I catch myself. Awful. If he knew I was doing a year from now already, he???d run and I???d be obliged to cheer him on.)
Mainly, I will admit, I smile because he???s gorgeous. Distractingly gorgeous, the kind of looks that make your eyes pinwheel, that make you want to just address the elephant ??? ???You know you???re gorgeous, right???? ??? and move on with the conversation. I bet dudes hate him: He looks like the rich-boy villain in an ???80s teen movie ??? the one who bullies the sensitive misfit, the one who will end up with a pie in the puss, the whipped cream wilting his upturned collar as everyone in the cafeteria cheers.
He doesn???t act that way, though. His name is Nick. I love it. It makes him seem nice, and regular, which he is. When he tells me his name, I say, ???Now, that???s a real name.??? He brightens and reels off some line: ???Nick???s the kind of guy you can drink a beer with, the kind of guy who doesn???t mind if you puke in his car. Nick!???
He makes a series of awful puns. I catch three fourths of his movie references. Two thirds, maybe. (Note to self: Rent The Sure Thing.) He refills my drink without me having to ask, somehow ferreting out one last cup of the good stuff. He has claimed me, placed a flag in me: I was here first, she???s mine, mine. It feels nice, after my recent series of nervous, respectful post-feminist men, to be a territory. He has a great smile, a cat???s smile. He should cough out yellow Tweety Bird feathers, the way he smiles at me. He doesn???t ask what I do for a living, which is fine, which is a change. (I???m a writer, did I mention?) He talks to me in his river-wavy Missouri accent; he was born and raised outside of Hannibal, the boyhood home of Mark Twain, the inspiration for Tom Sawyer. He tells me he worked on a steamboat when he was a teenager, dinner and jazz for the tourists. And when I laugh (bratty, bratty New York girl who has never ventured to those big unwieldy middle states, those States Where Many Other People Live), he informs me that Missoura is a magical place, the most beautiful in the world, no state more glorious. His eyes are mischievous, his lashes are long. I can see what he looked like as a boy.
We share a taxi home, the streetlights making dizzy shadows and the car speeding as if we???re being chased. It is one a.m. when we hit one of New York???s unexplained deadlocks twelve blocks from my apartment, so we slide out of the taxi into the cold, into the great What Next? and Nick starts walking me home, his hand on the small of my back, our faces stunned by the chill. As we turn the corner, the local bakery is getting its powdered sugar delivered, funneled into the cellar by the barrelful as if it were cement, and we can see nothing but the shadows of the deliverymen in the white, sweet cloud. The street is billowing, and Nick pulls me close and smiles that smile again, and he takes a single lock of my hair between two fingers and runs them all the way to the end, tugging twice, like he???s ringing a bell. His eyelashes are trimmed with powder, and before he leans in, he brushes the sugar from my lips so he can taste me.')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (3, 1, 3, N'NICK DUNNE', 0, N'I swung wide the door of my bar, slipped into the darkness, and took my first real deep breath of the day, took in the smell of cigarettes and beer, the spice of a dribbled bourbon, the tang of old popcorn. There was only one customer in the bar, sitting by herself at the far, far end: an older woman named Sue who had come in every Thursday with her husband until he died three months back. Now she came alone every Thursday, never much for conversation, just sitting with a beer and a crossword, preserving a ritual.
My sister was at work behind the bar, her hair pulled back in nerdy-girl barrettes, her arms pink as she dipped the beer glasses in and out of hot suds. Go is slender and strange-faced, which is not to say unattractive. Her features just take a moment to make sense: the broad jaw; the pinched, pretty nose; the dark globe eyes. If this were a period movie, a man would tilt back his fedora, whistle at the sight of her, and say, ???Now, there???s a helluva broad!??? The face of a ???30s screwball-movie queen doesn???t always translate in our pixie-princess times, but I know from our years together that men like my sister, a lot, which puts me in that strange brotherly realm of being both proud and wary.
???Do they still make pimento loaf???? she said by way of greeting, not looking up, just knowing it was me, and I felt the relief I usually felt when I saw her: Things might not be great, but things would be okay.
My twin, Go. I???ve said this phrase so many times, it has become a reassuring mantra instead of actual words: Mytwingo. We were born in the ???70s, back when twins were rare, a bit magical: cousins of the unicorn, siblings of the elves. We even have a dash of twin telepathy. Go is truly the one person in the entire world I am totally myself with. I don???t feel the need to explain my actions to her. I don???t clarify, I don???t doubt, I don???t worry. I don???t tell her everything, not anymore, but I tell her more than anyone else, by far. I tell her as much as I can. We spent nine months back to back, covering each other. It became a lifelong habit. It never mattered to me that she was a girl, strange for a deeply self-conscious kid. What can I say? She was always just cool.
???Pimento loaf, that???s like lunch meat, right? I think they do.???
???We should get some,??? she said. She arched an eyebrow at me. ???I???m intrigued.???
Without asking, she poured me a draft of PBR into a mug of questionable cleanliness. When she caught me staring at the smudged rim, she brought the glass up to her mouth and licked the smudge away, leaving a smear of saliva. She set the mug squarely in front of me. ???Better, my prince????
Go firmly believes that I got the best of everything from our parents, that I was the boy they planned on, the single child they could afford, and that she sneaked into this world by clamping onto my ankle, an unwanted stranger. (For my dad, a particularly unwanted stranger.) She believes she was left to fend for herself throughout childhood, a pitiful creature of random hand-me-downs and forgotten permission slips, tightened budgets and general regret. This vision could be somewhat true; I can barely stand to admit it.
???Yes, my squalid little serf,??? I said, and fluttered my hands in royal dispensation.
I huddled over my beer. I needed to sit and drink a beer or three. My nerves were still singing from the morning.
???What???s up with you???? she asked. ???You look all twitchy.??? She flicked some suds at me, more water than soap. The air-conditioning kicked on, ruffling the tops of our heads. We spent more time in The Bar than we needed to. It had become the childhood clubhouse we never had. We???d busted open the storage boxes in our mother???s basement one drunken night last year, back when she was alive but right near the end, when we were in need of comfort, and we revisited the toys and games with much oohing and ahhing between sips of canned beer. Christmas in August. After Mom died, Go moved into our old house, and we slowly relocated our toys, piecemeal, to The Bar: a Strawberry Shortcake doll, now scentless, pops up on a stool one day (my gift to Go). A tiny Hot Wheels El Camino, one wheel missing, appears on a shelf in the corner (Go???s to me).
We were thinking of introducing a board game night, even though most of our customers were too old to be nostalgic for our Hungry Hungry Hippos, our Game of Life with its tiny plastic cars to be filled with tiny plastic pinhead spouses and tiny plastic pinhead babies. I couldn???t remember how you won. (Deep Hasbro thought for the day.)
Go refilled my beer, refilled her beer. Her left eyelid drooped slightly. It was exactly noon, 12???00, and I wondered how long she???d been drinking. She???s had a bumpy decade. My speculative sister, she of the rocket-science brain and the rodeo spirit, dropped out of college and moved to Manhattan in the late ???90s. She was one of the original dot-com phenoms ??? made crazy money for two years, then took the Internet bubble bath in 2000. Go remained unflappable. She was closer to twenty than thirty; she was fine. For act two, she got her degree and joined the gray-suited world of investment banking. She was midlevel, nothing flashy, nothing blameful, but she lost her job ??? fast ??? with the 2008 financial meltdown. I didn???t even know she???d left New York until she phoned me from Mom???s house: I give up. I begged her, cajoled her to return, hearing nothing but peeved silence on the other end. After I hung up, I made an anxious pilgrimage to her apartment in the Bowery and saw Gary, her beloved ficus tree, yellow-dead on the fire escape, and knew she???d never come back.
The Bar seemed to cheer her up. She handled the books, she poured the beers. She stole from the tip jar semi-regularly, but then she did more work than me. We never talked about our old lives. We were Dunnes, and we were done, and strangely content about it.
???So, what???? Go said, her usual way of beginning a conversation.
???Eh.???
???Eh, what? Eh, bad? You look bad.???
I shrugged a yes; she scanned my face.
???Amy???? she asked. It was an easy question. I shrugged again ??? a confirmation this time, a whatcha gonna do? shrug.
Go gave me her amused face, both elbows on the bar, hands cradling chin, hunkering down for an incisive dissection of my marriage. Go, an expert panel of one. ???What about her????
???Bad day. It???s just a bad day.???
???Don???t let her worry you.??? Go lit a cigarette. She smoked exactly one a day. ???Women are crazy.??? Go didn???t consider herself part of the general category of women, a word she used derisively.
I blew Go???s smoke back to its owner. ???It???s our anniversary today. Five years.???
???Wow.??? My sister cocked her head back. She???d been a bridesmaid, all in violet ??? ???the gorgeous, raven-haired, amethyst-draped dame,??? Amy???s mother had dubbed her ??? but anniversaries weren???t something she???d remember. ???Jeez. Fuck. Dude. That came fast.??? She blew more smoke toward me, a lazy game of cancer catch. ???She going to do one of her, uh, what do you call it, not scavenger hunt??????
???Treasure hunt,??? I said.
My wife loved games, mostly mind games, but also actual games of amusement, and for our anniversary she always set up an elaborate treasure hunt, with each clue leading to the hiding place of the next clue until I reached the end, and my present. It was what her dad always did for her mom on their anniversary, and don???t think I don???t see the gender roles here, that I don???t get the hint. But I did not grow up in Amy???s household, I grew up in mine, and the last present I remember my dad giving my mom was an iron, set on the kitchen counter, no wrapping paper.
???Should we make a wager on how pissed she???s going to get at you this year???? Go asked, smiling over the rim of her beer.
The problem with Amy???s treasure hunts: I never figured out the clues. Our first anniversary, back in New York, I went two for seven. That was my best year. The opening parley:
This place is a bit of a hole in the wall,
But we had a great kiss there one Tuesday last fall.
Ever been in a spelling bee as a kid? That snowy second after the announcement of the word as you sift your brain to see if you can spell it? It was like that, the blank panic.
???An Irish bar in a not-so-Irish place,??? Amy nudged.
I bit the side of my lip, started a shrug, scanning our living room as if the answer might appear. She gave me another very long minute.
???We were lost in the rain,??? she said in a voice that was pleading on the way to peeved.
I finished the shrug.
???McMann???s, Nick. Remember, when we got lost in the rain in Chinatown trying to find that dim sum place, and it was supposed to be near the statue of Confucius but it turns out there are two statues of Confucius, and we ended up at that random Irish bar all soaking wet, and we slammed a few whiskeys, and you grabbed me and kissed me, and it was??????
???Right! You should have done a clue with Confucius, I would have gotten that.???
???The statue wasn???t the point. The place was the point. The moment. I just thought it was special.??? She said these last words in a childish lilt that I once found fetching.
???It was special.??? I pulled her to me and kissed her. ???That smooch right there was my special anniversary reenactment. Let???s go do it again at McMann???s.???
At McMann???s, the bartender, a big, bearded bear-kid, saw us come in and grinned, poured us both whiskeys, and pushed over the next clue.
When I???m down and feeling blue
There???s only one place that will do.
That one turned out to be the Alice in Wonderland statue at Central Park, which Amy had told me ??? she???d told me, she knew she???d told me many times ??? lightened her moods as a child. I do not remember any of those conversations. I???m being honest here, I just don???t. I have a dash of ADD, and I???ve always found my wife a bit dazzling, in the purest sense of the word: to lose clear vision, especially from looking at bright light. It was enough to be near her and hear her talk, it didn???t always matter what she was saying. It should have, but it didn???t.
By the time we got to the end of the day, to exchanging our actual presents ??? the traditional paper presents for the first year of marriage ??? Amy was not speaking to me.
???I love you, Amy. You know I love you,??? I said, tailing her in and out of the family packs of dazed tourists parked in the middle of the sidewalk, oblivious and openmouthed. Amy was slipping through the Central Park crowds, maneuvering between laser-eyed joggers and scissor-legged skaters, kneeling parents and toddlers careering like drunks, always just ahead of me, tight-lipped, hurrying nowhere. Me trying to catch up, grab her arm. She stopped finally, gave me a face unmoved as I explained myself, one mental finger tamping down my exasperation: ???Amy, I don???t get why I need to prove my love to you by remembering the exact same things you do, the exact same way you do. It doesn???t mean I don???t love our life together.???
A nearby clown blew up a balloon animal, a man bought a rose, a child licked an ice cream cone, and a genuine tradition was born, one I???d never forget: Amy always going overboard, me never, ever worthy of the effort. Happy anniversary, asshole.
???I???m guessing ???five years ??? she???s going to get really pissed,??? Go continued. ???So I hope you got her a really good present.???
???On the to-do list.???
???What???s the, like, symbol, for five years? Paper????
???Paper is first year,??? I said. At the end of Year One???s unexpectedly wrenching treasure hunt, Amy presented me with a set of posh stationery, my initials embossed at the top, the paper so creamy I expected my fingers to come away moist. In return, I???d presented my wife with a bright red dime-store paper kite, picturing the park, picnics, warm summer gusts. Neither of us liked our presents; we???d each have preferred the other???s. It was a reverse O. Henry.
???Silver???? guessed Go. ???Bronze? Scrimshaw? Help me out.???
???Wood,??? I said. ???There???s no romantic present for wood.???
At the other end of the bar, Sue neatly folded her newspaper and left it on the bartop with her empty mug and a five-dollar bill. We all exchanged silent smiles as she walked out.
???I got it,??? Go said. ???Go home, fuck her brains out, then smack her with your penis and scream, ???There???s some wood for you, bitch!???
We laughed. Then we both flushed pink in our cheeks in the same spot. It was the kind of raunchy, unsisterly joke that Go enjoyed tossing at me like a grenade. It was also the reason why, in high school, there were always rumors that we secretly screwed. Twincest. We were too tight: our inside jokes, our edge-of-the-party whispers. I???m pretty sure I don???t need to say this, but you are not Go, you might misconstrue, so I will: My sister and I have never screwed or even thought of screwing. We just really like each other.
Go was now pantomiming dick-slapping my wife.
No, Amy and Go were never going to be friends. They were each too territorial. Go was used to being the alpha girl in my life, Amy was used to being the alpha girl in everyone???s life. For two people who lived in the same city ??? the same city twice: first New York, now here ??? they barely knew each other. They flitted in and out of my life like well-timed stage actors, one going out the door as the other came in, and on the rare occasions when they both inhabited the same room, they seemed somewhat bemused at the situation.
Before Amy and I got serious, got engaged, got married, I would get glimpses of Go???s thoughts in a sentence here or there. It???s funny, I can???t quite get a bead on her, like who she really is. And: You just seem kind of not yourself with her. And: There???s a difference between really loving someone and loving the idea of her. And finally: The important thing is she makes you really happy.
Back when Amy made me really happy.
Amy offered her own notions of Go: She???s very ??? Missouri, isn???t she? And: You just have to be in the right mood for her. And: She???s a little needy about you, but then I guess she doesn???t have anyone else.
I???d hoped when we all wound up back in Missouri, the two would let it drop ??? agree to disagree, free to be you and me. Neither did. Go was funnier than Amy, though, so it was a mismatched battle. Amy was clever, withering, sarcastic. Amy could get me riled up, could make an excellent, barbed point, but Go always made me laugh. It is dangerous to laugh at your spouse.
???Go, I thought we agreed you???d never mention my genitalia again,??? I said. ???That within the bounds of our sibling relationship, I have no genitalia.???
The phone rang. Go took one more sip of her beer and answered, gave an eyeroll and a smile. ???He sure is here, one moment, please!??? To me, she mouthed: ???Carl.???
Carl Pelley lived across the street from me and Amy. Retired three years. Divorced two years. Moved into our development right after. He???d been a traveling salesman ??? children???s party supplies ??? and I sensed that after four decades of motel living, he wasn???t quite at home being home. He showed up at the bar nearly every day with a pungent Hardee???s bag, complaining about his budget until he was offered a first drink on the house. (This was another thing I learned about Carl from his days in The Bar ??? that he was a functioning but serious alcoholic.) He had the good grace to accept whatever we were ???trying to get rid of,??? and he meant it: For one full month Carl drank nothing but dusty Zimas, circa 1992, that we???d discovered in the basement. When a hangover kept Carl home, he???d find a reason to call: Your mailbox looks awfully full today, Nicky, maybe a package came. Or: It???s supposed to rain, you might want to close your windows. The reasons were bogus. Carl just needed to hear the clink of glasses, the glug of a drink being poured.
I picked up the phone, shaking a tumbler of ice near the receiver so Carl could imagine his gin.
???Hey, Nicky,??? Carl???s watery voice came over. ???Sorry to bother you. I just thought you should know ??? your door is wide open, and that cat of yours is outside. It isn???t supposed to be, right????
I gave a non-commital grunt.
???I???d go over and check, but I???m a little under the weather,??? Carl said heavily.
???Don???t worry,??? I said. ???It???s time for me to go home anyway.???
It was a fifteen-minute drive, straight north along River Road. Driving into our development occasionally makes me shiver, the sheer number of gaping dark houses ??? homes that have never known inhabitants, or homes that have known owners and seen them ejected, the house standing triumphantly voided, humanless.
When Amy and I moved in, our only neighbors descended on us: one middle-aged single mom of three, bearing a casserole; a young father of triplets with a six-pack of beer (his wife left at home with the triplets); an older Christian couple who lived a few houses down; and of course, Carl from across the street. We sat out on our back deck and watched the river, and they all talked ruefully about ARMs, and zero percent interest, and zero money down, and then they all remarked how Amy and I were the only ones with river access, the only ones without children. ???Just the two of you? In this whole big house???? the single mom asked, doling out a scrambled-egg something.
???Just the two of us,??? I confirmed with a smile, and nodded in appreciation as I took a mouthful of wobbly egg.
???Seems lonely.???
On that she was right.
Four months later, the whole big house lady lost her mortgage battle and disappeared in the night with her three kids. Her house has remained empty. The living room window still has a child???s picture of a butterfly taped to it, the bright Magic Marker sun-faded to brown. One evening not long ago, I drove past and saw a man, bearded, bedraggled, staring out from behind the picture, floating in the dark like some sad aquarium fish. He saw me see him and flickered back into the depths of the house. The next day I left a brown paper bag full of sandwiches on the front step; it sat in the sun untouched for a week, decaying wetly, until I picked it back up and threw it out.
Quiet. The complex was always disturbingly quiet. As I neared our home, conscious of the noise of the car engine, I could see the cat was definitely on the steps. Still on the steps, twenty minutes after Carl???s call. This was strange. Amy loved the cat, the cat was declawed, the cat was never let outside, never ever, because the cat, Bleecker, was sweet but extremely stupid, and despite the LoJack tracking device pelleted somewhere in his fat furry rolls, Amy knew she???d never see the cat again if he ever got out. The cat would waddle straight into the Mississippi River ??? deedle-de-dum ??? and float all the way to the Gulf of Mexico into the maw of a hungry bull shark.
But it turned out the cat wasn???t even smart enough to get past the steps. Bleecker was perched on the edge of the porch, a pudgy but proud sentinel ??? Private Tryhard. As I pulled in to the drive, Carl came out and stood on his own front steps, and I could feel the cat and the old man both watching me as I got out of the car and walked toward the house, the red peonies along the border looking fat and juicy, asking to be devoured.
I was about to go into blocking position to get the cat when I saw that the front door was open. Carl had said as much, but seeing it was different. This wasn???t taking-out-the-trash-back-in-a-minute open. This was wide-gaping-ominous open.
Carl hovered across the way, waiting for my response, and like some awful piece of performance art, I felt myself enacting Concerned Husband. I stood on the middle step and frowned, then took the stairs quickly, two at a time, calling out my wife???s name.
Silence.
???Amy, you home????
I ran straight upstairs. No Amy. The ironing board was set up, the iron still on, a dress waiting to be pressed.
???Amy!???
As I ran back downstairs, I could see Carl still framed in the open doorway, hands on hips, watching. I swerved into the living room, and pulled up short. The carpet glinted with shards of glass, the coffee table shattered. End tables were on their sides, books slid across the floor like a card trick. Even the heavy antique ottoman was belly-up, its four tiny feet in the air like something dead. In the middle of the mess was a pair of good sharp scissors.
???Amy!???
I began running, bellowing her name. Through the kitchen, where a kettle was burning, down to the basement, where the guest room stood empty, and then out the back door. I pounded across our yard onto the slender boat deck leading out over the river. I peeked over the side to see if she was in our rowboat, where I had found her one day, tethered to the dock, rocking in the water, her face to the sun, eyes closed, and as I???d peered down into the dazzling reflections of the river, at her beautiful, still face, she???d suddenly opened her blue eyes and said nothing to me, and I???d said nothing back and gone into the house alone.
???Amy!???
She wasn???t on the water, she wasn???t in the house. Amy was not there.
Amy was gone.')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (4, 1, 4, N'Amy Elliott September 18, 2005', 1, N'??? Diary entry ???
Well, well, well. Guess who???s back? Nick Dunne, Brooklyn party boy, sugar-cloud kisser, disappearing act. Eight months, two weeks, couple of days, no word, and then he resurfaces, like it was all part of the plan. Turns out, he???d lost my phone number. His cell was out of juice, so he???d written it on a stickie. Then he???d tucked the stickie into his jeans pocket and put the jeans in the washer, and it turned the stickie into a piece of cyclone-shaped pulp. He tried to unravel it but could only see a 3 and an 8. (He said.)
And then work clobbered him and suddenly it was March and too embarrassingly late to try to find me. (He said.)
Of course I was angry. I had been angry. But now I???m not. Let me set the scene. (She said.) Today. Gusty September winds. I???m walking along Seventh Avenue, making a lunchtime contemplation of the sidewalk bodega bins ??? endless plastic containers of cantaloupe and honeydew and melon perched on ice like the day???s catch ??? and I could feel a man barnacling himself to my side as I sailed along, and I corner-eyed the intruder and realized who it was. It was him. The boy in ???I met a boy!???
I didn???t break my stride, just turned to him and said:
a) ???Do I know you???? (manipulative, challenging)
b) ???Oh, wow, I???m so happy to see you!??? (eager, doormatlike)
c) ???Go fuck yourself.??? (aggressive, bitter)
d) ???Well, you certainly take your time about it, don???t you, Nick???? (light, playful, laid-back)
Answer: D
And now we???re together. Together, together. It was that easy.
It???s interesting, the timing. Propitious, if you will. (And I will.) Just last night was my parents??? book party. Amazing Amy and the Big Day. Yup, Rand and Marybeth couldn???t resist. They???ve given their daughter???s namesake what they can???t give their daughter: a husband! Yes, for book twenty, Amazing Amy is getting married! Wheeeeeee. No one cares. No one wanted Amazing Amy to grow up, least of all me. Leave her in kneesocks and hair ribbons and let me grow up, unencumbered by my literary alter ego, my paperbound better half, the me I was supposed to be.
But Amy is the Elliott bread and butter, and she???s served us well, so I suppose I can???t begrudge her a perfect match. She???s marrying good old Able Andy, of course. They???ll be just like my parents: happy-happy.
Still, it was unsettling, the incredibly small order the publisher put in. A new Amazing Amy used to get a first print of a hundred thousand copies back in the ???80s. Now ten thousand. The book-launch party was, accordingly, unfabulous. Off-tone. How do you throw a party for a fictional character who started life as a precocious moppet of six and is now a thirty-year-old bride-to-be who still speaks like a child? (???Sheesh,??? thought Amy, ???my dear fiance?? sure is a grouch-monster when he doesn???t get his way ?????? That is an actual quote. The whole book made me want to punch Amy right in her stupid, spotless vagina.) The book is a nostalgia item, intended to be purchased by women who grew up with Amazing Amy, but I???m not sure who will actually want to read it. I read it, of course. I gave the book my blessing ??? multiple times. Rand and Marybeth feared that I might take Amy???s marriage as some jab at my perpetually single state. (???I, for one, don???t think women should marry before thirty-five,??? said my mom, who married my dad at twenty-three.)
My parents have always worried that I???d take Amy too personally ??? they always tell me not to read too much into her. And yet I can???t fail to notice that whenever I screw something up, Amy does it right: When I finally quit violin at age twelve, Amy was revealed as a prodigy in the next book. (???Sheesh, violin can be hard work, but hard work is the only way to get better!???) When I blew off the junior tennis championship at age sixteen to do a beach weekend with friends, Amy recommitted to the game. (???Sheesh, I know it???s fun to spend time with friends, but I???d be letting myself and everyone else down if I didn???t show up for the tournament.???) This used to drive me mad, but after I went off to Harvard (and Amy correctly chose my parents??? alma mater), I decided it was all too ridiculous to think about. That my parents, two child psychologists, chose this particular public form of passive-aggressiveness toward their child was not just fucked up but also stupid and weird and kind of hilarious. So be it.
The book party was as schizophrenic as the book ??? at Bluenight, off Union Square, one of those shadowy salons with wingback chairs and art deco mirrors that are supposed to make you feel like a Bright Young Thing. Gin martinis wobbling on trays lofted by waiters with rictus smiles. Greedy journalists with knowing smirks and hollow legs, getting the free buzz before they go somewhere better.
My parents circulate the room hand in hand ??? their love story is always part of the Amazing Amy story: husband and wife in mutual creative labor for a quarter century. Soul mates. They really call themselves that, which makes sense, because I guess they are. I can vouch for it, having studied them, little lonely only child, for many years. They have no harsh edges with each other, no spiny conflicts, they ride through life like conjoined jellyfish ??? expanding and contracting instinctively, filling each other???s spaces liquidly. Making it look easy, the soul-mate thing. People say children from broken homes have it hard, but the children of charmed marriages have their own particular challenges.
Naturally, I have to sit on some velvety banquette in the corner of the room, out of the noise, so I can give a few interviews to a sad handful of kid interns who???ve gotten stuck with the ???grab a quote??? assignment from their editors.
How does it feel to see Amy finally married to Andy? Because you???re not married, right?
Question asked by:
a) a sheepish, bug-eyed kid balancing a notebook on top of his messenger bag
b) an overdressed, sleek-haired young thing with fuck-me stilettos
c) an eager, tattooed rockabilly girl who seemed way more interested in Amy than one would guess a tattooed rockabilly girl would be
d) all of the above
Answer: D
Me: ???Oh, I???m thrilled for Amy and Andy, I wish them the best. Ha, ha.???
My answers to all the other questions, in no particular order:
???Some parts of Amy are inspired by me, and some are just fiction.???
???I???m happily single right now, no Able Andy in my life!???
???No, I don???t think Amy oversimplifies the male-female dynamic.???
???No, I wouldn???t say Amy is dated; I think the series is a classic.???
???Yes, I am single. No Able Andy in my life right now.???
???Why is Amy amazing and Andy???s just able? Well, don???t you know a lot of powerful, fabulous women who settle for regular guys, Average Joes and Able Andys? No, just kidding, don???t write that.???
???Yes, I am single.???
???Yes, my parents are definitely soul mates.???
???Yes, I would like that for myself one day.???
???Yep, single, motherfucker.???
Same questions over and over, and me trying to pretend they???re thought-provoking. And them trying to pretend they???re thought-provoking. Thank God for the open bar.
Then no one else wants to talk to me ??? that fast ??? and the PR girl pretends it???s a good thing: Now you can get back to your party! I wriggle back into the (small) crowd, where my parents are in full hosting mode, their faces flushed ??? Rand with his toothy prehistoric-monster-fish smile, Marybeth with her chickeny, cheerful head bobs, their hands intertwined, making each other laugh, enjoying each other, thrilled with each other ??? and I think, I am so fucking lonely.
I go home and cry for a while. I am almost thirty-two. That???s not old, especially not in New York, but fact is, it???s been years since I even really liked someone. So how likely is it I???ll meet someone I love, much less someone I love enough to marry? I???m tired of not knowing who I???ll be with, or if I???ll be with anyone.
I have many friends who are married ??? not many who are happily married, but many married friends. The few happy ones are like my parents: They???re baffled by my singleness. A smart, pretty, nice girl like me, a girl with so many interests and enthusiasms, a cool job, a loving family. And let???s say it: money. They knit their eyebrows and pretend to think of men they can set me up with, but we all know there???s no one left, no one good left, and I know that they secretly think there???s something wrong with me, something hidden away that makes me unsatisfiable, unsatisfying.
The ones who are not soul-mated ??? the ones who have settled ??? are even more dismissive of my singleness: It???s not that hard to find someone to marry, they say. No relationship is perfect, they say ??? they, who make do with dutiful sex and gassy bedtime rituals, who settle for TV as conversation, who believe that husbandly capitulation ??? yes, honey, okay, honey ??? is the same as concord. He???s doing what you tell him to do because he doesn???t care enough to argue, I think. Your petty demands simply make him feel superior, or resentful, and someday he will fuck his pretty, young coworker who asks nothing of him, and you will actually be shocked. Give me a man with a little fight in him, a man who calls me on my bullshit. (But who also kind of likes my bullshit.) And yet: Don???t land me in one of those relationships where we???re always pecking at each other, disguising insults as jokes, rolling our eyes and ???playfully??? scrapping in front of our friends, hoping to lure them to our side of an argument they could not care less about. Those awful if only relationships: This marriage would be great if only ??? and you sense the if only list is a lot longer than either of them realizes.
So I know I am right not to settle, but it doesn???t make me feel better as my friends pair off and I stay home on Friday night with a bottle of wine and make myself an extravagant meal and tell myself, This is perfect, as if I???m the one dating me. As I go to endless rounds of parties and bar nights, perfumed and sprayed and hopeful, rotating myself around the room like some dubious dessert. I go on dates with men who are nice and good-looking and smart ??? perfect-on-paper men who make me feel like I???m in a foreign land, trying to explain myself, trying to make myself known. Because isn???t that the point of every relationship: to be known by someone else, to be understood? He gets me. She gets me. Isn???t that the simple magic phrase?
So you suffer through the night with the perfect-on-paper man ??? the stutter of jokes misunderstood, the witty remarks lobbed and missed. Or maybe he understands that you???ve made a witty remark but, unsure of what to do with it, he holds it in his hand like some bit of conversational phlegm he will wipe away later. You spend another hour trying to find each other, to recognise each other, and you drink a little too much and try a little too hard. And you go home to a cold bed and think, That was fine. And your life is a long line of fine.
And then you run into Nick Dunne on Seventh Avenue as you???re buying diced cantaloupe, and pow, you are known, you are recognised, the both of you. You both find the exact same things worth remembering. (Just one olive, though). You have the same rhythm. Click. You just know each other. All of a sudden you see reading in bed and waffles on Sunday and laughing at nothing and his mouth on yours. And it???s so far beyond fine that you know you can never go back to fine. That fast. You think: Oh, here is the rest of my life. It???s finally arrived.')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (5, 1, 5, N'Nick Dunne', 1, N'I waited for the police first in the kitchen, but the acrid smell of the burnt teakettle was curling up in the back of my throat, underscoring my need to retch, so I drifted out on the front porch, sat on the top stair, and willed myself to be calm. I kept trying Amy???s cell, and it kept going to voice mail, that quick-clip cadence swearing she???d phone right back. Amy always phoned right back. It had been three hours, and I???d left five messages, and Amy had not phoned back.
I didn???t expect her to. I???d tell the police: Amy would never have left the house with the teakettle on. Or the door open. Or anything waiting to be ironed. The woman got shit done, and she was not one to abandon a project (say, her fixer-upper husband, for instance), even if she decided she didn???t like it. She???d made a grim figure on the Fiji beach during our two-week honeymoon, battling her way through a million mystical pages of The Wind-Up Bird Chronicle, casting pissy glances at me as I devoured thriller after thriller. Since our move back to Missouri, the loss of her job, her life had revolved (devolved?) around the completion of endless tiny, inconsequential projects. The dress would have been ironed.
And there was the living room, signs pointing to a struggle. I already knew Amy wasn???t phoning back. I wanted the next part to start.
It was the best time of day, the July sky cloudless, the slowly setting sun a spotlight on the east, turning everything golden and lush, a Flemish painting. The police rolled up. It felt casual, me sitting on the steps, an evening bird singing in the tree, these two cops getting out of their car at a leisurely pace, as if they were dropping by a neighborhood picnic. Kid cops, mid-twenties, confident and uninspired, accustomed to soothing worried parents of curfew-busting teens. A Hispanic girl, her hair in a long dark braid, and a black guy with a marine???s stance. Carthage had become a bit (a very tiny bit) less Caucasian while I was away, but it was still so severely segregated that the only people of color I saw in my daily routine tended to be occupational roamers: delivery men, medics, postal workers. Cops. (???This place is so white, it???s disturbing,??? said Amy, who, back in the melting pot of Manhattan, counted a single African-American among her friends. I accused her of craving ethnic window dressing, minorities as backdrops. It did not go well.)
???Mr Dunne? I???m Officer Vel??squez,??? said the woman, ???and this is Officer Riordan. We understand you???re concerned about your wife????
Riordan looked down the road, sucking on a piece of candy. I could see his eyes follow a darting bird out over the river. Then he snapped his gaze back toward me, his curled lips telling me he saw what everyone else did. I have a face you want to punch: I???m a working-class Irish kid trapped in the body of a total trust-fund douchebag. I smile a lot to make up for my face, but this only sometimes works. In college, I even wore glasses for a bit, fake spectacles with clear lenses that I thought would lend me an affable, unthreatening vibe. ???You do realize that makes you even more of a dick???? Go reasoned. I threw them out and smiled harder.
I waved in the cops: ???Come inside the house and see.???
The two climbed the steps, accompanied by the squeaking and shuffling noises of their belts and guns. I stood in the entry to the living room and pointed at the destruction.
???Oh,??? said Officer Riordan, and gave a brisk crack of his knuckles. He suddenly looked less bored.
Riordan and Vel??squez leaned forward in their seats at the dining room table as they asked me all the initial questions: who, where, how long. Their ears were literally pricked. A call had been made out of my hearing, and Riordan informed me that detectives were being dispatched. I had the grave pride of being taken seriously.
Riordan was asking me for the second time if I???d seen any strangers in the neighborhood lately, was reminding me for the third time about Carthage???s roving bands of homeless men, when the phone rang. I launched myself across the room and grabbed it.
A surly woman???s voice: ???Mr Dunne, this is Comfort Hill Assisted Living.??? It was where Go and I boarded our Alzheimer???s-riddled father.
???I can???t talk right now, I???ll call you back,??? I snapped, and hung up. I despised the women who staffed Comfort Hill: unsmiling, uncomforting. Underpaid, gruelingly underpaid, which was probably why they never smiled or comforted. I knew my anger toward them was misdirected ??? it absolutely infuriated me that my father lingered on while my mom was in the ground.
It was Go???s turn to send the check. I was pretty sure it was Go???s turn for July. And I???m sure she was positive it was mine. We???d done this before. Go said we must be mutually subliminally forgetting to mail those checks, that what we really wanted to forget was our dad.
I was telling Riordan about the strange man I???d seen in our neighbor???s vacated house when the doorbell rang. The doorbell rang. It sounded so normal, like I was expecting a pizza.
The two detectives entered with end-of-shift weariness. The man was rangy and thin, with a face that tapered severely into a dribble of a chin. The woman was surprisingly ugly ??? brazenly, beyond the scope of everyday ugly: tiny round eyes set tight as buttons, a long twist of a nose, skin spackled with tiny bumps, long lank hair the color of a dust bunny. I have an affinity for ugly women. I was raised by a trio of women who were hard on the eyes ??? my grandmother, my mom, her sister ??? and they were all smart and kind and funny and sturdy, good, good women. Amy was the first pretty girl I ever dated, really dated.
The ugly woman spoke first, an echo of Miss Officer Vel??squez. ???Mr Dunne? I???m Detective Rhonda Boney. This is my partner, Detective Jim Gilpin. We understand there are some concerns about your wife.???
My stomach growled loud enough for us all to hear it, but we pretended we didn???t.
???We take a look around, sir???? Gilpin said. He had fleshy bags under his eyes and scraggly white whiskers in his mustache. His shirt wasn???t wrinkled, but he wore it like it was; he looked like he should stink of cigarettes and sour coffee, even though he didn???t. He smelled like Dial soap.
I led them a few short steps to the living room, pointed once again at the wreckage, where the two younger cops were kneeling carefully, as if waiting to be discovered doing something useful. Boney steered me toward a chair in the dining room, away from but in view of the signs of struggle.
Rhonda Boney walked me through the same basics I???d told Vel??squez and Riordan, her attentive sparrow eyes on me. Gilpin squatted down on a knee, assessing the living room.
???Have you phoned friends or family, people your wife might be with???? Rhonda Boney asked.
???I ??? No. Not yet. I guess I was waiting for you all.???
???Ah.??? She smiled. ???Let me guess: baby of the family.???
???What????
???You???re the baby.???
???I have a twin sister.??? I sensed some internal judgment being made. ???Why???? Amy???s favorite vase was lying on the floor, intact, bumped up against the wall. It was a wedding present, a Japanese masterwork that Amy put away each week when our housecleaner came because she was sure it would get smashed.
???Just a guess of mine, why you???d wait for us: You???re used to someone else always taking the lead,??? Boney said. ???That???s what my little brother is like. It???s a birth-order thing.??? She scribbled something on a notepad.
???Okay.??? I gave an angry shrug. ???Do you need my sun sign too, or can we get started????
Boney smiled at me kindly, waiting.
???I waited to do something because, I mean, she???s obviously not with a friend,??? I said, pointing at the disarray in the living room.
???You???ve lived here, what, Mr Dunne, two years???? she asked.
???Two years September.???
???Moved from where????
???New York.???
???City????
???Yes.???
She pointed upstairs, asking permission without asking, and I nodded and followed her, Gilpin following me.
???I was a writer there,??? I blurted out before I could stop myself. Even now, two years back here, and I couldn???t bear for someone to think this was my only life.
Boney: ???Sounds impressive.???
Gilpin: ???Of what????
I timed my answer to my stair climbing: I wrote for a magazine (step), I wrote about pop culture (step) for a men???s magazine (step). At the top of the stairs, I turned to see Gilpin looking back at the living room. He snapped to.
???Pop culture???? he called up as he began climbing. ???What exactly does that entail????
???Popular culture,??? I said. We reached the top of the stairs, Boney waiting for us. ???Movies, TV, music, but, uh, you know, not high arts, nothing hifalutin.??? I winced: hifalutin? How patronizing. You two bumpkins probably need me to translate my English, Comma, Educated East Coast into English, Comma, Midwest Folksy. Me do sum scribbling of stuffs I get in my noggin after watchin??? them movin??? pitchers!
???She loves movies,??? Gilpin said, gesturing toward Boney. Boney nodded: I do.
???Now I own The Bar, downtown,??? I added. I taught a class at the junior college too, but to add that suddenly felt too needy. I wasn???t on a date.
Boney was peering into the bathroom, halting me and Gilpin in the hallway. ???The Bar???? she said. ???I know the place. Been meaning to drop by. Love the name. Very meta.???
???Sounds like a smart move,??? Gilpin said. Boney made for the bedroom, and we followed. ???A life surrounded by beer ain???t too bad.???
???Sometimes the answer is at the bottom of a bottle,??? I said, then winced again at the inappropriateness.
We entered the bedroom.
Gilpin laughed. ???Don???t I know that feeling.???
???See how the iron is still on???? I began.
Boney nodded, opened the door of our roomy closet, and walked inside, flipping on the light, fluttering her latexed hands over shirts and dresses as she moved toward the back. She made a sudden noise, bent down, turned around ??? holding a perfectly square box covered in elaborate silver wrapping.
My stomach seized.
???Someone???s birthday???? she asked.
???It???s our anniversary.???
Boney and Gilpin both twitched like spiders and pretended they didn???t.
By the time we returned to the living room, the kid officers were gone. Gilpin got down on his knees, eyeing the overturned ottoman.
???Uh, I???m a little freaked out, obviously,??? I started.
???I don???t blame you at all, Nick,??? Gilpin said earnestly. He had pale blue eyes that jittered in place, an unnerving tic.
???Can we do something? To find my wife. I mean, because she???s clearly not here.???
Boney pointed at the wedding portrait on the wall: me in my tux, a block of teeth frozen on my face, my arms curved formally around Amy???s waist; Amy, her blond hair tightly coiled and sprayed, her veil blowing in the beach breeze of Cape Cod, her eyes open too wide because she always blinked at the last minute and she was trying so hard not to blink. The day after Independence Day, the sulfur from the fireworks mingling with the ocean salt ??? summer.
The Cape had been good to us. I remember discovering several months in that Amy, my girlfriend, was also quite wealthy, a treasured only child of creative-genius parents. An icon of sorts, thanks to a namesake book series that I thought I could remember as a kid. Amazing Amy. Amy explained this to me in calm, measured tones, as if I were a patient waking from a coma. As if she???d had to do it too many times before and it had gone badly ??? the admission of wealth that???s greeted with too much enthusiasm, the disclosure of a secret identity that she herself didn???t create.
Amy told me who and what she was, and then we went out to the Elliotts??? historically registered home on Nantucket Sound, went sailing together, and I thought: I am a boy from Missouri, flying across the ocean with people who???ve seen much more than I have. If I began seeing things now, living big, I could still not catch up with them. It didn???t make me feel jealous. It made me feel content. I never aspired to wealth or fame. I was not raised by big-dreamer parents who pictured their child as a future president. I was raised by pragmatic parents who pictured their child as a future office worker of some sort, making a living of some sort. To me, it was heady enough to be in the Elliotts??? proximity, to skim across the Atlantic and return to a plushly restored home built in 1822 by a whaling captain, and there to prepare and eat meals of organic, healthful foods whose names I didn???t know how to pronounce. Quinoa. I remember thinking quinoa was a kind of fish.
So we married on the beach on a deep blue summer day, ate and drank under a white tent that billowed like a sail, and a few hours in, I sneaked Amy off into the dark, toward the waves, because I was feeling so unreal, I believed I had become merely a shimmer. The chilly mist on my skin pulled me back, Amy pulled me back, toward the golden glow of the tent, where the Gods were feasting, everything ambrosia. Our whole courtship was just like that.
Boney leaned in to examine Amy. ???Your wife is very pretty.???
???She is, she???s beautiful,??? I said, and felt my stomach lilt.
???What anniversary today???? she asked.
???Five.???
I was jittering from one foot to another, wanting to do something. I didn???t want them to discuss how lovely my wife was, I wanted them to go out and search for my fucking wife. I didn???t say this out loud, though; I often don???t say things out loud, even when I should. I contain and I compartmentalize to a disturbing degree: In my belly-basement are hundreds of bottles of rage, despair, fear, but you???d never guess from looking at me.
???Five, big one. Let me guess, reservations at Houston???s???? Gilpin asked. It was the only upscale restaurant in town. You all really need to try Houston???s, my mom had said when we moved back, thinking it was Carthage???s unique little secret, hoping it might please my wife.
???Of course, Houston???s.???
It was my fifth lie to the police. I was just starting.')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (6, 1, 6, N'Amy Elliott Dunne July 5, 2008', 1, N'I am fat with love! Husky with ardor! Morbidly obese with devotion! A happy, busy bumblebee of marital enthusiasm. I positively hum around him, fussing and fixing. I have become a strange thing. I have become a wife. I find myself steering the ship of conversations ??? bulkily, unnaturally ??? just so I can say his name aloud. I have become a wife, I have become a bore, I have been asked to forfeit my Independent Young Feminist card. I don???t care. I balance his checkbook, I trim his hair. I???ve gotten so retro, at one point I will probably use the word pocketbook, shuffling out the door in my swingy tweed coat, my lips painted red, on the way to the beauty parlor. Nothing bothers me. Everything seems like it will turn out fine, every bother transformed into an amusing story to be told over dinner. So I killed a hobo today, honey ??? hahahaha! Ah, we have fun!
Nick is like a good stiff drink: He gives everything the correct perspective. Not a different perspective, the correct perspective. With Nick, I realize it actually, truly doesn???t matter if the electricity bill is a few days late, if my latest quiz turns out a little lame. (My most recent, I???m not joking: ???What kind of tree would you be???? Me, I???m an apple tree! This means nothing!) It doesn???t matter if the new Amazing Amy book has been well and duly scorched, the reviews vicious, the sales a stunning plummet after a limp start. It doesn???t matter what color I paint our room, or how late traffic makes me, or whether our recycling really, truly does get recycled. (Just level with me, New York, does it?) It doesn???t matter, because I have found my match. It???s Nick, laid-back and calm, smart and fun and uncomplicated. Untortured, happy. Nice. Big penis.
All the stuff I don???t like about myself has been pushed to the back of my brain. Maybe that is what I like best about him, the way he makes me. Not makes me feel, just makes me. I am fun. I am playful. I am game. I feel naturally happy and entirely satisfied. I am a wife! It???s weird to say those words. (Seriously, about the recycling, New York ??? come on, just a wink.)
We do silly things, like last weekend we drove to Delaware because neither of us have ever had sex in Delaware. Let me set the scene, because now it really is for posterity. We cross the state line ??? Welcome to Delaware!, the sign says, and also: Small Wonder, and also: The First State, and also: Home of Tax-Free Shopping.
Delaware, a state of many rich identities.
I point Nick down the first dirt road I see, and we rumble five minutes until we hit pine trees on all sides. We don???t speak. He pushes his seat back. I pull up my skirt. I am not wearing undies, I can see his mouth turn down and his face go slack, the drugged, determined look he gets when he???s turned on. I climb atop him, my back to him, facing the windshield. I???m pressed against the steering wheel, and as we move together, the horn emits tiny bleats that mimic me, and my hand makes a smearing noise as I press it against the windshield. Nick and I can come anywhere; neither of us gets stage fright, it???s something we???re both rather proud of. Then we drive right back home. I eat beef jerky and ride with bare feet on the dashboard.
We love our house. The house that Amazing Amy built. A Brooklyn brownstone my parents bought for us, right on the Promenade, with the big wide-screen view of Manhattan. It???s extravagant, it makes me feel guilty, but it???s perfect. I battle the spoiled-rich-girl vibe where I can. Lots of DIY. We painted the walls ourselves over two weekends: spring green and pale yellow and velvety blue. In theory. None of the colors turned out like we thought they would, but we pretend to like them anyway. We fill our home with knickknacks from flea markets; we buy records for Nick???s record player. Last night we sat on the old Persian rug, drinking wine and listening to the vinyl scratches as the sky went dark and Manhattan switched on, and Nick said, ???This is how I always pictured it. This is exactly how I pictured it.???
On weekends, we talk to each other under four layers of bedding, our faces warm under a sunlit yellow comforter. Even the floorboards are cheerful: There are two old creaky slats that call out to us as we walk in the door. I love it, I love that it is ours, that we have a great story behind the ancient floor lamp, or the misshapen clay mug that sits near our coffeepot, never holding anything but a single paper clip. I spend my days thinking of sweet things to do for him ??? go buy a peppermint soap that will sit in his palm like a warm stone, or maybe a slim slice of trout that I could cook and serve to him, an ode to his riverboat days. I know, I am ridiculous. I love it, though ??? I never knew I was capable of being ridiculous over a man. It???s a relief. I even swoon over his socks, which he manages to shed in adorably tangled poses, as if a puppy carried them in from another room.
It is our one-year anniversary and I am fat with love, even though people kept telling and telling us the first year was going to be so hard, as if we were naive children marching off to war. It wasn???t hard. We are meant to be married. It is our one-year anniversary, and Nick is leaving work at lunchtime; my treasure hunt awaits him. The clues are all about us, about the past year together:
Whenever my sweet hubby gets a cold
It is this dish that will soon be sold.
Answer: the torn yum soup from Thai Town on President Street. The manager will be there this afternoon with a taster bowl and the next clue.
Also McMann???s in Chinatown and the Alice statue at Central Park. A grand tour of New York. We???ll end at the Fulton Street fish market, where we???ll buy a pair of beautiful lobsters, and I will hold the container in my lap as Nick jitters nervously in the cab beside me. We???ll rush home, and I will drop them in a new pot on our old stove with all the finesse of a girl who has lived many Cape summers while Nick giggles and pretends to hide in fear outside the kitchen door.
I had suggested we get burgers. Nick wanted us to go out ??? fivestar, fancy ??? somewhere with a clockwork of courses and name-dropping waiters. So the lobsters are a perfect in-between, the lobsters are what everyone tells us (and tells us and tells us) that marriage is about: compromise!
We???ll eat lobster with butter and have sex on the floor while a woman on one of our old jazz records sings to us in her far-side-of-the-tunnel voice. We???ll get slowly lazy-drunk on good Scotch, Nick???s favorite. I???ll give him his present ??? the monogrammed stationery he???s been wanting from Crane & Co. with the clean sans-serif font set in hunter green, on the thick creamy stock that will hold lush ink and his writer???s words. Stationery for a writer, and a writer???s wife who???s maybe angling for a love letter or two.
Then maybe we???ll have sex again. And a late-night burger. And more Scotch. Voil??: happiest couple on the block! And they say marriage is such hard work.')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (7, 1, 7, N'Nick Dunne', 1, N'Boney and Gilpin moved our interview to the police station, which looks like a failing community bank. They left me alone in a little room for forty minutes, me willing myself not to move. To pretend to be calm is to be calm, in a way. I slouched over the table, put my chin on my arm. Waited.
???Do you want to call Amy???s parents???? Boney had asked.
???I don???t want to panic them,??? I said. ???If we don???t hear from her in an hour, I???ll call.???
We???d done three rounds of that conversation.
Finally, the cops came in and sat at the table across from me. I fought the urge to laugh at how much it felt like a TV show. This was the same room I???d seen surfing through late-night cable for the past ten years, and the two cops ??? weary, intense ??? acted like the stars. Totally fake. Epcot Police Station. Boney was even holding a paper coffee cup and a manila folder that looked like a prop. Cop prop. I felt giddy, felt for a moment we were all pretend people: Let???s play the Missing Wife game!
???You okay there, Nick???? Boney asked.
???I???m okay, why????
???You???re smiling.???
The giddiness slid to the tiled floor. ???I???m sorry, it???s all just??????
???I know,??? Boney said, giving me a look that was like a hand pat. ???It???s too strange, I know.??? She cleared her throat. ???First of all, we want to make sure you???re comfortable here. You need anything, just let us know. The more information you can give us right now, the better, but you can leave at any time, that???s not a problem, either.???
???Whatever you need.???
???Okay, great, thank you,??? she said. ???Um, okay. I want to get the annoying stuff out of the way first. The crap stuff. If your wife was indeed abducted ??? and we don???t know that, but if it comes to that ??? we want to catch the guy, and when we catch the guy, we want to nail him, hard. No way out. No wiggle room.???
???Right.???
???So we have to rule you out real quick, real easy. So the guy can???t come back and say we didn???t rule you out, you know what I mean????
I nodded mechanically. I didn???t really know what she meant, but I wanted to seem as cooperative as possible. ???Whatever you need.???
???We don???t want to freak you out,??? Gilpin added. ???We just want to cover all the bases.???
???Fine by me.??? It???s always the husband, I thought. Everyone knows it???s always the husband, so why can???t they just say it: We suspect you because you are the husband, and it???s always the husband. Just watch Dateline.
???Okay, great, Nick,??? Boney said. ???First let???s get a swab of the inside of your cheek so we can rule out all of the DNA in the house that isn???t yours. Would that be okay????
???Sure.???
???I???d also like to take a quick sweep of your hands for gun shot residue. Again, just in case??????
???Wait, wait, wait. Have you found something that makes you think my wife was??????
???Nonono, Nick,??? Gilpin interrupted. He pulled a chair up to the table and sat on it backward. I wondered if cops actually did that. Or did some clever actor do that, and then cops began doing it because they???d seen the actors playing cops do that and it looked cool?
???It???s just smart protocol,??? Gilpin continued. ???We try to cover every base: Check your hands, get a swab, and if we could check out your car too ??????
???Of course. Like I said, whatever you need.???
???Thank you, Nick. I really appreciate it. Sometimes guys, they make things hard for us just because they can.???
I was exactly the opposite. My father had infused my childhood with unspoken blame; he was the kind of man who skulked around looking for things to be angry at. This had turned Go defensive and extremely unlikely to take unwarranted shit. It had turned me into a knee-jerk suckup to authority. Mom, Dad, teachers: Whatever makes your job easier, sir or madam. I craved a constant stream of approval. ???You???d literally lie, cheat, and steal ??? hell, kill ??? to convince people you are a good guy,??? Go once said. We were in line for knishes at Yonah Schimmel???s, not far from Go???s old New York apartment ??? that???s how well I remember the moment ??? and I lost my appetite because it was so completely true and I???d never realized it, and even as she was saying it, I thought: I will never forget this, this is one of those moments that will be lodged in my brain forever.
We made small talk, the cops and I, about the July Fourth fireworks and the weather, while my hands were tested for gunshot residue and the slick inside of my cheek was cotton-tipped. Pretending it was normal, a trip to the dentist.
When it was done, Boney put another cup of coffee in front of me, squeezed my shoulder. ???I???m sorry about that. Worst part of the job. You think you???re up to a few questions now? It???d really help us.???
???Yes, definitely, fire away.???
She placed a slim digital tape recorder on the table in front of me. ???You mind? This way you won???t have to answer the same questions over and over and over ?????? She wanted to tape me so I???d be nailed to one story. I should call a lawyer, I thought, but only guilty people need lawyers, so I nodded: No problem.
???So: Amy,??? Boney said. ???You two been living here how long????
???Just about two years.???
???And she???s originally from New York. City.???
???Yes.???
???She work, got a job???? Gilpin said.
???No. She used to write personality quizzes.???
The detectives swapped a look: Quizzes?
???For teen magazines, women???s magazines,??? I said. ???You know: ???Are you the jealous type? Take our quiz and find out! Do guys find you too intimidating? Take our quiz and find out!??????
???Very cool, I love those,??? Boney said. ???I didn???t know that was an actual job. Writing those. Like, a career.???
???Well, it???s not. Anymore. The Internet is packed with quizzes for free. Amy???s were smarter ??? she had a master???s in psychology ??? has a master???s in psychology.??? I guffawed uncomfortably at my gaffe. ???But smart can???t beat free.???
???Then what????
I shrugged. ???Then we moved back here. She???s just kind of staying at home right now.???
???Oh! You guys got kids, then???? Boney chirped, as if she had discovered good news.
???No.???
???Oh. So then what does she do most days????
That was my question too. Amy was once a woman who did a little of everything, all the time. When we moved in together, she???d made an intense study of French cooking, displaying hyper-quick knife skills and an inspired boeuf bourguignon. For her thirty-fourth birthday, we flew to Barcelona, and she stunned me by rolling off trills of conversational Spanish, learned in months of secret lessons. My wife had a brilliant, popping brain, a greedy curiosity. But her obsessions tended to be fueled by competition: She needed to dazzle men and jealous-ify women: Of course Amy can cook French cuisine and speak fluent Spanish and garden and knit and run marathons and day-trade stocks and fly a plane and look like a runway model doing it. She needed to be Amazing Amy, all the time. Here in Missouri, the women shop at Target, they make diligent, comforting meals, they laugh about how little high school Spanish they remember. Competition doesn???t interest them. Amy???s relentless achieving is greeted with open-palmed acceptance and maybe a bit of pity. It was about the worst outcome possible for my competitive wife: A town of contented also-rans.
???She has a lot of hobbies,??? I said.
???Anything worrying you???? Boney asked, looking worried. ???You???re not concerned about drugs or drinking? I???m not speaking ill of your wife. A lot of housewives, more than you???d guess, they pass the day that way. The days, they get long when you???re by yourself. And if the drinking turns to drugs ??? and I???m not talking heroin but even prescription painkillers ??? well, there are some pretty awful characters selling around here right now.???
???The drug trade has gotten bad,??? Gilpin said. ???We???ve had a bunch of police layoffs ??? one fifth of the force, and we were tight to begin with. I mean, it???s bad, we???re overrun.???
???Had a housewife, nice lady, get a tooth knocked out last month over some Oxycontin,??? Boney prompted.
???No, Amy might have a glass of wine or something, but not drugs.???
Boney eyed me; this was clearly not the answer she wanted. ???She have some good friends here? We???d like to call some of them, just make sure. No offense. Sometimes a spouse is the last to know when drugs are involved. People get ashamed, especially women.???
Friends. In New York, Amy made and shed friends weekly; they were like her projects. She???d get intensely excited about them: Paula who gave her singing lessons and had a wicked good voice (Amy went to boarding school in Massachusetts; I loved the very occasional times she got all New England on me: wicked good); Jessie from the fashion-design course. But then I???d ask about Jessie or Paula a month later, and Amy would look at me like I was making up words.
Then there were the men who were always rattling behind Amy, eager to do the husbandly things that her husband failed to do. Fix a chair leg, hunt down her favorite imported Asian tea. Men who she swore were her friends, just good friends. Amy kept them at exactly an arm???s distance ??? far enough away that I couldn???t get too annoyed, close enough that she could crook a finger and they???d do her bidding.
In Missouri ??? good God, I really didn???t know. It only occurred to me just then. You truly are an asshole, I thought. Two years we???d been here, and after the initial flurry of meet-and-greets, those manic first months, Amy had no one she regularly saw. She had my mom, who was now dead, and me ??? and our main form of conversation was attack and rebuttal. When we???d been back home for a year, I???d asked her faux gallantly: ???And how are you liking North Carthage, Mrs Dunne???? ???New Carthage, you mean???? she???d replied. I refused to ask her the reference, but I knew it was an insult.
???She has a few good friends, but they???re mostly back east.???
???Her folks????
???They live in New York. City.???
???And you still haven???t called any of these people???? Boney asked, a bemused smile on her face.
???I???ve been doing everything else you???ve been asking me to do. I haven???t had a chance.??? I???d signed away permission to trace credit cards and ATMs and track Amy???s cell phone, I???d handed over Go???s cell number and the name of Sue, the widow at The Bar, who could presumably attest to the time I arrived.
???Baby of the family.??? She shook her head. ???You really do remind me of my little brother.??? A beat. ???That???s a compliment, I swear.???
???She dotes on him,??? Gilpin said, scribbling in a notebook. ???Okay, so you left the house at about seven-thirty a.m., and you showed up at The Bar at about noon, and in between, you were at the beach.???
There???s a beachhead about ten miles north of our house, a not overly pleasant collection of sand and silt and beer-bottle shards. Trash barrels overflowing with Styrofoam cups and dirty diapers. But there is a picnic table upwind that gets nice sun, and if you stare directly at the river, you can ignore the other crap.
???I sometimes bring my coffee and the paper and just sit. Gotta make the most of summer.???
No, I hadn???t talked to anyone at the beach. No, no one saw me.
???It???s a quiet place midweek,??? Gilpin allowed.
If the police talked to anyone who knew me, they???d quickly learn that I rarely went to the beach and that I never sometimes brought my coffee to just enjoy the morning. I have Irish-white skin and an impatience for navel-gazing: A beach boy I am not. I told the police that because it had been Amy???s idea, for me to go sit in the spot where I could be alone and watch the river I loved and ponder our life together. She???d said this to me this morning, after we???d eaten her crepes. She leaned forward on the table and said, ???I know we are having a tough time. I still love you so much, Nick, and I know I have a lot of things to work on. I want to be a good wife to you, and I want you to be my husband and be happy. But you need to decide what you want.???
She???d clearly been practicing the speech; she smiled proudly as she said it. And even as my wife was offering me this kindness, I was thinking, Of course she has to stage-manage this. She wants the image of me and the wild running river, my hair ruffling in the breeze as I look out onto the horizon and ponder our life together. I can???t just go to Dunkin??? Donuts.
You need to decide what you want. Unfortunately for Amy, I had decided already.
Boney looked up brightly from her notes: ???Can you tell me what your wife???s blood type is???? she asked.
???Uh, no, I don???t know.???
???You don???t know your wife???s blood type????
???Maybe O???? I guessed.
Boney frowned, then made a drawn-out yoga-like sound. ???Okay, Nick, here are the things we are doing to help.??? She listed them: Amy???s cell was being monitored, her photo circulated, her credit cards tracked. Known sex offenders in the area were being interviewed. Our sparse neighborhood was being canvassed. Our home phone was tapped, in case any ransom calls came in.
I wasn???t sure what to say now. I raked my memory for the lines: What does the husband say at this point in the movie? Depends on whether he???s guilty or innocent.
???I can???t say that reassures me. Are you ??? is this an abduction, or a missing persons case, or what exactly is going on???? I knew the statistics, knew them from the same TV show I was starring in: If the first forty-eight hours didn???t turn up something in a case, it was likely to go unsolved. The first forty-eight hours were crucial. ???I mean, my wife is gone. My wife: is gone!??? I realized it was the first time I???d said it the way it should have been said: panicked and angry. My dad was a man of infinite varieties of bitterness, rage, distaste. In my lifelong struggle to avoid becoming him, I???d developed an inability to demonstrate much negative emotion at all. It was another thing that made me seem like a dick ??? my stomach could be all oiled eels, and you would get nothing from my face and less from my words. It was a constant problem: too much control or no control at all.
???Nick, we are taking this extremely seriously,??? Boney said. ???The lab guys are over at your place as we speak, and that will give us more information to go on. Right now, the more you can tell us about your wife, the better. What is she like????
The usual husband phrases came into my mind: She???s sweet, she???s great, she???s nice, she???s supportive.
???What is she like how???? I asked.
???Give me an idea of her personality,??? Boney prompted. ???Like, what did you get her for your anniversary? Jewelry????
???I hadn???t gotten anything quite yet,??? I said. ???I was going to do it this afternoon.??? I waited for her to laugh and say ???baby of the family??? again, but she didn???t.
???Okay. Well, then, tell me about her. Is she outgoing? Is she ??? I don???t know how to say this ??? is she New Yorky? Like what might come off to some as rude? Might rub people the wrong way????
???I don???t know. She???s not a never-met-a-stranger kind of person, but she???s not ??? not abrasive enough to make someone ??? hurt her.???
This was my eleventh lie. The Amy of today was abrasive enough to want to hurt, sometimes. I speak specifically of the Amy of today, who was only remotely like the woman I fell in love with. It had been an awful fairy-tale reverse transformation. Over just a few years, the old Amy, the girl of the big laugh and the easy ways, literally shed herself, a pile of skin and soul on the floor, and out stepped this new, brittle, bitter Amy. My wife was no longer my wife but a razor-wire knot daring me to unloop her, and I was not up to the job with my thick, numb, nervous fingers. Country fingers. Flyover fingers untrained in the intricate, dangerous work of solving Amy. When I???d hold up the bloody stumps, she???d sigh and turn to her secret mental notebook on which she tallied all my deficiencies, forever noting disappointments, frailties, shortcomings. My old Amy, damn, she was fun. She was funny. She made me laugh. I???d forgotten that. And she laughed. From the bottom of her throat, from right behind that small finger-shaped hollow, which is the best place to laugh from. She released her grievances like handfuls of birdseed: They are there, and they are gone.
She was not the thing she became, the thing I feared most: an angry woman. I was not good with angry women. They brought something out in me that was unsavory.
???She bossy???? Gilpin asked. ???Take-charge????
I thought of Amy???s calendar, the one that went three years into the future, and if you looked a year ahead, you would actually find appointments: dermatologist, dentist, vet. ???She???s a planner ??? she doesn???t, you know, wing anything. She likes to make lists and check things off. Get things done. That???s why this doesn???t make sense??????
???That can drive you crazy,??? Boney said sympathetically. ???If you???re not that type. You seem very B-personality.???
???I???m a little more laid-back, I guess,??? I said. Then I added the part I was supposed to add: ???We round each other out.???
I looked at the clock on the wall, and Boney touched my hand.
???Hey, why don???t you go ahead and give a call to Amy???s parents? I???m sure they???d appreciate it.???
It was past midnight. Amy???s parents went to sleep at nine p.m.; they were strangely boastful about this early bedtime. They???d be deep asleep by now, so this would be an urgent middle-of-the-night call. Cells went off at 8:45 always, so Rand Elliott would have to walk from his bed all the way to the end of the hall to pick up the old heavy phone; he???d be fumbling with his glasses, fussy with the table lamp. He???d be telling himself all the reasons not to worry about a late-night phone call, all the harmless reasons the phone might be ringing.
I dialed twice and hung up before I let the call ring through. When I did, it was Marybeth, not Rand, who answered, her deep voice buzzing my ears. I???d only gotten to ???Marybeth, this is Nick??? when I lost it.
???What is it, Nick????
I took a breath.
???Is it Amy? Tell me.???
???I uh ??? I???m sorry I should have called??????
???Tell me, goddamn it!???
???We c-can???t find Amy,??? I stuttered.
???You can???t find Amy????
???I don???t know??????
???Amy is missing????
???We don???t know that for sure, we???re still??????
???Since when????
???We???re not sure. I left this morning, a little after seven??????
???And you waited till now to call us????
???I???m sorry, I didn???t want to??????
???Jesus Christ. We played tennis tonight. Tennis, and we could have been ??? My God. Are the police involved? You???ve notified them????
???I???m at the station right now.???
???Put on whoever???s in charge, Nick. Please.???
Like a kid, I went to fetch Gilpin. My mommy-in-law wants to talk to you.
Phoning the Elliotts made it official. The emergency ??? Amy is gone ??? was spreading to the outside.
I was heading back to the interview room when I heard my father???s voice. Sometimes, in particularly shameful moments, I heard his voice in my head. But this was my father???s voice, here. His words emerged in wet bubbles like something from a rancid bog. Bitch bitch bitch. My father, out of his mind, had taken to flinging the word at any woman who even vaguely annoyed him: bitch bitch bitch. I peered inside a conference room, and there he sat on a bench against the wall. He had been a handsome man once, intense and cleft-chinned. Jarringly dreamy was how my aunt had described him. Now he sat muttering at the floor, his blond hair matted, trousers muddy and arms scratched, as if he???d fought his way through a thornbush. A line of spittle glimmered down his chin like a snail???s trail, and he was flexing and unflexing arm muscles that had not yet gone to seed. A tense female officer sat next to him, her lips in an angry pucker, trying to ignore him: Bitch bitch bitch I told you bitch.
???What???s going on???? I asked her. ???This is my father.???
???You got our call????
???What call????
???To come get your father.??? She overenunciated, as if I were a dim ten-year-old.
???I ??? My wife is missing. I???ve been here most of the night.???
She stared at me, not connecting in the least. I could see her debating whether to sacrifice her leverage and apologise, inquire. Then my father started up again, bitch bitch bitch, and she chose to keep the leverage.
???Sir, Comfort Hill has been trying to contact you all day. Your father wandered out a fire exit early this morning. He???s got a few scratches and scrapes, as you can see, but no damage. We picked him up a few hours ago, walking down River Road, disoriented. We???ve been trying to reach you.???
???I???ve been right here,??? I said. ???Right goddamn next door, how did no one put this together????
Bitch bitch bitch, said my dad.
???Sir, please don???t take that tone with me.???
Bitch bitch bitch.
Boney ordered an officer ??? male ??? to drive my dad back to the home so I could finish up with them. We stood on the stairs outside the police station, watched him get settled into the car, still muttering. The entire time he never registered my presence. When they drove off, he didn???t even look back.
???You guys not close???? she asked.
???We are the definition of not close.???
The police finished with their questions and hustled me into a squad car at about two a.m. with advice to get a good night???s sleep and return at eleven a.m. for a 12-noon press conference.
I didn???t ask if I could go home. I had them take me to Go???s, because I knew she???d stay up and have a drink with me, fix me a sandwich. It was, pathetically, all I wanted right then: a woman to fix me a sandwich and not ask me any questions.
???You don???t want to go look for her???? Go offered as I ate. ???We can drive around.???
???That seems pointless,??? I said dully. ???Where do I look????
???Nick, this is really fucking serious.???
???I know, Go.???
???Act like it, okay, Lance? Don???t fucking myuhmyuhmyuh.??? It was a thick-tongued noise, the noise she always made to convey my indecisiveness, accompanied by a dazed rolling of the eyes and the dusting off of my legal first name. No one who has my face needs to be called Lance. She handed me a tumbler of Scotch. ???And drink this, but only this. You don???t want to be hungover tomorrow. Where the fuck could she be? God, I feel sick to my stomach.??? She poured herself a glass, gulped, then tried to sip, pacing around the kitchen. ???Aren???t you worried, Nick? That some guy, like, saw her on the street and just, just decided to take her? Hit her on the head and??????
I started. ???Why did you say hit her on the head, what the fuck is that????
???I???m sorry, I didn???t mean to paint a picture, I just ??? I don???t know, I just keep thinking. About some crazy person.??? She splashed some more Scotch into her tumbler.
???Speaking of crazy people,??? I said, ???Dad got out again today, they found him wandering down River Road. He???s back at Comfort now.???
She shrugged: okay. It was the third time in six months that our dad had slipped out. Go was lighting a cigarette, her thoughts still on Amy. ???I mean, isn???t there someone we can go talk to???? she asked. ???Something we can do????
???Jesus, Go! You really need me to feel more fucking impotent than I do right now???? I snapped. ???I have no idea what I???m supposed to be doing. There???s no ???When Your Wife Goes Missing 101.??? The police told me I could leave. I left. I???m just doing what they tell me.???
???Of course you are,??? murmured Go, who had a long-stymied mission to turn me into a rebel. It wouldn???t take. I was the kid in high school who made curfew; I was the writer who hit my deadlines, even the fake ones. I respect rules, because if you follow rules, things go smoothly, usually.
???Fuck, Go, I???m back at the station in a few hours, okay? Can you please just be nice to me for a second? I???m scared shitless.???
We had a five-second staring contest, then Go filled up my glass one more time, an apology. She sat down next to me, put a hand on my shoulder.
???Poor Amy,??? she said.')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (8, 1, 8, N'Amy Elliott Dunne April 21, 2009', 1, N'??? Diary entry ???
Poor me. Let me set the scene: Campbell and Insley and I are all down in Soho, having dinner at Tableau. Lots of goat-cheese tarts, lamb meatballs and rocket greens, I???m not sure what all the fuss is about. But we are working backward: dinner first, then drinks in one of the little nooks Campbell has reserved, a mini-closet where you can lounge expensively in a place that???s not too different from, say, your living room. But fine, it???s fun to do the silly, trendy things sometimes. We are all overdressed in our little flashy frocks, our slasher heels, and we all eat small plates of food bites that are as decorative and unsubstantial as we are.
We???ve discussed having our husbands drop by to join us for the drinks portion. So there we are, post-dinner, tucked into our nook, mojitos and martinis and my bourbon delivered to us by a waitress who could be auditioning for the small role of Fresh-faced Girl Just Off the Bus.
We are running out of things to say; it is a Tuesday, and no one is feeling like it is anything but. The drinks are being carefully drunk: Insley and Campbell both have vague appointments the next morning, and I have work, so we aren???t gearing up for a big night, we are winding down, and we are getting dull-witted, bored. We would leave if we weren???t waiting for the possible appearance of the men. Campbell keeps peeking at her BlackBerry, Insley studies her flexed calves from different angles. John arrives first ??? huge apologies to Campbell, big smiles and kisses for us all, a man just thrilled to be here, just delighted to arrive at the tail-end of a cocktail hour across town so he can guzzle a drink and head home with his wife. George shows up about twenty minutes later ??? sheepish, tense, a terse excuse about work, Insley snapping at him, ???You???re forty minutes late,??? him nipping back, ???Yeah, sorry about making us money.??? The two barely talking to each other as they make conversation with everyone else.
Nick never shows; no call. We wait another forty-five minutes, Campbell solicitous (???Probably got hit with some last-minute deadline,??? she says, and smiles toward good old John, who never lets last-minute deadlines interfere with his wife???s plans); Insley???s anger thawing toward her husband as she realizes he is only the second-biggest jackass of the group (???You sure he hasn???t even texted, sweetie????).
Me, I just smile: ???Who knows where he is ??? I???ll catch him at home.??? And then it is the men of the group who look stricken: You mean that was an option? Take a pass on the night with no nasty consequences? No guilt or anger or sulking?
Well, maybe not for you guys.
Nick and I, we sometimes laugh, laugh out loud, at the horrible things women make their husbands do to prove their love. The pointless tasks, the myriad sacrifices, the endless small surrenders. We call these men the dancing monkeys.
Nick will come home, sweaty and salty and beer-loose from a day at the ballpark, and I???ll curl up in his lap, ask him about the game, ask him if his friend Jack had a good time, and he???ll say, ???Oh, he came down with a case of the dancing monkeys ??? poor Jennifer was having a ???real stressful week??? and really needed him at home.???
Or his buddy at work, who can???t go out for drinks because his girlfriend really needs him to stop by some bistro where she is having dinner with a friend from out of town. So they can finally meet. And so she can show how obedient her monkey is: He comes when I call, and look how well groomed!
Wear this, don???t wear that. Do this chore now and do this chore when you get a chance and by that I mean now. And definitely, definitely, give up the things you love for me, so I will have proof that you love me best. It???s the female pissing contest ??? as we swan around our book clubs and our cocktail hours, there are few things women love more than being able to detail the sacrifices our men make for us. A call-and-response, the response being: ???Ohhh, that???s so sweet.???
I am happy not to be in that club. I don???t partake, I don???t get off on emotional coercion, on forcing Nick to play some happy-hubby role ??? the shrugging, cheerful, dutiful taking out the trash, honey! role. Every wife???s dream man, the counterpoint to every man???s fantasy of the sweet, hot, laid-back woman who loves sex and a stiff drink.
I like to think I am confident and secure and mature enough to know Nick loves me without him constantly proving it. I don???t need pathetic dancing-monkey scenarios to repeat to my friends, I am content with letting him be himself.
I don???t know why women find that so hard.
When I get home from dinner, my cab pulls up just as Nick is getting out of his own taxi, and he stands in the street with his arms out to me and a huge grin on his face ??? ???Baby!??? ??? and I run and I jump up into his arms and he presses a stubbly cheek against mine.
???What did you do tonight???? I ask.
???Some guys were playing poker after work, so I hung around for a bit. Hope that was okay.???
???Of course,??? I say. ???More fun than my night.???
???Who all showed up????
???Oh, Campbell and Insley and their dancing monkeys. Boring. You dodged a bullet. A really lame bullet.???
He squeezes me into him ??? those strong arms ??? and hauls me up the stairs. ???God, I love you,??? he says.
Then comes sex and a stiff drink and a night of sleep in a sweet, exhausted rats??? tangle in our big, soft bed. Poor me.')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (9, 1, 9, N'Nick Dunne One Day Gone', 1, N'I didn???t listen to Go about the booze. I finished half the bottle sitting on her sofa by myself, my eighteenth burst of adrenaline kicking in just when I thought I???d finally go to sleep: My eyes were shutting, I was shifting my pillow, my eyes were closed, and then I saw my wife, blood clotting her blond hair, weeping and blind in pain, scraping herself along our kitchen floor. Calling my name. Nick, Nick, Nick!
I took repeated tugs on the bottle, psyching myself up for sleep, a losing routine. Sleep is like a cat: It only comes to you if you ignore it. I drank more and continued my mantra. Stop thinking, swig, empty your head, swig, now, seriously, empty your head, do it now, swig. You need to be sharp tomorrow, you need to sleep! Swig. I got nothing more than a fussy nap toward dawn, woke up an hour later with a hangover. Not a disabling hangover, but decent. I was tender and dull. Fuggy. Maybe still a little drunk. I stutterwalked to Go???s Subaru, the movement feeling alien, like my legs were on backward. I had temporary ownership of the car; the police had graciously accepted my gently used Jetta for inspection along with my laptop ??? all just a formality, I was assured. I drove home to get myself some decent clothes.
Three police cruisers sat on my block, our very few neighbors milling around. No Carl, but there was Jan Teverer ??? the Christian lady ??? and Mike, the father of the three-year-old IVF triplets ??? Taylor, Topher, and Talullah. (???I hate them all, just by name,??? said Amy, a grave judge of anything trendy. When I mentioned that the name Amy was once trendy, my wife said, ???Nick, you know the story of my name.??? I had no idea what she was talking about.)
Jan nodded from a distance without meeting my eyes, but Mike strode over to me as I got out of my car. ???I???m so sorry, man, anything I can do, you let me know. Anything. I did the mowing this morning, so at least you don???t needta worry about that.???
Mike and I took turns mowing all the abandoned foreclosed properties in the complex ??? heavy rains in the spring had turned yards into jungles, which encouraged an influx of raccoons. We had raccoons everywhere, gnawing through our garbage late at night, sneaking into our basements, lounging on our porches like lazy house pets. The mowing didn???t seem to make them go away, but we could at least see them coming now.
???Thanks, man, thank you,??? I said.
???Man, my wife, she???s been hysterical since she heard,??? he said. ???Absolutely hysterical.???
???I???m so sorry to hear that,??? I said. ???I gotta?????? I pointed at my door.
???Just sitting around, crying over pictures of Amy.???
I had no doubt that a thousand Internet photos had popped up overnight, just to feed the pathetic needs of women like Mike???s wife. I had no sympathy for drama queens.
???Hey, I gotta ask?????? Mike started.
I patted his arm and pointed again at the door, as if I had pressing business. I turned away before he could ask any questions and knocked on the door of my own house.
Officer Vel??squez escorted me upstairs, into my own bedroom, into my own closet ??? past the silvery perfect-square gift box ??? and let me rifle through my things. It made me tense, selecting clothes in front of this young woman with the long brown braid, this woman who had to be judging me, forming an opinion. I ended up grabbing blindly: The final look was business-casual, slacks and short sleeves, like I was going to a convention. It would make an interesting essay, I thought, picking out appropriate clothes when a loved one goes missing. The greedy, angle-hungry writer in me, impossible to turn off.
I jammed it all into a bag and turned back around, looking at the gift box on the floor. ???Could I look inside???? I asked her.
She hesitated, then played it safe. ???No, I???m sorry, sir. Better not right now.???
The edge of the gift wrapping had been carefully slit. ???Has somebody looked inside????
She nodded.
I stepped around Vel??squez toward the box. ???If it???s already been looked at then??????
She stepped in front of me. ???Sir, I can???t let you do that.???
???This is ridiculous. It???s for me from my wife??????
I stepped back around her, bent down, and had one hand on the corner of the box when she slapped an arm across my chest from behind. I felt a momentary spurt of fury, that this woman presumed to tell me what to do in my own home. No matter how hard I try to be my mother???s son, my dad???s voice comes into my head unbidden, depositing awful thoughts, nasty words.
???Sir, this is a crime scene, you??????
Stupid bitch.
Suddenly her partner, Riordan, was in the room and on me too, and I was shaking them off ??? fine, fine, fuck ??? and they were forcing me down the stairs. A woman was on all fours near the front door, squirreling along the floorboards, searching, I assume for blood spatter. She looked up at me impassively, then back down.
I forced myself to decompress as I drove back to Go???s to dress. This was only one in a long series of annoying and asinine things the police would do in the course of this investigation (I like rules that make sense, not rules without logic), so I needed to calm down: Do not antagonize the cops, I told myself. Repeat if necessary: Do not antagonize the cops.
I ran into Boney as I entered the police station, and she said, ???Your in-laws are here, Nick??? in an encouraging tone, like she was offering me a warm muffin.
Marybeth and Rand Elliott were standing with their arms around each other. Middle of the police station, they looked like they were posing for prom photos. That???s how I always saw them, hands patting, chins nuzzling, cheeks rubbing. Whenever I visited the Elliott home, I became an obsessive throat-clearer ??? I???m about to enter ??? because the Elliotts could be around any corner, cherishing each other. They kissed each other full on the mouth whenever they were parting, and Rand would cup his wife???s rear as he passed her. It was foreign to me. My parents divorced when I was twelve, and I think maybe, when I was very young, I witnessed a chaste cheek kiss between the two when it was impossible to avoid. Christmas, birthdays. Dry lips. On their best married days, their communications were entirely transactional: We???re out of milk again. (I???ll get some today.) I need this ironed properly. (I???ll do that today.) How hard is it to buy milk? (Silence.) You forgot to call the plumber. (Sigh.) Goddammit, put on your coat, right now, and go out and get some goddamn milk. Now. These messages and orders brought to you by my father, a mid-level phone-company manager who treated my mother at best like an incompetent employee. At worst? He never beat her, but his pure, inarticulate fury would fill the house for days, weeks, at a time, making the air humid, hard to breathe, my father stalking around with his lower jaw jutting out, giving him the look of a wounded, vengeful boxer, grinding his teeth so loud you could hear it across the room. Throwing things near her but not exactly at her. I???m sure he told himself: I never hit her. I???m sure because of this technicality he never saw himself as an abuser. But he turned our family life into an endless road trip with bad directions and a rage-clenched driver, a vacation that never got a chance to be fun. Don???t make me turn this car around. Please, really, turn it around.
I don???t think my father???s issue was with my mother in particular. He just didn???t like women. He thought they were stupid, inconsequential, irritating. That dumb bitch. It was his favorite phrase for any woman who annoyed him: a fellow motorist, a waitress, our grade school teachers, none of whom he ever actually met, parent-teacher conferences stinking of the female realm as they did. I still remember when Geraldine Ferraro was named the 1984 vice presidential candidate, us all watching it on the news before dinner. My mother, my tiny, sweet mom, put her hand on the back of Go???s head and said, Well, I think it???s wonderful. And my dad flipped the TV off and said, It???s a joke. You know it???s a goddamn joke. Like watching a monkey ride a bike.
It took another five years before my mother finally decided she was done. I came home from school one day and my father was gone. He was there in the morning and gone by the afternoon. My mom sat us down at the dining table and announced, ???Your father and I have decided it would be best for everyone if we live apart,??? and Go burst into tears and said, ???Good, I hate you both!??? and then, instead of running to her room like the script called for, she went to my mom and hugged her.
So my father went away and my thin, pained mother got fat and happy ??? fairly fat and extremely happy ??? as if she were supposed to be that way all along: a deflated balloon taking in air. Within a year, she???d morphed into the busy, warm, cheerful lady she???d be till she died, and her sister said things like ???Thank God the old Maureen is back,??? as if the woman who raised us was an imposter.
As for my father, for years I spoke to him on the phone about once a month, the conversations polite and newsy, a recital of things that happened. The only question my father ever asked about Amy was ???How is Amy?,??? which was not meant to elicit any answer beyond ???She???s fine.??? He remained stubbornly distant even as he faded into dementia in his sixties. If you???re always early, you???re never late. My dad???s mantra, and that included the onset of Alzheimer???s ??? a slow decline into a sudden, steep drop that forced us to move our independent, misogynistic father to a giant home that stank of chicken broth and piss, where he???d be surrounded by women helping him at all times. Ha.
My dad had limitations. That???s what my good-hearted mom always told us. He had limitations, but he meant no harm. It was kind of her to say, but he did do harm. I doubt my sister will ever marry: If she???s sad or upset or angry, she needs to be alone ??? she fears a man dismissing her womanly tears. I???m just as bad. The good stuff in me I got from my mom. I can joke, I can laugh, I can tease, I can celebrate and support and praise ??? I can operate in sunlight, basically ??? but I can???t deal with angry or tearful women. I feel my father???s rage rise up in me in the ugliest way. Amy could tell you about that. She would definitely tell you, if she were here.
I watched Rand and Marybeth for a moment before they saw me. I wondered how furious they???d be with me. I had committed an unforgivable act, not phoning them for so long. Because of my cowardice, my in-laws would always have that night of tennis lodged in their imagination: the warm evening, the lazy yellow balls bumping along the court, the squeak of tennis shoes, the average Thursday night they???d spent while their daughter was disappeared.
???Nick,??? Rand Elliott said, spotting me. He took three big strides toward me, and as I braced myself for a punch, he hugged me desperately hard.
???How are you holding up???? he whispered into my neck, and began rocking. Finally, he gave a high-pitched gulp, a swallowed sob, and gripped me by the arms. ???We???re going to find Amy, Nick. It can???t go any other way. Believe that, okay???? Rand Elliott held me in his blue stare for a few more seconds, then broke up again ??? three girlish gasps burst from him like hiccups ??? and Marybeth moved into the huddle, buried her face in her husband???s armpit.
When we parted, she looked up at me with giant stunned eyes. ???It???s just a ??? just a goddamn nightmare,??? she said. ???How are you, Nick????
When Marybeth asked How are you, it wasn???t a courtesy, it was an existential question. She studied my face, and I was sure she was studying me, and would continue to note my every thought and action. The Elliotts believed that every trait should be considered, judged, categorized. It all means something, it can all be used. Mom, Dad, Baby, they were three advanced people with three advanced degrees in psychology ??? they thought more before nine a.m. than most people thought all month. I remember once declining cherry pie at dinner, and Rand cocked his head and said, ???Ahh! Iconoclast. Disdains the easy, symbolic patriotism.??? And when I tried to laugh it off and said, well, I didn???t like cherry cobbler either, Marybeth touched Rand???s arm: ???Because of the divorce. All those comfort foods, the desserts a family eats together, those are just bad memories for Nick.???
It was silly but incredibly sweet, these people spending so much energy trying to figure me out. The answer: I don???t like cherries.
By eleven-thirty, the station was a rolling boil of noise. Phones were ringing, people were yelling across the room. A woman whose name I never caught, whom I registered only as a chattering bobblehead of hair, suddenly made her presence known at my side. I had no idea how long she???d been there: ?????? and the main point of this, Nick, is just to get people looking for Amy and knowing she has a family who loves her and wants her back. This will be very controlled. Nick, you will need to ??? Nick????
???Yep.???
???People will want to hear a quick statement from her husband.???
From across the room, Go was darting toward me. She???d dropped me at the station, then run by The Bar to take care of bar things for thirty minutes, and now she was back, acting like she???d abandoned me for a week, zigzagging between desks, ignoring the young officer who???d clearly been assigned to usher her in, neatly, in a hushed, dignified manner.
???Okay so far???? Go said, squeezing me with one arm, the dude hug. The Dunne kids don???t perform hugs well. Go???s thumb landed on my right nipple. ???I wish Mom was here,??? she whispered, which was what I???d been thinking. ???No news???? she asked when she pulled away.
???Nothing, fucking nothing??????
???You look like you feel awful.???
???I feel like fucking shit.??? I was about to say what an idiot I was, not listening to her about the booze.
???I would have finished the bottle, too.??? She patted my back.
???It???s almost time,??? the PR woman said, again appearing magically.
???It???s not a bad turnout for a July fourth weekend.??? She started herding us all toward a dismal conference room ??? aluminum blinds and folding chairs and a clutch of bored reporters ??? and up onto the platform. I felt like a third-tier speaker at a mediocre convention, me in my business-casual blues, addressing a captive audience of jet-lagged people daydreaming about what they???d eat for lunch. But I could see the journalists perk up when they caught sight of me ??? let???s say it: a young, decent-looking guy ??? and then the PR woman placed a cardboard poster on a nearby easel, and it was a blown-up photo of Amy at her most stunning, that face that made you keep double-checking: She can???t be that good-looking, can she? She could, she was, and I stared at the photo of my wife as the cameras snapped photos of me staring at the photo. I thought of that day in New York when I found her again: the blond hair, the back of her head, was all I could see, but I knew it was her, and I saw it as a sign. How many millions of heads had I seen in my life, but I knew this was Amy???s pretty skull floating down Seventh Avenue in front of me. I knew it was her, and that we would be together.
Cameras flashed. I turned away and saw spots. It was surreal. That???s what people always say to describe moments that are merely unusual. I thought: You have no fucking idea what surreal is. My hangover was really warming up now, my left eye throbbing like a heart.
The cameras were clicking, and the two families stood together, all of us with mouths in thin slits, Go the only one looking even close to a real person. The rest of us looked like placeholder humans, bodies that had been dollied in and propped up. Amy, over on her easel, looked more present. We???d all seen these news conferences before ??? when other women went missing. We were being forced to perform the scene that TV viewers expected: the worried but hopeful family. Caffeine-dazed eyes and ragdoll arms.
My name was being said; the room gave a collective gulp of expectation. Showtime.
When I saw the broadcast later, I didn???t recognise my voice. I barely recognised my face. The booze floating, sludgelike, just beneath the surface of my skin made me look like a fleshy wastrel, just sensuous enough to be disreputable. I had worried about my voice wavering, so I overcorrected and the words came out clipped, like I was reading a stock report. ???We just want Amy to get home safe ?????? Utterly unconvincing, disconnected. I might as well have been reading numbers at random.
Rand Elliott stepped up and tried to save me: ???Our daughter, Amy, is a sweetheart of a girl, full of life. She???s our only child, and she???s smart and beautiful and kind. She really is Amazing Amy. And we want her back. Nick wants her back.??? He put a hand on my shoulder, wiped his eyes, and I involuntarily turned steel. My father again: Men don???t cry.
Rand kept talking: ???We all want her back where she belongs, with her family. We???ve set up a command center over at the Days Inn ??????
The news reports would show Nick Dunne, husband of the missing woman, standing metallically next to his father-in-law, arms crossed, eyes glazed, looking almost bored as Amy???s parents wept. And then worse. My longtime response, the need to remind people I wasn???t a dick, I was a nice guy despite the affectless stare, the haughty, douchebag face.
So there it came, out of nowhere, as Rand begged for his daughter???s return: a killer smile.')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (10, 1, 10, N'Amy Elliott Dunne July 5, 2010', 1, N'??? Diary entry ???
I won???t blame Nick. I don???t blame Nick. I refuse ??? refuse! ??? to turn into some pert-mouthed, strident angry-girl. I made two promises to myself when I married Nick. One: no dancing-monkey demands. Two: I would never, ever say, Sure, that???s fine by me (if you want to stay out later, if you want to do a boys??? weekend, if you want to do something you want to do) and then punish him for doing what I said was fine by me. I worry I am coming perilously close to violating both of those promises.
But still. It is our third wedding anniversary and I am alone in our apartment, my face all mask-tight from tears because, well, because: Just this afternoon, I get a voice mail from Nick, and I already know it???s going to be bad, I know the second the voice mail begins because I can tell he???s calling from his cell and I can hear men???s voices in the background and a big, roomy gap, like he???s trying to decide what to say, and then I hear his taxi-blurred voice, a voice that is already wet and lazy with booze, and I know I am going to be angry ??? that quick inhale, the lips going tight, the shoulders up, the I so don???t want to be mad but I???m going to be feeling. Do men not know that feeling? You don???t want to be mad, but you???re obligated to be, almost. Because a rule, a good rule, a nice rule is being broken. Or maybe rule is the wrong word. Protocol? Nicety? But the rule/protocol/nicety ??? our anniversary ??? is being broken for a good reason, I understand, I do. The rumors were true: Sixteen writers have been laid off at Nick???s magazine. A third of the staff. Nick has been spared, for now, but of course he feels obliged to take the others out to get drunk. They are men, piled in a cab, heading down Second Avenue, pretending to be brave. A few have gone home to their wives, but a surprising number have stayed out. Nick will spend the night of our anniversary buying these men drinks, going to strip clubs and cheesy bars, flirting with twenty-two-year-olds (My friend here just got laid off, he could use a hug). These jobless men will proclaim Nick a great guy as he buys their drinks on a credit card linked to my bank account. Nick will have a grand old time on our anniversary, which he didn???t even mention in the message. Instead, he said, I know we had plans but ???
I am being a girl. I just thought it???d be a tradition: All across town, I have strewn little love messages, reminders of our past year together, my treasure hunt. I can picture the third clue, fluttering from a piece of scotch tape in the crook of the V of the Robert Indiana love sculpture up near Central Park. Tomorrow, some bored twelve-year-old tourist stumbling along behind his parents is going to pick it off, read it, shrug, and let it float away like a gum wrapper.
My treasure-hunt finale was perfect, but isn???t now. It???s an absolutely gorgeous vintage briefcase. Leather. Third anniversary is leather. A work-related gift may be a bad idea, given that work isn???t exactly happy right now. In our kitchen, I have two live lobsters, like always. Or like what was supposed to be like always. I need to phone my mom and see if they can keep for a day, scrambling dazedly around their crate, or if I need to stumble in, and with my wine-lame eyes, battle them and boil them in my pot for no good reason. I???m killing two lobsters I won???t even eat.
Dad phoned to wish us happy anniversary, and I picked up the phone and I was going to play it cool, but then I started crying when I started talking ??? I was doing the awful chick talk-cry: mwaha-waah-gwwahh-and-waaa-wa ??? so I had to tell him what happened, and he told me I should open a bottle of wine and wallow in it for a bit. Dad is always a proponent of a good indulgent sulk. Still, Nick will be angry that I told Rand, and of course Rand will do his fatherly thing, pat Nick on the shoulder and say, ???Heard you had some emergency drinking to do on your anniversary, Nicky.??? And chuckle. So Nick will know, and he will be angry with me because he wants my parents to believe he???s perfect ??? he beams when I tell them stories about what a flawless son-in-law he is.
Except for tonight. I know, I know, I???m being a girl.
It???s five a.m. The sun is coming up, almost as bright as the streetlights outside that have just blinked off. I always like that switch, when I???m awake for it. Sometimes, when I can???t sleep, I???ll pull myself out of bed and walk through the streets at dawn, and when the lights click off, all together, I always feel like I???ve seen something special. Oh, there go the streetlights! I want to announce. In New York it???s not three or four a.m. that???s the quiet time ??? there are too many bar stragglers, calling out to each other as they collapse into taxis, yelping into their cell phones as they frantically smoke that one last cigarette before bed. Five a.m., that???s the best time, when the clicking of your heels on the sidewalk sounds illicit. All the people have been put away in their boxes, and you have the whole place to yourself.
Here???s what happened: Nick got home just after four, a bulb of beer and cigarettes and fried-egg odor attached to him, a placenta of stink. I was still awake, waiting for him, my brain ca-thunking after a marathon of Law and Order. He sat down on our ottoman and glanced at the present on the table and said nothing. I stared at him back. He clearly wasn???t going to even graze against an apology ??? hey, sorry things got screwy today. That???s all I wanted, just a quick acknowledgment.
???Happy day after anniversary,??? I start.
He sighs, a deep aggrieved moan. ???Amy, I???ve had the crappiest day ever. Please don???t lay a guilt trip on me on top of it.???
Nick grew up with a father who never, ever apologised, so when Nick feels he has screwed up, he goes on offense. I know this, and I can usually wait it out, usually.
???I was just saying happy anniversary.???
???Happy anniversary, my asshole husband who neglected me on my big day.???
We sit silent for a minute, my stomach knotting. I don???t want to be the bad guy here. I don???t deserve that. Nick stands up.
???Well, how was it???? I ask dully.
???How was it? It was fucking awful. Sixteen of my friends now have no jobs. It was miserable. I???ll probably be gone too, another few months.???
Friends. He doesn???t even like half the guys he was out with, but I say nothing.
???I know it feels dire right now, Nick. But??????
???It???s not dire for you, Amy. Not for you, it never will be dire. But for the rest of us? It???s very different.???
The same old. Nick resents that I???ve never had to worry about money and I never will. He thinks that makes me softer than everyone else, and I wouldn???t disagree with him. But I do work. I clock in and clock back out. Some of my girlfriends have literally never had a job; they discuss people with jobs in the pitying tones you talk about a fat girl with ???such a nice face.??? They will lean forward and say, ???But of course, Ellen has to work,??? like something out of a No??l Coward play. They don???t count me, because I can always quit my job if I want to. I could build my days around charity committees and home decoration and gardening and volunteering, and I don???t think there???s anything wrong with building a life around those things. Most beautiful, good things are done by women people scorn. But I work.
???Nick, I???m on your side here. We???ll be okay no matter what. My money is your money.???
???Not according to the prenup.???
He is drunk. He only mentions the prenup when he???s drunk. Then all the resentment comes back. I???ve told him hundreds, literally hundreds of times, I???ve said the words: The prenup is pure business. It???s not for me, it???s not even for my parents, it???s for my parents??? lawyers. It says nothing about us, not you and me.
He walks over toward the kitchen, tosses his wallet and wilted dollars on the coffee table, crumples a piece of notepaper and tosses it in the trash with a series of credit-card receipts.
???That???s a shitty thing to say, Nick.???
???It???s a shitty way to feel, Amy.???
He walks to our bar ??? in the careful, swamp-wading gait of a drunk ??? and actually pours himself another drink.
???You???re going to make yourself sick,??? I say.
He raises his glass in an up-yours cheers to me. ???You just don???t get it, Amy. You just can???t. I???ve worked since I was fourteen years old. I didn???t get to go to fucking tennis camp and creative-writing camp and SAT prep and all that shit that apparently everyone else in New York City did, because I was wiping down tables at the mall and I was mowing lawns and I was driving to Hannibal and fucking dressing like Huck Finn for the tourists and I was cleaning the funnel-cake skillets at midnight.???
I feel an urge to laugh, actually to guffaw. A big belly laugh that would sweep up Nick, and soon we???d both be laughing and this would be over. This litany of crummy jobs. Being married to Nick always reminds me: People have to do awful things for money. Ever since I???ve been married to Nick, I always wave to people dressed as food.
???I???ve had to work so much harder than anyone else at the magazine to even get to the magazine. Twenty years, basically, I???ve been working to get where I am, and now it???s all going to be gone, and there???s not a fucking thing I know how to do instead, unless I want to go back home, be a river rat again.???
???You???re probably too old to play Huck Finn,??? I say.
???Fuck you, Amy.???
And then he goes to the bedroom. He???s never said that to me before, but it came out of his mouth so smoothly that I assume ??? and this never crossed my mind ??? I assume he???s thought it. Many times. I never thought I???d be the kind of woman who???d be told to fuck herself by her husband. And we???ve sworn never to go to bed angry. Compromise, communicate, and never go to bed angry ??? the three pieces of advice gifted and regifted to all newlyweds. But lately it seems I am the only one who compromises; our communications don???t solve anything; and Nick is very good at going to bed angry. He can turn off his emotions like a spout. He is already snoring.
And then I can???t help myself, even though it???s none of my business, even though Nick would be furious if he knew: I cross over to the trash can and pull out the receipts, so I can picture where he???s been all night. Two bars, two strip clubs. And I can see him in each one, talking about me with his friends, because he must have already talked about me for all that petty, smeared meanness to come out so easily. I picture them at one of the pricier strip clubs, the posh ones that make men believe they are still designed to rule, that women are meant to serve them, the deliberately bad acoustics and thwumping music so no one has to talk, a stretch-titted woman straddling my husband (who swears it???s all in fun), her hair trailing down her back, her lips wet with gloss, but I???m not supposed to be threatened, no it???s just boyish hijinks, I am supposed to laugh about it, I am supposed to be a good sport.
Then I unroll the crumpled piece of notebook paper and see a girl???s handwriting ??? Hannah ??? and a phone number. I wish it were like the movies, the name something silly, CanDee or Bambie, something you could roll your eyes at. Misti with two hearts over the I???s. But it???s Hannah, which is a real woman, presumably like me. Nick has never cheated on me, he has sworn it, but I also know he has ample opportunity. I could ask him about Hannah, and he???d say, I have no idea why she gave me her number, but I didn???t want to be rude, so I took it. Which may be true. Or not. He could cheat on me and he would never tell me, and he would think less and less of me for not figuring it out. He would see me across the breakfast table, innocently slurping cereal, and know that I am a fool, and how can anyone respect a fool?
Now I am crying again, with Hannah in my hand.
It???s a very female thing, isn???t it, to take one boys??? night and snowball it into a marital infidelity that will destroy our marriage?
I don???t know what I am supposed to do. I???m feeling like a shrill fishwife, or a foolish doormat ??? I don???t know which. I don???t want to be angry, I can???t even figure out if I should be angry. I consider checking in to a hotel, let him wonder about me for a change.
I stay where I am for a few minutes, and then I take a breath and wade into our booze-humid bedroom, and when I get in bed, he turns to me and wraps his arms around me and buries his face in my neck, and at the same time we both say, ???I???m sorry.???')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (11, 2, 1, N'Amy Elliott Dunne', 1, N'I???m so much happier now that I???m dead.
Technically, missing. Soon to be presumed dead. But as shorthand, we???ll say dead. It???s been only a matter of hours, but I feel better already: loose joints, wavy muscles. At one point this morning, I realized my face felt strange, different. I looked in the rearview mirror ??? dread Carthage forty-three miles behind me, my smug husband lounging around his sticky bar as mayhem dangled on a thin piano wire just above his shitty, oblivious head ??? and I realized I was smiling. Ha! That???s new.
My checklist for today ??? one of many checklists I???ve made over the past year ??? sits beside me in the passenger seat, a spot of blood right next to Item 22: Cut myself. But Amy is afraid of blood, the diary readers will say. (The diary, yes! We???ll get to my brilliant diary.) No, I???m not, not a bit, but for the past year I???ve been saying I am. I told Nick probably half a dozen times how afraid I am of blood, and when he said, ???I don???t remember you being so afraid of blood,??? I replied, ???I???ve told you, I???ve told you so many times!??? Nick has such a careless memory for other people???s problems, he just assumed it was true. Swooning at the plasma center, that was a nice touch. I really did that, I didn???t just write that I did. (Don???t fret, we???ll sort this out: the true and the not true and the might as well be true.)
Item 22: Cut myself has been on the list a long time. Now it???s real, and my arm hurts. A lot. It takes a very special discipline to slice oneself past the paper-cut layer, down to the muscle. You want a lot of blood, but not so much that you pass out, get discovered hours later in a kiddie pool of red with a lot of explaining to do. I held a box cutter to my wrist first, but looking at that crisscross of veins, I felt like a bomb technician in an action movie: Snip the wrong line and you die. I ended up cutting into the inside of my upper arm, gnawing on a rag so I wouldn???t scream. One long, deep good one. I sat cross-legged on my kitchen floor for ten minutes, letting the blood drizzle steadily until I???d made a nice thick puddle. Then I cleaned it up as poorly as Nick would have done after he bashed my head in. I want the house to tell a story of conflict between true and false. The living room looks staged, yet the blood has been cleaned up: It can???t be Amy!
So the self-mutilation was worth it. Still, hours later, the slice burns under my sleeves, under the tourniquet. (Item 30: Carefully dress wound, ensuring no blood has dripped where it shouldn???t be present. Wrap box cutter and tuck away in pocket for later disposal.)
Item 18: Stage the living room. Tip ottoman. Check.
Item 12: Wrap the First Clue in its box and tuck it just out of the way so the police will find it before dazed husband thinks to look for it. It has to be part of the police record. I want him to be forced to start the treasure hunt (his ego will make him finish it). Check.
Item 32: Change into generic clothes, tuck hair in hat, climb down the banks of the river, and scuttle along the edge, the water lapping inches below, until you reach the edge of the complex. Do this even though you know the Teverers, the only neighbors with a view of the river, will be at church. Do this because you never know. You always take the extra step that others don???t, that???s who you are.
Item 29: Say goodbye to Bleecker. Smell his little stinky cat breath one last time. Fill his kibble dish in case people forget to feed him once everything starts.
Item 33: Get the fuck out of Dodge.
Check, check, check.
I can tell you more about how I did everything, but I???d like you to know me first. Not Diary Amy, who is a work of fiction (and Nick said I wasn???t really a writer, and why did I ever listen to him?), but me, Actual Amy. What kind of woman would do such a thing? Let me tell you a story, a true story, so you can begin to understand.
To start: I should never have been born.
My mother had five miscarriages and two stillbirths before me. One a year, in the fall, as if it were a seasonal duty, like crop rotation. They were all girls; they were all named Hope. I???m sure it was my father???s suggestion ??? his optimistic impulse, his tie-dyed earnestness: We can???t give up hope, Marybeth. But give up Hope is exactly what they did, over and over again.
The doctors ordered my parents to stop trying; they refused. They are not quitters. They tried and tried, and finally came me. My mother didn???t count on my being alive, couldn???t bear to think of me as an actual baby, a living child, a girl who would get to come home. I would have been Hope 8, if things had gone badly. But I entered the world hollering ??? an electric, neon pink. My parents were so surprised, they realized they???d never discussed a name, not a real one, for a real child. For my first two days in the hospital, they didn???t name me. Each morning my mother would hear the door to her room open and feel the nurse lingering in the doorway (I always pictured her vintage, with swaying white skirts and one of those folded caps like a Chinese take-out box). The nurse would linger, and my mother would ask without even looking up, ???Is she still alive????
When I remained alive, they named me Amy, because it was a regular girl???s name, a popular girl???s name, a name a thousand other baby girls were given that year, so maybe the Gods wouldn???t notice this little baby nestled among the others. Marybeth said if she were to do it again, she???d name me Lydia.
I grew up feeling special, proud. I was the girl who battled oblivion and won. The chances were about 1 percent, but I did it. I ruined my mother???s womb in the process ??? my own prenatal Sherman???s March. Marybeth would never have another baby. As a child, I got a vibrant pleasure out of this: just me, just me, only me.
My mother would sip hot tea on the days of the Hopes??? birth-deaths, sit in a rocker with a blanket, and say she was just ???taking a little time for myself.??? Nothing dramatic, my mother is too sensible to sing dirges, but she would get pensive, she would remove herself, and I would have none of it, needful thing that I was. I would clamber onto my mother???s lap, or thrust a crayoned drawing in her face, or remember a permission slip that needed prompt attention. My father would try to distract me, try to take me to a movie or bribe me with sweets. No matter the ruse, it didn???t work. I wouldn???t give my mother those few minutes.
I???ve always been better than the Hopes, I was the one who made it. But I???ve always been jealous too, always ??? seven dead dancing princesses. They get to be perfect without even trying, without even facing one moment of existence, while I am stuck here on earth, and every day I must try, and every day is a chance to be less than perfect.
It???s an exhausting way to live. I lived that way until I was thirty-one.
And then, for about two years, everything was okay. Because of Nick.
Nick loved me. A six-o kind of love: He looooooved me. But he didn???t love me, me. Nick loved a girl who doesn???t exist. I was pretending, the way I often did, pretending to have a personality. I can???t help it, it???s what I???ve always done: The way some women change fashion regularly, I change personalities. What persona feels good, what???s coveted, what???s au courant? I think most people do this, they just don???t admit it, or else they settle on one persona because they???re too lazy or stupid to pull off a switch.
That night at the Brooklyn party, I was playing the girl who was in style, the girl a man like Nick wants: the Cool Girl. Men always say that as the defining compliment, don???t they? She???s a cool girl. Being the Cool Girl means I am a hot, brilliant, funny woman who adores football, poker, dirty jokes, and burping, who plays video games, drinks cheap beer, loves threesomes and anal sex, and jams hot dogs and hamburgers into her mouth like she???s hosting the world???s biggest culinary gang bang while somehow maintaining a size 2, because Cool Girls are above all hot. Hot and understanding. Cool Girls never get angry; they only smile in a chagrined, loving manner and let their men do whatever they want. Go ahead, shit on me, I don???t mind, I???m the Cool Girl.
Men actually think this girl exists. Maybe they???re fooled because so many women are willing to pretend to be this girl. For a long time Cool Girl offended me. I used to see men ??? friends, coworkers, strangers ??? giddy over these awful pretender women, and I???d want to sit these men down and calmly say: You are not dating a woman, you are dating a woman who has watched too many movies written by socially awkward men who???d like to believe that this kind of woman exists and might kiss them. I???d want to grab the poor guy by his lapels or messenger bag and say: The bitch doesn???t really love chili dogs that much ??? no one loves chili dogs that much! And the Cool Girls are even more pathetic: They???re not even pretending to be the woman they want to be, they???re pretending to be the woman a man wants them to be. Oh, and if you???re not a Cool Girl, I beg you not to believe that your man doesn???t want the Cool Girl. It may be a slightly different version ??? maybe he???s a vegetarian, so Cool Girl loves seitan and is great with dogs; or maybe he???s a hipster artist, so Cool Girl is a tattooed, bespectacled nerd who loves comics. There are variations to the window dressing, but believe me, he wants Cool Girl, who is basically the girl who likes every fucking thing he likes and doesn???t ever complain. (How do you know you???re not Cool Girl? Because he says things like: ???I like strong women.??? If he says that to you, he will at some point fuck someone else. Because ???I like strong women??? is code for ???I hate strong women.???)
I waited patiently ??? years ??? for the pendulum to swing the other way, for men to start reading Jane Austen, learn how to knit, pretend to love cosmos, organize scrapbook parties, and make out with each other while we leer. And then we???d say, Yeah, he???s a Cool Guy.
But it never happened. Instead, women across the nation colluded in our degradation! Pretty soon Cool Girl became the standard girl. Men believed she existed ??? she wasn???t just a dreamgirl one in a million. Every girl was supposed to this girl, and if you weren???t, then there was something wrong with you.
But it???s tempting to be Cool Girl. For someone like me, who likes to win, it???s tempting to want to be the girl every guy wants. When I met Nick, I knew immediately that was what he wanted, and for him, I guess I was willing to try. I will accept my portion of blame. The thing is, I was crazy about him at first. I found him perversely exotic, a good ole Missouri boy. He was so damn nice to be around. He teased things out in me that I didn???t know existed: a lightness, a humor, an ease. It was as if he hollowed me out and filled me with feathers. He helped me be Cool Girl ??? I couldn???t have been Cool Girl with anyone else. I wouldn???t have wanted to. I can???t say I didn???t enjoy some of it: I ate a MoonPie, I walked barefoot, I stopped worrying. I watched dumb movies and ate chemically laced foods. I didn???t think past the first step of anything, that was the key. I drank a Coke and didn???t worry about how to recycle the can or about the acid puddling in my belly, acid so powerful it could strip clean a penny. We went to a dumb movie and I didn???t worry about the offensive sexism or the lack of minorities in meaningful roles. I didn???t even worry whether the movie made sense. I didn???t worry about anything that came next. Nothing had consequence, I was living in the moment, and I could feel myself getting shallower and dumber. But also happy.
Until Nick, I???d never really felt like a person, because I was always a product. Amazing Amy has to be brilliant, creative, kind, thoughtful, witty, and happy. We just want you to be happy. Rand and Marybeth said that all the time, but they never explained how. So many lessons and opportunities and advantages, and they never taught me how to be happy. I remember always being baffled by other children. I would be at a birthday party and watch the other kids giggling and making faces, and I would try to do that, too, but I wouldn???t understand why. I would sit there with the tight elastic thread of the birthday hat parting the pudge of my underchin, with the grainy frosting of the cake bluing my teeth, and I would try to figure out why it was fun.
With Nick, I understood finally. Because he was so much fun. It was like dating a sea otter. He was the first naturally happy person I met who was my equal. He was brilliant and gorgeous and funny and charming and charmed. People liked him. Women loved him. I thought we would be the most perfect union: the happiest couple around. Not that love is a competition. But I don???t understand the point of being together if you???re not the happiest.
I was probably happier for those few years ??? pretending to be someone else ??? than I ever have been before or after. I can???t decide what that means.
But then it had to stop, because it wasn???t real, it wasn???t me. It wasn???t me, Nick! I thought you knew. I thought it was a bit of a game. I thought we had a wink-wink, don???t ask, don???t tell thing going. I tried so hard to be easy. But it was unsustainable. It turned out he couldn???t sustain his side either: the witty banter, the clever games, the romance, and the wooing. It all started collapsing on itself. I hated Nick for being surprised when I became me. I hated him for not knowing it had to end, for truly believing he had married this creature, this figment of the imagination of a million masturbatory men, semen-fingered and self-satisfied. He truly seemed astonished when I asked him to listen to me. He couldn???t believe I didn???t love wax-stripping my pussy raw and blowing him on request. That I did mind when he didn???t show up for drinks with my friends. That ludicrous diary entry? I don???t need pathetic dancing-monkey scenarios to repeat to my friends, I am content with letting him be himself. That was pure, dumb Cool Girl bullshit. What a cunt. Again, I don???t get it: If you let a man cancel plans or decline to do things for you, you lose. You don???t get what you want. It???s pretty clear. Sure, he may be happy, he may say you???re the coolest girl ever, but he???s saying it because he got his way. He???s calling you a Cool Girl to fool you! That???s what men do: They try to make it sound like you are the cool girl so you will bow to their wishes. Like a car salesman saying, How much do you want to pay for this beauty? when you didn???t agree to buy it yet. That awful phrase men use: ???I mean, I know you wouldn???t mind if I ?????? Yes, I do mind. Just say it. Don???t lose, you dumb little twat.
So it had to stop. Committing to Nick, feeling safe with Nick, being happy with Nick, made me realize that there was a Real Amy in there, and she was so much better, more interesting and complicated and challenging, than Cool Amy. Nick wanted Cool Amy anyway. Can you imagine, finally showing your true self to your spouse, your soul mate, and having him not like you? So that???s how the hating first began. I???ve thought about this a lot, and that???s where it started, I think.')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (12, 2, 2, N'Nick Dunne Seven Days Gone', 1, N'I made it a few steps into the woodshed before I had to lean against the wall and catch my breath.
I knew it was going to be bad. I knew it once I figured out the clue: woodshed. Midday fun. Cocktails. Because that description was not me and Amy. It was me and Andie. The woodshed was just one of many strange places where I???d had sex with Andie. We were restricted in our meeting spots. Her busy apartment complex was mostly a no go. Motels show up on credit cards, and my wife was neither trusting nor stupid. (Andie had a MasterCard, but the statement went to her mom. It hurts me to admit that.) So the woodshed, deep behind my sister???s house, was very safe when Go was at work. Likewise my father???s abandoned home (Maybe you feel guilty for bringing me here / I must admit it felt a bit queer / But it???s not like we had the choice of many a place / We made the decision: We made this our space), and a few times, my office at school (I picture myself as your student / With a teacher so handsome and wise / My mind opens up [not to mention my thighs!]), and once, Andie???s car, pulled down a dirt road in Hannibal after I???d taken her for a visit one day, a much more satisfying reenactment of my banal field trip with Amy (You took me here so I could hear you chat / About your boyhood adventures: crummy jeans and visor hat).
Each clue was hidden in a spot where I???d cheated on Amy. She???d used the treasure hunt to take me on a tour of all my infidelities. I had a shimmer of nausea as I pictured Amy trailing oblivious me in her car ??? to my dad???s, to Go???s, to goddamn Hannibal ??? watching me fuck this sweet young girl, my wife???s lips twisting in disgust and triumph.
Because she knew she???d punish me good. Now at our final stop, Amy was ready for me to know how clever she was. Because the woodshed was packed with about every gizmo and gadget that I swore to Boney and Gilpin I hadn???t bought with the credit cards I swore I didn???t know anything about. The insanely expensive golf clubs were here, the watches and game consoles, the designer clothes, they were all sitting here, in wait, on my sister???s property. Where it looked like I???d stored them until my wife was dead and I could have a little fun.
I knocked on Go???s front door, and when she answered, smoking a cigarette, I told her I had to show her something, and I turned around and led her without a word to the woodshed.
???Look,??? I said, and ushered her toward the open door.
???Are those???Is that all the stuff ??? from the credit cards???? Go???s voice went high and wild. She put one hand to her mouth and took a step back from me, and I realized that just for a second, she thought I was making a confession to her.
We???d never be able to undo it, that moment. For that alone, I hated my wife.
???Amy???s framing me, Go,??? I said. ???Go, Amy bought this stuff. She???s framing me.???
She snapped to. Her eyelids clicked once, twice, and she gave a tiny shake of her head, as if to rid herself of the image: Nick as wife killer.
???Amy???s framing me for her murder. Right? Her last clue, it led me right here, and no, I didn???t know about any of this stuff. It???s her grand statement. Presenting: Nick Goes to Jail! ??? A huge, burpy air bubble formed at the back of my throat ??? I was going to sob or laugh. I laughed. ???I mean, right? Holy fuck, right????
So hurry up, get going, please do / And this time I???ll teach you a thing or two. The final words of Amy???s first clue. How did I not see it?
???If she???s framing you, why let you know???? Go was still staring, transfixed by the contents of her shed.
???Because she???s done it so perfectly. She always needed that validation, the praise, all the time. She wants me to know I???m being fucked. She can???t resist. It wouldn???t be fun for her otherwise.???
???No,??? Go said, chewing on a nail. ???There???s something else. Something more. Have you touched anything in here????
???No.???
???Good. Then the question becomes ??????
???What does she think I???ll do when I find this, this incriminating evidence, on my sister???s property,??? I said. ???That???s the question, because whatever she assumes I???ll do, whatever she wants me to do, I have to do the opposite. If she thinks I???ll freak out and try to get rid of all this stuff, I guarantee you she has a way I???ll get busted with it.???
???Well, you can???t leave it here,??? Go said. ???You???ll definitely get busted that way. Are you sure that was the last clue? Where???s your present????
???Oh. Shit. No. It must be inside somewhere.???
???Don???t go in there,??? Go said.
???I have to. God knows what else she???s got in store.???
I stepped carefully into the dank shed, keeping my hands tight by my sides, walking delicately on tiptoes so as not to leave tread marks. Just past a flat-screen TV, Amy???s blue envelope sat on top of a huge gift box, wrapped in her beautiful silvery paper. I took the envelope and the box back outside into the warm air. The object inside the package was heavy, a good thirty pounds, and broken into several pieces that slid with a strange rattle as I set the box on the ground at our feet. Go took an involuntary quick step away from it. I slid open the envelope.
Darling Husband,
Now is when I take the time to tell you that I know you better than you could ever imagine. I know sometimes you think you are moving through this world alone, unseen, unnoticed. But don???t believe that for a second. I have made a study of you. I know what you are going to do before you do it. I know where you???ve been, and I know where you???re going. For this anniversary, I???ve arranged a trip: Follow your beloved river, up up up! And you don???t even have to worry about trying to find your anniversary present. This time the present will come to you! So sit back and relax, because you are DONE.
???What???s upriver???? Go asked, and then I groaned.
???She???s sending me up the river.???
???Fuck her. Open the box.???
I knelt down and nudged off the lid with my fingertips, as if expecting an explosion. Silence. I peered inside. At the bottom of the box lay two wooden puppets, side by side. They seemed to be husband and wife. The male was dressed in motley and grinning rabidly, holding a cane or a stick. I pulled the husband figure out, his limbs bouncing around excitedly, a dancer limbering up. The wife was prettier, more delicate, and stiffer. Her face looked shocked, as if she???d seen something alarming. Beneath her was a tiny baby that could be attached to her by a ribbon. The puppets were ancient, heavy, and large, almost as big as ventriloquist dummies. I picked up the male, gripped the thick, clublike handle used to move him, and his arms and legs twitched manically.
???Creepy,??? Go said. ???Stop.???
Beneath them lay a piece of buttery blue paper folded over once. Amy???s broken-kite handwriting, all triangles and points. It read:
The beginning of a wonderful new story, Nick! ???That???s the way to do it!???
Enjoy.
On our mom???s kitchen table, we spread all of Amy???s treasure-hunt clues and the box containing the puppets. We stared at the objects as if we were assembling a jigsaw puzzle.
???Why bother with a treasure hunt if she was planning ??? her plan,??? Go said.
Her plan had become immediate shorthand for faking her disappearance and framing you for murder. It sounded less insane.
???Keep me distracted, for one thing. Make me believe she still loved me. I???m chasing her little clues all over Christendom, believing my wife was wanting to make amends, wanting to jump-start our marriage ??????
The moony, girlish state her notes had left me in, it sickened me. It embarrassed me. Marrow-deep embarrassment, the kind that becomes part of your DNA, that changes you. After all these years, Amy could still play me. She could write a few notes and get me back completely. I was her little puppet on a string.
I will find you, Amy. Lovesick words, hateful intentions.
???So I don???t stop to think: Hey, it sure looks like I murdered my wife, I wonder why????
???And the police would have found it strange ??? you would have found it strange ??? if she didn???t do the treasure hunt, this tradition,??? Go reasoned. ???It would look as if she knew she was going to disappear.???
???This worries me though,??? I said, pointing at the puppets. ???They???re unusual enough that they have to mean something. I mean, if she just wanted to keep me distracted for a while, the final gift could have been anything wooden.???
Go ran a finger across the male???s motley uniform. ???They???re clearly very old. Vintage.??? She flipped their clothing upside down to reveal the club handle of the male. The female had only a square-shaped gap at her head. ???Is this supposed to be sexual? The male has this giant wooden handle, like a dick. And the female is missing hers. She just has the hole.???
???It???s a fairly obvious statement: Men have penises and women have vaginas????
Go put a finger inside the female puppet???s gap, swept around to make sure there was nothing hidden. ???So what is Amy saying????
???When I first saw them, I thought: She bought children???s toys. Mom, dad, baby. Because she was pregnant.???
???Is she even pregnant????
A sense of despair washed over me. Or rather, the opposite. Not a wave coming in, rolling over me, but the ebb of the sea returning: a sense of something pulling away, and me with it. I could no longer hope my wife was pregnant, but I couldn???t bring myself to hope she wasn???t either.
Go pulled out the male doll, scrunched her nose, then lightbulb popped. ???You???re a puppet on a string.???
I laughed. ???I literally thought those exact words too. But why a male and female? Amy clearly isn???t a puppet on a string, she???s the puppetmaster.???
???And what???s: That???s the way to do it? To do what????
???Fuck me for life????
???It???s not a phrase Amy used to say? Or some quote from the Amy books, or ?????? She hurried over to her computer and searched for That???s the way to do it. Up came lyrics for ???That???s the Way to Do It??? by Madness. ???Oh, I remember them,??? Go said. ???Awesome ska band.???
???Ska,??? I said, swerving toward delirious laughter. ???Great.???
The lyrics were about a handyman who could do many types of home-improvement jobs ??? including electrical and plumbing ??? and who preferred to be paid in cash.
???God, I fucking hate the eighties,??? I said. ???No lyrics ever made sense.???
??????The reflex is an only child,?????? Go said, nodding.
??????He???s waiting by the park,?????? I muttered back automatically.
???So if this is it, what does it mean???? Go said, turning to me, studying my eyes. ???It???s a song about a handyman. Someone who might have access to your house, to fix things. Or rig things. Who would be paid in cash so there???s no record.???
???Someone who installed video cameras???? I asked. ???Amy went out of town a few times during the ??? the affair. Maybe she thought she???d catch us on tape.???
Go shot a question at me.
???No, never, never at our house.???
???Could it be some secret door???? Go suggested. ???Some secret false panel Amy put in where she???s hidden something that will ??? I don???t know, exonerate you????
???I think that???s it. Yes, Amy is using a Madness song to give me a clue to my own freedom, if only I can decipher their wily, ska-infused codes.???
Go laughed then too. ???Jesus, maybe we???re the ones who are bat-shit crazy. I mean, are we? Is this totally insane????
???It???s not insane. She set me up. There is no other way to explain the warehouse of stuff in your backyard. And it???s very Amy to drag you into it, smudge you a little bit with my filth. No, this is Amy. The gift, the fucking giddy, sly note I???m supposed to understand. No, and it has to come back to the puppets. Try the quote with the word marionettes.???
I collapsed on the couch, my body a dull throb. Go played secretary. ???Oh my God. Duh! They???re Punch and Judy dolls. Nick! We???re idiots. That line, that???s Punch???s trademark. That???s the way to do it!???
???Okay. The old puppet show ??? it???s really violent, right???? I asked.
???This is so fucked up.???
???Go, it???s violent, right????
???Yeah. Violent. God, she???s fucking crazy.???
???He beats her, right????
???I???m reading ??? okay. Punch kills their baby.??? She looked up at me. ???And then when Judy confronts him, he beats her. To death.???
My throat got wet with saliva.
???And each time he does something awful and gets away with it, he says, ???That???s the way to do it!?????? She grabbed Punch and placed him in her lap, her fingers grasping the wooden hands as if she were holding an infant. ???He???s glib, even as he murders his wife and child.???
I looked at the puppets. ???So she???s giving me the narrative of my frame-up.???
???I can???t even wrap my brain around this. Fucking psycho.???
???Go????
???Yeah, right: You didn???t want her to be pregnant, you got angry and killed her and the unborn baby.???
???Feels anticlimactic somehow,??? I said.
???The climax is when you are taught the lesson that Punch never learns, and you are caught and charged with murder.???
???And Missouri has the death penalty,??? I said. ???Fun game.???')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (13, 2, 3, N'Amy Elliott Dunne', 1, N'You know how I found out? I saw them. That???s how stupid my husband is. One snowy April night, I felt so lonely. I was drinking warm amaretto with Bleecker and reading, lying on the floor as the snow came down, listening to old scratchy albums, like Nick and I used to (that entry was true). I had a burst of romantic cheer: I???d surprise him at The Bar, and we???d have a few drinks and wander through the empty streets together, hand in mitten. We would walk around the hushed downtown and he would press me against a wall and kiss me in the snow that looked like sugar clouds. That???s right, I wanted him back so badly that I was willing to re-create that moment. I was willing to pretend to be someone else again. I remember thinking: We can still find a way to make this work. Faith! I followed him all the way to Missouri, because I still believed he???d love me again somehow, love me that intense, thick way he did, the way that made everything good. Faith!
I got there just in time to see him leaving with her. I was in the goddamn parking lot, twenty feet behind him, and he didn???t even register me, I was a ghost. He didn???t have his hands on her, not yet, but I knew. I could tell because he was so aware of her. I followed them, and suddenly, he pressed her up against a tree ??? in the middle of town ??? and kissed her. Nick is cheating, I thought dumbly, and before I could make myself say anything, they were going up to her apartment. I waited for an hour, sitting on the doorstep, then got too cold ??? blue fingernails, chattering teeth ??? and went home. He never even knew I knew.
I had a new persona, not of my choosing. I was Average Dumb Woman Married to Average Shitty Man. He had single-handedly de-amazed Amazing Amy.
I know women whose entire personas are woven from a benign mediocrity. Their lives are a list of shortcomings: the unappreciative boyfriend, the extra ten pounds, the dismissive boss, the conniving sister, the straying husband. I???ve always hovered above their stories, nodding in sympathy and thinking how foolish they are, these women, to let these things happen, how undisciplined. And now to be one of them! One of the women with the endless stories that make people nod sympathetically and think: Poor dumb bitch.
I could hear the tale, how everyone would love telling it: how Amazing Amy, the girl who never did wrong, let herself be dragged, penniless, to the middle of the country, where her husband threw her over for a younger woman. How predictable, how perfectly average, how amusing. And her husband? He ended up happier than ever. No. I couldn???t allow that. No. Never. Never. He doesn???t get to do this to me and still fucking win. No.
I changed my name for that piece of shit. Historical records have been altered ??? Amy Elliott to Amy Dunne ??? like it???s nothing. No, he does not get to win.
So I began to think of a different story, a better story, that would destroy Nick for doing this to me. A story that would restore my perfection. It would make me the hero, flawless and adored.
Because everyone loves the Dead Girl.
It???s rather extreme, framing your husband for your murder. I want you to know I know that. All the tut-tutters out there will say: She should have just left, bundled up what remained of her dignity. Take the high road! Two wrongs don???t make a right! All those things that spineless women say, confusing their weakness with morality.
I won???t divorce him because that???s exactly what he???d like. And I won???t forgive him because I don???t feel like turning the other cheek. Can I make it any more clear? I won???t find that a satisfactory ending. The bad guy wins? Fuck him.
For over a year now, I???ve smelled her twat on his fingertips as he slipped into bed next to me. I???ve watched him ogle himself in the mirror, grooming himself like a horny baboon for their dates. I???ve listened to his lies, lies, lies ??? from simplistic child???s fibs to elaborate Rube Goldbergian contraptions. I???ve tasted butterscotch on his dry-kiss lips, a cloying flavor that was never there before. I???ve felt the stubble on his cheeks that he knows I don???t like but apparently she does. I???ve suffered betrayal with all five senses. For over a year.
So I may have gone a bit mad. I do know that framing your husband for your murder is beyond the pale of what an average woman might do.
But it???s so very necessary. Nick must be taught a lesson. He???s never been taught a lesson! He glides through life with that charming-Nicky grin, his beloved-child entitlement, his fibs and shirkings, his shortcomings and selfishness, and no one calls him on anything. I think this experience will make him a better person. Or at least a sorrier one. Fucker.
I???ve always thought I could commit the perfect murder. People who get caught get caught because they don???t have patience; they refuse to plan. I smile again as I shift my crappy getaway car into fifth gear (Carthage now seventy-eight miles in the dust) and brace myself for a speeding truck ??? the car seems ready to take flight every time a semi passes. But I do smile, because this car shows just how smart I am: purchased for twelve hundred dollars cash from a Craigslist posting. Five months ago, so the memory wouldn???t be fresh in anyone???s mind. A 1992 Ford Festiva, the tiniest, most forgettable car in the world. I met the sellers at night, in the parking lot of a WalMart in Jonesboro, Arkansas. I took the train down with a bundle of cash in my purse ??? eight hours each way, while Nick was on a boys??? trip. (And by boys??? trip, I mean fucking the slut.) I ate in the train???s dining car, a clump of lettuce with two cherry tomatoes that the menu described as a salad. I was seated with a melancholy farmer returning home after visiting his baby granddaughter for the first time.
The couple selling the Ford seemed as interested in discretion as I. The woman remained in the car the whole time, a pacifiered toddler in her arms, watching her husband and me trade cash for keys. (That is the correct grammar, you know: her husband and me.) Then she got out and I got in. That quick. In the rearview mirror, I saw the couple strolling into WalMart with their money. I???ve been parking it in long-term lots in St. Louis. I go down twice a month and park it somewhere new. Pay cash. Wear a baseball cap. Easy enough.
So that???s just an example. Of patience, planning, and ingenuity. I am pleased with myself; I have three hours more until I reach the thick of the Missouri Ozarks and my destination, a small archipelago of cabins in the woods that accepts cash for weekly rentals and has cable TV, a must. I plan to hole up there the first week or two; I don???t want to be on the road when the news hits, and it???s the last place Nick would think I???d hide once he realizes I???m hiding.
This stretch of highway is particularly ugly. Middle-America blight. After another twenty miles, I see, up on the off-ramp, the remains of a lonesome family gas station, vacant but not boarded up, and when I pull to the side, I see the women???s restroom door swung wide. I enter ??? no electricity, but there???s a warped metal mirror and the water is still on. In the afternoon sunlight and the sauna heat, I remove from my purse a pair of metal scissors and bunny-brown hair dye. I shear off large chunks of my hair. All the blond goes into a plastic bag. Air hits the back of my neck, and my head feels light, like a balloon ??? I roll it around a few times to enjoy. I apply the color, check my watch, and linger in the doorway, looking out over miles of flatland pocked with fast-food restaurants and motel chains. I can feel an Indian crying. (Nick would hate that joke. Derivative! And then he???d add, ???although the word derivative as a criticism is itself derivative.??? I???ve got to get him out of my head ??? he still steps on my lines from a hundred miles away.) I wash my hair in the sink, the warm water making me sweat, and then back in the car with my bag of hair and trash. I put on a pair of outdated wire-rim glasses and look in the rearview mirror and smile again. Nick and I would never have married if I had looked like this when we met. All this could have been avoided if I were less pretty.
Item 34: Change look. Check.
I???m not sure, exactly, how to be Dead Amy. I???m trying to figure out what that means for me, what I become for the next few months. Anyone, I suppose, except people I???ve already been: Amazing Amy. Preppy ???80s Girl. Ultimate-Frisbee Granola and Blushing Ingenue and Witty Hepburnian Sophisticate. Brainy Ironic Girl and Boho Babe (the latest version of Frisbee Granola). Cool Girl and Loved Wife and Unloved Wife and Vengeful Scorned Wife. Diary Amy.
I hope you liked Diary Amy. She was meant to be likable. Meant for someone like you to like her. She???s easy to like. I???ve never understood why that???s considered a compliment ??? that just anyone could like you. No matter. I thought the entries turned out nicely, and it wasn???t simple. I had to maintain an affable if somewhat naive persona, a woman who loved her husband and could see some of his flaws (otherwise she???d be too much of a sap) but was sincerely devoted to him ??? all the while leading the reader (in this case, the cops, I am so eager for them to find it) toward the conclusion that Nick was indeed planning to kill me. So many clues to unpack, so many surprises ahead!
Nick always mocked my endless lists. (???It???s like you make sure you???re never satisfied, that there???s always something else to be perfected, instead of just enjoying the moment.???) But who wins here? I win, because my list, the master list entitled Fuck Nick Dunne, was exacting ??? it was the most complete, fastidious list that has ever been created. On my list was Write Diary Entries for 2005 to 2012. Seven years of diary entries, not every day, but twice monthly, at least. Do you know how much discipline that takes? Would Cool Girl Amy be able to do that? To research each week???s current events, to cross-consult with my old daily planners to make sure I forgot nothing important, then to reconstruct how Diary Amy would react to each event? It was fun, mostly. I???d wait for Nick to leave for The Bar, or to go meet his mistress, the ever-texting, gum-chewing, vapid mistress with her acrylic nails and the sweatpants with logos across the butt (she isn???t like this, exactly, but she might as well be), and I???d pour some coffee or open a bottle of wine, pick one of my thirty-two different pens, and rewrite my life a little.
It is true that I sometimes hated Nick less while I was doing this. A giddy Cool Girl perspective will do that. Sometimes Nick would come home, stinking of beer or of the hand sanitizer he wiped on his body post-mistress-coitus (never entirely erased the stink, though ??? she must have one rank pussy), and smile guiltily at me, be all sweet and hangdog with me, and I???d almost think: I won???t go through with this. And then I???d picture him with her, in her stripper thong, letting him degrade her because she was pretending to be Cool Girl, she was pretending to love blow jobs and football and getting wasted. And I???d think, I am married to an imbecile. I???m married to a man who will always choose that, and when he gets bored with this dumb twat, he???ll just find another girl who is pretending to be that girl, and he???ll never have to do anything hard in his life.
Resolve stiffened.
One hundred and fifty-two entries total, and I don???t think I ever lose her voice. I wrote her very carefully, Diary Amy. She is designed to appeal to the cops, to appeal to the public should portions be released. They have to read this diary like it???s some sort of Gothic tragedy. A wonderful, good-hearted woman ??? whole life ahead of her, everything going for her, whatever else they say about women who die ??? chooses the wrong mate and pays the ultimate price. They have to like me. Her.
My parents are worried, of course, but how can I feel sorry for them, since they made me this way and then deserted me? They never, ever fully appreciated the fact that they were earning money from my existence, that I should have been getting royalties. Then, after they siphoned off my money, my ???feminist??? parents let Nick bundle me off to Missouri like I was some piece of chattel, some mail-order bride, some property exchange. Gave me a fucking cuckoo clock to remember them by. Thanks for thirty-six years of service! They deserve to think I???m dead, because that???s practically the state they consigned me to: no money, no home, no friends. They deserve to suffer too. If you can???t take care of me while I???m alive, you have made me dead anyway. Just like Nick, who destroyed and rejected the real me a piece at a time ??? you???re too serious, Amy, you???re too uptight, Amy, you overthink things, you analyze too much, you???re no fun anymore, you make me feel useless, Amy, you make me feel bad, Amy. He took away chunks of me with blase?? swipes: my independence, my pride, my esteem. I gave, and he took and took. He Giving Treed me out of existence.
That whore, he picked that little whore over me. He killed my soul, which should be a crime. Actually, it is a crime. According to me, at least.')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (14, 2, 4, N'Nick Dunne Seven Days Gone', 1, N'I had to phone Tanner, my brand-new lawyer, mere hours after I???d hired him, and say the words that would make him regret taking my money: I think my wife is framing me. I couldn???t see his face, but I could imagine it ??? the eye roll, the grimace, the weariness of a man who hears nothing but lies for a living.
???Well,??? he finally said after a gaping pause, ???I???ll be there first thing tomorrow morning, and we will sort this out ??? everything on the table ??? and in the meantime, sit tight, okay? Go to sleep and sit tight.???
Go took his advice, she popped two sleeping pills and left me just before eleven, while I literally sat tight, in an angry ball on her couch. Every so often I???d go outside and glare at the woodshed, my hands on my hips, as if it were a predator I could scare off. I???m not sure what I thought I was accomplishing, but I couldn???t stop myself. I could stay seated for five minutes, tops, before I???d have to go back outside and stare.
I had just come back inside when a knock rattled the back door. Fucking Christ. Not quite midnight. Cops would come to the front ??? right? ??? and reporters had yet to stake out Go???s (this would change, a matter of days, hours). I was standing, unnerved, undecided, in the living room when the banging came again, louder, and I cursed under my breath, tried to get myself angry instead of scared. Deal with it, Dunne.
I flung open the door. It was Andie. It was goddamn Andie, pretty as a picture, dressed up for the occasion, still not getting it ??? that she was going to put my neck right in the noose.
???Right in the noose, Andie.??? I yanked her inside, and she stared at my hand on her arm. ???You are going to put my neck right in the fucking noose.???
???I came to the back door,??? she said. When I stared her down, she didn???t apologize, she steeled herself. I could literally see her features harden. ???I needed to see you, Nick. I told you. I told you I had to see you or talk to you every day, and today you disappeared. Straight to voice mail, straight to voice mail, straight to voice mail.???
???If you don???t hear from me, it???s because I can???t talk, Andie. Jesus, I was in New York, getting a lawyer. He???ll be here first thing tomorrow.???
???You got a lawyer. That was what kept you so busy that you couldn???t call me for ten seconds????
I wanted to smack her. I took a breath. I had to cut things off with Andie. It wasn???t just Tanner???s warning I had in mind. My wife knew me: She knew I???d do almost anything to avoid dealing with confrontation. Amy was depending on me to be stupid, to let the relationship linger ??? and to ultimately be caught. I had to end it. But I had to do it perfectly. Make her believe that this was the decent thing.
???He???s actually given me some important advice,??? I began. ???Advice I can???t ignore.???
I???d been so sweet and doting just last night, at my mandatory meeting in our pretend fort. I???d made so many promises, trying to calm her down. She wouldn???t see this coming. She wouldn???t take this well.
???Advice? Good. Is it to stop being such an asshole to me????
I felt the rage rise up; that this was already turning into a high school fight. A thirty-four-year-old man in the middle of the worst night of my life, and I was having a meet me by the lockers! squabble with a pissed-off girl. I shook her once, hard, a tiny droplet of spit landing on her lower lip.
???I???You don???t get it, Andie. This isn???t some joke, this is my life.???
???I just ??? I need you,??? she said, looking down at her hands. ???I know I keep saying that, but I do. I can???t do it, Nick. I can???t go on like this. I???m falling apart. I???m so scared all the time.???
She was scared. I pictured the police knocking, and here I was with a girl I???d been fucking the morning my wife went missing. I???d sought her out that day ??? I had never gone to her apartment since that first night, but I went right there that morning, because I???d spent hours with my heart pounding behind my ears, trying to get myself to say the words to Amy: I want a divorce. I am in love with someone else. We have to end. I can???t pretend to love you, I can???t do the anniversary thing ??? it would actually be more wrong than cheating on you in the first place. (I know: debatable.) But while I was gathering the guts, Amy had preempted me with her speech about still loving me (lying bitch!), and I lost my nerve. I felt like the ultimate cheat and coward, and ??? the catch-22 ??? I craved Andie to make me feel better.
But Andie was no longer the antidote to my nerves. Quite the opposite.
The girl was wrapping herself around me even now, oblivious as a weed.
???Look, Andie,??? I said, a big exhale, not letting her sit down, keeping her near the door. ???You are such a special person to me. You???ve handled all this so amazingly well?????? Make her want to keep you safe.
???I mean ?????? Her voice wavered. ???I feel so sorry, for Amy. Which is insane. I know I don???t even have a right to feel sad for her, or worried. And on top of feeling sad, I feel so guilty.??? She leaned her head against my chest. I retreated, held her at arm???s length so she had to look at me.
???Well, that???s one thing I think we can fix. I think we need to fix,??? I said, pulling up Tanner???s exact words.
???We should go to the police,??? she said. ???I???m your alibi for that morning, we???ll just tell them.???
???You???re my alibi for about an hour that morning,??? I said. ???No one saw or heard Amy after eleven p.m. the night before. The police can say I killed her before I saw you.???
???That???s disgusting.???
I shrugged. I thought, for a second, about telling her about Amy ??? my wife is framing me ??? and quickly dismissed it. Andie couldn???t play the game on Amy???s level. She???d want to be my teammate, and she???d drag me down. Andie would be a liability going forward. I put my hands on her arms again, relaunched my speech.
???Look, Andie, we are both under an amazing amount of stress and pressure, and a lot of it is brought on by our feelings of guilt. Andie, the thing is, we are good people. We were attracted to each other, I think, because we both have similar values. Of treating people right, of doing the right thing. And right now we know what we are doing is wrong.???
Her broken, hopeful expression changed ??? the wet eyes, the gentle touch, they disappeared: a weird flicker, a window shade pulled down, something darker in her face.
???We need to end this, Andie. I think we both know that. It???s so hard, but it???s the decent thing to do. I think it???s the advice we???d give ourselves if we could think straight. As much as I love you, I am still married to Amy. I have to do the right thing.???
???And if she???s found???? She didn???t say dead or alive.
???That???s something we can discuss then.???
???Then! And until then, what????
I shrugged helplessly: Until then, nothing.
???What, Nick? I fuck off until then????
???That???s an ugly choice of words.???
???But that???s what you mean.??? She smirked.
???I???m sorry, Andie. I don???t think it???s right for me to be with you right now. It???s dangerous for you, it???s dangerous for me. It doesn???t sit well with my conscience. It???s just how I feel.???
???Yeah? You know how I feel???? Her eyes burst over, tears streaming down her cheeks. ???I feel like a dumb college girl that you started fucking because you were bored with your wife and I made it extremely convenient for you. You could go home to Amy and eat dinner with her and play around in your little bar that you bought with her money, and then you could meet me at your dying dad???s house and jack off on my tits because, poor you, your mean wife would never let you do that.???
???Andie, you know that???s not??????
???What a shit you are. What kind of man are you????
???Andie, please.??? Contain this, Nick. ???I think because you haven???t been able to talk about this stuff, everything has gotten a little bigger in your mind, a little??????
???Fuck you. You think I???m some dumb kid, some pathetic student you can manage? I stick by you through all this ??? this talk about how you might be a murderer ??? and as soon as it???s a little tough for you? No, no. You don???t get to talk about conscience and decency and guilt and feel like you are doing the right thing. Do you understand me? Because you are a cheating, cowardly, selfish shit.???
She turned away from me, sobbing, sucking in loud gulps of moist air, and breathing out mewls, and I tried to stop her, I grabbed her by the arm. ???Andie, this isn???t how I want to??????
???Hands off me! Hands off me!???
She moved toward the back door, and I could see what would happen, the hatred and embarrassment coming off her like heat, I knew she???d open a bottle of wine, or two, and then she???d tell a friend, or her mother, and it would spread like an infection.
I moved in front of her, barring her way to the door ??? Andie, please ??? and she reached up to slap me, and I grabbed her arm, just for defense. Our joined arms moved up and down and up and down like crazed dance partners.
???Let me go, Nick, or I swear.???
???Just stay for a minute. Just listen to me.???
???You, let me go!???
She moved her face toward mine like she was going to kiss me. She bit me. I jerked back and she shot out the door.')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (15, 2, 5, N'Amy Elliott Dunne Five Days Gone', 1, N'You may call me Ozark Amy. I am ensconced in the Hide-A-Way Cabins (has ever there been a more apt name?), and I sit quietly, watching all the levers and latches I put in place do their work.
I have shed myself of Nick, and yet I think about him more than ever. Last night at 10:04 p.m. my disposable cell phone rang. (That???s right, Nick, you???re not the only one who knows the old ???secret cell phone??? trick.) It was the alarm company. I didn???t answer, of course, but now I know Nick has made it as far as his dad???s house. Clue 3. I changed the code two weeks before I disappeared and listed my secret cell as the first number to call. I can picture Nick, my clue in hand, entering his dad???s dusty, stale house, fumbling with the alarm code ??? then the time runs out. Beep beep beeeep! His cell is listed as the backup if I can???t be reached (and I obviously can???t).
So he tripped the alarm, and he talked to someone at the alarm company, and so he???s on record as being in his dad???s house after my disappearance. Which is good for the plan. It???s not foolproof, but it doesn???t have to be foolproof. I???ve already left enough for the police to make a case against Nick: the staged scene, the mopped-up blood, the credit-card bills. All these will be found by even the most incompetent police departments. Noelle will spill my pregnancy news very soon (if she hasn???t already). It is enough, especially once the police discover Able Andie (able to suck cock on command). So all these extras, they???re just bonus fuck-yous. Amusing booby traps. I love that I am a woman with booby traps.
Ellen Abbott is part of my plan too. The biggest cable crime-news show in the country. I adore Ellen Abbott, I love how protective and maternal she gets about all the missing women on her show, and how rabid-dog vicious she is once she seizes on a suspect, usually the husband. She is America???s voice of female righteousness. Which is why I???d really like her to take on my story. The Public must turn against Nick. It???s as much a part of his punishment as prison, for darling Nicky ??? who spends so much time worrying about people liking him ??? to know he is universally hated. And I need Ellen to keep me apprised of the investigation. Have the police found my diary yet? Do they know about Andie? Have they discovered the bumped-up life insurance? This is the hardest part: waiting for stupid people to figure things out.
I flip on the TV in my little room once an hour, eager to see if Ellen has picked up my story. She has to, I can???t see how she could resist. I am pretty, Nick is pretty, and I have the Amazing Amy hook. Just before noon, she flares up, promising a special report. I stay tuned, glaring at the TV: Hurry up, Ellen. Or: Hurry up, Ellen. We have that in common: We are both people and entities. Amy and Amy, Ellen and Ellen.
Tampon commercial, detergent commercial, maxipad commercial, Windex commercial. You???d think all women do is clean and bleed.
And finally! There I am! My debut!
I know from the second Ellen shows up, glowering like Elvis, that this is going to be good. A few gorgeous photos of me, a still shot of Nick with his insane love me! grin from the first press conference. News: There has been a fruitless multi-site search for ???the beautiful young woman with everything going for her.??? News: Nick fucked himself already. Taking candid photos with a townie during a search for me. This is clearly what hooked Ellen, because she is pissed. There he is, Nick in his sweetie-pie mode, the I am the beloved of all women mode, his face pressed against the strange woman???s, as if they???re happy-hour buddies.
What an idiot. I love it.
Ellen Abbott is making much of the fact that our backyard leads right to the Mississippi River. I wonder then if it has been leaked ??? the search history on Nick???s computer, which I made sure includes a study on the locks and dams of the Mississippi, as well as a Google search of the words body float Mississippi River. Not to put too fine a point on it. It could happen ??? possibly, unlikely, but there is precedent ??? that the river might sweep my body all the way to the ocean. I???ve actually felt sad for myself, picturing my slim, naked, pale body, floating just beneath the current, a colony of snails attached to one bare leg, my hair trailing like seaweed until I reach the ocean and drift down down down to the bottom, my waterlogged flesh peeling off in soft streaks, me slowly disappearing into the current like a watercolor until just the bones are left.
But I???m a romantic. In real life, if Nick had killed me, I think he would have just rolled my body into a trash bag and driven me to one of the landfills in the sixty-mile radius. Just dispose of me. He???d have even taken a few items with him ??? the broken toaster that???s not worth fixing, a pile of old VHS tapes he???s been meaning to toss ??? to make the trip efficient.
I???m learning to live fairly efficiently myself. A girl has to budget when she???s dead. I had time to plan, to stockpile some cash: I gave myself a good twelve months between deciding to disappear and disappearing. That???s why most people get caught in murders: They don???t have the discipline to wait. I have $10,200 in cash. If I???d cleared out $10,200 in a month, that would have been noticed. But I collected cash forwards from credit cards I took out in Nick???s name ??? the cards that would make him look like a greedy little cheat ??? and I siphoned off another $4,400 from our bank accounts over the months: withdrawals of $200 or $300, nothing to attract attention. I stole from Nick, from his pockets, a $20 here, a $10 there, a slow deliberate stockpile ??? it???s like that budgeting plan where you put the money you???d spend on your morning Starbucks into a jar, and at the end of the year you have $1,500. And I???d always steal from the tip jar when I went to The Bar. I???m sure Nick blamed Go, and Go blamed Nick, and neither of them said anything because they felt too sorry for the other.
But I am careful with money, my point. I have enough to live on until I kill myself. I???m going to hide out long enough to watch Lance Nicholas Dunne become a worldwide pariah, to watch Nick be arrested, tried, marched off to prison, bewildered in an orange jumpsuit and handcuffs. To watch Nick squirm and sweat and swear he is innocent and still be stuck. Then I will travel south along the river, where I will meet up with my body, my pretend floating Other Amy body in the Gulf of Mexico. I will sign up for a booze cruise ??? something to get me out into the deep end but nothing requiring identification. I will drink a giant ice-wet shaker of gin, and I will swallow sleeping pills, and when no one is looking, I???ll drop silently over the side, my pockets full of Virginia Woolf rocks. It requires discipline, to drown oneself, but I have discipline in spades. My body may never be discovered, or it may resurface weeks, months, later ??? eroded to the point that my death can???t be time-stamped ??? and I will provide a last bit of evidence to make sure Nick is marched to the padded cross, the prison table where he???ll be pumped with poison and die.
I???d like to wait around and see him dead, but given the state of our justice system, that may take years, and I have neither the money nor the stamina. I???m ready to join the Hopes.
I did veer from my budget a bit already. I spent about $500 on items to nice-up my cabin ??? good sheets, a decent lamp, towels that don???t stand up by themselves from years of bleaching. But I try to accept what I???m offered. There???s a man a few cabins away, a taciturn fellow, a hippie dropout of the Grizzly Adams, homemade-granola variety ??? full beard and turquoise rings and a guitar he plays on his back deck some nights. His name, he says, is Jeff, just like my name, I say, is Lydia. We smile only in passing, but he brings me fish. A couple of times now, he brings a fish by, freshly stinking but scaled and headless, and presents it to me in a giant icy freezer bag. ???Fresh fish!??? he says, knocking, and if I don???t open the door immediately, he disappears, leaving the bag on my front doorstep. I cook the fish in a decent skillet I bought at yet another Wal-Mart, and it???s not bad, and it???s free.
???Where do you get all the fish???? I ask him.
???At the getting place,??? he says.
Dorothy, who works the front desk and has already taken a liking to me, brings tomatoes from her garden. I eat the tomatoes that smell like the earth and the fish that smells like the lake. I think that by next year, Nick will be locked away in a place that smells only of the inside. Fabricated odors: deodorant and old shoes and starchy foods, stale mattresses. His worst fear, his own personal panic dream: He finds himself in jail, realizing he did nothing wrong but unable to prove it. Nick???s nightmares have always been about being wronged, about being trapped, a victim of forces beyond his control.
He always gets up after these dreams, paces around the house, then puts on clothes and goes outside, wanders along the roads near our house, into a park ??? a Missouri park, a New York park ??? going wherever he wants. He is a man of the outdoors, if he is not exactly outdoorsy. He???s not a hiker, a camper, he doesn???t know how to make fires. He wouldn???t know how to catch fish and present them to me. But he likes the option, he likes the choice. He wants to know he can go outside, even if he chooses instead to sit on the couch and watch cage fighting for three hours.
I do wonder about the little slut. Andie. I thought she???d last exactly three days. Then she wouldn???t be able to resist sharing. I know she likes to share because I???m one of her friends on Facebook ??? my profile name is invented (Madeleine Elster, ha!), my photo is stolen from a popup ad for mortgages (blond, smiling, benefiting from historically low interest rates). Four months ago, Madeleine randomly asked to be Andie???s friend, and Andie, like a hapless puppy, accepted, so I know the little girl fairly well, along with all her minutiae-enthralled friends, who take many naps and love Greek yogurt and pinot grigio and enjoy sharing that with each other. Andie is a good girl, meaning she doesn???t post photos of herself ???partying,??? and she never posts lascivious messages. Which is unfortunate. When she???s exposed as Nick???s girlfriend, I???d prefer the media find photos of her doing shots or kissing girls or flashing her thong; this would more easily cement her as the homewrecker she is.
Homewrecker. My home was disheveled but not yet wrecked when she first started kissing my husband, reaching inside his trousers, slipping into bed with him. Taking his cock in her mouth, all the way to the root so he feels extra big as she gags. Taking it in her ass, deep. Taking cum shots to the face and tits, then licking it off, yum. Taking, definitely taking. Her type would. They???ve been together for over a year. Every holiday. I went through his credit-card statements (the real ones) to see what he got her for Christmas, but he???s been shockingly careful. I wonder what it feels like to be a woman whose Christmas present must be bought in cash. Liberating. Being an undocumented girl means being the girl who doesn???t have to call the plumber or listen to gripes about work or remind and remind him to pick up some goddamn cat food.
I need her to break. I need 1) Noelle to tell someone about my pregnancy; 2) the police to find the diary; 3) Andie to tell someone about the affair. I suppose I had her stereotyped ??? that a girl who posts updates on her life five times a day for anyone to see would have no real understanding of what a secret is. She???s made occasional grazing mentions of my husband online:
Saw Mr Hunky today.
(Oh, do tell!)
(When do we get to meet this stud?)
(Bridget likes this!)
A kiss from a dreamy guy makes everything better.
(Too true!)
(When do we get to meet Dreamy?!)
(Bridget likes this!)
But she???s been surprisingly discreet for a girl of her generation. She???s a good girl (for a cunt). I can picture her, that heart-shaped face tilted to one side, the gently furrowed brow. I just want you to know I???m on your side, Nick. I???m here for you. Probably baked him cookies.
The Ellen Abbott cameras are now panning the Volunteer Center, which looks a little shabby. A correspondent is talking about how my disappearance has ???rocked this tiny town,??? and behind her, I can see a table lined with homemade casseroles and cakes for poor Nicky. Even now the asshole has women taking care of him. Desperate women spotting an opening. A good-looking, vulnerable man ??? and fine, he may have killed his wife, but we don???t know that. Not for sure. For now it???s a relief just to have a man to cook for, the fortysomething equivalent of driving your bike past the cute boy???s house.
They are showing Nick???s grinning cell-phone photo again. I can picture the townie slut in her lonely, glistening kitchen ??? a trophy kitchen bought with alimony money ??? mixing and baking while having an imaginary conversation with Nick: No, I???m forty-three, actually. No, really, I am! No, I don???t have men swarming all over me, I really don???t, the men in town aren???t that interesting, most of them ???
I get a burst of jealousy toward that woman with her cheek against my husband???s. She is prettier than me as I am now. I eat Hershey bars and float in the pool for hours under a hot sun, the chlorine turning my flesh rubbery as a seal???s. I???m tan, which I???ve never been before ??? at least not a dark, proud, deep tan. A tanned skin is a damaged skin, and no one likes a wrinkled girl; I spent my life slick with SPF. But I let myself darken a bit before I disappeared, and now, five days in, I???m on my way to brown. ???Brown as a berry!??? old Dorothy, the manager says. ???You are brown as a berry, girl!??? she says with delight when I come in to pay next week???s rent in cash.
I have dark skin, my mouse-colored helmet cut, the smart-girl glasses. I gained twelve pounds in the months before my disappearance ??? carefully hidden in roomy sundresses, not that my inattentive husband would notice ??? and already another two pounds since. I was careful to have no photos taken of me in the months before I disappeared, so the public will know only pale, thin Amy. I am definitely not that anymore. I can feel my bottom move sometimes, on its own, when I walk. A wiggle and a jiggle, wasn???t that some old saying? I never had either before. My body was a beautiful, perfect economy, every feature calibrated, everything in balance. I don???t miss it. I don???t miss men looking at me. It???s a relief to walk into a convenience store and walk right back out without some hangabout in sleeveless flannel leering as I leave, some muttered bit of misogyny slipping from him like a nacho-cheese burp. Now no one is rude to me, but no one is nice to me either. No one goes out of their way, not overly, not really, not the way they used to.
I am the opposite of Amy.')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (16, 3, 1, N'Nick Dunne Forty Days Gone', 1, N'Out on bond, awaiting trial. I???d been processed and released ??? the depersonalized in-and-outing of jail, the bond hearing, the fingerprints and photos, the rotating and the shuffling and the handling, it didn???t make me feel like an animal, it made me feel like a product, something created on an assembly line. What they were creating was Nick Dunne, Killer. It would be months until we???d begin my trial (my trial: the word still threatened to undo me completely, turn me into a high-pitched giggler, a madman). I was supposed to feel privileged to be out on bond: I had stayed put even when it was clear I was going to be arrested, so I was deemed no flight risk. Boney might have put a good word in for me, too. So I got to be in my own home for a few more months before I was carted off to prison and killed by the state.
Yes, I was a lucky, lucky man.
It was mid-August, which I found continually strange: It???s still summer, I???d think. How can so much have happened and it???s not even autumn? It was brutally warm. Shirtsleeve weather, was how my mom would have described it, forever more concerned with her children???s comfort than the actual Fahrenheit. Shirtsleeve weather, jacket weather, overcoat weather, parka weather ??? the Year in Outerwear. For me this year, it would be handcuff weather, then possibly prison-jumpsuit weather. Or funeral-suit weather, because I didn???t plan on going to prison. I???d kill myself first.
Tanner had a team of five detectives trying to track Amy down. So far, nothing. Like trying to catch water. Every day for weeks, I???d done my little shitty part: videotape a message to Amy and post it on young Rebecca???s Whodunnit blog. (Rebecca, at least, had remained loyal.) In the videos, I wore clothes Amy had bought me, and I brushed my hair the way she liked, and I tried to read her mind. My anger toward her was like heated wire.
The camera crews parked themselves on my lawn most mornings. We were like rival soldiers, rooted in shooting distance for months, eyeing each other across no-man???s-land, achieving some sort of perverted fraternity. There was one guy with a voice like a cartoon strongman whom I???d become attached to, sight unseen. He was dating a girl he really, really liked. Every morning his voice boomed in through my windows as he analyzed their dates; things seemed to be going very well. I wanted to hear how the story ended.
I finished my evening taping to Amy. I was wearing a green shirt she liked on me, and I???d been telling her the story of how we first met, the party in Brooklyn, my awful opening line, just one olive, that embarrassed me every time Amy mentioned it. I talked about our exit from the oversteamed apartment out into the crackling cold, with her hand in mine, the kiss in the cloud of sugar. It was one of the few stories we told the same way. I said it all in the cadence of a bedtime tale: soothing and familiar and repetitive. Always ending with Come home to me, Amy.
I turned off the camera and sat back on the couch (I always filmed while sitting on the couch under her pernicious, unpredictable cuckoo clock, because I knew if I didn???t show her cuckoo clock, she???d wonder whether I had finally gotten rid of her cuckoo clock, and then she???d stop wondering whether I had finally gotten rid of her cuckoo clock and simply come to believe it was true, and then no matter what sweet words came out of my mouth, she???d silently counter with: ???and yet he tossed out my cuckoo clock???). The cuckoo was, in fact, soon to pop out, its grinding windup beginning over my head ??? a sound that inevitably made my jaw tense ??? when the camera crews outside emitted a loud, collective, oceanic wushing. Somebody was here. I heard the seagull cries of a few female news anchors.
Something is wrong, I thought.
The doorbell rang three times in a row: Nick-nick! Nick-nick! Nick-nick!
I didn???t hesitate. I had stopped hesitating over the past month: Bring on the trouble posthaste.
I opened the door.
It was my wife.
Back.
Amy Elliott Dunne stood barefoot on my doorstep in a thin pink dress that clung to her as if it were wet. Her ankles were ringed in dark violet. From one limp wrist dangled a piece of twine. Her hair was short and frayed at the ends, as if it had been carelessly chopped by dull scissors. Her face was bruised, her lips swollen. She was sobbing.
When she flung her arms out toward me, I could see her entire midsection was stained with dried blood. She tried to speak; her mouth opened, once, twice, silent, a mermaid washed ashore.
???Nick!??? she finally keened ??? a wail that echoed against all the empty houses ??? and fell into my arms.
I wanted to kill her.
Had we been alone, my hands might have found their place around her neck, my fingers locating perfect grooves in her flesh. To feel that strong pulse under my fingers ??? but we weren???t alone, we were in front of cameras, and they were realizing who this strange woman was, they were coming to life as sure as the cuckoo clock inside, a few clicks, a few questions, then an avalanche of noise and light. The cameras were blasting us, the reporters closing in with microphones, everyone yelling Amy???s name, screaming, literally screaming. So I did the right thing, I held her to me and howled her name right back: ???Amy! My God! My God! My darling!??? and buried my face in her neck, my arms wrapped tight around her, and let the cameras get their fifteen seconds, and I whispered deep inside her ear, ???You fucking bitch.??? Then I stroked her hair, I cupped her face in my two loving hands, and I yanked her inside.
Outside our door, a rock concert was demanding its encore: Amy! Amy! Amy! Someone threw a scattering of pebbles at our window. Amy! Amy! Amy!
My wife took it all as her due, fluttering a dismissive hand toward the rabble outside. She turned to me with a worn but triumphant smile ??? the smile on the rape victim, the abuse survivor, the bed burner in the old TV movies, the smile where the bastard has finally received due justice and we know our heroine will be able to move on with life! Freeze frame.
I gestured to the twine, the hacked hair, the dried blood. ???So, what???s your story, wife????
???I???m back,??? she whimpered. ???I made it back to you.??? She moved to put her arms around me. I moved away.
???What is your story, Amy????
???Desi,??? she whispered, her lower lip trembling. ???Desi Collings took me. It was the morning. Of. Of our anniversary. And the doorbell rang, and I thought ??? I don???t know, I thought maybe it was flowers from you.???
I flinched. Of course she???d find a way to work in a gripe: that I hardly ever sent her flowers, when her dad had sent her mom flowers each week since they???d been married. That???s 2,444 bouquets of flowers vs. 4.
???Flowers or ??? something,??? she continued. ???So I didn???t think, I just flung open the door. And there he stood, Desi, with this look on his face. Determined. As if he???d been girding himself up for this all along. And I was holding the handle ??? to the Judy puppet. Did you find the puppets???? She smiled up at me tearily. She looked so sweet.
???Oh, I found everything you left for me, Amy.???
???I had just found the handle to the Judy puppet ??? it had fallen off ??? I was holding it when I opened the door, and I tried to hit him, and we struggled, and he clubbed me with it. Hard. And the next thing I knew ??????
???You had framed me for murder and disappeared.???
???I can explain everything, Nick.???
I stared at her a long hard moment. I saw days under the hot sun stretched across the sand of the beach, her hand on my chest, and I saw family dinners at her parents??? house, with Rand always refilling my glass and patting me on the shoulder, and I saw us sprawled on the rug in my crummy New York apartment, talking while staring at the lazy ceiling fan, and I saw mother of my child and the stunning life I???d planned for us once. I had a moment that lasted two beats, one, two, when I wished violently that she were telling the truth.
???I actually don???t think you can explain everything,??? I said. ???But I am going to love watching you try.???
???Try me now.???
She tried to take my hand, and I flung her off. I walked away from her, took a breath, and then turned to face her. My wife must always be faced.
???Go ahead, Nick. Try me now.???
???Okay, sure. Why was every clue of the treasure hunt hidden in a place where I had ??? relations with Andie????
She sighed, looked at the floor. Her ankles were raw. ???I didn???t even know about Andie until I saw it on TV ??? while I was tied to Desi???s bed, hidden away in his lake house.???
???So that was all ??? coincidence????
???Those were all places that were meaningful to us,??? she said. A tear slid down her face. ???Your office, where you reignited your passion for journalism.???
I snuffed.
???Hannibal, where I finally understood how much this area means to you. Your father???s house ???confronting the man who hurt you so much. Your mother???s house, which is now Go???s house, the two people who made you such a good man. But ??? I guess it doesn???t surprise me that you???d like to share those places with someone you??? ??? she bowed her head ??? ???had fallen in love with. You always liked repeats.???
???Why did each of those places end up including clues that implicated me in your murder? Women???s undies, your purse, your diary. Explain your diary, Amy, with all the lies.???
She just smiled and shook her head like she was sorry for me. ???Everything, I can explain everything,??? she said.
I looked in that sweet tear-stained face. Then I looked down at all the blood. ???Amy. Where???s Desi????
She shook her head again, a sad little smile.
I moved to call the police, but a knock on our door told me they were already here.')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (17, 3, 2, N'Amy Elliott Dunne The Night Of The Return', 1, N'I still have Desi???s semen inside me from the last time he raped me, so the medical examination goes fine. My rope-wreathed wrists, my damaged vagina, my bruises ??? the body I present them is textbook. An older male doctor with humid breath and thick fingers performs the pelvic exam ??? scraping and wheezing in time ??? while Detective Rhonda Boney holds my hand. It is like being clutched by a cold bird claw. Not comforting at all. Once she breaks into a grin when she thinks I???m not looking. She is absolutely thrilled that Nick isn???t a bad guy after all. Yes, the women of America are collectively sighing.
Police have been dispatched to Desi???s home, where they???ll find him naked and drained, a stunned look on his face, a few strands of my hair in his clutches, the bed soaked in blood. The knife I used on him, and on my bonds, will be nearby on the floor where I dropped it, dazed, and walked barefoot, carrying nothing out of the house but his keys ??? to the car, to the gate ??? and climbed, still slick with his blood, into his vintage Jaguar and returned like some long-lost faithful pet, straight back home to my husband. I???d been reduced to an animal state; I didn???t think of anything but getting back to Nick.
The old doctor tells me the good news; no permanent damage and no need for a D&C ??? I miscarried too early. Boney keeps clutching my hand and murmuring, My God, what you???ve been through do you think you feel up to answering a few questions? That fast, from condolences to brass tacks. I find ugly women are usually overly deferential or incredibly rude.
You are Amazing Amy, and you???ve survived a brutal kidnapping involving repeated assaults. You???ve killed your captor, and you???ve made it back to a husband you???ve discovered was cheating. You:
a) Put yourself first and demand some time alone to collect yourself.
b) Hold it together just a little longer so you can help the police.
c) Decide which interview to give first ??? you might as well get something out of the ordeal, like a book deal.
Answer: B. Amazing Amy always puts others first.
I???m allowed to clean myself up in a private room in the hospital, and I change into a set of clothes Nick put together for me from the house ??? jeans with creases from being folded too long, a pretty blouse that smells of dust. Boney and I drive from the hospital to the police station in near silence. I ask weakly after my parents.
???They???re waiting for you at the station,??? Boney says. ???They wept when I told them. With joy. Absolute joy and relief. We???ll let them get some good hugs in with you before we do our questions, don???t worry.???
The cameras are already at the station. The parking lot has that hopeful, overlit look of a sports stadium. There is no underground parking, so we have to pull right up front as the madding crowd closes in: I see wet lips and spittle as everyone screams questions, the pops of flashbulbs and camera lights. The crowd pushes and pulls en masse, jerking a few inches to the right, then the left as everyone tries to reach me.
???I can???t do this,??? I say to Boney. A man???s meaty palm smacks against the car window as a photographer tries to keep his balance. I grab her cold hand. ???It???s too much.???
She pats me and says, wait. The station doors open, and every officer in the building files down the stairs and forms a line on either side of me, holding the press back, creating an honor guard for me, and Rhonda and I run in holding hands like reverse newlyweds, rushing straight up to my parents who are waiting just inside the doorway, and everyone gets the photos of us clutching each other with my mom whispering sweetgirlsweetgirlsweetgirl and my dad sobbing so loudly he almost chokes.
There is more whisking away of me, as if I haven???t been whisked away quite enough already. I am deposited in a closet of a room with comfortable but cheap office chairs, the kind that always seem to have bits of old food woven into the fabric. A camera blinking up in the corner and no windows. It is not what I pictured. It is not designed to make me feel safe.
I am surrounded by Boney, her partner, Gilpin, and two FBI agents up from St. Louis who remain nearly silent. They give me water, and then Boney starts.
B: Okay, Amy, first we have to thank you sincerely for talking with us after what you???ve been through. In a case like this, it???s very important to get everything down while the memory is fresh. You can???t imagine how important that is. So it???s good to talk now. If we can get all these details down, we can close the case, and you and Nick can go back to your lives.
A: I???d definitely like that.
B: You deserve that. So if you???re ready to begin, can we start with the time line: What time did Desi arrive at your door? Do you remember?
A: About ten a.m. A little after, because I remember hearing the Teverers talking as they walked to their car for church.
B: What happened when you opened the door?
A: Something felt wrong immediately. First of all, Desi has written me letters all my life. But his obsession seemed to have become less intense over the years. He seemed to think of himself as just an old friend, and since the police couldn???t do anything about it, I made my peace with that. I never felt like he meant me active harm, although I really didn???t like being this close to him. Geographically. I think that???s what put him over the edge. Knowing I was so close. He walked into my house with ??? He was sweaty and sort of nervous but also determined-looking. I???d been upstairs, I???d been about to iron my dress when I noticed the big wooden handle of the Judy puppet on the floor ??? I guess it had fallen off. Bummer because I???d already hidden the puppets in the woodshed. So I grabbed the handle, and I had that in my hand when I opened the door.
B: Very good memory.
A: Thank you.
B: What happened next?
A: Desi barged in, and he was pacing around the living room, all flustered and kind of frantic, and he said, What are you doing for your anniversary? It frightened me, that he knew today was our anniversary, and he seemed angry about it, and then his arm flashed out and he had me by the wrist and was twisting it behind my back, and we struggled. I put up a real fight.
B: What next?
A: I kicked him and got away for a second and ran to the kitchen, and we struggled more and he clubbed me once with the big wooden Judy handle, and I went flying and then he hit me two or three more times. I remember not being able to see for a second, just dizzy, my head was throbbing and I tried to grab for the handle and he stabbed my arm with this pocketknife he was carrying. I still have the scar. See?
B: Yes, that was noted in your medical examination. You were lucky it was only a flesh wound.
A: It doesn???t feel like a flesh wound, believe me.
B: So he stabbed you? The angle is???
A: I???m not sure if he did it on purpose, or if I thrust myself onto the blade accidentally ??? I was so off balance. I remember the club falling to the floor, though, and I looked down and saw my blood from the stab wound pooling over the club. I think I passed out then.
B: Where were you when you woke up?
A: I woke up hog-tied in my living room.
B: Did you scream, try to get the neighbors??? attention?
A: Of course I screamed. I mean, did you hear me? I was beaten, stabbed, and hog-tied by a man who had been obsessed with me for decades, who once tried to kill himself in my dorm bedroom.
B: Okay, okay, Amy, I???m sorry, that question was not intended in the least to sound like we are blaming you, we just need to get a full picture here so we can close the investigation and you can get on with your life. Do you want another water, or coffee or something?
A: Something warm would be nice. I???m so cold.
B: No problem. Can you get her a coffee? So what happened then?
A: I think his original plan was to subdue me and kidnap me and let it look like a runaway-wife thing, because when I wake up, he???s just finished mopping the blood in the kitchen, and he???s straightened the table of little antique ornaments that fell over when I ran to the kitchen. He???s gotten rid of the club. But he???s running out of time, and I think what must have happened is: He sees this disheveled living room ??? and so he thinks, Leave it. Let it look like something bad happened here. So he throws the front door open, and then he knocks a few more things over in the living room. Overturns the ottoman. So that???s why the scene looked so weird: It was half true and half false.
B: Did Desi plant incriminating items at each of the treasure hunt sites: Nick???s office, Hannibal, his dad???s house, Go???s woodshed?
A: I don???t know what you mean?
B: There was a pair of women???s underwear, not your size, in Nick???s office.
A: I guess it must have been the girl he was ??? dating.
B: Not hers either.
A: Well, I can???t help on that one. Maybe he was seeing more than one girl.
B: Your diary was found in his father???s house. Partly burned in the furnace.
A: Did you read the diary? It???s awful. I???m sure Nick did want to get rid of it ??? I don???t blame him, considering you guys zeroed in on him so quickly.
B: I wonder why he would go to his father???s to burn it.
A: You should ask him. (Pause.) Nick went there a lot, to be alone. He likes his privacy. So I???m sure it didn???t feel that odd to him. I mean he couldn???t do it at our house, because it???s a crime scene ??? who knows if you guys will come back, find something in the ashes. At his dad???s, he has some discretion. I thought it was a smart move, considering you guys were basically railroading him.
B: The diary is very, very concerning. The diary alleges abuse and your fears that Nick didn???t want the baby, that he might want to kill you.
A: I really do wish that diary had burned. (Pause.) Let me be honest: The diary includes some of Nick???s and my struggles these past few years. It doesn???t paint the greatest picture of our marriage or of Nick, but I have to admit: I never wrote in the diary unless I was super-happy, or I was really, really unhappy and wanted to vent and then ??? I can get a little dramatic when it???s just me stewing on things. I mean, a lot of that is the ugly truth ??? he did shove me once, and he didn???t want a baby, and he did have money problems. But me being afraid of him? I have to admit, it pains me to admit, but that???s my dramatic streak. I think the problem is, I???ve been stalked several times ??? it???s been a lifelong issue ??? people getting obsessed with me ??? and so I get a little paranoid.
B: You tried to buy a gun.
A: I get a lot paranoid, okay? I???m sorry. If you had my history, you???d understand.
B: There???s an entry about a night of drinks when you suffered from what sounds like textbook antifreeze poisoning.
A: (Long silence.) That???s bizarre. Yes, I did get ill.
B: Okay, back to the treasure hunt. You did hide the Punch and Judy dolls in the woodshed?
A: I did.
B: A lot of our case has focused on Nick???s debt, some extensive credit-card purchases, and our discovery of all those items hidden in the woodshed. What did you think when you opened the woodshed and saw all this stuff?
A: I was on Go???s property, and Go and I aren???t especially close, so mostly, I felt like I was nosing around in something that wasn???t my business. I remember thinking at the time that it must have been her stuff from New York. And then I saw on the news ??? Desi made me watch everything ??? that it corresponded with Nick???s purchases, and ??? I knew Nick had some money troubles, he was a spender. I think he was probably embarrassed. Impulse purchases he couldn???t undo, so he hid them from me until he could sell them online.
B: The Punch and Judy puppets, they seem a little ominous for an anniversary present.
A: I know! Now I know. I didn???t remember the whole backstory of Punch and Judy. I was just seeing a husband and wife and a baby, and they were made of wood, and I was pregnant. I scanned the Internet and saw Punch???s line: That???s the way to do it! And I thought it was cute ??? I didn???t know what it meant.
B: So you were hog-tied. How did Desi get you to the car?
A: He pulled the car into the garage and lowered the garage door, dragged me in, threw me in the trunk, and drove away.
B: And did you yell then?
A: Yes, I fucking yelled. I am a complete coward. And if I???d known that, every night for the next month, Desi was going to rape me, then snuggle in next to me with a martini and a sleeping pill so he wouldn???t be awakened by my sobbing, and that the police were going to actually interview him and still not have a clue, still sit around with their thumbs up their asses, I might have yelled harder. Yes, I might have.
B: Again, my apologies. Can we get Ms Dunne some tissues, please? And where???s her coff???Thank you. Okay, where did you go from there, Amy?
A: We drove toward St. Louis, and I remember on the way there he stopped at Hannibal ??? I heard the steamboat whistle. He threw my purse out. It was the one other thing he did so it would look like foul play.
B: This is so interesting. There seem to be so many strange coincidences in this case. Like, that Desi would happen to toss out the purse right at Hannibal, where your clue would make Nick go ??? and we in turn would believe that Nick tossed the purse there. Or how you decided to hide a present in the very place where Nick was hiding goods he???d bought on secret credit cards.
A: Really? I have to tell you, none of this sounds like coincidence to me. It sounds like a bunch of cops who got hung up on my husband being guilty, and now that I am alive and he???s clearly not guilty, they look like giant idiots, and they???re scrambling to cover their asses. Instead of accepting responsibility for the fact that, if this case had been left in your extremely fucking incompetent hands, Nick would be on death row and I???d be chained to a bed, being raped every day from now until I died.
B: I???m sorry, it???s???
A: I saved myself, which saved Nick, which saved your sorry fucking asses.
B: That is an incredibly good point, Amy. I???m sorry, we???re so ??? We???ve spent so long on this case, we want to figure out every detail that we missed so we don???t repeat our mistakes. But you???re absolutely right, we???re missing the big picture, which is: You are a hero. You are an absolute hero.
A: Thank you. I appreciate you saying that.')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (18, 3, 3, N'Nick Dunne The Night Of The Return', 1, N'I went to the station to fetch my wife and was greeted by the press like a rock star ??? landslide president ??? first moonwalker all in one. I had to resist raising clasped hands above my head in the universal victory shake. I see, I thought, we???re all pretending to be friends now.
I entered a scene that felt like a holiday party gone awry ??? a few bottles of champagne rested on one desk, surrounded by tiny paper cups. Backslapping and cheers for all the cops, and then more cheers for me, as if these people hadn???t been my persecutors a day before. But I had to play along. Present the back for slapping. Oh yes, we???re all buddies now.
All that matters is that Amy is safe. I???d been practicing that line over and over. I had to look like the relieved, doting husband until I knew which way things were going to go. Until I was sure the police had sawed through all her sticky cobwebby lies. Until she is arrested ??? I???d get that far, until she is arrested, and then I could feel my brain expand and deflate simultaneously ??? my own cerebral Hitchcock zoom ??? and I???d think: My wife murdered a man.
???Stabbed him,??? said the young police officer assigned as the family liaison. (I hoped never to be liaisoned again, with anyone, for any reason.) He was the same kid who???d yammered on to Go about his horse and torn labrum and peanut allergy. ???Cut him right through the jugular. Cut like that, he bleeds out in, like, sixty seconds.???
Sixty seconds is a long time to know you are dying. I could picture Desi wrapping his hands around his neck, the feel of his own blood spurting between his fingers with each pulse, and Desi getting more frightened and the pulsing only quickening ??? and then slowing, and Desi knowing the slowing was worse. And all the time Amy standing just out of reach, studying him with the blameful, disgusted look of a high school biology student confronted with a dripping pig fetus. Her little scalpel still in hand.
???Cut him with a big ole butcher knife,??? the kid was saying. ???Guy used to sit right next to her on the bed, cut up her meat for her, and feed her.??? He sounded more disgusted by this than by the stabbing. ???One day the knife slips off the plate, he never notices??????
???How???d she use the knife if she was always tied up???? I asked.
The kid looked at me as if I???d just told a joke about his mother. ???I don???t know, Mr Dunne, I???m sure they???re getting the details right now. The point is, your wife is safe.???
Hurray. Kid stole my line.
I spotted Rand and Marybeth through the doorway of the room where we???d given our first press conference six weeks ago. They were leaning in to each other, as always, Rand kissing the top of Marybeth???s head, Marybeth nuzzling him back, and I felt such a keen sense of outrage that I almost threw a stapler at them. You two worshipful, adoring assholes created that thing down the hall and set her loose on the world. Lo, how jolly, what a perfect monster! And do they get punished? No, not a single person had come forth to question their characters; they???d experienced nothing but an outpouring of love and support, and Amy would be restored to them and everyone would love her more.
My wife was an insatiable sociopath before. What would she become now?
Step carefully, Nick, step very carefully.
Rand caught my eye and motioned me to join them. He shook my hand for a few exclusive reporters who???d been granted an audience. Marybeth held her ground: I was still the man who???d cheated on her daughter. She gave a curt nod and turned away.
Rand leaned in close to me so I could smell his spearmint gum. ???I tell you, Nick, we are so relieved to have Amy back. We owe you an apology too. Big one. We???ll let Amy decide how she feels about your marriage, but I want to at least apologize for where things went. You???ve got to understand??????
???I do,??? I said. ???I understand everything.???
Before Rand could apologize or engage further, Tanner and Betsy arrived together, looking like a Vogue spread ??? crisp slacks and jewel-toned shirts and gleaming gold watches and rings ??? and Tanner leaned toward my ear and whispered, Let me see where we are, and then Go was rushing in, all alarmed eyes and questions: What does this mean? What happened to Desi? She just showed up on your doorstep? What does this mean? Are you okay? What happens next?
It was a bizarre gathering ??? the feel of it: not quite reunion, not quite hospital waiting room, celebratory yet anxious, like some parlor game where no one had all the rules. Meanwhile, the two reporters the Elliotts had allowed into the inner sanctum kept snapping questions at me: How great does it feel to have Amy back? How wonderful do you feel right now? How relieved are you, Nick, that Amy has returned?
I???m extremely relieved and very happy, I was saying, crafting my own bland PR statement, when the doors parted and Jacqueline Collings entered, her lips a tight red scar, her face powder lined with tears.
???Where is she???? she said to me. ???The lying little bitch, where is she? She killed my son. My son.??? She began crying as the reporter snapped a few photos.
How do you feel that your son was accused of kidnap and rape? one reporter asked in a stiff voice.
???How do I feel???? she snapped. ???Are you actually serious? Do people really answer questions like that? That nasty, soulless girl manipulated my son his entire life ??? write this down ??? she manipulated and lied and finally murdered him, and now, even after he???s dead, she???s still using him??????
???Ms Collings, we???re Amy???s parents,??? Marybeth was beginning. She tried to touch Jacqueline on the shoulder, and Jacqueline shook her off. ???I am sorry for your pain.???
???But not my loss.??? Jacqueline stood a good head taller than Marybeth; she glared down on her. ???But not my loss,??? she reasserted.
???I???m sorry about ??? everything,??? Marybeth said, and then Rand was next to her, a head taller than Jacqueline.
???What are you going to do about your daughter???? Jacqueline asked. She turned toward our young liaison officer, who tried to hold his ground. ???What is being done about Amy? Because she is lying when she says my son kidnapped her. She is lying. She killed him, she murdered him in his sleep, and no one seems to be taking this seriously.???
???It???s all being taken very, very seriously, ma???am,??? the young kid said.
???Can I get a quote, Ms Collings???? asked the reporter.
???I just gave you my quote. Amy Elliott Dunne murdered my son. It was not self-defense. She murdered him.???
???Do you have proof of that????
Of course she didn???t.
The reporter???s story would chronicle my husbandly exhaustion (his drawn face telling of too many nights forfeited to fear) and the Elliotts??? relief (the two parents cling to each other as they wait for their only child to be officially returned to them). It would discuss the incompetence of the cops (it was a biased case, full of dead ends and wrong turns, with the police department focused doggedly on the wrong man). The article would dismiss Jacqueline Collings in a single line: After an awkward run-in with the Elliott parents, an embittered Jacqueline Collings was ushered out of the room, claiming her son was innocent.
Jacqueline was indeed ushered out of the room into another, where her statement would be recorded and she would be kept out of the way of the much better story: the Triumphant Return of Amazing Amy.
When Amy was released to us, it all began again. The photos and the tears, the hugging and the laughter, all for strangers who wanted to see and to know: What was it like? Amy, what does it feel like to escape your captor and return to your husband? Nick, what does it feel like to get your wife back, to get your freedom back, all at once?
I remained mostly silent. I was thinking my own questions, the same questions I???d thought for years, the ominous refrain of our marriage: What are you thinking, Amy? How are you feeling? Who are you? What have we done to each other? What will we do?
It was a gracious, queenly act for Amy to want to come home to our marriage bed with her cheating husband. Everyone agreed. The media followed us as if we were a royal wedding procession, the two of us whizzing through the neon, fast-food-cluttered streets of Carthage to our McMansion on the river. What grace Amy has, what moxie. A storybook princess. And I, of course, was the lickspittle hunchback of a husband who would bow and scrape the rest of my days. Until she was arrested. If she ever got arrested.
That she was released at all was a concern. More than a concern, an utter shock. I saw them all filing out of the conference room where they questioned her for four hours and then let her go: two FBI guys with alarmingly short hair and blank faces; Gilpin, looking like he???d swallowed the greatest steak dinner of his life; and Boney, the only one with thin, tight lips and a little V of a frown. She glanced at me as she walked past, arched an eyebrow, and was gone.
Then, too quickly, Amy and I were back in our home, alone in the living room, Bleecker watching us with shiny eyes. Outside our curtains, the lights of the TV cameras remained, bathing our living room in a bizarrely lush orange glow. We looked candlelit, romantic. Amy was absolutely beautiful. I hated her. I was afraid of her.
???We can???t really sleep in the same house?????? I began.
???I want to stay here with you.??? She took my hand. ???I want to be with my husband. I want to give you the chance to be the kind of husband you want to be. I forgive you.???
???You forgive me? Amy, why did you come back? Because of what I said in the interviews? The videos????
???Wasn???t that what you wanted???? she said. ???Wasn???t that the point of the videos? They were perfect ??? they reminded me of what we used to have, how special it was.???
???What I said, that was just me saying what you wanted to hear.???
???I know ??? that???s how well you know me!??? Amy said. She beamed. Bleecker began figure-eighting between her legs. She picked him up and stroked him. His purr was deafening. ???Think about it, Nick, we know each other. Better than anyone in the world now.???
It was true that I???d had this feeling too, in the past month, when I wasn???t wishing Amy harm. It would come to me at strange moments ??? in the middle of the night, up to take a piss, or in the morning pouring a bowl of cereal ??? I???d detect a nib of admiration, and more than that, fondness for my wife, right in the middle of me, right in the gut. To know exactly what I wanted to hear in those notes, to woo me back to her, even to predict all my wrong moves ??? the woman knew me cold. Better than anyone in the world, she knew me. All this time I???d thought we were strangers, and it turned out we knew each other intuitively, in our bones, in our blood.
It was kind of romantic. Catastrophically romantic.
???We can???t just pick up where we were, Amy.???
???No, not where we were,??? she said. ???Where we are now. Where you love me and you???ll never do wrong again.???
???You???re crazy, you???re literally crazy if you think I???m going to stay. You killed a man,??? I said. I turned my back to her, and then I pictured her with a knife in her hand and her mouth growing tight as I disobeyed her. I turned back around. Yes, my wife must always be faced.
???To escape him.???
???You killed Desi so you had a new story, so you could come back and be beloved Amy and not ever have to take the blame for what you did. Don???t you get it, Amy, the irony? It???s what you always hated about me ??? that I never dealt with the consequences of my actions, right? Well, my ass has been well and duly consequenced. So what about you? You murdered a man, a man I assume loved you and was helping you, and now you want me to step in his place and love you and help you, and ??? I can???t. I cannot do it. I won???t do it.???
???Nick, I think you???ve gotten some bad information,??? she said. ???It doesn???t surprise me, all the rumors that are going about. But we need to forget all that. If we are to go forward. And we will go forward. All of America wants us to go forward. It???s the story the world needs right now. Us. Desi???s the bad guy. No one wants two bad guys. They want to like you, Nick. The only way you can be loved again is to stay with me. It???s the only way.???
???Tell me what happened, Amy. Was Desi helping you all along????
She flared at that: She didn???t need a man???s help, even though she clearly had needed a man???s help. ???Of course not!??? she snapped.
???Tell me. What can it hurt, tell me everything, because you and I can???t go forward with this pretend story. I???ll fight you every step of the way. I know you???ve thought of everything. I???m not trying to get you to slip up ??? I???m tired of trying to outthink you, I don???t have it in me. I just want to know what happened. I was a step away from death row, Amy. You came back and saved me, and I thank you for that ??? do you hear me? I thank you, so don???t say I didn???t later on. I thank you. But I need to know. You know I need to know.???
???Take off your clothes,??? she said.
She wanted to make sure I wasn???t wearing a wire. I undressed in front of her, removed every stitch, and then she surveyed me, ran a hand across my chin and my chest, down my back. She palmed my ass and slipped her hand between my legs, cupped my testicles and gripped my limp cock, held it in her hand for a moment to see if anything happened. Nothing happened.
???You???re clean,??? she said. It was meant as a joke, a wisecrack, a movie reference we???d both laugh at. When I said nothing, she stepped back and said, ???I always did like looking at you naked. That made me happy.???
???Nothing made you happy. Can I put my clothes back on????
???No. I don???t want to worry about hidden wires in the cuffs or the hems. Also, we need to go in the bathroom and run the water. In case you bugged the house.???
???You???ve seen too many movies,??? I said.
???Ha! Never thought I???d hear you say that.???
We stood in the bathtub and turned on the shower. The water sprayed my naked back and misted the front of Amy???s shirt until she peeled it off. She pulled off all her clothes, a gleeful striptease, and tossed them over the shower stall in the same grinning, game manner she had when we first met ??? I???m up for anything! ??? and she turned to me, and I waited for her to swing her hair around her shoulders like she did when she flirted with me, but her hair was too short.
???Now we???re even,??? she said. ???Seemed rude to be the only one clothed.???
???I think we???re past etiquette, Amy.???
Look only at her eyes, do not touch her, do not let her touch you.
She moved toward me, put a hand on my chest, let the water trickle between her breasts. She licked a shower teardrop off her upper lip and smiled. Amy hated shower spray. She didn???t like getting her face wet, didn???t like the feel of water pelleting her flesh. I knew this because I was married to her, and I???d pawed her and harassed her many times in the shower, always to be turned down. (I know it seems sexy, Nick, but it???s actually not, it???s something people only do in movies.) Now she was pretending just the opposite, as if she forgot that I knew her. I backed away.
???Tell me everything, Amy. But first: Was there ever a baby????
The baby was a lie. It was the most desolate part for me. My wife as a murderer was frightening, repulsive, but the baby as a lie was almost impossible to bear. The baby was a lie, the fear of blood was a lie ??? during the past year, my wife had been mostly a lie.
???How did you set Desi up???? I asked.
???I found some twine in one corner of his basement. I used a steak knife to saw it into four pieces??????
???He let you keep a knife????
???We were friends. You forget.???
She was right. I was thinking of the story she???d told the police: that Desi had held her captive. I did forget. She was that good a storyteller.
???Whenever Desi wasn???t around, I???d tie the pieces as tight as I could around my wrists and ankles so they???d leave these grooves.???
She showed me the lurid lines on her wrists, like bracelets.
???I took a wine bottle, and I abused myself with it every day, so the inside of my vagina looked ??? right. Right for a rape victim. Then today I let him have sex with me so I had his semen, and then I slipped some sleeping pills into his martini.???
???He let you keep sleeping pills????
She sighed: I wasn???t keeping up.
???Right, you were friends.???
???Then I?????? She pantomimed slicing his jugular.
???That easy, huh????
???You just have to decide to do it and then do it,??? she said. ???Discipline. Follow through. Like anything. You never understood that.???
I could feel her mood turning stony. I wasn???t appreciating her enough.
???Tell me more,??? I said. ???Tell me how you did it.???
An hour in, the water went cold, and Amy called an end to our discussion.
???You have to admit, it???s pretty brilliant,??? she said.
I stared at her.
???I mean, you have to admire it just a little,??? she prompted.
???How long did it take for Desi to bleed to death????
???It???s time for bed,??? she said. ???But we can talk more tomorrow if you want. Right now we should sleep. Together. I think it???s important. For closure. Actually, the opposite of closure.???
???Amy, I???m going to stay tonight because I don???t want to deal with all the questions if I don???t stay. But I???ll sleep downstairs.???
She cocked her head to one side, studied me.
???Nick, I can still do very bad things to you, remember that.???
???Ha! Worse than what you???ve already done????
She looked surprised. ???Oh, definitely.???
???I doubt that, Amy.???
I began walking out the door.
???Attempted murder,??? she said.
I paused.
???That was my original plan early on: I???d be a poor, sick wife with repeated episodes, sudden intense bouts of illness, and then it turns out that all those cocktails her husband prepared her ??????
???Like in the diary.???
???But I decided attempted murder wasn???t good enough for you. It had to be bigger than that. Still, I couldn???t get the poisoning idea out of my head. I liked the idea of you working up to the murder. Trying the cowardly way first. So I went through with it.???
???You expect me to believe that????
???All that vomit, so shocking. An innocent, frightened wife might have saved some of that vomit, just in case. You can???t blame her, being a little paranoid.??? She gave a satisfied smile. ???Always have a backup plan to the backup plan.???
???You actually poisoned yourself.???
???Nick, please, you???re shocked? I killed myself.???
???I need a drink,??? I said. I left before she could speak.
I poured myself a Scotch and sat on the living room couch. Beyond the curtains, the strobes of the cameras were lighting up the yard. Soon it would no longer be night. I???d come to find the morning depressing, to know it would come again and again.
Tanner picked up on the first ring.
???She killed him,??? I said. ???She killed Desi because he was basically ??? he was annoying her, he was power-playing her, and she realized she could kill him, and it was her way back to her old life, and she could blame everything on him. She murdered him, Tanner, she just told me this. She confessed.???
???I don???t suppose you were able to ??? record any of it somehow? Cell phone or something????
???We were naked with the shower running, and she whispered everything.???
???I don???t even want to ask,??? he said. ???You two are the most fucked-up people I have ever met, and I specialize in fucked-up people.???
???What???s going on with the police????
He sighed. ???She foolproofed everything. It???s ludicrous, her story, but no more ludicrous than our story. Amy???s basically exploiting the sociopath???s most reliable maxim.???
???What???s that????
???The bigger the lie, the more they believe it.???
???Come on, Tanner, there???s got to be something.???
I paced over to the staircase to make sure Amy was nowhere nearby. We were whispering, but still. I had to be careful now.
???For now we need to toe the line, Nick. She left you looking fairly bad: Everything in the diary was true, she says. All the stuff in the woodshed was you. You bought the stuff with those credit cards, and you???re too embarrassed to admit it. She???s just a sheltered little rich girl, what would she know about acquiring secret credit cards in her husband???s name? And my goodness, that pornography!???
???She told me there was never a baby, she faked it with Noelle Hawthorne???s pee.???
???Why didn???t you say???That???s huge! We???ll lean on Noelle Hawthorne.???
???Noelle didn???t know.???
I heard a deep sigh on the other end. He didn???t even bother asking how. ???We???ll keep thinking, we???ll keep looking,??? he said. ???Something will break.???
???I can???t stay in this house with that thing. She???s threatening me with??????
???Attempted murder ??? the antifreeze. Yeah, I heard that was in the mix.???
???They can???t arrest me on that, can they? She says she still has some vomit. Evidence. But can they really??????
???Let???s not push it for now, okay, Nick???? he said. ???For now, play nice. I hate to say it, I hate to, but that???s my best legal advice for you right now: Play nice.???
???Play nice? That???s your advice? My one-man legal dream team: Play nice? Fuck you.???
I hung up in full fury.
I???ll kill her, I thought. I will fucking kill the bitch.
I plunged into the dark daydream I???d indulged over the past few years when Amy had made me feel my smallest: I daydreamed of hitting her with a hammer, smashing her head in until she stopped talking, finally, stopped with the words she suctioned to me: average, boring, mediocre, unsurprising, unsatisfying, unimpressive. Un, basically. In my mind, I whaled on her with the hammer until she was like a broken toy, muttering un, un, un until she sputtered to a stop. And then it wasn???t enough, so I restored her to perfection and began killing her again: I wrapped my fingers around her neck ??? she always did crave intimacy ??? and then I squeezed and squeezed, her pulse???
???Nick????
I turned around, and Amy was on the bottom stair in her nightgown, her head tilted to one side.
???Play nice, Nick.???')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (19, 3, 4, N'Amy Elliott Dunne The Night Of The Return', 1, N'He turns around, and when he sees me standing there, he looks scared. That???s something useful. Because I???m not going to let him go. He may think he was lying when he said all those nice things to lure me home. But I know different. I know Nick can???t lie like that. I know that as he recited those words, he realized the truth. Ping! Because you can???t be as in love as we were and not have it invade your bone marrow. Our kind of love can go into remission, but it???s always waiting to return. Like the world???s sweetest cancer.
You don???t buy it? Then how about this? He did lie. He didn???t mean a fucking thing he said. Well, then, screw him, he did too good a job, because I want him, exactly like that. The man he was pretending to be ??? women love that guy. I love that guy. That???s the man I want for my husband. That???s the man I signed up for. That???s the man I deserve.
So he can choose to truly love me the way he once did, or I will bring him to heel and make him be the man I married. I???m sick of dealing with his bullshit.
???Play nice,??? I say.
He looks like a child, a furious child. He bunches his fists.
???No, Amy.???
???I can ruin you, Nick.???
???You already did, Amy.??? I see the rage flash over him, a shiver. ???Why in God???s name do you even want to be with me? I???m boring, average, uninteresting, uninspiring. I???m not up to par. You spent the last few years telling me this.???
???Only because you stopped trying,??? I say. ???You were so perfect, with me. We were so perfect when we started, and then you stopped trying. Why would you do that????
???I stopped loving you.???
???Why????
???You stopped loving me. We???re a sick, fucking toxic M??bius strip, Amy. We weren???t ourselves when we fell in love, and when we became ourselves ??? surprise! ??? we were poison. We complete each other in the nastiest, ugliest possible way. You don???t really love me, Amy. You don???t even like me. Divorce me. Divorce me, and let???s try to be happy.???
???I won???t divorce you, Nick. I won???t. And I swear to you, if you try to leave, I will devote my life to making your life as awful as I can. And you know I can make it awful.???
He begins pacing like a caged bear. ???Think about it, Amy, how bad we are for each other: the two most needful human beings in the world stuck with each other. I???ll divorce you if you don???t divorce me.???
???Really????
???I will divorce you. But you should divorce me. Because I know what you???re thinking already, Amy. You???re thinking it won???t make a good story: Amazing Amy finally kills her crazed-rapist captor and returns home to ??? a boring old divorce. You???re thinking it???s not triumphant.???
It???s not triumphant.
???But think of it this way: Your story is not some drippy, earnest survivor story. TV movie circa 1992. It???s not. You are a tough, vibrant, independent woman, Amy. You killed your kidnapper, and then you kept on cleaning house: You got rid of your idiot cheat of a husband. Women would cheer you. You???re not a scared little girl. You???re a badass, take-no-prisoners woman. Think about it. You know I???m right: The era of forgiveness is over. It???s pass??. Think of all the women ??? the politicians??? wives, the actresses ??? every woman in the public who???s been cheated on, they don???t stay with the cheat these days. It???s not stand by your man anymore, it???s divorce the fucker.???
I feel a rush of hate toward him, that he???s still trying to wriggle out of our marriage even though I???ve told him ??? three times now ??? that he can???t. He still thinks he has power.
???And if I don???t divorce you, you???ll divorce me???? I ask.
???I don???t want to be married to a woman like you. I want to be married to a normal person.???
Piece of shit.
???I see. You want to revert to your lame, limp loser self? You want to just walk away? No! You don???t get to go be some boring-ass middle American with some boring-ass girl next door. You tried it already ??? remember, baby? Even if you wanted to, you couldn???t do that now. You???ll be known as the philandering asshole who left his kidnapped, raped wife. You think any nice woman will touch you? You???ll only get??????
???Psychos? Crazy psycho bitches???? He???s pointing at me, jabbing the air.
???Don???t call me that.???
???Psycho bitch????
It???d be so easy, for him to write me off that way. He???d love that, to be able to dismiss me so simply.
???Everything I do, I do for a reason, Nick,??? I say. ???Everything I do takes planning and precision and discipline.???
???You are a petty, selfish, manipulative, disciplined psycho bitch??????
???You are a man,??? I say. ???You are an average, lazy, boring, cowardly, woman-fearing man. Without me, that???s what you would have kept on being, ad nauseum. But I made you into something. You were the best man you???ve ever been with me. And you know it. The only time in your life you???ve ever liked yourself was pretending to be someone I might like. Without me? You???re just your dad.???
???Don???t say that, Amy.??? He balls up his fists.
???You think he wasn???t hurt by a woman, too, just like you???? I say it in my most patronizing voice, as if I???m talking to a puppy. ???You think he didn???t believe he deserved better than he got, just like you? You really think your mom was his first choice? Why do you think he hated you all so much????
He moves toward me. ???Shut up, Amy.???
???Think, Nick, you know I???m right: Even if you found a nice, regular girl, you???d be thinking of me every day. Tell me you wouldn???t.???
???I wouldn???t.???
???How quickly did you forget little Able Andie once you thought I loved you again???? I say it in my poor-baby voice. I even stick out my lower lip. ???One love note, sweetie? Did one love note do it? Two? Two notes with me swearing I loved you and I wanted you back, and I thought you were just great after all ??? was that it for you? You are WITTY, you are WARM, you are BRILLIANT. You???re so pathetic. You think you can ever be a normal man again? You???ll find a nice girl, and you???ll still think of me, and you???ll be so completely dissatisfied, trapped in your boring, normal life with your regular wife and your two average kids. You???ll think of me and then you???ll look at your wife, and you???ll think: Dumb bitch.???
???Shut up, Amy. I mean it.???
???Just like your dad. We???re all bitches in the end, aren???t we, Nick? Dumb bitch, psycho bitch.???
He grabs me by the arm and shakes me hard.
???I???m the bitch who makes you better, Nick.???
He stops talking then. He is using all his energy to keep his hands at his side. His eyes are wet with tears. He is shaking.
???I???m the bitch who makes you a man.???
Then his hands are on my neck.')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (20, 3, 5, N'NICK DUNNE THE NIGHT OF THE RETURN', 1, N'Her pulse was finally throbbing beneath my fingers, the way I???d imagined. I pressed tighter and brought her to the ground. She made wet clucking noises and scratched at my wrists. We were both kneeling, in face-to-face prayer for ten seconds.
You fucking crazy bitch.
A tear fell from my chin and hit the floor.
You murdering, mind-fucking, evil, crazy bitch.
Amy???s bright blue eyes were staring into mine, unblinking.
And then the strangest thought of all clattered drunkenly from the back of my brain to the front and blinded me: If I kill Amy, who will I be?
I saw a bright white flash. I dropped my wife as if she were burning iron.
She sat hard on the ground, gasped, coughed. When her breath came back, it was in jagged rasps, with a strange, almost erotic squeak at the end.
Who will I be then? The question wasn???t recriminatory. It wasn???t like the answer was the pious: Then you???ll be a killer, Nick. You???ll be as bad as Amy. You???ll be what everyone thought you were. No. The question was frighteningly soulful and literal: Who would I be without Amy to react to? Because she was right: As a man, I had been my most impressive when I loved her ??? and I was my next best self when I hated her. I had known Amy only seven years, but I couldn???t go back to life without her. Because she was right: I couldn???t return to an average life. I???d known it before she???d said a word. I???d already pictured myself with a regular woman ??? a sweet, normal girl next door ??? and I???d already pictured telling this regular woman the story of Amy, the lengths she had gone to ??? to punish me and to return to me. I already pictured this sweet and mediocre girl saying something uninteresting like Oh, nooooo, oh my God, and I already knew part of me would be looking at her and thinking: You???ve never murdered for me. You???ve never framed me. You wouldn???t even know how to begin to do what Amy did. You could never possibly care that much. The indulged mama???s boy in me wouldn???t be able to find peace with this normal woman, and pretty soon she wouldn???t just be normal, she???d be substandard, and then my father???s voice ??? dumb bitch ??? would rise up and take it from there.
Amy was exactly right.
So maybe there was no good end for me.
Amy was toxic, yet I couldn???t imagine a world without her entirely. Who would I be with Amy just gone? There were no options that interested me anymore. But she had to be brought to heel. Amy in prison, that was a good ending for her. Tucked away in a box where she couldn???t inflict herself on me but where I could visit her from time to time. Or at least imagine her. A pulse, my pulse, left out there somewhere.
It had to be me who put her there. It was my responsibility. Just as Amy took the credit for making me my best self, I had to take the blame for bringing the madness to bloom in Amy. There were a million men who would have loved, honored, and obeyed Amy and considered themselves lucky to do so. Confident, self-assured, real men who wouldn???t have forced her to pretend to be anything but her own perfect, rigid, demanding, brilliant, creative, fascinating, rapacious, megalomaniac self.
Men capable of being uxorious.
Men capable of keeping her sane.
Amy???s story could have gone a million other ways, but she met me, and bad things happened. So it was up to me to stop her.
Not kill her but stop her.
Put her in one of her boxes.')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (21, 4, 1, N'M???t tr?? nh???', 0, N'12/10/2022, L???c desu.')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (22, 4, 2, N'Nh???t k?? 2020', 0, N'???? l?? m???t cu???n nh???t k?? nh??u n??t v?? b??m ?????y b???i.')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (26, 4, 3, N'Nandayo', 1, N'Men always say that as the defining compliment, don???t they? She???s a cool girl. Being the Cool Girl means I am a hot, brilliant, funny woman who adores football, poker, dirty jokes, and burping, who plays video games, drinks cheap beer, loves threesomes and anal sex, and jams hot dogs and hamburgers into her mouth like she???s hosting the world???s biggest culinary gang bang while somehow maintaining a size 2, because Cool Girls are above all hot. Hot and understanding. Cool Girls never get angry; they only smile in a chagrined, loving manner and let their men do whatever they want. Go ahead, shit on me, I don???t mind, I???m the Cool Girl.

Men actually think this girl exists. Maybe they???re fooled because so many women are willing to pretend to be this girl. For a long time Cool Girl offended me. I used to see men ??? friends, coworkers, strangers ??? giddy over these awful pretender women, and I???d want to sit these men down and calmly say: You are not dating a woman, you are dating a woman who has watched too many movies written by socially awkward men who???d like to believe that this kind of woman exists and might kiss them. I???d want to grab the poor guy by his lapels or messenger bag and say: The bitch doesn???t really love chili dogs that much ??? no one loves chili dogs that much! And the Cool Girls are even more pathetic: They???re not even pretending to be the woman they want to be, they???re pretending to be the woman a man wants them to be. Oh, and if you???re not a Cool Girl, I beg you not to believe that your man doesn???t want the Cool Girl. It may be a slightly different version ??? maybe he???s a vegetarian, so Cool Girl loves seitan and is great with dogs; or maybe he???s a hipster artist, so Cool Girl is a tattooed, bespectacled nerd who loves comics. There are variations to the window dressing, but believe me, he wants Cool Girl, who is basically the girl who likes every fucking thing he likes and doesn???t ever complain. (How do you know you???re not Cool Girl? Because he says things like: ???I like strong women.??? If he says that to you, he will at some point fuck someone else. Because ???I like strong women??? is code for ???I hate strong women.???
Men always say that as the defining compliment, don???t they? She???s a cool girl. Being the Cool Girl means I am a hot, brilliant, funny woman who adores football, poker, dirty jokes, and burping, who plays video games, drinks cheap beer, loves threesomes and anal sex, and jams hot dogs and hamburgers into her mouth like she???s hosting the world???s biggest culinary gang bang while somehow maintaining a size 2, because Cool Girls are above all hot. Hot and understanding. Cool Girls never get angry; they only smile in a chagrined, loving manner and let their men do whatever they want. Go ahead, shit on me, I don???t mind, I???m the Cool Girl.

Men actually think this girl exists. Maybe they???re fooled because so many women are willing to pretend to be this girl. For a long time Cool Girl offended me. I used to see men ??? friends, coworkers, strangers ??? giddy over these awful pretender women, and I???d want to sit these men down and calmly say: You are not dating a woman, you are dating a woman who has watched too many movies written by socially awkward men who???d like to believe that this kind of woman exists and might kiss them. I???d want to grab the poor guy by his lapels or messenger bag and say: The bitch doesn???t really love chili dogs that much ??? no one loves chili dogs that much! And the Cool Girls are even more pathetic: They???re not even pretending to be the woman they want to be, they???re pretending to be the woman a man wants them to be. Oh, and if you???re not a Cool Girl, I beg you not to believe that your man doesn???t want the Cool Girl. It may be a slightly different version ??? maybe he???s a vegetarian, so Cool Girl loves seitan and is great with dogs; or maybe he???s a hipster artist, so Cool Girl is a tattooed, bespectacled nerd who loves comics. There are variations to the window dressing, but believe me, he wants Cool Girl, who is basically the girl who likes every fucking thing he likes and doesn???t ever complain. (How do you know you???re not Cool Girl? Because he says things like: ???I like strong women.??? If he says that to you, he will at some point fuck someone else. Because ???I like strong women??? is code for ???I hate strong women.???
Men always say that as the defining compliment, don???t they? She???s a cool girl. Being the Cool Girl means I am a hot, brilliant, funny woman who adores football, poker, dirty jokes, and burping, who plays video games, drinks cheap beer, loves threesomes and anal sex, and jams hot dogs and hamburgers into her mouth like she???s hosting the world???s biggest culinary gang bang while somehow maintaining a size 2, because Cool Girls are above all hot. Hot and understanding. Cool Girls never get angry; they only smile in a chagrined, loving manner and let their men do whatever they want. Go ahead, shit on me, I don???t mind, I???m the Cool Girl.

Men actually think this girl exists. Maybe they???re fooled because so many women are willing to pretend to be this girl. For a long time Cool Girl offended me. I used to see men ??? friends, coworkers, strangers ??? giddy over these awful pretender women, and I???d want to sit these men down and calmly say: You are not dating a woman, you are dating a woman who has watched too many movies written by socially awkward men who???d like to believe that this kind of woman exists and might kiss them. I???d want to grab the poor guy by his lapels or messenger bag and say: The bitch doesn???t really love chili dogs that much ??? no one loves chili dogs that much! And the Cool Girls are even more pathetic: They???re not even pretending to be the woman they want to be, they???re pretending to be the woman a man wants them to be. Oh, and if you???re not a Cool Girl, I beg you not to believe that your man doesn???t want the Cool Girl. It may be a slightly different version ??? maybe he???s a vegetarian, so Cool Girl loves seitan and is great with dogs; or maybe he???s a hipster artist, so Cool Girl is a tattooed, bespectacled nerd who loves comics. There are variations to the window dressing, but believe me, he wants Cool Girl, who is basically the girl who likes every fucking thing he likes and doesn???t ever complain. (How do you know you???re not Cool Girl? Because he says things like: ???I like strong women.??? If he says that to you, he will at some point fuck someone else. Because ???I like strong women??? is code for ???I hate strong women.???

Men always say that as the defining compliment, don???t they? She???s a cool girl. Being the Cool Girl means I am a hot, brilliant, funny woman who adores football, poker, dirty jokes, and burping, who plays video games, drinks cheap beer, loves threesomes and anal sex, and jams hot dogs and hamburgers into her mouth like she???s hosting the world???s biggest culinary gang bang while somehow maintaining a size 2, because Cool Girls are above all hot. Hot and understanding. Cool Girls never get angry; they only smile in a chagrined, loving manner and let their men do whatever they want. Go ahead, shit on me, I don???t mind, I???m the Cool Girl.

Men actually think this girl exists. Maybe they???re fooled because so many women are willing to pretend to be this girl. For a long time Cool Girl offended me. I used to see men ??? friends, coworkers, strangers ??? giddy over these awful pretender women, and I???d want to sit these men down and calmly say: You are not dating a woman, you are dating a woman who has watched too many movies written by socially awkward men who???d like to believe that this kind of woman exists and might kiss them. I???d want to grab the poor guy by his lapels or messenger bag and say: The bitch doesn???t really love chili dogs that much ??? no one loves chili dogs that much! And the Cool Girls are even more pathetic: They???re not even pretending to be the woman they want to be, they???re pretending to be the woman a man wants them to be. Oh, and if you???re not a Cool Girl, I beg you not to believe that your man doesn???t want the Cool Girl. It may be a slightly different version ??? maybe he???s a vegetarian, so Cool Girl loves seitan and is great with dogs; or maybe he???s a hipster artist, so Cool Girl is a tattooed, bespectacled nerd who loves comics. There are variations to the window dressing, but believe me, he wants Cool Girl, who is basically the girl who likes every fucking thing he likes and doesn???t ever complain. (How do you know you???re not Cool Girl? Because he says things like: ???I like strong women.??? If he says that to you, he will at some point fuck someone else. Because ???I like strong women??? is code for ???I hate strong women.???')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (27, 16, 1, N'M??? ?????u', 1, N'M??i xanh ng??i ?????, c???t nh?? ch???m tr???. Cung ??i???n Ma t???c nguy nga l???ng l???y, kh???p n??i trang ho??ng t???ng m??n ????? tinh x???o, ch???n b???a m???t m??n c??ng l?? b???o v???t c?? gi?? tr??? li??n th??nh. Minh ch??u ???????c d??ng l??m ????n, ng???c ph?????ng ho??ng th?? ????c th??nh b??n, th??? qu?? hi???m nh?? l??ng chim T?????c Ti??n l???i b??? c???m trong b??nh ????? trang tr??, da y??u th?? B???ch h??? b??? tr???i d??i tr???? ?????t m???c ng?????i ?????p l??n.

V??ng ng???c l??a m???t, xa x??? ?????n c??ng c???c, b???t k??? ng?????i n??o nh??n th???y c??ng ph???i ?????m ng???c d???m ch??n, ti???c h???n than th??? m???t c??u ph?? c???a tr???i.

Nh??ng trong m???t v??? Ma v????ng vang danh Tam gi???i th?? nh???ng th??? n??y ch???ng qua ch??? l?? ????? t???m th?????ng.

M?? b???t k??? m??n b???o b???i n??o trong cung ??i???n n??y, v??? ?????p ?????u kh??ng s??nh b???ng m???t ph???n tri???u m??? nh??n ??ang n???m tr???? th??p kia.

Thanh ni??n l?????i bi???ng ch???ng m??, d???a v??o th??p m???m, m??i t??c t??n lo???n tr?????c sau nh?? v???y m???c, ng?????i kho??c l???p ??o ?????. M??i nh?? ???????c thoa m???t ????? th???m c???a h???i ???????ng m??a xu??n, nom m???m m???i nh?? hoa m??a h???, s??ng m???t t???a l??n thu th???y, da tr???ng th???ng tuy???t ????ng. Ngay ??u??i m???t l???i ??i???m th??m n???t ru???i son nho nh??? ?????y duy??n d??ng.

Ng??n tay thon d??i ch??i ????a ????n l??u ly ??ang t???a ??nh s??ng r???c r???, nh???t th???i l??m ng?????i ta kh??ng bi???t c??i n??o ch??i m???t h??n. ????n l??u ly kia ngh??n v???n c??ng kh?? m?? c?? ???????c, nh??ng r??i v??o tay thanh ni??n th?? c??ng ch??? l?? m??n ????? ch??i gi???i tr??.

Dung D??? h??p m???t, tr??ng nh?? ??ang c?????i, nh??ng tr???? m??i l???i kh??ng c?? ?? c?????i, l??m ng?????i ta ch???ng ph??n bi???t ???????c.

Ph??a d?????i l???a l?? nh??? bay, ??m nh???c tr???y l???c. ??? gi???a l?? m???t thi???u ni??n ??ang m??a, ??nh m???t quy???n r?? nh?? t??, h???t nh?? m???t b???o v???t tr???i ban.

Ti???t Lan Ch??u v???a m??a, trong ?????u l???i ??ang h???i h??? th???ng: H??? th???ng, b??y gi??? ????? h???o c???m c???a Dung D??? ?????i v???i t??i l?? bao nhi??u?

H??? th???ng: Th??a k?? ch???, l??... -100.

Ti???t Lan Ch??u: Ch???m h???i?

C?? l???m kh??ng v???y? ????y l?? l???n ?????u h???n xu???t hi???n tr?????c m???t Dung D??? ?????y, c??i k??? n??ng "Nh???t v?? khuynh th??nh" n??y d?? kh??ng th??? ki???m ??i???m h???o c???m nh??ng c??ng kh??ng ?????n m???c l??m ng?????i ta gh??t ?????n th??? ch????

Ti???t Lan Ch??u v?? c??ng s??? h??i: V???y h???n c??? nh??n t??i ch???m ch???m n??y gi???, l?? kh??ng ph???i th???y h???ng th?? v???i t??i m?? l?? mu???n gi???t t??i ???? h????

H??? th???ng: ????ng v???y.

Ti???t Lan Ch??u g??o th??t: Chuy???n n??y kh??ng khoa h???c!

Ti???t Lan Ch??u l?? m???t th???n s???.

Mu??n v??n th??? gi???i n??y, m???i m???t th??? gi???i ?????u c?? m???t ng?????i nh???n h???t may m???n c???a ?????t tr???i, g???i t???t l?? nh??n v???t ch??nh. Cu???c ?????i c???a nh??n v???t ch??nh ???? ???????c s???p ?????t s???n, gi??p th??? gi???i v???n h??nh, sau khi s???ng h???t m???t ?????i m???i sinh ra m???t nh??n v???t ch??nh kh??c. M???t khi nh??n v???t ch??nh ph???m ph???i sai l???m, th?? s??? l??m cho c??? th??? gi???i s???p ?????.

V?? duy tr?? c??c th??? gi???i nh???, v??? Ch??? th???n tr??ng coi h??ng v???n th??? gi???i l???p ra c???c Qu???n L?? Th???i Kh??ng, r??t c??c linh h???n ???? ch???t ??? c??c th??? gi???i cho h??? tr??? th??nh th???n s???, r??ng bu???c v???i h??? th???ng ch??? th???n, ??i tu s???a c??c tuy???n th??? gi???i x???y ra v???n ?????.

Dung D??? ch??nh l?? ng?????i nh???n h???t may m???n trong th??? gi???i 6666. Theo l?? m?? n??i th?? h???n v???n l?? nam ch??nh th??? gi???i n??y, trong cu???c ?????i c???a h???n c??ng ???? ???????c s???p ?????t s???n m???t t??nh y??u ????ch th???c.

Nh??ng kh??ng bi???t ch??? n??o c?? v???n ?????, Dung D??? l???i kh??ng c?? m???t ch??t t??nh c???m ?????i v???i v??? c??ng ch??a Thi??n t???c, kh??ng ch???u c??ng n??ng tu th??nh ch??nh qu???.

Tuy???n t??nh c???m c???a ?????a con s??? m???nh l?? m???t trong nh???ng tuy???n quan tr???ng c???a v???n m???nh, t??nh c???m kh??ng di???n ra theo k???ch b???n m?? v???n m???nh s???p ?????t th?? th??? gi???i 6666 n??y r???t c?? th??? s??? b??? s???p ?????.

V?? b???o v??? th??? gi???i 6666, c???c Qu???n L?? Th???i Kh??ng ???? ph??i r???t nhi???u th???n s??? ?????n gi???i quy???t v???n ????? n??y. ?????u ti??n l?? B??? Mai M???i ph??i ng?????i ?????n l??m mai cho Dung D??? v?? c??ng ch??a Thi??n t???c, sau c??ng l??m c??ng h???ng, c???c Qu???n L?? Th???i Kh??ng m???i ?????i bi???n ph??p, l???y l??i l??m ti???n, ????? B??? C??ng L?????c ph??i ng?????i ??i c??ng l?????c Dung D???. B???n ?????i l?? ai kh??ng quan tr???ng, d?? sao Dung D??? nh???t ?????nh ph???i c?? m???t t??nh y??u ????ch th???c.

Sau ???? t???t c??? quay v??? trong th???t b???i.

T??? ?????u ch?? cu???i Dung D??? v???n l?? m???t ?????i ma v????ng v?? t??nh. ?????n cu???i c??ng, h???n c??ng ph??t hi???n ???????c m???c ????ch c???a ????m ng?????i ngo??i th??? gi???i n??y.

L??c ?????u Dung D??? c??n ch??a gi???t ng?????i b???a b??i nh?? th???, c??ng v??? sau gi???ng nh?? h???n nh???n ra chuy???n g??, c??? ph??t hi???n b???t k??? ng?????i c??ng l?????c n??o l?? th???ng tay gi???t ch???t. Th???n s??? m?? ch???t trong th??? gi???i nh???, linh h???n s??? l???p t???c b??? ??u???i v??? kh??ng gian ch??? th???n, kh??ng ????? ng?????i kh??c ph??t hi???n b?? m???t c???a mu??n v??n th??? gi???i.

M?? ?????ng th???i t???t c??? ng?????i trong th??? gi???i nh??? ?????u s??? b??? x??a s???ch tr?? nh???, qu??n ??i th??n ph???n m?? th???n s??? s??? d???ng.

Ch??? c?? Dung D??? nh???.

M???i m???t ng?????i h???n ?????u nh???.

Tr?????c Ti???t Lan Ch??u, ???? c?? 107 th???n s??? ???? ch???t trong tay Dung D???.

C???ng th??m Ti???t Lan Ch??u n???a l?? 108 anh h??ng.

Ti???t Lan Ch??u v???a ngh?? ?????n ????y, su??t n???a t?? x???u ngay t???i ch???.

H???n c??ng ???? ho??n th??nh kh?? nhi???u nhi???m v??? th???n s???, l??c nghe c??c ti???n b???i th???t b???i tr??? v??? n??i Dung D??? ????ng s??? ra sao, h???n kh??ng ????? ??, xung phong nh???n nhi???m v??? c?? ????? kh?? c???p SSS n??y.

B??y gi??? h???n r???t mu???n xuy??n v??? t??t ch???t c??i ng?????i kh??ng bi???t tr???i cao ?????t d??y l?? m??nh trong qu?? kh???.

N??y th?? khoe khoang! Cho m??y ch???a c??i t???i khoe khoang!

M???i v??o ????? h???o c???m ???? -100, c??n ch??i c??i g?? n???a!

"M??a ??i!" Gi???ng n??i c???a thanh ni??n y??u d?? l???i hoa l??? nh?? ????n Kh??ng ??u??i ph?????ng*, "Sao kh??ng m??a n???a?"

Ti???t Lan Ch??u run l??n, s??? h??i nh???n ra l??c n??y m??nh th???t th???n, ?????ng t??c c??ng d???ng theo.

C???p m???t ????o hoa xinh ?????p l???ng l???ng nh??n h???n, nh?? ???? bi???t r?? t???t c???.

Ti???t Lan Ch??u kh??ng m??a ???????c n???a, run r???y qu??? m???p xu???ng: "V????ng..."

Dung D??? kh??? m???m c?????i, n??m ????n l??u ly tr???? tay xu???ng, "choang" m???t ti???ng v??? tan t??nh, m???nh v??? s???c b??n v??ng tung t??e kh???p n??i.

Tr???? m???t Ti???t Lan Ch??u b??? m???nh v??? c???t m???t ???????ng m??u.

"M??a!" Gi???ng n??i n??y l???nh v?? c??ng.

Ti???t Lan Ch??u kh??c kh??ng ra n?????c m???t, kh??ng th??? kh??ng nh???m m???t m??a ti???p, hai ch??n gi???m ph???i m???nh v??? l??u ly, b??n ch??n b??? c???t ?????n loang l??? m??u.

M???c d?? h??? th???ng m??? che ?????y c???m gi??c ??au, nh??ng Dung D??? th???t s??? r???t kh???ng b???, h???n kh??ng mu???n ?????i m???t v???i t??n bi???n th??i n??y ????u!!!

V???t v??? l???m m???i m??a xong, Ti???t Lan Ch??u ???? s???m nh??? nh???i m??? h??i l???nh, kh??ng ph???i ??au, ch??? l?? b??? Dung D??? d???a.

"M??a ?????p ?????y." Dung D??? c?????i l??n, v???a d???u d??ng l???i xinh ?????p.

"Th?????ng cho ng????i ???????c ch???t to??n th??y."

- --

"Sau ???? th?? sao?" Tuy??n Di???u t?? m?? h???i.

C?? n??ng gia nh???p c???c Qu???n L?? Th???i Kh??ng kh?? tr???, n??n ????y l?? l???n ?????u nghe chuy???n v??? v??? ?????i ma v????ng n??y.

"Sau ???? h???? ?????i ma v????ng ???? th???c t???nh r???i tr???n ??i, qu???y cho c??c th??? gi???i g?? ch?? kh??ng y??n, c??ng vi???c c???a ch??ng ta b???n r???n nh?? v???y, h??n m???t n???a ?????u do h???n g??y ra." Nh???c t???i Dung D???, Ti???t Lan Ch??u h???ng c??n s??? h??i, d?? sao n??m ???? c??ng ????? l???i ??m ???nh t??m l?? cho h???n, nh??ng sau ???? v??? m???t h???n l???i chuy???n th??nh s??ng k??nh, "Nh??ng m?? Ch??? th???n ?????i nh??n c???a t???i m??nh th???n th??ng qu???ng ?????i, b???t ?????i ma v????ng kia v??? quy ??n..."

Nh??? n??m ???? Dung D??? gi???t li??n ti???p 108 th???n s???, cu???i c??ng ho??n to??n th???c t???nh, tr??i th???n b???o v??? th??? gi???i 6666 l???i, tr???n kh???i th??? gi???i 6666, c??ng t???o th??nh v?? s??? l??? h???ng kh??ng gian. H??ng v???n th??? gi???i b??? ???nh h?????ng, r???t nhi???u th??? gi???i nh??? b??? l???ch tuy???n. L??c ???? c???c Qu???n L?? Th???i Kh??ng ch???t ?????y m???t ?????ng vi???c, t???t c??? m???i ng?????i ai c??ng b???n ?????n t???i t??m m???t m??y.

V?? th??? Ch??? th???n ?????i nh??n ????ch th??n truy b???t, nh??ng Dung D??? ??m hi???m x???o tr??, qu??? k??? ??a ??oan, ch??i tr?? anh ??u???i t??i ch???y su???t m???y tr??m th??? gi???i m???i b??? t??m v??? quy ??n. T???i n??y v???n l?? n??n gi???t, nh??ng ch???ng hi???u sao Ch??? th???n ?????i nh??n l???i r???ng l?????ng cho h???n l???y c??ng chu???c t???i, n??m h???n v??o c??c th??? gi???i BE ????? s???a l???i tuy???n th??? gi???i.

?????a con s??? m???nh may m???n ??? ch??? l??m g?? c??ng thu???n bu???m xu??i gi??, nh??ng c?? m???t s??? th??? gi???i b??? sai s??t, cu???c ?????i c???a ?????a con s??? m???nh v?? c??ng l???n ?????n, c??i g???i l?? ng?????c v??n BE ch??nh l?? s???ng kh??ng y??n ch???t kh??ng ???n. Lo???i th??? gi???i b???t th?????ng n??y, kh??ng k??o d??i ???????c bao l??u, n??n c???n th???n s??? ?????n tu s???a. D?????i t??nh hu???ng ?????a con s??? m???nh kh??ng th??? thay ?????i v???n m???nh bi th???m c???a m??nh, l??c ???? th???n s??? s??? thay th??? h??? v?????t qua c??c kh?? kh??n. Sau khi th??nh c??ng s???a tuy???n th??? gi???i th??nh HE, th???n s??? ??i kh???i, ?????a con v???n m???nh l???i tr??? v???, c?? th??? ti???p t???c s???ng theo tuy???n th??? gi???i m???i, ????? c??c th??? gi???i nh??? kh??ng b??? s???p ?????.

V?? nhi???m v??? s???a tuy???n BE n??y b??nh th?????ng m???i xuy??n qua kh??ng qu?? th?? c??ng h???p h???i, x??c su???t s???p h??? c???c k??? cao, n??n ????y c??ng l?? nhi???m v??? ????? kh?? cao v?? c???c kh??? nh???t c???a c???c Qu???n L?? Th???i Kh??ng. T??? l??? th??nh c??ng h???u nh?? l?? 0 n??n r???t ??t th???n s??? t??nh nguy???n ??i l??m.

Th??n l?? t???i ph???m truy n?? b??? Ch??? th???n b???t v??? quy ??n, ??????ng nhi??n Dung D??? b??? n??m v??o c??i ng??nh n??y l??m cu li, c??n kh??ng ???????c nh???n ti???n l????ng.

T???i ph???m b??? truy n?? kh??ng c?? nh??n quy???n, c??ng kh??ng ???????c nh???n ph??c l???i c???a nh??n vi??n. Th?????ng th?? th???n s??? s??? c?? m???t h??? th???ng ch??? th???n th??ng b??o nhi???m v???, c?? h??? th???ng c???a h??ng cung c???p tr??? gi??p, sau khi ho??n th??nh nhi???m v??? c??n ???????c th?????ng ??i???m ????? ?????i l???y ????? ??n v?? ?????o c???. Nh??ng Dung D??? mang t???i, c??ng ch???ng ph???i th???n s??? trong bi??n ch???, n??n s??? kh??ng c?? h??? th???ng ch??? th???n, kh??ng ???????c g???i tr??? gi??p t??? b??n ngo??i, ho??n th??nh nhi???m v??? c??ng kh??ng c?? ??i???m th?????ng.

Ma l???c c???a Dung D??? r???t m???nh, kh?? m?? qu???n ???????c h???n, Ch??? th???n ?????i nh??n b??n cho th???n kh?? b???n m???nh c???a m??nh l?? X??ch Kim Di???u Nh???t Ho??n h??a th??nh v??ng Huy???t Ng???c, ??eo l??n c??? tay Dung D???, phong ???n l???i s???c m???nh c???a Ma v????ng. M?? ?????ng th???i X??ch Kim Di???u Nh???t Ho??n n??y c??ng nh???n vi???c th??ng b??o nhi???m v???, truy???n t???ng qua c??c th??? gi???i.

M???i ?????a con s??? m???nh ?????u c?? m???t ng???n ????n h???n, ??nh n???n c??ng r???c r???, th??n n???n c??ng d??i th?? ch???ng t??? v???n may c??ng m???nh, tu???i th??? c??ng l??u. ????n h???n c???a ?????a con s??? m???nh ??? c??c th??? gi???i BE ?????u l??? m??? y???u ???t nh?? s???p t???t, sinh m???nh v?? v???n may d???n b??? ch??y h???t. L???c l?????ng c???a Ch??? th???n c?? th??? th??ng qua ????n h???n ????? ?????a con s??? m???nh trao ?????i v???n m???nh v???i Dung D???. ?????a con s??? m???nh ch??n ch??nh t???m th???i ??? trong ????n ngh??? ng??i, c??n Dung D??? ??i thay ?????i v???n m???nh c???a nh???ng ng?????i s???p ch???t n??y. Sau khi ?????i th??nh k???t HE, th?? ng???n ????n h???n s??? ???????c th???p s??ng. N???u kh??ng th??? s???a ???????c k???t BE, ????n h???n t???t, t???c l?? nhi???m v??? th???t b???i.

Ch???t trong th??? gi???i nh??? t???t nhi??n t????ng ??????ng v???i nhi???m v??? th???t b???i, nh??ng tho??t ???????c ki???p ch???t c??ng kh??ng nh???t ?????nh l?? nhi???m v??? th??nh c??ng, ???? c??ng l???m l?? s???ng t???m b???. Mu???n c?? k???t HE ch??n ch??nh th?? ph???i c?? ???????c h???nh ph??c vi??n m??n. C??n cu???i c??ng c?? th???t s??? h???nh ph??c hay kh??ng th?? ph???i tu??? v??o c???m nh???n c???a ?????a con s??? m???nh.

Tuy??n Di???u nghe xong c??ng ng???n t?? te: "Nhi???m v??? n??y kh?? qu?? ??i."

Nhi???m v??? tu s???a c??ng bi???n th??i th???t, c?? ti???n b???i v???a m???i xuy??n ?????n ???? g???p ngay hi???n tr?????ng t??n s??t, ch??a k???p ?????i ?????o c??? ???? b??? l??m th???t. ?????i ma v????ng l???i b??? phong ???n s???c m???nh, c??n kh??ng cho ng?????i ngo??i gi??p, th??? th?? ch??? kh??c g?? ng?????i b??nh th?????ng. Tuy??n Di???u im l???ng t?????ng t?????ng c???nh m??nh g???p ph???i t??nh hu???ng n??y, ch???c ch???n c?? kh??ng s???ng n???i qu?? ba gi??y.

????y ????ng th???t l?? tuy???t ?????a c???u sinh m??. (S???ng s??t trong kh???n c???nh, n??i c???c k??? nguy hi???m.)

"????? ?????i ma v????ng tr???i nghi???m c???m gi??c ch??a ????nh ???? ch???t n??y c??ng t???t ?????y ch???." Ti???t Lan Ch??u nh?? ??ang c?????i tr???? n???i ??au c???a ng?????i kh??c. N??m ???? h???n c??ng v???a m???i xu???t hi???n tr?????c m???t Dung D??? ???? b??? Dung D??? gi???t r???i, qu??? b??o ????u ch???a m???t ai.

"Anh Ti???t, t??i ph???i ??i b??o c??o nhi???m v??? v???i c???p tr????, xin l???i kh??ng n??i chuy???n ti???p v???i anh ???????c." Tuy??n Di???u g???t ?????u ch??o.

"T??i nh??? c?? m???i t??? th??? gi???i 999 v???, th??? gi???i ???? kh??ng ph???i v?? l??? h???ng th???i gian n??n bi???n th??nh m???t th??? r???i ??? Th???n b???o v??? th??? gi???i 999 ???? t??? ??i gi???i quy???t, c??n c???n b??o c??o v???i c???p tr???? l??m g???" Ti???t Lan Ch??u nghi ng???.

B??y gi??? tr???? d?????i c???c Qu???n L?? Th???i Kh??ng ?????u b???n b?? ?????u b?? c???, kh??ng ph???i chuy???n g?? l???n th?? c??ng kh??ng c???n ?????n qu???y r???y.

Tuy??n Di???u r???u r?? n??i: "Th??? gi???i 999 t??? nhi??n xu???t hi???n hai ng?????i ngo??i kh??ng r?? lai l???ch, th???c l???c m???nh ngang hai v??? th???n ?????a ph????ng ?????y."

Ti???t Lan Ch??u l???p t???c bi???t chuy???n n??y quan tr???ng: "V???y c?? mau ??i ??i."

C??i m??a n??y th???t s??? l?? ????? th??? chuy???n.

H???n l???c ?????u ng??n ng???m, sau ???? l???t ?????t ch???y ??i l??m nhi???m v??? ti???p theo.

H???t ch????ng 1.')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (28, 16, 2, N'C?? ch??p v?????t v?? m??n - 1', 1, N'Dung D??? ??ang n???m trong m???t c??i thau l???n, n?????c ch??? ?????n n???a thau, ngay c??? b??i ????ng ho??ng c??ng kh??. M???t ?????t d?? d??y ?????y n?????c, ru???i nh???ng l?????n kh???p n??i. Ph??a ?????i di???n l?? qu???y b??n th???t heo, ng?????i b??n ??ang ch???t th???t, ??m thanh ??i???c tai nh???c ??c. C??n ch??? n??y ch??? s???p ??ang gi???t c??, thu???n th???c b??o v???y c??, t???p d??? v?? ???ng tay ??o b??m ?????y m??i c?? ch???t. C??c ch??? s???p ph??a ????ng ??ang h?? to rao h??ng, c??n ch??? s???p ph??a t??y l???i ??ang tr??? gi?? v???i kh??ch h??ng.

????y l?? m???t khu ch??? b??n ????? ??n.

N??i n??y tr??n ?????y h??i th??? cu???c s???ng, l?? n??i m?? t???t c??? m???i ng?????i m???i ng??y ?????u s??? ??i qua, nh??ng ?????i v???i Dung D??? l???i l?? m???t th??? gi???i ho??n to??n kh??c.

Trong l??c b??? Ch??? th???n ??u???i gi???t, h???n ???? ??i qua th??? gi???i hi???n ?????i, nh??ng l???i ch??a bao gi??? ?????n nh???ng ch??? th??? n??y. Dung D??? t??? t???m b?? ???? s???ng trong nhung l???a, cu???c s???ng ng???p trong v??ng son, d?? c?? b??? m???ng n??i hoang vu th?? h???n v???n ph???i gi??? v??? ?????p ????? tho???i m??i, b???i th??? vi???c cho h???n ??? trong thau c?? th???t s??? l?? mu???n l???y m???ng h???n.

May nh???t ch??nh l?? c?? l??? h???n kh?? ????ng ti???n, n??n Dung D??? m???t m??nh m???t ch???u. Kh??ng gi???ng m???y ch???u c?? kh??c, m???y ch???c con c?? n???m trong m???t c??i thau nh???, v???a nh??n ???? th???y ng???p r???i.

Dung D??? b??? ho??n c???nh t???i t??? n??y x??ng ?????n m???c su??t th?? ng???m t???i ch???: Tao c???n m???t l???i gi???i th??ch.

V??ng Huy???t Ng???c: B??y gi??? anh l?? m???t con c??.

Dung D???: Tao kh??ng b??? ??ui.

H???n d??ng suy ngh?? trao ?????i v???i v??ng Huy???t Ng???c: M???i th??? gi???i ?????u ???? ch??i k?????? th??ch v???y ??? ?????a con s??? m???nh l?? m???t con c?? ch??p ??????

V??ng Huy???t Ng???c: C??n c?? chuy???n k?????? th??ch h??n n??, m???t ti???ng ?????ng h??? sau anh s??? bi???n th??nh c?? ch??p kho t???.

Dung D???: ????? ??c.

V??ng Huy???t Ng???c kh??ng kh???i ti???c nu???i: ??i???m truy???n t???ng l?? ng???u nhi??n, n???u kh??ng t??i ???? t???ng anh v??o n???i r???i.

Dung D??? kh??ng quan t??m gi???ng ??i???u qu??i d??? c???a v??ng Huy???t Ng???c. Quan h??? c???a hai ng?????i h??? l?? t???i ph???m ??ang c???i t???o lao ?????ng v?? gi??m s??t vi??n, ???? ?????nh tr?????c kh??ng th??? giao l??u nh?? th???n s??? v?? h??? th???ng b??nh th?????ng, tr??? th??nh c???ng s??? h???p t??c h??i h??a ??n ??.

Th???c t??? th?? n???u linh h???n kh??ng b??? h???n ch???, Dung D??? ch???c ch???n s??? ?????p tan t??nh c??i v??ng n??y, c??n mu???n nghi???n n??t n?? th??nh b???t ph???n.

Dung D???: B???i c???nh th??? gi???i v?? t?? li???u nh??n v???t ????u?

V??ng Huy???t Ng???c: Kh??ng c??, m???i t??? ??i th??m d??.

Gi???ng Dung D??? l???nh l???o: N??y V??ng nh???, th??? th?? h???t th?? v??? r???i ?????y. Kh??ng cho h??? th???ng c???a h??ng th?? c??n ???????c, ch??? ?????ng n??i ?????n c??? tin t???c c?? b???n m?? c???c Qu???n L?? Th???i Kh??ng c??ng kh??ng cho nh??, nh???ng t??n th???n s??? tr?????c kia ??? ch??? t???i m??y tao hi???u r?? nh?? l??ng b??n tay.

V??ng Huy???t Ng???c: T??i t??n X??ch Kim Di???u Nh???t Ho??n.

Dung D???: Tao kh??ng mu???n nghe m???y l???i nh???m nh??.

V??ng Huy???t Ng???c: ...

T??n c???a n?? kh??ng nh???m x??u n??o h???t! B??y gi??? mi ??ang l?? c?? tr???? th???t ?????y mi to m???m c??i g??!

V??ng Huy???t Ng???c gi???i th??ch: Hi???n t???i nguy??n ch??? ??ang trong tr???ng th??i nh?? c?? ch??p b??nh th?????ng, kh??ng c?? linh kh?? n??n kh??ng th??? ti???p thu tr?? nh???, sau khi anh h??a th??nh ng?????i m???i c?? th??? truy???n k???ch b???n qua.

Th???n s??? c???a c???c Qu???n L?? Th???i Kh??ng s??? kh??ng chi???m th??n th??? c???a b???t k??? ng?????i n??o. C?? th??? m?? b??y gi??? Dung D??? d??ng l?? ???????c v??ng Huy???t Ng???c so s??nh v?? sao ch??p d???a tr???? s??? li???u c?? th??? nguy??n ch???, t???m thay th??? th??n ph???n nguy??n ch???. ?????a con s??? m???nh ch??n ch??nh ??ang ngh??? ng??i trong ????n h???n, ?????n khi ?????t ???????c k???t HE th?? m???i quay l???i.

M???c d?? th??n th??? n??y kh??ng ph???i c???a nguy??n ch???, nh??ng tr???ng th??i gi???ng y chang nguy??n ch???. Nguy??n ch??? b??y gi??? ch??? l?? m???t con c?? ch??p b??nh th?????ng ?????n ch??n c??ng kh??ng c??, n??n Dung D??? c??ng ph???i ?????i m???t v???i t??nh c???nh n??y. Ho??n to??n ?????t m??nh v??o ho??n c???nh s???p ph???i ?????i m???t v???i c??i ch???t c???a nguy??n ch???, m?? kh??ng ph???i tua ng?????c th???i gian ????? c???u v??n t??nh th???, ????y m???i l?? ????? kh?? c???a nhi???m v??? tu s???a.

Dung D??? ???? hi???u: V???y ?? l?? ?????a con s??? m???nh v???n l?? c?? ch??p th??nh tinh, kh??ng bi???t ???? tr???i qua chuy???n bi th???m g?? m?? b??? ????nh tr??? v??? nguy??n h??nh l???i c??n m???t tr?? nh???, b??? kho t??? hay chi??n x?? g?? ?????y n??n BE. B??y gi??? tao ph???i tr??nh ???????c chuy???n m???t ti???ng sau b??? kho, r???i ph???i ngh?? c??ch bi???n l???i th??nh ng?????i, g??? r???i k???ch b???n, l??m th???t c??i k??? ???? khi???n h???n kh??? nh?? v???y.

V??ng Huy???t Ng???c: Ch??nh x??c.

Dung D??? kh??ng ch??t s??? h??i tr??nh b??y: Tao c??n ph??t hi???n m???y chuy???n r???t th?? v???. Th??? nh???t, c??i th??n th??? n??y kh??ng c?? n???i ??an, kh??ng bi???t ???? cho ng?????i kh??c hay b??? c?????p m???t, kh??ng c?? n???i ??an s??? kh??ng th??? th??nh y??u. Th??? hai, th??? gi???i n??y l?? th???i ?????i kh??ng c??n ph??p l???c, linh kh?? m???ng manh, kh??ng th??? tu l???i l???n n???a. Th??? ba, tao kh??ng c?? h??? th???ng c???a h??ng, kh??ng th??? d??ng ?????o c??? c???a Th???n s??? ????? thay ?????i. Cu???i c??ng, ph??p l???c c???a tao ???? b??? m??y phong ???n, kh??ng th??? d??ng. N??i t??m l???i, tao kh??ng th??? bi???n l???i th??nh ng?????i, c??ng kh??ng th??? g??? r???i k???ch b???n, ch??? l?? m???t con c?? ch??p b??nh th?????ng, tao ch??? c?? th??? gi???m l??n v???t xe ????? b??? ng?????i ta ??n.

V??ng Huy???t Ng???c: ????ng l?? nh?? v???y.

Kh??ng h??? l?? ?????i ma v????ng, IQ cao, suy ngh?? m???ch l???c r?? r??ng. Chuy???n n??y m?? c??ng kh??ng ch??t ho???ng h???t, ch???c ???? t??nh h???t c??? r???i...

Dung D???: Hay l???m, th??? gi???i ti???p theo.

V??ng Huy???t Ng???c: Ch???m h???i? . TruyenHD

Dung D???: Nhi???m v??? n??y kh??ng l??m, ai t???i ng?????i ???? ch???t, tr??? phi m??y b??? phong ???n cho tao.

V??ng Huy???t Ng???c t??? ch???i th???ng th???ng: Kh??ng c?? v??? ????.

Dung D??? n???m ngang: V???y ch??? ch???t ??i.

Kh??ng b???t ????? g???t n??n h???, d?? h???n c?? b???n l??nh c??? n??o, m?? b??? k???t trong c??i x??c c???a m???t con c?? th?? l??m ???????c tr?? tr???ng g???

C??n kh??ng ph???i ch??? c?? th??? n???m ngang ch??? ng?????i m???n th???t ??.

V??ng Huy???t Ng???c kh??ch h???n: Kh??ng ph???i ng????i n??i "M???ng ta do ta kh??ng do tr???i" ???

Dung D???: N??y c??ng ch??? ph???i m???ng ta.

N??i ????ng qu?? v??ng Huy???t Ng???c c??i kh??ng l???i.

?????i ma v????ng tuy???t ?????i ch???ng ph???i d??n hi???n l??nh g??, kh??ng ?????i n??o h???n c???m th???y ?????ng c???m v???i s??? ph???n bi th???m c???a ?????a con s??? m???nh.

Th???n s??? ???????c ch???n v??o l??m trong c???c Qu???n L?? Th???i Kh??ng t??nh c??ch tuy kh??c nhau, nh??ng kh??ng th??? thi???u m???t ?????c t??nh quan tr???ng nh???t --- Ch??nh ngh??a.

C?? m?? c??i ?????c t??nh n??y, Dung D??? ch???ng c??.

N???u h???n c??, c??ng s??? kh??ng g??y ra v?? s??? l??? h???ng th???i gian nh?? th???, ch??? m??nh h???n ???? ph?? s???p th??? gi???i 6666 r???i.

V??ng Huy???t Ng???c ??e d???a: Ch??? th???n ?????i nh??n cho anh ??i tu s???a th??? gi???i BE ????? l???y c??ng chu???c t???i, anh kh??ng ho??n th??nh nhi???m v???, l???p t???c x??a s??? linh h???n. Ng???n l???a b???n m???nh c???a Ch??? th???n ?????i nh??n l?? X??ch Kim Di???u Nh???t H???a, thi??u ?????t linh h???n v?? c??ng ??au ?????n, s??? ?????t anh th??nh tro, m???t s???i t??c c??ng kh??ng ch???a.

Dung D??? l??nh l???nh gi???u c???t: D???a n???t c?? ??ch g??, nhi???m v??? n??y c??n ???????ng s???ng ??? Kh??ng ch???t s???m th?? ch???t mu???n, Ch??? th???n nh?? m??y ???? m??u l???nh c??n gi??? nh??n gi??? ngh??a.

V??ng Huy???t Ng???c kh??ng mu???n tranh lu???n v???i h???n: Anh ngh?? c??ch t??? c???u tr?????c ??i. D???a theo k???ch b???n c??, m?????i ph??t sau s??? c?? m???t b??c g??i mua anh v??? l??m c?? kho t??? cho ch??u trai b?? ta ?????y.

Dung D??? m???t h???ng: Tr??nh ???????c b?? ???? th?? c??ng c??n nh???ng ng?????i kh??c, ai mua v??? c??ng l??m th???t, c?? g?? kh??c nhau ???

V??ng Huy???t Ng???c: C??, kho, h???p ???????ng gi???m, chi??n kh??c nhau. C??ch ch??? bi???n c?? ch??p c?? r???t nhi???u, t??i s??? kh??ng li???t k?? t???ng c??ch cho anh. Nh???c nh??? th??n thi???n, c??n ch??n ph??t n???a b??c g??i ???? s??? ?????n ch???.

Dung D??? im l???ng trong ch???c l??t, b???ng than nh???: V??ng nh???, m??y th???t v?? t??m.

V??ng Huy???t Ng???c: T??i t??n X??ch Kim Di???u Nh???t Ho??n.

Gi???ng Dung D??? d???u d??ng: C??i n??y kh??ng quan tr???ng, ch??ng ta th????ng l?????ng nh??, m??y b??? phong ???n cho tao, m?????i gi??y th??i.

D?? kh??ng s??? ch???t, nh??ng h???n ???????ng ???????ng l?? ?????i ma v????ng l???i b??? l??m th??nh ????? ??n, qu?? m???t m???t, v???n l?? n??n tranh th??? m???t ch??t.

V??ng Huy???t Ng???c kh??ng h??? b??? thuy???t ph???c: Kh??ng li??n quan ?????n t??i. C??n s??u ph??t.

????a ??, m???t khi c???i phong ???n cho ?????i ma v????ng, n?? s??? v??? v???i c??t b???i li???n.

Dung D??? b??nh t??nh n??i: M??y ?????ng c?? ?????m ng?????c n???a, m??y nh?? v???y l??m tao s???, kh??ng th??? t??nh t??m suy ngh?? t??m c??ch ???????c ????u.

V??ng Huy???t Ng???c: N??m ph??t.

Dung D??? quy???t ?????nh l?????i bi???ng: Hy v???ng tao b??? l??m th??nh m??n n??o ngon ngon ch??t.

V??ng Huy???t Ng???c:...Anh l?? c?? ch??p, kh??ng ph???i c?? m???n. (c?? m???n l?? ch??? nh???ng ng?????i l?????i bi???ng...)

Dung D??? v???n l?????i, m???t l???i hai ngh??a: B??y gi??? tao l???t c??n kh??ng ???????c n???a l??.

Ch???ng l???i v???n m???nh c??ng ph???i c?? v???n li???ng, kh??ng c?? th???c l???c m?? c??n mu???n ch???ng v???i ch??? ?????i, ???? g???i l?? m?? gi???a ban ng??y.

H???n kh??ng c?? ch??t ?? ch?? chi???n ?????u n??o, ?????nh ng???i ch??? ch???t, say bye v???i th??? gi???i n??y.

C??n m???t ph??t n???a l?? b??c g??i ???y ?????n ch???.

Ngay c??? b???u kh??ng kh?? c??ng tr??? n??n nghi??m t??c. Ti???ng huy??n n??o trong ch??? b???ng ho??n to??n im b???t. Ti???ng ch???t th???t, gi???t c??, tr??? gi??, ?????y xe... Gi??? ph??t n??y l???i nh?? m???t b???c tranh t??nh l???ng.

T???t c??? c??ng ?????u v?? ng?????i ????n ??ng v???a m???i b?????c v??o ch???.

B??? t??y trang v???a ng?????i ??m tr???n b??? vai r???ng eo h???p, chi???u cao x???p x??? m???t m??t ch??n, hai ch??n thon d??i th???ng t???p, nh?? ???????c ????c t??? m???t khu??n. ????i gi??y da s??ng b??ng s???ch s???, kh??ng m???t h???t b???i, v???a nh??n ???? th???y ti???c cho ????? gi??y v?? ph???i gi???m l??n m???t ?????t d?? b???n. Khu??n m???t tu???n m???, ??nh m???t th??m th??y, kh?? ch???t ??u nh?? l???nh l??ng, t?????ng m???o ph???i g???i l?? v?? c??ng xu???t s???c. B??n tay kh???p x????ng r?? r??ng, ng??n ??t b??n tay tr??i mang m???t chi???c nh???n v??ng, t??? tr???? xu???ng d?????i ho??n to??n kh??ng ??n nh???p g?? v???i ho??n c???nh n??i ????y.

??nh ho??ng h??n bu??ng xu???ng, xuy??n qua nh???ng s???i t??c r?? tr?????c tr??n ng?????i ????n ??ng, ph??i b??y v??? g???i c???m ?????n c??ng c???c.

Anh n??n xu???t hi???n ??? bu???i bi???u di???n th???i trang hay c??c cu???c h???p th????ng nghi???p, m?? kh??ng ph???i ??? khu ch??? chi???u.

Ng?????i ??i ???????ng c??ng d???ng ch??n nh??n qua, c??c ch??? s???p ven ???????ng ng???ng ?????u s???ng s???t, m???t h???i c??ng kh??ng th???t n??n l???i.

Anh ta s??? ?????n mua ????? ??? gian h??ng n??o?

C??c ch??? s???p ??ang ??m th???m mong ?????i, ?????u hy v???ng anh c?? th??? gh?? v??o s???p h??ng c???a m??nh. Ch??a n??i ?????n c??i kh??c, ng?????i ??n m???c nh?? th???, ch???c ch???n r???t h??o ph??ng.

D?????i ??nh nh??n c???a m???i ng?????i, ng?????i ????n ??ng ??i th???ng t???i s???p b??n c??, ?????ng tr?????c thau s???t ?????ng Dung D???, ?????i v???i m???y gian h??ng kh??c nh??n c??ng ch???ng nh??n l???y m???t c??i.

M???c ????ch kh?? r?? r??ng.

"L???y cho t??i con c?? ch??p n??y." Gi???ng ng?????i ????n ??ng tr???m th???p, tr??n ng???p h????ng v??? b?? ?????o t???ng t??i ti??u chu???n.

Gh??p v???i g????ng m???t tu???n t?? kh??ng c???m x??c, ph???i n??i l?? l???nh ch???t ng?????i.

Ng?????i b??n c?? l???p t???c n??i: "N???a k?? m?????i ?????ng, con n??y hai k?? r?????i, t???ng c???ng l?? n??m m????i ?????ng, t??i c??n cho anh xem, ?????m b???o kh??ng n??i gian."

C??i c??n ??i???n t??? kia kh??ng bi???t ???? c??n bao nhi??u c??, tr???? b??n c??n ?????t nh??m nh???p, c??n d??nh m???y mi???ng v???y c???y kh??ng ra, Dung D??? v?? c??ng kh??ng t??nh nguy???n.

X??m ch??t l?? h???n ???? nh???y c???ng l??n kh??ng ngh??? r???i.

"Kh??ng c???n." Ng?????i ????n ??ng l???y t??? trong v?? da ra t??? 100 ?????ng. M???t h??ng th??? b??n trong s??ng ch??i m?? m???t, m???t x???p ti???n m???t y chang nhau x???p g???n g??ng b??n trong gi???ng nh?? ???????c chu???n b??? s???n ????? mua c??.

Ng?????i b??n c?? nh???nh nh???n b??? c?? v??o t??i nilong, l???y m???t t??? n??m m????i trong h???c ti???n ra ????a, "????y, th???i anh n??m m????i."

Dung D??? b??? nh??t v??o t??i nilong, kh??ng c?? n?????c l??m h???n l???p t???c c???m th???y ngh???t th???, kh?? ch???u mu???n b??ng ra kh???i t??i.

Ng?????i ????n ??ng kh??ng nh???n t??? ti???n nh??n nh??m kia: "Kh??ng c???n th???i, cho th??m ch??t n?????c."

Ng?????i b??n c?? h??i s???ng s???t, sau ???? m???i h???n h??? ????? th??m n?????c t??? thau v??o t??i nilong, l??c n??y Dung D??? m???i th??? ???????c.

Ng?????i ????n ??ng x??ch t??i c?? xoay ng?????i ??i.

"L???n sau quay l???i nh??!" Ng?????i b??n c?? h?? l??n.

Ng?????i c?? ti???n ch??nh l?? h??o ph??ng, th??m ch??t n?????c ???? ki???m th??m n??m m????i ?????ng. Ng?????i b??n c?? m???t m??y m??n nguy???n, c??n nh???ng ch??? s???p kh??c nh??n h???n ?????y h??m m??? ghen t???.

Th???y v??? kh??ch n??y mu???n ??i, nh???ng ng?????i kh??c c??ng g???i ???m l??n.

"Anh g?? ??i mu???n gh?? s???p c???a t??i kh??ng? C?? ch??? t??i n??m ?????ng m???t c??n, c??n r??? h??n ch??? anh kia, t????i roi r??i."

"Anh g?? ??i mua cua kh??ng?"

M?? d?? ng?????i ta c?? rao th??? n??o, ng?????i ????n ??ng v???n ??i th???ng kh??ng h??? d???ng l???i.

Gi???ng nh?? t???i ????y ch??? ????? mua m???t con c?? ch??p.

Trong t??i nilong.

Dung D???: ????y l?? b??c g??i m??y n??i ???? h????

V??ng Huy???t Ng???c: ...

Dung D???: Tao ch??a l??m g?? c??? m?? ng?????i mua nguy??n ch??? l???i thay ?????i, m??y t???o bug ????ng kh??ng?

V??ng Huy???t Ng???c: ... T??? ch???i tr??? l???i.

?????ng h???i, n?? c??ng ??ang b???i r???i l???m ????y.

T???i sao Ch??? th???n ?????i nh??n l???i xu???t hi???n ??? ch??? n??y???

H???t ch????ng 2.')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (29, 16, 3, N'C?? ch??p v?????t v?? m??n - 2', 1, N'Cho d?? kh??ng ph???i khu??n m???t th???t, nh??ng l?? th???n kh?? b???n m???nh c???a Ch??? th???n ?????i nh??n, sao v??ng Huy???t Ng???c l???i kh??ng nh???n ra th???n h???n c???a v??? kia ch???.

Ch??? th???n ?????i nh??n kh??ng ph???i n??n tr???n gi??? ??? V???n Th???n Gi???i ???

V??ng Huy???t Ng???c t???m th???i ch???ng th??? tr??? l???i ???????c c??u h???i c???a Dung D???. ????? phong ???n ph??p l???c c???a Dung D???, Ch??? th???n chia ph??p kh?? b???n m???nh c???a m??nh ra l??m hai, m???t n???a l?? chi???c nh???n v??ng tr???? ng??n ??t Ch??? th???n, n???a c??n l???i bi???n th??nh v??ng ng???c ????? tr???? c??? tay Dung D???. V??ng Huy???t Ng???c b??? t??ch ra n??n ??? th??? gi???i nh??? n?? kh??ng th??? li??n l???c ???????c v???i Ch??? th???n.

V???y n??n n?? c??ng kh??ng bi???t t??nh hu???ng b??y gi??? l?? nh?? n??o.

V??ng Huy???t Ng???c im ???m, n?? ??i tra th??n ph???n Ch??? th???n ??? th??? gi???i n??y.

C??? Minh Ho??i, 28 tu???i, ?????c th??n, ch??? ngh??a ??n chay, d??? ???ng c??, m???c ch???ng s??? d?? nghi??m tr???ng. ????ng chu???n t???ng t??i b??ng s??n, gi?? tr??? c??? ng?????i m???t tr??m t???, v??? tai to m???t l???n gi???m ch??n m???t c??i c??ng l??m c??? th??nh ph??? Ch????ng Hoa ch???n ?????ng.

Hi???n h??ch nh?? th???, ????ng l?? ti??u chu???n c???a ?????a con s??? m???nh.

Nh??ng th??? gi???i 4082, v???n l?? kh??ng c?? nh??n v???t C??? Minh Ho??i.

L?? Ch??? th???n ?????i nh??n t??? t???o b???i c???nh cho th??n ph???n n??y, t?????ng m???o t??n h???, gi??? ???? m???t ??i tr?? nh??? v?? l???c l?????ng c???a b???n th???, ho??n to??n nh???p vai C??? Minh Ho??i.

Ch??? th???n c?? quy???n h???n ???????c ch??? t???o th??n ph???n ??? th??? gi???i nh??? ????? ngh??? ph??p, h??nh ?????ng kh??ng ph??? thu???c v??o s??? s???p ?????t c???a s??? m???nh, c?? th??? t??? do ph??t huy. N??n Ch??? th???n ?????i nh??n m???i ?????n mua c?? ch??p tr?????c b??c g??i, l??m thay ?????i tuy???n c?? c???a th??? gi???i n??y.

Nh??ng v??ng Huy???t Ng???c v???n kh??ng hi???u Ch??? th???n ?????i nh??n ??ang l??m g??, ch???ng l??? ng??i r???nh r???i nh??m ch??n n??n phong ???n tr?? nh??? ch???y ?????n ????y tr???i nghi???m ?????i ng?????i ???

Th??n ph???n c???a Dung D??? ??? th??? gi???i n??y l?? m???t con c??, Ch??? th???n ?????i nh??n l???i c??? ?? th??m thi???t l???p ??n chay, d??? ???ng c??... Ch???c kh??ng ph???i t???i v?? ?????i ma v????ng ????u nh????

V??ng Huy???t Ng???c c???n th???n suy ng???m.

L??c m???t v??ng m???t c?? ??ang b???i r???i, C??? Minh Ho??i ???? ??i t???i xe c???a m??nh. M???t chi???c Bentley ti???n tri???u m??u x??m b???c ?????u tr?????c qu???y ??n th???, thu h??t v?? s??? ng?????i ?????n ch???p h??nh. C??? Minh Ho??i ???n ??i???u khi???n t??? xa, ????n xe nh??y hai c??i, anh b?????c v??o trong xe d?????i ??nh m???t h??m m??? c???a m???i ng?????i, ?????t t??i nilong c???a Dung D??? v??o gh??? ph???.

L??c chu???n b??? l??i xe ??i, tay c???m l??i kh???ng m???t ch??t, anh c???m th???y h??nh nh?? m??nh ???? qu??n chuy???n g?? ?????y.

C??? Minh Ho??i c???p m???t l???nh l??ng nh??n v??? ph??a gh??? ph???, nh?? xuy??n qua l???p nilong nh??n ch?? c?? ch??p ????? b??n trong.

Anh th???t d??y an to??n cho c?? ch??p, v???y m???i h???t b??n kho??n, l??c n??y m???i l??i xe ??i.

Dung D???: Anh ta c?? b???nh ????ng kh??ng?

V??ng Huy???t Ng???c nh??n ch??? nh??n nh?? m??nh, theo ph???n x??? c??i l???i: Kh??ng, ng??i ???y ??ang ngh?? cho s??? an to??n c???a anh th??i.

Dung D???: Tao th???y m??y c??ng h??i b???nh r???i ?????y.

V??ng Huy???t Ng???c: ...

???

Chi???c xe v???ng v??ng ch???y, h??ng c??y ngo??i c???a d???n b??? b??? l???i ph??a sau.

Trong k??nh chi???u h???u chi???u ra ??nh m???t b??nh t??nh c???a ng?????i ????n ??ng. Ng??n tay thon d??i kho??c l??n tay l??i, ??nh ho??ng h??n xuy??n qua c???a k??nh xe, r???i l??n chi???c nh???n tr???? ng??n ??t ?????n r???c r???.

Kh??ng ph???i ki???u nh???n ph?? tr????ng nh?? nh?? gi??u m???i n???i, ch??? ????n gi???n l?? m???t v??ng v??ng nh??? tr???? ng??n ??t, t???a nh?? v??ng s??ng bao quanh m???t tr???i. Ph??a tr???? ???????c kh???c th??nh h??nh m???t tr???i, phong c??ch c??? x??a, nh?? trang s???c tr???? tay Th???n M???t Tr???i trong th???n tho???i Hy l???p, r???c r??? xa hoa, t??n qu?? b???t ph??m, v???a nh??n ???? bi???t gi?? kh??ng r???.

Dung D??? kh??ng th???y ???????c phong c???nh ven ???????ng, ch??? c?? th??? n??i chuy???n phi???m v???i v??ng Huy???t Ng???c gi???t th???i gian: ????y l?? xe tang ti???n tao ?????n thi??n ???????ng ????ng kh??ng? T???i nay tao s??? b??? h???p ???????ng gi???m chi??n kho ???

V??ng Huy???t Ng???c:... Kh??ng ????u.

Dung D???: Sao l???i kh??ng? ????y c??ng ch???ng ph???i khu c?? c???nh, ch???ng l??? l???i c?? ng?????i ?????n ch??? ????? ??n mua c?? c???nh ???

V??ng Huy???t Ng???c: C?? ?????y, C??? Minh Ho??i n??.

Dung D???: H???n nhi???u ti???n.

V??ng Huy???t Ng???c: Nh?? gi??u nh???t th??nh ph??? Ch????ng Hoa, kh??ng nhi???u ti???n m???i l???.

Dung D??? bi???t ???????c th??n ph???n c???a ng?????i ????n ??ng, v???n t???nh b?? n??i b??ng n??i gi??: Sao m??y ch???c ch???n C??? Minh Ho??i kh??ng ??n c???

V??ng Huy???t Ng???c h???n nhi??n kh??ng bi???t m??nh s???p b???y: Anh ta d??? ???ng c??.

Dung D???: V???y t???i sao anh ta l???i ?????n ch??? mua c???

V??ng Huy???t Ng???c c??ng kh??ng hi???u ?? ?????nh c???a Ch??? th???n ?????i nh??n: T??i bi???t----

V??ng Huy???t Ng???c ?????t nhi??n th???y r???n ng?????i, v???i v??ng ng???m mi???ng.

?????i ma v????ng ??ang b???y n??.

L?? m???t gi??m s??t vi??n, n?? kh??ng n??n cung c???p b???t k??? tr??? gi??p n??o cho Dung D???, bao g???m c??? th??n ph???n c???a ng?????i ????n ??ng. Nh??ng b??y gi??? n?? kh??ng ch??? n??i cho Dung D??? th??n ph???n ng?????i ????n ??ng m?? c??n ti???t l??? chuy???n ng?????i n??y d??? ???ng c??.

B??? d???t m??i d??? nh?? tr??? b??n tay, Dung D??? ???? bi???t n?? c?? th??? tra th??n ph???n c???a nh??n v???t trong th??? gi???i n??y.

So v???i th??n ph???n th???t s??? c???a Ch??? th???n ?????i nh??n, th??ng tin c?? nh??n c???a C??? Minh Ho??i kh??ng c?? g?? quan tr???ng, d?? sao c??ng l?? h?? c???u. V?? b???o v??? b?? m???t l???n, trong l??c Dung D??? nh?? l?? ????ng t??n g???u n?? l???i v?? b???o v??? b?? m???t l???n m?? ti???t l??? b?? m???t nh???... Nh??ng th??? n??o ??i ch??ng n???a th?? chuy???n n??y n?? c??ng kh??ng n??n n??i ra, l?? n?? ???? thi???u c???nh gi??c.

?????i ma v????ng ????ng l?? ?????i ma v????ng, ??m hi???m x???o tr??, l?? l?? m???t ch??t th??i ???? b??? l???a.

Ch??? mong ?????i ma v????ng ?????ng ph??t hi???n ra chuy???n g??.

V??ng Huy???t Ng???c mu???n n??ng cao tinh th???n, kh??ng th??? b??? l???a n???a. ?????i ma v????ng m???m mi???ng cao si??u l???m.

Dung D??? th???y v??ng ng???c c???nh gi??c, c??ng kh??ng h???i th??m, d?? sao h???n ???? bi???t ???????c tin t???c h???n mu???n.

H???n t???i th??? gi???i n??y kh??ng l??m chuy???n g?? c???, trong k???ch b???n c?? ng?????i mua c?? n??n l?? b??c g??i, nh??ng cu???i c??ng l???i l?? ng?????i ????n ??ng t??n C??? Minh Ho??i n??y.

Tuy???t ?????i kh??ng ph???i v?? h???n ?????n n??n sinh ra hi???u ???ng b????m b?????m, h???n c??n ch??a k???p v??? c??nh kia k??a.

V???y bi???n s??? l?? ng?????i ????n ??ng n??y.

V??ng Huy???t Ng???c s??? kh??ng cung c???p th??ng tin cho h???n, nh??ng l???i d??? d??ng b??? h???n l???a n??i ra th??n ph???n c???a C??? Minh Ho??i, th???n kh?? b???n m???nh c???a Ch??? th???n s??? kh??ng ph???m ph???i l???i c???p th???p nh?? th???. ??i???u n??y cho th???y s??u trong ti???m th???c c???a v??ng Huy???t Ng???c mu???n che gi???u m???t th??n ph???n quan tr???ng h??n, m?? so ra, th?? vai C??? Minh Ho??i n??y ch??? ????? t?????ng tr??ng, n??i ra c??ng ???????c. H??n n???a th??n ph???n c??n l???i, v??ng Huy???t Ng???c c??ng v???a m???i bi???t, h??nh nh?? n?? kh??ng bi???t ng?????i n??y s??? ?????n ch??? mua h???n, m???i kinh ng???c m?? ????? l??? s?? h???.

V??ng Huy???t Ng???c bi???t th??n ph???n th???t s??? c???a ng?????i ????n ??ng, t???t nhi??n s??? kh??ng n??i cho h???n.

L?? ng?????i c???a c???c Qu???n L?? Th???i Kh??ng ??ang l??m nhi???m v??? ??? T???i c???u ?????a con s??? m???nh? Dung D??? suy ??o??n.

Kh??ng ph???i. C???c Qu???n L?? Th???i Kh??ng c?? nhi???u b??? kh??c nhau, c??c b??? n??y s??? kh??ng ph??n nhi???m v??? xung ?????t nhau.

B??? C???u R???i c?? nhi???m v??? xuy??n v??o ng?????i qua ???????ng, c???u ?????a con s??? m???nh, k??o b???n h??? ra kh???i kh?? kh??n. C??n nhi???m v??? c???a B??? Tu S???a l?? gi??? th??nh ?????a con s??? m???nh, t??m ???????ng s???ng trong ng?? ch???t, ng??n c???n th??? gi???i s???p ?????.

Nhi???m v??? c???a ng?????i sau kh?? h??n, c???n ????? ho??n thi???n cao h??n, ??i???m th?????ng c??ng phong ph?? h??n --- v?? t???t nhi??n Dung D??? ??ang l???y c??ng chu???c t???i, n??n kh??ng c?? ??i???m th?????ng.

B???n ch???t c???a hai b??? n??y ?????u l?? c???u r???i ?????a con s??? m???nh. Dung D??? ???? nh???n nhi???m v???, n??n s??? kh??ng c??n ng?????i n??o t???i th??? gi???i n??y c???u nguy??n ch??? n???a.

V???y l?? ng?????i xuy??n kh??ng phi ph??p?

C???c Qu???n L?? Th???i Kh??ng l?? b??? ph???n xuy??n kh??ng h???p ph??p, m?? c?? h???p ph??p th?? s??? c?? phi ph??p. B???i v?? l??? h???ng th???i kh??ng n??n c??c th??? gi???i xu???t hi???n bug, c?? ng?????i c??? ?? l???i d???ng ????? xuy??n kh??ng, tr??ng sinh, r??ng bu???c l???n x???n v???i c??c h??? th???ng, l??m ???nh h?????ng ?????n tuy???n th??? gi???i, ?????u l?? h??nh vi ph???m ph??p. V?? d??? nh?? tr??ng sinh v??? ????? ngh???ch thi??n s???a m???nh, l???i d???ng h??? th???ng ngo??i ????? gi??p m???y v???t hy sinh ngh???ch t???p, c??ng l?????c v?? c?????p l???y v???n may c???a ?????a con s??? m???nh... Nh???ng h??nh ?????ng l??m thay ?????i tuy???n th??? gi???i c?? c??ng c?? th??? l??m th??? gi???i ???? kh??ng ???n ?????nh, nghi??m tr???ng h??n n???a l?? s???p ?????.

D?????i tr?????ng Ch??? th???n, m???i th??? gi???i ?????u c?? th???n b???o v??? ri??ng. Khi xu???t hi???n hi???n t?????ng phi ph??p, th???n b???o v??? c???a th??? gi???i nh??? s??? ra m???t ch???p ph??p, n???u th???n b???o v??? b?? tay ho???c gi???i quy???t kh??ng ???n th?? l??c n??y c???c Qu???n L?? Th???i Kh??ng s??? ph??i ng?????i t???i gi??p.

Th??n l?? t???i ph???m b??? truy n??, Dung D??? kh??ng c?? t??nh gi??c ng??? m???y chuy???n ch??nh tr??? n??y. H???n c???m th???y chuy???n m?? ng?????i phi ph??p v?? th???n s??? h???p ph??p l??m x??t t??? m???t n??o ???? th?? ch??? c?? g?? kh??c nhau.

Ng?????i phi ph??p mu???n gh??p hai ng?????i kh??ng ph???i m???t ????i tr???i ?????nh l???i v???i nhau, ?????y g???i l?? chia r??? uy??n ????ng. Ng?????i phi ph??p ??i c??ng l?????c m???t trong hai ng?????i ???? c?? ????i c?? c???p, ???? ch??nh l?? l???a d???i t??nh c???m, h???y ho???i nh??n duy??n, nhi???u lo???n s??? m???nh, t???i v?? c??ng n???ng.

Dung D??? kh??ng th??ch c??ng ch??a Thi??n T???c, nh??ng v?? v???n m???nh mu???n h??? th??nh ????i, n??n c?? m???t ????m th???n s??? xu???ng c??? g???ng g??n gh??p hai ng?????i. Sau ???? h???n l???i b??? m???t ????m th???n s??? thay nhau c??ng l?????c, gi???ng nh?? b??? l???a g???t. N???u kh??ng ph???i h???n bi???t r?? t???t c???, th?? ch???ng ph???i tr??? th??nh th???ng ngu b??? ng?????i ta ????a gi???n ??.

Nh???ng th???n s??? kia ?????u v?? ch??nh ngh??a. V?? s???p ?????t c???a v???n m???nh m?? Dung D??? ph???i c?? t??nh c???m, b???n h??? ??ang ph???n ?????u v?? h??a b??nh th??? gi???i.

D?????i tr???t t??? th??? gi???i v?? an b??i c???a v???n m???nh, th?? mong mu???n c?? nh??n kh??ng ????ng m???t ?????ng.

Dung D??? ch???ng l???i s??? m???nh, c??ng l?? m???t ng?????i theo ch??? ngh??a ??ch k???, kh??ng mu???n v?? c??n b???ng tr???t t??? th??? gi???i m?? ??p ch??nh m??nh ??i theo v???n m???nh ???? s???p ?????t, kh??ng mu???n tr???i qua m???t cu???c ?????i b??? ng?????i d???i g???t. Trong x????ng m??u h???n kh??ng c?? hai ch??? nh??n nh?????ng.

So v???i vi???c b??? tr??i trong t???m l?????i v???n m???nh n??y, h???n ch???n t??? b??? v???n may c???a m??nh ????? ??i t??m ch??n tr???i t??? do.

Quay l???i chuy???n ch??nh, d?? trong b???t k??? tr?????ng h???p n??o, C??? Minh Ho??i ch???c ch???n kh??ng ph???i ng?????i b??nh th?????ng.

- --

C??? Minh Ho??i d??? ???ng c??, anh ch??a bao gi??? ??n c??, n??i ch??nh x??c th??, anh kh??ng ??n b???t k??? ????? ??n m???n n??o.

Ng???i b???n.

N???a ti???ng tr?????c, C??? Minh Ho??i l??i xe tan l??m v??? nh??, c??ng ty c??ch nh?? kh??ng xa m???y, ch??? m?????i ph??t l?? t???i, m???i ng??y anh ?????u ch???y qua ch???y l???i con ???????ng n??y. C??m t???i c?? ng?????i gi??p vi???c l??m, chuy???n mua th???c ??n c??ng kh??ng c???n anh lo.

H??m nay nh?? b??? c??i g?? h???p d???n, anh ch???y hai m????i ph??t, ?????n khu ch??? m?? t??? tr?????c ?????n gi??? anh ch??a t???ng ??i, ai xui ai khi???n th??? n??o m?? l???i mua m???t con c?? ch??p.

Ch??nh l?? con ??ang n???m tr???? gh??? ph??? n??y.

Anh mua m???t con c?? v??? l??m g?? nh???...

C??? Minh Ho??i r??i v??o tr???m t??. =)))))))))

Th??i k??? ??i, mua c??ng mua r???i, v??? nu??i c??ng ???????c.

C??? Minh Ho??i l??i xe v??? nh??, x??ch t??i nilong ??i v??o m???t c??n bi???t th??? ki???u Ch??u ??u sang tr???ng, b??n trong ???????c trang tr?? b???ng nh???ng vi??n ng???c m???t c?? r???c r???, v?? c??ng xa hoa.

Dung D??? b???t b???: C??i nh?? n??y nh??? th???, ch???ng l??? tao ph???i ??? ????y?

H???n th??ch hoa ho?? hoa s??i, phong c??ch l???i xa x??? hoa l???, c??n bi???t th??? sang tr???ng n??y ho??n to??n h???p gu h???n. T???t nhi??n c??n k??m xa cung ??i???n tr?????c kia c???a h???n, nh??ng ??ang l?? ng?????i d?????i m??i hi??n, th??i th?? ??? ????? c??ng ???????c.

V??ng Huy???t Ng???c t???t cho g??o n?????c l???nh: Anh t???nh l???i ??i, b??y gi??? anh l?? m???t con c??, cho anh c??i h??? c?? ???? l?? t???t l???m r???i.

Dung D???: V???y tao mu???n m???t h??? c?? l???n b???ng c??i ph??ng n??y.

V??ng Huy???t Ng???c c?????i nh???o: Anh cho l?? ai c??ng s???ng ph?? tr????ng nh?? anh h????

"??ng ch???." Ng?????i gi??p vi???c ra ????n, th???y C??? Minh Ho??i x??ch t??i c?? ch??p, ??nh m???t l??? v??? kinh ng???c: "T???i nay c?? kh??ch ?????n ???? Ng??i ????a c?? cho t??i, t??i ??em xu???ng b???p cho."

??ng ch??? k??? c??, n??n mua c?? ch??p ch???c l?? ????? ????i kh??ch.

C??? Minh Ho??i c??ng kh??ng ????a c?? cho ng?????i gi??p vi??c: "Mua v??? nu??i."

Ng?????i gi??p vi???c l???p t???c n??i: "V???y ????? t??i ?????t h??? c??."

"Kh??ng c???n." C??? Minh Ho??i nh??n nh???t n??i, "C??? th??? trong h??? b??i l???u b???n ??i, nh??? thay n?????c v???i cho c?? ??n."

Ng?????i gi??p vi???c h??i s???ng s???t: "??ng ch??? ng??i nh???t ?????nh mu???n d??ng h??? b??i ????? nu??i... m???t con c?? ch??p ????"

"M???t c??i kh??ng ????? ???" C??? Minh Ho??i suy ngh?? m???t ch??t, "V???y d??ng lu??n h??? b??i ngo??i tr???i ??i, th???nh tho???ng cho n?? ra ngo??i h??ng m??t c??ng ???????c."

Ng?????i gi??p vi???c: "..."

V??ng Huy???t Ng???c: ...

Dung D???: ????ng l?? kh??ng gi???ng th???t, ng?????i n??y c??n l??m m??u h??n tao.

H???n l???i k???????? tr?? b??? sung: C?? m?? tao th??ch.

H???t ch????ng 3.')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (30, 16, 4, N'C?? ch??p v?????t v?? m??n - 3', 1, N'Ngay sau ???? Dung D??? ???? t???i nh?? m???i c???a m??nh.

H??? b??i d??i 25 m??t, r???ng 12 m??t, d??ng ????? nu??i m???t con c?? ch??p hai k?? r?????i, ??? trong m???t ng?????i ngo??i ????y th???t s??? l?? ph?? c???a.

M?? h???n kh??ng ch??? c?? m???t c??i b???t ?????ng s???n n??y, ngo??i h??? b??i trong nh??, h???n c??n chi???m lu??n c??i h??? ngo??i tr???i.

C??? Minh Ho??i x??ch t??i nilong l??n t???ng 4, ?????ng ngay th??nh h??? th??? c?? ch??p xu???ng.

Dung D??? t??? trong t??i b??i ra, c??ch b??n tay c???a C??? Minh Ho??i c???c k??? g???n. H???n gi???t m??nh, c???m th???y tr???? ng?????i C??? Minh Ho??i tr??n ra m???t lu???ng linh kh?? d??y ?????c.

Th???t kh??ng t?????ng t?????ng n???i.

Th??? gi???i n??y h???u nh?? ???? kh??ng c??n ph??p l???c, linh kh?? trong ?????t tr???i ??t ?????n m???c kh??ng c???m nh???n ???????c, ho??n to??n kh??ng th??? tu luy???n l???i. Nh???ng Th???n s??? kh??c ???????c ?????i ?????o c??? trong h??? th???ng c???a h??ng ????? bi???n th??nh ng?????i, c??n Dung D??? ch??? c?? th??? ??? trong x??c c?? ch??p ch??? ch???t.

Th??? nh??ng h???n l???i c???m nh???n linh kh?? t???a ra t??? t??n ng?????i ph??m C??? Minh Ho??i.

????? x??c ?????nh l???i l???n n???a, Dung D??? b??i qua d??n s??t v??o l??ng b??n tay C??? Minh Ho??i, ch???ng minh ????y ch???c ch???n kh??ng ph???i l?? ???o gi??c. Tr???? ng?????i C??? Minh Ho??i th???t s??? ??ang t???a ra linh kh??, c??n d???i d??o h??n th??? gi???i Ti??n hi???p c???a Dung D???, th???m ch?? c?? th??? th??ng qua ti???p x??c th??n th??? m?? cu???n cu???n truy???n cho Dung D???.

Dung D??? v???i v??ng nh??n c?? h???i h??t m???t h??i, b???ng c???m th???y trong c?? th??? tr??n ?????y linh kh??, c??n h???u d???ng h??n c??? tinh hoa nh???t nguy???t.

Lai l???ch c???a ng?????i n??y kh??ng t???m th?????ng.

Khi l??ng b??n tay v???a ch???m ph???i v???y c?? C??? Minh Ho??i l???p t???c r???t tay v???, m???i ?????ng ???? t??ch ra. Hi???n nhi??n ch???m ph???i v???y c?? tr??n nh???t l??m b???nh s??? d?? c???a anh ph??t t??c, nhanh ch??ng nh??ng tay xu???ng h??? r???a.

Dung D??? c??n ch??a h??t ?????, b??i theo qua, qu???n l???y tay ng?????i ????n ??ng ti???p t???c h??t.

Ti???p x??c th??n th??? m???i h??t ???????c linh kh??, m?? c?? linh kh?? th?? m???i bi???n th??nh ng?????i ???????c. Ng?????i b??nh th?????ng s??? ch???ng ai ??i ''ti???p x??c th??n th???'' v???i m???t con c?? c???, n??n ????y l?? c?? h???i c?? m???t kh??ng hai, kh??ng th??? b??? qua ???????c. . TruyenHD

C??? Minh Ho??i kh??ng ngh?? l?? c?? ch??p c??ng b??i t???i, c??n ti???p t???c d??n v??o tay anh, ch??n m??y anh c??ng th???ng, su??t n???a ???? b??p ch???t con c?? n??y.

Ch??? ngh?? nh??ng kh??ng l??m l?? v?? anh kh??ng mu???n ?????ng v??o n??.

C??? Minh Ho??i mu???n r??t tay l???i chu???n b??? b??? ??i, ai ng??? c?? ch??p l???i ?????t nhi??n ng???m l???y ?????u ng??n tay anh kh??ng cho anh ??i.

Nh??n b???ng m???t th?????ng c??ng c?? th??? th???y v??? m???t C??? Minh Ho??i d???n u ??m, m???t l???n n???a anh ho??i nghi b???n th??n b??? kh??ng m?? ??i ch??? mua m???t con c??.

Anh nh??n ?????u ng??n tay ??ang trong mi???ng con c??: "Kh??ng n??? r???i xa tao ???"

Dung D??? th???m ngh??: Kh??ng n??? r???i xa linh kh?? c???a anh.

C??? Minh Ho??i m???t kh??ng c???m x??c: "N??y c?? nh???, m??y r???t ?????p, n??n ph???i qu?? tr???ng sinh m???nh, ?????ng ch???c tao t???c gi???n."

Th??n th??? n??y c???a Dung D??? c?? v???y h???ng v?? c??ng di???m l???, hi???n nhi??n l?? c???c ph???m trong lo??i c?? ch??p.

Dung D???: Th??? m?? anh ta c?? th??? xuy??n qua b??? ngo??i nh??n th???u b??n trong, ph??t hi???n tao ?????p kh??ng ai s??nh b???ng k??a.

V??ng Huy???t Ng???c: Tr???ng ??i???m l?? n???a c??u sau bi???t kh??ng.

Dung D??? kh??ng quan t??m n??, tranh th??? h???p thu linh kh??.

C??? Minh Ho??i kh??ng c?? ki??n nh???n ng???i ch??i v???i m???t con c??, l???p t???c ?????ng d???y b??? ??i. B?????c ch??n d???n d???p ??i???u b??? v???i v??, ??o??n ch???ng l?? mu???n v??o nh?? v??? sinh ch?? tr??c ba l???p da tay.

Dung D??? b??? ??p nh??? ng??n tay ra, v???n l??u luy???n nh??n theo b??ng l??ng C??? Minh Ho??i.

Nh???ng linh kh?? kia v??o trong c?? th??? nh?? ???? ch??m ????y h???, nh?? mu???i b??? bi???n, mu???n bi???n th??nh ng?????i th?? c??n l??u m???i ?????. Dung D??? v???y ??u??i, t??nh xem l??c n??o m???i c?? ???????c c?? h???i nh?? n??y.

Ch?? m??o c?? b??? l??ng d??? th????ng, c??n v???y c?? ch??p l???i tr??n nh???t nh?? th??? n??n ch??? c?? th??? ng???m, ng?????i b??nh th?????ng c??ng ??t ai mu???n s???.

Ch??? ?????ng n??i ?????n C??? Minh Ho??i b??? b???nh s??? d??.

C??? ti???p t???c nh?? v???y kh??ng bi???t th??ng n??o n??m n??o m???i c?? th??? h??t ????? linh kh??, h??a th??nh ng?????i.

M???i chuy???n kh??ng th??? qu?? g???p g??p, c?? C??? Minh Ho??i ???? l?? m???t ni???m vui b???t ng??? r???i.

Dung D??? sung s????????? b??i m???y v??ng, ngh?? c??i thau nh??? v?? t??i nilong ????ng l?? ng???p ch???t h???n.

H???n ???????c C??? Minh Ho??i nu??i trong h???, ???? thay ?????i s??? m???nh l??m c?? ch??p kho t???, sau n??y c??ng kh??ng c???n lo b??? m???t m???ng. Nh??ng ????n h???n c???a nguy??n ch??? v???n ch??? d??i th??m m???t ch??t x??u, ??nh n???n t??? le l???t th??nh ch???t s??ng ch???t t???t.

Tho??t kh???i c??i ch???t kh??ng th??? ?????t ???????c k???t HE.

M?? c??ng ph???i, ?????i v???i m???t y??u ???? c?? linh tr??, bi???n ???????c th??nh ng?????i, th?? v??nh vi???n s???ng trong h??nh h??i c?? ch??p c??n kh?? ch???u h??n c??? ch???t.

Mu???n HE, l?? ph???i l???y l???i n???i ??an.

C??? ?????i c???a y??u ch??? c?? th??? t???o ???????c m???t vi??n ??an, c?? n???i ??an m???i c?? ph??p l???c, c?? th??? bi???n th??nh ng?????i l??u d??i. H??t linh kh?? tr???? ng?????i C??? Minh Ho??i d?? c??ng h??a th??nh ng?????i ???????c nh??ng c??ng ch??? l?? t???m th???i, ph???i lu??n d??nh ch???t v???i C??? Minh Ho??i, m???t khi r???i kh???i anh ta th?? s??? l???p t???c bi???n l???i nguy??n h??nh.

B??y gi??? c??ng kh??ng bi???t n???i ??an c???a nguy??n ch??? ??ang ??? ????u, h???n ph???i bi???n th??nh ng?????i tr?????c m???i bi???t ???????c k???ch b???n.

V???y n??n mu???n g??? r???i k???ch b???n th?? ph???i tranh th??? c?? h???i ti???p x??c v???i C??? Minh Ho??i, h??t th???t nhi???u linh kh??.

Dung D???: ?? V??ng nh???.

V??ng Huy???t Ng???c: Kh??ng online.

Dung D??? gi???ng ??i???u kh???ng ?????nh: C??? Minh Ho??i kh??ng ph???i ng?????i c???a th??? gi???i n??y.

V??ng Huy???t Ng???c: ...

Dung D???: Trong th??? gi???i kh??ng c??n ph??p l???c n??y th?? linh kh?? tr???? ng?????i anh ta kh??ng n??n t???n t???i.

C??? c??i th??n v??ng c???a V??ng Huy???t Ng???c c??ng ng?? lu??n r???i.

Ch??? th???n ?????i nh??n ?????ng ?????u v???n th???n, l?? ng?????i m?? ch??ng sanh ph???i v??i ch??o. ?????t ??ai m?? ng??i t???ng ??i qua s??? tr??? n??n m??u m???, nh???ng sinh linh s???ng tr???? phi???n ?????t ???? c??ng s??? ?????c ?????o th??nh ti??n, t???t nhi??n linh kh?? ph???i v?? c??ng d???i d??o, b??y gi??? v?? suy y???u n??n linh kh?? m???i ??t nh?? th??? th??i.

Nh??ng m?? ?????n th??? gi???i nh???, Ch??? th???n ?????i nh??n c?? th??? ????ng linh kh?? l???i, nh??ng ng??i kh??ng l??m th???. Ng??i m??? m???t c??nh c???a thu???n l???i cho Dung D???, l?? c?? m???c ????ch g???

V??ng Huy???t Ng???c ngh?? n??t ??c v???n kh??ng hi???u ???????c. Ch??nh Ch??? th???n ?????i nh??n ???? t???ng n??i, v?? tr???ng ph???t Dung D???, s??? kh??ng cho h???n b???t k??? h??? th???ng n??o, c??ng kh??ng cho v??ng Huy???t Ng???c tr??? gi??p Dung D??? b???t c??? chuy???n g??.

N?? tr??m tri???u kh??ng ng??? r???ng ?? c???a Ch??? th???n ?????i nh??n l?? t??? m??nh t???i l??m ''ph???n m???m gian l???n'' cho Dung D???.

V??ng Huy???t Ng???c gi???u ?????u h??? ??u??i: T??i kh??ng bi???t.

Dung D???: Th??? ??? Tao kh??ng tin.

V??ng Huy???t Ng???c c??m nh?? h???n gi??? ch???t.

May l?? Dung D??? suy ngh?? m???t h???i, c??ng kh??ng ngh?? ?????n Ch??? th???n. V??? kia c??ng ch??nh nghi??m minh, l??nh kh???c v?? t??nh, ??u???i gi???t h???n c??? m???y tr??m th??? gi???i, c?? th??? n??i l?? t??? ?????ch, Dung D??? c?? th??? n??o c??ng kh??ng ngh?? t???i t??? ?????ch n??y l???i ??i theo gi??p h???n gian l???n.

??i???u n??y th???t s??? r???t kh?? tin.

Dung D???: Cho d?? h???n l?? ai, c?? th??? gi??p tao th?? ?????u l?? ng?????i t???t. Ai nh?? ch??? nh??n nh?? m??y, ch??? bi???t b???t n???t tao.

V??ng Huy???t Ng???c:... ?? ??.

Xu gh??, ng?????i b??? anh ph??t th??? ng?????i t???t ch??nh l?? ch??? nh??n c???a t???i h??? ?????y.

- --

Dung D??? ??? d?????i h??? b??i, tr???i qua cu???c ?????i c???a c?? h???t s???c nh??n r???i l???i nh??m ch??n.

Gi??m ?????c C??? l?? ng?????i v?? c??ng b???n r???n, t??ng ca ng??? l???i c??ng ty l?? chuy???n th?????ng ng??y, anh v???a v??? nh?? ???? v??o ph??ng ng???, ho???c l??m vi???c trong ph??ng s??ch, ??t khi ?????n l???u b???n ng???m c??.

D?? c?? xinh ?????p c??ch m???y, nh??ng c??ng ch??? l?? m???t con c?? ch??p, nh??n ho??i c??ng ch??n th??i.

Vi???c cho Dung D??? ??n ?????u l?? ng?????i gi??p vi???c l??m, th???nh tho???ng l???i cho ra h??? b??i ngo??i tr???i t???m n???ng, mu???n g???p C??? Minh Ho??i c??n kh?? h??n l??n tr???i.

Ng??y n??o h???n c??ng b??i t??? ?????u n??y sang ?????u kia, ?????u kia v??? ?????u n??y, b??i th???ng, b??i v??ng, b??i l?????n v???y ??u??i... Nh??n bi???u di???n c??c ki???u b??i xinh ?????p sinh ?????ng c??ng th???y ???????c ch?? c?? n??y ??ang ch??n ?????n m???c n??o.

C??ng may c??i h??? n??y l???n, ch??? m?? h??? nh??? th?? Dung D??? ???? qua ?????i v?? kh?? ch???u.

M???c d?? b??y gi??? c??ng ch??? d??? ch???u g?? m???y.

Dung D??? ch??n ?????n m???c th???i bong b??ng: Kh??ng th??? ti???p t???c nh?? n??y ???????c, sao C??? Minh Ho??i kh??ng ?????n th??m tao?

V??ng Huy???t Ng???c sao c?? th??? b??? l??? c?? h???i gi???u c???t ?????i ma v????ng: Nh??n anh gi???ng o??n ph??? n??i khu?? ph??ng l???m bi???t kh??ng.

Dung D???: Gi??? tao tuy???t th???c th?? c?? t??c d???ng kh??ng? H???n c?? quan t??m ?????n tao kh??ng?

V??ng Huy???t Ng???c: N??y c??ng gi???ng h??n.

Dung D???: H???u d???ng ????ng kh??ng? C??? quy???t ?????nh v???y ??i.

V??ng Huy???t Ng???c: ...

N?? v???i ?????i ma v????ng c?? ??ang chung t???n s??ng n??o kh??ng th??????

V???y n??n ng?????i gi??p vi???c trong nh?? b???ng ph??t hi???n, ch?? c?? m?? ??ng ch??? nu??i h??nh nh?? ??ang t???i th??n.

C??? th??? l?? n?? b??? ??n, c??ng l?????i b??i lu??n, ai k??u c??ng m???c k???. Cho ra ngo??i t???m n???ng c??ng mang v??? thoi th??p, kh??c h???n v???i b??? d??ng vui v??? ho???t b??t m???y ng??y tr?????c.

T??nh hu???ng n??y k??o d??i m???y ng??y, ng?????i gi??p vi???c s??? c?? ch???t, cu???i c??ng c??ng b??o chuy???n n??y cho C??? Minh Ho??i.

"??ng ch???." Ng?????i gi??p vi???c g?? c???a ph??ng s??ch.

C??? Minh Ho??i ??ang ?????c v??n ki???n c???a c??ng ty, kh??ng ng???ng ?????u l??n n??i: "V??o ??i."

Ng?????i gi??p vi???c ??i v??o: "??ng ch???, con c?? ng??i ??em v??? m???y h??m tr?????c t??? nhi??n kh??ng ch???u ??n, c??ng kh??ng b??i, t??i kh??ng bi???t n?? c?? b??? b???nh kh??ng."

C??? Minh Ho??i nh??o mi t??m. M???y n??y nay qu?? b???n, anh su??t th?? qu??n nh?? c??n nu??i m???t con c??.

C?? b??? b???nh c??ng ch???ng ph???i chuy???n to t??t g??, r???t nhi???u ng?????i nu??i c?? th???y c?? ch???t th?? k???, mua con kh??c nu??i th??i. C??? Minh Ho??i nh??? l???i ng??y ???? con c?? ch??p c??? b??m theo anh, l??m anh c?? ch??t ??m ???nh.

Nh??ng n???u c?? ch???t... kh??ng bi???t t???i sao, l???i th???y h??i kh?? ch???u.

C??? Minh Ho??i ?????t v??n ki???n xu???ng: "????? t??i ??i xem."

Dung D??? ??ang l?????i bi???ng n???m ph??i b???ng tr???? m???t n?????c, v???a th???y C??? Minh Ho??i ??i v??o l???p t???c xoay m??nh, b??i th???t nhanh t???i th??nh h???.

??y d?? ng?????i anh em r???t cu???c anh c??ng t???i, anh kh??ng t???i th?? sao t??i l??m nhi???m v??? ???????c.

C??? Minh Ho??i nh??n ch?? c?? ch??p ??ang vui s????????? b??i v??? ph??a m??nh, nghi??ng ?????u h???i: "N??y kh??ng ph???i v???n kh???e m???nh ???"

Ng?????i gi??p vi???c: "...Hai ng??y tr?????c n?? kh??ng nh?? th???."

C??? Minh Ho??i c???m th???c ??n cho c??, r???i m???t ch??t l??n m???t n?????c. C?? ch??p c??ng kh??ng th??m quan t??m, ch??? ng???a ?????u nh??n anh ch??m ch??.

C??? Minh Ho??i nh?????ng m??y, ng???i x???m xu???ng nh??n n??, gi???ng ??i???u v???n b??nh th?????ng: "N??y c?? nh???, nghe n??i hai ng??y nay m??y kh??ng ch???u ??n?"

Dung D??? kh??ng ??n nh???ng th???c ??n tr???? m???t n?????c, "r??o" m???t ti???ng b??ng ra kh???i m???t n?????c, m??? l??n mu b??n tay c???a C??? Minh Ho??i.

Ch?? c?? nh???y ra v??ng h???t n?????c l??n ng?????i C??? Minh Ho??i.

"???i ??ng ch???." Ng?????i gi??p vi???c k??u l??n, "Ng??i ?????ng xa m???t ch??t."

G??n xanh tr???? tr??n C??? Minh Ho??i gi???t gi???t, nh???m m???t nh???n nh???n n??i: "Kh??ng sao, c???u ??i l??m vi???c ??i."

Ng?????i gi??p vi???c ch???n ch???: "V??ng."

Tr???i ?????t ??i, ??ng ch??? C??? c?? b???nh s??? d?? nghi??m tr???ng b??? n?????c c?? l??m ?????t nh??m nh???p, c??n b??? m??? l??n tay, th??? m?? kh??ng t???c gi???n.

Ng?????i gi??p vi???c ??i kh???i h??? b??i, b??n trong ch??? c??n l???i m???t ng?????i m???t c??.

C??? Minh Ho??i c??ng m??i: "C?? nh??? m??y th???t bi???t ch???n, kh??ng ??n th???c ??n tr???? m???t n?????c, n???ng n???c ????i ??n tr???? tay tao."

Dung D??? c??? g???ng mu???n nh???y m???t l???n n???a.

Khi n??y ch??? v???a m???i ch???m v??o m?? h???n ???? h??t ???????c m???t ch??t linh kh??.

C??? Minh Ho??i nh?????ng m??y, gi?? tay cao l??n: "Nh???y ??i."

Dung D??? c?????i nh???t, n??y l?? ??ang hu???n luy???n ch?? ???

C?? m?? ch?? th?? ch??, linh kh?? quan tr???ng nh???t.

C??? Minh Ho??i nh??n c?? ch??p nghe l???i, nh???y ra kh???i m???t n?????c, c?? ??i???u l???n n??y qu?? cao, m???i ???????c m???t n???a ???? b??? r??i xu???ng.

V??? m???t C??? Minh Ho??i l??? ra ch??t h???ng th??.

????y l?? tr??ng h???p, hay th???t s??? c?? th??? nghe hi???u?

C??? Minh Ho??i h??? tay xu???ng, l??c n??y Dung D??? m???i th??nh c??ng, thu???n l???i h??t ???????c m???t h???p linh kh??.

C??? Minh Ho??i l???i b??? mi???ng c?? ch???m v??o, c?? th??? v?? ???? b??? m???t l???n n??n l???n n??y c??ng kh??ng c??n m??u thu???n nh?? tr?????c. Anh chu???n b??? t??m l?? s???n s??ng, sau ???? m???i b???t ?????c d?? x??e tay v??o trong n?????c: "N??y ??n ??i."

Dung D??? b??i v??o l??ng b??n tay anh, nh??n nh?? ??ang ??n th???c ??n trong tay C??? Minh Ho??i, nh??ng th???t ra l?? h???p thu linh kh??.

C??? Minh Ho??i h??i cong kh??e m??i: "B???n h??? n??i m??y kh??ng ch???u ??n, nay tao cho ??n l???i vui nh?? th???, c?? b???n m??y c??n bi???t nh??n ng?????i cho ??n ???"

Dung D??? h?? m???m ng???m ng??n tay C??? Minh Ho??i.

????? cong b??n m??i C??? Minh Ho??i ng???ng l???i: "Nh??? ra."

Dung D??? nghe anh m???i l?? l???.

C??? Minh Ho??i m???t l???nh ??e d???a: "Kh??ng nh??? tao s??? b???t m??y l??m c?? kho."

Dung D??? v???n tr?? c??i m???t c??, h?? ai v???y.

C??? Minh Ho??i l???i ?????i c??u kh??c: "Sau n??y tao kh??ng ????t m??y ??n n???a."

L???n n??y Dung D??? l???p t???c nh??? ra.

V?? ????? t??nh chuy???n l??u d??i, gi??? c??? nh???n tr?????c ????.

C??? Minh Ho??i c???m th???y th?? v???: "M??y mu???n tao ????t m??y ??n ???" N???u kh??ng sao ch???u nghe l???i th??? ch???.

H???i xong anh c??ng c???m th???y bu???n c?????i, anh l???i ??ang nghi??m t??c n??i chuy???n v???i m???t con c??. C??? Minh Ho??i l???n nh?? v???y r???i, h??m nay m???i bi???t m??nh v???n c??n t??nh tr??? con, l??m chuy???n ng??y th?? nh?? v???y.

Th??? nh??ng kh??ng ng??? l??, ch?? c?? ch??p trong h??? l???i g???t ?????u.

C??? Minh Ho??i kh???ng l???i: "M??y c?? th??? nghe hi???u l???i tao n??i ???"

Dung D??? l???i ch???m ch???p g???t th??m c??i n???a.

V??? m???t C??? Minh Ho??i ch??m ch??, th??? th??m d?? h???i: "B??i ba v??ng xem?"

L??c n??y Dung D??? l???i kh??ng ch??t ph???n ???ng, ch??? nh??n ch???m ch???m C??? Minh Ho??i.

M???i chuy???n ?????u ph???i c?? ch???ng m???c, h???n ???? l??? ra nhi???u ch??? kh??c bi???t, ???? ????? ????? thu h??t s??? ch?? ??, n???u th??ng minh th??m x??u n???a e s??? l??m ng?????i ta s???.

Nghi ng??? trong m???t C??? Minh Ho??i d???n bi???n m???t, ngh?? ????y ch??? l???i l?? tr??ng h???p m?? th??i.

Anh l?? ng?????i theo ch??? ngh??a duy v???t, c??ng l???m l?? c???m th???y ch?? c?? ch??p n??y c?? ch??t th??ng minh.

"???????c." C??? Minh Ho??i k??m l??ng kh??ng ?????ng ch???t ch???t ?????u ch?? c??, "Sau n??y tao s??? th?????ng xuy??n t???i ????t m??y ??n."

Anh ?????ng d???y, c???m th???y h??m nay m??nh h??i k?? qu???c. B???nh s???ch s??? kh???i r???i ??? N???u kh??ng sao l???i ????t cho c?? ??n, c??n ?????ng v??o ?????u n??. B??nh th?????ng anh s??? kh??ng l??m chuy???n n??y.

M???t gi??y, hai gi??y, ba gi??y.

...

C??? Minh Ho??i kh??ng gi??? n???i v??? b??nh t??nh, ch???y v???t v??o nh?? v??? sinh m??? v??i n?????c, thoa x?? b??ng l??n ?????y tay ch?? r???a li??n t???c.

Qu??? nhi??n v???n r???t d??.

H???t ch????ng 4.')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (31, 16, 5, N'C?? ch??p v?????t v?? m??n - 4', 1, N'C??? Minh Ho??i n??i ???????c l??m ???????c, t??? ???? v??? sau li???n ?????m nhi???m vai tr?? cho Dung D??? ??n, m???i t???i ?????u t???i r???i th???c ??n, tr?? chuy???n v???i Dung D???.

Anh v???n m???c ch???ng s??? d?? nghi??m tr???ng, gh??t x??c c???m tr??n nh???t c???a c?? ch??p. Nh??ng r???i th???c ??n tr???? m???t n?????c th?? Dung D??? nh???t ?????nh kh??ng ch???u ??n, ph???i ??n tr???? tay C??? Minh Ho??i, mang bao tay c??ng kh??ng ???????c, v?? c??ng kh?? chi???u.

D?????i kh??ng ngh??? tuy???t th???c c???a Dung D???, b???nh s??? d?? c???a C??? Minh Ho??i b??? ??p tr??? th??nh l??c ???n l??c ph??t t??c. Khi cho c?? ??n th?? b??nh th?????ng m?? v???a ra kh???i h??? l???i bi???n th??nh t??n cu???ng r???a tay.

M???i l???n d?????i v??i n?????c ch?? tay ?????n tr???ng b???ch C??? Minh Ho??i ?????u kh??ng kh???i nh??n v??o g????ng ?????t tay l??n ng???c t??? h???i, t???i sao anh ph???i ????? ?? s???ng ch???t c???a m???t con c?? l??m g??? ????? n?? ch???t ????i th?? c?? sao ????u?

Nh??ng l???n sau khi v??o h??? b??i, th???y c?? ch??p sung s????????? b??i v??? ph??a m??nh, t??m tr???ng C??? Minh Ho??i l???i kh?? hi???u m?? thay ?????i, v???n c??? cam ch???u ????t n?? ??n.

Nh??n ch?? c?? nh??? vui m???ng v?? th???y m??nh, c??? ??? l???i v??o m??nh nh?? th???... C??? Minh Ho??i c???m th???y anh c?? th??? mi???n c?????ng ch???u ?????ng m???t ch??t.

Ch??? t???ch C??? h???n nhi??n kh??ng bi???t Dung D??? ch??? l?? th??m linh kh?? c???a anh th??i, h???n c??n ch???ng ????? ?? anh ngh?? g?? n???a k??a.

Cu???c s???ng c???a C??? Minh Ho??i r???t ????n ??i???u, ?????i v???i nh???ng ng?????i kh??c th?? kh??ng g?? ngo??i trao ?????i c??ng vi???c, c??ng kh??ng li??n l???c v???i ng?????i nh??. M???i ng??y Dung D??? ???????c ??n ch??t th???c ??n, h??t ch??t linh kh??, cu???c s???ng v???a gi???n d??? v???a vui v???.

Kh??ng, h???n kh??ng vui ch??t n??o h???t, h???n r???t mu???n bi???n th??nh ng?????i, th??? lu??n.

????ng ti???c m???i ng??y ch??? ???????c h??t m???t ch??t linh kh??, c??n c???n r???t nhi???u m???i c?? th??? bi???n th??nh ng?????i.

M???t ng??y ?????p tr???i, C??? Minh Ho??i ??ang ????t Dung D??? ??n, b???ng n??i: "N??y c?? nh???, h??nh nh?? m??y m???p l??n."

Dung D??? v???a nghe ???? kh??ng vui, hung h??ng v???y ??u??i, h???t n?????c ?????y m???t anh.

Mi m???i m???p l??n! Ch???ng qua l?? do h???n h??t nhi???u linh kh?? n??n c?? h??i tr?????ng b???ng th??i!

Qu???n ??o v?? m???t C??? Minh Ho??i ?????t s??ng, nh??ng kh??ng gi???n, ch??? c???p m???t d???n d??: "B??i nhi???u v??o, ??n ??t th??i, m??y n??n gi???m c???n r???i!"

????p l???i anh ch??nh l?? m???t l???n v???y ??u??i t???t n?????c n???a. Dung D??? v???n ch??a h???t gi???n, nh???y ra kh???i m???t n?????c, t??t th???ng l??n m???t C??? Minh Ho??i.

C??? Minh Ho??i kh??ng k???p ????? ph??ng b??? c?? ch??p d??nh l??n m???t. Gi???t n?????c trong su???t tr?????t xu???ng theo mi m???t anh tu???n c???a ng?????i ????n ??ng, ?????u tr???? l??ng mi. C??? Minh Ho??i ??en m???t, v???i v?? l???y kh??n l??ng b??n c???nh lau, m???t tay l???i v???t c?? ch??p t??? d?????i n?????c l??n, nghi???n r??ng nghi???n l???i: "Gan l???n r???i nh????"

C?? ch??p b??? ??p ra kh???i n?????c l???p t???c gi??y d???a, ????y ch??? l?? ph???n x??? c?? th???. Dung D??? l???i mong C??? Minh Ho??i ?????ng bu??ng tay, c??? c???m l??u m???t ch??t, t???ng gi??y t???ng ph??t ?????u l?? linh kh??.

Ti???c l?? ???????c c???m ch??t x??u ???? b??? qu??ng l???i v??o n?????c, Dung D??? b???t m??n nh???y ra, nh?? ghi???n tr?? n??y, l???i b???n ?????y n?????c l??n m???t C??? Minh Ho??i.

Mi c?? gan th?? c???m th??m l???n n???a coi! ?????u c?? l?? ra kh???i m???t n?????c, kh??ng ch??t ti???ng ?????ng ???m ??.

C??? Minh Ho??i nh??n n??: "Sao, kh??ng ph???c ???"

D?? sao tay c??ng ch???m v??o c?? r???i, n??n d?? th??m ch??t n???a c??ng ch??? sao. C??? Minh Ho??i d???t kho??t ''l???n ch???t ch??? s??? n?????c s??i'', nh?? Dung D??? mu???n, l???i v???t h???n l??n: "Qu???y n???a s??? ??n m??y."

M??i c?? ch??p m???p m??y.

????nh ?????ch t??m tr??m t??? t???n m???t ng??n, mi ??n ta, mi c??ng d??? ???ng nh???p vi???n.

C??? Minh Ho??i kh??ng nghe ???????c Dung D??? o??n th???m, d???y d??? xong, ?????ng t??c nh??? nh??ng th??? c?? v???: "M??y ngoan ??i, tao kh??ng ??n m??y."

Dung D??? l?????i ????? ?? ?????n anh, n???m tr???? m???t n?????c, ph??i b???ng gi??? ch???t.

C??? Minh Ho??i ch???t ch???t b???ng c??: "C?? nghe kh??ng?"

L???n n??y ch?? c?? l???i b??? ???n th???ng v??o trong n?????c.

C??? Minh Ho??i h???t h???n, ch???t r???i ???

Anh c?? v???t c?? ra qu?? l??u ????u nh???.

C??? Minh Ho??i v???t c?? l??n, m?? ?????ng nh?? th??? n??o ch?? c?? ch??p v???n kh??ng ?????ng ?????y.

... Ch???t th???t r???i ???

C??? Minh Ho??i m??m m??i, ??nh m???t l??e l??n ch??t h???i h???n, l???i h??i kinh ng???c b???n th??n v?? m???t con c?? m?? ??au bu???n ??y n??y.

D?? sao nh???ng ng??y qua c?? nh??? ???? ??em ?????n cho anh r???t nhi???u ni???m vui.

"Tao s??? ch??n c???t m??y t??? t???." C??? Minh Ho??i l???y ??i???n tho???i ch???p cho n?? t???m h??nh.

Dung D???:...

Ch???p nh???n c??ng nhanh gh?? nh???, nh?? m???y ng??y vui v??? s???ng chung ?????u l?? gi??? ???y.

????ng l?? lo??i ng?????i kh?? m?? n???y sinh t??nh c???m th???t l??ng v???i m???t con c??.

Th???a d???p C??? Minh Ho??i ??ang l?????t ??i???n tho???i, Dung D??? ''s???ng l???i'' nh???y ra kh???i n?????c, v??? bay ??i???n tho???i c???a C??? Minh Ho??i.

??i???n tho???i ''t??m'' m???t ti???ng r??i xu???ng n?????c.

C??? Minh Ho??i li???c n??: "Kh??ng ch???t ???"

Dung D???: ???, l??m mi th???t v???ng r???i.

C??? Minh Ho??i v???t ??i???n tho???i l??n: "V???y tao h???y ????n ngh??a trang cho th?? c??ng."

??i???n tho???i ch???ng n?????c, r??i xu???ng n?????c trong th???i gian ng???n th?? v???n c?? th??? d??ng. Dung D??? tinh m???t th???y ????u ch??? l?? m???, ?????n c??? v??ng hoa C??? Minh Ho??i c??ng ?????t xong c??? r???i.

Dung D???:...

??m, ????? b???c t??nh.

"C??n h???c gi??? ch???t ???" C??? Minh Ho??i th???m th??? ph??o, v??? nh??? l??n ?????u c??, "Sau n??y kh??ng cho m??y l??m th??? n???a, r???t ????ng s???, bi???t kh??ng?"

Dung D???: Mi c?? s??? ??? R?? r??ng mi c??n b??nh t??nh s???p x???p d??m tang cho ta k??a.

C??? Minh Ho??i quan s??t n??: "Hay l?? m??y ??? m???t m??nh qu?? c?? ????n, ng?????i ta th?????ng n??i c?? ch??p th??nh ????i, tao mua cho m??y th??m m???t ch?? c?? n???a l??m b???n nh???"

Dung D??? l???i d??? d???n ng???m ng??n tay anh.

?????ng c?? m??!

Ma v????ng th??? kh??ng bao gi??? ??? chung v???i m???t con c??, to??n b??? c??i h??? n??y, c??? c??i ngo??i tr???i n???a, ch??? c?? th??? l?? c???a h???n th??i!

Nh??n c?? h???i h??t ch??t linh kh??.

C??? Minh Ho??i cau m??y, ng??n tay b??? c?? ng???m l??m anh n???i da g??. Anh l???c l???c ng??n tay: "Nh??? ra."

Dung D??? kh??ng nh???, th??n c?? theo ng??n tay c???a C??? Minh Ho??i m?? l???c qua l???c l???i, c??n rung ????i ?????c ??. C??? Minh Ho??i d???t kho??t r??t tay v???, Dung D??? c??ng ngoi theo l??n m???t n?????c.

C??? Minh Ho??i nh??n ch?? c?? ch??p ????? ???? b??? nh???c l??n kh??ng trung m?? v???n kh??ng ch???u nh???, ????i m???t tr??n xoe c???a Dung D??? c??ng kh??ng ch???u y???u th??? tr???ng l???i.

M???t ng?????i m???t c?? tr???ng nhau h???i l??u, C??? Minh Ho??i th??? d??i: "???????c, kh??ng nu??i c?? kh??c, ch??? nu??i m??nh m??y th??i, ???????c ch??a."

L??c n??y Dung D??? m???i nh??? ra, ''??m'' m???t ti???ng r??i th???ng v??o trong n?????c.

H??t no linh kh?? r???i, th???t ra h???n c??ng s???p kh??ng ch???u ???????c, l??c n??y c??? c???n ng??n tay qu?? m??.

C??? Minh Ho??i c?????i: "C??n ghen n???a ch???, ??i l??m c?? h???p gi???m ???????c r???i ?????y." (ghen l?? ''??n gi???m'')

Dung D??? th???i bong b??ng, ???, h??t nhi???u linh kh?? qu??.

C??? Minh Ho??i: "N??y c?? nh???, th???t h??m m??? m??y kh??ng bu???n kh??ng lo, t??? do t??? t???i."

Dung D???: Ph???n.

???????ng ???????ng l?? ?????i ma v????ng, b??? m???t c??i v??ng phong ???n ph??p l???c th?? th??i ??i, l???i c??n b??? nh???t trong th??n m???t con c??, m???i ng??y ch??? c?? th??? b??i trong c??i h??? n??y, b???c b???i mu???n ch???t.

Kh??ng bu???n kh??ng lo, t??? do t??? t???i?

X??t mu???i v??o tim c??.

"T???i mai tao c?? ti???c x?? giao, n??n v??? r???t tr???, ng?????i gi??p vi???c s??? cho m??y ??n." C??? Minh Ho??i m???c k??? c?? ch??p c?? hi???u hay kh??ng, "Kh??ng ???????c b??? ??n."

Dung D??? kh??ng ch??t ph???n ???ng.

C??? Minh Ho??i s??? v???y n??: "C?? nh??? ??, c?? nghe kh??ng?"

Dung D??? mi???n c?????ng v???y ??u??i, t??? ?? bi???t r???i, nhanh lui ra ??i.

"V???y tao ??i nh??, ng??? ngon." V??? m???t C??? Minh Ho??i b??nh t??nh t???m bi???t n??, sau ???? ch???y nh?? ma ??u???i v??o ph??ng v??? sinh.

V??ng Huy???t Ng???c th???y to??n b??? qu?? tr??nh: ....

N?? c???m th???y ?????u ??c Ch??? th???n ?????i nh??n v???i ?????i ma v????ng nh?? b??? l??i v??? n??m ba tu???i v???y ??, ????ng l?? kh??ng n??? nh??n.

- --

Ng??y h??m sau qu??? nhi??n C??? Minh Ho??i kh??ng v??o h??? b??i, ng?????i gi??p vi???c t???i cho c?? ??n.

Dung D??? h???i h???t ?????p v??i mi???ng, sau ???? n??p trong g??c h??? ng???. Cu???c s???ng kh??ng c?? C??? Minh Ho??i ????ng l?? kh??ng c?? g?? ????ng mong ?????i.

M?????i hai gi??? khuya, m??n ????m bao tr??m t??? ph??a, tr??ng treo l?? l???ng gi???a tr???i.

??nh tr??ng x??m tr???ng xuy??n qua c???a s??? s??t ?????t, chi???u xu???ng h??? b??i th??nh n???a s??ng n???a t???i, xung quanh y??n t??nh kh??ng m???t ti???ng ?????ng.

?????t nhi??n c???a h??? b??i b??? ?????y ra, C??? Minh Ho??i b?????c ch??n l???o ?????o ??i t???i, m??i r?????u ?????y ng?????i, s???c m???t ????? ???ng b???t th?????ng. Anh v???i v??ng c???i ??o kho??c t??y trang, th??o c?? v???t, nh???y th???ng v??o trong h???.

Ti???ng v???t l???n r??i xu???ng h??? ????nh th???c Dung D??? ??ang ng???, ch?? c?? ch??p v???i v???t ra ch??? kh??c, t???o th??nh m???t g???n s??ng nho nh???.

C??? Minh Ho??i d???a v??o th??nh h???, c??? ng?????i ng??m trong n?????c l???nh l???o, ????? ???ng tr???? m???t m???i gi???m m???t ch??t. Anh c??i ?????u v???c n?????c l??n m???t, ti???ng th??? d???c d???n d???p ?????y g???i c???m. ??o s?? mi c???i hai n??t tr???? c??ng, gi???t n?????c d???c theo c???n c??? thon d??i l?????t qua y???t h???u, tr?????t v??o c??? ??o, m???t n???a ?????ng l???i tr???? x????ng quai xanh. ??o s?? mi ?????t nh???p d??nh s??t v??o ng?????i, ??m tr???n c?? th??? ho??n m???.

Dung D??? l??c n??y m???i nh??n ra: ????y l?? b??? b??? thu???c ???

C??? Minh Ho??i l?? ng?????i ????n ??ng v??ng trong l??ng ?????c th??n, m???i l???n ??i ti???c ?????u l?? ?????i t?????ng m?? m???i ng?????i m?? ?????c ???????c l??n gi?????ng m???t l???n, v?? lu??n c?? nh???ng ng?????i gan l???n th??ch l??m m???t v??i chuy???n th???c t??? gi???ng v???y.

C??? Minh Ho??i r???t c?? kinh nghi???m gi???i quy???t m???y chuy???n n??y, nh??ng ai ng??? c???n th???n nh?? th??? m?? t???i nay v???n d??nh. ?????i ph????ng c??ng kh??ng d??m l??m qu?? m???c, thu???c n??y ch??? tr??? h???ng, kh??ng ph???i lo???i kh??ng l??m s??? ch???t n??n c?? th??? v??? nh?? ng??m n?????c l???nh.

Anh l???nh m???t b??? ?????i ph????ng l???i, l??i xe v??? nh??, nh???t th???i ?????u n??ng l??n, kh??ng v??o ph??ng t???m m?? nh???y th???ng v??o h??? b??i.

C??? Minh Ho??i nh???m m???t, ch??? c??i n??ng tr???? ng?????i d???u xu???ng. Dung D??? th???y v???y, li???n v???i v?? b??i qua, d??n v??o eo C??? Minh Ho??i.

C??n ch??? c??i chi n???a? ????y ch??nh l?? c?? h???i ????? h??t linh kh??.

Tr?????c kia Dung D??? c??ng l???m l?? ch???m tay C??? Minh Ho??i th??i, ????y l?? l???n ?????u ti??n c?? th??? ti???p x??c th??n th??? v???i C??? Minh Ho??i.

Dung D??? ch???u ????? cu???c s???ng trong h??? r???i, ????m nay h???n ph???i d??nh lu??n tr???? ng?????i C??? Minh Ho??i m???i ???????c.

C??? Minh Ho??i c???m gi??c tr???? b???ng d??nh v??o th??? g?? ???? l??nh l???nh, th??n th??? n??ng ran l???p t???c tho???i m??i h??n nhi???u, ch??n m??y nh??u ch???t c??ng h??i gi??n ra. Lo???i thu???c n??y c??? r??ng m?? ch???u ?????ng th?? kh??ng kh?? nh??ng c?? t??c d???ng ph???, l?? s??? ng??? nh?? ch???t.

Ng?????i ????n ??ng ng???i trong ch??? n?????c c???n, hai tay g??c l??n th??nh h???. N???a ng?????i tr???? ?????t nh???p, tr???? b???ng c??n c?? ch?? c?? ch??p ?????, t??? eo tr??? xu???ng ng??m trong n?????c, hai ch??n du???i th???ng.

Anh nh???m m???t, h?? h???p ?????u ?????u, hi???n nhi??n l?? ???? ng???.

Dung D???: Ng??? trong h??? b??i, anh ta kh??ng s??? ch???t ??u???i ??.

V??ng Huy???t Ng???c: N?????c ch??? n??y ch??? c?? n???a m??t.

Dung D???: Th?? sao, t?? xu???ng c??ng ch???t nh?? th?????ng.

V??ng Huy???t Ng???c: Anh ta ng??? ng???i k??a.

Dung D???: Tao c??n tr???ng m???t m?? ng??? ????y.

V??ng Huy???t Ng???c: ... Anh c??n t??? h??o gh?? nh???.

Qua m???t l??c sau, g????ng m???t n??ng ran c???a C??? Minh Ho??i m???i tan h???t ????? ???ng, bi???n th??nh t??i nh???t l???nh l???o.

Dung D???: Th??? n??y c?? l??? thu???c h???t t??c d???ng r???i ?????y.

V??ng Huy???t Ng???c: ???.

Dung D???: Thu???c n??y c?? l??y kh??ng?

V??ng Huy???t Ng???c: Kh??ng bi???t.

Dung D???: T???i sao tao c??ng c???m th???y c?? th??? h??i n??ng?

V??ng Huy???t Ng???c: Anh mu???n bi???n th??nh ng?????i ?????y.

Th???i gian ???? l??u nh?? v???y, c??? ?????t qu??ng h???p thu linh kh??, c???ng th??m t???i nay ti???p x??c g???n v???i C??? Minh Ho??i, linh kh?? m?? Dung D??? t??ch g??p ???????c c??ng ???? t???i m???c bi???n th??nh ng?????i.

V??ng Huy???t Ng???c v???a n??i xong, Dung D??? ???? c???m th???y to??n th??n n??ng l??n, trong h??? b??i hi???n ra m???t d???i ??nh s??ng ????? r???c ch??i m???t.

Ch??? ??nh s??ng d???n bi???n m???t, ch?? c?? ch??p b??n c???nh C??? Minh Ho??i ???? kh??ng th???y n???a, thay v??o ???? l?? m???t thanh ni??n xinh ?????p n???m tr???? ng?????i anh.

L??m c?? ch??p g???n m???t th??ng, ?????t nhi??n bi???n v??? th??nh ng?????i, Dung D??? c??n hoi ch??a th??ch ???ng ???????c. H???n n????ng ??nh tr??ng nh??n v??? ???nh ng?????c tr???? m???t n?????c, nh??n th???y m???t g????ng m???t xa l??? xinh ?????p l???nh l??ng.

????y l?? dung m???o c???a nguy??n ch???.

Ng?????i thanh ni??n c?? n?????c da tr???ng ng???n, g????ng m???t tinh x???o, m??i ????? m???ng, c??n c?? m???t ?????u t??c ??en ??ng, hai b??n tai l?? v???y c?? m???ng nh?? c??nh ve. Tuy???n nh??n ng???* tr???? b???ng r?? r??ng, da m???n m??ng m???m m???i, tr???? c??? tay thon g???y ??eo v??ng Huy???t Ng???c. Dung D??? c???p m???t, th???y t???ng l??n s??ng g???n l??n t??n tr???? m???t n?????c, che ??i l???p v???y ????? di???m l???.

Dung D???: "?????t."

N???a ng?????i d?????i c???a h???n l?? ??u??i c??.

V??ng Huy???t Ng???c: N??i chuy???n v??n minh.

Dung D???: V??ng nh???, sao ch??? bi???n ???????c m???t n???a h????

V??ng Huy???t Ng???c: Tao t??n X??ch Kim Di???u Nh???t Ho??n.

Dung D???: Tr???ng ??i???m.

V??ng Huy???t Ng???c: Tr???ng ??i???m ch??nh l?? t??i t??n X??ch Kim Di???u Nh???t Ho??n.

N?? nh???t ?????nh ph???i l??m ?????i ma v????ng g???i ????ng t??n, kh??ng th??? ????? t??n n?? sai l??ng nh??ch v???y ???????c.

Dung D??? kh??ng nh??n n???a: Xem ra l?? kh??ng ????? linh kh??.

V??ng Huy???t Ng???c:...

Mi bi???t c??u tr??? l???i r???i mi c??n h???i l??m g??!

Dung D??? nh??n v??? ph??a C??? Minh Ho??i ??ang y??n ???n ng???: Tao ??m h???n c??? ????m, kh??ng tin kh??ng bi???n ???????c ????i ch??n.

V??ng Huy???t Ng???c: Anh c?? th??? th???.

Ch??? th???n ?????i nh??n t??? ????a ?????n c???a, n?? c??n c?? th??? l??m g?? ch????

Dung D??? l???p t???c qu???n l??n ng?????i C??? Minh Ho??i. Hai tay ??m l???y b??? vai ng?????i ????n ??ng, t???a h???n v??o ng???c anh, ngay c??? ??u??i c?? c??ng v???t ngang qua ????i anh, d??nh kh??ng c??n m???t ch??? h???.

Ch???nh th??nh c??i t?? th??? ????, linh kh?? truy???n t???i qu??? nhi??n v?? c??ng nhi???u.

Dung D??? h???i: Gi??? c?? th??? truy???n k???ch b???n ch??a?

V??ng Huy???t Ng???c: Nguy??n ch??? t??n Tr?? Ng??.

M???t h???i y??n t??nh.

Dung D???: Sau ???? ????u?

V??ng Huy???t Ng???c: H???t r???i.

Dung D??? nh??n ch???m ch???m v??ng tay ?????, ????y m???t hi???n l??n ch??t l???nh l???o: M??y n??i sau khi bi???n th??nh ng?????i s??? bi???t k???ch b???n.

V??ng Huy???t Ng???c v???n l???i: B??y gi??? anh l?? ng?????i h????

Dung D??? nh??n l?????t qua ??u??i c??.

Th??i ???????c, h???n kh??ng ph???i.

L???nh l???o trong m???t tan ??i, Dung D??? l?????i bi???ng n???m nho??i tr???? ng?????i C??? Minh Ho??i, trong m???t s??ng n?????c d???p d???n, l??? ra ch??t u??? o???i. To??n th??n ???????c bao ph??? trong linh kh?? v?? c??ng ???m ??p d??? ch???u, r???t nhanh h???n c??ng bu???n ng???.

Nh???ng linh kh?? n??y c?? th??? gi??p h???n duy tr?? h??nh ng?????i, nh??ng kh??ng th??? l???y l???i ph??p l???c cho h???n, ph???i c???n n???i ??an. Cho n??n b??y gi??? Dung D??? nh?? ng?????i ph??m v???y, s??? c???m th???y ????i b???ng v?? m???t m???i.

Dung D??? mi???n c?????ng ng??p m???t c??i: Tao ng??? ????y, hy v???ng s??ng ra c?? th??? l??m ng?????i.

- --

Ph??a ????ng d???n hi???n l??n ??nh s??ng tr???ng b???c.

C??? Minh Ho??i kh?? kh??n m??? m???t ra, v???a say r?????u ng??? ??? h??? b??i m???t ????m h???u qu??? l?? c??? ng?????i cho??ng v??ng, ?????u v???a n???ng v???a m?? h???, ch???c ch???n l?? b??? c???m r???i.

C??? Minh Ho??i v???a t???nh d???y ???? b??? s???c n???ng ???? tr???? ng?????i l??m gi???t m??nh, c??? ng?????i c???ng ng???c, nh??n xu???ng th?? th???y m???t thanh ni??n ??ang th??n m???t ng??? say trong ng???c m??nh.

C??? Minh Ho??i: "..."

Tr???i qua bao nhi??u s??ng gi?? g???p qua ????? th??? chuy???n v???n tuy???t ?????i gi??? ???????c b??nh t??nh, n??n v??? m???t C??? Minh Ho??i v???n kh??ng thay ?????i g?? m???y.

Anh lo??ng tho??ng nh??? l???i t???i h??m qua b??? m???t ng?????i ph??? n??? b??? thu???c, v???y c??n ng?????i thanh ni??n n??y l?? sao? Ch???ng l??? m???i tho??t ???????c hang s??i ???? v??o mi???ng c???p?

N???u th???t l?? nh?? v???y, ??nh m???t C??? Minh Ho??i l???nh l???o.

Anh s??? kh??ng b??? qua cho b???t k??? k??? n??o d??m t??nh k??? m??nh.

??i???u ki???n C??? Minh Ho??i xu???t s???c, mu???n leo l??n gi?????ng anh tr??? ph??? n??? ra c??n c?? gay, n??n ?????i v???i chuy???n n??y anh c??ng ch???ng ng???c nhi??n m???y. Anh nh??n xung quanh, ph??t hi???n h??nh nh?? ????y l?? h??? b??i nh?? m??nh...

Anh d???n ng?????i v??? h??? b??i qu???y ???

C??? cho l?? say r?????u c??n b??? chu???c thu???c ??i, nh??ng C??? Minh Ho??i tin ch???c m??nh s??? kh??ng l??m chuy???n hoang ???????ng nh?? v???y. Anh quan s??t thanh ni??n trong ng???c. ????ng l??c n??y, Dung D??? c???a m??nh, t??c ??en tu???t xu???ng, l??? ra g????ng m???t tr???ng n??n di???m l??? c??ng v???y trong su???t b??n tai.

Con ng????i C??? Minh Ho??i co r??t, to??n th??n c???ng ng???c.

L??c n??y anh m???i ????? ?? tr???? ????i b??? ????, kh??ng ph???i hai ch??n ng?????i m?? l?? m???t ??u??i c?? m??u ????? r???c xinh ?????p.

G???i d???a ?????t nhi??n ?????ng ?????y, Dung D??? cau c??, b???t m??n nh??? gi???ng ph??n n??n: "?????ng c?? ?????ng, ta c??n ch??a ng??? ?????."

C??? Minh Ho??i nh??n h???n ch??m ch??, trong ?????u n???y ra m???t suy ngh?? kh??ng t?????ng. Anh th??m d?? h???i -----

"... C?? nh??? ???"

Dung D??? nh???m hai m???t t???a v??o ng???c anh, gi???ng ???m ???: "???m."

V??? b??nh t??nh tr???? m???t C??? Minh Ho??i n???t to???c.

Anh c??ng th???t m???t ti???ng "?????t".

H???t ch????ng 5.')
GO
INSERT [dbo].[Chapter] ([id], [volumeId], [no], [title], [status], [content]) VALUES (32, 16, 6, N'C?? ch??p v?????t v?? m??n - 5', 1, N'Th??? b??? s???p ????? c??n s???m h??n nh??n lo???i b??? hu??? di???t, ch??nh l?? th??? gi???i quan c???a C??? Minh Ho??i.

Th??? h???i hai m????i t??m n??m ki??n ?????nh theo ch??? ngh??a duy v???t, v???a t???nh d???y ???? th???y m???t ch??ng ti??n c?? n???m tr???? ng?????i m??nh, b???n s??? c?? c???m t?????ng th??? n??o?

Nghe th?? l??ng m???n gi???ng truy???n c??? t??ch thi???u nhi, nh??ng th???c t??? c???nh n??y c??n b???n l?? chuy???n kinh d??? ????m khuya.

C??? Minh Ho??i b???t m???nh d???y, Dung D??? ??ang n???m tr???? ng?????i anh b???t ng??? b??? tu???t xu???ng, ?????u ?????ng v??o th??nh h???.

"Shhh---" Dung D??? b??? ??au ?????n t???nh, m??? m???t n???i gi???n, "L??i ra ngo??i ch??m!"

H???n ng??? m?? th???y cu???c s???ng ca h??t nh??n nh?? m???y n??m tr?????c, ch??a u???ng ???????c ng???m r?????u h???n y??u th??ch ???? b??? c??n ??au l??m t???nh.

Chuy???n n??y m?? ??? tr?????c kia, c?? k??? d??m l??m phi???n gi???c ng??? c???a Ma v????ng b??? h???, ?????ng h??ng s???ng s??t ??i ra ngo??i.

H???n c?? t??nh g???t ng???.

Dung D??? r???t t???c gi???n, nh??ng m???i s??ng s???m c??n ng??i ng??? l?????i bi???ng, gi???ng ch?? c?? ch??p m???m m???i ??m tai, nghe h???t nh?? ??ang l??m n??ng.

C??? Minh Ho??i nh??n h???n: "C???u mu???n ch??m ai?"

Dung D???: "..."

Cu???i c??ng h???n c??ng t???nh ho??n to??n.

H??nh nh?? trong kh??ng trung c?? m???t ????n qu??? bay qua.

Dung D??? c??i ?????u nh??n n???a ng?????i d?????i, s??? s??? v???y c?? b??n tai.

H???n v???c n?????c l??n r???a m???t, nh??n k??? l???i l???n n???a.

??u??i v???n c??n, v???y c?? c??ng th???.

???????c l???m, bi???n h??nh th???t b???i r???i.

Dung D??? b??nh t??nh ch???p nh???n hi???n th???c: "Kh??ng, t??i v???a n???m m??."

C??? Minh Ho??i ch???m r??i n??i: "T??i c??ng c?? c???m gi??c m??nh ??ang m??."

Dung D??? n??i: "???o gi??c th??i, anh kh??ng n???m m??."

Thanh ni??n g????ng m???t ?????p ?????, s??ng m???t d???p d???n, n???a ng?????i t????????? ?????????????????, m??i t??c d??i x??a tung tr???? m???t n?????c, n???a ng?????i d?????i n?????c c??ng th??m y??u m???, l??? v??? c??m d??? ?????t ??t.

C??? Minh Ho??i nh??n ch??m ch?? m???y gi??y, sau ???? quay m???t sang ch??? kh??c: "C???u ????? t??i y??n t??nh ch???c l??t."

Dung D??? ki??n nh???n ch??? h???n ti??u ho??, m???t ph??t sau h???i: "T???nh ch??a?"

C??? Minh Ho??i t??? v??? c??n ch??a t???nh l???m, h???t s???c b??nh t??nh n??i: "Tr?????c ti??n c???u xu???ng kh???i ng?????i t??i ????."

??u??i c?? l???n nh?? th??? c??n ??ang ?????t tr???? ng?????i anh, sao b??nh t??nh n???i.

Dung D??? nh??n anh, th??n th??? m???m m???i kh??ng x????ng l???i s?? t???i, ??m l???y c??? C??? Minh Ho??i, h??i th??? n??ng ???m l??m ng?????i ta m???t ????? tim ?????p d??? d???i.

H???n l??m ?????ng t??c quy???n r?? nh???t, nh??ng gi???ng ??i???u l???i v?? c??ng ch??nh tr???c: "Kh??ng, anh ????? t??i ??m m???t ch??t."

??m c??? ????m sao c??n kh??ng m???c ch??n nh????

Nh???t ?????nh l?? ch??a ????? th???i gian, ph???i ??m th??m ch??t n???a.

Ch??ng ti??n c?? xinh ?????p ch??? ?????ng mu???n ??m, to??n th??n C??? Minh Ho??i c???ng ?????, b??n tai ?????y gi???ng n??i n??ng n???u c???a c???u thanh ni??n.

"N??y c?? nh???." C??? Minh Ho??i ??nh m???t n?? tr??nh, t???n su???t ch???p m???t c??ng nhanh, bi???u hi???n c???a s??? h???t ho???ng: "Lo??i ng?????i c?? c??u, nam nam th??? th??? b???t th??n."

Anh ho??i nghi thu???c ch??a h???t t??c d???ng, n???u kh??ng sao l???i v?? m???t c??i ??m m?? tim ?????p r???n r??ng c??? l??n ch???.

- -- Nh???m nh?? ?????y, ng?????i b??nh th?????ng m?? th???y c?? ch??p bi???n th??nh ng?????i th?? tim l???i ch??? ?????p th??nh th???ch l??n.

Dung D??? ng?????c l??n nh??n th???ng v??o m???t anh: "C??u n??y anh t??? ngh?? ra ch??? g??." H???n ch??? nghe nam n??? th??? th??? b???t th??n th??i.

Hai th???ng ????n ??ng ??m nhau x??u th?? l??m sao?

N???u kh??ng ph???i v?? bi???n th??nh ng?????i nhanh th?? c??n l??u m???i ??m, h???n c??ng ch??? vui v??? g?? ????y.

C??? Minh Ho??i c???ng ????? h???i: "V???y c???u mu???n ??m t???i khi n??o?"

Dung D??? n??i: "Kh??ng bi???t." Sao h???n bi???t ???????c khi n??o s??? m???c ch??n.

"T??i ?????ng kh??ng n???i." Dung D??? b??? sung.

Th?? ra l?? th???. C??? Minh Ho??i nh??? nh??m: "V???y c???u c?? th??? n???m trong n?????c ?????i."

Dung D??? ??m ch???t anh: "T??i c???m th???y trong ng???c anh tho???i m??i h??n."

N??y l?? n??i th???t, ???????c v??y trong ?????ng linh kh?? c???m gi??c s????????? v?? c??ng.

C??? Minh Ho??i ngh???n h???ng ch???p m???t, c?? ch??t kh??ng ch???ng ????? n???i.

"C???u c?? th??? bi???n ra hai ch??n kh??ng?" C??? Minh Ho??i nh??n xu???ng ??u??i c?? xinh ?????p, "B??? ng?????i kh??c th???y... s??? r???t phi???n."

Dung D???: "T???m th???i kh??ng th???."

C??? Minh Ho??i: "V???y bi???n v??? l???i?"

Dung D??? th??? r???i: "C??ng kh??ng th???. T??i bi???n kh??ng ???????c."

H???n kh??ng kh???ng ch??? ???????c tr???ng th??i hi???n gi??? c???a m??nh, bi???n h??nh c??ng b??? ?????ng n???t. Kh??ng bi???t khi n??o m???i c?? th??? bi???n ho??n to??n, c??ng kh??ng bi???t khi n??o s??? bi???n v??? l???i.

Chuy???n n??y c?? ch??t kh?? gi???i quy???t.

C??? Minh Ho??i h??t m???t h??i, m?? t???i di ?????ng trong t??i ??o kho??c b??n b???, cho m???y ng?????i gi??p vi???c ngh??? m???y ng??y tr?????c.

Kh??ng th??? ????? ng?????i th??? ba th???y Dung D??? th??? n??y.

Dung D??? nh??n anh b??nh t??nh n??i chuy???n ??i???n tho???i xong, gi???ng ??i???u l???nh nh???t nh?? c??, g????ng m???t nh?? n??i b??ng kh??ng bao gi??? bi???n s???c.

V???a c??p ??i???n tho???i anh m???i l??? v??? m???t nh???c ?????u.

C??? Minh Ho??i xoa xoa huy???t th??i d????ng: "T???m th???i xu???ng kh???i ng?????i t??i ??i, t??i ??i thay qu???n ??o ????."

Ng??m n?????c l???nh m???t ????m, s??ng d???y c??n b??? gi???t m??nh, c???m gi??c kh??ng ???n ch??t n??o.

Dung D??? nghe v???y c??ng ??m ch???t h??n, d??ng h??nh ?????ng t??? ?? c??? tuy???t.

Ai c??ng ?????ng h??ng chia c???t h???n v???i linh kh??.

C??? Minh Ho??i ????ng l?? h???t c??ch v???i ch??ng ti??n c?? d???a d???m v??o m??nh nh?? th???, b???t ?????c d?? n??i: "Nghe l???i n??o."

Dung D??? t??y h???ng n??i: "Kh??ng nghe ?????y."

C??? Minh Ho??i theo th??i quen h?? d???a: "Coi ch???ng t??i l??m c???u th??nh c?? kh----"

"Anh c??ng ch???u ??n nh???." ??u??i m???t Dung D??? cong cong, "Sao n??o? N???a th??n tr???? ????? l???i c??n n???a th??n d?????i g???m x????ng ???"

C??? Minh Ho??i: "..."

Anh t?????ng t?????ng m???t ch??t, h??nh ???nh ?????p qu??, c?? h??i bu???n n??n.

H??n n???a con c?? n??y c??n l???n nh?? th???, ?????i v???i ng?????i b??? d??? ???ng c?? nh?? C??? Minh Ho??i th?? l?????ng th???t n??y c??ng ????? ch???t, ??n xong c?????i h???c v??? T??y Thi??n lu??n.

Nh??ng c??? gi???ng co trong n?????c th??? n??y c??ng kh??ng ph???i chuy???n hay.

C??? Minh Ho??i ??m ngang Dung D???. V???a ra kh???i m???t n?????c, ??u??i c?? hi???n ra, l???p v???y d?????i ??nh n???ng tr??? n??n r???c r??? l???p l??nh, n?????c xu??i theo ??u??i c?? ch???y xu???ng. Ch??ng ti??n c?? t??c d??i ??m c??? ng?????i ????n ??ng, c???p m???t, g??c nghi??ng tinh x???o, c???nh t?????ng ?????p h???t s???c, k???t h???p v???i BGM l??ng m???n c??ng c?? th??? tr??? th??nh h??nh ???nh kinh ??i???n c???a c??? phim ??i???n ???nh v?? truy???n h??nh---

C??? Minh Ho??i l???o ?????o, su??t n???a ??m kh??ng n???i, t?? l???i v??o n?????c.

Dung D??? s??? h??i ??m ch???t c??? anh: "Anh c???n th???n ch??t coi!" C??? Minh Ho??i t?? th?? kh??ng sao, h???n ch??? s??? m??nh b??? t?? d???p ?????u th??i.

C??ng may C??? Minh Ho??i k???p th???i ?????ng v???ng.

Dung D??? th??? ph??o, than phi???n n??i: "S???c y???u th???..." Ng?????i ph??m n??o c??ng y???u v???y ???

C??? Minh Ho??i c??ng m??i: "T??i n??i c???u gi???m c??n, c???u th?? t??ng h??n 50 kg trong m???t ????m, c??n ch?? t??i s???c y???u."

T??i c??ng kh??ng ch?? c???u b???n.

T???t nhi??n l???i n??y C??? Minh Ho??i bi???t ??i???u kh??ng n??i ra.

Ai l???i ngh?? ??u??i c?? n???ng nh?? v???y.

C??? Minh Ho??i v?? c??ng m??u thu???n v???i v???y c?? tr??n nh???t, m?? c??i ??u??i n??y nhi???u v???y nh?? th??? l??m anh su??t n???a qu??ng ng?????i ??i lu??n.

C?? th??? nh???n m?? ??m Dung D??? ???? t???t l???m r???i.

C??? Minh Ho??i b?????c l??n b???, r??ng kh??ng nh??n xu???ng d?????i, s??? v???a nh??n th???y v???y c?? l???i n??m ng?????i trong ng???c xu???ng.

Ch??a bao gi??? Dung D??? c???m th???y ?????t li???n tuy???t v???i nh?? b??y gi??? --- H???n th???t s??? kh??ng mu???n ng??m trong n?????c n???a.

B???n th??? c???a h???n l?? l???a, n???m l??u trong n?????c kh??ng h???n l?? kh?? ch???u, nh??ng tuy???t ?????i c??ng ch???ng tho???i m??i g?? m???y.

L???n n??y r???i kh???i n?????c kh??ng c?? tri???u ch???ng kh?? th???, b??y gi??? h???n c?? l??? m??i, kh??ng c??n ph???i h?? h???p b???ng mang n???a.

V??ng Huy???t Ng???c: Thanh ti???n ????? tr???ng th??i ???? m???, xin ch?? ?? ki???m tra.

Trong ?????u Dung D??? hi???n th??m hai thanh ti???n ?????, m???t c??i m??u xanh lam m???t c??i m??u ?????.

M??u xanh lam ??ang 100%, m??u ????? 60%.

V??ng Huy???t Ng???c: M??u xanh lam l?? ngu???n n?????c. C?? ch??p tinh kh??ng th??? r???i n?????c qu?? l??u, c???n th?????ng xuy??n b??? sung n?????c m???i c?? th??? duy tr?? h??nh ng?????i. H??n 50% l?? tr???ng th??i an to??n, c?? th??? duy tr?? h??nh ng?????i. Th???p h??n 50% l?? tr???ng th??i thi???u n?????c, bi???n th??nh ng?????i c??, c???n ph???i b??? sung n?????c. D?????i 20% l?? tr??? v??? nguy??n h??nh. V??? 0% l?? ch???t, ????n h???n t???t, nhi???m v??? th???t b???i. Xin ch?? ?? b??? sung n?????c k???p th???i. B??y gi??? l?????ng n?????c c???a k?? ch??? l?? 100%.

Dung D??? ??? trong n?????c ?????i l??u nh?? v???y, t???t nhi??n l?? th???a n?????c. Nh??ng ngh?? ?????n ??? th??? gi???i n??y c??n ph???i n??m l???n b???y l?????t ti???p x??c v???i n?????c, h???n ???? c???m th???y v?? c??ng ngh???t th???.

N?????c l???a b???t dung, c??i th??? gi???i n??y ch???c ch???n ??ang ch??i h???n.

V??ng Huy???t Ng???c ti???p t???c gi???ng gi???i: M??u ????? l?? linh kh??. Linh kh?? h??n 80% c?? th??? duy tr?? h??nh ng?????i, h??n 50% duy tr?? tr???ng th??i ng?????i c??, th???p h??n 50% s??? bi???n l???i th??nh c?? ch??p. Linh kh?? b??y gi??? c???a k?? ch??? l?? 60%. L?????ng n?????c v?? linh kh?? ph???i c??ng ?????t ti??u chu???n m???i c?? th??? bi???n th??nh ng?????i, m???i ti???p t???c c??? g???ng.

Dung D??? suy t??, c??? g???ng l??u nh?? v???y m?? ch??? m???i ???????c 60%.

V???y c?? ngh??a l?? b??y gi??? h???n kh??ng th??? r???i kh???i C??? Minh Ho??i m???t gi??y m???t ph??t n??o, n???u kh??ng b???t c??? l??c n??o c??ng c?? th??? b??? bi???n l???i th??nh c?? ch??p.

- -

???????ng cong c???m C??? Minh Ho??i c??ng th???ng, m??m m??i ??m Dung D??? xu???ng l???u ba, ch???y th???ng t???i ph??ng ng???.

Anh ???? v??ng c???a ph??ng t???m, ??i v??o xong d??ng l??ng ????ng l???i, nh?? b??? ph???ng m?? v???i v??ng th??? Dung D??? xu???ng b???n t???m, m??? v??i n?????c trong b???n ra.

C??? M??nh Ho??i l???y kh??n l??ng s???ch tr???? k??? xu???ng: "Bi???t t??? t???m kh??ng?"

Dung D??? n??i: "Kh??ng bi???t."

Th???t ra l?? bi???t, nh??ng h???n s??? kh??ng ch???a b???t k??? c?? h???i ti???p x??c v???i C??? Minh Ho??i.

M?? c?? h???i l?? ph???i t??? b???n th??n t???o ra.

C??? Minh Ho??i nh??u ch???t m??y, chu???n b??? lau ng?????i g???i ?????u cho Dung D???.

??o s?? mi ?????t nh???p d??nh v??o ng?????i r???t kh?? ch???u, C??? Minh Ho??i d???t kho??t c???i ra, l??? ra c?? th??? m???c v??o th?? g???y m?? c???i ra th?? m??i kh??ng.

Dung D??? ''ch???c'', t??m m??i c?? l???n ?????y.

H???n n???m trong b???n t???m, ?????u t???a v??o th??nh b???n, m??i t??c d??i r?? xu???ng g???ch s??? s??ng b??ng.

C??? Minh Ho??i nh??n, t??c n??y ??t nh???t c??ng d??i ?????n eo.

"T??c n??y c?? th??? c???t kh??ng?"

C??i ????? d??i n??y, g???i xong c??ng l??m anh cho??ng v??ng.

Th???c ra th?? t??c do m???t ph???n c???a c?? ch??p bi???n th??nh, c???t l?? Dung D??? toi m???ng.

Dung D??? n??i: "C?? th???."

D?? sao th??n th??? n??y c??ng kh??ng ph???i th??n th??? c???a Tr?? Ng??, do h??? th???ng sao ch??p m?? th??i, x??? l?? th??? n??o l?? t??y h???n.

Y??u tu luy???n th??nh tinh c??ng ph???i c???n ??t nh???t tr??m n??m. Tr?? Ng?? l?? m???t con c?? t??? th???i c??? ?????i, n??n m???i nu??i t??c d??i ????? nh???p gia t??y t???c, ?????n th???i hi???n ?????i r???i th?? kh??ng c???n n???a.

C??? Minh Ho??i ???????c ?????ng ??, lanh l??? c???m k??o l??n, ''xo???t xo???t'' m??i t??c d??i li???n r??i xu???ng. Anh l???y c??i gh??? nh??? ng???i xu???ng, x???t m???t ch??t d???u g???i l??n tay g???i ?????u cho Dung D???.

C??? ?????i n??y anh ch??a ph???c v??? ai bao gi???, n??n ?????ng t??c kh??ng qu?? th??nh th???o, nh??ng l???c ?????o m??t xa r???t tho???i m??i, linh kh?? t??? ?????u ng??n tay kh??ng ng???ng truy???n v??o da ?????u ????? l???i c???m gi??c v?? c??ng tho???i m??i. Dung D??? nh???m m???t h?????ng th??? ph???c v???, r???t mu???n vote cho 5 sao khen ng???i.

C??? Minh Ho??i c???m th???y v???a qu??i d??? v???a hoang ???????ng.

????ng l?? hi???n th???c huy???n huy???n.

B??y gi??? anh ??ang g???i ?????u cho m???t con c?? ch??p.

Dung D??? kh??ng ch???u ??? trong h??? b??i, c??ng kh??ng th??? ????? h???n ra v???y n?????c ?????y nh??. Ng?????i gi??p vi???c ???? ngh???, kh??ng ai d???n v??? sinh, n?????c kh???p n??i th??? n??y s??? l??m C??? Minh Ho??i s??? d?? ph??t ??i??n m???t.

V?? kh??ng ????? m??nh ??i??n, anh ch??? c?? th??? nh???n b???nh l???i m?? g???i ?????u cho Dung D???.

C??? Minh Ho??i g???i ?????u cho Dung D??? xong, ????? h???n ng???i d???y, l???y m??y s???y s???y t??c cho h???n.

V???a m??? m??y s???y l??n, Dung D??? l???p t???c c???nh gi??c m??? m???t ra: "????y l?? th??? g???"

M???c d?? tr?????c kia h???n ???? ??i qua kh?? nhi???u th??? gi???i, nh??ng c??ng ch??? c?????i ng???a xem hoa, ch??? y???u l?? ch??i r?????t b???t v???i Ch??? th???n. N??n Dung D??? c??ng kh??ng h???n l?? bi???t m???y th??? ????? sinh ho???t n??y.

Tr?????c kia h???n c??n ph??p l???c, m???t c??i ph???t tay l?? gi???i quy???t ???????c r???i, l??m g?? c???n th??? ????? ch??i n??y.

C??? Miinh Ho??i gi???i th??ch: "????y l?? m??y s???y t??c, d??ng ????? s???y t??c, l??m t??c c???u nhanh kh?? h??n."

???????ng cong c??ng th???ng c???a Dung D??? l??c n??y m???i d???u l???i.

Ch??? ?????n khi t??c g???n kh??, C??? Minh Ho??i l???i lau ng?????i cho h???n.

C??? Minh Ho??i si???t ch???t kh??n l??ng lau ng?????i cho Dung D???, n??i ?????n ng???c l?? ?????n ng???c, k??u gi?? tay l?? gi?? tay, r???t ngoan ????ng kh??ng.

- -- D?? nhi??n ph???i ngoan, t???m m???t l???n m?? linh kh?? ???? t??ng 5%.

Dung D??? ph??t hi???n, ch??? ti???p x??c m?? c??ng ri??ng t?? c??ng th??n m???t th?? linh kh?? l???i t??ng c??ng nhanh.

H???n c??n ph??t hi???n, h??nh nh?? C??? Minh Ho??i m???t tr?? nh???.

H??nh ?????ng c???a ng?????i n??y kh??ng ph?? h???p v???i tuy???n c?? c???a th??? gi???i n??y, h??n n???a tr???? ng?????i c??n c?? linh kh?? kh??ng n??n t???n t???i, ??i???u n??y cho th???y C??? Minh Ho??i kh??ng ph???i ng?????i ??? ????y.

Nh??ng n???u l?? ng?????i xuy??n kh??ng, ???? g???p ???????c ????? lo???i chuy???n k?? l??? c???a mu??n v??n th??? gi???i r???i th?? sao l???i t??? v??? kh???????p?? s??? khi bi???t c??n c?? y??u tinh t???n t???i ch???.

Rung ?????ng trong m???t C??? Minh Ho??i khi nh??n th???y h???n kh??ng ph???i gi???, ho??n to??n l?? d??ng v??? c???a m???t ng?????i b??nh th?????ng khi ch???ng ki???n chuy???n v?????t qua hi???u bi???t nh??n lo???i.

M???t ng?????i kh??ng b??nh th?????ng, l???i v?? nguy??n nh??n n??o ???? m?? tr??? th??nh ng?????i b??nh th?????ng s???ng ??? ????y. Chuy???n n??y r???t th?? v???.

Dung D???: "Anh ta ch???c kh??ng ph???i b??? Th???i Kh??ng Qu???n L?? b???t l???i, x??a tr?? nh??? n??m v??o th??? gi???i nh??? ????? tr???ng ph???t ?????y ch????"

V??ng Huy???t Ng???c: Anh ??o??n xem.

N?? th??ng minh h??n r???i, s??? kh??ng b??? qua b???t k??? c?? h???i n??o ????? ?????i ma v????ng ''??o??n''.

Dung D???: "Tao ??o??n kh??ng ph???i."

V??ng Huy???t Ng???c: ????ng hay sai t??i c??ng kh??ng cho anh bi???t.

Dung D??? kinh ng???c: "M??y m???i ??i n???p th??m th??ng minh ????ng kh??ng?"

V??ng Huy???t Ng???c: ?? ??.

Kh??ng mu???n ????? ?? h???n.

- --

Vai l??ng thanh ni??n tr???ng n??n, c???ng tay thon d??i, C??? Minh Ho??i lau qua, kh??ng c??n ch??t b???n n??o.

N???u nh?? b??? qua ??u??i c?? d?????i n?????c, th?? hai ng?????i tr??ng gi???ng nh?? m???t ????i v??? ch???ng gi?? trong c??c gia ????nh b??nh th?????ng.

L??c lau ?????n tr?????c ng???c, C??? Minh Ho??i h???i: "C???u c?? t??n kh??ng?"

Dung D??? ng?????c m???t l??n: "Tr?? Ng??."

"Ng?? ??? ????y l?? c?? trong ao ???" C??? Minh Ho??i ng???m m???t ch??t, "????n gi???n tr???c ti???p, v???y sau n??y t??i g???i c???u l?? C?? Nh??? (Ti???u Ng??) nh??."

Dung D??? c??ng kh??ng s???a cho h???n l?? Ng?? n??y c?? ch???m th???y.

(Ng?? m?? CMH n??i l?? c?? (???), c??n Ng?? trong t??n Tr?? Ng?? l?? c??u c?? (???) c?? ch???m thu??? (???). V?? c??? hai ?????u ?????c l?? y??.)

D?? sao t??n n??o c??ng kh??ng ph???i, h???n l?? ''D???'', ?????c thanh ba*.

(D??? (???) c?? ba c??ch ?????c l?? y??, y??, y??. T??n c???a Dung D??? l?? R??ngy??, y?? thanh ba.)

C??? Minh Ho??i lau xu???ng eo Dung D???, xu???ng ch??t n???a l?? b??? ph???n khu???t sau n?????c.

Ch??? d?????i eo C??? Minh Ho??i kh??ng bi???t n??n l??m th??? n??o, c??ng c?? ?? tr??nh ??i.

"????m qua t??i u???ng say." C??? Minh Ho??i n??i gi???m n??i tr??nh, "Ch???c l?? kh??ng l??m g?? c???u ch????"

Dung D??? n??ng c??i ??u??i ????? ch??i c???a m??nh l??n: "Anh c???m th???y anh c?? th??? l??m g?? ???????c t??i?"

Ch??n c??n kh??ng c??, mu???n l??m c??i g?? th?? c??ng c?? ch??? ????t v??o ????u.

C??? Minh Ho??i: "...Coi nh?? t??i ch??a n??i g??."

Dung D??? l???i ?????p ??u??i xu???ng, b???n n?????c ?????y m???t C??? Minh Ho??i.

Kh??e mi???ng C??? Minh Ho??i gi???t m???t c??i, l???p t???c nh???m m???t ????? kh??ng b??? n?????c b???n v??o.

Anh l???i nh??? t???i l??c Dung D??? c??n l?? m???t ch?? c?? ch??p, c??ng r???t th??ch ?????p ??u??i b???n n?????c ?????y m???t anh.

L??c ???? anh c??n c?? th??? x??ch ??u??i c?? l??n d???y d??? m???t phen.

B??y gi???... C??? Minh Ho??i nh??n ch??ng ti??n c?? c?? th??n h??nh x???p x??? m??nh.

X??ch kh??ng n???i n???a.

B??y gi??? ch??? c?? th??? ??m c??ng ch??a c?? nh??? th??i.

C??? Minh Ho??i suy ngh?? b???y b???, ?????ng t??c tr???? tay c??ng l???n x???n, lau s?? m???y c??i r???i th??i. Anh x??? n?????c trong b???n t???m ra, nh??n ??u??i c?? kh??ng bi???t ?????t tay ch??? n??o m???i ???n.

L???p v???y kia c?? l???p l??nh xinh ?????p ?????n c??? n??o, th?? anh c??ng ch??? th???y r???n t??c g??y.

Dung D??? c??ng kh??ng l??m kh?? anh: "T??i t??? l??m."

C??? Minh Ho??i: "Ch???ng ph???i c???u kh??ng bi???t lau ng?????i ???"

Dung D???: "Nh??n m???t l???n l?? nh???."

C??? Minh Ho??i: "T??i t?????ng k?? ???c c???a c?? c?? 7 gi??y th??i."

Dung D??? du???i ??u??i: "V???y t??i kh??ng nh???, anh l??m ??i."

C??? Minh Ho??i qu??? quy???t n??m kh??n cho h???n.

Dung D??? ch??? nh???o m???t ti???ng, lau kh?? n?????c tr???? ??u??i c??, ng???i trong b???n t???m dang hai tay: "??m."

C??? Minh Ho??i li???c ??u??i c??, l???i kh??ng d??m nh??n th???ng v??o: "C???u c?? th??? t??? b?? ra ngo??i kh??ng?"

Dung D???a: "Anh ??ang n??i ti???ng ng?????i ?????y ???"

C??? Minh Ho??i kh??ng bi???t l??m sao, ch??? c?? th??? c??i ng?????i b??? Dung D??? l??n gi?????ng, sau ???? l???y m???t c??i ??o s?? mi m???c cho h???n, cu???i c??ng l???y remote m??? ti vi: "C???u ng???i ????y xem ti vi ??i, t??i ??i t???m."

Dung D???: "???."

C??? Minh Ho??i l???p t???c ??i v??o ph??ng t???m ????ng c???a l???i.

Anh c???m gi??c to??n th??n m??nh th???t b???n, r???t c???n m???t l??? r???a t???i.

L???n t???m n??y kh?? l??u, Dung D??? xem xong ba t???p phim r???i m?? ti???ng n?????c ch???y trong ph??ng t???m v???n ch??a t???ng d???ng l???i.

Dung D??? v???a xem tivi v???a t??n g???u v???i v??ng Huy???t Ng???c: "Ti???n n?????c nh?? anh ta ch???c cao l???m."

C?? ch??? nh?? s??? d?? kinh kh???ng, gi??? c??n th??m c?? ch??p tinh c???n th?????ng xuy??n b??? sung n?????c, ti???n n?????c s??? cao l???m ????y.

V??ng Huy???t Ng???c: Kh??ng sao, anh ta nhi???u ti???n.

Dung D??? ng???i ?????i tr???? gi?????ng, nh??n thanh gi?? tr??? n?????c l???i gi???m 1%, c??n 99%. Linh kh??...

Gi?? tr??? linh kh?? gi???m c??n 51%.

Dung D??? kh???????p?? s???: "Linh kh?? ti??u hao nhanh v???y ???"

D???a theo c??i t???c ????? n??y, e l?? ch???ng bao l??u n???a h???n l???i tr??? th??nh m???t con c??.

V??ng Huy???t Ng???c: ????? duy tr?? tr???ng th??i ng?????i c?? s??? ti??u hao m???t l?????ng l???n linh kh??, bi???n th??nh ng?????i ti??u hao c??n nhi???u h??n. K?? ch??? ch?? ??, n???u bi???n th??nh c?? l??c kh??ng ??? trong n?????c, gi?? tr??? n?????c s??? gi???m r???t nhanh, nguy hi???m t??nh m???ng.

Ch??? c?? l??c l?? c?? ch??p, linh kh?? t??ch ???????c s??? kh??ng gi???m. Gi?? tr??? linh kh?? ?????t 100% s??? kh??ng th??? t??ch th??m ???????c n???a. Cho n??n Dung D??? ph???i ????ng l??c h???p thu linh kh?? tr???? ng?????i C??? Minh Ho??i, t???t nh???t l?? kh??ng ???????c t??ch ra, nh?? v???y m???i b???o v??? ???????c t??nh m???ng.

N??i ????n gi???n th?? ????y l?? tr??i bu???c ho??n to??n.

Th???y gi?? tr??? linh kh?? s???p gi???m xu???ng 50%, m?? c???a ph??ng t???m l???i kh??ng c?? ch??t ?????ng t??nh g??.

Dung D??? ch???ng c??n l??ng d??? xem tivi, quay ?????u nh??n ch???m ch???m c??nh c???a nh?? mu???n xuy??n qua c???a nh??n ng?????i b??n trong: "Sao anh ta c??n ch??a t???m xong? M???t l???n t???m l??u v???y ???"

N???u kh??ng ph???i ??u??i c?? kh??ng ti???n ??i l???i, h???n l??m g?? quan t??m c?? ??ang t???m kh??ng, c??? x??ng th???ng v??o ??m h??t linh kh?? l?? ???????c.

L??u th??m x??u n???a h???n s??? b??? bi???n th??nh c?? m???t!

V??ng Huy???t Ng???c: Kh??ng h???n.

Dung D??? kh??ng tin: "Nh??ng anh ta ???? t???m c??? m???t ti???ng ?????ng h??? r???i. Theo th???i gian ??? ????y ?????i ra, th?? l?? hai ti???ng r???i ?????y."

V??ng Huy???t Ng???c: Anh ta ??ang t???m l???n th??? b???y.

Dung D???:...

????ng l?? t???t s??? d?? trong truy???n thuy???t.

H??n l?? l??c linh kh?? ??ang ??? m???c 50%, c???a ph??ng t???m m???.

C??? Minh Ho??i t???m su???t hai ti???ng, cu???i c??ng c??ng t???nh t??o l???i. Anh thay qu???n ??o ng???, h??t s??u m???t h??i, m??? c???a ra, m???t tay gi?? l??n: "Ch??ng ta n??i chuy???n m???t ch??t------"

M???t b??ng ng?????i nh??o th???ng t???i.

"Kh??ng c?? g?? ????? n??i!" Dung D??? g???p g??p ??m ch???t c???ng eo anh, "Cho t??i ??m ch??t."

Tay C??? Minh Ho??i ??ang gi?? l??n c???ng ????? gi???a kh??ng trung.

H???t ch????ng 6.')
GO
SET IDENTITY_INSERT [dbo].[Chapter] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 
GO
INSERT [dbo].[Comment] ([id], [bookId], [userId], [comment], [sonOf], [replyTo], [createdAt], [editedAt], [status]) VALUES (1, 1, 2, N'hehe', NULL, NULL, CAST(N'2022-10-15T23:13:00.507' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Comment] ([id], [bookId], [userId], [comment], [sonOf], [replyTo], [createdAt], [editedAt], [status]) VALUES (2, 1, 109, N'Quite simply, this is one of the best novels of the year. It''s a thriller in the best tradition of Alfred Hitchcock and layered with brilliantly written characters.', NULL, NULL, CAST(N'2022-10-17T10:32:06.783' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Comment] ([id], [bookId], [userId], [comment], [sonOf], [replyTo], [createdAt], [editedAt], [status]) VALUES (3, 1, 3, N'In my mind, any book that takes me 3 months and 20 different tries to read is not worth 3 stars, especially a book written by an author I already respect. And I am not kidding, for me the first half of Gone Girl was a PURE TORTURE to read.', 2, 2, CAST(N'2022-10-17T10:36:06.177' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Comment] ([id], [bookId], [userId], [comment], [sonOf], [replyTo], [createdAt], [editedAt], [status]) VALUES (4, 1, 3, N'I hate Amy.', 2, 3, CAST(N'2022-10-17T10:37:41.260' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Comment] ([id], [bookId], [userId], [comment], [sonOf], [replyTo], [createdAt], [editedAt], [status]) VALUES (5, 17, 2, N'Actually good!', NULL, NULL, CAST(N'2022-10-23T21:21:04.430' AS DateTime), NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
INSERT [dbo].[Favourite] ([uid], [bid]) VALUES (2, 1)
GO
INSERT [dbo].[Favourite] ([uid], [bid]) VALUES (2, 5)
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (0, CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (1, CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (2, CAST(1496.47 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (3, CAST(4120.33 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (4, CAST(1442.86 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (5, CAST(1079.29 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (6, CAST(3782.48 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (7, CAST(3407.86 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (8, CAST(7827.57 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (9, CAST(2443.45 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (10, CAST(9.17 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (11, CAST(5982.25 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (12, CAST(909.46 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (13, CAST(3551.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (14, CAST(6174.18 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (15, CAST(77.97 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (16, CAST(2703.23 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (17, CAST(455.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (18, CAST(5027.96 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (19, CAST(4319.66 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (20, CAST(4195.68 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (21, CAST(7731.47 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (22, CAST(5349.61 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (23, CAST(5313.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (24, CAST(2078.36 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (25, CAST(6675.17 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (26, CAST(1440.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (27, CAST(14.59 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (28, CAST(760.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (29, CAST(6765.91 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (30, CAST(7622.32 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (31, CAST(826.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (32, CAST(85.16 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (33, CAST(3136.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (34, CAST(76.44 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (35, CAST(4839.84 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (36, CAST(5480.93 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (37, CAST(3678.42 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (38, CAST(4267.66 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (39, CAST(5559.76 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (40, CAST(981.02 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (41, CAST(8808.18 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (42, CAST(4875.06 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (43, CAST(8112.23 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (44, CAST(2829.23 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (45, CAST(6999.18 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (46, CAST(6558.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (47, CAST(7931.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (48, CAST(7476.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (49, CAST(4480.66 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (50, CAST(1196.33 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (51, CAST(3107.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (52, CAST(1721.74 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (53, CAST(7169.71 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (54, CAST(2465.22 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (55, CAST(8525.55 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (56, CAST(1163.63 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (57, CAST(1910.84 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (58, CAST(1578.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (59, CAST(2177.29 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (60, CAST(5623.95 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (61, CAST(5093.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (62, CAST(8543.68 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (63, CAST(5424.55 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (64, CAST(1068.78 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (65, CAST(2659.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (66, CAST(6317.44 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (67, CAST(531.91 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (68, CAST(4332.51 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (69, CAST(5425.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (70, CAST(8037.13 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (71, CAST(6357.76 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (72, CAST(3767.05 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (73, CAST(7528.66 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (74, CAST(7135.03 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (75, CAST(979.24 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (76, CAST(1645.65 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (77, CAST(5195.25 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (78, CAST(6283.85 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (79, CAST(4977.79 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (80, CAST(5043.27 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (81, CAST(381.53 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (82, CAST(5080.89 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (83, CAST(16.69 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (84, CAST(3547.69 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (85, CAST(3475.33 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (86, CAST(1805.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (87, CAST(7012.19 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (88, CAST(6935.14 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (89, CAST(1641.78 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (90, CAST(1300.46 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (91, CAST(7175.78 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (92, CAST(3341.84 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (93, CAST(6665.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (94, CAST(8094.17 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (95, CAST(1064.11 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (96, CAST(4197.52 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (97, CAST(8879.19 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (98, CAST(5057.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (99, CAST(3718.89 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (100, CAST(1627.63 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (101, CAST(4261.23 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (102, CAST(4800.82 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (106, CAST(1085.23 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (109, CAST(205.67 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (110, CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (111, CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (37075223, CAST(1013.68 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (51173456, CAST(4708.24 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (74952141, CAST(967.37 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (139454019, CAST(2601.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (318071247, CAST(2773.44 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (386636643, CAST(4743.82 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (431618205, CAST(2455.83 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (446972780, CAST(868.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (473152984, CAST(4025.39 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (679671431, CAST(362.52 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (850401454, CAST(4467.16 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (917355251, CAST(4226.73 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (955966322, CAST(3608.38 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (972439339, CAST(575.23 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (1145993637, CAST(2866.27 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (1167357241, CAST(4561.42 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (1283714042, CAST(4677.83 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (1318334801, CAST(1650.11 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (1331967611, CAST(961.05 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (1332569623, CAST(2736.31 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (1380002937, CAST(3917.54 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (1422712096, CAST(3589.39 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (1601270613, CAST(1553.94 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (1836390590, CAST(3744.16 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (1971979391, CAST(969.63 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (1976122113, CAST(4400.31 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (2384611197, CAST(2457.42 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (2437453828, CAST(1322.84 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (2519495624, CAST(2990.61 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (2619470944, CAST(4899.25 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (2670916914, CAST(4310.07 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (2680701419, CAST(1136.64 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (2765599235, CAST(1192.15 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (2793178405, CAST(3422.86 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (2948873856, CAST(1918.69 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (2955140061, CAST(2312.28 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (2997019069, CAST(291.88 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (3016661812, CAST(2820.45 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (3424019427, CAST(4911.65 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (3473387652, CAST(1244.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (3572954814, CAST(583.42 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (3905247198, CAST(1754.22 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (3908116429, CAST(4443.57 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (4146405242, CAST(3724.57 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (4482504141, CAST(1070.37 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (4519725304, CAST(4555.48 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (4678472703, CAST(2749.56 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (4681142538, CAST(1451.98 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (4964763819, CAST(3480.18 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (5138125456, CAST(3009.44 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (5159802194, CAST(4299.11 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (5254587583, CAST(2721.74 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (5355923867, CAST(982.88 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (5419266462, CAST(534.61 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (5429986684, CAST(2718.72 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (5475360879, CAST(4401.64 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (5547914765, CAST(1315.24 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (5549015036, CAST(4094.62 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (5557555461, CAST(1671.08 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (5576484273, CAST(4683.13 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (5887723221, CAST(5033.03 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (5909459634, CAST(206.46 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (5944525984, CAST(197.62 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (5988347845, CAST(1447.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (6026989470, CAST(1279.26 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (6068574838, CAST(4195.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (6438403365, CAST(2582.19 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (6442457323, CAST(2906.24 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (6469848160, CAST(3998.92 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (6479146192, CAST(4970.04 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (6582769227, CAST(1292.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (6597026015, CAST(4771.56 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (6620691933, CAST(3481.68 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (6952777387, CAST(1415.27 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (6997812930, CAST(4785.24 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (7173493771, CAST(2964.03 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (7183046243, CAST(1746.56 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (7244526304, CAST(2703.83 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (7263590060, CAST(2002.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (7410852963, CAST(80.61 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (7661491077, CAST(4502.04 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (7748861664, CAST(2917.27 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (7997053302, CAST(2972.38 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (8042711543, CAST(2522.15 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (8074129941, CAST(3073.11 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (8142936699, CAST(3675.78 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (8185325202, CAST(2783.86 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (8227851142, CAST(3124.42 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (8455971628, CAST(1162.28 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (8491633133, CAST(837.44 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (8500602522, CAST(1975.43 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (8531866336, CAST(2978.71 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (8599753652, CAST(4145.11 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (8731359880, CAST(3342.79 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (8808419770, CAST(4254.97 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (8881596476, CAST(3353.19 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (8910545709, CAST(2329.29 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (9135370392, CAST(4930.45 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (9215737984, CAST(3930.19 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (9335327530, CAST(4865.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (9430503622, CAST(4504.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (9872231353, CAST(4068.72 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (9876543210, CAST(244.05 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (9880788429, CAST(2740.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (9953524311, CAST(4946.61 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (9961111214, CAST(3763.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (10028714113, CAST(627.22 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (10108825850, CAST(1273.39 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (36950928992, CAST(2102.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (38285536832, CAST(1163.58 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (38724088357, CAST(591.05 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (41127767675, CAST(386.68 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (42534310518, CAST(2839.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (48071110244, CAST(1548.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (52301432232, CAST(1574.07 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (53097505521, CAST(518.58 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (56320572041, CAST(2727.35 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (60960915696, CAST(2478.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (66030440862, CAST(1444.67 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (79280419196, CAST(2384.96 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (81845189051, CAST(2746.01 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (89408126469, CAST(3820.44 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (97120071759, CAST(3615.84 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (101737393877, CAST(1059.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (103278207654, CAST(792.69 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (107031370718, CAST(2317.86 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (112411308346, CAST(1930.19 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (115287764998, CAST(1341.49 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (120853157158, CAST(101.32 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (122177522637, CAST(636.78 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (126440290567, CAST(3332.12 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (126503365507, CAST(2229.33 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (140475581701, CAST(692.93 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (142937696721, CAST(2497.83 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (149820848609, CAST(2315.04 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (151028402272, CAST(2969.12 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (152277997337, CAST(1206.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (158889565670, CAST(514.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (164375994213, CAST(2242.73 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (169294791218, CAST(810.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (174443321075, CAST(578.43 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (181523712733, CAST(1289.54 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (187897646152, CAST(2144.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (188177285964, CAST(921.62 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (199500188635, CAST(3101.33 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (203997350124, CAST(2578.13 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (207470283267, CAST(3806.54 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (209556166150, CAST(1946.06 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (209570001706, CAST(3772.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (213521244362, CAST(3947.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (227284879629, CAST(3762.78 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (231384165180, CAST(2799.71 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (232884349933, CAST(2278.49 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (236343429829, CAST(1981.86 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (236820266935, CAST(3598.18 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (237953430347, CAST(98.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (239309661578, CAST(3717.66 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (240889419410, CAST(2408.74 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (249992160549, CAST(905.87 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (250911429689, CAST(1319.74 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (254285772452, CAST(2241.19 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (262276321519, CAST(382.17 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (265245750110, CAST(3623.79 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (266121001335, CAST(695.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (273592303768, CAST(1560.31 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (285097785185, CAST(3933.28 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (287479779076, CAST(3579.49 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (290232933183, CAST(1469.63 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (315247907184, CAST(1718.74 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (322276924762, CAST(2272.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (324296175302, CAST(589.83 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (325783078690, CAST(3285.68 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (336158726699, CAST(840.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (336892621328, CAST(945.17 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (337513137816, CAST(1415.22 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (343420998738, CAST(3117.55 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (343845419707, CAST(401.38 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (351112611051, CAST(2672.39 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (352601308982, CAST(999.28 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (354824976571, CAST(3728.57 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (358782879216, CAST(2328.16 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (358822285150, CAST(378.48 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (359686743844, CAST(3256.72 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (376056683973, CAST(1941.16 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (377635932537, CAST(2121.85 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (379919804407, CAST(2453.54 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (385230566996, CAST(2785.31 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (385826325842, CAST(3103.24 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (386632492873, CAST(2574.62 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (391772588198, CAST(2692.54 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (392641792498, CAST(3979.04 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (393303298853, CAST(1124.97 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (400939899392, CAST(1050.96 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (418403880497, CAST(918.15 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (419653580434, CAST(825.47 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (430294349517, CAST(3507.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (430294857995, CAST(1681.88 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (430544819514, CAST(3492.71 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (435485221093, CAST(1351.56 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (435520516679, CAST(784.68 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (436793751216, CAST(1719.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (439147026401, CAST(484.06 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (441776164259, CAST(2106.53 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (442403217350, CAST(160.72 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (460132919932, CAST(1130.09 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (466638737912, CAST(28.57 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (471679850803, CAST(2795.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (491002702053, CAST(1494.49 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (493636572380, CAST(840.67 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (508925563656, CAST(1323.43 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (509069112420, CAST(2998.54 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (509663821365, CAST(2482.12 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (515764677007, CAST(2050.27 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (526857701876, CAST(3981.97 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (527442113653, CAST(1737.23 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (531389704974, CAST(3580.85 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (533581768089, CAST(1086.84 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (538441503541, CAST(1646.29 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (539222392333, CAST(311.27 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (539691899706, CAST(588.84 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (549774601361, CAST(2754.81 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (558666225544, CAST(3520.23 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (564106066444, CAST(750.93 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (565260147089, CAST(2477.67 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (567670273019, CAST(3867.52 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (572487169216, CAST(25.53 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (575633364565, CAST(3142.45 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (578098751297, CAST(3536.88 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (578829806493, CAST(2216.28 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (581523864399, CAST(781.54 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (582655711819, CAST(1374.82 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (592796329443, CAST(3292.56 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (594065092479, CAST(3466.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (598958801803, CAST(1825.49 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (601529762710, CAST(3308.58 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (604600101293, CAST(3915.81 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (605057996983, CAST(3813.15 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (607358308340, CAST(1911.33 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (610880290584, CAST(2877.82 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (611794509420, CAST(3814.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (615036392323, CAST(3235.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (619136362013, CAST(1422.61 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (624452533539, CAST(2789.71 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (628234675672, CAST(2448.07 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (628938127662, CAST(3897.55 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (635892814748, CAST(2255.36 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (648916271688, CAST(2632.26 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (650905394193, CAST(1465.48 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (653375173447, CAST(3935.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (655288902107, CAST(1304.58 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (657010967037, CAST(3701.03 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (672860905964, CAST(3276.39 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (674420418742, CAST(2964.09 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (675244595871, CAST(3613.85 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (675261076995, CAST(3533.86 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (675913287543, CAST(2680.86 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (686423328185, CAST(3369.96 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (707530192293, CAST(1193.29 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (713060829477, CAST(2213.11 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (720486988035, CAST(1399.69 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (741762191662, CAST(1536.13 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (743894265434, CAST(842.31 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (746257518271, CAST(7.32 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (759078918355, CAST(2427.13 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (776000584391, CAST(2316.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (792850415956, CAST(721.97 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (805608027221, CAST(672.55 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (805749058436, CAST(2866.52 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (809557958533, CAST(1919.76 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (810577190687, CAST(3075.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (813992959234, CAST(2758.25 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (819037236035, CAST(2967.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (821924822637, CAST(386.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (824153521557, CAST(559.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (825143075035, CAST(2892.25 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (828934338739, CAST(194.49 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (839372661076, CAST(2682.17 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (844584438318, CAST(2328.11 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (846620874005, CAST(716.31 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (853196387942, CAST(1170.18 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (866076402536, CAST(1990.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (872583500031, CAST(961.33 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (875377823249, CAST(3844.24 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (878967953571, CAST(1127.58 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (888888888888, CAST(123.45 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (901338596510, CAST(1318.27 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (902663344777, CAST(3846.06 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (903213176862, CAST(1838.54 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (904597945260, CAST(28.64 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (919592383256, CAST(1957.09 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (922451159291, CAST(1967.94 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (931536916174, CAST(3123.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (950478619471, CAST(3868.31 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (955067293038, CAST(1574.11 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (961407135267, CAST(2256.21 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (963262289282, CAST(3759.74 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (965397232308, CAST(0.89 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (967843195380, CAST(789.27 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (970108759513, CAST(2454.94 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (978683745760, CAST(830.31 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (982017699533, CAST(1447.45 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (985256672758, CAST(1165.42 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (989712775405, CAST(2723.93 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (998193093125, CAST(1430.44 AS Decimal(10, 2)))
GO
INSERT [dbo].[Payment_Account] ([accountNumber], [balance]) VALUES (998433188504, CAST(3219.33 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Payment_Method] ON 
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (45678, 1, 888888888888, N'Bank 1', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (45681, 1, 7410852963, N'Bank 2', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (45684, 2, 9876543210, N'Bank 1', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47112, 1, 1, N'Wallet of admin', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47115, 1, 2955140061, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47118, 2, 2, N'Wallet of vinh', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47121, 2, 9880788429, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47127, 3, 6469848160, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47130, 4, 4, N'Wallet of user_no2', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47133, 4, 5254587583, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47136, 5, 5, N'Wallet of user_no3', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47139, 5, 679671431, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47142, 6, 6, N'Wallet of user_no4', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47145, 6, 4482504141, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47148, 7, 7, N'Wallet of user_no5', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47151, 7, 9961111214, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47154, 8, 8, N'Wallet of user_no6', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47157, 8, 1976122113, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47160, 9, 9, N'Wallet of user_no7', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47163, 9, 1145993637, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47166, 10, 10, N'Wallet of user_no8', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47169, 10, 8185325202, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47172, 11, 11, N'Wallet of user_no9', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47175, 11, 6952777387, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47178, 12, 12, N'Wallet of user_no10', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47181, 12, 5557555461, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47184, 13, 13, N'Wallet of user_no11', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47187, 13, 7183046243, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47190, 14, 14, N'Wallet of user_no12', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47193, 14, 2670916914, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47196, 15, 15, N'Wallet of user_no13', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47199, 15, 1380002937, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47202, 16, 16, N'Wallet of user_no14', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47205, 16, 5355923867, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47208, 17, 17, N'Wallet of user_no15', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47211, 17, 5944525984, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47214, 18, 18, N'Wallet of user_no16', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47217, 18, 8808419770, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47220, 19, 19, N'Wallet of user_no17', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47223, 19, 51173456, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47226, 20, 20, N'Wallet of user_no18', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47229, 20, 5475360879, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47232, 21, 21, N'Wallet of user_no19', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47235, 21, 1601270613, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47238, 22, 22, N'Wallet of user_no20', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47241, 22, 5549015036, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47244, 23, 23, N'Wallet of user_no21', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47247, 23, 5419266462, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47250, 24, 24, N'Wallet of user_no22', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47253, 24, 9335327530, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47256, 25, 25, N'Wallet of user_no23', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47259, 25, 4146405242, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47262, 26, 26, N'Wallet of user_no24', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47265, 26, 9872231353, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47268, 27, 27, N'Wallet of user_no25', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47271, 27, 9215737984, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47274, 28, 28, N'Wallet of user_no26', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47277, 28, 6026989470, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47280, 29, 29, N'Wallet of user_no27', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47283, 29, 431618205, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47286, 30, 30, N'Wallet of user_no28', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47289, 30, 1318334801, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47292, 31, 31, N'Wallet of user_no29', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47295, 31, 5909459634, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47298, 32, 32, N'Wallet of user_no30', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47301, 32, 1283714042, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47304, 33, 33, N'Wallet of user_no31', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47307, 33, 7263590060, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47313, 34, 4519725304, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47316, 35, 35, N'Wallet of user_no33', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47319, 35, 8500602522, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47322, 36, 36, N'Wallet of user_no34', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47325, 36, 3908116429, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47328, 37, 37, N'Wallet of user_no35', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47331, 37, 37075223, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47334, 38, 38, N'Wallet of user_no36', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47337, 38, 3473387652, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47340, 39, 39, N'Wallet of user_no37', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47343, 39, 6597026015, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47346, 40, 40, N'Wallet of user_no38', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47349, 40, 473152984, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47352, 41, 41, N'Wallet of user_no39', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47355, 41, 1167357241, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47358, 42, 42, N'Wallet of user_no40', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47361, 42, 2519495624, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47364, 43, 43, N'Wallet of user_no41', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47367, 43, 5159802194, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47370, 44, 44, N'Wallet of user_no42', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47373, 44, 8142936699, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47376, 45, 45, N'Wallet of user_no43', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47379, 45, 2997019069, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47382, 46, 46, N'Wallet of user_no44', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47385, 46, 6442457323, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47388, 47, 47, N'Wallet of user_no45', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47391, 47, 6068574838, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47394, 48, 48, N'Wallet of user_no46', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47397, 48, 4964763819, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47400, 49, 49, N'Wallet of user_no47', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47403, 49, 139454019, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47406, 50, 50, N'Wallet of user_no48', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47409, 50, 1836390590, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47412, 51, 51, N'Wallet of user_no49', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47415, 51, 7997053302, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47418, 52, 52, N'Wallet of user_no50', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47421, 52, 8881596476, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47424, 53, 53, N'Wallet of user_no51', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47427, 53, 955966322, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47430, 54, 54, N'Wallet of user_no52', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47433, 54, 7748861664, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47436, 55, 55, N'Wallet of user_no53', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47439, 55, 6479146192, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47442, 56, 56, N'Wallet of user_no54', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47445, 56, 1332569623, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47448, 57, 57, N'Wallet of user_no55', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47451, 57, 2793178405, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47454, 58, 58, N'Wallet of user_no56', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47457, 58, 9135370392, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47463, 59, 4678472703, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47466, 60, 60, N'Wallet of user_no58', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47469, 60, 5988347845, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47472, 61, 61, N'Wallet of user_no59', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47475, 61, 3424019427, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47478, 62, 62, N'Wallet of user_no60', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47481, 62, 8731359880, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47484, 63, 63, N'Wallet of user_no61', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47487, 63, 8910545709, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47490, 64, 64, N'Wallet of user_no62', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47493, 64, 9430503622, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47499, 65, 5576484273, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47502, 66, 66, N'Wallet of user_no64', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47505, 66, 4681142538, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47508, 67, 67, N'Wallet of user_no65', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47511, 67, 8074129941, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47514, 68, 68, N'Wallet of user_no66', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47517, 68, 318071247, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47520, 69, 69, N'Wallet of user_no67', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47523, 69, 8042711543, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47526, 70, 70, N'Wallet of user_no68', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47529, 70, 8227851142, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47532, 71, 71, N'Wallet of user_no69', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47535, 71, 8491633133, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47538, 72, 72, N'Wallet of user_no70', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47541, 72, 8531866336, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47544, 73, 73, N'Wallet of user_no71', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47547, 73, 446972780, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47550, 74, 74, N'Wallet of user_no72', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47553, 74, 6438403365, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47556, 75, 75, N'Wallet of user_no73', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47559, 75, 2765599235, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47562, 76, 76, N'Wallet of user_no74', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47565, 76, 9953524311, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47568, 77, 77, N'Wallet of user_no75', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47571, 77, 917355251, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47574, 78, 78, N'Wallet of user_no76', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47577, 78, 7661491077, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47580, 79, 79, N'Wallet of user_no77', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47583, 79, 8599753652, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47586, 80, 80, N'Wallet of user_no78', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47589, 80, 1331967611, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47592, 81, 81, N'Wallet of user_no79', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47595, 81, 972439339, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47598, 82, 82, N'Wallet of user_no80', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47601, 82, 6620691933, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47604, 83, 83, N'Wallet of user_no81', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47607, 83, 3016661812, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47610, 84, 84, N'Wallet of user_no82', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47613, 84, 3905247198, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47616, 85, 85, N'Wallet of user_no83', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47619, 85, 7173493771, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47622, 86, 86, N'Wallet of user_no84', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47625, 86, 6997812930, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47628, 87, 87, N'Wallet of user_no85', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47631, 87, 74952141, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47634, 88, 88, N'Wallet of user_no86', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47637, 88, 1971979391, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47640, 89, 89, N'Wallet of user_no87', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47643, 89, 850401454, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47646, 90, 90, N'Wallet of user_no88', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47649, 90, 6582769227, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47652, 91, 91, N'Wallet of user_no89', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47655, 91, 5138125456, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47658, 92, 92, N'Wallet of user_no90', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47661, 92, 2619470944, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47667, 93, 1422712096, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47673, 94, 386636643, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47676, 95, 95, N'Wallet of user_no93', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47679, 95, 3572954814, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47682, 96, 96, N'Wallet of user_no94', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47685, 96, 2948873856, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47688, 97, 97, N'Wallet of user_no95', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47691, 97, 5887723221, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47694, 98, 98, N'Wallet of user_no96', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47697, 98, 7244526304, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47700, 99, 99, N'Wallet of user_no97', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47703, 99, 8455971628, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47706, 100, 100, N'Wallet of user_no98', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47709, 100, 2437453828, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47712, 101, 101, N'Wallet of user_no99', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47715, 101, 2384611197, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47718, 102, 102, N'Wallet of user_no100', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47721, 102, 2680701419, N'Linked Bank', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47724, 65, 65, N'Wallet of user_no63', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47727, 59, 59, N'Wallet of user_no57', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47730, 3, 3, N'Wallet of user_no_3', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47733, 93, 93, N'Wallet of user_no91', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47736, 94, 94, N'Wallet of user_no92', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47739, 2, 10028714113, N'Bank 3', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47763, 109, 109, N'Wallet of tester', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (47766, 109, 107031370718, N'Bank 2', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (48078, 110, 110, N'Wallet of autester', 1)
GO
INSERT [dbo].[Payment_Method] ([paymentId], [userId], [accountNumber], [name], [active]) VALUES (48081, 111, 111, N'Wallet of thanhienee', 1)
GO
SET IDENTITY_INSERT [dbo].[Payment_Method] OFF
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B1', 1, NULL, CAST(11.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B10', 10, NULL, CAST(12.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B11', 11, NULL, CAST(13.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B12', 12, NULL, CAST(10.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B13', 13, NULL, CAST(9.35 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B14', 14, NULL, CAST(10.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B15', 15, NULL, CAST(11.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B16', 16, NULL, CAST(9.69 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B17', 17, NULL, CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B17-C1', 17, 21, CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B2', 2, NULL, CAST(12.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B3', 3, NULL, CAST(10.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B33', 33, NULL, CAST(1.74 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B33-C1', 33, 27, CAST(0.25 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B33-C2', 33, 28, CAST(0.25 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B33-C3', 33, 29, CAST(0.25 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B33-C4', 33, 30, CAST(0.29 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B33-C5', 33, 31, CAST(0.32 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B33-C6', 33, 32, CAST(0.38 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B4', 4, NULL, CAST(13.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B5', 5, NULL, CAST(11.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B6', 6, NULL, CAST(12.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B7', 7, NULL, CAST(10.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B8', 8, NULL, CAST(13.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([productId], [bookId], [chapterId], [price]) VALUES (N'B9', 9, NULL, CAST(15.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product_Own] ([userId], [productId]) VALUES (109, N'B4')
GO
INSERT [dbo].[Product_Own] ([userId], [productId]) VALUES (109, N'B7')
GO
INSERT [dbo].[Product_Own] ([userId], [productId]) VALUES (109, N'B1')
GO
INSERT [dbo].[Product_Own] ([userId], [productId]) VALUES (111, N'B1')
GO
INSERT [dbo].[Product_Own] ([userId], [productId]) VALUES (111, N'B2')
GO
INSERT [dbo].[Product_Own] ([userId], [productId]) VALUES (111, N'B3')
GO
INSERT [dbo].[Product_Own] ([userId], [productId]) VALUES (111, N'B4')
GO
INSERT [dbo].[Product_Own] ([userId], [productId]) VALUES (111, N'B5')
GO
INSERT [dbo].[Product_Own] ([userId], [productId]) VALUES (111, N'B6')
GO
INSERT [dbo].[Product_Own] ([userId], [productId]) VALUES (111, N'B7')
GO
INSERT [dbo].[Product_Own] ([userId], [productId]) VALUES (111, N'B8')
GO
INSERT [dbo].[Product_Own] ([userId], [productId]) VALUES (111, N'B9')
GO
INSERT [dbo].[Product_Own] ([userId], [productId]) VALUES (111, N'B10')
GO
INSERT [dbo].[Product_Own] ([userId], [productId]) VALUES (111, N'B11')
GO
INSERT [dbo].[Product_Own] ([userId], [productId]) VALUES (111, N'B12')
GO
INSERT [dbo].[Product_Own] ([userId], [productId]) VALUES (111, N'B13')
GO
INSERT [dbo].[Product_Own] ([userId], [productId]) VALUES (111, N'B14')
GO
INSERT [dbo].[Product_Own] ([userId], [productId]) VALUES (111, N'B15')
GO
INSERT [dbo].[Product_Own] ([userId], [productId]) VALUES (111, N'B16')
GO
INSERT [dbo].[Product_Own] ([userId], [productId]) VALUES (109, N'B17-C1')
GO
SET IDENTITY_INSERT [dbo].[Report] ON 
GO
INSERT [dbo].[Report] ([id], [reportType], [userId], [objectId], [note], [sent], [received], [status], [action]) VALUES (1, 1, 2, 1, N'Hate', CAST(N'2022-10-25T21:41:00.603' AS DateTime), CAST(N'2022-10-26T00:00:00.000' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Report] ([id], [reportType], [userId], [objectId], [note], [sent], [received], [status], [action]) VALUES (2, 1, 2, 5, N'Anti because this book is too interesting to exist.', CAST(N'2022-10-25T21:43:14.847' AS DateTime), CAST(N'2022-10-26T00:00:00.000' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Report] ([id], [reportType], [userId], [objectId], [note], [sent], [received], [status], [action]) VALUES (3, 1, 109, 13, N'Bait and Switch', CAST(N'2022-10-25T21:44:11.080' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Report] ([id], [reportType], [userId], [objectId], [note], [sent], [received], [status], [action]) VALUES (5, 2, 109, 4, N'Character is also human.', CAST(N'2022-10-26T00:00:00.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Report] ([id], [reportType], [userId], [objectId], [note], [sent], [received], [status], [action]) VALUES (6, 2, 2, 2, N'Containing oriented marketing suspect.', CAST(N'2022-10-20T00:00:00.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Report] ([id], [reportType], [userId], [objectId], [note], [sent], [received], [status], [action]) VALUES (7, 1, 109, 23, N'All hail Granny!!', CAST(N'2022-10-28T21:02:52.297' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Report] ([id], [reportType], [userId], [objectId], [note], [sent], [received], [status], [action]) VALUES (8, 5, 2, 3000115, N'V???n ?????', CAST(N'2022-11-04T14:09:23.877' AS DateTime), NULL, NULL, NULL)
GO
INSERT INTO [dbo].[Report] ([id],[reportType],[userId],[objectId],[note],[sent],[received],[status], [action]) VALUES ( 9, 3, 11,NULL , N'Enable Account', CAST(N'2022-10-23' AS Date), CAST(N'2022-10-24' AS Date), 0, NULL)
GO
INSERT INTO [dbo].[Report] ([id],[reportType],[userId],[objectId],[note],[sent],[received],[status], [action]) VALUES ( 10, 3, 11,NULL , N'Enable Account', CAST(N'2022-10-23' AS Date), CAST(N'2022-10-24' AS Date), 0 ,NULL)
GO
INSERT INTO [dbo].[Report] ([id],[reportType],[userId],[objectId],[note],[sent],[received],[status], [action]) VALUES ( 11, 3, 11,NULL , N'Enable Account', CAST(N'2022-10-23' AS Date), NULL, 1 ,NULL)
GO
SET IDENTITY_INSERT [dbo].[Report] OFF
GO
INSERT [dbo].[Report_Violation] ([reportId], [violationId]) VALUES (1, 2)
GO
INSERT [dbo].[Report_Violation] ([reportId], [violationId]) VALUES (1, 3)
GO
INSERT [dbo].[Report_Violation] ([reportId], [violationId]) VALUES (2, 1)
GO
INSERT [dbo].[Report_Violation] ([reportId], [violationId]) VALUES (2, 7)
GO
INSERT [dbo].[Report_Violation] ([reportId], [violationId]) VALUES (2, 9)
GO
INSERT [dbo].[Report_Violation] ([reportId], [violationId]) VALUES (3, 3)
GO
INSERT [dbo].[Report_Violation] ([reportId], [violationId]) VALUES (3, 5)
GO
INSERT [dbo].[Report_Violation] ([reportId], [violationId]) VALUES (3, 7)
GO
INSERT [dbo].[Report_Violation] ([reportId], [violationId]) VALUES (5, 13)
GO
INSERT [dbo].[Report_Violation] ([reportId], [violationId]) VALUES (5, 19)
GO
INSERT [dbo].[Report_Violation] ([reportId], [violationId]) VALUES (6, 15)
GO
INSERT [dbo].[Report_Violation] ([reportId], [violationId]) VALUES (6, 16)
GO
INSERT [dbo].[Report_Violation] ([reportId], [violationId]) VALUES (6, 17)
GO
INSERT [dbo].[Report_Violation] ([reportId], [violationId]) VALUES (7, 5)
GO
INSERT [dbo].[Report_Violation] ([reportId], [violationId]) VALUES (7, 6)
GO
INSERT [dbo].[Report_Violation] ([reportId], [violationId]) VALUES (8, 26)
GO
INSERT [dbo].[Report_Violation] ([reportId], [violationId]) VALUES (8, 27)
GO
INSERT [dbo].[Star] ([bid], [uid], [star]) VALUES (1, 2, 2)
GO
INSERT [dbo].[Star] ([bid], [uid], [star]) VALUES (1, 109, 5)
GO
SET IDENTITY_INSERT [dbo].[Transaction] ON 
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000001, 2, CAST(297.69 AS Decimal(10, 2)), CAST(297.69 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:10.323' AS DateTime), 1, 3, N'Recharge money from Bank 1', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000002, 3, CAST(4120.33 AS Decimal(10, 2)), CAST(4120.33 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:10.380' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000003, 4, CAST(1442.86 AS Decimal(10, 2)), CAST(1442.86 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:10.430' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000004, 5, CAST(1079.29 AS Decimal(10, 2)), CAST(1079.29 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:10.493' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000005, 6, CAST(3782.48 AS Decimal(10, 2)), CAST(3782.48 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:10.557' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000006, 7, CAST(3407.86 AS Decimal(10, 2)), CAST(3407.86 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:10.617' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000007, 8, CAST(7827.57 AS Decimal(10, 2)), CAST(7827.57 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:10.670' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000008, 9, CAST(2443.45 AS Decimal(10, 2)), CAST(2443.45 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:10.753' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000009, 10, CAST(9.17 AS Decimal(10, 2)), CAST(9.17 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:10.820' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000010, 11, CAST(5982.25 AS Decimal(10, 2)), CAST(5982.25 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:10.890' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000011, 12, CAST(909.46 AS Decimal(10, 2)), CAST(909.46 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:10.953' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000012, 13, CAST(3551.77 AS Decimal(10, 2)), CAST(3551.77 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:11.010' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000013, 14, CAST(6174.18 AS Decimal(10, 2)), CAST(6174.18 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:11.073' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000014, 15, CAST(77.97 AS Decimal(10, 2)), CAST(77.97 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:11.130' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000015, 16, CAST(2703.23 AS Decimal(10, 2)), CAST(2703.23 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:11.190' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000016, 17, CAST(455.40 AS Decimal(10, 2)), CAST(455.40 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:11.263' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000017, 18, CAST(5027.96 AS Decimal(10, 2)), CAST(5027.96 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:11.320' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000018, 19, CAST(4319.66 AS Decimal(10, 2)), CAST(4319.66 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:11.373' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000019, 20, CAST(4195.68 AS Decimal(10, 2)), CAST(4195.68 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:11.433' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000020, 21, CAST(7731.47 AS Decimal(10, 2)), CAST(7731.47 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:11.490' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000021, 22, CAST(5349.61 AS Decimal(10, 2)), CAST(5349.61 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:11.547' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000022, 23, CAST(5313.50 AS Decimal(10, 2)), CAST(5313.50 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:11.603' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000023, 24, CAST(2078.36 AS Decimal(10, 2)), CAST(2078.36 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:11.650' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000024, 25, CAST(6675.17 AS Decimal(10, 2)), CAST(6675.17 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:11.700' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000025, 26, CAST(1440.90 AS Decimal(10, 2)), CAST(1440.90 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:11.747' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000026, 27, CAST(14.59 AS Decimal(10, 2)), CAST(14.59 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:11.797' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000027, 28, CAST(760.99 AS Decimal(10, 2)), CAST(760.99 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:11.850' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000028, 29, CAST(6765.91 AS Decimal(10, 2)), CAST(6765.91 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:11.897' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000029, 30, CAST(7622.32 AS Decimal(10, 2)), CAST(7622.32 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:11.940' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000030, 31, CAST(826.10 AS Decimal(10, 2)), CAST(826.10 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:11.983' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000031, 32, CAST(85.16 AS Decimal(10, 2)), CAST(85.16 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:12.040' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000032, 33, CAST(3136.10 AS Decimal(10, 2)), CAST(3136.10 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:12.093' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000033, 34, CAST(76.44 AS Decimal(10, 2)), CAST(76.44 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:12.143' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000034, 35, CAST(4839.84 AS Decimal(10, 2)), CAST(4839.84 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:12.203' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000035, 36, CAST(5480.93 AS Decimal(10, 2)), CAST(5480.93 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:12.307' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000036, 37, CAST(3678.42 AS Decimal(10, 2)), CAST(3678.42 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:12.357' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000037, 38, CAST(4267.66 AS Decimal(10, 2)), CAST(4267.66 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:12.403' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000038, 39, CAST(5559.76 AS Decimal(10, 2)), CAST(5559.76 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:12.453' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000039, 40, CAST(981.02 AS Decimal(10, 2)), CAST(981.02 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:12.507' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000040, 41, CAST(8808.18 AS Decimal(10, 2)), CAST(8808.18 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:12.553' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000041, 42, CAST(4875.06 AS Decimal(10, 2)), CAST(4875.06 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:12.597' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000042, 43, CAST(8112.23 AS Decimal(10, 2)), CAST(8112.23 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:12.643' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000043, 44, CAST(2829.23 AS Decimal(10, 2)), CAST(2829.23 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:12.693' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000044, 45, CAST(6999.18 AS Decimal(10, 2)), CAST(6999.18 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:12.740' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000045, 46, CAST(6558.10 AS Decimal(10, 2)), CAST(6558.10 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:12.787' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000046, 47, CAST(7931.99 AS Decimal(10, 2)), CAST(7931.99 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:12.837' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000047, 48, CAST(7476.40 AS Decimal(10, 2)), CAST(7476.40 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:12.897' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000048, 49, CAST(4480.66 AS Decimal(10, 2)), CAST(4480.66 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:12.943' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000049, 50, CAST(1196.33 AS Decimal(10, 2)), CAST(1196.33 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:12.990' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000050, 51, CAST(3107.50 AS Decimal(10, 2)), CAST(3107.50 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:13.037' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000051, 52, CAST(1721.74 AS Decimal(10, 2)), CAST(1721.74 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:13.083' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000052, 53, CAST(7169.71 AS Decimal(10, 2)), CAST(7169.71 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:13.133' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000053, 54, CAST(2465.22 AS Decimal(10, 2)), CAST(2465.22 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:13.180' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000054, 55, CAST(8525.55 AS Decimal(10, 2)), CAST(8525.55 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:13.227' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000055, 56, CAST(1163.63 AS Decimal(10, 2)), CAST(1163.63 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:13.270' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000056, 57, CAST(1910.84 AS Decimal(10, 2)), CAST(1910.84 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:13.320' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000057, 58, CAST(1578.50 AS Decimal(10, 2)), CAST(1578.50 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:13.370' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000058, 59, CAST(2177.29 AS Decimal(10, 2)), CAST(2177.29 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:13.423' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000059, 60, CAST(5623.95 AS Decimal(10, 2)), CAST(5623.95 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:13.473' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000060, 61, CAST(5093.20 AS Decimal(10, 2)), CAST(5093.20 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:13.530' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000061, 62, CAST(8543.68 AS Decimal(10, 2)), CAST(8543.68 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:13.593' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000062, 63, CAST(5424.55 AS Decimal(10, 2)), CAST(5424.55 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:13.643' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000063, 64, CAST(1068.78 AS Decimal(10, 2)), CAST(1068.78 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:13.700' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000064, 65, CAST(2659.99 AS Decimal(10, 2)), CAST(2659.99 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:13.757' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000065, 66, CAST(6317.44 AS Decimal(10, 2)), CAST(6317.44 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:13.817' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000066, 67, CAST(531.91 AS Decimal(10, 2)), CAST(531.91 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:13.883' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000067, 68, CAST(4332.51 AS Decimal(10, 2)), CAST(4332.51 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:13.953' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000068, 69, CAST(5425.50 AS Decimal(10, 2)), CAST(5425.50 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:14.017' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000069, 70, CAST(8037.13 AS Decimal(10, 2)), CAST(8037.13 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:14.080' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000070, 71, CAST(6357.76 AS Decimal(10, 2)), CAST(6357.76 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:14.163' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000071, 72, CAST(3767.05 AS Decimal(10, 2)), CAST(3767.05 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:14.223' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000072, 73, CAST(7528.66 AS Decimal(10, 2)), CAST(7528.66 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:14.277' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000073, 74, CAST(7135.03 AS Decimal(10, 2)), CAST(7135.03 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:14.333' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000074, 75, CAST(979.24 AS Decimal(10, 2)), CAST(979.24 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:14.390' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000075, 76, CAST(1645.65 AS Decimal(10, 2)), CAST(1645.65 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:14.450' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000076, 77, CAST(5195.25 AS Decimal(10, 2)), CAST(5195.25 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:14.500' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000077, 78, CAST(6283.85 AS Decimal(10, 2)), CAST(6283.85 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:14.543' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000078, 79, CAST(4977.79 AS Decimal(10, 2)), CAST(4977.79 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:14.597' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000079, 80, CAST(5043.27 AS Decimal(10, 2)), CAST(5043.27 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:14.647' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000080, 81, CAST(381.53 AS Decimal(10, 2)), CAST(381.53 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:14.690' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000081, 82, CAST(5080.89 AS Decimal(10, 2)), CAST(5080.89 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:14.737' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000082, 83, CAST(16.69 AS Decimal(10, 2)), CAST(16.69 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:14.787' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000083, 84, CAST(3547.69 AS Decimal(10, 2)), CAST(3547.69 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:14.837' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000084, 85, CAST(3475.33 AS Decimal(10, 2)), CAST(3475.33 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:14.883' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000085, 86, CAST(1805.99 AS Decimal(10, 2)), CAST(1805.99 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:14.927' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000086, 87, CAST(7012.19 AS Decimal(10, 2)), CAST(7012.19 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:14.973' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000087, 88, CAST(6935.14 AS Decimal(10, 2)), CAST(6935.14 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:15.017' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000088, 89, CAST(1641.78 AS Decimal(10, 2)), CAST(1641.78 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:15.067' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000089, 90, CAST(1300.46 AS Decimal(10, 2)), CAST(1300.46 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:15.110' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000090, 91, CAST(7175.78 AS Decimal(10, 2)), CAST(7175.78 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:15.157' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000091, 92, CAST(3341.84 AS Decimal(10, 2)), CAST(3341.84 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:15.203' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000092, 93, CAST(6665.80 AS Decimal(10, 2)), CAST(6665.80 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:15.247' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000093, 94, CAST(8094.17 AS Decimal(10, 2)), CAST(8094.17 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:15.293' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000094, 95, CAST(1064.11 AS Decimal(10, 2)), CAST(1064.11 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:15.337' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000095, 96, CAST(4197.52 AS Decimal(10, 2)), CAST(4197.52 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:15.387' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000096, 97, CAST(8879.19 AS Decimal(10, 2)), CAST(8879.19 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:15.433' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000097, 98, CAST(5057.10 AS Decimal(10, 2)), CAST(5057.10 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:15.483' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000098, 99, CAST(3718.89 AS Decimal(10, 2)), CAST(3718.89 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:15.530' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000099, 100, CAST(1627.63 AS Decimal(10, 2)), CAST(1627.63 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:15.580' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000100, 101, CAST(4261.23 AS Decimal(10, 2)), CAST(4261.23 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:15.627' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000101, 102, CAST(4800.82 AS Decimal(10, 2)), CAST(4800.82 AS Decimal(10, 2)), CAST(N'2022-10-01T05:52:15.683' AS DateTime), 1, 3, N'Recharge money from Linked Bank', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000102, 2, CAST(150.13 AS Decimal(10, 2)), CAST(147.56 AS Decimal(10, 2)), CAST(N'2022-10-01T22:25:58.213' AS DateTime), 2, 3, N'Withdraw from wallet to Bank 1.', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000103, 2, CAST(1235.42 AS Decimal(10, 2)), CAST(1783.24 AS Decimal(10, 2)), CAST(N'2022-10-01T22:31:43.330' AS DateTime), 1, 3, N'Recharge from Linked Bank into wallet.', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000104, 2, CAST(241.77 AS Decimal(10, 2)), CAST(1541.47 AS Decimal(10, 2)), CAST(N'2022-10-01T22:32:21.120' AS DateTime), 2, 3, N'Withdraw from wallet to Bank 1.', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000108, 109, CAST(230.16 AS Decimal(10, 2)), CAST(230.16 AS Decimal(10, 2)), CAST(N'2022-10-03T13:50:31.843' AS DateTime), 1, 3, N'Recharge from Bank 2 into wallet.', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000109, 109, CAST(13.99 AS Decimal(10, 2)), CAST(216.17 AS Decimal(10, 2)), CAST(N'2022-10-03T13:50:45.683' AS DateTime), 3, 3, N'Buy The Girl on the Train.', N'B4')
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000110, 109, CAST(10.50 AS Decimal(10, 2)), CAST(205.67 AS Decimal(10, 2)), CAST(N'2022-10-03T13:53:14.897' AS DateTime), 3, 3, N'Buy It.', N'B7')
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000111, 2, CAST(5.00 AS Decimal(10, 2)), CAST(1536.47 AS Decimal(10, 2)), CAST(N'2022-10-16T21:48:36.080' AS DateTime), 3, 3, N'Buy Gone Girl .', N'B1')
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000112, 2, CAST(5.00 AS Decimal(10, 2)), CAST(1531.47 AS Decimal(10, 2)), CAST(N'2022-10-17T10:25:04.947' AS DateTime), 3, 3, N'Buy Lord of the Mysteries.', N'B5')
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000113, 2, CAST(5.00 AS Decimal(10, 2)), CAST(1526.47 AS Decimal(10, 2)), CAST(N'2022-10-17T10:25:39.513' AS DateTime), 3, 3, N'Buy One Piece, Volume 1: Romance Dawn.', N'B15')
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000114, 2, CAST(25.00 AS Decimal(10, 2)), CAST(1501.47 AS Decimal(10, 2)), CAST(N'2022-10-23T15:43:12.647' AS DateTime), 3, 3, N'Buy 5cm per Second.', NULL)
GO
INSERT [dbo].[Transaction] ([transactionId], [userId], [amount], [balanceAfter], [transactionTime], [type], [status], [description], [productID]) VALUES (3000115, 2, CAST(5.00 AS Decimal(10, 2)), CAST(1496.47 AS Decimal(10, 2)), CAST(N'2022-10-23T21:16:32.677' AS DateTime), 3, 3, N'Buy Gone Girl .', NULL)
GO
SET IDENTITY_INSERT [dbo].[Transaction] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (1, N'Vinh Nguyen', 1, CAST(N'2002-12-25' AS Date), N'vinhnthe163219@fpt.edu.vn', N'0382132025', N'FBT University ', N'admin', N'admin', 5, 1)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (2, N'Vinh Nguyen', 1, CAST(N'2002-12-25' AS Date), N'vinhvn102@gmail.com', N'0382132025', N'FBT University ', N'vinh', N'2002', 3, 2)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (3, N'Ivory Marcel', 0, CAST(N'1969-09-20' AS Date), N'Bookie_User1@qa.team', N'6128170843', N'E312R', N'user_no1', N'9v9SJ2gqt1', 1, 3)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (4, N'Mary Barisol', 1, CAST(N'1970-02-16' AS Date), N'Bookie_User2@qa.team', N'7134690959', N'F012R', N'user_no2', N'i64LIeOm56', 1, 4)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (5, N'Eden Frost', 1, CAST(N'1984-03-13' AS Date), N'Bookie_User3@qa.team', N'8252042139', N'B438R', N'user_no3', N'IMG2x1T1iv', 1, 5)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (6, N'Benidict Robinett', 1, CAST(N'1966-02-10' AS Date), N'Bookie_User4@qa.team', N'3999059789', N'A400R', N'user_no4', N'mq8q4KfNjV', 1, 6)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (7, N'Zera Farmer', 0, CAST(N'1961-02-10' AS Date), N'Bookie_Admin5@qa.team', N'5706825096', N'E271R', N'user_no5', N'2bh7UnCPxT', 1, 7)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (8, N'Ceil Howell', 1, CAST(N'1992-09-16' AS Date), N'Bookie_User6@qa.team', N'5374439245', N'C146R', N'user_no6', N'kURf75I4QQ', 0, 8)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (9, N'Taylor Marcel', 0, CAST(N'2000-09-04' AS Date), N'Bookie_User7@qa.team', N'9180387665', N'E402L', N'user_no7', N'1FF4G03cId', 1, 9)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (10, N'Wisley Ray', 1, CAST(N'1971-10-28' AS Date), N'Bookie_User8@qa.team', N'8155814231', N'B398R', N'user_no8', N'T4dI4P82Ab', 1, 10)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (11, N'Aiken Pope', 1, CAST(N'1979-05-01' AS Date), N'Bookie_User9@qa.team', N'7770308417', N'F421L', N'duy', N'2002', 1, 11)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (12, N'Rodolphe Blossom', 1, CAST(N'2001-02-19' AS Date), N'Bookie_User10@qa.team', N'6610856429', N'A168L', N'user_no10', N'2203lupus8', 1, 12)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (13, N'Alex Rogze', 0, CAST(N'1987-08-07' AS Date), N'Bookie_Admin11@qa.team', N'9326626549', N'B508R', N'user_no11', N'Lngixrl107', 1, 13)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (14, N'Jean Padilla', 1, CAST(N'1967-11-16' AS Date), N'Bookie_User12@qa.team', N'3348144073', N'E545L', N'user_no12', N'63Q38IrHQ6', 1, 14)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (15, N'Dana Franklin', 1, CAST(N'1965-08-28' AS Date), N'Bookie_User13@qa.team', N'0621966375', N'E501R', N'user_no13', N'2n70PtX3x3', 1, 15)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (16, N'Elluka Bush', 0, CAST(N'1996-11-19' AS Date), N'Bookie_User14@qa.team', N'5303149491', N'E329R', N'user_no14', N'656H6NLX8R', 1, 16)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (17, N'Kenelm Binder', 1, CAST(N'1962-04-16' AS Date), N'Bookie_User15@qa.team', N'8319378641', N'E300R', N'user_no15', N'EaMR6k40vW', 2, 17)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (18, N'Narcissus Freezis', 0, CAST(N'2000-02-19' AS Date), N'Bookie_User16@qa.team', N'5209703781', N'C223R', N'user_no16', N'pC0EkBn3S7', 2, 18)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (19, N'Michelle Reynolds', 0, CAST(N'1996-05-24' AS Date), N'Bookie_User17@qa.team', N'9960504670', N'A076L', N'user_no17', N'j75wC2vU9T', 2, 19)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (20, N'Callie Banica', 0, CAST(N'2003-03-28' AS Date), N'Bookie_User18@qa.team', N'6314402583', N'B591L', N'user_no18', N'AdqKEjAvT2', 1, 20)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (21, N'Malceria Freezis', 0, CAST(N'1992-02-20' AS Date), N'Bookie_User19@qa.team', N'2483694818', N'E536R', N'user_no19', N'40PC98quFo', 1, 21)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (22, N'Jasmine Shepard', 1, CAST(N'1973-08-09' AS Date), N'Bookie_User20@qa.team', N'9780125454', N'C555L', N'user_no20', N'6G6nwxj3XG', 0, 22)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (23, N'Mia Franklin', 0, CAST(N'1970-04-02' AS Date), N'Bookie_User21@qa.team', N'5381738475', N'B033R', N'user_no21', N'FCKNmmEX80', 1, 23)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (24, N'Schick Reyes', 1, CAST(N'2001-09-15' AS Date), N'Bookie_User22@qa.team', N'2832297215', N'F554R', N'user_no22', N'xNWW1u0t5t', 1, 24)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (25, N'Allen Reese', 1, CAST(N'1985-02-09' AS Date), N'Bookie_User23@qa.team', N'5189606718', N'E434R', N'user_no23', N'6pRG2f75Xu', 1, 25)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (26, N'Elman Baxter', 0, CAST(N'1990-08-29' AS Date), N'Bookie_User24@qa.team', N'4250803384', N'F399L', N'user_no24', N'V0N5FSoh48', 1, 26)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (27, N'Willard Jordan', 0, CAST(N'1962-08-23' AS Date), N'Bookie_User25@qa.team', N'8546595378', N'C249R', N'user_no25', N'KNTpXU0UKv', 1, 27)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (28, N'Winona Walton', 1, CAST(N'1972-06-28' AS Date), N'Bookie_User26@qa.team', N'2154390483', N'A271R', N'user_no26', N'0jxj5IEv81', 1, 28)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (29, N'Sophia Knight', 1, CAST(N'1984-03-09' AS Date), N'Bookie_User27@qa.team', N'8607919741', N'A014L', N'user_no27', N'A4fN001VmH', 1, 29)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (30, N'Hank Wade', 0, CAST(N'1965-03-12' AS Date), N'Bookie_User28@qa.team', N'7523062315', N'D388R', N'user_no28', N'2Bfmh791kK', 0, 30)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (31, N'Mia Dinwiddie', 0, CAST(N'1999-02-28' AS Date), N'Bookie_User29@qa.team', N'0246122286', N'F208L', N'user_no29', N'NOxv1OoN1e', 1, 31)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (32, N'Ronald Chandler', 1, CAST(N'1997-10-31' AS Date), N'Bookie_User30@qa.team', N'2828181439', N'E367R', N'user_no30', N'w46Ju1i8L9', 1, 32)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (33, N'Elluka Ackerman', 1, CAST(N'1981-04-17' AS Date), N'Bookie_User31@qa.team', N'9156318073', N'D567R', N'user_no31', N'5uF4wFljD4', 1, 33)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (34, N'Jude Gilbert', 1, CAST(N'1981-11-09' AS Date), N'Bookie_User32@qa.team', N'0169512308', N'F273R', N'user_no32', N'FFdch7h6LS', 0, 34)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (35, N'Philbert Schultz', 0, CAST(N'1989-01-22' AS Date), N'Bookie_User33@qa.team', N'6849016541', N'C488R', N'user_no33', N'4779u17pT0', 1, 35)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (36, N'Lamia Fowler', 0, CAST(N'1967-11-26' AS Date), N'Bookie_User34@qa.team', N'2741015314', N'A021R', N'user_no34', N'hMtBqGhT7W', 1, 36)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (37, N'Gererd Pope', 1, CAST(N'1997-01-03' AS Date), N'Bookie_User35@qa.team', N'3065738164', N'C082R', N'user_no35', N'FUKg17DIa2', 1, 37)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (38, N'Thetal Shepard', 1, CAST(N'1999-05-29' AS Date), N'Bookie_User36@qa.team', N'9823201684', N'B218R', N'user_no36', N'CQ29Nd4kw3', 2, 38)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (39, N'Yocaski Blossom', 0, CAST(N'1968-06-03' AS Date), N'Bookie_User37@qa.team', N'8540069619', N'B203L', N'user_no37', N'IMlu2mqOpO', 2, 39)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (40, N'Danielle Hodges', 1, CAST(N'1987-07-08' AS Date), N'Bookie_User38@qa.team', N'6019926882', N'C533L', N'user_no38', N'0EHMq4RtiX', 1, 40)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (41, N'Darlene Feron', 0, CAST(N'1979-01-25' AS Date), N'Bookie_User39@qa.team', N'1335700997', N'D352L', N'user_no39', N'q6D9MT721A', 1, 41)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (42, N'Hadden Chandler', 0, CAST(N'2001-10-30' AS Date), N'Bookie_User40@qa.team', N'6968727500', N'C048R', N'user_no40', N'ihctjAx8Ca', 1, 42)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (43, N'Sateriasis Hardy', 1, CAST(N'1996-06-13' AS Date), N'Bookie_User41@qa.team', N'2222683128', N'B011L', N'user_no41', N'Q5nX178217', 1, 43)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (44, N'Mia Carpenter', 1, CAST(N'1969-10-24' AS Date), N'Bookie_User42@qa.team', N'7098290406', N'C121L', N'user_no42', N'7TN6q8oT22', 1, 44)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (45, N'Kit Nerune', 1, CAST(N'1986-06-20' AS Date), N'Bookie_User43@qa.team', N'8061375590', N'E086R', N'user_no43', N'D5OmM2G0Hf', 0, 45)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (46, N'Rodolphe Frost', 0, CAST(N'1991-10-11' AS Date), N'Bookie_Admin44@qa.team', N'8079576071', N'B166L', N'user_no44', N'633fiUne77', 0, 46)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (47, N'Jesse Watts', 1, CAST(N'1962-01-09' AS Date), N'Bookie_User45@qa.team', N'6734813546', N'A079R', N'user_no45', N'8xKCPgxkG6', 1, 47)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (48, N'Carl Crawford', 0, CAST(N'1966-09-23' AS Date), N'Bookie_User46@qa.team', N'9164323101', N'A587R', N'user_no46', N'8Ogl6495GC', 1, 48)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (49, N'Ronald Robinett', 1, CAST(N'1975-09-13' AS Date), N'Bookie_User47@qa.team', N'1939248911', N'F056L', N'user_no47', N'9nvm39FdG4', 0, 49)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (50, N'Zera Stanley', 1, CAST(N'1962-06-22' AS Date), N'Bookie_Admin48@qa.team', N'3023618105', N'A242L', N'user_no48', N'WV2x0jNQL8', 1, 50)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (51, N'Harley Avadonia', 1, CAST(N'1998-05-30' AS Date), N'Bookie_User49@qa.team', N'2549882790', N'A524L', N'user_no49', N'63XQKOsfP5', 1, 51)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (52, N'Butglar Gray', 0, CAST(N'2001-11-07' AS Date), N'Bookie_User50@qa.team', N'7015229259', N'E391L', N'user_no50', N't6NaNclluX', 2, 52)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (53, N'Joe Baxter', 1, CAST(N'1978-05-19' AS Date), N'Bookie_User51@qa.team', N'8763978419', N'C297R', N'user_no51', N'10VLDxiejW', 1, 53)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (54, N'Ward Wagner', 0, CAST(N'1995-02-15' AS Date), N'Bookie_User52@qa.team', N'2458631214', N'F312L', N'user_no52', N'JaWagx8363', 0, 54)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (55, N'Charlie Reese', 1, CAST(N'1978-11-07' AS Date), N'Bookie_User53@qa.team', N'8751908426', N'B598R', N'user_no53', N'0gT2B1b3uX', 1, 55)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (56, N'Windsor Dinwiddie', 0, CAST(N'1988-01-22' AS Date), N'Bookie_User54@qa.team', N'0217649643', N'D467R', N'user_no54', N'BvR10X7Be7', 0, 56)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (57, N'Charon Walton', 0, CAST(N'1965-05-05' AS Date), N'Bookie_User55@qa.team', N'3488293409', N'A094L', N'user_no55', N'gQ5mp7Ln9B', 2, 57)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (58, N'Hank Michaelis', 1, CAST(N'1994-07-09' AS Date), N'Bookie_User56@qa.team', N'2886762525', N'F063R', N'user_no56', N'VKeuCjdDo7', 0, 58)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (59, N'Seth Manning', 1, CAST(N'1973-05-06' AS Date), N'Bookie_User57@qa.team', N'7193619411', N'B266R', N'user_no57', N'9B8txaGLUn', 0, 59)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (60, N'Seth Manning', 0, CAST(N'1978-12-07' AS Date), N'Bookie_User58@qa.team', N'3562422001', N'B018R', N'user_no58', N'P3VOu0cHE9', 0, 60)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (61, N'Light Jenning', 0, CAST(N'1992-12-11' AS Date), N'Bookie_User59@qa.team', N'5399302391', N'F278R', N'user_no59', N'5MOL5X7w2m', 0, 61)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (62, N'David Barisol', 1, CAST(N'1962-04-12' AS Date), N'Bookie_Admin60@qa.team', N'1262618674', N'C060L', N'user_no60', N'cAEscuX0bp', 1, 62)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (63, N'Michaela Kelley', 1, CAST(N'1988-11-13' AS Date), N'Bookie_Admin61@qa.team', N'9181933819', N'C120L', N'user_no61', N'c3Kp2w1ePD', 1, 63)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (64, N'Melody Elphen', 1, CAST(N'1981-12-04' AS Date), N'Bookie_User62@qa.team', N'8636081048', N'F542R', N'user_no62', N'L0nU3qkIqD', 0, 64)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (65, N'Elluka Norman', 0, CAST(N'1991-03-07' AS Date), N'Bookie_User63@qa.team', N'6646101635', N'F258L', N'user_no63', N'8b6k4lf3bX', 0, 65)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (66, N'Strange Feron', 0, CAST(N'1998-01-10' AS Date), N'Bookie_User64@qa.team', N'1135823939', N'F393R', N'user_no64', N'V36337U7LQ', 2, 66)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (67, N'Taylor Valdez', 1, CAST(N'1991-12-03' AS Date), N'Bookie_User65@qa.team', N'3733355471', N'E585L', N'user_no65', N'TRQjooaqPE', 0, 67)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (68, N'Dana Macy', 0, CAST(N'1990-10-11' AS Date), N'Bookie_User66@qa.team', N'8754299135', N'F407L', N'user_no66', N'1LjH434D2f', 0, 68)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (69, N'Jean Valdez', 0, CAST(N'1982-10-15' AS Date), N'Bookie_User67@qa.team', N'9735839086', N'D407L', N'user_no67', N'30uboLi0pq', 0, 69)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (70, N'Minis Goodwin', 1, CAST(N'2003-06-05' AS Date), N'Bookie_User68@qa.team', N'9113433152', N'C176L', N'user_no68', N'6HgQhX4vAS', 0, 70)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (71, N'Clay Marlon', 0, CAST(N'1976-01-03' AS Date), N'Bookie_User69@qa.team', N'8151717641', N'F276L', N'user_no69', N'h8b6Ks3aHG', 0, 71)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (72, N'Phil Powers', 1, CAST(N'2002-07-26' AS Date), N'Bookie_User70@qa.team', N'0859547485', N'E327L', N'user_no70', N'RGGX9xaFd9', 0, 72)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (73, N'Butglar Hardy', 0, CAST(N'1985-06-29' AS Date), N'Bookie_User71@qa.team', N'9494816505', N'F150L', N'user_no71', N'SuC0uP5MWc', 0, 73)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (74, N'Camelia Mullins', 1, CAST(N'1977-10-10' AS Date), N'Bookie_User72@qa.team', N'2264980236', N'D302R', N'user_no72', N'37ov3LQvr5', 0, 74)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (75, N'Lionel Stanley', 1, CAST(N'1976-07-15' AS Date), N'Bookie_User73@qa.team', N'2592270859', N'F134R', N'user_no73', N'fagIRa8sd2', 0, 75)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (76, N'Linda Payne', 1, CAST(N'1967-07-05' AS Date), N'Bookie_User74@qa.team', N'2138430999', N'E582L', N'user_no74', N'R6DhW5Us1U', 0, 76)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (77, N'Philbert Cross', 1, CAST(N'1978-02-10' AS Date), N'Bookie_User75@qa.team', N'7912138173', N'A244R', N'user_no75', N'4FbN3eR914', 0, 77)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (78, N'Phil Jordan', 1, CAST(N'1998-09-09' AS Date), N'Bookie_User76@qa.team', N'3171032506', N'D582L', N'user_no76', N'4HoS1o8LiQ', 0, 78)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (79, N'Robert Kissos', 1, CAST(N'1989-04-12' AS Date), N'Bookie_Admin77@qa.team', N'8210911505', N'B322R', N'user_no77', N'44h7516veR', 1, 79)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (80, N'Ronald Rios', 1, CAST(N'1974-04-27' AS Date), N'Bookie_Admin78@qa.team', N'1230714908', N'E391L', N'user_no78', N'XcT993M91U', 1, 80)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (81, N'Elluka Manning', 1, CAST(N'1978-01-13' AS Date), N'Bookie_User79@qa.team', N'4453821425', N'D520L', N'user_no79', N'13NMusTvTs', 0, 81)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (82, N'Ceil Payne', 1, CAST(N'1981-01-25' AS Date), N'Bookie_User80@qa.team', N'5169407308', N'B558R', N'user_no80', N'm1lSpbnxKR', 0, 82)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (83, N'Lizzy Meld', 0, CAST(N'1974-03-29' AS Date), N'Bookie_User81@qa.team', N'7971588225', N'E401L', N'user_no81', N'CQ625H6cpM', 0, 83)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (84, N'Camelia Miller', 0, CAST(N'1995-10-05' AS Date), N'Bookie_User82@qa.team', N'6418028724', N'D425R', N'user_no82', N'kx9qI8Lrpn', 0, 84)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (85, N'Diana Macy', 0, CAST(N'1987-06-15' AS Date), N'Bookie_User83@qa.team', N'0392517157', N'C064L', N'user_no83', N'NOLEd7ip6u', 0, 85)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (86, N'Windsor Badman', 1, CAST(N'1963-04-23' AS Date), N'Bookie_User84@qa.team', N'2211777973', N'B225L', N'user_no84', N'Oq52kK54Wt', 0, 86)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (87, N'Diana Obrien', 0, CAST(N'1965-09-05' AS Date), N'Bookie_User85@qa.team', N'5234651834', N'B266R', N'user_no85', N'Xg48U9vViT', 1, 87)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (88, N'Adam Hodges', 1, CAST(N'1991-09-17' AS Date), N'Bookie_User86@qa.team', N'8244422163', N'F547L', N'user_no86', N'69OblisKtI', 1, 88)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (89, N'Hansel May', 1, CAST(N'1963-04-10' AS Date), N'Bookie_User87@qa.team', N'0832781475', N'B408L', N'user_no87', N'6k69wo0082', 1, 89)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (90, N'Oswald Pope', 0, CAST(N'2003-06-25' AS Date), N'Bookie_User88@qa.team', N'5045023619', N'B063R', N'user_no88', N'8V0cXHnT2m', 1, 90)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (91, N'Alex Hardy', 1, CAST(N'1975-08-25' AS Date), N'Bookie_User89@qa.team', N'2345729992', N'D066R', N'user_no89', N'42RAMiQXtP', 2, 91)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (92, N'Butglar Michaelis', 0, CAST(N'1973-11-06' AS Date), N'Bookie_User90@qa.team', N'0368248093', N'C055L', N'user_no90', N'tIh5JIP0wO', 1, 92)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (93, N'Elman Blair', 1, CAST(N'1976-07-19' AS Date), N'Bookie_User91@qa.team', N'2461908732', N'A427R', N'user_no91', N'UnoMh1cNLM', 1, 93)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (94, N'Lucifer Blair', 0, CAST(N'1983-01-08' AS Date), N'Bookie_User92@qa.team', N'1323033244', N'A500L', N'user_no92', N'BAobhPn8q3', 0, 94)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (95, N'Philbert Phantomhive', 0, CAST(N'1991-03-23' AS Date), N'Bookie_User93@qa.team', N'3364836425', N'B478R', N'user_no93', N'N7946Sgcp7', 1, 95)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (96, N'Albion Alexdander', 1, CAST(N'1990-10-28' AS Date), N'Bookie_User94@qa.team', N'9179724841', N'A044R', N'user_no94', N'Aom68vB96X', 1, 96)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (97, N'Melody Chandler', 1, CAST(N'1963-12-30' AS Date), N'Bookie_User95@qa.team', N'5587772688', N'A579L', N'user_no95', N'n7q1WnuD8L', 1, 97)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (98, N'Katya Corbyn', 0, CAST(N'1969-12-31' AS Date), N'Bookie_User96@qa.team', N'7693285889', N'D506R', N'user_no96', N'5M5g7rO37L', 1, 98)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (99, N'Rahab Octo', 0, CAST(N'1989-05-01' AS Date), N'Bookie_User97@qa.team', N'5723628843', N'A079L', N'user_no97', N'38622s3j03', 1, 99)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (100, N'Hansel May', 1, CAST(N'2003-06-22' AS Date), N'Bookie_User98@qa.team', N'0343057780', N'E443R', N'user_no98', N'1oST7ll09m', 1, 100)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (101, N'Luke Thayne', 0, CAST(N'1989-10-15' AS Date), N'Bookie_User99@qa.team', N'0889839198', N'D114L', N'user_no99', N'IK7S0hEEW1', 1, 101)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (102, N'Cyril Watson', 0, CAST(N'1999-02-15' AS Date), N'Bookie_User100@qa.team', N'5859588913', N'F550R', N'user_no100', N'aBaQq4bHD0', 1, 102)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (109, N'I Am Tester', 1, CAST(N'2002-01-01' AS Date), N'Bookie_User200@qa.team', N'0987654321', NULL, N'tester', N'test', 1, 109)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (110, N'Test Author', 0, CAST(N'2011-12-13' AS Date), N'Bookie_Author1@qa.team', N'0963852741', NULL, N'autester', N'test_author1', 3, 110)
GO
INSERT [dbo].[User] ([id], [fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super], [walletNumber]) VALUES (111, N'Thanh Hien', 0, CAST(N'2022-10-04' AS Date), N'thanhienee@123.com', N'0123456789', NULL, N'thanhienee', N'123456789', 1, 111)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[Violation] ON 
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (1, 1, N'Sexual Content')
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (2, 1, N'Violent or repulsive content')
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (3, 1, N'Hateful or abusive content')
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (4, 1, N'Harassment or bullying')
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (5, 1, N'Harmful or dangerous acts')
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (6, 1, N'Child abuse')
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (7, 1, N'Promotes terrorism')
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (8, 1, N'Spam or misleading')
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (9, 1, N'Infringes my rights')
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (10, 1, N'Caption issue')
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (11, 2, N'Nudity')
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (12, 2, N'Violence')
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (13, 2, N'Harassment')
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (14, 2, N'Suicide or self-injury')
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (15, 2, N'False information')
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (16, 2, N'Spam')
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (17, 2, N'Unauthorized sales')
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (18, 2, N'Hate speech')
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (19, 2, N'Personal attack')
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (22, 5, N'Still not receive the money in the account')
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (23, 5, N'Can''t withdraw money')
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (24, 5, N'Can''t get access to transfer money')
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (25, 5, N'Money received didn''t match with the transactions')
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (26, 5, N'Error occurs while transaction is processing')
GO
INSERT [dbo].[Violation] ([id], [reportType], [title]) VALUES (27, 5, N'Other')
GO
SET IDENTITY_INSERT [dbo].[Violation] OFF
GO
SET IDENTITY_INSERT [dbo].[Volume] ON 
GO
INSERT [dbo].[Volume] ([id], [bookId], [no], [title], [summary]) VALUES (1, 1, 1, N'Part One: BOY LOSES GIRL', NULL)
GO
INSERT [dbo].[Volume] ([id], [bookId], [no], [title], [summary]) VALUES (2, 1, 2, N'Part Two: Boy Meets Girl', NULL)
GO
INSERT [dbo].[Volume] ([id], [bookId], [no], [title], [summary]) VALUES (3, 1, 3, N'Part Three Boy Gets Girl Back (Or Vice Versa)', NULL)
GO
INSERT [dbo].[Volume] ([id], [bookId], [no], [title], [summary]) VALUES (4, 17, 1, N'L???c', NULL)
GO
INSERT [dbo].[Volume] ([id], [bookId], [no], [title], [summary]) VALUES (5, 18, 1, N'L???c', NULL)
GO
INSERT [dbo].[Volume] ([id], [bookId], [no], [title], [summary]) VALUES (6, 22, 1, N'L???c', NULL)
GO
INSERT [dbo].[Volume] ([id], [bookId], [no], [title], [summary]) VALUES (7, 23, 1, N'L???c', NULL)
GO
INSERT [dbo].[Volume] ([id], [bookId], [no], [title], [summary]) VALUES (8, 24, 1, N'L???c', NULL)
GO
INSERT [dbo].[Volume] ([id], [bookId], [no], [title], [summary]) VALUES (9, 25, 1, N'L???c', NULL)
GO
INSERT [dbo].[Volume] ([id], [bookId], [no], [title], [summary]) VALUES (10, 26, 1, N'L???c', NULL)
GO
INSERT [dbo].[Volume] ([id], [bookId], [no], [title], [summary]) VALUES (11, 27, 1, N'L???c', NULL)
GO
INSERT [dbo].[Volume] ([id], [bookId], [no], [title], [summary]) VALUES (12, 28, 1, N'L???c', NULL)
GO
INSERT [dbo].[Volume] ([id], [bookId], [no], [title], [summary]) VALUES (13, 30, 1, N'L???c', NULL)
GO
INSERT [dbo].[Volume] ([id], [bookId], [no], [title], [summary]) VALUES (14, 31, 1, N'L???c', NULL)
GO
INSERT [dbo].[Volume] ([id], [bookId], [no], [title], [summary]) VALUES (15, 32, 1, N'L???c', NULL)
GO
INSERT [dbo].[Volume] ([id], [bookId], [no], [title], [summary]) VALUES (16, 33, 1, N'Sau khi g??y th?? v???i ch??? th???n', NULL)
GO
SET IDENTITY_INSERT [dbo].[Volume] OFF
GO
ALTER TABLE [dbo].[Book] ADD  DEFAULT ((0)) FOR [favourite]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF__Book__views__30F848ED]  DEFAULT ((0)) FOR [views]
GO
ALTER TABLE [dbo].[Book] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Comment] ADD  CONSTRAINT [DF_Comment_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__is_super__31EC6D26]  DEFAULT ((1)) FOR [is_super]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_balance]  DEFAULT ((0)) FOR [walletNumber]
GO
ALTER TABLE [dbo].[Author]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Book_Own]  WITH CHECK ADD  CONSTRAINT [FK_Book_Own_Book] FOREIGN KEY([bookId])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[Book_Own] CHECK CONSTRAINT [FK_Book_Own_Book]
GO
ALTER TABLE [dbo].[Book_Own]  WITH CHECK ADD  CONSTRAINT [FK_Book_Own_Chapter] FOREIGN KEY([recentChapterId])
REFERENCES [dbo].[Chapter] ([id])
GO
ALTER TABLE [dbo].[Book_Own] CHECK CONSTRAINT [FK_Book_Own_Chapter]
GO
ALTER TABLE [dbo].[Book_Own]  WITH CHECK ADD  CONSTRAINT [FK_Book_Own_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Book_Own] CHECK CONSTRAINT [FK_Book_Own_User]
GO
ALTER TABLE [dbo].[CategoryBook]  WITH CHECK ADD FOREIGN KEY([bookId])
REFERENCES [dbo].[Book] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryBook]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Chapter]  WITH CHECK ADD FOREIGN KEY([volumeId])
REFERENCES [dbo].[Volume] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([bookId])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Favourite]  WITH CHECK ADD  CONSTRAINT [FK__Favourite__bid__2B3F6F97] FOREIGN KEY([bid])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[Favourite] CHECK CONSTRAINT [FK__Favourite__bid__2B3F6F97]
GO
ALTER TABLE [dbo].[Favourite]  WITH CHECK ADD FOREIGN KEY([bid])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[Favourite]  WITH CHECK ADD  CONSTRAINT [FK__Favourite__uid__2A4B4B5E] FOREIGN KEY([uid])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Favourite] CHECK CONSTRAINT [FK__Favourite__uid__2A4B4B5E]
GO
ALTER TABLE [dbo].[Favourite]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Payment_Method]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Method_Payment_Account] FOREIGN KEY([accountNumber])
REFERENCES [dbo].[Payment_Account] ([accountNumber])
GO
ALTER TABLE [dbo].[Payment_Method] CHECK CONSTRAINT [FK_Payment_Method_Payment_Account]
GO
ALTER TABLE [dbo].[Payment_Method]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Method_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Payment_Method] CHECK CONSTRAINT [FK_Payment_Method_User]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Book] FOREIGN KEY([bookId])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Book]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Chapter] FOREIGN KEY([chapterId])
REFERENCES [dbo].[Chapter] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Chapter]
GO
ALTER TABLE [dbo].[Product_Own]  WITH CHECK ADD  CONSTRAINT [FK_Product_Own_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[Product_Own] CHECK CONSTRAINT [FK_Product_Own_Product]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Report_Violation]  WITH CHECK ADD  CONSTRAINT [FK_Report_Violation_Report] FOREIGN KEY([reportId])
REFERENCES [dbo].[Report] ([id])
GO
ALTER TABLE [dbo].[Report_Violation] CHECK CONSTRAINT [FK_Report_Violation_Report]
GO
ALTER TABLE [dbo].[Report_Violation]  WITH CHECK ADD  CONSTRAINT [FK_Report_Violation_Violation] FOREIGN KEY([violationId])
REFERENCES [dbo].[Violation] ([id])
GO
ALTER TABLE [dbo].[Report_Violation] CHECK CONSTRAINT [FK_Report_Violation_Violation]
GO
ALTER TABLE [dbo].[Star]  WITH CHECK ADD  CONSTRAINT [FK__Star__bid__2E1BDC42] FOREIGN KEY([bid])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[Star] CHECK CONSTRAINT [FK__Star__bid__2E1BDC42]
GO
ALTER TABLE [dbo].[Star]  WITH CHECK ADD FOREIGN KEY([bid])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[Star]  WITH CHECK ADD  CONSTRAINT [FK__Star__uid__2F10007B] FOREIGN KEY([uid])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Star] CHECK CONSTRAINT [FK__Star__uid__2F10007B]
GO
ALTER TABLE [dbo].[Star]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Token]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Product]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Payment_Account] FOREIGN KEY([walletNumber])
REFERENCES [dbo].[Payment_Account] ([accountNumber])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Payment_Account]
GO
ALTER TABLE [dbo].[Volume]  WITH CHECK ADD FOREIGN KEY([bookId])
REFERENCES [dbo].[Book] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Star]  WITH CHECK ADD  CONSTRAINT [chk_star] CHECK  (([star]>=(1) AND [star]<=(5)))
GO
ALTER TABLE [dbo].[Star] CHECK CONSTRAINT [chk_star]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 mean Fail, 1 mean Pending, 2 mean Successful' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Transaction', @level2type=N'COLUMN',@level2name=N'status'
GO
USE [master]
GO
ALTER DATABASE [BOOKIE] SET  READ_WRITE 
GO
