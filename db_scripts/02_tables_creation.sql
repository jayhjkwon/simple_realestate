USE [SimpleRealestate]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 2014-06-20 오전 7:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Enquiry]    Script Date: 2014-06-20 오전 7:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enquiry](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Comment] [nvarchar](4000) NULL,
	[PropertyId] [int] NOT NULL,
 CONSTRAINT [PK_Enquiry] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Photo]    Script Date: 2014-06-20 오전 7:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photo](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[PropertyId] [int] NOT NULL,
 CONSTRAINT [PK_Photo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropertyInfo]    Script Date: 2014-06-20 오전 7:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyInfo](
	[Id] [int] NOT NULL,
	[PropertyType] [int] NOT NULL CONSTRAINT [DF_PropertyInfo_PropertyType]  DEFAULT ((0)),
	[Price] [int] NOT NULL,
	[Bond] [int] NULL,
	[AuctionDate] [datetime2](7) NULL,
	[AvailableDate] [datetime2](7) NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](4000) NULL,
	[AgentId] [int] NOT NULL,
 CONSTRAINT [PK_PropertyInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Enquiry]  WITH CHECK ADD  CONSTRAINT [FK_Enquiry_PropertyInfo] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[PropertyInfo] ([Id])
GO
ALTER TABLE [dbo].[Enquiry] CHECK CONSTRAINT [FK_Enquiry_PropertyInfo]
GO
ALTER TABLE [dbo].[Photo]  WITH CHECK ADD  CONSTRAINT [FK_Photo_PropertyInfo] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[PropertyInfo] ([Id])
GO
ALTER TABLE [dbo].[Photo] CHECK CONSTRAINT [FK_Photo_PropertyInfo]
GO
ALTER TABLE [dbo].[PropertyInfo]  WITH CHECK ADD  CONSTRAINT [FK_PropertyInfo_Agent] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agent] ([Id])
GO
ALTER TABLE [dbo].[PropertyInfo] CHECK CONSTRAINT [FK_PropertyInfo_Agent]
GO
