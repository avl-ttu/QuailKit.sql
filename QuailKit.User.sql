USE [QuailKit]
GO
/****** Object:  User [QuailKit]    Script Date: 4/11/2019 2:12:16 AM ******/
CREATE USER [QuailKit] FOR LOGIN [QuailKit] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [QuailKit]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [QuailKit]
GO
