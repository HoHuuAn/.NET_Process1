USE [company]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/20/2023 9:58:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetails]    Script Date: 10/20/2023 9:58:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quatity] [int] NOT NULL,
	[CartId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_CartDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 10/20/2023 9:58:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/20/2023 9:58:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 10/20/2023 9:58:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Phone] [nvarchar](450) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 10/20/2023 9:58:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
	[ProductsId] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/20/2023 9:58:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[TotalAmount] [money] NOT NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/20/2023 9:58:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [money] NOT NULL,
	[StockQuantity] [bigint] NOT NULL,
	[Slug] [nvarchar](max) NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/20/2023 9:58:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/20/2023 9:58:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[DateOfBirth] [datetime2](7) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Electronics')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Clothing')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Books')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Kitchen Appliances')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'Sports Equipment')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [Name], [Email], [Phone], [Address]) VALUES (1, N'John Doe', N'john.doe@example.com', N'0908490809', N'123 Main St, City')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Phone], [Address]) VALUES (2, N'Jane Smith', N'jane.smith@example.com', N'9876543210', N'456 Elm St, Town')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Phone], [Address]) VALUES (3, N'Alice Johnson', N'alice.johnson@example.com', N'5551234567', N'789 Oak St, Village')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Phone], [Address]) VALUES (4, N'Bob Brown', N'bob.brown@example.com', N'1112223333', N'101 Pine St, Hamlet')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Phone], [Address]) VALUES (5, N'Eva White', N'eva.white@example.com', N'4445556666', N'202 Maple St, Suburb')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Phone], [Address]) VALUES (6, N'Do Minh Quan', N'521H0290@gmail.com', N'0938365034', N'New York City')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Phone], [Address]) VALUES (8, N'Que Nhu', N'nhu@gmail.com', N'0123456781', N'51 avenue new york')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Phone], [Address]) VALUES (9, N'Do Quan', N'521H02190@gmail.com', N'0938365035', N'21 Pham the hien Q8 Tphcm')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Phone], [Address]) VALUES (10, N'Do Minh Quan ', N'521H0290@gmail.com', N'0938365036', N'21 Pham The Hien Quan 8 TpHCM')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [Quantity], [TotalPrice], [ProductsId]) VALUES (1, 1, 2, CAST(30.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [Quantity], [TotalPrice], [ProductsId]) VALUES (2, 1, 3, CAST(45.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [Quantity], [TotalPrice], [ProductsId]) VALUES (3, 3, 1, CAST(22.25 AS Decimal(18, 2)), 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [Quantity], [TotalPrice], [ProductsId]) VALUES (4, 4, 4, CAST(67.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [Quantity], [TotalPrice], [ProductsId]) VALUES (5, 5, 2, CAST(36.18 AS Decimal(18, 2)), 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [Quantity], [TotalPrice], [ProductsId]) VALUES (6, 6, 1, CAST(12.99 AS Decimal(18, 2)), 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [Quantity], [TotalPrice], [ProductsId]) VALUES (7, 7, 3, CAST(27.00 AS Decimal(18, 2)), 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [Quantity], [TotalPrice], [ProductsId]) VALUES (8, 8, 2, CAST(31.75 AS Decimal(18, 2)), 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [Quantity], [TotalPrice], [ProductsId]) VALUES (9, 9, 1, CAST(15.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [Quantity], [TotalPrice], [ProductsId]) VALUES (10, 10, 2, CAST(24.90 AS Decimal(18, 2)), 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [Quantity], [TotalPrice], [ProductsId]) VALUES (17, 11, 2, CAST(25.00 AS Decimal(18, 2)), 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [Quantity], [TotalPrice], [ProductsId]) VALUES (22, 11, 2, CAST(1600.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [Quantity], [TotalPrice], [ProductsId]) VALUES (23, 11, 2, CAST(30.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [Quantity], [TotalPrice], [ProductsId]) VALUES (24, 11, 2, CAST(1600.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [Quantity], [TotalPrice], [ProductsId]) VALUES (25, 11, 3, CAST(60.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [Quantity], [TotalPrice], [ProductsId]) VALUES (26, 11, 3, CAST(60.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [Quantity], [TotalPrice], [ProductsId]) VALUES (27, 11, 1, CAST(800.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [Quantity], [TotalPrice], [ProductsId]) VALUES (28, 11, 2, CAST(100.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [Quantity], [TotalPrice], [ProductsId]) VALUES (29, 11, 1, CAST(15.00 AS Decimal(18, 2)), 3)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [OrderDate], [TotalAmount], [CustomerId]) VALUES (1, CAST(N'2023-10-19T08:00:00.0000000' AS DateTime2), 100.0000, 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [TotalAmount], [CustomerId]) VALUES (2, CAST(N'2023-10-19T08:15:00.0000000' AS DateTime2), 75.5000, 2)
INSERT [dbo].[Orders] ([Id], [OrderDate], [TotalAmount], [CustomerId]) VALUES (3, CAST(N'2023-10-19T08:30:00.0000000' AS DateTime2), 220.2500, 3)
INSERT [dbo].[Orders] ([Id], [OrderDate], [TotalAmount], [CustomerId]) VALUES (4, CAST(N'2023-10-19T08:45:00.0000000' AS DateTime2), 50.7500, 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [TotalAmount], [CustomerId]) VALUES (5, CAST(N'2023-10-19T09:00:00.0000000' AS DateTime2), 180.9000, 4)
INSERT [dbo].[Orders] ([Id], [OrderDate], [TotalAmount], [CustomerId]) VALUES (6, CAST(N'2023-10-19T09:15:00.0000000' AS DateTime2), 125.6000, 2)
INSERT [dbo].[Orders] ([Id], [OrderDate], [TotalAmount], [CustomerId]) VALUES (7, CAST(N'2023-10-19T09:30:00.0000000' AS DateTime2), 90.0000, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [TotalAmount], [CustomerId]) VALUES (8, CAST(N'2023-10-19T09:45:00.0000000' AS DateTime2), 42.2500, 3)
INSERT [dbo].[Orders] ([Id], [OrderDate], [TotalAmount], [CustomerId]) VALUES (9, CAST(N'2023-10-19T10:00:00.0000000' AS DateTime2), 150.0000, 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [TotalAmount], [CustomerId]) VALUES (10, CAST(N'2023-10-19T10:15:00.0000000' AS DateTime2), 70.3500, 4)
INSERT [dbo].[Orders] ([Id], [OrderDate], [TotalAmount], [CustomerId]) VALUES (11, CAST(N'2023-10-20T00:47:09.5780210' AS DateTime2), 1600.0000, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [StockQuantity], [Slug], [CategoryId]) VALUES (1, N'Laptop', N'High-performance laptop', 800.0000, 50, N'laptop', 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [StockQuantity], [Slug], [CategoryId]) VALUES (2, N'T-Shirt', N'Cotton t-shirt', 20.0000, 100, N't-shirt', 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [StockQuantity], [Slug], [CategoryId]) VALUES (3, N'Book', N'Bestseller book', 15.0000, 75, N'book', 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [StockQuantity], [Slug], [CategoryId]) VALUES (4, N'Coffee Maker', N'Coffee maker machine', 50.0000, 30, N'coffee-maker', 4)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [StockQuantity], [Slug], [CategoryId]) VALUES (5, N'Running Shoes', N'Running shoes for athletes', 80.0000, 60, N'running-shoes', 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [StockQuantity], [Slug], [CategoryId]) VALUES (6, N'Desktop Computer', N'Powerful desktop PC', 1000.0000, 40, N'desktop', 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [StockQuantity], [Slug], [CategoryId]) VALUES (7, N'Jeans', N'Denim jeans', 30.0000, 90, N'jeans', 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [StockQuantity], [Slug], [CategoryId]) VALUES (8, N'Cookware Set', N'Complete cookware set', 60.0000, 25, N'cookware-set', 4)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [StockQuantity], [Slug], [CategoryId]) VALUES (9, N'Soccer Ball', N'Professional soccer ball', 15.0000, 50, N'soccer-ball', 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [StockQuantity], [Slug], [CategoryId]) VALUES (10, N'Tablet', N'Tablet with touchscreen', 300.0000, 35, N'tablet', 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [StockQuantity], [Slug], [CategoryId]) VALUES (11, N'Asus gaming', N'For gaming', 120000.0000, 18, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [StockQuantity], [Slug], [CategoryId]) VALUES (12, N'Laptop Asus Gaming', N'For Gaming', 24000000.0000, 8, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [StockQuantity], [Slug], [CategoryId]) VALUES (13, N'IPhone 15', N'Good', 3400000.0000, 10, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [StockQuantity], [Slug], [CategoryId]) VALUES (14, N'New Product', N'durable', 15000.0000, 5, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [StockQuantity], [Slug], [CategoryId]) VALUES (15, N'SamSung Galaxy', N'Good', 15000000.0000, 2, NULL, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'Administrator')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'Manager')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (3, N'Employee')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
INSERT [dbo].[Users] ([Id], [Name], [DateOfBirth], [PhoneNumber], [Email], [RoleId]) VALUES (N'1', N'John Doe', CAST(N'1990-01-01T00:00:00.0000000' AS DateTime2), N'1234567890', N'john.doe@example.com', 1)
INSERT [dbo].[Users] ([Id], [Name], [DateOfBirth], [PhoneNumber], [Email], [RoleId]) VALUES (N'2', N'Jane Smith', CAST(N'1995-05-10T00:00:00.0000000' AS DateTime2), N'9876543210', N'jane.smith@example.com', 2)
INSERT [dbo].[Users] ([Id], [Name], [DateOfBirth], [PhoneNumber], [Email], [RoleId]) VALUES (N'3', N'Michael Johnson', CAST(N'1985-08-15T00:00:00.0000000' AS DateTime2), N'5555555555', N'michael.johnson@example.com', 1)
INSERT [dbo].[Users] ([Id], [Name], [DateOfBirth], [PhoneNumber], [Email], [RoleId]) VALUES (N'4', N'Emily Davis', CAST(N'2000-12-25T00:00:00.0000000' AS DateTime2), N'1111111111', N'emily.davis@example.com', 3)
INSERT [dbo].[Users] ([Id], [Name], [DateOfBirth], [PhoneNumber], [Email], [RoleId]) VALUES (N'5', N'Robert Wilson', CAST(N'1978-03-20T00:00:00.0000000' AS DateTime2), N'9999999999', N'robert.wilson@example.com', 2)
INSERT [dbo].[Users] ([Id], [Name], [DateOfBirth], [PhoneNumber], [Email], [RoleId]) VALUES (N'6', N'Tester', CAST(N'1990-01-01T00:00:00.0000000' AS DateTime2), N'1', N'test', 1)
INSERT [dbo].[Users] ([Id], [Name], [DateOfBirth], [PhoneNumber], [Email], [RoleId]) VALUES (N'7', N'Huu An', CAST(N'1990-01-01T00:00:00.0000000' AS DateTime2), N'0938365034', N'admin', 1)
GO
ALTER TABLE [dbo].[CartDetails] ADD  DEFAULT ((0)) FOR [ProductId]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  DEFAULT ((0)) FOR [ProductsId]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bigint],(0))) FOR [StockQuantity]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [CategoryId]
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD  CONSTRAINT [FK_CartDetails_Carts_CartId] FOREIGN KEY([CartId])
REFERENCES [dbo].[Carts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartDetails] CHECK CONSTRAINT [FK_CartDetails_Carts_CartId]
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD  CONSTRAINT [FK_CartDetails_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartDetails] CHECK CONSTRAINT [FK_CartDetails_Products_ProductId]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Customers_CustomerId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products_ProductsId] FOREIGN KEY([ProductsId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products_ProductsId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers_CustomerId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles_RoleId]
GO
