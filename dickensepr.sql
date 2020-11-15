USE [master]
GO
/****** Object:  Database [dickenserp]    Script Date: 2020-11-15 1:05:36 PM ******/
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
/****** Object:  Table [dbo].[absencies]    Script Date: 2020-11-15 1:05:36 PM ******/
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
/****** Object:  Table [dbo].[ages]    Script Date: 2020-11-15 1:05:36 PM ******/
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
/****** Object:  Table [dbo].[banks]    Script Date: 2020-11-15 1:05:36 PM ******/
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
/****** Object:  Table [dbo].[buildings]    Script Date: 2020-11-15 1:05:36 PM ******/
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
/****** Object:  Table [dbo].[course_fees]    Script Date: 2020-11-15 1:05:36 PM ******/
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
/****** Object:  Table [dbo].[course_grades]    Script Date: 2020-11-15 1:05:36 PM ******/
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
/****** Object:  Table [dbo].[course_types]    Script Date: 2020-11-15 1:05:36 PM ******/
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
/****** Object:  Table [dbo].[course_wages]    Script Date: 2020-11-15 1:05:36 PM ******/
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
/****** Object:  Table [dbo].[courses]    Script Date: 2020-11-15 1:05:36 PM ******/
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
/****** Object:  Table [dbo].[courses_fees_history]    Script Date: 2020-11-15 1:05:36 PM ******/
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
/****** Object:  Table [dbo].[courses_wages_history]    Script Date: 2020-11-15 1:05:36 PM ******/
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
/****** Object:  Table [dbo].[days]    Script Date: 2020-11-15 1:05:36 PM ******/
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
/****** Object:  Table [dbo].[diplomas]    Script Date: 2020-11-15 1:05:36 PM ******/
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
/****** Object:  Table [dbo].[disciplines]    Script Date: 2020-11-15 1:05:36 PM ******/
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
/****** Object:  Table [dbo].[discount_model]    Script Date: 2020-11-15 1:05:36 PM ******/
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
/****** Object:  Table [dbo].[discounts]    Script Date: 2020-11-15 1:05:36 PM ******/
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
/****** Object:  Table [dbo].[grading_sys]    Script Date: 2020-11-15 1:05:36 PM ******/
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
/****** Object:  Table [dbo].[group_ranks]    Script Date: 2020-11-15 1:05:36 PM ******/
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
/****** Object:  Table [dbo].[group_students]    Script Date: 2020-11-15 1:05:36 PM ******/
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
/****** Object:  Table [dbo].[group_teachers]    Script Date: 2020-11-15 1:05:36 PM ******/
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
/****** Object:  Table [dbo].[groupakia]    Script Date: 2020-11-15 1:05:36 PM ******/
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
/****** Object:  Table [dbo].[groups_teachers_wages_history]    Script Date: 2020-11-15 1:05:36 PM ******/
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
/****** Object:  Table [dbo].[history]    Script Date: 2020-11-15 1:05:36 PM ******/
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
/****** Object:  Table [dbo].[hours]    Script Date: 2020-11-15 1:05:36 PM ******/
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
USE [master]
GO
ALTER DATABASE [dickenserp] SET  READ_WRITE 
GO
