USE [QuailKit]
GO
/****** Object:  Table [dbo].[activity]    Script Date: 4/11/2019 2:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[activity](
	[activity_id] [int] NOT NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[datetime] [datetime2](5) NULL,
 CONSTRAINT [PK_activity] PRIMARY KEY CLUSTERED 
(
	[activity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
