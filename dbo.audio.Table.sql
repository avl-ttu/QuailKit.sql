USE [QuailKit]
GO
/****** Object:  Table [dbo].[audio]    Script Date: 4/11/2019 2:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ARITHABORT ON
GO
CREATE TABLE [dbo].[audio] AS FILETABLE ON [PRIMARY] FILESTREAM_ON [FilsStream]
WITH
(
FILETABLE_DIRECTORY = N'audio', FILETABLE_COLLATE_FILENAME = SQL_Latin1_General_CP1_CI_AS
)
GO
/****** Object:  Trigger [dbo].[insert_audio]    Script Date: 4/11/2019 2:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hanif Tiznobake
-- Create date: March 2019
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[insert_audio]
   ON  [dbo].[audio] 
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	insert into dbo.audio_node (audio_id, node_id, start, channels, gps_synced)
	select [stream_id],SUBSTRING([name],1,charindex('_',[name],1)-1) as node_id, CONVERT(datetime2(0),STUFF(STUFF(STUFF(STUFF(Replace(Replace(SUBSTRING([name],len([name])-len([file_type])-15,15),'$','T'),'_','T'),5,0,'-'),8,0,'-'),14,0,':'),17,0,':')) AT TIME ZONE 'Central Standard Time' AS start,
	iif(charindex('+',[name])>0,2,1) as channels,convert(bit,iif(charindex('$',[name])>0,1,0)) as gps_synced
	from inserted



END
GO
ALTER TABLE [dbo].[audio] ENABLE TRIGGER [insert_audio]
GO
