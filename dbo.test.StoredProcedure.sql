USE [QuailKit]
GO
/****** Object:  StoredProcedure [dbo].[test]    Script Date: 4/11/2019 2:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[test]
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @query nvarchar(max) =
    N'SELECT cast(tipped as int) as tipped, tip_amount, fare_amount FROM [dbo].[nyctaxi_sample]'
    EXECUTE sp_execute_external_script
    @language = N'Python',
    @script = N'
import h5py 
import numpy as np
import os
h5py.File(os.path.join(''Z:\\QuailKit\\data\\test.h5''), ''w'')
'
END
GO
