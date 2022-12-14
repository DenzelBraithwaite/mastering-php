USE [master]
GO
/****** Object:  Database [lbpsb_project]    Script Date: 1/9/2023 7:33:11 AM ******/
CREATE DATABASE [lbpsb_project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'first_project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\first_project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'first_project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\first_project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [lbpsb_project] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [lbpsb_project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [lbpsb_project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [lbpsb_project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [lbpsb_project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [lbpsb_project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [lbpsb_project] SET ARITHABORT OFF 
GO
ALTER DATABASE [lbpsb_project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [lbpsb_project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [lbpsb_project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [lbpsb_project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [lbpsb_project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [lbpsb_project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [lbpsb_project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [lbpsb_project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [lbpsb_project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [lbpsb_project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [lbpsb_project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [lbpsb_project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [lbpsb_project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [lbpsb_project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [lbpsb_project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [lbpsb_project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [lbpsb_project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [lbpsb_project] SET RECOVERY FULL 
GO
ALTER DATABASE [lbpsb_project] SET  MULTI_USER 
GO
ALTER DATABASE [lbpsb_project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [lbpsb_project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [lbpsb_project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [lbpsb_project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [lbpsb_project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [lbpsb_project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'lbpsb_project', N'ON'
GO
ALTER DATABASE [lbpsb_project] SET QUERY_STORE = ON
GO
ALTER DATABASE [lbpsb_project] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [lbpsb_project]
GO
/****** Object:  User [kaz]    Script Date: 1/9/2023 7:33:11 AM ******/
CREATE USER [kaz] FOR LOGIN [kaz] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 1/9/2023 7:33:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[school_id] [int] NOT NULL,
	[first_name] [varchar](24) NOT NULL,
	[last_name] [varchar](32) NOT NULL,
	[address] [varchar](64) NULL,
	[phone_number] [char](10) NOT NULL,
	[hire_date] [date] NOT NULL,
	[birth_date] [date] NULL,
	[email] [varchar](50) NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK__employees] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[homerooms]    Script Date: 1/9/2023 7:33:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[homerooms](
	[homeroom_id] [int] IDENTITY(1,1) NOT NULL,
	[homeroom_number] [int] NOT NULL,
	[classroom_number] [int] NOT NULL,
	[grade] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[homeroom_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[school_levels]    Script Date: 1/9/2023 7:33:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[school_levels](
	[level_id] [int] IDENTITY(1,1) NOT NULL,
	[student_level] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[level_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[schools]    Script Date: 1/9/2023 7:33:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[schools](
	[school_id] [int] IDENTITY(1,1) NOT NULL,
	[level_id] [int] NOT NULL,
	[name] [varchar](64) NOT NULL,
	[code] [int] NOT NULL,
	[department] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[school_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sessions]    Script Date: 1/9/2023 7:33:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sessions](
	[session_id] [int] IDENTITY(1,1) NOT NULL,
	[teacher_id] [int] NOT NULL,
	[homeroom_id] [int] NOT NULL,
	[subject_id] [int] NOT NULL,
	[room_number] [int] NOT NULL,
	[period] [int] NOT NULL,
	[day] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[session_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 1/9/2023 7:33:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[student_id] [int] IDENTITY(1,1) NOT NULL,
	[school_id] [int] NOT NULL,
	[homeroom_id] [int] NOT NULL,
	[fiche_id] [int] NOT NULL,
	[first_name] [varchar](60) NOT NULL,
	[last_name] [varchar](60) NOT NULL,
	[grade] [int] NOT NULL,
	[email] [varchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subjects]    Script Date: 1/9/2023 7:33:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subjects](
	[subject_id] [int] IDENTITY(1,1) NOT NULL,
	[school_id] [int] NOT NULL,
	[teacher_id] [int] NOT NULL,
	[name] [varchar](24) NOT NULL,
	[grade] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teachers]    Script Date: 1/9/2023 7:33:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teachers](
	[teacher_id] [int] IDENTITY(1,1) NOT NULL,
	[homeroom_id] [int] NULL,
	[school_id] [int] NULL,
	[employee_id] [int] NOT NULL,
	[first_name] [varchar](32) NOT NULL,
	[last_name] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[teacher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[employees] ON 

INSERT [dbo].[employees] ([employee_id], [school_id], [first_name], [last_name], [address], [phone_number], [hire_date], [birth_date], [email], [username], [password]) VALUES (11, 4, N'Denzel', N'Braithwaite', N'123 sesame street', N'5141234567', CAST(N'2014-07-01' AS Date), CAST(N'1996-01-01' AS Date), N'dbraithwaite01@pearson.ca', N'dbraithwaite01', N'clock123')
INSERT [dbo].[employees] ([employee_id], [school_id], [first_name], [last_name], [address], [phone_number], [hire_date], [birth_date], [email], [username], [password]) VALUES (13, 8, N'Elisa', N'Osydney', N'123 sesame street', N'5147654321', CAST(N'2018-12-01' AS Date), CAST(N'1996-02-14' AS Date), N'esydney06@pearson.ca', N'esydney06', N'iLikeWater321')
INSERT [dbo].[employees] ([employee_id], [school_id], [first_name], [last_name], [address], [phone_number], [hire_date], [birth_date], [email], [username], [password]) VALUES (14, 1, N'Elaine', N'Fischer', N'146 pineapple road', N'5145145114', CAST(N'2000-07-01' AS Date), CAST(N'1976-03-24' AS Date), N'efischer02@pearson.ca', N'efischer02', N'bubbleTeaYesPlz')
INSERT [dbo].[employees] ([employee_id], [school_id], [first_name], [last_name], [address], [phone_number], [hire_date], [birth_date], [email], [username], [password]) VALUES (16, 2, N'Bobert', N'Zane', N'1819 suits ave', N'5144156722', CAST(N'2003-08-11' AS Date), CAST(N'1970-07-04' AS Date), N'bzane01@pearson.ca', N'bzane01', N'theSuitMakesTheMan')
INSERT [dbo].[employees] ([employee_id], [school_id], [first_name], [last_name], [address], [phone_number], [hire_date], [birth_date], [email], [username], [password]) VALUES (18, 3, N'Muhammad', N'Ali', N'619 knockout boulevard', N'4386667777', CAST(N'2014-12-19' AS Date), CAST(N'1990-11-30' AS Date), N'mali11@pearson.ca', N'mali11', N'FloatLikeAButterfly')
INSERT [dbo].[employees] ([employee_id], [school_id], [first_name], [last_name], [address], [phone_number], [hire_date], [birth_date], [email], [username], [password]) VALUES (19, 5, N'Allison', N'Grove', N'2020 cheer street', N'4388344838', CAST(N'2020-03-01' AS Date), CAST(N'2000-11-30' AS Date), N'agrove02@pearson.ca', N'agrove02', N'GroupOfTr335')
INSERT [dbo].[employees] ([employee_id], [school_id], [first_name], [last_name], [address], [phone_number], [hire_date], [birth_date], [email], [username], [password]) VALUES (20, 6, N'Karen', N'Shorts', N'5050 Herlecles ave', N'4385222543', CAST(N'2007-07-01' AS Date), CAST(N'1975-09-11' AS Date), N'kshorts03@pearson.ca', N'kshorts03', N'shortPANTS!')
INSERT [dbo].[employees] ([employee_id], [school_id], [first_name], [last_name], [address], [phone_number], [hire_date], [birth_date], [email], [username], [password]) VALUES (21, 7, N'Dennis', N'Whitman', N'204 mire street, apt. 3C', N'5144385144', CAST(N'1990-06-30' AS Date), CAST(N'1966-06-30' AS Date), N'dwhitman@pearson.ca', N'dwhitman', N'1daOneandOnly1')
INSERT [dbo].[employees] ([employee_id], [school_id], [first_name], [last_name], [address], [phone_number], [hire_date], [birth_date], [email], [username], [password]) VALUES (22, 9, N'Cindy', N'Viger', N'1010 Tennet street, apt. 102', N'4389115144', CAST(N'2016-07-01' AS Date), CAST(N'1966-02-28' AS Date), N'cviger02@pearson.ca', N'cviger02', N'RaDaRacEcaRaDaR')
INSERT [dbo].[employees] ([employee_id], [school_id], [first_name], [last_name], [address], [phone_number], [hire_date], [birth_date], [email], [username], [password]) VALUES (23, 10, N'Piya', N'Patel', N'30 turley ave', N'2635144381', CAST(N'2019-09-18' AS Date), CAST(N'2000-04-05' AS Date), N'ppiya22@pearson.ca', N'ppiya22', N'FamilyConnections8')
SET IDENTITY_INSERT [dbo].[employees] OFF
GO
SET IDENTITY_INSERT [dbo].[homerooms] ON 

INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (1, 101, 113, 1)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (3, 102, 107, 1)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (4, 201, 109, 2)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (5, 202, 115, 2)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (6, 301, 101, 3)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (7, 302, 103, 3)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (8, 401, 201, 4)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (9, 402, 202, 4)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (10, 501, 203, 5)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (11, 502, 205, 5)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (12, 503, 206, 5)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (13, 601, 211, 6)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (14, 602, 213, 6)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (15, 603, 215, 6)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (16, 701, 1001, 7)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (17, 702, 1004, 7)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (18, 801, 1010, 8)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (19, 802, 1020, 8)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (20, 901, 1022, 9)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (21, 902, 1030, 9)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (22, 903, 1018, 9)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (23, 1001, 2022, 10)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (24, 1002, 2023, 10)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (25, 1101, 2040, 11)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (26, 1102, 2028, 11)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (27, 1103, 2016, 11)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (28, 991, 2410, 12)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (29, 992, 2420, 12)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (30, 993, 2430, 12)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (31, 994, 2440, 12)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (32, 995, 2450, 12)
INSERT [dbo].[homerooms] ([homeroom_id], [homeroom_number], [classroom_number], [grade]) VALUES (33, 996, 2460, 12)
SET IDENTITY_INSERT [dbo].[homerooms] OFF
GO
SET IDENTITY_INSERT [dbo].[school_levels] ON 

INSERT [dbo].[school_levels] ([level_id], [student_level]) VALUES (1, N'elementary')
INSERT [dbo].[school_levels] ([level_id], [student_level]) VALUES (2, N'secondary')
INSERT [dbo].[school_levels] ([level_id], [student_level]) VALUES (3, N'adult')
INSERT [dbo].[school_levels] ([level_id], [student_level]) VALUES (4, N'head office')
SET IDENTITY_INSERT [dbo].[school_levels] OFF
GO
SET IDENTITY_INSERT [dbo].[schools] ON 

INSERT [dbo].[schools] ([school_id], [level_id], [name], [code], [department]) VALUES (1, 1, N'allion', 100, 0)
INSERT [dbo].[schools] ([school_id], [level_id], [name], [code], [department]) VALUES (2, 2, N'lcchs', 200, 0)
INSERT [dbo].[schools] ([school_id], [level_id], [name], [code], [department]) VALUES (3, 3, N'vacc', 300, 0)
INSERT [dbo].[schools] ([school_id], [level_id], [name], [code], [department]) VALUES (4, 4, N'information systems', 7, 1)
INSERT [dbo].[schools] ([school_id], [level_id], [name], [code], [department]) VALUES (5, 1, N'meadowbrook', 101, 0)
INSERT [dbo].[schools] ([school_id], [level_id], [name], [code], [department]) VALUES (6, 2, N'lachine high', 201, 0)
INSERT [dbo].[schools] ([school_id], [level_id], [name], [code], [department]) VALUES (7, 3, N'pec', 301, 0)
INSERT [dbo].[schools] ([school_id], [level_id], [name], [code], [department]) VALUES (8, 1, N'human resources', 5, 1)
INSERT [dbo].[schools] ([school_id], [level_id], [name], [code], [department]) VALUES (9, 1, N'westpark', 102, 0)
INSERT [dbo].[schools] ([school_id], [level_id], [name], [code], [department]) VALUES (10, 1, N'beaconhill', 202, 0)
SET IDENTITY_INSERT [dbo].[schools] OFF
GO
SET IDENTITY_INSERT [dbo].[sessions] ON 

INSERT [dbo].[sessions] ([session_id], [teacher_id], [homeroom_id], [subject_id], [room_number], [period], [day]) VALUES (1, 1, 1, 1, 113, 2, 5)
INSERT [dbo].[sessions] ([session_id], [teacher_id], [homeroom_id], [subject_id], [room_number], [period], [day]) VALUES (2, 2, 16, 2, 1001, 5, 4)
INSERT [dbo].[sessions] ([session_id], [teacher_id], [homeroom_id], [subject_id], [room_number], [period], [day]) VALUES (3, 3, 31, 4, 2440, 1, 1)
INSERT [dbo].[sessions] ([session_id], [teacher_id], [homeroom_id], [subject_id], [room_number], [period], [day]) VALUES (4, 4, 8, 5, 201, 6, 6)
INSERT [dbo].[sessions] ([session_id], [teacher_id], [homeroom_id], [subject_id], [room_number], [period], [day]) VALUES (5, 5, 25, 6, 2040, 3, 5)
INSERT [dbo].[sessions] ([session_id], [teacher_id], [homeroom_id], [subject_id], [room_number], [period], [day]) VALUES (6, 6, 33, 7, 996, 1, 1)
INSERT [dbo].[sessions] ([session_id], [teacher_id], [homeroom_id], [subject_id], [room_number], [period], [day]) VALUES (7, 7, 15, 8, 215, 1, 2)
INSERT [dbo].[sessions] ([session_id], [teacher_id], [homeroom_id], [subject_id], [room_number], [period], [day]) VALUES (8, 8, 23, 8, 2022, 2, 3)
SET IDENTITY_INSERT [dbo].[sessions] OFF
GO
SET IDENTITY_INSERT [dbo].[students] ON 

INSERT [dbo].[students] ([student_id], [school_id], [homeroom_id], [fiche_id], [first_name], [last_name], [grade], [email]) VALUES (8, 1, 1, 87750, N'Micheal', N'Scofield', 1, N'mscofield01@pearson.ca')
INSERT [dbo].[students] ([student_id], [school_id], [homeroom_id], [fiche_id], [first_name], [last_name], [grade], [email]) VALUES (9, 1, 1, 417619, N'Justin', N'Johnson', 1, N'jjohnson01@pearson.ca')
INSERT [dbo].[students] ([student_id], [school_id], [homeroom_id], [fiche_id], [first_name], [last_name], [grade], [email]) VALUES (10, 1, 3, 440951, N'Madden', N'White', 1, N'mwhite01@pearson.ca')
INSERT [dbo].[students] ([student_id], [school_id], [homeroom_id], [fiche_id], [first_name], [last_name], [grade], [email]) VALUES (11, 2, 15, 29206, N'Janet', N'Jackson', 7, N'jjackson01@pearson.ca')
INSERT [dbo].[students] ([student_id], [school_id], [homeroom_id], [fiche_id], [first_name], [last_name], [grade], [email]) VALUES (12, 2, 17, 449925, N'Stephen', N'Sinclair', 7, N'ssinclair01@pearson.ca')
INSERT [dbo].[students] ([student_id], [school_id], [homeroom_id], [fiche_id], [first_name], [last_name], [grade], [email]) VALUES (13, 2, 25, 75711, N'Anoot', N'Makasala', 11, N'amakasala01@pearson.ca')
INSERT [dbo].[students] ([student_id], [school_id], [homeroom_id], [fiche_id], [first_name], [last_name], [grade], [email]) VALUES (14, 3, 29, 438126, N'Jean-Francois', N'Dubois', 12, N'jdubois01@pearson.ca')
INSERT [dbo].[students] ([student_id], [school_id], [homeroom_id], [fiche_id], [first_name], [last_name], [grade], [email]) VALUES (15, 3, 29, 123456, N'Kamir', N'Jakeem', 12, N'kjakeem01@pearson.ca')
INSERT [dbo].[students] ([student_id], [school_id], [homeroom_id], [fiche_id], [first_name], [last_name], [grade], [email]) VALUES (16, 3, 29, 654321, N'Michael', N'Kansas', 12, N'mkansas01@pearson.ca')
INSERT [dbo].[students] ([student_id], [school_id], [homeroom_id], [fiche_id], [first_name], [last_name], [grade], [email]) VALUES (17, 5, 13, 133769, N'Robert', N'Fischer', 6, N'rfischer01@pearson.ca')
INSERT [dbo].[students] ([student_id], [school_id], [homeroom_id], [fiche_id], [first_name], [last_name], [grade], [email]) VALUES (18, 5, 14, 154868, N'Vanessa', N'Hart', 6, N'vhart01@pearson.ca')
INSERT [dbo].[students] ([student_id], [school_id], [homeroom_id], [fiche_id], [first_name], [last_name], [grade], [email]) VALUES (19, 5, 15, 154854, N'Alyssa', N'unochini', 6, N'aunochini01@pearson.ca')
INSERT [dbo].[students] ([student_id], [school_id], [homeroom_id], [fiche_id], [first_name], [last_name], [grade], [email]) VALUES (20, 6, 20, 911286, N'Darlene', N'Watsons', 9, N'dwatsons01@pearson.ca')
INSERT [dbo].[students] ([student_id], [school_id], [homeroom_id], [fiche_id], [first_name], [last_name], [grade], [email]) VALUES (21, 6, 21, 837163, N'Micheal', N'White', 9, N'mwhite02@pearson.ca')
INSERT [dbo].[students] ([student_id], [school_id], [homeroom_id], [fiche_id], [first_name], [last_name], [grade], [email]) VALUES (22, 6, 21, 751268, N'Francis', N'Perrault', 9, N'fperrault01@pearson.ca')
INSERT [dbo].[students] ([student_id], [school_id], [homeroom_id], [fiche_id], [first_name], [last_name], [grade], [email]) VALUES (23, 7, 33, 428974, N'Jessica', N'Pearson', 11, N'jpearson01@pearson.ca')
INSERT [dbo].[students] ([student_id], [school_id], [homeroom_id], [fiche_id], [first_name], [last_name], [grade], [email]) VALUES (24, 7, 33, 618480, N'Denzel', N'Washington', 11, N'dwashington01@pearson.ca')
INSERT [dbo].[students] ([student_id], [school_id], [homeroom_id], [fiche_id], [first_name], [last_name], [grade], [email]) VALUES (25, 7, 32, 40273, N'Chun Ju', N'Ho', 11, N'cho01@pearson.ca')
INSERT [dbo].[students] ([student_id], [school_id], [homeroom_id], [fiche_id], [first_name], [last_name], [grade], [email]) VALUES (26, 9, 8, 236920, N'Julie', N'Gagnon', 4, N'jgagnon01@pearson.ca')
INSERT [dbo].[students] ([student_id], [school_id], [homeroom_id], [fiche_id], [first_name], [last_name], [grade], [email]) VALUES (27, 9, 12, 915883, N'Marc', N'Beauchemin', 5, N'mbeachemin01@pearson.ca')
INSERT [dbo].[students] ([student_id], [school_id], [homeroom_id], [fiche_id], [first_name], [last_name], [grade], [email]) VALUES (28, 9, 5, 588018, N'Lakisha', N'Sinclair', 2, N'lsinclair01@pearson.ca')
INSERT [dbo].[students] ([student_id], [school_id], [homeroom_id], [fiche_id], [first_name], [last_name], [grade], [email]) VALUES (29, 10, 19, 834083, N'Frank', N'Einstein', 8, N'feinstein01@pearson.ca')
INSERT [dbo].[students] ([student_id], [school_id], [homeroom_id], [fiche_id], [first_name], [last_name], [grade], [email]) VALUES (30, 10, 17, 583859, N'Suzanne', N'White', 7, N'swhite01@pearson.ca')
INSERT [dbo].[students] ([student_id], [school_id], [homeroom_id], [fiche_id], [first_name], [last_name], [grade], [email]) VALUES (31, 10, 24, 102035, N'Justin', N'Johnson', 10, N'jjohnson04@pearson.ca')
SET IDENTITY_INSERT [dbo].[students] OFF
GO
SET IDENTITY_INSERT [dbo].[subjects] ON 

INSERT [dbo].[subjects] ([subject_id], [school_id], [teacher_id], [name], [grade]) VALUES (1, 1, 1, N'math', 1)
INSERT [dbo].[subjects] ([subject_id], [school_id], [teacher_id], [name], [grade]) VALUES (2, 2, 2, N'geography', 7)
INSERT [dbo].[subjects] ([subject_id], [school_id], [teacher_id], [name], [grade]) VALUES (4, 3, 3, N'computing support', 12)
INSERT [dbo].[subjects] ([subject_id], [school_id], [teacher_id], [name], [grade]) VALUES (5, 5, 4, N'gym', 4)
INSERT [dbo].[subjects] ([subject_id], [school_id], [teacher_id], [name], [grade]) VALUES (6, 6, 5, N'english', 11)
INSERT [dbo].[subjects] ([subject_id], [school_id], [teacher_id], [name], [grade]) VALUES (7, 7, 6, N'interior design', 12)
INSERT [dbo].[subjects] ([subject_id], [school_id], [teacher_id], [name], [grade]) VALUES (8, 9, 7, N'science', 6)
INSERT [dbo].[subjects] ([subject_id], [school_id], [teacher_id], [name], [grade]) VALUES (9, 10, 8, N'science', 10)
SET IDENTITY_INSERT [dbo].[subjects] OFF
GO
SET IDENTITY_INSERT [dbo].[teachers] ON 

INSERT [dbo].[teachers] ([teacher_id], [homeroom_id], [school_id], [employee_id], [first_name], [last_name]) VALUES (1, 1, 1, 14, N'Elaine', N'Fischer')
INSERT [dbo].[teachers] ([teacher_id], [homeroom_id], [school_id], [employee_id], [first_name], [last_name]) VALUES (2, 16, 2, 16, N'Bobert', N'Zane')
INSERT [dbo].[teachers] ([teacher_id], [homeroom_id], [school_id], [employee_id], [first_name], [last_name]) VALUES (3, 31, 3, 18, N'Muhammad', N'Ali')
INSERT [dbo].[teachers] ([teacher_id], [homeroom_id], [school_id], [employee_id], [first_name], [last_name]) VALUES (4, 8, 5, 19, N'Allison', N'Grove')
INSERT [dbo].[teachers] ([teacher_id], [homeroom_id], [school_id], [employee_id], [first_name], [last_name]) VALUES (5, 25, 6, 20, N'Karen', N'Shorts')
INSERT [dbo].[teachers] ([teacher_id], [homeroom_id], [school_id], [employee_id], [first_name], [last_name]) VALUES (6, 33, 7, 21, N'Dennis', N'Whitman')
INSERT [dbo].[teachers] ([teacher_id], [homeroom_id], [school_id], [employee_id], [first_name], [last_name]) VALUES (7, 15, 9, 22, N'Cindy', N'Viger')
INSERT [dbo].[teachers] ([teacher_id], [homeroom_id], [school_id], [employee_id], [first_name], [last_name]) VALUES (8, 23, 10, 23, N'Piya', N'Patel')
SET IDENTITY_INSERT [dbo].[teachers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_employees_email]    Script Date: 1/9/2023 7:33:11 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_employees_email] ON [dbo].[employees]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_employees_username]    Script Date: 1/9/2023 7:33:11 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_employees_username] ON [dbo].[employees]
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__schools__357D4CF951B19280]    Script Date: 1/9/2023 7:33:11 AM ******/
ALTER TABLE [dbo].[schools] ADD UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__schools__72E12F1B09FD9344]    Script Date: 1/9/2023 7:33:11 AM ******/
ALTER TABLE [dbo].[schools] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__students__283BC9C5E6354A61]    Script Date: 1/9/2023 7:33:11 AM ******/
ALTER TABLE [dbo].[students] ADD UNIQUE NONCLUSTERED 
(
	[fiche_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__students__AB6E61643EB7849C]    Script Date: 1/9/2023 7:33:11 AM ******/
ALTER TABLE [dbo].[students] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [FK_employees_schools] FOREIGN KEY([school_id])
REFERENCES [dbo].[schools] ([school_id])
GO
ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [FK_employees_schools]
GO
ALTER TABLE [dbo].[schools]  WITH CHECK ADD  CONSTRAINT [FK_schools_school_levels] FOREIGN KEY([level_id])
REFERENCES [dbo].[school_levels] ([level_id])
GO
ALTER TABLE [dbo].[schools] CHECK CONSTRAINT [FK_schools_school_levels]
GO
ALTER TABLE [dbo].[sessions]  WITH CHECK ADD  CONSTRAINT [FK_sessions_homerooms] FOREIGN KEY([homeroom_id])
REFERENCES [dbo].[homerooms] ([homeroom_id])
GO
ALTER TABLE [dbo].[sessions] CHECK CONSTRAINT [FK_sessions_homerooms]
GO
ALTER TABLE [dbo].[sessions]  WITH CHECK ADD  CONSTRAINT [FK_sessions_teachers] FOREIGN KEY([teacher_id])
REFERENCES [dbo].[teachers] ([teacher_id])
GO
ALTER TABLE [dbo].[sessions] CHECK CONSTRAINT [FK_sessions_teachers]
GO
ALTER TABLE [dbo].[students]  WITH CHECK ADD  CONSTRAINT [FK_students_homerooms] FOREIGN KEY([homeroom_id])
REFERENCES [dbo].[homerooms] ([homeroom_id])
GO
ALTER TABLE [dbo].[students] CHECK CONSTRAINT [FK_students_homerooms]
GO
ALTER TABLE [dbo].[students]  WITH CHECK ADD  CONSTRAINT [FK_students_schools] FOREIGN KEY([school_id])
REFERENCES [dbo].[schools] ([school_id])
GO
ALTER TABLE [dbo].[students] CHECK CONSTRAINT [FK_students_schools]
GO
ALTER TABLE [dbo].[subjects]  WITH CHECK ADD  CONSTRAINT [FK_subjects_school] FOREIGN KEY([school_id])
REFERENCES [dbo].[schools] ([school_id])
GO
ALTER TABLE [dbo].[subjects] CHECK CONSTRAINT [FK_subjects_school]
GO
ALTER TABLE [dbo].[subjects]  WITH CHECK ADD  CONSTRAINT [FK_subjects_teachers] FOREIGN KEY([teacher_id])
REFERENCES [dbo].[teachers] ([teacher_id])
GO
ALTER TABLE [dbo].[subjects] CHECK CONSTRAINT [FK_subjects_teachers]
GO
ALTER TABLE [dbo].[teachers]  WITH CHECK ADD  CONSTRAINT [FK__teachers__employees] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employees] ([employee_id])
GO
ALTER TABLE [dbo].[teachers] CHECK CONSTRAINT [FK__teachers__employees]
GO
ALTER TABLE [dbo].[teachers]  WITH CHECK ADD FOREIGN KEY([school_id])
REFERENCES [dbo].[schools] ([school_id])
GO
ALTER TABLE [dbo].[teachers]  WITH CHECK ADD  CONSTRAINT [FK_teachers_homerooms] FOREIGN KEY([homeroom_id])
REFERENCES [dbo].[homerooms] ([homeroom_id])
GO
ALTER TABLE [dbo].[teachers] CHECK CONSTRAINT [FK_teachers_homerooms]
GO
ALTER TABLE [dbo].[sessions]  WITH CHECK ADD  CONSTRAINT [check_day] CHECK  (([day]>=(1) AND [day]<=(6)))
GO
ALTER TABLE [dbo].[sessions] CHECK CONSTRAINT [check_day]
GO
ALTER TABLE [dbo].[students]  WITH CHECK ADD  CONSTRAINT [CK_students_grade] CHECK  (([grade]>=(0) AND [grade]<=(12)))
GO
ALTER TABLE [dbo].[students] CHECK CONSTRAINT [CK_students_grade]
GO
ALTER TABLE [dbo].[subjects]  WITH CHECK ADD  CONSTRAINT [check_grade] CHECK  (([grade]>=(0) AND [grade]<=(12)))
GO
ALTER TABLE [dbo].[subjects] CHECK CONSTRAINT [check_grade]
GO
USE [master]
GO
ALTER DATABASE [lbpsb_project] SET  READ_WRITE 
GO
