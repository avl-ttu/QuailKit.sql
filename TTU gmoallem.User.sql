USE [QuailKit]
GO
/****** Object:  User [TTU\gmoallem]    Script Date: 4/9/2019 2:03:28 AM ******/
CREATE USER [TTU\gmoallem] FOR LOGIN [TTU\gmoallem] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [TTU\gmoallem]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [TTU\gmoallem]
GO
