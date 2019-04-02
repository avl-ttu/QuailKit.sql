USE [QuailKit]
GO
/****** Object:  Table [dbo].[detection]    Script Date: 4/1/2019 10:53:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detection](
	[detection_id] [int] IDENTITY(1,1) NOT NULL,
	[data_id] [uniqueidentifier] NOT NULL,
	[channel] [tinyint] NULL,
	[start] [datetime2](7) NULL,
	[end] [datetime2](7) NULL,
	[low] [real] NULL,
	[high] [real] NULL,
	[created] [datetime2](0) NOT NULL,
	[created_by] [nvarchar](128) NOT NULL,
	[algorithm] [nchar](10) NULL,
 CONSTRAINT [PK_detection] PRIMARY KEY CLUSTERED 
(
	[detection_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [same]    Script Date: 4/1/2019 10:53:21 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [same] ON [dbo].[detection]
(
	[start] ASC,
	[end] ASC,
	[low] ASC,
	[high] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[detection] ADD  CONSTRAINT [DF_detection_created]  DEFAULT (getdate()) FOR [created]
GO
ALTER TABLE [dbo].[detection] ADD  CONSTRAINT [DF_detection_created_by]  DEFAULT (suser_name()) FOR [created_by]
GO
ALTER TABLE [dbo].[detection]  WITH CHECK ADD  CONSTRAINT [FK_detection_data] FOREIGN KEY([data_id])
REFERENCES [dbo].[data] ([stream_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[detection] CHECK CONSTRAINT [FK_detection_data]
GO
ALTER TABLE [dbo].[detection]  WITH CHECK ADD  CONSTRAINT [duh] CHECK  (([start]<[end] AND [low]<[high]))
GO
ALTER TABLE [dbo].[detection] CHECK CONSTRAINT [duh]
GO
