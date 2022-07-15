CREATE DATABASE [LoyMarkChallenge]
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
/****** Object:  Table [dbo].[actividades]    Script Date: 7/15/2022 2:24:06 PM ******/
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
/****** Object:  Table [dbo].[paises]    Script Date: 7/15/2022 2:24:06 PM ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 7/15/2022 2:24:06 PM ******/
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
SET IDENTITY_INSERT [dbo].[paises] ON 
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (1, N'Afganistán', N'AFG')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (2, N'Albania', N'ALB')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (3, N'Alemania', N'DEU')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (4, N'Andorra', N'AND')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (5, N'Angola', N'AGO')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (6, N'Anguila', N'AIA')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (7, N'Antártida', N'ATA')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (8, N'Antigua y Barbuda', N'ATG')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (9, N'Arabia Saudita', N'SAU')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (10, N'Argelia', N'DZA')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (11, N'Argentina', N'ARG')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (12, N'Armenia', N'ARM')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (13, N'Aruba', N'ABW')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (14, N'Australia', N'AUS')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (15, N'Austria', N'AUT')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (16, N'Azerbaiyán', N'AZE')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (17, N'Bahamas', N'BHS')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (18, N'Bahrein', N'BHR')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (19, N'Bailía de Guernsey', N'GGY')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (20, N'Bangladesh', N'BGD')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (21, N'Barbados', N'BRB')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (22, N'Belarús', N'BLR')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (23, N'Bélgica', N'BEL')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (24, N'Belice', N'BLZ')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (25, N'Benín', N'BEN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (26, N'Bermudas', N'BMU')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (27, N'Bolivia', N'BOL')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (28, N'Bonaire, San Eustaquio y Saba', N'BES')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (29, N'Bosnia y Hercegovina', N'BIH')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (30, N'Botsuana', N'BWA')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (31, N'Brasil', N'BRA')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (32, N'Brunéi', N'BRN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (33, N'Bulgaria', N'BGR')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (34, N'Burkina Faso', N'BFA')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (35, N'Burundi', N'BDI')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (36, N'Bután', N'BTN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (37, N'Cabo Verde', N'CPV')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (38, N'Cambodia', N'KHM')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (39, N'Camerún', N'CMR')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (40, N'Canadá', N'CAN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (41, N'Catar', N'QAT')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (42, N'Chad', N'TCD')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (43, N'Chequia', N'CZE')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (44, N'Chile', N'CHL')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (45, N'China', N'CHN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (46, N'Chipre', N'CYP')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (47, N'Ciudad del Vaticano', N'VAT')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (48, N'Colombia', N'COL')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (49, N'Comores', N'COM')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (50, N'Congo', N'COG')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (51, N'Corea del Norte', N'PRK')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (52, N'Corea del Sur', N'KOR')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (53, N'Costa de Marfil', N'CIV')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (54, N'Costa Rica', N'CRI')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (55, N'Croacia', N'HRV')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (56, N'Cuba', N'CUB')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (57, N'Curaçao', N'CUW')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (58, N'Dinamarca', N'DNK')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (59, N'Dominica', N'DMA')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (60, N'Ecuador', N'ECU')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (61, N'Egipto', N'EGY')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (62, N'El Salvador', N'SLV')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (63, N'Emiratos Árabes Unidos', N'ARE')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (64, N'Eritrea', N'ERI')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (65, N'Eslovaquia', N'SVK')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (66, N'Eslovenia', N'SVN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (67, N'España', N'ESP')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (68, N'Estados Federados de Micronesia', N'FSM')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (69, N'Estados Unidos', N'USA')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (70, N'Estonia', N'EST')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (71, N'Esuatini', N'SWZ')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (72, N'Etiopía', N'ETH')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (73, N'Fiji', N'FJI')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (74, N'Filipinas', N'PHL')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (75, N'Finlandia', N'FIN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (76, N'Francia', N'FRA')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (77, N'Gabón', N'GAB')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (78, N'Gambia', N'GMB')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (79, N'Georgia', N'GEO')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (80, N'Georgia del Sur y las Islas Sandwich del Sur', N'SGS')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (81, N'Ghana', N'GHA')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (82, N'Gibraltar', N'GIB')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (83, N'Granada', N'GRD')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (84, N'Grecia', N'GRC')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (85, N'Groenlandia', N'GRL')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (86, N'Guadalupe', N'GLP')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (87, N'Guam', N'GUM')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (88, N'Guatemala', N'GTM')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (89, N'Guayana', N'GUY')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (90, N'Guayana Francesa', N'GUF')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (91, N'Guinea', N'GIN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (92, N'Guinea Ecuatorial', N'GNQ')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (93, N'Guinea-Bissau', N'GNB')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (94, N'Haití', N'HTI')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (95, N'Honduras', N'HND')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (96, N'Hong Kong', N'HKG')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (97, N'Hungría', N'HUN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (98, N'India', N'IND')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (99, N'Indonesia', N'IDN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (100, N'Irán', N'IRN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (101, N'Iraq', N'IRQ')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (102, N'Irlanda', N'IRL')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (103, N'Isla Bouvet', N'BVT')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (104, N'Isla de Man', N'IMN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (105, N'Isla de Navidad', N'CXR')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (106, N'Isla de San Martín', N'MAF')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (107, N'Isla Mauricio', N'MUS')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (108, N'Isla Norfolk', N'NFK')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (109, N'Islandia', N'ISL')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (110, N'Islas Åland', N'ALA')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (111, N'Islas Caimán', N'CYM')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (112, N'Islas Cocos', N'CCK')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (113, N'Islas Cook', N'COK')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (114, N'Islas Feroe', N'FRO')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (115, N'Islas Heard y McDonald', N'HMD')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (116, N'Islas Malvinas', N'FLK')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (117, N'Islas Marianas del Norte', N'MNP')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (118, N'Islas Marshall', N'MHL')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (119, N'Islas Pitcairn', N'PCN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (120, N'Islas Salomón', N'SLB')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (121, N'Islas Turcas y Caicos', N'TCA')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (122, N'Islas Vírgenes (UK', N'VGB')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (123, N'Islas Vírgenes Americanas', N'VIR')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (124, N'Israel', N'ISR')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (125, N'Italia', N'ITA')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (126, N'Jamaica', N'JAM')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (127, N'Japón', N'JPN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (128, N'Jersey', N'JEY')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (129, N'Jordania', N'JOR')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (130, N'Kazajstán', N'KAZ')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (131, N'Kenia', N'KEN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (132, N'Kirguistán', N'KGZ')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (133, N'Kiribati', N'KIR')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (134, N'Kosovo', N'XKX')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (135, N'Kuwait', N'KWT')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (136, N'Laos', N'LAO')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (137, N'Lesotho', N'LSO')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (138, N'Letonia', N'LVA')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (139, N'Líbano', N'LBN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (140, N'Liberia', N'LBR')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (141, N'Libia', N'LBY')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (142, N'Liechtenstein', N'LIE')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (143, N'Lituania', N'LTU')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (144, N'Luxemburgo', N'LUX')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (145, N'Macao', N'MAC')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (146, N'Macedonia del Norte', N'MKD')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (147, N'Madagascar', N'MDG')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (148, N'Malasia', N'MYS')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (149, N'Malaui', N'MWI')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (150, N'Maldivas', N'MDV')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (151, N'Malí', N'MLI')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (152, N'Malta', N'MLT')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (153, N'Marruecos', N'MAR')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (154, N'Martinica', N'MTQ')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (155, N'Mauritania', N'MRT')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (156, N'Mayotte', N'MYT')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (157, N'México', N'MEX')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (158, N'Moldavia', N'MDA')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (159, N'Mongolia', N'MNG')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (160, N'Montenegro', N'MNE')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (161, N'Montserrat', N'MSR')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (162, N'Mozambique', N'MOZ')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (163, N'Myanmar', N'MMR')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (164, N'Namibia', N'NAM')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (165, N'Nauru', N'NRU')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (166, N'Nepal', N'NPL')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (167, N'Nicaragua', N'NIC')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (168, N'Níger', N'NER')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (169, N'Nigeria', N'NGA')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (170, N'Niue', N'NIU')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (171, N'Noruega', N'NOR')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (172, N'Nueva Caledonia', N'NCL')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (173, N'Nueva Zelandia', N'NZL')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (174, N'Omán', N'OMN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (175, N'Países Bajos', N'NLD')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (176, N'Pakistán', N'PAK')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (177, N'Palaos', N'PLW')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (178, N'Palestina', N'PSE')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (179, N'Panamá', N'PAN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (180, N'Papúa Nueva Guinea', N'PNG')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (181, N'Paraguay', N'PRY')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (182, N'Perú', N'PER')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (183, N'Polinesia Francesa', N'PYF')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (184, N'Polonia', N'POL')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (185, N'Portugal', N'PRT')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (186, N'Principado de Mónaco', N'MCO')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (187, N'Puerto Rico', N'PRI')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (188, N'Reino Unido', N'GBR')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (189, N'República Centroafricana', N'CAF')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (190, N'República Democrática del Congo', N'COD')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (191, N'República Dominicana', N'DOM')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (192, N'Reunión', N'REU')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (193, N'Ruanda', N'RWA')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (194, N'Rumania', N'ROU')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (195, N'Rusia', N'RUS')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (196, N'Sáhara Occidental', N'ESH')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (197, N'Samoa', N'WSM')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (198, N'Samoa Americana', N'ASM')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (199, N'San Bartolomé', N'BLM')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (200, N'San Cristóbal y Nieves', N'KNA')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (201, N'San Marino', N'SMR')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (202, N'San Pedro y Miquelón', N'SPM')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (203, N'San Vicente y las Granadinas', N'VCT')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (204, N'Santa Elena, Ascensión y Tristán de Acuña', N'SHN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (205, N'Santa Lucía', N'LCA')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (206, N'Santo Tomé y Príncipe', N'STP')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (207, N'Senegal', N'SEN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (208, N'Serbia', N'SRB')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (209, N'Seychelles', N'SYC')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (210, N'Sierra Leona', N'SLE')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (211, N'Singapur', N'SGP')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (212, N'Sint Maarten', N'SXM')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (213, N'Siria', N'SYR')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (214, N'Somalia', N'SOM')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (215, N'Sri Lanka', N'LKA')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (216, N'Sudáfrica', N'ZAF')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (217, N'Sudán', N'SDN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (218, N'Sudán del Sur', N'SSD')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (219, N'Suecia', N'SWE')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (220, N'Suiza', N'CHE')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (221, N'Surinam', N'SUR')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (222, N'Svalbard y Jan Mayen', N'SJM')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (223, N'Tailandia', N'THA')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (224, N'Taiwán', N'TWN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (225, N'Tanzania', N'TZA')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (226, N'Tayikistán', N'TJK')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (227, N'Territorio Británico del Océano Índico', N'IOT')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (228, N'Territorios Australes y Antárticos Franceses', N'ATF')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (229, N'Timor Oriental', N'TLS')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (230, N'Togo', N'TGO')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (231, N'Tokelau', N'TKL')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (232, N'Tonga', N'TON')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (233, N'Trinidad y Tobago', N'TTO')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (234, N'Túnez', N'TUN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (235, N'Turkmenistán', N'TKM')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (236, N'Turquía', N'TUR')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (237, N'Tuvalu', N'TUV')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (238, N'Ucrania', N'UKR')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (239, N'Uganda', N'UGA')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (240, N'Uruguay', N'URY')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (241, N'Uzbekistán', N'UZB')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (242, N'Vanuatu', N'VUT')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (243, N'Venezuela', N'VEN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (244, N'Vietnam', N'VNM')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (245, N'Wallis y Futuna', N'WLF')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (246, N'Yemen', N'YEM')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (247, N'Yibuti', N'DJI')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (248, N'Zambia', N'ZMB')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (249, N'Zimbabue', N'ZWE')
GO
SET IDENTITY_INSERT [dbo].[paises] OFF
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
/****** Object:  StoredProcedure [dbo].[sp_EliminarUsuario]    Script Date: 7/15/2022 2:24:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_EliminarUsuario]
@IdUsuario int
AS
UPDATE Usuarios SET fecha_baja = GETDATE() WHERE id_usuario = @IdUsuario
GO
/****** Object:  StoredProcedure [dbo].[sp_ExisteEmail]    Script Date: 7/15/2022 2:24:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ExisteEmail]
@email nvarchar(100) 
AS
SELECT * FROM Usuarios WHERE UPPER(email) = UPPER(@email)
GO
/****** Object:  StoredProcedure [dbo].[sp_ExisteEmailExistente]    Script Date: 7/15/2022 2:24:06 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetActividades]    Script Date: 7/15/2022 2:24:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetActividades]
AS
SELECT ac.id_actividad, ac.create_date, us.apellido + ', ' + us.nombre AS nombre_completo, ac.actividad FROM actividades ac JOIN Usuarios us ON us.id_usuario = ac.id_usuario
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveActividad]    Script Date: 7/15/2022 2:24:06 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SaveUsuario]    Script Date: 7/15/2022 2:24:06 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SelectAllPaises]    Script Date: 7/15/2022 2:24:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SelectAllPaises]
AS
SELECT * FROM paises
GO
/****** Object:  StoredProcedure [dbo].[sp_selectAllUsuarios]    Script Date: 7/15/2022 2:24:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_selectAllUsuarios]
AS
SELECT us.id_usuario, us.apellido, us.nombre, us.email, us.fecha_nacimiento, us.telefono, pa.id_pais, pa.nombre AS nombre_pais, pa.codigo_internacional, us.recibe_informacion, us.fecha_baja
FROM Usuarios us JOIN paises pa ON pa.id_pais = us.id_pais
WHERE us.fecha_baja IS NULL
GO
/****** Object:  StoredProcedure [dbo].[sp_selectAllUsuariosEliminados]    Script Date: 7/15/2022 2:24:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_selectAllUsuariosEliminados]
AS
SELECT us.id_usuario, us.apellido, us.nombre, us.email, us.fecha_nacimiento, us.telefono, pa.id_pais, pa.nombre AS nombre_pais, pa.codigo_internacional, us.recibe_informacion, us.fecha_baja  
FROM Usuarios us JOIN paises pa ON pa.id_pais = us.id_pais  
WHERE us.fecha_baja IS NOT NULL  
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectPaisByID]    Script Date: 7/15/2022 2:24:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SelectPaisByID]
@id_pais INT
AS
SELECT * FROM paises WHERE id_pais = @id_pais
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectUsuarioById]    Script Date: 7/15/2022 2:24:06 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateUsuario]    Script Date: 7/15/2022 2:24:06 PM ******/
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
