USE [QuailKit]
GO
/****** Object:  User [QuailKit]    Script Date: 4/1/2019 10:53:20 PM ******/
CREATE USER [QuailKit] FOR LOGIN [QuailKit] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [QuailKit]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [QuailKit]
GO
