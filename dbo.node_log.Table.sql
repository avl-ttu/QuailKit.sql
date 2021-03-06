USE [QuailKit]
GO
/****** Object:  Table [dbo].[node_log]    Script Date: 4/11/2019 2:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[node_log](
	[node_id] [varchar](50) NOT NULL,
	[datetime] [datetimeoffset](0) NULL,
	[latitude] [float] NOT NULL,
	[longitude] [float] NOT NULL,
	[temperature] [float] NOT NULL,
	[DATE] [date] NOT NULL,
	[TIME] [varchar](50) NOT NULL,
	[LAT] [float] NOT NULL,
	[NS] [char](1) NOT NULL,
	[LON] [float] NOT NULL,
	[EW] [char](1) NOT NULL,
 CONSTRAINT [PK_node_log] PRIMARY KEY CLUSTERED 
(
	[node_id] ASC,
	[DATE] ASC,
	[TIME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[node_log]  WITH CHECK ADD  CONSTRAINT [FK_node_log_node] FOREIGN KEY([node_id])
REFERENCES [dbo].[node] ([node_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[node_log] CHECK CONSTRAINT [FK_node_log_node]
GO
