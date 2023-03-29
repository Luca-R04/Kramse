USE [master]
GO
/****** Object:  Database [Kramse_ODS]    Script Date: 29-3-2023 10:02:02 ******/
CREATE DATABASE [Kramse_ODS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kramse_ODS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLDEV2019\MSSQL\DATA\Kramse_ODS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Kramse_ODS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLDEV2019\MSSQL\DATA\Kramse_ODS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Kramse_ODS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kramse_ODS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kramse_ODS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kramse_ODS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kramse_ODS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kramse_ODS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kramse_ODS] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kramse_ODS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Kramse_ODS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kramse_ODS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kramse_ODS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kramse_ODS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kramse_ODS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kramse_ODS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kramse_ODS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kramse_ODS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kramse_ODS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Kramse_ODS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kramse_ODS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kramse_ODS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kramse_ODS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kramse_ODS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kramse_ODS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kramse_ODS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kramse_ODS] SET RECOVERY FULL 
GO
ALTER DATABASE [Kramse_ODS] SET  MULTI_USER 
GO
ALTER DATABASE [Kramse_ODS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kramse_ODS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kramse_ODS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kramse_ODS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Kramse_ODS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Kramse_ODS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Kramse_ODS', N'ON'
GO
ALTER DATABASE [Kramse_ODS] SET QUERY_STORE = OFF
GO
USE [Kramse_ODS]
GO
/****** Object:  Table [dbo].[Dim_Consignor]    Script Date: 29-3-2023 10:02:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Consignor](
	[Consignor_Id] [int] NOT NULL,
	[Consignor] [nvarchar](250) NULL,
	[Discount] [float] NULL,
	[Consignor_Row_ID] [int] IDENTITY(1,1) NOT NULL,
	[Start_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
 CONSTRAINT [PK_Dim_Consignor] PRIMARY KEY CLUSTERED 
(
	[Consignor_Row_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Container]    Script Date: 29-3-2023 10:02:02 ******/
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
	[Container_Row_Id] [int] IDENTITY(1,1) NOT NULL,
	[Start_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
 CONSTRAINT [PK_Dim_Container] PRIMARY KEY CLUSTERED 
(
	[Container_Row_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Item]    Script Date: 29-3-2023 10:02:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Item](
	[Item_Id] [int] NOT NULL,
	[Mfgr] [nvarchar](50) NULL,
	[StorageType] [nvarchar](50) NULL,
	[Item_Row_Id] [int] IDENTITY(1,1) NOT NULL,
	[Start_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
 CONSTRAINT [PK_Dim_Item] PRIMARY KEY CLUSTERED 
(
	[Item_Row_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Port]    Script Date: 29-3-2023 10:02:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Port](
	[Port_Id] [int] NOT NULL,
	[PortName] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Port_Row_Id] [int] IDENTITY(1,1) NOT NULL,
	[Start_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
 CONSTRAINT [PK_Dim_Port] PRIMARY KEY CLUSTERED 
(
	[Port_Row_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Ship]    Script Date: 29-3-2023 10:02:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Ship](
	[Ship_Id] [int] NOT NULL,
	[Shipname] [nvarchar](255) NULL,
	[MaxTEU] [int] NULL,
	[Yearcost] [numeric](38, 19) NULL,
	[Ship_Row_Id] [int] IDENTITY(1,1) NOT NULL,
	[Start_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
 CONSTRAINT [PK_Dim_Ship] PRIMARY KEY CLUSTERED 
(
	[Ship_Row_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Waiting_Time]    Script Date: 29-3-2023 10:02:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Waiting_Time](
	[Waiting_Time_Id] [int] NOT NULL,
	[Port_Id] [int] NULL,
	[Ship_Id] [int] NULL,
	[Waiting_Time] [nvarchar](10) NULL,
	[Voyage_Id] [int] NULL,
	[Port_Name] [nvarchar](255) NULL,
	[Ship_Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Dim_Waiting_Time] PRIMARY KEY CLUSTERED 
(
	[Waiting_Time_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_Shipment]    Script Date: 29-3-2023 10:02:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_Shipment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Shipment_Id] [int] NOT NULL,
	[Item_Row_Id] [int] NOT NULL,
	[Consignor_Row_Id] [int] NOT NULL,
	[Voyage_id] [int] NOT NULL,
	[Port_Row_Id_From] [int] NOT NULL,
	[Port_Row_Id_To] [int] NOT NULL,
	[Distance] [int] NULL,
	[Container_Row_Id] [int] NOT NULL,
	[Container_Range] [nvarchar](50) NULL,
	[Number_Containers] [int] NULL,
 CONSTRAINT [PK_F_Shipment] PRIMARY KEY CLUSTERED 
(
	[Shipment_Id] ASC,
	[Item_Row_Id] ASC,
	[Consignor_Row_Id] ASC,
	[Voyage_id] ASC,
	[Port_Row_Id_From] ASC,
	[Port_Row_Id_To] ASC,
	[Container_Row_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_Voyage_Port]    Script Date: 29-3-2023 10:02:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_Voyage_Port](
	[Voyage_Port_Id] [int] IDENTITY(1,1) NOT NULL,
	[Voyage_Id] [int] NOT NULL,
	[Ship_Row_Id] [int] NOT NULL,
	[Port_Id_Current] [int] NOT NULL,
	[Port_Id_Next] [int] NOT NULL,
	[Port_Id_Start] [int] NOT NULL,
	[Port_Id_End] [int] NOT NULL,
	[Date_Depart] [datetime] NULL,
	[Leg_Date_Depart] [datetime] NULL,
	[Leg_Date_Arrival] [datetime] NULL,
	[Waiting_Time_Id] [int] NOT NULL,
 CONSTRAINT [PK_F_Voyage_Port_1] PRIMARY KEY CLUSTERED 
(
	[Voyage_Id] ASC,
	[Ship_Row_Id] ASC,
	[Port_Id_Current] ASC,
	[Port_Id_Next] ASC,
	[Port_Id_Start] ASC,
	[Port_Id_End] ASC,
	[Waiting_Time_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dim_Consignor] ADD  CONSTRAINT [DF_Dim_Consignor_Start_Date]  DEFAULT (getdate()) FOR [Start_Date]
GO
ALTER TABLE [dbo].[Dim_Consignor] ADD  CONSTRAINT [DF_Dim_Consignor_End_Date]  DEFAULT (NULL) FOR [End_Date]
GO
ALTER TABLE [dbo].[Dim_Container] ADD  CONSTRAINT [DF_Dim_Container_Start_Date]  DEFAULT (getdate()) FOR [Start_Date]
GO
ALTER TABLE [dbo].[Dim_Container] ADD  CONSTRAINT [DF_Dim_Container_End_Date]  DEFAULT (NULL) FOR [End_Date]
GO
ALTER TABLE [dbo].[Dim_Item] ADD  CONSTRAINT [DF_Dim_Item_Start_Date]  DEFAULT (getdate()) FOR [Start_Date]
GO
ALTER TABLE [dbo].[Dim_Port] ADD  CONSTRAINT [DF_Dim_Port_Start_Date]  DEFAULT (getdate()) FOR [Start_Date]
GO
ALTER TABLE [dbo].[Dim_Port] ADD  CONSTRAINT [DF_Dim_Port_End_Date]  DEFAULT (NULL) FOR [End_Date]
GO
ALTER TABLE [dbo].[Dim_Ship] ADD  CONSTRAINT [DF_Dim_Ship_Start_Date]  DEFAULT (getdate()) FOR [Start_Date]
GO
ALTER TABLE [dbo].[Dim_Ship] ADD  CONSTRAINT [DF_Dim_Ship_End_Date]  DEFAULT (NULL) FOR [End_Date]
GO
ALTER TABLE [dbo].[F_Shipment]  WITH CHECK ADD  CONSTRAINT [FK_F_Shipment_Dim_Consignor] FOREIGN KEY([Consignor_Row_Id])
REFERENCES [dbo].[Dim_Consignor] ([Consignor_Row_ID])
GO
ALTER TABLE [dbo].[F_Shipment] CHECK CONSTRAINT [FK_F_Shipment_Dim_Consignor]
GO
ALTER TABLE [dbo].[F_Shipment]  WITH CHECK ADD  CONSTRAINT [FK_F_Shipment_Dim_Container] FOREIGN KEY([Container_Row_Id])
REFERENCES [dbo].[Dim_Container] ([Container_Row_Id])
GO
ALTER TABLE [dbo].[F_Shipment] CHECK CONSTRAINT [FK_F_Shipment_Dim_Container]
GO
ALTER TABLE [dbo].[F_Shipment]  WITH CHECK ADD  CONSTRAINT [FK_F_Shipment_Dim_Item] FOREIGN KEY([Item_Row_Id])
REFERENCES [dbo].[Dim_Item] ([Item_Row_Id])
GO
ALTER TABLE [dbo].[F_Shipment] CHECK CONSTRAINT [FK_F_Shipment_Dim_Item]
GO
ALTER TABLE [dbo].[F_Shipment]  WITH CHECK ADD  CONSTRAINT [FK_F_Shipment_Dim_Port] FOREIGN KEY([Port_Row_Id_To])
REFERENCES [dbo].[Dim_Port] ([Port_Row_Id])
GO
ALTER TABLE [dbo].[F_Shipment] CHECK CONSTRAINT [FK_F_Shipment_Dim_Port]
GO
ALTER TABLE [dbo].[F_Shipment]  WITH CHECK ADD  CONSTRAINT [FK_F_Shipment_Dim_Port1] FOREIGN KEY([Port_Row_Id_From])
REFERENCES [dbo].[Dim_Port] ([Port_Row_Id])
GO
ALTER TABLE [dbo].[F_Shipment] CHECK CONSTRAINT [FK_F_Shipment_Dim_Port1]
GO
ALTER TABLE [dbo].[F_Voyage_Port]  WITH CHECK ADD  CONSTRAINT [FK_F_Voyage_Port_Dim_Port] FOREIGN KEY([Port_Id_Current])
REFERENCES [dbo].[Dim_Port] ([Port_Row_Id])
GO
ALTER TABLE [dbo].[F_Voyage_Port] CHECK CONSTRAINT [FK_F_Voyage_Port_Dim_Port]
GO
ALTER TABLE [dbo].[F_Voyage_Port]  WITH CHECK ADD  CONSTRAINT [FK_F_Voyage_Port_Dim_Port1] FOREIGN KEY([Port_Id_End])
REFERENCES [dbo].[Dim_Port] ([Port_Row_Id])
GO
ALTER TABLE [dbo].[F_Voyage_Port] CHECK CONSTRAINT [FK_F_Voyage_Port_Dim_Port1]
GO
ALTER TABLE [dbo].[F_Voyage_Port]  WITH CHECK ADD  CONSTRAINT [FK_F_Voyage_Port_Dim_Port2] FOREIGN KEY([Port_Id_Next])
REFERENCES [dbo].[Dim_Port] ([Port_Row_Id])
GO
ALTER TABLE [dbo].[F_Voyage_Port] CHECK CONSTRAINT [FK_F_Voyage_Port_Dim_Port2]
GO
ALTER TABLE [dbo].[F_Voyage_Port]  WITH CHECK ADD  CONSTRAINT [FK_F_Voyage_Port_Dim_Port3] FOREIGN KEY([Port_Id_Start])
REFERENCES [dbo].[Dim_Port] ([Port_Row_Id])
GO
ALTER TABLE [dbo].[F_Voyage_Port] CHECK CONSTRAINT [FK_F_Voyage_Port_Dim_Port3]
GO
ALTER TABLE [dbo].[F_Voyage_Port]  WITH CHECK ADD  CONSTRAINT [FK_F_Voyage_Port_Dim_Ship] FOREIGN KEY([Ship_Row_Id])
REFERENCES [dbo].[Dim_Ship] ([Ship_Row_Id])
GO
ALTER TABLE [dbo].[F_Voyage_Port] CHECK CONSTRAINT [FK_F_Voyage_Port_Dim_Ship]
GO
ALTER TABLE [dbo].[F_Voyage_Port]  WITH CHECK ADD  CONSTRAINT [FK_F_Voyage_Port_Dim_Waiting_Time] FOREIGN KEY([Waiting_Time_Id])
REFERENCES [dbo].[Dim_Waiting_Time] ([Waiting_Time_Id])
GO
ALTER TABLE [dbo].[F_Voyage_Port] CHECK CONSTRAINT [FK_F_Voyage_Port_Dim_Waiting_Time]
GO
USE [master]
GO
ALTER DATABASE [Kramse_ODS] SET  READ_WRITE 
GO
