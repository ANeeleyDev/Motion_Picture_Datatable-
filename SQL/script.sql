USE [master]
GO
/****** Object:  Database [Movies]    Script Date: 1/28/2022 11:25:50 PM ******/
CREATE DATABASE [Movies]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Movies', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Movies.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Movies_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Movies_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Movies] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Movies].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Movies] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Movies] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Movies] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Movies] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Movies] SET ARITHABORT OFF 
GO
ALTER DATABASE [Movies] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Movies] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Movies] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Movies] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Movies] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Movies] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Movies] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Movies] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Movies] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Movies] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Movies] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Movies] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Movies] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Movies] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Movies] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Movies] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Movies] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Movies] SET RECOVERY FULL 
GO
ALTER DATABASE [Movies] SET  MULTI_USER 
GO
ALTER DATABASE [Movies] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Movies] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Movies] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Movies] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Movies] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Movies] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Movies', N'ON'
GO
ALTER DATABASE [Movies] SET QUERY_STORE = OFF
GO
USE [Movies]
GO
/****** Object:  Table [dbo].[MotionPictures]    Script Date: 1/28/2022 11:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MotionPictures](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Release_Year] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MotionPictures] ON 

INSERT [dbo].[MotionPictures] ([ID], [Name], [Description], [Release_Year]) VALUES (1, N'Finding Nemo', N'Marlin (Albert Brooks), a clown fish, is overly cautious with his son, Nemo (Alexander Gould), who has a foreshortened fin. When Nemo swims too close to the surface to prove himself, he is caught by a diver, and horrified Marlin must set out to find him. A blue reef fish named Dory (Ellen DeGeneres) -- who has a really short memory -- joins Marlin and complicates the encounters with sharks, jellyfish, and a host of ocean dangers. Meanwhile, Nemo plots his escape from a dentists fish tank', 2003)
INSERT [dbo].[MotionPictures] ([ID], [Name], [Description], [Release_Year]) VALUES (2, N'Spider-Man:No Way Home', N'With Spider-Mans identity now revealed, our friendly neighborhood web-slinger is unmasked and no longer able to separate his normal life as Peter Parker from the high stakes of being a superhero. When Peter asks for help from Doctor Strange, the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.', 2021)
SET IDENTITY_INSERT [dbo].[MotionPictures] OFF
GO
USE [master]
GO
ALTER DATABASE [Movies] SET  READ_WRITE 
GO
