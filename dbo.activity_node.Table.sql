USE [QuailKit]
GO
/****** Object:  Table [dbo].[activity_node]    Script Date: 4/11/2019 2:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[activity_node](
	[activity_id] [int] NOT NULL,
	[node_id] [varchar](50) NOT NULL,
 CONSTRAINT [PK_activity_node] PRIMARY KEY CLUSTERED 
(
	[activity_id] ASC,
	[node_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[activity_node]  WITH CHECK ADD  CONSTRAINT [FK_activity_node_activity] FOREIGN KEY([activity_id])
REFERENCES [dbo].[activity] ([activity_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[activity_node] CHECK CONSTRAINT [FK_activity_node_activity]
GO
ALTER TABLE [dbo].[activity_node]  WITH CHECK ADD  CONSTRAINT [FK_activity_node_node] FOREIGN KEY([node_id])
REFERENCES [dbo].[node] ([node_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[activity_node] CHECK CONSTRAINT [FK_activity_node_node]
GO
