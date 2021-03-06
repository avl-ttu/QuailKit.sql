USE [QuailKit]
GO
/****** Object:  Table [dbo].[detection_activity]    Script Date: 4/11/2019 2:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detection_activity](
	[detection_id] [bigint] NOT NULL,
	[activity_id] [int] NOT NULL,
	[method] [varchar](50) NULL,
 CONSTRAINT [PK_detection_activity] PRIMARY KEY CLUSTERED 
(
	[detection_id] ASC,
	[activity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[detection_activity]  WITH CHECK ADD  CONSTRAINT [FK_detection_activity_activity] FOREIGN KEY([activity_id])
REFERENCES [dbo].[activity] ([activity_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[detection_activity] CHECK CONSTRAINT [FK_detection_activity_activity]
GO
ALTER TABLE [dbo].[detection_activity]  WITH CHECK ADD  CONSTRAINT [FK_detection_activity_detection] FOREIGN KEY([detection_id])
REFERENCES [dbo].[detection] ([detection_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[detection_activity] CHECK CONSTRAINT [FK_detection_activity_detection]
GO
