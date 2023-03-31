USE [master]
GO
/****** Object:  Database [Kramse_RDBMS_Raw]    Script Date: 30-3-2023 15:35:22 ******/
DROP DATABASE IF EXISTS [Kramse_RDBMS_Raw]
CREATE DATABASE [Kramse_RDBMS_Raw]
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kramse_RDBMS_Raw].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET RECOVERY FULL 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET  MULTI_USER 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Kramse_RDBMS_Raw', N'ON'
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET QUERY_STORE = OFF
GO
USE [Kramse_RDBMS_Raw]
GO
/****** Object:  Table [dbo].[VoyagePort]    Script Date: 30-3-2023 15:35:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VoyagePort](
	[VV_VoyageId] [int] NOT NULL,
	[VP_PortIdCurrent] [int] NULL,
	[Vp_PortIdNext] [int] NULL,
	[Vp_LegDateDepart] [datetime] NULL,
	[Vp_LegDateArrival] [datetime] NULL,
	[Vp_Traject_Distance] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[waitingTime]    Script Date: 30-3-2023 15:35:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[waitingTime]
AS
SELECT DISTINCT TOP (100) PERCENT t2.VV_VoyageId, t2.VP_PortIdCurrent, t2.Vp_PortIdNext, t2.Vp_Traject_Distance, t1.Vp_LegDateArrival AS Arrival, t2.Vp_LegDateDepart AS Depart
FROM     dbo.VoyagePort AS t1 INNER JOIN
                  dbo.VoyagePort AS t2 ON t1.Vp_PortIdNext = t2.VP_PortIdCurrent AND t1.VV_VoyageId = t2.VV_VoyageId
ORDER BY Arrival
GO
/****** Object:  Table [dbo].[Consignor]    Script Date: 30-3-2023 15:35:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consignor](
	[Id] [int] NOT NULL,
	[Consignor] [nvarchar](250) NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_Consignor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Container]    Script Date: 30-3-2023 15:35:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Container](
	[Id] [int] NOT NULL,
	[Type] [nvarchar](255) NULL,
	[Refrigeration] [bit] NULL,
	[Cubes] [float] NULL,
	[EuroPricePerKm] [float] NULL,
 CONSTRAINT [PK_Container] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 30-3-2023 15:35:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemKey] [int] NOT NULL,
	[Mfgr] [nvarchar](50) NULL,
	[StorageType] [nvarchar](50) NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MRV]    Script Date: 30-3-2023 15:35:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MRV](
	[Name] [nvarchar](255) NOT NULL,
	[ShipType] [nvarchar](255) NULL,
	[HomePort] [nvarchar](255) NULL,
	[Annual average Fuel consumption per distance (kg / n mile)] [float] NULL,
	[Total time spent at sea (hours)] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Port]    Script Date: 30-3-2023 15:35:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Port](
	[VPS_PortId] [int] NOT NULL,
	[PortName] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
 CONSTRAINT [PK_Port] PRIMARY KEY CLUSTERED 
(
	[VPS_PortId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ship]    Script Date: 30-3-2023 15:35:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ship](
	[VS_Shipid] [int] NOT NULL,
	[Shipname] [nvarchar](255) NOT NULL,
	[MaxTEU] [int] NULL,
	[Yearcost] [numeric](38, 19) NULL,
 CONSTRAINT [PK_Ship_1] PRIMARY KEY CLUSTERED 
(
	[VS_Shipid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_ShipName] UNIQUE NONCLUSTERED 
(
	[Shipname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 30-3-2023 15:35:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment](
	[ShipmentId] [int] NOT NULL,
	[VoyageId] [int] NULL,
	[ConsignorId] [int] NULL,
	[PortIdFrom] [int] NULL,
	[PortIdTo] [int] NULL,
	[Distance] [int] NULL,
	[NumberContainers] [int] NULL,
 CONSTRAINT [PK_Shipment] PRIMARY KEY CLUSTERED 
(
	[ShipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipmentDetail]    Script Date: 30-3-2023 15:35:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentDetail](
	[ShipmentId] [int] NULL,
	[ContainerNr] [nvarchar](50) NULL,
	[Item] [int] NULL,
	[ContainerTypeId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voyage]    Script Date: 30-3-2023 15:35:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voyage](
	[VV_VoyageId] [int] NOT NULL,
	[VS_ShipId] [int] NULL,
	[V_DateDepartVoyage] [datetime] NULL,
	[VPS_PortIdStart] [int] NULL,
	[V_PortIdEnd] [int] NULL,
 CONSTRAINT [PK_Voyage] PRIMARY KEY CLUSTERED 
(
	[VV_VoyageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MRV]  WITH CHECK ADD  CONSTRAINT [FK_MRV_Ship] FOREIGN KEY([Name])
REFERENCES [dbo].[Ship] ([Shipname])
GO
ALTER TABLE [dbo].[MRV] CHECK CONSTRAINT [FK_MRV_Ship]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Consignor] FOREIGN KEY([ConsignorId])
REFERENCES [dbo].[Consignor] ([Id])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_Consignor]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_From_Port] FOREIGN KEY([PortIdFrom])
REFERENCES [dbo].[Port] ([VPS_PortId])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_From_Port]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_To_Port] FOREIGN KEY([PortIdTo])
REFERENCES [dbo].[Port] ([VPS_PortId])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_To_Port]
GO
ALTER TABLE [dbo].[ShipmentDetail]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentDetail_Container] FOREIGN KEY([ContainerTypeId])
REFERENCES [dbo].[Container] ([Id])
GO
ALTER TABLE [dbo].[ShipmentDetail] CHECK CONSTRAINT [FK_ShipmentDetail_Container]
GO
ALTER TABLE [dbo].[ShipmentDetail]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentDetail_Item] FOREIGN KEY([Item])
REFERENCES [dbo].[Item] ([ItemKey])
GO
ALTER TABLE [dbo].[ShipmentDetail] CHECK CONSTRAINT [FK_ShipmentDetail_Item]
GO
ALTER TABLE [dbo].[ShipmentDetail]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentDetail_Shipment] FOREIGN KEY([ShipmentId])
REFERENCES [dbo].[Shipment] ([ShipmentId])
GO
ALTER TABLE [dbo].[ShipmentDetail] CHECK CONSTRAINT [FK_ShipmentDetail_Shipment]
GO
ALTER TABLE [dbo].[Voyage]  WITH CHECK ADD  CONSTRAINT [FK_Voyage_End_Port] FOREIGN KEY([V_PortIdEnd])
REFERENCES [dbo].[Port] ([VPS_PortId])
GO
ALTER TABLE [dbo].[Voyage] CHECK CONSTRAINT [FK_Voyage_End_Port]
GO
ALTER TABLE [dbo].[Voyage]  WITH CHECK ADD  CONSTRAINT [FK_Voyage_Ship] FOREIGN KEY([VS_ShipId])
REFERENCES [dbo].[Ship] ([VS_Shipid])
GO
ALTER TABLE [dbo].[Voyage] CHECK CONSTRAINT [FK_Voyage_Ship]
GO
ALTER TABLE [dbo].[Voyage]  WITH CHECK ADD  CONSTRAINT [FK_Voyage_Start_Port] FOREIGN KEY([VPS_PortIdStart])
REFERENCES [dbo].[Port] ([VPS_PortId])
GO
ALTER TABLE [dbo].[Voyage] CHECK CONSTRAINT [FK_Voyage_Start_Port]
GO
ALTER TABLE [dbo].[VoyagePort]  WITH CHECK ADD  CONSTRAINT [FK_VoyagePort_Current_Port] FOREIGN KEY([VP_PortIdCurrent])
REFERENCES [dbo].[Port] ([VPS_PortId])
GO
ALTER TABLE [dbo].[VoyagePort] CHECK CONSTRAINT [FK_VoyagePort_Current_Port]
GO
ALTER TABLE [dbo].[VoyagePort]  WITH CHECK ADD  CONSTRAINT [FK_VoyagePort_Next_Port] FOREIGN KEY([Vp_PortIdNext])
REFERENCES [dbo].[Port] ([VPS_PortId])
GO
ALTER TABLE [dbo].[VoyagePort] CHECK CONSTRAINT [FK_VoyagePort_Next_Port]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "t1"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 275
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t2"
            Begin Extent = 
               Top = 7
               Left = 323
               Bottom = 170
               Right = 550
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 2412
         Width = 2196
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'waitingTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'waitingTime'
GO
USE [master]
GO
ALTER DATABASE [Kramse_RDBMS_Raw] SET  READ_WRITE 
GO
