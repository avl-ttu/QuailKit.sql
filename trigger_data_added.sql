USE [QuailKit]
GO
/****** Object:  Trigger [dbo].[data_added]    Script Date: 3/30/2019 4:08:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[data_added]
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
