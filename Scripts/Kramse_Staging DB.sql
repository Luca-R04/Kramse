USE [master]
GO
/****** Object:  Database [Kramse_Staging]    Script Date: 25-3-2023 15:35:27 ******/
CREATE DATABASE [Kramse_Staging]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kramse_Staging', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLDEV2019\MSSQL\DATA\Kramse_Staging.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Kramse_Staging_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLDEV2019\MSSQL\DATA\Kramse_Staging_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Kramse_Staging] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kramse_Staging].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kramse_Staging] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kramse_Staging] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kramse_Staging] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kramse_Staging] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kramse_Staging] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kramse_Staging] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Kramse_Staging] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kramse_Staging] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kramse_Staging] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kramse_Staging] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kramse_Staging] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kramse_Staging] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kramse_Staging] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kramse_Staging] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kramse_Staging] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Kramse_Staging] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kramse_Staging] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kramse_Staging] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kramse_Staging] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kramse_Staging] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kramse_Staging] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kramse_Staging] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kramse_Staging] SET RECOVERY FULL 
GO
ALTER DATABASE [Kramse_Staging] SET  MULTI_USER 
GO
ALTER DATABASE [Kramse_Staging] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kramse_Staging] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kramse_Staging] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kramse_Staging] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Kramse_Staging] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Kramse_Staging] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Kramse_Staging', N'ON'
GO
ALTER DATABASE [Kramse_Staging] SET QUERY_STORE = OFF
GO
USE [Kramse_Staging]
GO
/****** Object:  Table [dbo].[Dim_Consignor]    Script Date: 25-3-2023 15:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Consignor](
	[Consignor_Id] [int] NULL,
	[Consignor] [nvarchar](250) NULL,
	[Discount] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Container]    Script Date: 25-3-2023 15:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Container](
	[Container_Id] [int] NULL,
	[Type] [nvarchar](255) NULL,
	[Refrigeration] [bit] NULL,
	[Cubes] [float] NULL,
	[EuroPricePerKm] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Date]    Script Date: 25-3-2023 15:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Date](
	[Date_Id] [int] NULL,
	[Year] [int] NULL,
	[Month] [int] NULL,
	[Day] [datetime] NULL,
	[Week] [datetime] NULL,
	[Year_Quarter] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Item]    Script Date: 25-3-2023 15:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Item](
	[Item_Id] [int] NULL,
	[Mfgr] [nvarchar](50) NULL,
	[StorageType] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Port]    Script Date: 25-3-2023 15:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Port](
	[Port_Id] [int] NULL,
	[PortName] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Ship]    Script Date: 25-3-2023 15:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Ship](
	[Ship_Id] [int] NULL,
	[Shipname] [nvarchar](255) NULL,
	[MaxTEU] [int] NULL,
	[Yearcost] [numeric](38, 19) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Waiting_Time]    Script Date: 25-3-2023 15:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Waiting_Time](
	[Waiting_Time_Id] [int] NULL,
	[Port_Id] [int] NULL,
	[Ship_Id] [int] NULL,
	[Waiting_Time] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_Shipment]    Script Date: 25-3-2023 15:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_Shipment](
	[Shipment_Id] [int] NULL,
	[Item_Id] [int] NULL,
	[Consignor_Id] [int] NULL,
	[Voyage_id] [int] NULL,
	[Port_Id_From] [int] NULL,
	[Port_Id_To] [int] NULL,
	[Distance] [int] NULL,
	[Container_Id] [int] NULL,
	[Container_Range] [nvarchar](50) NULL,
	[Number_Containers] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_Voyage_Port]    Script Date: 25-3-2023 15:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_Voyage_Port](
	[Voyage_Port_Id] [int] NULL,
	[Ship_Id] [int] NULL,
	[Port_Id_Current] [int] NULL,
	[Port_Id_Next] [int] NULL,
	[Port_Id_Start] [int] NULL,
	[Port_Id_End] [int] NULL,
	[Date_Depart] [datetime] NULL,
	[Leg_Date_Depart] [datetime] NULL,
	[Leg_Date_Arrival] [datetime] NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Kramse_Staging] SET  READ_WRITE 
GO
