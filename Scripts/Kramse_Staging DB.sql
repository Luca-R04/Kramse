USE [master]
GO
DROP DATABASE IF EXISTS [Kramse_Staging];
/****** Object:  Database [Kramse_Staging]    Script Date: 27-3-2023 15:13:10 ******/
CREATE DATABASE [Kramse_Staging]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kramse_Staging', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLDEV2019\MSSQL\DATA\Kramse_Staging.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Kramse_Staging_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLDEV2019\MSSQL\DATA\Kramse_Staging_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Dim_Consignor]    Script Date: 27-3-2023 15:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Consignor](
	[Consignor_Id] [int] NOT NULL,
	[Consignor] [nvarchar](250) NULL,
	[Discount] [float] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_Dim_Consignor] PRIMARY KEY CLUSTERED 
(
	[Consignor_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Container]    Script Date: 27-3-2023 15:13:10 ******/
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
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_Dim_Container] PRIMARY KEY CLUSTERED 
(
	[Container_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Item]    Script Date: 27-3-2023 15:13:10 ******/
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
/****** Object:  Table [dbo].[Dim_Port]    Script Date: 27-3-2023 15:13:10 ******/
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
/****** Object:  Table [dbo].[Dim_Ship]    Script Date: 27-3-2023 15:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Ship](
	[Ship_Id] [int] NOT NULL,
	[Shipname] [nvarchar](255) NULL,
	[MaxTEU] [int] NULL,
	[Yearcost] [numeric](38, 19) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_Dim_Ship] PRIMARY KEY CLUSTERED 
(
	[Ship_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Time]    Script Date: 27-3-2023 15:13:10 ******/
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
/****** Object:  Table [dbo].[Dim_Waiting_Time]    Script Date: 27-3-2023 15:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Waiting_Time](
	[Waiting_Time_Id] [int] IDENTITY(1,1) NOT NULL,
	[Port_Id] [int] NULL,
	[Ship_Id] [int] NULL,
	[Waiting_Time] [nvarchar](10) NULL,
 CONSTRAINT [PK_Dim_Waiting_Time] PRIMARY KEY CLUSTERED 
(
	[Waiting_Time_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_Shipment]    Script Date: 27-3-2023 15:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_Shipment](
	[Shipment_Id] [int] NOT NULL,
	[Item_Id] [int] NULL,
	[Consignor_Id] [int] NULL,
	[Voyage_id] [int] NULL,
	[Port_Id_From] [int] NULL,
	[Port_Id_To] [int] NULL,
	[Distance] [int] NULL,
	[Container_Id] [int] NULL,
	[Container_Range] [nvarchar](50) NULL,
	[Number_Containers] [int] NULL,
 CONSTRAINT [PK_F_Shipment] PRIMARY KEY CLUSTERED 
(
	[Shipment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_Voyage_Port]    Script Date: 27-3-2023 15:13:10 ******/
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
 CONSTRAINT [PK_F_Voyage_Port] PRIMARY KEY CLUSTERED 
(
	[Voyage_Port_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dim_Consignor] ADD  CONSTRAINT [DF_Dim_Consignor_StartDate]  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Dim_Consignor] ADD  CONSTRAINT [DF_Dim_Consignor_EndDate]  DEFAULT (NULL) FOR [EndDate]
GO
ALTER TABLE [dbo].[Dim_Container] ADD  CONSTRAINT [DF_Dim_Container_StartDate]  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Dim_Container] ADD  CONSTRAINT [DF_Dim_Container_EndDate]  DEFAULT (NULL) FOR [EndDate]
GO
ALTER TABLE [dbo].[Dim_Ship] ADD  CONSTRAINT [DF_Dim_Ship_StartDate]  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Dim_Ship] ADD  CONSTRAINT [DF_Dim_Ship_EndDate]  DEFAULT (NULL) FOR [EndDate]
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
ALTER TABLE [dbo].[F_Shipment]  WITH CHECK ADD  CONSTRAINT [FK_F_Shipment_Dim_Port] FOREIGN KEY([Port_Id_From])
REFERENCES [dbo].[Dim_Port] ([Port_Id])
GO
ALTER TABLE [dbo].[F_Shipment] CHECK CONSTRAINT [FK_F_Shipment_Dim_Port]
GO
ALTER TABLE [dbo].[F_Shipment]  WITH CHECK ADD  CONSTRAINT [FK_F_Shipment_Dim_Port1] FOREIGN KEY([Port_Id_To])
REFERENCES [dbo].[Dim_Port] ([Port_Id])
GO
ALTER TABLE [dbo].[F_Shipment] CHECK CONSTRAINT [FK_F_Shipment_Dim_Port1]
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
ALTER DATABASE [Kramse_Staging] SET  READ_WRITE 
GO
