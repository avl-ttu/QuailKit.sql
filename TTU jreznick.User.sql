USE [QuailKit]
GO
/****** Object:  User [TTU\jreznick]    Script Date: 4/1/2019 10:53:20 PM ******/
CREATE USER [TTU\jreznick] FOR LOGIN [TTU\jreznick] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [TTU\jreznick]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [TTU\jreznick]
GO
ALTER ROLE [db_datareader] ADD MEMBER [TTU\jreznick]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [TTU\jreznick]
GO
