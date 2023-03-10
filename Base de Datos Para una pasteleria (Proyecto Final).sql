USE [master]
GO
/****** Base de datos para una pasteleria hecha por: ******/
/******Wanda raquel  Feliz Martinez	21-MIIN-1-061 ******/
/****** Seccion: 0541 ******/
CREATE DATABASE [Pasteleria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pasteleria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Pasteleria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pasteleria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Pasteleria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Pasteleria] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pasteleria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pasteleria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pasteleria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pasteleria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pasteleria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pasteleria] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pasteleria] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Pasteleria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pasteleria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pasteleria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pasteleria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pasteleria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pasteleria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pasteleria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pasteleria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pasteleria] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Pasteleria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pasteleria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pasteleria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pasteleria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pasteleria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pasteleria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pasteleria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pasteleria] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Pasteleria] SET  MULTI_USER 
GO
ALTER DATABASE [Pasteleria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pasteleria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pasteleria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pasteleria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pasteleria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Pasteleria] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Pasteleria] SET QUERY_STORE = OFF
GO
USE [Pasteleria]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 22/4/2022 10:03:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[Categoria_Id] [int] IDENTITY(200,2) NOT NULL,
	[Nombre] [varchar](20) NULL,
	[Descripcion] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[Categoria_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 22/4/2022 10:03:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Cliente_Id] [int] IDENTITY(400,2) NOT NULL,
	[Nombre] [varchar](20) NULL,
	[Apellido] [varchar](20) NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [decimal](10, 0) NULL,
	[Email] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cliente_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle]    Script Date: 22/4/2022 10:03:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle](
	[Detalle_Id] [int] IDENTITY(500,2) NOT NULL,
	[Factura_Id] [int] NULL,
	[Producto_Id] [int] NULL,
	[Cantidad] [decimal](11, 0) NULL,
	[Monto_a_Pagar] [decimal](11, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Detalle_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 22/4/2022 10:03:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[Factura_Id] [int] IDENTITY(4856,2) NOT NULL,
	[Cliente_Id] [int] NULL,
	[Fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Factura_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 22/4/2022 10:03:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Producto_Id] [int] IDENTITY(300,2) NOT NULL,
	[Nombre] [varchar](20) NULL,
	[Precio] [decimal](10, 0) NULL,
	[Categoria_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Producto_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([Categoria_Id], [Nombre], [Descripcion]) VALUES (200, N'Bizcocho', N'Chocolate, vainilla y fresa con suspiro L')
INSERT [dbo].[Categoria] ([Categoria_Id], [Nombre], [Descripcion]) VALUES (202, N'Donuts', N'Chocolate, chispitas y mermeladas')
INSERT [dbo].[Categoria] ([Categoria_Id], [Nombre], [Descripcion]) VALUES (204, N'Cup cake', N' Chocolate, fresa y vainilla')
INSERT [dbo].[Categoria] ([Categoria_Id], [Nombre], [Descripcion]) VALUES (206, N'Brownies', N'Chocolate')
INSERT [dbo].[Categoria] ([Categoria_Id], [Nombre], [Descripcion]) VALUES (208, N'Pan', N'hechos de la mejor harina y con una buena ')
INSERT [dbo].[Categoria] ([Categoria_Id], [Nombre], [Descripcion]) VALUES (210, N'Turrones', N'Duros, pero te dejaran un sabor suave y delicioso en tu boca, hechos de maní y nueces')
INSERT [dbo].[Categoria] ([Categoria_Id], [Nombre], [Descripcion]) VALUES (212, N'Muffins', N'Chocolate con relleno de vainilla')
INSERT [dbo].[Categoria] ([Categoria_Id], [Nombre], [Descripcion]) VALUES (214, N'Flan', N'Un delicioso plato con una textura cremosa que te será imposible resistirte')
INSERT [dbo].[Categoria] ([Categoria_Id], [Nombre], [Descripcion]) VALUES (216, N'Galletas', N'de chispas de Chocolate')
INSERT [dbo].[Categoria] ([Categoria_Id], [Nombre], [Descripcion]) VALUES (218, N'Dulce ', N'Coco, guayaba, naranja')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([Cliente_Id], [Nombre], [Apellido], [Direccion], [Telefono], [Email]) VALUES (400, N'Julio Cesar ', N'Medina Gonzales', N'A.V Independencia KM 7 Calle 3ra #158', CAST(8099757648 AS Decimal(10, 0)), N'julioMedina85@gmail.com')
INSERT [dbo].[Clientes] ([Cliente_Id], [Nombre], [Apellido], [Direccion], [Telefono], [Email]) VALUES (402, N' José Enrique', N'Erasme Mancebo', N'Residencial Jardines del Sur Calle 4ta #18', CAST(8299875643 AS Decimal(10, 0)), N'Erasmejose@gmail.com')
INSERT [dbo].[Clientes] ([Cliente_Id], [Nombre], [Apellido], [Direccion], [Telefono], [Email]) VALUES (404, N'José Armando', N'Almanzar Castillo', N'A.V Independencia KM8 calle 1ra #45', CAST(8094398765 AS Decimal(10, 0)), N'JoseA.castillo18@gmail.com')
INSERT [dbo].[Clientes] ([Cliente_Id], [Nombre], [Apellido], [Direccion], [Telefono], [Email]) VALUES (406, N'Yúnior Miguel ', N'Medina ', N' A.V Independencia KM 7 Calle 1ra #34', CAST(8294567658 AS Decimal(10, 0)), N'julioMedina85@gmail.com')
INSERT [dbo].[Clientes] ([Cliente_Id], [Nombre], [Apellido], [Direccion], [Telefono], [Email]) VALUES (408, N'Mario Manuel', N'Guerrero Rojas', N'Los Minas Calle 2da #1', CAST(8098573124 AS Decimal(10, 0)), N'Marioguerrero25@gmail.com')
INSERT [dbo].[Clientes] ([Cliente_Id], [Nombre], [Apellido], [Direccion], [Telefono], [Email]) VALUES (410, N'Robert ', N'Gonzales Rivas', N'Residencial El Millón Calle 5ta #66', CAST(8097560233 AS Decimal(10, 0)), N'RobertGonzales@gmail.com')
INSERT [dbo].[Clientes] ([Cliente_Id], [Nombre], [Apellido], [Direccion], [Telefono], [Email]) VALUES (412, N'Manuela Cecilia ', N' Medina ', N'A.V Independencia KM 7 Calle 2ra #67', CAST(8091235684 AS Decimal(10, 0)), N'manumedina54@gmail.com')
INSERT [dbo].[Clientes] ([Cliente_Id], [Nombre], [Apellido], [Direccion], [Telefono], [Email]) VALUES (414, N'Laura Rosa', N'Mendosa Rojas', N'Residencial Jardines del Sur Calle 6ta #5', CAST(8099757648 AS Decimal(10, 0)), N'lauritaRosa01@gmail.com')
INSERT [dbo].[Clientes] ([Cliente_Id], [Nombre], [Apellido], [Direccion], [Telefono], [Email]) VALUES (416, N'Julia  ', N'Méndez Almanzar', N'A.V Independencia KM 7 Calle 3ra #5', CAST(8295460022 AS Decimal(10, 0)), N'JuliaMendez8@gmail.com')
INSERT [dbo].[Clientes] ([Cliente_Id], [Nombre], [Apellido], [Direccion], [Telefono], [Email]) VALUES (418, N'Miguel Alfredo', N'Zoto Peña', N'Residencial Jardines del Sur Calle 1ra #20', CAST(8098683993 AS Decimal(10, 0)), N'MiguelA.zoto@gmail.com')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Detalle] ON 

INSERT [dbo].[Detalle] ([Detalle_Id], [Factura_Id], [Producto_Id], [Cantidad], [Monto_a_Pagar]) VALUES (500, 4856, 302, CAST(125 AS Decimal(11, 0)), CAST(7500 AS Decimal(11, 0)))
INSERT [dbo].[Detalle] ([Detalle_Id], [Factura_Id], [Producto_Id], [Cantidad], [Monto_a_Pagar]) VALUES (502, 4858, 310, CAST(75 AS Decimal(11, 0)), CAST(525 AS Decimal(11, 0)))
INSERT [dbo].[Detalle] ([Detalle_Id], [Factura_Id], [Producto_Id], [Cantidad], [Monto_a_Pagar]) VALUES (504, 4860, 306, CAST(99 AS Decimal(11, 0)), CAST(4950 AS Decimal(11, 0)))
INSERT [dbo].[Detalle] ([Detalle_Id], [Factura_Id], [Producto_Id], [Cantidad], [Monto_a_Pagar]) VALUES (506, 4862, 300, CAST(525 AS Decimal(11, 0)), CAST(63000 AS Decimal(11, 0)))
INSERT [dbo].[Detalle] ([Detalle_Id], [Factura_Id], [Producto_Id], [Cantidad], [Monto_a_Pagar]) VALUES (508, 4864, 304, CAST(30 AS Decimal(11, 0)), CAST(750 AS Decimal(11, 0)))
INSERT [dbo].[Detalle] ([Detalle_Id], [Factura_Id], [Producto_Id], [Cantidad], [Monto_a_Pagar]) VALUES (510, 4866, 308, CAST(80 AS Decimal(11, 0)), CAST(4800 AS Decimal(11, 0)))
INSERT [dbo].[Detalle] ([Detalle_Id], [Factura_Id], [Producto_Id], [Cantidad], [Monto_a_Pagar]) VALUES (512, 4868, 312, CAST(3000 AS Decimal(11, 0)), CAST(90000 AS Decimal(11, 0)))
INSERT [dbo].[Detalle] ([Detalle_Id], [Factura_Id], [Producto_Id], [Cantidad], [Monto_a_Pagar]) VALUES (514, 4870, 302, CAST(85 AS Decimal(11, 0)), CAST(5100 AS Decimal(11, 0)))
INSERT [dbo].[Detalle] ([Detalle_Id], [Factura_Id], [Producto_Id], [Cantidad], [Monto_a_Pagar]) VALUES (516, 4872, 314, CAST(300 AS Decimal(11, 0)), CAST(30000 AS Decimal(11, 0)))
INSERT [dbo].[Detalle] ([Detalle_Id], [Factura_Id], [Producto_Id], [Cantidad], [Monto_a_Pagar]) VALUES (518, 4874, 316, CAST(525 AS Decimal(11, 0)), CAST(21000 AS Decimal(11, 0)))
SET IDENTITY_INSERT [dbo].[Detalle] OFF
GO
SET IDENTITY_INSERT [dbo].[Facturas] ON 

INSERT [dbo].[Facturas] ([Factura_Id], [Cliente_Id], [Fecha]) VALUES (4856, 400, CAST(N'2022-01-14' AS Date))
INSERT [dbo].[Facturas] ([Factura_Id], [Cliente_Id], [Fecha]) VALUES (4858, 402, CAST(N'2022-01-30' AS Date))
INSERT [dbo].[Facturas] ([Factura_Id], [Cliente_Id], [Fecha]) VALUES (4860, 404, CAST(N'2022-02-02' AS Date))
INSERT [dbo].[Facturas] ([Factura_Id], [Cliente_Id], [Fecha]) VALUES (4862, 406, CAST(N'2022-02-15' AS Date))
INSERT [dbo].[Facturas] ([Factura_Id], [Cliente_Id], [Fecha]) VALUES (4864, 408, CAST(N'2022-02-24' AS Date))
INSERT [dbo].[Facturas] ([Factura_Id], [Cliente_Id], [Fecha]) VALUES (4866, 410, CAST(N'2022-03-12' AS Date))
INSERT [dbo].[Facturas] ([Factura_Id], [Cliente_Id], [Fecha]) VALUES (4868, 412, CAST(N'2022-03-25' AS Date))
INSERT [dbo].[Facturas] ([Factura_Id], [Cliente_Id], [Fecha]) VALUES (4870, 414, CAST(N'2022-03-30' AS Date))
INSERT [dbo].[Facturas] ([Factura_Id], [Cliente_Id], [Fecha]) VALUES (4872, 416, CAST(N'2022-04-06' AS Date))
INSERT [dbo].[Facturas] ([Factura_Id], [Cliente_Id], [Fecha]) VALUES (4874, 418, CAST(N'2022-04-11' AS Date))
SET IDENTITY_INSERT [dbo].[Facturas] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([Producto_Id], [Nombre], [Precio], [Categoria_Id]) VALUES (300, N'Bizcochos esponjosos', CAST(120 AS Decimal(10, 0)), 200)
INSERT [dbo].[Productos] ([Producto_Id], [Nombre], [Precio], [Categoria_Id]) VALUES (302, N'Dunking Donas', CAST(60 AS Decimal(10, 0)), 202)
INSERT [dbo].[Productos] ([Producto_Id], [Nombre], [Precio], [Categoria_Id]) VALUES (304, N'Cake Cuper', CAST(25 AS Decimal(10, 0)), 204)
INSERT [dbo].[Productos] ([Producto_Id], [Nombre], [Precio], [Categoria_Id]) VALUES (306, N'Churro chanfle', CAST(50 AS Decimal(10, 0)), 206)
INSERT [dbo].[Productos] ([Producto_Id], [Nombre], [Precio], [Categoria_Id]) VALUES (308, N'Brownies', CAST(60 AS Decimal(10, 0)), 208)
INSERT [dbo].[Productos] ([Producto_Id], [Nombre], [Precio], [Categoria_Id]) VALUES (310, N'Pan', CAST(7 AS Decimal(10, 0)), 210)
INSERT [dbo].[Productos] ([Producto_Id], [Nombre], [Precio], [Categoria_Id]) VALUES (312, N'Muf Muf', CAST(30 AS Decimal(10, 0)), 212)
INSERT [dbo].[Productos] ([Producto_Id], [Nombre], [Precio], [Categoria_Id]) VALUES (314, N'Flan Don Pedro', CAST(100 AS Decimal(10, 0)), 214)
INSERT [dbo].[Productos] ([Producto_Id], [Nombre], [Precio], [Categoria_Id]) VALUES (316, N'Galletas El Sabio', CAST(40 AS Decimal(10, 0)), 216)
INSERT [dbo].[Productos] ([Producto_Id], [Nombre], [Precio], [Categoria_Id]) VALUES (318, N'Dulcitos lara', CAST(64 AS Decimal(10, 0)), 218)
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
ALTER TABLE [dbo].[Detalle]  WITH CHECK ADD FOREIGN KEY([Factura_Id])
REFERENCES [dbo].[Facturas] ([Factura_Id])
GO
ALTER TABLE [dbo].[Detalle]  WITH CHECK ADD FOREIGN KEY([Producto_Id])
REFERENCES [dbo].[Productos] ([Producto_Id])
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD FOREIGN KEY([Cliente_Id])
REFERENCES [dbo].[Clientes] ([Cliente_Id])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([Categoria_Id])
REFERENCES [dbo].[Categoria] ([Categoria_Id])
GO
USE [master]
GO
ALTER DATABASE [Pasteleria] SET  READ_WRITE 
GO
