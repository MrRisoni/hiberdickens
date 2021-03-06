USE [master]
GO
/****** Object:  Database [dickenserp]    Script Date: 2020-12-05 11:02:00 ******/
CREATE DATABASE [dickenserp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dickenserp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dickenserp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dickenserp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dickenserp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dickenserp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dickenserp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dickenserp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dickenserp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dickenserp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dickenserp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dickenserp] SET ARITHABORT OFF 
GO
ALTER DATABASE [dickenserp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dickenserp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dickenserp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dickenserp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dickenserp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dickenserp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dickenserp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dickenserp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dickenserp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dickenserp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dickenserp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dickenserp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dickenserp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dickenserp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dickenserp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dickenserp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dickenserp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dickenserp] SET RECOVERY FULL 
GO
ALTER DATABASE [dickenserp] SET  MULTI_USER 
GO
ALTER DATABASE [dickenserp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dickenserp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dickenserp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dickenserp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dickenserp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dickenserp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dickenserp', N'ON'
GO
ALTER DATABASE [dickenserp] SET QUERY_STORE = OFF
GO
USE [dickenserp]
GO
/****** Object:  Table [dbo].[absencies]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[absencies](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[history_id] [bigint] NOT NULL,
	[student_id] [bigint] NOT NULL,
	[justified] [tinyint] NOT NULL,
	[comment] [text] NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_absencies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ages]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ages](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[banks]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[banks](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_banks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[buildings]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[buildings](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[suburb_id] [bigint] NOT NULL,
 CONSTRAINT [PK_buildings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course_fees]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_fees](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_id] [bigint] NOT NULL,
	[age_id] [bigint] NOT NULL,
	[speed_id] [bigint] NOT NULL,
	[fee] [decimal](10, 2) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_course_fees] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course_grades]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_grades](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](80) NOT NULL,
	[course_id] [bigint] NOT NULL,
	[ranking] [int] NOT NULL,
 CONSTRAINT [PK_course_grades] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course_types]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_types](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_course_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course_wages]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_wages](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_id] [bigint] NOT NULL,
	[age_id] [bigint] NOT NULL,
	[speed_id] [bigint] NOT NULL,
	[wage] [decimal](10, 2) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_course_wages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_type_id] [bigint] NOT NULL,
	[title] [varchar](80) NOT NULL,
	[active] [tinyint] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_courses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses_fees_history]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses_fees_history](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_id] [bigint] NOT NULL,
	[fee] [decimal](10, 2) NOT NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_courses_fees_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses_wages_history]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses_wages_history](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_id] [bigint] NOT NULL,
	[wage] [decimal](10, 2) NOT NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_courses_wages_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[days]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[days](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_days] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[diplomas]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diplomas](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[language_id] [bigint] NOT NULL,
	[course_id] [bigint] NOT NULL,
	[institut_id] [bigint] NOT NULL,
	[lvl] [varchar](20) NOT NULL,
	[active] [tinyint] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_diplomas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[disciplines]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[disciplines](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_disciplines] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discount_model]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discount_model](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[percentage] [decimal](10, 2) NOT NULL,
	[active] [tinyint] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[expires_at] [datetime] NOT NULL,
 CONSTRAINT [PK_discount_model] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discounts]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discounts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[student_id] [bigint] NOT NULL,
	[discount_id] [bigint] NOT NULL,
	[group_id] [bigint] NOT NULL,
	[active] [tinyint] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_discounts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grading_sys]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grading_sys](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_grading_sys] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[group_ranks]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[group_ranks](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[ranking] [int] NOT NULL,
 CONSTRAINT [PK_group_ranks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[group_students]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[group_students](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[group_id] [bigint] NOT NULL,
	[student_id] [bigint] NULL,
	[joined] [datetime] NOT NULL,
	[dropped] [datetime] NULL,
	[total_payed] [decimal](10, 2) NOT NULL,
	[total_debt] [decimal](10, 2) NOT NULL,
	[last_payed_at] [datetime] NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_group_students] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[group_teachers]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[group_teachers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[group_id] [bigint] NOT NULL,
	[teacher_id] [bigint] NOT NULL,
	[wage] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_group_teachers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[groupakia]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[groupakia](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](80) NOT NULL,
	[course_id] [bigint] NULL,
	[speed_id] [bigint] NOT NULL,
	[rank_id] [bigint] NOT NULL,
	[age_id] [bigint] NOT NULL,
	[fee_id] [bigint] NOT NULL,
	[wage_id] [bigint] NOT NULL,
	[max_seats] [int] NOT NULL,
	[remain_seats] [int] NOT NULL,
	[current_seats] [int] NOT NULL,
	[active] [tinyint] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[ends_at] [datetime] NOT NULL,
 CONSTRAINT [PK_groupakia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[groups_teachers_wages_history]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[groups_teachers_wages_history](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[group_id] [bigint] NOT NULL,
	[teacher_id] [bigint] NOT NULL,
	[wage] [decimal](10, 2) NOT NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_groups_teachers_wages_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[history]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[history](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[group_id] [bigint] NOT NULL,
	[teacher_id] [bigint] NOT NULL,
	[room_id] [bigint] NOT NULL,
	[day_id] [bigint] NOT NULL,
	[hour_id] [bigint] NOT NULL,
	[starts_at] [datetime] NOT NULL,
	[ends_at] [datetime] NOT NULL,
	[duration] [decimal](5, 2) NOT NULL,
	[cancelled] [tinyint] NOT NULL,
	[wage] [decimal](10, 2) NOT NULL,
	[fee] [decimal](10, 2) NOT NULL,
	[vat] [decimal](10, 2) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hours]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hours](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_hours] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instituts]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instituts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[active] [tinyint] NOT NULL,
 CONSTRAINT [PK_instituts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[interview_schedule]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[interview_schedule](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[application_id] [bigint] NOT NULL,
	[starts_at] [datetime] NOT NULL,
	[ends_at] [datetime] NOT NULL,
	[active] [tinyint] NOT NULL,
 CONSTRAINT [PK_interview_schedule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[interview_stages]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[interview_stages](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[opening_id] [bigint] NOT NULL,
	[title] [varchar](50) NOT NULL,
	[active] [tinyint] NOT NULL,
	[shown_order] [tinyint] NOT NULL,
 CONSTRAINT [PK_interview_stages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[interviews_grading]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[interviews_grading](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[stage_id] [bigint] NOT NULL,
	[application_id] [bigint] NOT NULL,
	[grade] [decimal](5, 2) NOT NULL,
	[passed] [tinyint] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[evaluated_at] [datetime] NOT NULL,
	[evaluated] [tinyint] NOT NULL,
	[notes] [text] NOT NULL,
 CONSTRAINT [PK_interviews_grading] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[job_application_courses]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[job_application_courses](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[application_id] [bigint] NOT NULL,
	[course_id] [bigint] NOT NULL,
 CONSTRAINT [PK_job_application_courses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[job_application_studies]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[job_application_studies](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[application_id] [bigint] NOT NULL,
	[school_title] [varchar](250) NOT NULL,
	[description] [text] NOT NULL,
	[grade] [nchar](4) NOT NULL,
	[joined_on] [date] NOT NULL,
	[graduated_on] [date] NOT NULL,
 CONSTRAINT [PK_job_application_studies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[job_application_work]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[job_application_work](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[application_id] [bigint] NOT NULL,
	[job_title] [varchar](90) NOT NULL,
	[company_name] [varchar](90) NOT NULL,
	[description] [text] NOT NULL,
	[joined_on] [date] NOT NULL,
	[left_on] [date] NOT NULL,
 CONSTRAINT [PK_job_application_work] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[job_applications]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[job_applications](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[opening_id] [bigint] NOT NULL,
	[full_name] [varchar](255) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[dob] [date] NOT NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_job_applications] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[job_opening_courses]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[job_opening_courses](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[opening_id] [bigint] NOT NULL,
	[course_id] [bigint] NOT NULL,
 CONSTRAINT [PK_job_opening_courses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[job_openings]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[job_openings](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](250) NOT NULL,
	[description] [text] NOT NULL,
	[active] [tinyint] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[starts_at] [datetime] NOT NULL,
	[ends_at] [datetime] NOT NULL,
 CONSTRAINT [PK_job_openings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[languages]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[languages](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[active] [tinyint] NOT NULL,
 CONSTRAINT [PK_languages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logbook]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logbook](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[history_id] [bigint] NOT NULL,
	[teacher_id] [bigint] NOT NULL,
	[notes] [text] NOT NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_logbook] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[members]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[members](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[surname] [varchar](50) NOT NULL,
	[address] [varchar](250) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_members] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mock_exams]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mock_exams](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[period_id] [bigint] NOT NULL,
	[group_id] [bigint] NOT NULL,
	[grad_sys_id] [bigint] NOT NULL,
	[exam_year] [date] NOT NULL,
	[title] [varchar](250) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_mock_exams] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mock_exams_results_numeric]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mock_exams_results_numeric](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[exam_id] [bigint] NOT NULL,
	[student_id] [bigint] NOT NULL,
	[grade] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_mock_exams_results_numeric] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mock_exams_results_text]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mock_exams_results_text](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[student_id] [bigint] NOT NULL,
	[exam_id] [bigint] NOT NULL,
	[text_grade_id] [bigint] NOT NULL,
 CONSTRAINT [PK_mock_exams_results_text] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[months]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[months](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_months] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[musical_instrument_type]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[musical_instrument_type](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_musical_instrument_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[musical_instruments]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[musical_instruments](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type_id] [bigint] NOT NULL,
	[course_id] [bigint] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_musical_instruments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parents]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parents](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[surname] [varchar](50) NOT NULL,
	[phone] [varchar](50) NULL,
 CONSTRAINT [PK_parents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parents_children]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parents_children](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[parent_id] [bigint] NOT NULL,
	[child_id] [bigint] NOT NULL,
 CONSTRAINT [PK_parents_children] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payments_in_advance]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payments_in_advance](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[group_id] [bigint] NOT NULL,
	[student_id] [bigint] NOT NULL,
	[amount] [decimal](5, 2) NOT NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_payments_in_advance] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payroll]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[teacher_id] [bigint] NOT NULL,
	[month_id] [bigint] NOT NULL,
	[gross] [decimal](10, 2) NOT NULL,
	[net] [decimal](10, 2) NOT NULL,
	[insurances] [decimal](10, 2) NOT NULL,
	[total_hours] [decimal](10, 2) NOT NULL,
	[fiscal_year] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_payroll] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payroll_analysis]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll_analysis](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[payroll_id] [bigint] NOT NULL,
	[payroll_category_id] [bigint] NOT NULL,
	[amount] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_payroll_analysis] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payroll_categories]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll_categories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_payroll_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payroll_groups_analysis]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll_groups_analysis](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[payroll_id] [bigint] NOT NULL,
	[group_id] [bigint] NOT NULL,
	[from_day] [date] NOT NULL,
	[to_day] [date] NOT NULL,
	[hourly_date] [decimal](10, 2) NOT NULL,
	[amount] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_payroll_groups_analysis] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[perfectures]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perfectures](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_perfectures] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[periods]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[periods](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_periods] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pool_chapters]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pool_chapters](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pool_id] [bigint] NOT NULL,
	[title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_pool_chapters] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pool_question_answers]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pool_question_answers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[question_id] [bigint] NOT NULL,
	[body] [text] NOT NULL,
	[wrong] [tinyint] NOT NULL,
 CONSTRAINT [PK_pool_question_answers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pool_questions]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pool_questions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[chapter_id] [bigint] NOT NULL,
	[body] [text] NOT NULL,
 CONSTRAINT [PK_pool_questions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pool_review_questions]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pool_review_questions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NOT NULL,
 CONSTRAINT [PK_pool_review_questions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pools]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pools](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_id] [bigint] NOT NULL,
	[title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_pools] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[real_exams]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[real_exams](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[period_id] [bigint] NOT NULL,
	[group_id] [bigint] NOT NULL,
	[grad_sys_id] [bigint] NOT NULL,
	[exam_year] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [date] NOT NULL,
 CONSTRAINT [PK_real_exams] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[real_exams_results_numeric]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[real_exams_results_numeric](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[exam_id] [bigint] NOT NULL,
	[student_id] [bigint] NOT NULL,
	[grade] [decimal](10, 2) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_real_exams_results_numeric] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[real_exams_results_text]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[real_exams_results_text](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[exam_id] [bigint] NOT NULL,
	[student_id] [bigint] NOT NULL,
	[text_grade_id] [bigint] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [bigint] NOT NULL,
 CONSTRAINT [PK_real_exams_results_text] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[registration_fees]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registration_fees](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[student_id] [bigint] NOT NULL,
	[group_id] [bigint] NOT NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_registration_fees] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[revenue]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[revenue](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[profit] [decimal](10, 2) NOT NULL,
	[gross_income] [decimal](10, 2) NOT NULL,
	[net_income] [decimal](10, 2) NOT NULL,
	[student_payments] [decimal](10, 2) NOT NULL,
	[total_expenses] [decimal](10, 2) NOT NULL,
	[taxes] [decimal](10, 2) NOT NULL,
	[staff_payments] [decimal](10, 2) NOT NULL,
	[staff_insurances] [decimal](10, 2) NOT NULL,
	[staff_net_payments] [decimal](10, 2) NOT NULL,
	[student_debts] [decimal](10, 2) NOT NULL,
	[staff_in_debt] [decimal](10, 2) NOT NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_revenue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[revenue_categories]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[revenue_categories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_revenue_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[review_questionnaire]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review_questionnaire](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[teacher_id] [bigint] NOT NULL,
	[title] [varchar](250) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[avg_grade] [float] NOT NULL,
 CONSTRAINT [PK_review_questionnaire] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[review_questionnaire_chapters]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review_questionnaire_chapters](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[shown_order] [int] NOT NULL,
 CONSTRAINT [PK_review_questionnaire_chapters] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[review_questionnaire_questions]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review_questionnaire_questions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[questionnaire_id] [bigint] NOT NULL,
	[chapter_id] [bigint] NOT NULL,
	[question_id] [bigint] NOT NULL,
 CONSTRAINT [PK_review_questionnaire_questions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[review_questionnaire_submission]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review_questionnaire_submission](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[questionnaire_id] [bigint] NOT NULL,
	[pseudonym] [varchar](50) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[avg_grade] [float] NOT NULL,
 CONSTRAINT [PK_review_questionnaire_submission] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[review_submission_answers]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review_submission_answers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[submission_id] [bigint] NOT NULL,
	[question_id] [bigint] NOT NULL,
	[grade] [float] NOT NULL,
 CONSTRAINT [PK_review_submission_answers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rooms]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rooms](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[building_id] [bigint] NOT NULL,
	[title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_rooms] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salary_history]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salary_history](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[teacher_id] [bigint] NOT NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_salary_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[school_classes]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[school_classes](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[show_order] [int] NOT NULL,
 CONSTRAINT [PK_school_classes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[school_courses]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[school_courses](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_id] [bigint] NOT NULL,
	[school_class_id] [bigint] NOT NULL,
	[discipline_id] [bigint] NOT NULL,
 CONSTRAINT [PK_school_courses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seminar_categories]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seminar_categories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[active] [tinyint] NOT NULL,
 CONSTRAINT [PK_seminar_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seminar_groups]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seminar_groups](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[module_id] [bigint] NOT NULL,
	[group_id] [bigint] NOT NULL,
 CONSTRAINT [PK_seminar_groups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seminar_modules]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seminar_modules](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[seminar_id] [bigint] NOT NULL,
	[title] [varchar](250) NOT NULL,
	[active] [tinyint] NOT NULL,
	[part_time] [tinyint] NOT NULL,
	[on_site] [tinyint] NOT NULL,
	[cost] [decimal](10, 2) NOT NULL,
	[starts] [datetime] NOT NULL,
	[ends] [datetime] NOT NULL,
	[max_seats] [int] NOT NULL,
	[total_hours] [int] NOT NULL,
	[cost_per_hour] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_seminar_modules] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seminars]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seminars](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](250) NOT NULL,
	[seminar_category_id] [bigint] NOT NULL,
 CONSTRAINT [PK_seminars] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[speeds]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[speeds](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_speeds] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_debts]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_debts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[student_id] [bigint] NOT NULL,
	[group_id] [bigint] NOT NULL,
	[month_id] [bigint] NOT NULL,
	[lesson_year] [int] NOT NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[starts_at] [datetime] NOT NULL,
	[ends_at] [datetime] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_student_debts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_payed]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_payed](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[student_id] [bigint] NOT NULL,
	[group_id] [bigint] NOT NULL,
	[month_id] [bigint] NOT NULL,
	[lesson_year] [int] NOT NULL,
	[bank_id] [bigint] NOT NULL,
	[bank_transaction_id] [bigint] NOT NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_student_payed] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[member_id] [bigint] NOT NULL,
	[total_debt] [decimal](10, 2) NOT NULL,
	[total_payed] [decimal](10, 2) NOT NULL,
	[calculated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_students] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suburbs]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suburbs](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_suburbs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teacher_debts]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher_debts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[teacher_id] [bigint] NOT NULL,
	[group_id] [bigint] NOT NULL,
	[month_id] [bigint] NOT NULL,
	[lesson_year] [int] NOT NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[starts_at] [datetime] NOT NULL,
	[ends_at] [datetime] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_teacher_debts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teacher_leave_days]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher_leave_days](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[teacher_id] [bigint] NOT NULL,
	[starting] [datetime] NOT NULL,
	[ending] [datetime] NOT NULL,
 CONSTRAINT [PK_teacher_leave_days] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teacher_payments]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher_payments](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[teacher_id] [bigint] NOT NULL,
	[group_id] [bigint] NOT NULL,
	[month_id] [bigint] NOT NULL,
	[lesson_year] [int] NOT NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_teacher_payments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teachers]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teachers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[member_id] [bigint] NOT NULL,
	[total_debt] [decimal](10, 2) NOT NULL,
	[total_payed] [decimal](10, 2) NOT NULL,
	[calculated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_teacherss] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teaches]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teaches](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[teacher_id] [bigint] NOT NULL,
	[course_id] [bigint] NOT NULL,
 CONSTRAINT [PK_teachers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_progress]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_progress](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[submission_id] [bigint] NOT NULL,
	[question_id] [bigint] NOT NULL,
	[shown_at] [datetime] NOT NULL,
	[answered_at] [datetime] NOT NULL,
 CONSTRAINT [PK_test_progress] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_questions]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_questions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pool_question_id] [bigint] NOT NULL,
	[test_id] [bigint] NOT NULL,
	[points] [tinyint] NOT NULL,
	[penalty] [tinyint] NOT NULL,
	[shown_order] [tinyint] NOT NULL,
	[active] [tinyint] NOT NULL,
	[multiple_select] [tinyint] NOT NULL,
 CONSTRAINT [PK_test_questions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_submissions]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_submissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[application_id] [bigint] NOT NULL,
	[session_id] [varchar](255) NOT NULL,
	[test_id] [bigint] NOT NULL,
	[time_window_starts] [datetime] NOT NULL,
	[time_window_ends] [datetime] NOT NULL,
	[started_at] [datetime] NOT NULL,
	[ended_at] [datetime] NOT NULL,
	[deadline_at] [datetime] NOT NULL,
	[duration_mins] [int] NOT NULL,
	[mins_remainging] [int] NOT NULL,
	[grade] [decimal](5, 2) NOT NULL,
	[completed] [tinyint] NOT NULL,
	[cheat_counter] [tinyint] NOT NULL,
 CONSTRAINT [PK_test_submissions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_submissions_answers]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_submissions_answers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[submission_id] [bigint] NOT NULL,
	[question_id] [bigint] NOT NULL,
	[answer_id] [bigint] NOT NULL,
 CONSTRAINT [PK_test_submissions_answers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tests]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tests](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_id] [bigint] NOT NULL,
	[title] [varchar](50) NOT NULL,
	[difficulty] [tinyint] NOT NULL,
	[duration_minutes] [int] NOT NULL,
	[description] [text] NOT NULL,
	[active] [tinyint] NOT NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_tests] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[towns]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[towns](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[perfecture_id] [bigint] NOT NULL,
 CONSTRAINT [PK_towns] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transaction_categories]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction_categories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[is_profilt] [tinyint] NOT NULL,
 CONSTRAINT [PK_transaction_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[university]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[university](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[type_id] [bigint] NOT NULL,
 CONSTRAINT [PK_university] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[university_department]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[university_department](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[type_id] [bigint] NOT NULL,
	[active] [tinyint] NOT NULL,
 CONSTRAINT [PK_university_department] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[university_type]    Script Date: 2020-12-05 11:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[university_type](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_university_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ages] ON 

INSERT [dbo].[ages] ([id], [title]) VALUES (1, N'Adults')
SET IDENTITY_INSERT [dbo].[ages] OFF
GO
SET IDENTITY_INSERT [dbo].[banks] ON 

INSERT [dbo].[banks] ([id], [title]) VALUES (1, N'Alpha')
INSERT [dbo].[banks] ([id], [title]) VALUES (2, N'Eurobank')
INSERT [dbo].[banks] ([id], [title]) VALUES (3, N'Pireaus')
INSERT [dbo].[banks] ([id], [title]) VALUES (4, N'Ethinki')
SET IDENTITY_INSERT [dbo].[banks] OFF
GO
SET IDENTITY_INSERT [dbo].[buildings] ON 

INSERT [dbo].[buildings] ([id], [address], [suburb_id]) VALUES (2, N'Ifigeneias 34', 1)
SET IDENTITY_INSERT [dbo].[buildings] OFF
GO
SET IDENTITY_INSERT [dbo].[course_fees] ON 

INSERT [dbo].[course_fees] ([id], [course_id], [age_id], [speed_id], [fee], [created_at], [updated_at]) VALUES (1, 1, 1, 1, CAST(22.00 AS Decimal(10, 2)), CAST(N'2020-12-04T19:00:00.000' AS DateTime), CAST(N'2020-12-04T19:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[course_fees] OFF
GO
SET IDENTITY_INSERT [dbo].[course_types] ON 

INSERT [dbo].[course_types] ([id], [title]) VALUES (1, N'Diplomas')
INSERT [dbo].[course_types] ([id], [title]) VALUES (2, N'School Courses')
SET IDENTITY_INSERT [dbo].[course_types] OFF
GO
SET IDENTITY_INSERT [dbo].[course_wages] ON 

INSERT [dbo].[course_wages] ([id], [course_id], [age_id], [speed_id], [wage], [created_at], [updated_at]) VALUES (1, 1, 1, 1, CAST(15.00 AS Decimal(10, 2)), CAST(N'2020-12-04T19:00:00.000' AS DateTime), CAST(N'2020-12-04T19:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[course_wages] OFF
GO
SET IDENTITY_INSERT [dbo].[courses] ON 

INSERT [dbo].[courses] ([id], [course_type_id], [title], [active], [created_at], [updated_at]) VALUES (1, 1, N'Ruski yazik', 1, CAST(N'2020-12-04T19:00:00.000' AS DateTime), CAST(N'2020-12-04T19:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[courses] OFF
GO
SET IDENTITY_INSERT [dbo].[days] ON 

INSERT [dbo].[days] ([id], [title]) VALUES (1, N'Sunday')
INSERT [dbo].[days] ([id], [title]) VALUES (2, N'Monday')
INSERT [dbo].[days] ([id], [title]) VALUES (3, N'Tuesday')
INSERT [dbo].[days] ([id], [title]) VALUES (4, N'Wednesday')
INSERT [dbo].[days] ([id], [title]) VALUES (5, N'Thursday')
INSERT [dbo].[days] ([id], [title]) VALUES (6, N'Friday')
INSERT [dbo].[days] ([id], [title]) VALUES (7, N'Saturday')
SET IDENTITY_INSERT [dbo].[days] OFF
GO
SET IDENTITY_INSERT [dbo].[diplomas] ON 

INSERT [dbo].[diplomas] ([id], [language_id], [course_id], [institut_id], [lvl], [active], [created_at], [updated_at]) VALUES (1, 1, 1, 1, N'B1', 1, CAST(N'2020-12-04T19:00:00.000' AS DateTime), CAST(N'2020-12-04T19:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[diplomas] OFF
GO
SET IDENTITY_INSERT [dbo].[disciplines] ON 

INSERT [dbo].[disciplines] ([id], [title]) VALUES (1, N'Philosophy')
INSERT [dbo].[disciplines] ([id], [title]) VALUES (2, N'IT')
INSERT [dbo].[disciplines] ([id], [title]) VALUES (3, N'Economics')
INSERT [dbo].[disciplines] ([id], [title]) VALUES (4, N'Engineering')
INSERT [dbo].[disciplines] ([id], [title]) VALUES (5, N'Health')
SET IDENTITY_INSERT [dbo].[disciplines] OFF
GO
SET IDENTITY_INSERT [dbo].[group_ranks] ON 

INSERT [dbo].[group_ranks] ([id], [title], [ranking]) VALUES (1, N'Default', 0)
SET IDENTITY_INSERT [dbo].[group_ranks] OFF
GO
SET IDENTITY_INSERT [dbo].[group_students] ON 

INSERT [dbo].[group_students] ([id], [group_id], [student_id], [joined], [dropped], [total_payed], [total_debt], [last_payed_at], [updated_at]) VALUES (2, 1, 1, CAST(N'2020-12-04T19:00:00.000' AS DateTime), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(30.00 AS Decimal(10, 2)), NULL, CAST(N'2020-12-04T19:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[group_students] OFF
GO
SET IDENTITY_INSERT [dbo].[group_teachers] ON 

INSERT [dbo].[group_teachers] ([id], [group_id], [teacher_id], [wage]) VALUES (7, 1, 3, CAST(12.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[group_teachers] OFF
GO
SET IDENTITY_INSERT [dbo].[groupakia] ON 

INSERT [dbo].[groupakia] ([id], [title], [course_id], [speed_id], [rank_id], [age_id], [fee_id], [wage_id], [max_seats], [remain_seats], [current_seats], [active], [created_at], [updated_at], [ends_at]) VALUES (1, N'Ruski Yiazik', 1, 1, 1, 1, 1, 1, 7, 1, 6, 1, CAST(N'2020-12-04T19:00:00.000' AS DateTime), CAST(N'2020-12-04T19:00:00.000' AS DateTime), CAST(N'2021-12-04T19:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[groupakia] OFF
GO
SET IDENTITY_INSERT [dbo].[history] ON 

INSERT [dbo].[history] ([id], [group_id], [teacher_id], [room_id], [day_id], [hour_id], [starts_at], [ends_at], [duration], [cancelled], [wage], [fee], [vat], [created_at], [updated_at]) VALUES (1, 1, 3, 1, 2, 1, CAST(N'2020-12-06T09:00:00.000' AS DateTime), CAST(N'2020-12-06T10:30:00.000' AS DateTime), CAST(1.50 AS Decimal(5, 2)), 0, CAST(22.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), CAST(1.45 AS Decimal(10, 2)), CAST(N'2020-12-06T09:00:00.000' AS DateTime), CAST(N'2020-12-06T09:00:00.000' AS DateTime))
INSERT [dbo].[history] ([id], [group_id], [teacher_id], [room_id], [day_id], [hour_id], [starts_at], [ends_at], [duration], [cancelled], [wage], [fee], [vat], [created_at], [updated_at]) VALUES (2, 1, 3, 1, 2, 1, CAST(N'2020-12-07T09:00:00.000' AS DateTime), CAST(N'2020-12-07T10:30:00.000' AS DateTime), CAST(1.50 AS Decimal(5, 2)), 0, CAST(22.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), CAST(1.45 AS Decimal(10, 2)), CAST(N'2020-12-06T09:00:00.000' AS DateTime), CAST(N'2020-12-06T09:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[history] OFF
GO
SET IDENTITY_INSERT [dbo].[hours] ON 

INSERT [dbo].[hours] ([id], [title]) VALUES (1, N'0900')
INSERT [dbo].[hours] ([id], [title]) VALUES (2, N'0930')
INSERT [dbo].[hours] ([id], [title]) VALUES (3, N'1000')
INSERT [dbo].[hours] ([id], [title]) VALUES (4, N'1030')
INSERT [dbo].[hours] ([id], [title]) VALUES (5, N'1100')
INSERT [dbo].[hours] ([id], [title]) VALUES (6, N'1130')
INSERT [dbo].[hours] ([id], [title]) VALUES (7, N'1200')
INSERT [dbo].[hours] ([id], [title]) VALUES (8, N'1230')
INSERT [dbo].[hours] ([id], [title]) VALUES (9, N'1300')
INSERT [dbo].[hours] ([id], [title]) VALUES (10, N'1330')
INSERT [dbo].[hours] ([id], [title]) VALUES (11, N'1400')
INSERT [dbo].[hours] ([id], [title]) VALUES (12, N'1430')
INSERT [dbo].[hours] ([id], [title]) VALUES (13, N'1500')
INSERT [dbo].[hours] ([id], [title]) VALUES (14, N'1530')
INSERT [dbo].[hours] ([id], [title]) VALUES (15, N'1600')
INSERT [dbo].[hours] ([id], [title]) VALUES (16, N'1630')
INSERT [dbo].[hours] ([id], [title]) VALUES (17, N'1700')
INSERT [dbo].[hours] ([id], [title]) VALUES (18, N'1730')
INSERT [dbo].[hours] ([id], [title]) VALUES (19, N'1800')
INSERT [dbo].[hours] ([id], [title]) VALUES (20, N'1830')
INSERT [dbo].[hours] ([id], [title]) VALUES (21, N'1900')
INSERT [dbo].[hours] ([id], [title]) VALUES (22, N'1930')
INSERT [dbo].[hours] ([id], [title]) VALUES (23, N'2000')
INSERT [dbo].[hours] ([id], [title]) VALUES (24, N'2030')
INSERT [dbo].[hours] ([id], [title]) VALUES (25, N'2100')
INSERT [dbo].[hours] ([id], [title]) VALUES (26, N'2130')
INSERT [dbo].[hours] ([id], [title]) VALUES (27, N'2200')
SET IDENTITY_INSERT [dbo].[hours] OFF
GO
SET IDENTITY_INSERT [dbo].[instituts] ON 

INSERT [dbo].[instituts] ([id], [title], [active]) VALUES (1, N'Pushkin', 1)
SET IDENTITY_INSERT [dbo].[instituts] OFF
GO
SET IDENTITY_INSERT [dbo].[languages] ON 

INSERT [dbo].[languages] ([id], [title], [active]) VALUES (1, N'Russian', 1)
SET IDENTITY_INSERT [dbo].[languages] OFF
GO
SET IDENTITY_INSERT [dbo].[members] ON 

INSERT [dbo].[members] ([id], [email], [phone], [name], [surname], [address], [created_at], [updated_at]) VALUES (1, N'690123456', N'21012345678', N'Luc', N'Piccard', N'Final frontier', CAST(N'2020-12-04T19:00:00.000' AS DateTime), CAST(N'2020-12-04T19:00:00.000' AS DateTime))
INSERT [dbo].[members] ([id], [email], [phone], [name], [surname], [address], [created_at], [updated_at]) VALUES (2, N'69987655321', N'210987654221', N'Anna', N'Karenina', N'Petersbug', CAST(N'2020-12-04T19:00:00.000' AS DateTime), CAST(N'2020-12-04T19:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[members] OFF
GO
SET IDENTITY_INSERT [dbo].[months] ON 

INSERT [dbo].[months] ([id], [title]) VALUES (1, N'Jan')
INSERT [dbo].[months] ([id], [title]) VALUES (2, N'Feb')
INSERT [dbo].[months] ([id], [title]) VALUES (3, N'Mar')
INSERT [dbo].[months] ([id], [title]) VALUES (4, N'Apr')
INSERT [dbo].[months] ([id], [title]) VALUES (5, N'May')
INSERT [dbo].[months] ([id], [title]) VALUES (6, N'Jun')
INSERT [dbo].[months] ([id], [title]) VALUES (7, N'Jul')
INSERT [dbo].[months] ([id], [title]) VALUES (8, N'Aug')
INSERT [dbo].[months] ([id], [title]) VALUES (9, N'Sep')
INSERT [dbo].[months] ([id], [title]) VALUES (10, N'Ocr')
INSERT [dbo].[months] ([id], [title]) VALUES (11, N'Nov')
INSERT [dbo].[months] ([id], [title]) VALUES (12, N'Dec')
SET IDENTITY_INSERT [dbo].[months] OFF
GO
SET IDENTITY_INSERT [dbo].[perfectures] ON 

INSERT [dbo].[perfectures] ([id], [title]) VALUES (1, N'Attica')
SET IDENTITY_INSERT [dbo].[perfectures] OFF
GO
SET IDENTITY_INSERT [dbo].[rooms] ON 

INSERT [dbo].[rooms] ([id], [building_id], [title]) VALUES (1, 1, N'Alyosha')
SET IDENTITY_INSERT [dbo].[rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[school_classes] ON 

INSERT [dbo].[school_classes] ([id], [title], [show_order]) VALUES (2, N'A Lyk', 4)
INSERT [dbo].[school_classes] ([id], [title], [show_order]) VALUES (3, N'B Lyk', 5)
INSERT [dbo].[school_classes] ([id], [title], [show_order]) VALUES (4, N'C Lyk', 6)
INSERT [dbo].[school_classes] ([id], [title], [show_order]) VALUES (5, N'A Gym', 1)
INSERT [dbo].[school_classes] ([id], [title], [show_order]) VALUES (6, N'B Gym', 2)
INSERT [dbo].[school_classes] ([id], [title], [show_order]) VALUES (7, N'C Gym', 3)
SET IDENTITY_INSERT [dbo].[school_classes] OFF
GO
SET IDENTITY_INSERT [dbo].[speeds] ON 

INSERT [dbo].[speeds] ([id], [title]) VALUES (1, N'Fast track')
SET IDENTITY_INSERT [dbo].[speeds] OFF
GO
SET IDENTITY_INSERT [dbo].[student_debts] ON 

INSERT [dbo].[student_debts] ([id], [student_id], [group_id], [month_id], [lesson_year], [amount], [starts_at], [ends_at], [created_at], [updated_at]) VALUES (1, 1, 1, 12, 2020, CAST(15.00 AS Decimal(10, 2)), CAST(N'2020-12-01T00:00:00.000' AS DateTime), CAST(N'2020-12-31T09:00:00.000' AS DateTime), CAST(N'2020-12-06T09:00:00.000' AS DateTime), CAST(N'2020-12-06T09:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[student_debts] OFF
GO
SET IDENTITY_INSERT [dbo].[students] ON 

INSERT [dbo].[students] ([id], [member_id], [total_debt], [total_payed], [calculated_at]) VALUES (1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-12-04T19:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[students] OFF
GO
SET IDENTITY_INSERT [dbo].[suburbs] ON 

INSERT [dbo].[suburbs] ([id], [title]) VALUES (1, N'Chalandri')
SET IDENTITY_INSERT [dbo].[suburbs] OFF
GO
SET IDENTITY_INSERT [dbo].[teachers] ON 

INSERT [dbo].[teachers] ([id], [member_id], [total_debt], [total_payed], [calculated_at]) VALUES (3, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2020-12-04T19:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[teachers] OFF
GO
SET IDENTITY_INSERT [dbo].[teaches] ON 

INSERT [dbo].[teaches] ([id], [teacher_id], [course_id]) VALUES (1, 2, 1)
SET IDENTITY_INSERT [dbo].[teaches] OFF
GO
SET IDENTITY_INSERT [dbo].[towns] ON 

INSERT [dbo].[towns] ([id], [title], [perfecture_id]) VALUES (1, N'Athens', 1)
SET IDENTITY_INSERT [dbo].[towns] OFF
GO
ALTER TABLE [dbo].[absencies]  WITH CHECK ADD  CONSTRAINT [FK_absencies_history] FOREIGN KEY([history_id])
REFERENCES [dbo].[history] ([id])
GO
ALTER TABLE [dbo].[absencies] CHECK CONSTRAINT [FK_absencies_history]
GO
ALTER TABLE [dbo].[absencies]  WITH CHECK ADD  CONSTRAINT [FK_absencies_students] FOREIGN KEY([student_id])
REFERENCES [dbo].[students] ([id])
GO
ALTER TABLE [dbo].[absencies] CHECK CONSTRAINT [FK_absencies_students]
GO
ALTER TABLE [dbo].[buildings]  WITH CHECK ADD  CONSTRAINT [FK_buildings_suburbs] FOREIGN KEY([suburb_id])
REFERENCES [dbo].[suburbs] ([id])
GO
ALTER TABLE [dbo].[buildings] CHECK CONSTRAINT [FK_buildings_suburbs]
GO
ALTER TABLE [dbo].[course_fees]  WITH CHECK ADD  CONSTRAINT [FK_course_fees_ages] FOREIGN KEY([age_id])
REFERENCES [dbo].[ages] ([id])
GO
ALTER TABLE [dbo].[course_fees] CHECK CONSTRAINT [FK_course_fees_ages]
GO
ALTER TABLE [dbo].[course_fees]  WITH CHECK ADD  CONSTRAINT [FK_course_fees_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[course_fees] CHECK CONSTRAINT [FK_course_fees_courses]
GO
ALTER TABLE [dbo].[course_fees]  WITH CHECK ADD  CONSTRAINT [FK_course_fees_speeds] FOREIGN KEY([speed_id])
REFERENCES [dbo].[speeds] ([id])
GO
ALTER TABLE [dbo].[course_fees] CHECK CONSTRAINT [FK_course_fees_speeds]
GO
ALTER TABLE [dbo].[course_grades]  WITH CHECK ADD  CONSTRAINT [FK_course_grades_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[course_grades] CHECK CONSTRAINT [FK_course_grades_courses]
GO
ALTER TABLE [dbo].[course_wages]  WITH CHECK ADD  CONSTRAINT [FK_course_wages_ages] FOREIGN KEY([age_id])
REFERENCES [dbo].[ages] ([id])
GO
ALTER TABLE [dbo].[course_wages] CHECK CONSTRAINT [FK_course_wages_ages]
GO
ALTER TABLE [dbo].[course_wages]  WITH CHECK ADD  CONSTRAINT [FK_course_wages_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[course_wages] CHECK CONSTRAINT [FK_course_wages_courses]
GO
ALTER TABLE [dbo].[course_wages]  WITH CHECK ADD  CONSTRAINT [FK_course_wages_speeds] FOREIGN KEY([speed_id])
REFERENCES [dbo].[speeds] ([id])
GO
ALTER TABLE [dbo].[course_wages] CHECK CONSTRAINT [FK_course_wages_speeds]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_course_types] FOREIGN KEY([course_type_id])
REFERENCES [dbo].[course_types] ([id])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_course_types]
GO
ALTER TABLE [dbo].[courses_fees_history]  WITH CHECK ADD  CONSTRAINT [FK_courses_fees_history_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[courses_fees_history] CHECK CONSTRAINT [FK_courses_fees_history_courses]
GO
ALTER TABLE [dbo].[courses_wages_history]  WITH CHECK ADD  CONSTRAINT [FK_courses_wages_history_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[courses_wages_history] CHECK CONSTRAINT [FK_courses_wages_history_courses]
GO
ALTER TABLE [dbo].[diplomas]  WITH CHECK ADD  CONSTRAINT [FK_diplomas_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[diplomas] CHECK CONSTRAINT [FK_diplomas_courses]
GO
ALTER TABLE [dbo].[diplomas]  WITH CHECK ADD  CONSTRAINT [FK_diplomas_instituts] FOREIGN KEY([institut_id])
REFERENCES [dbo].[instituts] ([id])
GO
ALTER TABLE [dbo].[diplomas] CHECK CONSTRAINT [FK_diplomas_instituts]
GO
ALTER TABLE [dbo].[diplomas]  WITH CHECK ADD  CONSTRAINT [FK_diplomas_languages] FOREIGN KEY([language_id])
REFERENCES [dbo].[languages] ([id])
GO
ALTER TABLE [dbo].[diplomas] CHECK CONSTRAINT [FK_diplomas_languages]
GO
ALTER TABLE [dbo].[discounts]  WITH CHECK ADD  CONSTRAINT [FK_discounts_discount_model] FOREIGN KEY([discount_id])
REFERENCES [dbo].[discount_model] ([id])
GO
ALTER TABLE [dbo].[discounts] CHECK CONSTRAINT [FK_discounts_discount_model]
GO
ALTER TABLE [dbo].[discounts]  WITH CHECK ADD  CONSTRAINT [FK_discounts_groupakia] FOREIGN KEY([group_id])
REFERENCES [dbo].[groupakia] ([id])
GO
ALTER TABLE [dbo].[discounts] CHECK CONSTRAINT [FK_discounts_groupakia]
GO
ALTER TABLE [dbo].[discounts]  WITH CHECK ADD  CONSTRAINT [FK_discounts_students] FOREIGN KEY([student_id])
REFERENCES [dbo].[students] ([id])
GO
ALTER TABLE [dbo].[discounts] CHECK CONSTRAINT [FK_discounts_students]
GO
ALTER TABLE [dbo].[group_students]  WITH CHECK ADD  CONSTRAINT [FK_group_students_groupakia] FOREIGN KEY([group_id])
REFERENCES [dbo].[groupakia] ([id])
GO
ALTER TABLE [dbo].[group_students] CHECK CONSTRAINT [FK_group_students_groupakia]
GO
ALTER TABLE [dbo].[group_students]  WITH CHECK ADD  CONSTRAINT [FK_group_students_students] FOREIGN KEY([student_id])
REFERENCES [dbo].[students] ([id])
GO
ALTER TABLE [dbo].[group_students] CHECK CONSTRAINT [FK_group_students_students]
GO
ALTER TABLE [dbo].[group_teachers]  WITH CHECK ADD  CONSTRAINT [FK_group_teachers_groupakia] FOREIGN KEY([group_id])
REFERENCES [dbo].[groupakia] ([id])
GO
ALTER TABLE [dbo].[group_teachers] CHECK CONSTRAINT [FK_group_teachers_groupakia]
GO
ALTER TABLE [dbo].[group_teachers]  WITH CHECK ADD  CONSTRAINT [FK_group_teachers_teachers] FOREIGN KEY([teacher_id])
REFERENCES [dbo].[teachers] ([id])
GO
ALTER TABLE [dbo].[group_teachers] CHECK CONSTRAINT [FK_group_teachers_teachers]
GO
ALTER TABLE [dbo].[groupakia]  WITH CHECK ADD  CONSTRAINT [FK_groupakia_ages] FOREIGN KEY([age_id])
REFERENCES [dbo].[ages] ([id])
GO
ALTER TABLE [dbo].[groupakia] CHECK CONSTRAINT [FK_groupakia_ages]
GO
ALTER TABLE [dbo].[groupakia]  WITH CHECK ADD  CONSTRAINT [FK_groupakia_course_fees] FOREIGN KEY([fee_id])
REFERENCES [dbo].[course_fees] ([id])
GO
ALTER TABLE [dbo].[groupakia] CHECK CONSTRAINT [FK_groupakia_course_fees]
GO
ALTER TABLE [dbo].[groupakia]  WITH CHECK ADD  CONSTRAINT [FK_groupakia_course_wages] FOREIGN KEY([wage_id])
REFERENCES [dbo].[course_wages] ([id])
GO
ALTER TABLE [dbo].[groupakia] CHECK CONSTRAINT [FK_groupakia_course_wages]
GO
ALTER TABLE [dbo].[groupakia]  WITH CHECK ADD  CONSTRAINT [FK_groupakia_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[groupakia] CHECK CONSTRAINT [FK_groupakia_courses]
GO
ALTER TABLE [dbo].[groupakia]  WITH CHECK ADD  CONSTRAINT [FK_groupakia_group_ranks] FOREIGN KEY([rank_id])
REFERENCES [dbo].[group_ranks] ([id])
GO
ALTER TABLE [dbo].[groupakia] CHECK CONSTRAINT [FK_groupakia_group_ranks]
GO
ALTER TABLE [dbo].[groupakia]  WITH CHECK ADD  CONSTRAINT [FK_groupakia_speeds] FOREIGN KEY([speed_id])
REFERENCES [dbo].[speeds] ([id])
GO
ALTER TABLE [dbo].[groupakia] CHECK CONSTRAINT [FK_groupakia_speeds]
GO
ALTER TABLE [dbo].[groups_teachers_wages_history]  WITH CHECK ADD  CONSTRAINT [FK_groups_teachers_wages_history_groupakia] FOREIGN KEY([group_id])
REFERENCES [dbo].[groupakia] ([id])
GO
ALTER TABLE [dbo].[groups_teachers_wages_history] CHECK CONSTRAINT [FK_groups_teachers_wages_history_groupakia]
GO
ALTER TABLE [dbo].[groups_teachers_wages_history]  WITH CHECK ADD  CONSTRAINT [FK_groups_teachers_wages_history_teachers] FOREIGN KEY([teacher_id])
REFERENCES [dbo].[teachers] ([id])
GO
ALTER TABLE [dbo].[groups_teachers_wages_history] CHECK CONSTRAINT [FK_groups_teachers_wages_history_teachers]
GO
ALTER TABLE [dbo].[history]  WITH CHECK ADD  CONSTRAINT [FK_history_days] FOREIGN KEY([day_id])
REFERENCES [dbo].[days] ([id])
GO
ALTER TABLE [dbo].[history] CHECK CONSTRAINT [FK_history_days]
GO
ALTER TABLE [dbo].[history]  WITH CHECK ADD  CONSTRAINT [FK_history_groupakia] FOREIGN KEY([group_id])
REFERENCES [dbo].[groupakia] ([id])
GO
ALTER TABLE [dbo].[history] CHECK CONSTRAINT [FK_history_groupakia]
GO
ALTER TABLE [dbo].[history]  WITH CHECK ADD  CONSTRAINT [FK_history_hours] FOREIGN KEY([hour_id])
REFERENCES [dbo].[hours] ([id])
GO
ALTER TABLE [dbo].[history] CHECK CONSTRAINT [FK_history_hours]
GO
ALTER TABLE [dbo].[history]  WITH CHECK ADD  CONSTRAINT [FK_history_rooms] FOREIGN KEY([room_id])
REFERENCES [dbo].[rooms] ([id])
GO
ALTER TABLE [dbo].[history] CHECK CONSTRAINT [FK_history_rooms]
GO
ALTER TABLE [dbo].[history]  WITH CHECK ADD  CONSTRAINT [FK_history_teachers] FOREIGN KEY([teacher_id])
REFERENCES [dbo].[teachers] ([id])
GO
ALTER TABLE [dbo].[history] CHECK CONSTRAINT [FK_history_teachers]
GO
ALTER TABLE [dbo].[interview_schedule]  WITH CHECK ADD  CONSTRAINT [FK_interview_schedule_job_applications] FOREIGN KEY([application_id])
REFERENCES [dbo].[job_applications] ([id])
GO
ALTER TABLE [dbo].[interview_schedule] CHECK CONSTRAINT [FK_interview_schedule_job_applications]
GO
ALTER TABLE [dbo].[interviews_grading]  WITH CHECK ADD  CONSTRAINT [FK_interviews_grading_interview_stages] FOREIGN KEY([stage_id])
REFERENCES [dbo].[interview_stages] ([id])
GO
ALTER TABLE [dbo].[interviews_grading] CHECK CONSTRAINT [FK_interviews_grading_interview_stages]
GO
ALTER TABLE [dbo].[interviews_grading]  WITH CHECK ADD  CONSTRAINT [FK_interviews_grading_job_applications] FOREIGN KEY([application_id])
REFERENCES [dbo].[job_applications] ([id])
GO
ALTER TABLE [dbo].[interviews_grading] CHECK CONSTRAINT [FK_interviews_grading_job_applications]
GO
ALTER TABLE [dbo].[job_application_courses]  WITH CHECK ADD  CONSTRAINT [FK_job_application_courses_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[job_application_courses] CHECK CONSTRAINT [FK_job_application_courses_courses]
GO
ALTER TABLE [dbo].[job_application_courses]  WITH CHECK ADD  CONSTRAINT [FK_job_application_courses_job_applications] FOREIGN KEY([application_id])
REFERENCES [dbo].[job_applications] ([id])
GO
ALTER TABLE [dbo].[job_application_courses] CHECK CONSTRAINT [FK_job_application_courses_job_applications]
GO
ALTER TABLE [dbo].[job_application_studies]  WITH CHECK ADD  CONSTRAINT [FK_job_application_studies_job_applications] FOREIGN KEY([application_id])
REFERENCES [dbo].[job_applications] ([id])
GO
ALTER TABLE [dbo].[job_application_studies] CHECK CONSTRAINT [FK_job_application_studies_job_applications]
GO
ALTER TABLE [dbo].[job_application_work]  WITH CHECK ADD  CONSTRAINT [FK_job_application_work_job_applications] FOREIGN KEY([application_id])
REFERENCES [dbo].[job_applications] ([id])
GO
ALTER TABLE [dbo].[job_application_work] CHECK CONSTRAINT [FK_job_application_work_job_applications]
GO
ALTER TABLE [dbo].[job_applications]  WITH CHECK ADD  CONSTRAINT [FK_job_applications_job_openings] FOREIGN KEY([opening_id])
REFERENCES [dbo].[job_openings] ([id])
GO
ALTER TABLE [dbo].[job_applications] CHECK CONSTRAINT [FK_job_applications_job_openings]
GO
ALTER TABLE [dbo].[job_opening_courses]  WITH CHECK ADD  CONSTRAINT [FK_job_opening_courses_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[job_opening_courses] CHECK CONSTRAINT [FK_job_opening_courses_courses]
GO
ALTER TABLE [dbo].[job_opening_courses]  WITH CHECK ADD  CONSTRAINT [FK_job_opening_courses_job_openings] FOREIGN KEY([opening_id])
REFERENCES [dbo].[job_openings] ([id])
GO
ALTER TABLE [dbo].[job_opening_courses] CHECK CONSTRAINT [FK_job_opening_courses_job_openings]
GO
ALTER TABLE [dbo].[logbook]  WITH CHECK ADD  CONSTRAINT [FK_logbook_history] FOREIGN KEY([history_id])
REFERENCES [dbo].[history] ([id])
GO
ALTER TABLE [dbo].[logbook] CHECK CONSTRAINT [FK_logbook_history]
GO
ALTER TABLE [dbo].[logbook]  WITH CHECK ADD  CONSTRAINT [FK_logbook_teachers] FOREIGN KEY([teacher_id])
REFERENCES [dbo].[teachers] ([id])
GO
ALTER TABLE [dbo].[logbook] CHECK CONSTRAINT [FK_logbook_teachers]
GO
ALTER TABLE [dbo].[mock_exams]  WITH CHECK ADD  CONSTRAINT [FK_mock_exams_grading_sys] FOREIGN KEY([grad_sys_id])
REFERENCES [dbo].[grading_sys] ([id])
GO
ALTER TABLE [dbo].[mock_exams] CHECK CONSTRAINT [FK_mock_exams_grading_sys]
GO
ALTER TABLE [dbo].[mock_exams]  WITH CHECK ADD  CONSTRAINT [FK_mock_exams_groupakia] FOREIGN KEY([group_id])
REFERENCES [dbo].[groupakia] ([id])
GO
ALTER TABLE [dbo].[mock_exams] CHECK CONSTRAINT [FK_mock_exams_groupakia]
GO
ALTER TABLE [dbo].[mock_exams]  WITH CHECK ADD  CONSTRAINT [FK_mock_exams_periods] FOREIGN KEY([period_id])
REFERENCES [dbo].[periods] ([id])
GO
ALTER TABLE [dbo].[mock_exams] CHECK CONSTRAINT [FK_mock_exams_periods]
GO
ALTER TABLE [dbo].[mock_exams_results_numeric]  WITH CHECK ADD  CONSTRAINT [FK_mock_exams_results_numeric_mock_exams] FOREIGN KEY([exam_id])
REFERENCES [dbo].[mock_exams] ([id])
GO
ALTER TABLE [dbo].[mock_exams_results_numeric] CHECK CONSTRAINT [FK_mock_exams_results_numeric_mock_exams]
GO
ALTER TABLE [dbo].[mock_exams_results_numeric]  WITH CHECK ADD  CONSTRAINT [FK_mock_exams_results_numeric_students] FOREIGN KEY([student_id])
REFERENCES [dbo].[students] ([id])
GO
ALTER TABLE [dbo].[mock_exams_results_numeric] CHECK CONSTRAINT [FK_mock_exams_results_numeric_students]
GO
ALTER TABLE [dbo].[mock_exams_results_text]  WITH CHECK ADD  CONSTRAINT [FK_mock_exams_results_text_course_grades] FOREIGN KEY([text_grade_id])
REFERENCES [dbo].[course_grades] ([id])
GO
ALTER TABLE [dbo].[mock_exams_results_text] CHECK CONSTRAINT [FK_mock_exams_results_text_course_grades]
GO
ALTER TABLE [dbo].[mock_exams_results_text]  WITH CHECK ADD  CONSTRAINT [FK_mock_exams_results_text_mock_exams] FOREIGN KEY([exam_id])
REFERENCES [dbo].[mock_exams] ([id])
GO
ALTER TABLE [dbo].[mock_exams_results_text] CHECK CONSTRAINT [FK_mock_exams_results_text_mock_exams]
GO
ALTER TABLE [dbo].[mock_exams_results_text]  WITH CHECK ADD  CONSTRAINT [FK_mock_exams_results_text_students] FOREIGN KEY([student_id])
REFERENCES [dbo].[students] ([id])
GO
ALTER TABLE [dbo].[mock_exams_results_text] CHECK CONSTRAINT [FK_mock_exams_results_text_students]
GO
ALTER TABLE [dbo].[musical_instruments]  WITH CHECK ADD  CONSTRAINT [musical_instruments_musical_instrument_type_id_fk] FOREIGN KEY([type_id])
REFERENCES [dbo].[musical_instrument_type] ([id])
GO
ALTER TABLE [dbo].[musical_instruments] CHECK CONSTRAINT [musical_instruments_musical_instrument_type_id_fk]
GO
/****** Object:  StoredProcedure [dbo].[GetGroupStudents]    Script Date: 2020-12-05 11:02:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGroupStudents] @groupId bigint
AS
BEGIN
SELECT gs.student_id , gs.joined, CONCAT(m.name,' ',m.surname) AS fullName,
CASE WHEN GETDATE() > gs.dropped THEN  1 ELSE 0 END AS hasDropped,
CASE WHEN gs.last_payed_at IS NULL THEN 'Never' ELSE CAST(gs.last_payed_at AS CHAR) END AS lastPayed,
gs.total_payed AS hasPayed, gs.total_debt AS remainingDebt,gs.updated_at
FROM group_students gs
JOIN students s ON s.id = gs.student_id
JOIN members m ON m.id = s.member_id
WHERE gs.group_id = @groupId
END;
GO
USE [master]
GO
ALTER DATABASE [dickenserp] SET  READ_WRITE 
GO
