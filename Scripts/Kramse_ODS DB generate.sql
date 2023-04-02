USE [master]
GO
/****** Object:  Database [Kramse_ODS]    Script Date: 2-4-2023 14:29:29 ******/
DROP DATABASE IF EXISTS [Kramse_ODS]
CREATE DATABASE [Kramse_ODS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kramse_ODS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLDEV2019\MSSQL\DATA\Kramse_ODS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Kramse_ODS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLDEV2019\MSSQL\DATA\Kramse_ODS_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Dim_Consignor]    Script Date: 2-4-2023 14:29:30 ******/
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
/****** Object:  Table [dbo].[Dim_Container]    Script Date: 2-4-2023 14:29:30 ******/
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
/****** Object:  Table [dbo].[Dim_Item]    Script Date: 2-4-2023 14:29:30 ******/
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
/****** Object:  Table [dbo].[Dim_Port]    Script Date: 2-4-2023 14:29:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Port](
	[Port_Id] [int] NOT NULL,
	[PortName] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dim_Port_1] PRIMARY KEY CLUSTERED 
(
	[Port_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Ship]    Script Date: 2-4-2023 14:29:30 ******/
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
/****** Object:  Table [dbo].[Dim_Time]    Script Date: 2-4-2023 14:29:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Time](
	[PK_Date] [datetime] NOT NULL,
	[Date_Name] [nvarchar](50) NULL,
	[Year] [datetime] NULL,
	[Year_Name] [nvarchar](50) NULL,
	[Quarter] [datetime] NULL,
	[Quarter_Name] [nvarchar](50) NULL,
	[Month] [datetime] NULL,
	[Month_Name] [nvarchar](50) NULL,
	[Week] [datetime] NULL,
	[Week_Name] [nvarchar](50) NULL,
	[Day_Of_Year] [int] NULL,
	[Day_Of_Year_Name] [nvarchar](50) NULL,
	[Day_Of_Quarter] [int] NULL,
	[Day_Of_Quarter_Name] [nvarchar](50) NULL,
	[Day_Of_Month] [int] NULL,
	[Day_Of_Month_Name] [nvarchar](50) NULL,
	[Day_Of_Week] [int] NULL,
	[Day_Of_Week_Name] [nvarchar](50) NULL,
	[Week_Of_Year] [int] NULL,
	[Week_Of_Year_Name] [nvarchar](50) NULL,
	[Month_Of_Year] [int] NULL,
	[Month_Of_Year_Name] [nvarchar](50) NULL,
	[Month_Of_Quarter] [int] NULL,
	[Month_Of_Quarter_Name] [nvarchar](50) NULL,
	[Quarter_Of_Year] [int] NULL,
	[Quarter_Of_Year_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dim_Time] PRIMARY KEY CLUSTERED 
(
	[PK_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Voyage]    Script Date: 2-4-2023 14:29:30 ******/
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
/****** Object:  Table [dbo].[F_Shipment]    Script Date: 2-4-2023 14:29:30 ******/
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
	[Port_Id_Current] [int] NOT NULL,
	[Port_Id_Next] [int] NOT NULL,
	[Distance] [int] NULL,
	[Container_Row_Id] [int] NOT NULL,
	[Container_Range] [nvarchar](50) NULL,
	[Number_Containers] [int] NULL,
	[Actual_Container_Count] [int] NULL,
	[Ship_Row_Id] [int] NOT NULL,
	[Load_Factor] [float] NULL,
	[ReveneuEUR] [float] NULL,
	[DiscountEUR] [float] NULL,
 CONSTRAINT [PK_F_Shipment] PRIMARY KEY CLUSTERED 
(
	[Shipment_Id] ASC,
	[Item_Row_Id] ASC,
	[Consignor_Row_Id] ASC,
	[Voyage_id] ASC,
	[Port_Id_Current] ASC,
	[Port_Id_Next] ASC,
	[Container_Row_Id] ASC,
	[Ship_Row_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_Voyage_Port]    Script Date: 2-4-2023 14:29:30 ******/
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
	[Waiting_Time] [int] NULL,
 CONSTRAINT [PK_F_Voyage_Port] PRIMARY KEY CLUSTERED 
(
	[Voyage_Id] ASC,
	[Ship_Row_Id] ASC,
	[Port_Id_Current] ASC,
	[Port_Id_Next] ASC,
	[Port_Id_Start] ASC,
	[Port_Id_End] ASC
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
ALTER TABLE [dbo].[F_Shipment]  WITH CHECK ADD  CONSTRAINT [FK_F_Shipment_Dim_Port2] FOREIGN KEY([Port_Id_Current])
REFERENCES [dbo].[Dim_Port] ([Port_Id])
GO
ALTER TABLE [dbo].[F_Shipment] CHECK CONSTRAINT [FK_F_Shipment_Dim_Port2]
GO
ALTER TABLE [dbo].[F_Shipment]  WITH CHECK ADD  CONSTRAINT [FK_F_Shipment_Dim_Port3] FOREIGN KEY([Port_Id_Next])
REFERENCES [dbo].[Dim_Port] ([Port_Id])
GO
ALTER TABLE [dbo].[F_Shipment] CHECK CONSTRAINT [FK_F_Shipment_Dim_Port3]
GO
ALTER TABLE [dbo].[F_Shipment]  WITH CHECK ADD  CONSTRAINT [FK_F_Shipment_Dim_Ship] FOREIGN KEY([Ship_Row_Id])
REFERENCES [dbo].[Dim_Ship] ([Ship_Row_Id])
GO
ALTER TABLE [dbo].[F_Shipment] CHECK CONSTRAINT [FK_F_Shipment_Dim_Ship]
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
ALTER TABLE [dbo].[F_Voyage_Port]  WITH CHECK ADD  CONSTRAINT [FK_F_Voyage_Port_Dim_Ship] FOREIGN KEY([Ship_Row_Id])
REFERENCES [dbo].[Dim_Ship] ([Ship_Row_Id])
GO
ALTER TABLE [dbo].[F_Voyage_Port] CHECK CONSTRAINT [FK_F_Voyage_Port_Dim_Ship]
GO
ALTER TABLE [dbo].[F_Voyage_Port]  WITH CHECK ADD  CONSTRAINT [FK_F_Voyage_Port_Dim_Time] FOREIGN KEY([Date_Depart])
REFERENCES [dbo].[Dim_Time] ([PK_Date])
GO
ALTER TABLE [dbo].[F_Voyage_Port] CHECK CONSTRAINT [FK_F_Voyage_Port_Dim_Time]
GO
ALTER TABLE [dbo].[F_Voyage_Port]  WITH CHECK ADD  CONSTRAINT [FK_F_Voyage_Port_Dim_Time1] FOREIGN KEY([Leg_Date_Depart])
REFERENCES [dbo].[Dim_Time] ([PK_Date])
GO
ALTER TABLE [dbo].[F_Voyage_Port] CHECK CONSTRAINT [FK_F_Voyage_Port_Dim_Time1]
GO
ALTER TABLE [dbo].[F_Voyage_Port]  WITH CHECK ADD  CONSTRAINT [FK_F_Voyage_Port_Dim_Time2] FOREIGN KEY([Leg_Date_Arrival])
REFERENCES [dbo].[Dim_Time] ([PK_Date])
GO
ALTER TABLE [dbo].[F_Voyage_Port] CHECK CONSTRAINT [FK_F_Voyage_Port_Dim_Time2]
GO
ALTER TABLE [dbo].[F_Voyage_Port]  WITH CHECK ADD  CONSTRAINT [FK_F_Voyage_Port_Dim_Voyage] FOREIGN KEY([Voyage_Id])
REFERENCES [dbo].[Dim_Voyage] ([Voyage_Id])
GO
ALTER TABLE [dbo].[F_Voyage_Port] CHECK CONSTRAINT [FK_F_Voyage_Port_Dim_Voyage]
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'PK_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'PK_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Date_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Date_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Date_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Year_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Week'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Week' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Week'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Week_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Week_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Week_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Quarter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Month' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Month_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Week'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Week' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Week'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Week_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Week_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Week_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Week_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Week_Of_Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Week_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Week_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Week_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Week_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Quarter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Of_Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time', @level2type=N'CONSTRAINT',@level2name=N'PK_Dim_Time'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVTable', @value=N'Dim_Time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time'
GO
EXEC sys.sp_addextendedproperty @name=N'Project', @value=N'02ea4fc2-e7bb-4556-9fa3-c1a4a778c275' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dim_Time'
GO
USE [master]
GO
ALTER DATABASE [Kramse_ODS] SET  READ_WRITE 
GO
