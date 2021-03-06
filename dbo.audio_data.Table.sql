USE [QuailKit]
GO
/****** Object:  Table [dbo].[audio_data]    Script Date: 4/11/2019 2:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[audio_data](
	[audio_id] [uniqueidentifier] NOT NULL,
	[data_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_audio_data_1] PRIMARY KEY CLUSTERED 
(
	[audio_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[audio_data]  WITH CHECK ADD  CONSTRAINT [FK_audio_data_audio] FOREIGN KEY([audio_id])
REFERENCES [dbo].[audio] ([stream_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[audio_data] CHECK CONSTRAINT [FK_audio_data_audio]
GO
ALTER TABLE [dbo].[audio_data]  WITH CHECK ADD  CONSTRAINT [FK_audio_data_data] FOREIGN KEY([data_id])
REFERENCES [dbo].[data] ([stream_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[audio_data] CHECK CONSTRAINT [FK_audio_data_data]
GO
