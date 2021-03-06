USE [master]
GO
/****** Object:  Database [property_management]    Script Date: 16-05-2022 18:41:11 ******/
CREATE DATABASE [property_management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'property_management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\property_management.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'property_management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\property_management_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [property_management] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [property_management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [property_management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [property_management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [property_management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [property_management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [property_management] SET ARITHABORT OFF 
GO
ALTER DATABASE [property_management] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [property_management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [property_management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [property_management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [property_management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [property_management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [property_management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [property_management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [property_management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [property_management] SET  ENABLE_BROKER 
GO
ALTER DATABASE [property_management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [property_management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [property_management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [property_management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [property_management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [property_management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [property_management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [property_management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [property_management] SET  MULTI_USER 
GO
ALTER DATABASE [property_management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [property_management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [property_management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [property_management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [property_management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [property_management] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [property_management] SET QUERY_STORE = OFF
GO
USE [property_management]
GO
/****** Object:  Table [dbo].[property]    Script Date: 16-05-2022 18:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[property](
	[property_id] [int] IDENTITY(1,1) NOT NULL,
	[property_name] [varchar](50) NOT NULL,
	[property_address] [varchar](50) NOT NULL,
	[property_geo_location] [varchar](250) NULL,
	[createdDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[property_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[addproperty]    Script Date: 16-05-2022 18:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addproperty]
 @property_name varchar(50),
 @property_address varchar(250),
 @property_geo_location varchar(250)
 AS
 BEGIN
 insert into property (property_name,property_address,property_geo_location,createdDate) values (@property_name,@property_address,@property_geo_location,GETDATE())
 END
GO
/****** Object:  StoredProcedure [dbo].[deleteproperty]    Script Date: 16-05-2022 18:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteproperty]
 @property_id int
 AS
 BEGIN
 DELETE FROM property WHERE property_id = @property_id;
 END
GO
/****** Object:  StoredProcedure [dbo].[getAllProperties]    Script Date: 16-05-2022 18:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec getAllProperties
 CREATE PROCEDURE [dbo].[getAllProperties]
 AS
 BEGIN
 SELECT * from property;
 END
GO
/****** Object:  StoredProcedure [dbo].[updateproperty]    Script Date: 16-05-2022 18:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[updateproperty]
 @property_id int,
 @property_name varchar(50),
 @property_address varchar(250),
 @property_geo_location varchar(250)
 AS
 BEGIN
 UPDATE property SET property_name= @property_name, property_address=@property_address,
 property_geo_location=@property_geo_location
 WHERE property_id = @property_id;
 
 END
GO
USE [master]
GO
ALTER DATABASE [property_management] SET  READ_WRITE 
GO
