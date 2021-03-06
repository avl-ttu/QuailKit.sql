USE [QuailKit]
GO
/****** Object:  Table [dbo].[detection]    Script Date: 4/11/2019 2:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detection](
	[detection_id] [bigint] IDENTITY(1,1) NOT NULL,
	[data_id] [uniqueidentifier] NOT NULL,
	[channel] [tinyint] NULL,
	[start_t] [real] NOT NULL,
	[end_t] [real] NULL,
	[low_f] [real] NULL,
	[high_f] [real] NULL,
	[method] [varchar](50) NULL,
	[created] [datetime2](0) NOT NULL,
	[created_by] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_detection] PRIMARY KEY CLUSTERED 
(
	[detection_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [same] UNIQUE NONCLUSTERED 
(
	[data_id] ASC,
	[channel] ASC,
	[start_t] ASC,
	[end_t] ASC,
	[low_f] ASC,
	[high_f] ASC,
	[method] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
ALTER TABLE [dbo].[detection]  WITH CHECK ADD  CONSTRAINT [duh] CHECK  (([start_t]<[end_t] AND [low_f]<[high_f]))
GO
ALTER TABLE [dbo].[detection] CHECK CONSTRAINT [duh]
GO
