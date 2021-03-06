USE [QuailKit]
GO
/****** Object:  Table [dbo].[data]    Script Date: 4/11/2019 2:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ARITHABORT ON
GO
CREATE TABLE [dbo].[data] AS FILETABLE ON [PRIMARY] FILESTREAM_ON [FilsStream]
WITH
(
FILETABLE_DIRECTORY = N'data', FILETABLE_COLLATE_FILENAME = SQL_Latin1_General_CP1_CI_AS
)
GO
/****** Object:  Trigger [dbo].[data_added]    Script Date: 4/11/2019 2:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[data_added]
   ON  [dbo].[data]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into audio_data
	select audio.stream_id,inserted.stream_id
	from audio inner join inserted on left(audio.name,charindex('.',audio.name)-1) = left(inserted.name,charindex('.',inserted.name)-1)

END
GO
ALTER TABLE [dbo].[data] ENABLE TRIGGER [data_added]
GO
