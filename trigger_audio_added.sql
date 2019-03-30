USE [QuailKit]
GO
/****** Object:  Trigger [dbo].[new_audio]    Script Date: 3/30/2019 4:09:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[new_audio]
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

--insert into dbo.audio_data (audio_id, data_id)
--select a.[stream_id],d.[stream_id]
--from audio

END
