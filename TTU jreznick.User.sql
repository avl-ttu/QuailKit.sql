USE [QuailKit]
GO
/****** Object:  User [TTU\jreznick]    Script Date: 4/9/2019 2:03:28 AM ******/
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
