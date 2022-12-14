USE [master]
GO
/****** Object:  Database [lbpsb_project]    Script Date: 1/9/2023 7:31:02 AM ******/
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
/****** Object:  User [kaz]    Script Date: 1/9/2023 7:31:02 AM ******/
CREATE USER [kaz] FOR LOGIN [kaz] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 1/9/2023 7:31:02 AM ******/
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
/****** Object:  Table [dbo].[homerooms]    Script Date: 1/9/2023 7:31:02 AM ******/
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
/****** Object:  Table [dbo].[school_levels]    Script Date: 1/9/2023 7:31:02 AM ******/
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
/****** Object:  Table [dbo].[schools]    Script Date: 1/9/2023 7:31:02 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sessions]    Script Date: 1/9/2023 7:31:02 AM ******/
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
/****** Object:  Table [dbo].[students]    Script Date: 1/9/2023 7:31:02 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[fiche_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subjects]    Script Date: 1/9/2023 7:31:02 AM ******/
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
/****** Object:  Table [dbo].[teachers]    Script Date: 1/9/2023 7:31:02 AM ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_employees_email]    Script Date: 1/9/2023 7:31:02 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_employees_email] ON [dbo].[employees]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_employees_username]    Script Date: 1/9/2023 7:31:02 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_employees_username] ON [dbo].[employees]
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
