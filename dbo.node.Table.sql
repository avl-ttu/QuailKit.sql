USE [QuailKit]
GO
/****** Object:  Table [dbo].[node]    Script Date: 4/9/2019 2:03:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[node](
	[node_id] [varchar](50) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_node] PRIMARY KEY CLUSTERED 
(
	[node_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
