USE [master]
GO
DROP DATABASE IF EXISTS [Kramse_Cleaning];
CREATE DATABASE [Kramse_Cleaning];
GO
USE [Kramse_Cleaning]
GO
/****** Object:  Table [dbo].[CountryCleaning]    Script Date: 14-3-2023 10:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryCleaning](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Country] [nvarchar](90) NOT NULL,
	[InCorrectCountry] [nvarchar](90) NOT NULL,
 CONSTRAINT [PK_Cleaning] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Log](
	[message] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Netherlands', N'Holland')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Netherlands', N'Nederland')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Netherlands', N'NL')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Belgium', N'BE')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Belgium', N'Belgie')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Belgium', N'Belgique')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Brazil', N'Brazilië')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Belgium', N'Belgium')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Netherlands', N'Netherlands')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Brazil', N'Brazil')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Canada', N'Canada')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Germany', N'Deutschland')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Germany', N'Germany')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Estonia', N'Estonia')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Finland', N'Finland')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'France', N'FR')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'France', N'France')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'France', N'Francia')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Gibraltar', N'Gibraltar')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'England', N'Great Britain')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'England', N'UK')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'England', N'United Kingdom')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Greece', N'Greece')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Greece', N'Griekenland')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Ireland', N'Ireland')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Italy', N'Italia')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Italy', N'Italy')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Norway', N'Norway')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Poland', N'Poland')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Poland', N'Polska')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Portugal', N'Portugal')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Rusia', N'Rusland')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Spain', N'Spain')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Sweden', N'Sweden')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Sweden', N'Switzerland')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'Macedonia', N'Yougoslavia')
GO
INSERT [dbo].[CountryCleaning] ( [Country], [InCorrectCountry]) VALUES ( N'England', N'England')
GO
SET IDENTITY_INSERT [dbo].[CountryCleaning] OFF
