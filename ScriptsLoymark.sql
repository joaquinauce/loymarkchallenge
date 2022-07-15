USE [master]
GO
/****** Object:  Database [LoyMarkChallenge]    Script Date: 7/15/2022 1:50:26 PM ******/
CREATE DATABASE [LoyMarkChallenge] ON  PRIMARY 
( NAME = N'LoyMarkChallenge', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\LoyMarkChallenge.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LoyMarkChallenge_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\LoyMarkChallenge_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LoyMarkChallenge] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LoyMarkChallenge].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LoyMarkChallenge] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET ARITHABORT OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LoyMarkChallenge] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LoyMarkChallenge] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LoyMarkChallenge] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LoyMarkChallenge] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LoyMarkChallenge] SET  MULTI_USER 
GO
ALTER DATABASE [LoyMarkChallenge] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LoyMarkChallenge] SET DB_CHAINING OFF 
GO
USE [LoyMarkChallenge]
GO
/****** Object:  Table [dbo].[actividades]    Script Date: 7/15/2022 1:50:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actividades](
	[id_actividad] [int] IDENTITY(1,1) NOT NULL,
	[create_date] [date] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[actividad] [nvarchar](400) NOT NULL,
 CONSTRAINT [PK_actividades] PRIMARY KEY CLUSTERED 
(
	[id_actividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paises]    Script Date: 7/15/2022 1:50:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paises](
	[id_pais] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[codigo_internacional] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_paises] PRIMARY KEY CLUSTERED 
(
	[id_pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 7/15/2022 1:50:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[apellido] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[telefono] [nvarchar](20) NULL,
	[id_pais] [int] NOT NULL,
	[pais] [nvarchar](50) NOT NULL,
	[recibe_informacion] [bit] NOT NULL,
	[fecha_baja] [datetime] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[actividades]  WITH CHECK ADD  CONSTRAINT [FK_actividades_Usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[actividades] CHECK CONSTRAINT [FK_actividades_Usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_paises] FOREIGN KEY([id_pais])
REFERENCES [dbo].[paises] ([id_pais])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_paises]
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarUsuario]    Script Date: 7/15/2022 1:50:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_EliminarUsuario]
@IdUsuario int
AS
UPDATE Usuarios SET fecha_baja = GETDATE() WHERE id_usuario = @IdUsuario
GO
/****** Object:  StoredProcedure [dbo].[sp_ExisteEmail]    Script Date: 7/15/2022 1:50:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ExisteEmail]
@email nvarchar(100) 
AS
SELECT * FROM Usuarios WHERE UPPER(email) = UPPER(@email)
GO
/****** Object:  StoredProcedure [dbo].[sp_ExisteEmailExistente]    Script Date: 7/15/2022 1:50:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROC [dbo].[sp_ExisteEmailExistente]  
@id_usuario int,  
@email nvarchar(150) 
AS  
SELECT * FROM Usuarios WHERE UPPER(Email) = UPPER(@email) and id_usuario <> @id_usuario  
GO
/****** Object:  StoredProcedure [dbo].[sp_GetActividades]    Script Date: 7/15/2022 1:50:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetActividades]
AS
SELECT ac.id_actividad, ac.create_date, us.apellido + ', ' + us.nombre AS nombre_completo, ac.actividad FROM actividades ac JOIN Usuarios us ON us.id_usuario = ac.id_usuario
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveActividad]    Script Date: 7/15/2022 1:50:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SaveActividad]
@create_date DATETIME,
@id_usuario INT,
@actividad NVARCHAR (400)

AS 
INSERT INTO [dbo].[actividades]
           ([create_date]
           ,[id_usuario]
           ,[actividad])
     VALUES
           (@create_date
           ,@id_usuario
           ,@actividad)
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveUsuario]    Script Date: 7/15/2022 1:50:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SaveUsuario]
@nombre nvarchar(100),
@apellido nvarchar(100),
@email nvarchar(100),
@fecha_nacimiento date,
@telefono nvarchar(20),
@id_pais int,
@pais nvarchar(50),
@recibe_informacion bit

AS
INSERT INTO [dbo].[Usuarios]
           ([nombre]
           ,[apellido]
           ,[email]
           ,[fecha_nacimiento]
           ,[telefono]
           ,[id_pais]
           ,[pais]
           ,[recibe_informacion])
     VALUES
           (@nombre
           ,@apellido
           ,@email
           ,@fecha_nacimiento
           ,@telefono
           ,@id_pais
           ,@pais
           ,@recibe_informacion)
BEGIN   
 SELECT @@IDENTITY as 'id_usuario'  
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectAllPaises]    Script Date: 7/15/2022 1:50:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SelectAllPaises]
AS
SELECT * FROM paises
GO
/****** Object:  StoredProcedure [dbo].[sp_selectAllUsuarios]    Script Date: 7/15/2022 1:50:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_selectAllUsuarios]
AS
SELECT us.id_usuario, us.apellido, us.nombre, us.email, us.fecha_nacimiento, us.telefono, pa.id_pais, pa.nombre AS nombre_pais, pa.codigo_internacional, us.recibe_informacion 
FROM Usuarios us JOIN paises pa ON pa.id_pais = us.id_pais
WHERE us.fecha_baja IS NULL
GO
/****** Object:  StoredProcedure [dbo].[sp_selectAllUsuariosEliminados]    Script Date: 7/15/2022 1:50:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_selectAllUsuariosEliminados]
AS
SELECT us.id_usuario, us.apellido, us.nombre, us.email, us.fecha_nacimiento, us.telefono, pa.id_pais, pa.nombre AS nombre_pais, pa.codigo_internacional, us.recibe_informacion   
FROM Usuarios us JOIN paises pa ON pa.id_pais = us.id_pais  
WHERE us.fecha_baja IS NOT NULL  
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectPaisByID]    Script Date: 7/15/2022 1:50:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SelectPaisByID]
@id_pais INT
AS
SELECT * FROM paises WHERE id_pais = @id_pais
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectUsuarioById]    Script Date: 7/15/2022 1:50:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SelectUsuarioById]
@id_usuario int

AS

SELECT [id_usuario]
      ,[nombre]
      ,[apellido]
      ,[email]
      ,[fecha_nacimiento]
      ,[telefono]
      ,[id_pais]
      ,[pais]
      ,[recibe_informacion]
  FROM [dbo].[Usuarios] 
  WHERE id_usuario = @id_usuario
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateUsuario]    Script Date: 7/15/2022 1:50:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UpdateUsuario]
@id_usuario int,
@nombre nvarchar(100),
@apellido nvarchar(100),
@email nvarchar(100),
@fecha_nacimiento date,
@telefono nvarchar(20),
@id_pais int,
@pais nvarchar(50),
@recibe_informacion bit

AS

UPDATE [dbo].[Usuarios]
   SET [nombre] = @nombre
      ,[apellido] = @apellido
      ,[email] = @email
      ,[fecha_nacimiento] = @fecha_nacimiento
      ,[telefono] = @telefono
      ,[id_pais] = @id_pais
      ,[pais] = @pais
      ,[recibe_informacion] = @recibe_informacion
 WHERE id_usuario = @id_usuario
GO
USE [master]
GO
ALTER DATABASE [LoyMarkChallenge] SET  READ_WRITE 
GO
