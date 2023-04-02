USE [master]
GO
/****** Object:  Database [Kramse_Staging]    Script Date: 2-4-2023 15:18:47 ******/
DROP DATABASE IF EXISTS [Kramse_Staging]
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
/****** Object:  Table [dbo].[Dim_Consignor]    Script Date: 2-4-2023 15:18:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Consignor](
	[Consignor_Id] [int] NOT NULL,
	[Consignor] [nvarchar](250) NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_Dim_Consignor] PRIMARY KEY CLUSTERED 
(
	[Consignor_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Container]    Script Date: 2-4-2023 15:18:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Container](
	[Container_Id] [int] NOT NULL,
	[Type] [nvarchar](255) NULL,
	[Refrigeration] [bit] NULL,
	[Cubes] [float] NULL,
	[EuroPricePerKm] [float] NULL,
 CONSTRAINT [PK_Dim_Container] PRIMARY KEY CLUSTERED 
(
	[Container_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Item]    Script Date: 2-4-2023 15:18:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Item](
	[Item_Id] [int] NOT NULL,
	[Mfgr] [nvarchar](50) NULL,
	[StorageType] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dim_Item] PRIMARY KEY CLUSTERED 
(
	[Item_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Port]    Script Date: 2-4-2023 15:18:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Port](
	[Port_Id] [int] NOT NULL,
	[PortName] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dim_Port] PRIMARY KEY CLUSTERED 
(
	[Port_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Ship]    Script Date: 2-4-2023 15:18:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Ship](
	[Ship_Id] [int] NOT NULL,
	[Shipname] [nvarchar](255) NULL,
	[MaxTEU] [int] NULL,
	[Yearcost] [numeric](38, 19) NULL,
 CONSTRAINT [PK_Dim_Ship] PRIMARY KEY CLUSTERED 
(
	[Ship_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Voyage]    Script Date: 2-4-2023 15:18:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Voyage](
	[Voyage_Id] [int] NOT NULL,
	[Ship_Id] [int] NULL,
	[Date_Depart] [datetime] NULL,
	[Date_Year] [int] NULL,
 CONSTRAINT [PK_Dim_Voyage] PRIMARY KEY CLUSTERED 
(
	[Voyage_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Waiting_Time]    Script Date: 2-4-2023 15:18:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Waiting_Time](
	[Waiting_Time_Id] [int] IDENTITY(1,1) NOT NULL,
	[Port_Id] [int] NULL,
	[Ship_Id] [int] NULL,
	[Waiting_Time] [int] NULL,
	[Voyage_Id] [int] NULL,
	[Port_Name] [nvarchar](255) NULL,
	[Ship_Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Dim_Waiting_Time] PRIMARY KEY CLUSTERED 
(
	[Waiting_Time_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_Shipment]    Script Date: 2-4-2023 15:18:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_Shipment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Shipment_Id] [int] NULL,
	[Item_Id] [int] NULL,
	[Consignor_Id] [int] NULL,
	[Voyage_id] [int] NULL,
	[Port_Id_Current] [int] NULL,
	[Port_Id_Next] [int] NULL,
	[Distance] [int] NULL,
	[Container_Id] [int] NULL,
	[Container_Range] [nvarchar](50) NULL,
	[Number_Containers] [int] NULL,
	[Actual_Container_Count] [int] NULL,
	[Ship_Id] [int] NULL,
	[Load_Factor] [float] NULL,
	[ReveneuEUR] [float] NULL,
	[DiscountEUR] [float] NULL,
 CONSTRAINT [PK_F_Shipment_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_Voyage_Port]    Script Date: 2-4-2023 15:18:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_Voyage_Port](
	[Voyage_Port_Id] [int] IDENTITY(1,1) NOT NULL,
	[Voyage_Id] [int] NULL,
	[Ship_Id] [int] NULL,
	[Port_Id_Current] [int] NULL,
	[Port_Id_Next] [int] NULL,
	[Port_Id_Start] [int] NULL,
	[Port_Id_End] [int] NULL,
	[Date_Depart] [datetime] NULL,
	[Leg_Date_Depart] [datetime] NULL,
	[Leg_Date_Arrival] [datetime] NULL,
	[Waiting_Time] [int] NULL,
 CONSTRAINT [PK_F_Voyage_Port] PRIMARY KEY CLUSTERED 
(
	[Voyage_Port_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dim_Waiting_Time]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Waiting_Time_Dim_Port] FOREIGN KEY([Port_Id])
REFERENCES [dbo].[Dim_Port] ([Port_Id])
GO
ALTER TABLE [dbo].[Dim_Waiting_Time] CHECK CONSTRAINT [FK_Dim_Waiting_Time_Dim_Port]
GO
ALTER TABLE [dbo].[Dim_Waiting_Time]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Waiting_Time_Dim_Ship] FOREIGN KEY([Ship_Id])
REFERENCES [dbo].[Dim_Ship] ([Ship_Id])
GO
ALTER TABLE [dbo].[Dim_Waiting_Time] CHECK CONSTRAINT [FK_Dim_Waiting_Time_Dim_Ship]
GO
ALTER TABLE [dbo].[F_Shipment]  WITH CHECK ADD  CONSTRAINT [FK_F_Shipment_Dim_Consignor] FOREIGN KEY([Consignor_Id])
REFERENCES [dbo].[Dim_Consignor] ([Consignor_Id])
GO
ALTER TABLE [dbo].[F_Shipment] CHECK CONSTRAINT [FK_F_Shipment_Dim_Consignor]
GO
ALTER TABLE [dbo].[F_Shipment]  WITH CHECK ADD  CONSTRAINT [FK_F_Shipment_Dim_Container] FOREIGN KEY([Container_Id])
REFERENCES [dbo].[Dim_Container] ([Container_Id])
GO
ALTER TABLE [dbo].[F_Shipment] CHECK CONSTRAINT [FK_F_Shipment_Dim_Container]
GO
ALTER TABLE [dbo].[F_Shipment]  WITH CHECK ADD  CONSTRAINT [FK_F_Shipment_Dim_Item] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Dim_Item] ([Item_Id])
GO
ALTER TABLE [dbo].[F_Shipment] CHECK CONSTRAINT [FK_F_Shipment_Dim_Item]
GO
ALTER TABLE [dbo].[F_Shipment]  WITH CHECK ADD  CONSTRAINT [FK_F_Shipment_Dim_Port] FOREIGN KEY([Port_Id_Current])
REFERENCES [dbo].[Dim_Port] ([Port_Id])
GO
ALTER TABLE [dbo].[F_Shipment] CHECK CONSTRAINT [FK_F_Shipment_Dim_Port]
GO
ALTER TABLE [dbo].[F_Shipment]  WITH CHECK ADD  CONSTRAINT [FK_F_Shipment_Dim_Port1] FOREIGN KEY([Port_Id_Next])
REFERENCES [dbo].[Dim_Port] ([Port_Id])
GO
ALTER TABLE [dbo].[F_Shipment] CHECK CONSTRAINT [FK_F_Shipment_Dim_Port1]
GO
ALTER TABLE [dbo].[F_Shipment]  WITH CHECK ADD  CONSTRAINT [FK_F_Shipment_Dim_Voyage] FOREIGN KEY([Voyage_id])
REFERENCES [dbo].[Dim_Voyage] ([Voyage_Id])
GO
ALTER TABLE [dbo].[F_Shipment] CHECK CONSTRAINT [FK_F_Shipment_Dim_Voyage]
GO
ALTER TABLE [dbo].[F_Voyage_Port]  WITH CHECK ADD  CONSTRAINT [FK_F_Voyage_Port_Dim_Port] FOREIGN KEY([Port_Id_Current])
REFERENCES [dbo].[Dim_Port] ([Port_Id])
GO
ALTER TABLE [dbo].[F_Voyage_Port] CHECK CONSTRAINT [FK_F_Voyage_Port_Dim_Port]
GO
ALTER TABLE [dbo].[F_Voyage_Port]  WITH CHECK ADD  CONSTRAINT [FK_F_Voyage_Port_Dim_Port1] FOREIGN KEY([Port_Id_Next])
REFERENCES [dbo].[Dim_Port] ([Port_Id])
GO
ALTER TABLE [dbo].[F_Voyage_Port] CHECK CONSTRAINT [FK_F_Voyage_Port_Dim_Port1]
GO
ALTER TABLE [dbo].[F_Voyage_Port]  WITH CHECK ADD  CONSTRAINT [FK_F_Voyage_Port_Dim_Port2] FOREIGN KEY([Port_Id_Start])
REFERENCES [dbo].[Dim_Port] ([Port_Id])
GO
ALTER TABLE [dbo].[F_Voyage_Port] CHECK CONSTRAINT [FK_F_Voyage_Port_Dim_Port2]
GO
ALTER TABLE [dbo].[F_Voyage_Port]  WITH CHECK ADD  CONSTRAINT [FK_F_Voyage_Port_Dim_Port3] FOREIGN KEY([Port_Id_End])
REFERENCES [dbo].[Dim_Port] ([Port_Id])
GO
ALTER TABLE [dbo].[F_Voyage_Port] CHECK CONSTRAINT [FK_F_Voyage_Port_Dim_Port3]
GO
ALTER TABLE [dbo].[F_Voyage_Port]  WITH CHECK ADD  CONSTRAINT [FK_F_Voyage_Port_Dim_Ship] FOREIGN KEY([Ship_Id])
REFERENCES [dbo].[Dim_Ship] ([Ship_Id])
GO
ALTER TABLE [dbo].[F_Voyage_Port] CHECK CONSTRAINT [FK_F_Voyage_Port_Dim_Ship]
GO
ALTER TABLE [dbo].[F_Voyage_Port]  WITH CHECK ADD  CONSTRAINT [FK_F_Voyage_Port_Dim_Voyage] FOREIGN KEY([Voyage_Id])
REFERENCES [dbo].[Dim_Voyage] ([Voyage_Id])
GO
ALTER TABLE [dbo].[F_Voyage_Port] CHECK CONSTRAINT [FK_F_Voyage_Port_Dim_Voyage]
GO
USE [master]
GO
ALTER DATABASE [Kramse_Staging] SET  READ_WRITE 
GO
