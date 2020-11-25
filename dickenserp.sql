USE [master]
GO
/****** Object:  Database [dickenserp]    Script Date: 2020-11-25 08:51:20 ******/
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
/****** Object:  Table [dbo].[absencies]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[absencies](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[history_id] [bigint] NULL,
	[student_id] [bigint] NULL,
	[justified] [tinyint] NULL,
	[comment] [text] NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_absencies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ages]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ages](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_ages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[banks]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[banks](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_banks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[buildings]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[buildings](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[address] [varchar](50) NULL,
	[suburb_id] [bigint] NULL,
 CONSTRAINT [PK_buildings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course_fees]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_fees](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_id] [bigint] NULL,
	[age_id] [bigint] NULL,
	[speed_id] [bigint] NULL,
	[fee] [decimal](10, 2) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_course_fees] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course_grades]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_grades](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](80) NULL,
	[course_id] [bigint] NULL,
	[ranking] [int] NULL,
 CONSTRAINT [PK_course_grades] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course_types]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_types](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_course_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course_wages]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_wages](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_id] [bigint] NULL,
	[age_id] [bigint] NULL,
	[speed_id] [bigint] NULL,
	[wage] [decimal](10, 2) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_course_wages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_type_id] [bigint] NULL,
	[title] [varchar](80) NULL,
	[active] [tinyint] NULL,
 CONSTRAINT [PK_courses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses_fees_history]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses_fees_history](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_id] [bigint] NULL,
	[fee] [decimal](10, 2) NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_courses_fees_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses_wages_history]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses_wages_history](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_id] [bigint] NULL,
	[wage] [decimal](10, 2) NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_courses_wages_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[days]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[days](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_days] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[diplomas]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diplomas](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[language_id] [bigint] NULL,
	[course_id] [bigint] NULL,
	[institut_id] [bigint] NULL,
	[lvl] [varchar](20) NULL,
	[active] [tinyint] NULL,
	[created_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[disciplines]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[disciplines](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_disciplines] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discount_model]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discount_model](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
	[percentage] [decimal](10, 2) NULL,
	[active] [tinyint] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[expires_at] [datetime] NULL,
 CONSTRAINT [PK_discount_model] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discounts]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discounts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[student_id] [bigint] NULL,
	[discount_id] [bigint] NULL,
	[group_id] [bigint] NULL,
	[active] [tinyint] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_discounts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grading_sys]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grading_sys](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_grading_sys] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[group_ranks]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[group_ranks](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
	[ranking] [int] NULL,
 CONSTRAINT [PK_group_ranks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[group_students]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[group_students](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[group_id] [bigint] NULL,
	[student_id] [bigint] NULL,
	[joined] [datetime] NULL,
	[dropped] [datetime] NULL,
	[total_payed] [decimal](10, 2) NULL,
	[total_debt] [decimal](10, 2) NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_group_students] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[group_teachers]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[group_teachers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[group_id] [bigint] NULL,
	[teacher_id] [bigint] NULL,
	[wage] [decimal](10, 2) NULL,
 CONSTRAINT [PK_group_teachers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[groupakia]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[groupakia](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](80) NULL,
	[speed_id] [bigint] NULL,
	[rank_id] [bigint] NULL,
	[age_id] [bigint] NULL,
	[fee_id] [bigint] NULL,
	[wage_id] [bigint] NULL,
	[max_seats] [int] NULL,
	[remain_seats] [int] NULL,
	[current_seats] [int] NULL,
	[active] [tinyint] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[ends_at] [datetime] NULL,
 CONSTRAINT [PK_groupakia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[groups_teachers_wages_history]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[groups_teachers_wages_history](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[group_id] [bigint] NULL,
	[teacher_id] [bigint] NULL,
	[wage] [decimal](10, 2) NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_groups_teachers_wages_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[history]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[history](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[group_id] [bigint] NULL,
	[teacher_id] [bigint] NULL,
	[room_id] [bigint] NULL,
	[day_id] [bigint] NULL,
	[hour_id] [bigint] NULL,
	[starts_at] [datetime] NULL,
	[ends_at] [datetime] NULL,
	[duration] [decimal](5, 2) NULL,
	[cancelled] [tinyint] NULL,
	[wage] [decimal](10, 2) NULL,
	[fee] [decimal](10, 2) NULL,
	[vat] [decimal](10, 2) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hours]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hours](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_hours] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instituts]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instituts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
	[active] [tinyint] NULL,
 CONSTRAINT [PK_instituts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[interview_schedule]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[interview_schedule](
	[id] [bigint] NOT NULL,
	[application_id] [bigint] NULL,
	[starts_at] [datetime] NULL,
	[ends_at] [datetime] NULL,
	[active] [tinyint] NULL,
 CONSTRAINT [PK_interview_schedule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[interview_stages]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[interview_stages](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[opening_id] [bigint] NULL,
	[title] [varchar](50) NULL,
	[active] [tinyint] NULL,
	[shown_order] [tinyint] NULL,
 CONSTRAINT [PK_interview_stages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[interviews_grading]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[interviews_grading](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[stage_id] [bigint] NULL,
	[application_id] [bigint] NULL,
	[grade] [decimal](5, 2) NULL,
	[passed] [tinyint] NULL,
	[created_at] [datetime] NULL,
	[evaluated_at] [datetime] NULL,
	[evaluated] [tinyint] NULL,
	[notes] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[job_application_courses]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[job_application_courses](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[application_id] [bigint] NULL,
	[course_id] [bigint] NULL,
 CONSTRAINT [PK_job_application_courses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[job_applications]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[job_applications](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[opening_id] [bigint] NULL,
	[full_name] [varchar](255) NULL,
	[phone] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[dob] [date] NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_job_applications] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[job_opening_courses]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[job_opening_courses](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[opening_id] [bigint] NULL,
	[course_id] [bigint] NULL,
 CONSTRAINT [PK_job_opening_courses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[job_openings]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[job_openings](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](250) NULL,
	[description] [text] NULL,
	[active] [tinyint] NULL,
	[created_at] [datetime] NULL,
	[starts_at] [datetime] NULL,
	[ends_at] [datetime] NULL,
 CONSTRAINT [PK_job_openings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[languages]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[languages](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
	[active] [tinyint] NULL,
 CONSTRAINT [PK_languages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logbook]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logbook](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[history_id] [bigint] NULL,
	[teacher_id] [bigint] NULL,
	[notes] [text] NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_logbook] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[members]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[members](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[name] [varchar](50) NULL,
	[surname] [varchar](50) NULL,
	[address] [varchar](250) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_members] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mock_exams]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mock_exams](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[period_id] [bigint] NULL,
	[group_id] [bigint] NULL,
	[grad_sys_id] [bigint] NULL,
	[exam_year] [date] NULL,
	[title] [varchar](250) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_mock_exams] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mock_exams_results_numeric]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mock_exams_results_numeric](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[exam_id] [bigint] NULL,
	[student_id] [bigint] NULL,
	[grade] [decimal](5, 2) NULL,
 CONSTRAINT [PK_mock_exams_results_numeric] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mock_exams_results_text]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mock_exams_results_text](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[student_id] [bigint] NULL,
	[exam_id] [bigint] NULL,
	[text_grade_id] [bigint] NULL,
 CONSTRAINT [PK_mock_exams_results_text] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[months]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[months](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_months] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[musical_instrument_type]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[musical_instrument_type](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_musical_instrument_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[musical_instruments]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[musical_instruments](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type_id] [bigint] NULL,
	[course_id] [bigint] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_musical_instruments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parents]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parents](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[surname] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
 CONSTRAINT [PK_parents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parents_children]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parents_children](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[parent_id] [bigint] NULL,
	[child_id] [bigint] NULL,
 CONSTRAINT [PK_parents_children] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payments_in_advance]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payments_in_advance](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[student_id] [bigint] NULL,
	[amount] [decimal](5, 2) NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_payments_in_advance] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payroll]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[teacher_id] [bigint] NULL,
	[month_id] [bigint] NULL,
	[gross] [decimal](10, 2) NULL,
	[net] [decimal](10, 2) NULL,
	[insurances] [decimal](10, 2) NULL,
	[total_hours] [decimal](10, 2) NULL,
	[fiscal_year] [int] NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_payroll] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payroll_analysis]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll_analysis](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[payroll_id] [bigint] NULL,
	[payroll_category_id] [bigint] NULL,
	[amount] [decimal](10, 2) NULL,
 CONSTRAINT [PK_payroll_analysis] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payroll_categories]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll_categories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_payroll_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payroll_groups_analysis]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll_groups_analysis](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[payroll_id] [bigint] NULL,
	[group_id] [bigint] NULL,
	[from_day] [date] NULL,
	[to_day] [date] NULL,
	[hourly_date] [decimal](10, 2) NULL,
	[amount] [decimal](10, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[perfectures]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perfectures](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_perfectures] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[periods]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[periods](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_periods] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pool_chapters]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pool_chapters](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pool_id] [bigint] NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_pool_chapters] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pool_question_answers]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pool_question_answers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[question_id] [bigint] NULL,
	[body] [text] NULL,
	[wrong] [tinyint] NULL,
 CONSTRAINT [PK_pool_question_answers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pool_questions]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pool_questions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[chapter_id] [bigint] NULL,
	[body] [text] NULL,
 CONSTRAINT [PK_pool_questions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pool_review_questions]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pool_review_questions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NULL,
 CONSTRAINT [PK_pool_review_questions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pools]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pools](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_id] [bigint] NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_pools] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[real_exams]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[real_exams](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[period_id] [bigint] NULL,
	[group_id] [bigint] NULL,
	[grad_sys_id] [bigint] NULL,
	[exam_year] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [date] NULL,
 CONSTRAINT [PK_real_exams] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[real_exams_results_numeric]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[real_exams_results_numeric](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[exam_id] [bigint] NULL,
	[student_id] [bigint] NULL,
	[grade] [decimal](10, 2) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_real_exams_results_numeric] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[real_exams_results_text]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[real_exams_results_text](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[exam_id] [bigint] NULL,
	[student_id] [bigint] NULL,
	[text_grade_id] [bigint] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [bigint] NULL,
 CONSTRAINT [PK_real_exams_results_text] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[registration_fees]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registration_fees](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[student_id] [bigint] NULL,
	[group_id] [bigint] NULL,
	[amount] [decimal](10, 2) NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_registration_fees] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[revenue]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[revenue](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[profit] [decimal](10, 2) NULL,
	[gross_income] [decimal](10, 2) NULL,
	[net_income] [decimal](10, 2) NULL,
	[student_payments] [decimal](10, 2) NULL,
	[total_expenses] [decimal](10, 2) NULL,
	[taxes] [decimal](10, 2) NULL,
	[staff_payments] [decimal](10, 2) NULL,
	[staff_insurances] [decimal](10, 2) NULL,
	[staff_net_payments] [decimal](10, 2) NULL,
	[student_debts] [decimal](10, 2) NULL,
	[staff_in_debt] [decimal](10, 2) NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_revenue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[revenue_categories]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[revenue_categories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_revenue_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[review_questionnaire]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review_questionnaire](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[teacher_id] [bigint] NULL,
	[title] [varchar](250) NULL,
	[created_at] [datetime] NULL,
	[avg_grade] [float] NULL,
 CONSTRAINT [PK_review_questionnaire] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[review_questionnaire_chapters]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review_questionnaire_chapters](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
	[shown_order] [int] NULL,
 CONSTRAINT [PK_review_questionnaire_chapters] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[review_questionnaire_questions]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review_questionnaire_questions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[questionnaire_id] [bigint] NULL,
	[chapter_id] [bigint] NULL,
	[question_id] [bigint] NULL,
 CONSTRAINT [PK_review_questionnaire_questions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[review_questionnaire_submission]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review_questionnaire_submission](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[questionnaire_id] [bigint] NULL,
	[pseudonym] [varchar](50) NULL,
	[created_at] [datetime] NULL,
	[avg_grade] [float] NULL,
 CONSTRAINT [PK_review_questionnaire_submission] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[review_submission_answers]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review_submission_answers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[submission_id] [bigint] NULL,
	[question_id] [bigint] NULL,
	[grade] [float] NULL,
 CONSTRAINT [PK_review_submission_answers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rooms]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rooms](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[building_id] [bigint] NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_rooms] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salary_history]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salary_history](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[teacher_id] [bigint] NULL,
	[amount] [decimal](10, 2) NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_salary_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[school_classes]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[school_classes](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
	[show_order] [int] NULL,
 CONSTRAINT [PK_school_classes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[school_courses]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[school_courses](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_id] [bigint] NULL,
	[school_class_id] [bigint] NULL,
	[discipline_id] [bigint] NULL,
 CONSTRAINT [PK_school_courses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seminar_categories]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seminar_categories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
	[active] [tinyint] NULL,
 CONSTRAINT [PK_seminar_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seminar_groups]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seminar_groups](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[module_id] [bigint] NULL,
	[group_id] [bigint] NULL,
 CONSTRAINT [PK_seminar_groups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seminar_modules]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seminar_modules](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[seminar_id] [bigint] NULL,
	[title] [varchar](250) NULL,
	[active] [tinyint] NULL,
	[part_time] [tinyint] NULL,
	[on_site] [tinyint] NULL,
	[cost] [decimal](10, 2) NULL,
	[starts] [datetime] NULL,
	[ends] [datetime] NULL,
	[max_seats] [int] NULL,
	[total_hours] [int] NULL,
	[cost_per_hour] [decimal](10, 2) NULL,
 CONSTRAINT [PK_seminar_modules] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seminars]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seminars](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](250) NULL,
	[seminar_category_id] [bigint] NULL,
 CONSTRAINT [PK_seminars] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[speeds]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[speeds](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_speeds] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_debts]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_debts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[student_id] [bigint] NULL,
	[group_id] [bigint] NULL,
	[month_id] [bigint] NULL,
	[lesson_year] [int] NULL,
	[amount] [decimal](10, 2) NULL,
	[starts_at] [datetime] NULL,
	[ends_at] [datetime] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [decimal](10, 2) NULL,
 CONSTRAINT [PK_student_debts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_payed]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_payed](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[student_id] [bigint] NULL,
	[group_id] [bigint] NULL,
	[month_id] [bigint] NULL,
	[lesson_year] [int] NULL,
	[bank_id] [bigint] NULL,
	[bank_transaction_id] [bigint] NULL,
	[amount] [decimal](10, 2) NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_student_payed] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[member_id] [bigint] NULL,
	[total_debt] [decimal](10, 2) NULL,
	[total_payed] [decimal](10, 2) NULL,
	[calculated_at] [datetime] NULL,
 CONSTRAINT [PK_students] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suburbs]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suburbs](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_suburbs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teacher_debts]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher_debts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[teacher_id] [bigint] NULL,
	[group_id] [bigint] NULL,
	[month_id] [bigint] NULL,
	[lesson_year] [int] NULL,
	[amount] [decimal](10, 2) NULL,
	[starts_at] [datetime] NULL,
	[ends_at] [datetime] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_teacher_debts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teacher_payments]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher_payments](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[teacher_id] [bigint] NULL,
	[group_id] [bigint] NULL,
	[month_id] [bigint] NULL,
	[lesson_year] [int] NULL,
	[amount] [decimal](10, 2) NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_teacher_payments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teachers]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teachers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[member_id] [bigint] NULL,
	[total_debt] [decimal](10, 2) NULL,
	[total_payed] [decimal](10, 2) NULL,
	[calculated_at] [datetime] NULL,
 CONSTRAINT [PK_teacherss] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teaches]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teaches](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[teacher_id] [bigint] NULL,
	[course_id] [bigint] NULL,
 CONSTRAINT [PK_teachers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_progress]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_progress](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[submission_id] [bigint] NULL,
	[question_id] [bigint] NULL,
	[shown_at] [datetime] NULL,
	[answered_at] [datetime] NULL,
 CONSTRAINT [PK_test_progress] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_questions]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_questions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pool_question_id] [bigint] NULL,
	[test_id] [bigint] NULL,
	[points] [tinyint] NULL,
	[penalty] [tinyint] NULL,
	[shown_order] [tinyint] NULL,
	[active] [tinyint] NULL,
	[multiple_select] [tinyint] NULL,
 CONSTRAINT [PK_test_questions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_submissions]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_submissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[application_id] [bigint] NULL,
	[session_id] [varchar](255) NULL,
	[test_id] [bigint] NULL,
	[time_window_starts] [datetime] NULL,
	[time_window_ends] [datetime] NULL,
	[started_at] [datetime] NULL,
	[ended_at] [datetime] NULL,
	[deadline_at] [datetime] NULL,
	[duration_mins] [int] NULL,
	[mins_remainging] [int] NULL,
	[grade] [decimal](5, 2) NULL,
	[completed] [tinyint] NULL,
	[cheat_counter] [tinyint] NULL,
 CONSTRAINT [PK_test_submissions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_submissions_answers]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_submissions_answers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[submission_id] [bigint] NULL,
	[question_id] [bigint] NULL,
	[answer_id] [bigint] NULL,
 CONSTRAINT [PK_test_submissions_answers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tests]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tests](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_id] [bigint] NULL,
	[title] [varchar](50) NULL,
	[difficulty] [tinyint] NULL,
	[duration_minutes] [int] NULL,
	[description] [text] NULL,
	[active] [tinyint] NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_tests] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[towns]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[towns](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
	[perfecture_id] [bigint] NULL,
 CONSTRAINT [PK_towns] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transaction_categories]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction_categories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
	[is_profilt] [tinyint] NULL,
 CONSTRAINT [PK_transaction_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[university]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[university](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
	[type_id] [bigint] NULL,
 CONSTRAINT [PK_university] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[university_department]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[university_department](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
	[type_id] [bigint] NULL,
	[active] [tinyint] NULL,
 CONSTRAINT [PK_university_department] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[university_type]    Script Date: 2020-11-25 08:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[university_type](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_university_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
USE [master]
GO
ALTER DATABASE [dickenserp] SET  READ_WRITE 
GO
