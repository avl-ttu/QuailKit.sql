USE [QuailKit]
GO
/****** Object:  Table [dbo].[audio_node]    Script Date: 4/11/2019 2:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[audio_node](
	[audio_id] [uniqueidentifier] NOT NULL,
	[node_id] [varchar](50) NOT NULL,
	[start] [datetime2](7) NULL,
	[end] [datetime2](7) NULL,
	[channels] [tinyint] NULL,
	[gps_synced] [bit] NULL,
 CONSTRAINT [PK_audio_node] PRIMARY KEY CLUSTERED 
(
	[audio_id] ASC,
	[node_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[audio_node]  WITH CHECK ADD  CONSTRAINT [FK_audio_node_audio] FOREIGN KEY([audio_id])
REFERENCES [dbo].[audio] ([stream_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[audio_node] CHECK CONSTRAINT [FK_audio_node_audio]
GO
ALTER TABLE [dbo].[audio_node]  WITH CHECK ADD  CONSTRAINT [FK_audio_node_node] FOREIGN KEY([node_id])
REFERENCES [dbo].[node] ([node_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[audio_node] CHECK CONSTRAINT [FK_audio_node_node]
GO
