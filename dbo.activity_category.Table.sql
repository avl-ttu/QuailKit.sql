USE [QuailKit]
GO
/****** Object:  Table [dbo].[activity_category]    Script Date: 4/11/2019 2:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[activity_category](
	[activity_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[likelihood] [real] NULL,
 CONSTRAINT [PK_activity_category] PRIMARY KEY CLUSTERED 
(
	[activity_id] ASC,
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[activity_category]  WITH CHECK ADD  CONSTRAINT [FK_activity_category_activity] FOREIGN KEY([activity_id])
REFERENCES [dbo].[activity] ([activity_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[activity_category] CHECK CONSTRAINT [FK_activity_category_activity]
GO
ALTER TABLE [dbo].[activity_category]  WITH CHECK ADD  CONSTRAINT [FK_activity_category_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[activity_category] CHECK CONSTRAINT [FK_activity_category_category]
GO
