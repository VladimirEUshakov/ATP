USE [master]
GO
/****** Object:  Database [ATP]    Script Date: 19.05.2023 14:47:05 ******/
CREATE DATABASE [ATP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ATP', FILENAME = N'C:\Test\ATP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ATP_log', FILENAME = N'C:\Test\ATP_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ATP] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ATP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ATP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ATP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ATP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ATP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ATP] SET ARITHABORT OFF 
GO
ALTER DATABASE [ATP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ATP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ATP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ATP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ATP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ATP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ATP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ATP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ATP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ATP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ATP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ATP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ATP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ATP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ATP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ATP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ATP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ATP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ATP] SET  MULTI_USER 
GO
ALTER DATABASE [ATP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ATP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ATP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ATP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ATP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ATP] SET QUERY_STORE = OFF
GO
USE [ATP]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ATP]
GO
/****** Object:  Table [dbo].[AUTO]    Script Date: 19.05.2023 14:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AUTO](
	[REGNUM] [char](15) NOT NULL,
	[MODEL] [int] NOT NULL,
	[ODOMETR] [float] NOT NULL,
	[MANUFACTURED] [smallint] NOT NULL,
	[INSPECTION] [date] NULL,
 CONSTRAINT [PK_AUTO] PRIMARY KEY CLUSTERED 
(
	[REGNUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AUTOMODELS]    Script Date: 19.05.2023 14:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AUTOMODELS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [char](20) NOT NULL,
 CONSTRAINT [PK_AUTOMODELS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DISPATCHER]    Script Date: 19.05.2023 14:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DISPATCHER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [char](30) NOT NULL,
 CONSTRAINT [PK_DISPATCHER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DRIVERS]    Script Date: 19.05.2023 14:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DRIVERS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [char](30) NOT NULL,
	[BIRTH] [date] NOT NULL,
 CONSTRAINT [PK_DRIVERS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WAYBILLS]    Script Date: 19.05.2023 14:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WAYBILLS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DEPARTURE] [datetime] NOT NULL,
	[ARRIVAL] [time](0) NULL,
	[DRIVER] [int] NOT NULL,
	[AUTO] [char](15) NULL,
	[CONSUMPTION] [float] NULL,
	[MILEAGE] [float] NULL,
	[DISPATCHER] [int] NOT NULL,
	[DELETED] [char](1) NULL,
 CONSTRAINT [PK_WAYBILLS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AUTO]  WITH CHECK ADD  CONSTRAINT [FK_AUTO_AUTOMODELS] FOREIGN KEY([MODEL])
REFERENCES [dbo].[AUTOMODELS] ([ID])
GO
ALTER TABLE [dbo].[AUTO] CHECK CONSTRAINT [FK_AUTO_AUTOMODELS]
GO
ALTER TABLE [dbo].[WAYBILLS]  WITH CHECK ADD  CONSTRAINT [FK_WAYBILLS_AUTO] FOREIGN KEY([AUTO])
REFERENCES [dbo].[AUTO] ([REGNUM])
GO
ALTER TABLE [dbo].[WAYBILLS] CHECK CONSTRAINT [FK_WAYBILLS_AUTO]
GO
ALTER TABLE [dbo].[WAYBILLS]  WITH CHECK ADD  CONSTRAINT [FK_WAYBILLS_DISPATCHER] FOREIGN KEY([DISPATCHER])
REFERENCES [dbo].[DISPATCHER] ([ID])
GO
ALTER TABLE [dbo].[WAYBILLS] CHECK CONSTRAINT [FK_WAYBILLS_DISPATCHER]
GO
ALTER TABLE [dbo].[WAYBILLS]  WITH CHECK ADD  CONSTRAINT [FK_WAYBILLS_DRIVERS] FOREIGN KEY([DRIVER])
REFERENCES [dbo].[DRIVERS] ([ID])
GO
ALTER TABLE [dbo].[WAYBILLS] CHECK CONSTRAINT [FK_WAYBILLS_DRIVERS]
GO
CREATE TRIGGER [dbo].[WAYBILLS_TG] 
   ON  [dbo].[WAYBILLS] 
   AFTER INSERT
AS 
BEGIN
	UPDATE AUTO
	set ODOMETR=ODOMETR+(select MILEAGE from inserted)
	Where regnum=(select auto from inserted)

END
GO

USE [master]
GO
ALTER DATABASE [ATP] SET  READ_WRITE 
GO
