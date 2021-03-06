USE [master]
GO
/****** Object:  Database [QuailKit]    Script Date: 4/11/2019 2:12:15 AM ******/
CREATE DATABASE [QuailKit]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuailKit', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.AVLSQLSERVER\MSSQL\DATA\QuailKit.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ), 
 FILEGROUP [FilsStream] CONTAINS FILESTREAM  DEFAULT
( NAME = N'QuailKit_filestream', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.AVLSQLSERVER\MSSQL\DATA\QuailKit_filestream' , MAXSIZE = UNLIMITED)
 LOG ON 
( NAME = N'QuailKit_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.AVLSQLSERVER\MSSQL\DATA\QuailKit_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QuailKit] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuailKit].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuailKit] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuailKit] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuailKit] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuailKit] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuailKit] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuailKit] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuailKit] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuailKit] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuailKit] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuailKit] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuailKit] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuailKit] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuailKit] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuailKit] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuailKit] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuailKit] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuailKit] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuailKit] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuailKit] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuailKit] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuailKit] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuailKit] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuailKit] SET RECOVERY FULL 
GO
ALTER DATABASE [QuailKit] SET  MULTI_USER 
GO
ALTER DATABASE [QuailKit] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuailKit] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuailKit] SET FILESTREAM( NON_TRANSACTED_ACCESS = FULL, DIRECTORY_NAME = N'QuailKit' ) 
GO
ALTER DATABASE [QuailKit] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuailKit] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuailKit', N'ON'
GO
ALTER DATABASE [QuailKit] SET QUERY_STORE = OFF
GO
ALTER DATABASE [QuailKit] SET  READ_WRITE 
GO
