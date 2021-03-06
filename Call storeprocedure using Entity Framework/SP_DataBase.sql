USE [TestDB]
GO
/****** Object:  StoredProcedure [dbo].[GetDataByIdName]    Script Date: 3/22/2019 5:05:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- ============================================= GetDataByIdName 0,null
CREATE PROCEDURE [dbo].[GetDataByIdName]
	@id int,
	@name nvarchar(max)=null
AS
BEGIN
	SELECT P.*,C.catName from [dbo].[Post] P
	JOIN [dbo].[Category] C ON P.catId=C.catId
	--where p.PostId=case when @id<>0 then @id else p.PostId end
	--and p.PostName=case when @name is not null then @name else p.PostName end
END

GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/22/2019 5:05:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[catId] [int] IDENTITY(1,1) NOT NULL,
	[catName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[catId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Post]    Script Date: 3/22/2019 5:05:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Post](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[PostWeight] [int] NULL,
	[PostName] [varchar](max) NULL,
	[catId] [int] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

GO
INSERT [dbo].[Category] ([catId], [catName]) VALUES (1, N'Plan')
GO
INSERT [dbo].[Category] ([catId], [catName]) VALUES (2, N'Development')
GO
INSERT [dbo].[Category] ([catId], [catName]) VALUES (3, N'End')
GO
INSERT [dbo].[Category] ([catId], [catName]) VALUES (4, N'Processing')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

GO
INSERT [dbo].[Post] ([PostId], [PostWeight], [PostName], [catId]) VALUES (4, 1, N'reza', 1)
GO
INSERT [dbo].[Post] ([PostId], [PostWeight], [PostName], [catId]) VALUES (5, 5, N'rezsa', 2)
GO
INSERT [dbo].[Post] ([PostId], [PostWeight], [PostName], [catId]) VALUES (6, 1, N'hello', 3)
GO
INSERT [dbo].[Post] ([PostId], [PostWeight], [PostName], [catId]) VALUES (7, 1, N'hello2', 4)
GO
INSERT [dbo].[Post] ([PostId], [PostWeight], [PostName], [catId]) VALUES (8, 3, N'myTask', 2)
GO
INSERT [dbo].[Post] ([PostId], [PostWeight], [PostName], [catId]) VALUES (9, 8, N'yellow', 2)
GO
INSERT [dbo].[Post] ([PostId], [PostWeight], [PostName], [catId]) VALUES (10, 2, N'red', 3)
GO
INSERT [dbo].[Post] ([PostId], [PostWeight], [PostName], [catId]) VALUES (11, 2, N'<p>gfhh</p>', 1)
GO
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Category] FOREIGN KEY([catId])
REFERENCES [dbo].[Category] ([catId])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Category]
GO
