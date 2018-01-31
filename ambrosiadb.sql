-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.5.8 - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla ambrosia.detafact
CREATE TABLE IF NOT EXISTS `detafact` (
  `FacturaId` bigint(20) unsigned NOT NULL DEFAULT '0',
  `Unidades` smallint(6) NOT NULL DEFAULT '0',
  `Descripcion` varchar(100) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `Precio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Impuesto` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ImpEnFac` tinyint(4) NOT NULL DEFAULT '1',
  `LoteId` bigint(20) NOT NULL DEFAULT '0',
  KEY `FacturaId` (`FacturaId`),
  KEY `LoteId` (`LoteId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla ambrosia.detafact: ~79 rows (aproximadamente)
/*!40000 ALTER TABLE `detafact` DISABLE KEYS */;
INSERT INTO `detafact` (`FacturaId`, `Unidades`, `Descripcion`, `Precio`, `Impuesto`, `ImpEnFac`, `LoteId`) VALUES
	(3, 0, '', 0.00, 0.00, 1, 0),
	(3, 0, '', 0.00, 0.00, 1, 0),
	(3, 0, '', 0.00, 0.00, 1, 0),
	(4, 4, '', 0.00, 0.00, 1, 0),
	(4, 5, '', 0.00, 0.00, 1, 0),
	(4, 6, '', 0.00, 0.00, 1, 0),
	(6, 1, 'Menu del Dia', 0.00, 0.00, 1, 0),
	(6, 1, 'Flan de la Casa', 0.00, 0.00, 1, 0),
	(6, 1, 'Cafe con leche', 0.00, 0.00, 1, 0),
	(8, 1, 'Menu del Dia', 10.00, 0.00, 1, 0),
	(8, 1, 'Flan de la Casa', 3.00, 0.00, 1, 0),
	(10, 1, 'Menu del Dia', 10.00, 7.00, 1, 0),
	(10, 1, 'Flan de la Casa', 3.00, 10.00, 1, 0),
	(10, 1, 'Cafe con leche', 2.00, 10.00, 1, 0),
	(11, 1, 'Menu del Dia', 10.00, 7.00, 0, 0),
	(11, 1, 'Primeros Menus', 0.00, 0.00, 0, 0),
	(11, 1, 'Segundos Menus', 0.00, 0.00, 0, 0),
	(12, 1, 'Menu del Dia', 10.00, 7.00, 1, 0),
	(12, 1, 'Primeros Menus', 0.00, 0.00, 0, 0),
	(12, 1, 'Segundos Menus', 0.00, 0.00, 1, 0),
	(14, 1, 'Menu del Dia', 10.00, 7.00, 1, 24),
	(14, 1, 'Primeros Menus', 0.00, 0.00, 0, 24),
	(14, 1, 'Segundos Menus', 0.00, 0.00, 1, 24),
	(14, 1, 'Pollo Asado', 0.00, 0.00, 0, 24),
	(15, 1, 'Menu del Dia', 10.00, 7.00, 1, 25),
	(16, 1, 'Menu del Dia', 10.00, 7.00, 1, 28),
	(17, 1, 'Menu del Dia', 10.00, 7.00, 1, 29),
	(18, 1, 'Menu del Dia', 10.00, 7.00, 1, 34),
	(19, 1, 'Menu del Dia', 10.00, 7.00, 1, 35),
	(20, 1, 'Menu del Dia', 10.00, 7.00, 1, 36),
	(21, 1, 'Menu del Dia', 10.00, 7.00, 1, 37),
	(22, 1, 'Menu del Dia', 10.00, 7.00, 1, 38),
	(22, 1, 'Menu del Dia', 10.00, 7.00, 1, 40),
	(1, 2, 'Flan de la Casa', 3.00, 10.00, 1, 42),
	(1, 2, 'Flan de la Casa', 3.00, 10.00, 1, 42),
	(1, 2, 'Flan de la Casa', 3.00, 10.00, 1, 42),
	(23, 1, 'Cafe con leche', 2.00, 10.00, 1, 44),
	(23, 1, 'Cafe con leche', 2.00, 10.00, 1, 44),
	(23, 1, 'Canna ', 1.00, 10.00, 1, 45),
	(23, 1, 'Gyn tonyc', 3.00, 10.00, 1, 45),
	(23, 1, 'Bt San Miguel', 2.00, 10.00, 1, 45),
	(24, 1, 'Chuletas Cerdo', 12.00, 10.00, 1, 46),
	(24, 1, 'Chuletas Cerdo', 12.00, 10.00, 1, 46),
	(6, 1, 'Menu del Dia', 10.00, 7.00, 1, 47),
	(6, 1, 'Flan de la Casa', 3.00, 10.00, 1, 47),
	(6, 1, 'Flan de la Casa', 3.00, 10.00, 1, 48),
	(6, 1, 'Extra Nata', 0.00, 10.00, 0, 48),
	(6, 1, 'Flan de la Casa', 3.00, 10.00, 1, 49),
	(6, 1, 'Extra Nata', 0.00, 10.00, 0, 49),
	(6, 1, 'Menu del Dia', 10.00, 7.00, 1, 49),
	(6, 1, 'Menu del Dia', 10.00, 7.00, 1, 50),
	(6, 1, 'Primeros Menus', 0.00, 0.00, 0, 50),
	(6, 1, 'Ensalada Mixta', 0.00, 0.00, 0, 50),
	(25, 1, 'Menu del Dia', 10.00, 7.00, 1, 51),
	(25, 1, 'Primeros Menus', 0.00, 0.00, 0, 51),
	(25, 1, 'Ensalada Mixta', 0.00, 0.00, 0, 51),
	(25, 1, 'Segundos Menus', 0.00, 0.00, 1, 51),
	(25, 1, 'Calamares', 8.00, 10.00, 1, 51),
	(25, 1, 'Helado triple sabor', 2.00, 10.00, 1, 51),
	(25, 1, 'Birutas de almendra', 0.00, 0.00, 0, 51),
	(25, 1, 'Bt San Miguel', 2.00, 10.00, 1, 51),
	(6, 1, 'Menu del Dia', 10.00, 7.00, 1, 52),
	(6, 1, 'Primeros Menus', 0.00, 0.00, 0, 52),
	(6, 1, 'Ensalada Mixta', 0.00, 0.00, 0, 52),
	(6, 1, 'Flan de la Casa', 3.00, 10.00, 1, 52),
	(6, 1, 'Helado triple sabor', 2.00, 10.00, 1, 52),
	(6, 1, 'Birutas de almendra', 0.00, 0.00, 0, 52),
	(6, 1, 'Chuletas Cerdo', 12.00, 10.00, 1, 52),
	(6, 1, 'Menu del Dia', 10.00, 7.00, 1, 52),
	(6, 1, 'Primeros Menus', 0.00, 0.00, 0, 52),
	(6, 1, 'Ensalada Mixta', 0.00, 0.00, 0, 52),
	(6, 1, 'Menu del Dia', 10.00, 7.00, 1, 53),
	(6, 1, 'Primeros Menus', 0.00, 0.00, 0, 53),
	(6, 1, 'Ensalada Mixta', 0.00, 0.00, 0, 53),
	(6, 1, 'Menu del Dia', 10.00, 7.00, 1, 53),
	(6, 1, 'Flan de la Casa', 3.00, 10.00, 1, 53),
	(6, 1, 'Extra Nata', 0.00, 10.00, 0, 53),
	(6, 1, 'Cafe con leche', 2.00, 10.00, 1, 53),
	(6, 1, 'Taza', 0.00, 0.00, 0, 53),
	(6, 1, 'Menu del Dia', 10.00, 7.00, 1, 54),
	(6, 1, 'Menu del Dia', 10.00, 7.00, 1, 54),
	(6, 1, 'Menu del Dia', 10.00, 7.00, 1, 54),
	(6, 1, 'Menu del Dia', 10.00, 7.00, 1, 54),
	(6, 1, 'Menu del Dia', 10.00, 7.00, 1, 54),
	(6, 1, 'Menu del Dia', 10.00, 7.00, 1, 54),
	(6, 1, 'Menu del Dia', 10.00, 7.00, 1, 54),
	(6, 1, 'Menu del Dia', 10.00, 7.00, 1, 54),
	(6, 1, 'Menu del Dia', 10.00, 7.00, 1, 54),
	(6, 1, 'Menu del Dia', 10.00, 7.00, 1, 54),
	(6, 1, 'Menu del Dia', 10.00, 7.00, 1, 54),
	(6, 1, 'Menu del Dia', 10.00, 7.00, 1, 54),
	(6, 1, 'Menu del Dia', 10.00, 7.00, 1, 54),
	(6, 1, 'Menu del Dia', 10.00, 7.00, 1, 54);
/*!40000 ALTER TABLE `detafact` ENABLE KEYS */;


-- Volcando estructura para tabla ambrosia.elementos
CREATE TABLE IF NOT EXISTS `elementos` (
  `ElementoId` int(11) NOT NULL AUTO_INCREMENT,
  `PadreId` int(11) NOT NULL,
  `CompanyId` int(11) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Impuesto` decimal(10,2) NOT NULL,
  `ImprimirEnFactura` tinyint(4) NOT NULL,
  `ImprimirEnComanda` tinyint(4) NOT NULL,
  `ColorLetras` varchar(7) NOT NULL,
  `ColorFondo` varchar(7) NOT NULL,
  `TieneImpresora` tinyint(4) NOT NULL,
  `TieneTerminal` tinyint(4) NOT NULL,
  `PathImg` varchar(200) NOT NULL,
  `Final` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ElementoId`)
) ENGINE=InnoDB AUTO_INCREMENT=6450 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ambrosia.elementos: ~44 rows (aproximadamente)
/*!40000 ALTER TABLE `elementos` DISABLE KEYS */;
INSERT INTO `elementos` (`ElementoId`, `PadreId`, `CompanyId`, `Descripcion`, `Precio`, `Impuesto`, `ImprimirEnFactura`, `ImprimirEnComanda`, `ColorLetras`, `ColorFondo`, `TieneImpresora`, `TieneTerminal`, `PathImg`, `Final`) VALUES
	(2194, 0, 4, 'Menu del Dia', 10.00, 7.00, 1, 1, '#000000', '#f0870c', 1, 1, 'C:\\AmbrosiaClient\\Img\\menu.png', 1),
	(2204, 0, 4, 'Postres', 0.00, 0.00, 0, 0, '#fcfcfc', '#e6197b', 1, 1, 'C:\\AmbrosiaClient\\Img\\postres.jpg', 0),
	(2214, 0, 4, 'Carnes', 0.00, 0.00, 1, 1, '#d42424', '#de9b14', 0, 0, 'C:\\AmbrosiaClient\\Img\\meat.png', 0),
	(3104, 0, 4, 'Ensaladas', 0.00, 0.00, 0, 0, '#d42424', '#de9b14', 0, 0, 'C:\\AmbrosiaClient\\Img\\salads.png', 0),
	(3114, 0, 4, 'Licores', 0.00, 0.00, 0, 0, '#000000', '#0cf067', 1, 1, 'C:\\AmbrosiaClient\\Img\\licores.png', 0),
	(6372, 0, 4, 'Hamburguesas', 12.00, 7.00, 1, 1, '#000000', '#e05e14', 1, 1, 'C:\\AmbrosiaClient\\Img\\hamburguesas.png', 0),
	(6408, 6421, 4, 'Cafe con leche', 2.05, 10.00, 1, 1, '#000000', '#f00c87', 1, 1, 'C:\\AmbrosiaClient\\Img\\cafeleche.jpg', 1),
	(6411, 2194, 4, 'Primeros Menus', 0.00, 0.00, 0, 1, '#000000', '#e68515', 1, 1, 'C:\\AmbrosiaClient\\Img\\primeros.png', 1),
	(6412, 6411, 4, 'Ensalada Mixta', 0.00, 0.00, 0, 1, '#000000', '#f57e11', 1, 1, 'C:\\AmbrosiaClient\\Img\\ensaladamixta.jpg', 1),
	(6413, 6411, 4, 'Sopa de Verduras', 0.00, 0.00, 0, 1, '#000000', '#ed7c13', 1, 1, 'C:\\AmbrosiaClient\\Img\\sopaverduras.jpg', 1),
	(6415, 6411, 4, 'Crema de Tomate', 0.00, 0.00, 0, 1, '#000000', '#ed7c13', 1, 1, 'C:\\AmbrosiaClient\\Img\\sopatomate.jpg', 1),
	(6416, 2194, 4, 'Segundos Menus', 0.00, 0.00, 1, 1, '#000000', '#ed7c13', 1, 1, 'C:\\AmbrosiaClient\\Img\\segundos.jpg', 1),
	(6417, 6411, 4, 'Crema de Champiñon', 0.00, 0.00, 0, 1, '#000000', '#eb9310', 1, 1, 'C:\\AmbrosiaClient\\Img\\sopachampi.jpg', 1),
	(6418, 0, 4, 'Vinos', 0.00, 0.00, 0, 0, '#000000', '#e81548', 0, 0, 'C:\\AmbrosiaClient\\Img\\vinos.png', 0),
	(6420, 2214, 4, 'Chuletas Cerdo', 12.00, 10.00, 1, 1, '#000000', '#e6177a', 1, 1, 'C:\\AmbrosiaClient\\Img\\chuletacerdo.png', 1),
	(6421, 0, 4, 'Cafes', 0.00, 0.00, 0, 0, '#000000', '#17e61f', 0, 0, 'C:\\AmbrosiaClient\\Img\\cafes.jpg', 0),
	(6422, -1, 4, 'Con Hielo', 0.00, 0.00, 0, 1, '#000000', '#e6177a', 1, 1, '', 0),
	(6423, 6421, 4, 'Cafe Solo', 2.00, 10.00, 1, 1, '#000000', '#f00c87', 1, 1, 'C:\\AmbrosiaClient\\Img\\cafesolo.png', 1),
	(6424, 6423, 4, 'Con Hielo', 0.00, 0.00, 0, 1, '#000000', '#e6177a', 1, 1, 'C:\\AmbrosiaClient\\Img\\hielo.jpg', 1),
	(6425, 3114, 4, 'Pacharan', 5.00, 10.00, 1, 1, '#ebdada', '#4b13eb', 1, 1, 'C:\\AmbrosiaClient\\Img\\pacharan.jpg', 1),
	(6426, 6416, 4, 'Pollo Asado', 0.00, 0.00, 0, 1, '#ebdada', '#4b13eb', 1, 1, 'C:\\AmbrosiaClient\\Img\\polloasado.png', 1),
	(6427, -1, 4, 'Sin Salsa', 0.00, 0.00, 0, 1, '#ebdada', '#4b13eb', 1, 1, '', 0),
	(6428, 6426, 4, 'Sin Salsa', 0.00, 0.00, 0, 1, '#ebdada', '#4b13eb', 1, 1, 'C:\\AmbrosiaClient\\Img\\sinsalsa.png', 1),
	(6429, -1, 4, 'Extra Tomate', 0.00, 0.00, 0, 1, '#ebdada', '#4b13eb', 1, 1, '', 0),
	(6430, 6412, 4, 'Extra Tomate', 0.00, 0.00, 0, 1, '#ebdada', '#4b13eb', 1, 1, 'C:\\AmbrosiaClient\\Img\\extratomate.png', 1),
	(6431, -1, 4, 'Taza', 0.00, 0.00, 0, 1, '#000000', '#15eb91', 1, 1, '', 0),
	(6432, 6408, 4, 'Taza', 0.00, 0.00, 0, 1, '#000000', '#15eb91', 1, 1, 'C:\\AmbrosiaClient\\Img\\taza.jpg', 1),
	(6433, 6423, 4, 'Taza', 0.00, 0.00, 0, 1, '#000000', '#15eb91', 1, 1, 'C:\\AmbrosiaClient\\Img\\taza.jpg', 1),
	(6434, 6416, 4, 'Calamares', 8.00, 10.00, 1, 1, '#000000', '#f0d911', 1, 1, 'C:\\AmbrosiaClient\\Img\\calamares.jpg', 1),
	(6435, 2204, 4, 'Flan de la Casa', 3.50, 10.00, 1, 1, '#000000', '#0eed3f', 1, 1, 'C:\\AmbrosiaClient\\Img\\flan.png', 1),
	(6436, 3104, 4, 'Ensalada Mixta', 4.50, 10.00, 1, 1, '#000000', '#0eed3f', 1, 1, 'C:\\AmbrosiaClient\\Img\\ensaladamixta.jpg', 1),
	(6437, 0, 4, 'Bebidas', 0.00, 0.00, 0, 0, '#000000', '#0eed3f', 0, 0, 'C:\\AmbrosiaClient\\Img\\bebidas.png', 0),
	(6438, 6437, 4, 'Canna ', 1.50, 10.00, 1, 1, '#000000', '#0eed3f', 1, 1, 'C:\\AmbrosiaClient\\Img\\canna.jpg', 1),
	(6439, 2204, 4, 'Helado triple sabor', 2.50, 10.00, 1, 1, '#968738', '#573708', 1, 1, 'C:\\AmbrosiaClient\\Img\\heladotripe.png', 1),
	(6440, 6439, 4, 'Birutas de almendra', 0.00, 0.00, 0, 1, '#191916', '#db8b12', 1, 1, 'C:\\AmbrosiaClient\\Img\\almendra.jpg', 1),
	(6441, 6437, 4, 'Gyn tonyc', 3.00, 10.00, 1, 1, '#f0cb0a', '#f7f7f7', 1, 1, 'C:\\AmbrosiaClient\\Img\\gintonic.jpg', 1),
	(6442, 6416, 4, 'Sardinas', 6.00, 10.00, 1, 1, '#191917', '#4c4d49', 1, 1, 'C:\\AmbrosiaClient\\Img\\sardinas.jpg', 1),
	(6443, 6416, 4, 'Spaguetis', 0.00, 10.00, 0, 1, '#ad982a', '#f53207', 1, 1, 'C:\\AmbrosiaClient\\Img\\espagueti.jpg', 1),
	(6444, 6443, 4, 'Extra Tomate', 0.00, 0.00, 0, 1, '#ebdada', '#4b13eb', 1, 1, 'C:\\AmbrosiaClient\\Img\\extratomate.png', 1),
	(6445, 3114, 4, 'Licor de moras', 3.73, 10.00, 1, 1, '#f5eb00', '#071ff5', 1, 1, 'C:\\AmbrosiaClient\\Img\\licormoras.jpg', 1),
	(6446, -1, 4, 'Sin Cebolla', 0.00, 0.00, 0, 1, '#000000', '#35eb17', 1, 1, '', 0),
	(6447, 6412, 4, 'Sin Cebolla', 0.00, 0.00, 0, 1, '#000000', '#35eb17', 1, 1, '', 1),
	(6448, 6437, 4, 'Bt San Miguel', 2.50, 10.00, 1, 1, '#000000', '#35eb17', 1, 1, 'C:\\AmbrosiaClient\\Img\\sanmiguel.jpg', 1),
	(6449, 6435, 4, 'Extra Nata', 0.50, 10.00, 0, 1, '#000000', '#35eb17', 1, 1, 'C:\\AmbrosiaClient\\Img\\extracream.png', 1);
/*!40000 ALTER TABLE `elementos` ENABLE KEYS */;


-- Volcando estructura para tabla ambrosia.empleados
CREATE TABLE IF NOT EXISTS `empleados` (
  `EmpleadoId` int(11) NOT NULL AUTO_INCREMENT,
  `NombreEmpleado` varchar(30) NOT NULL,
  `ClaveEmpleado` varchar(20) NOT NULL,
  `CompanyId` int(11) NOT NULL,
  PRIMARY KEY (`EmpleadoId`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ambrosia.empleados: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` (`EmpleadoId`, `NombreEmpleado`, `ClaveEmpleado`, `CompanyId`) VALUES
	(34, 'Roberto', '1234', 34),
	(64, 'Sandra', '1234', 4),
	(74, 'Antonio', '1234', 4),
	(84, 'Juan', '1234', 4),
	(94, 'Lopez', '1234', 4);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;


-- Volcando estructura para tabla ambrosia.facturas
CREATE TABLE IF NOT EXISTS `facturas` (
  `FacturaId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Sesion` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Estado` varchar(1) COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A',
  `Nombre` varchar(5) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `Total` decimal(10,0) NOT NULL DEFAULT '0',
  `Cantidad` decimal(10,0) NOT NULL DEFAULT '0',
  `Cambio` decimal(10,0) NOT NULL DEFAULT '0',
  `FechaHora` datetime DEFAULT NULL,
  PRIMARY KEY (`FacturaId`),
  KEY `Sesion` (`Sesion`),
  KEY `Estado` (`Estado`),
  KEY `Nombre` (`Nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla ambrosia.facturas: ~21 rows (aproximadamente)
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` (`FacturaId`, `Sesion`, `Estado`, `Nombre`, `Total`, `Cantidad`, `Cambio`, `FechaHora`) VALUES
	(1, 1, 'A', '15', 0, 0, 0, NULL),
	(2, 1, 'A', '888', 0, 0, 0, '2018-01-27 11:37:38'),
	(3, 1, 'A', '44', 0, 0, 0, '2018-01-27 12:06:15'),
	(4, 1, 'A', '41', 0, 0, 0, '2018-01-27 12:21:19'),
	(6, 1, 'A', '5', 0, 0, 0, '2018-01-27 12:29:30'),
	(8, 1, 'A', '55', 0, 0, 0, '2018-01-27 12:55:02'),
	(10, 1, 'A', '55', 0, 0, 0, '2018-01-27 13:04:08'),
	(11, 1, 'A', '4', 0, 0, 0, '2018-01-27 19:05:52'),
	(12, 1, 'A', '5', 0, 0, 0, '2018-01-27 19:16:32'),
	(14, 1, 'A', '5', 0, 0, 0, '2018-01-27 19:32:21'),
	(15, 1, 'A', '5', 0, 0, 0, '2018-01-28 11:11:46'),
	(16, 1, 'A', '5', 0, 0, 0, '2018-01-28 11:37:10'),
	(17, 1, 'A', '5', 0, 0, 0, '2018-01-28 11:44:45'),
	(18, 1, 'A', '5', 0, 0, 0, '2018-01-28 12:53:18'),
	(19, 1, 'A', '5', 0, 0, 0, '2018-01-28 13:01:02'),
	(20, 1, 'A', '4125', 0, 0, 0, '2018-01-28 13:06:10'),
	(21, 1, 'A', '5', 0, 0, 0, '2018-01-28 14:23:43'),
	(22, 1, 'A', '12345', 0, 0, 0, '2018-01-28 14:25:14'),
	(23, 1, 'A', '6', 0, 0, 0, '2018-01-28 17:36:35'),
	(24, 1, 'A', '7', 0, 0, 0, '2018-01-28 17:40:03'),
	(25, 1, 'A', '12', 0, 0, 0, '2018-01-28 20:11:00');
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;


-- Volcando estructura para tabla ambrosia.impresoraconfig
CREATE TABLE IF NOT EXISTS `impresoraconfig` (
  `ElementoId` int(11) NOT NULL,
  `NombreImpresora` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ambrosia.impresoraconfig: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `impresoraconfig` DISABLE KEYS */;
INSERT INTO `impresoraconfig` (`ElementoId`, `NombreImpresora`) VALUES
	(2194, 'Cocina'),
	(2194, 'Cocina-Primeros'),
	(2194, 'Cocina-Segundos'),
	(6435, 'Cocina'),
	(6408, 'Barra'),
	(6425, 'Barra'),
	(6442, 'Espetos'),
	(6449, 'Cocina'),
	(6411, 'Cocina'),
	(6412, 'Cocina'),
	(6413, 'Cocina'),
	(6415, 'Cocina'),
	(6417, 'Cocina');
/*!40000 ALTER TABLE `impresoraconfig` ENABLE KEYS */;


-- Volcando estructura para tabla ambrosia.impresoras
CREATE TABLE IF NOT EXISTS `impresoras` (
  `ImpresoraId` int(11) NOT NULL AUTO_INCREMENT,
  `NombreImpresora` varchar(30) NOT NULL,
  PRIMARY KEY (`ImpresoraId`)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ambrosia.impresoras: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `impresoras` DISABLE KEYS */;
INSERT INTO `impresoras` (`ImpresoraId`, `NombreImpresora`) VALUES
	(244, 'Espetos'),
	(274, 'Cocina-Primeros'),
	(284, 'Cocina-Segundos'),
	(304, 'Barra'),
	(314, 'Caja'),
	(324, 'Cocina');
/*!40000 ALTER TABLE `impresoras` ENABLE KEYS */;


-- Volcando estructura para tabla ambrosia.login
CREATE TABLE IF NOT EXISTS `login` (
  `CompanyId` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `User` varchar(20) NOT NULL,
  `Pass` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `NombreComercial` varchar(50) NOT NULL,
  `NombreFiscal` varchar(50) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `CodigoPostal` varchar(5) NOT NULL,
  `Ciudad` varchar(30) NOT NULL,
  `NIF` varchar(10) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`CompanyId`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ambrosia.login: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` (`CompanyId`, `User`, `Pass`, `Email`, `NombreComercial`, `NombreFiscal`, `Direccion`, `CodigoPostal`, `Ciudad`, `NIF`, `Telefono`) VALUES
	(4, 'Caspi', '1234', 'alonso_caspi@hotmail.com', 'Restaurante Los Pescadores 2', 'Bahia S.L.', 'Playa del Bajondillo 24', '12345', 'Torrremolinos', '12123123-X', '952445566'),
	(14, 'Sofia2', '1234', 'sofiadominguezbelmonte@gmail.com', 'Heladeria Dolche Gusto', 'Mirar S.A.', 'C/ San Juan 25', '12345', 'La Higuera', '1234567-L', '123123123'),
	(24, 'CaspiAutentico', '12345678', 'alonso.caspi@gmail.com', 'Taperia La Esquinita', 'GestaSur S.L.', 'C/ Estepona 22', '29555', 'Marbella', '27333444-L', ''),
	(34, 'Caspi2', '12345', 'alonso_caspi2@hotmail.com', '', '', '', '', '', '', ''),
	(44, 'tamisa', '1234A', 'correoapolosoft@hotmail.com', '', '', '', '', '', '', ''),
	(54, 'Test', '12345', 'apolosoft@telefonica.net', '', '', '', '', '', '', ''),
	(64, 'test1', 'test', 'apolosoft@telefonica.com', '', '', '', '', '', '', ''),
	(74, 'w', 'w', 'alonso@gmail.com', '', '', '', '', '', '', ''),
	(84, 'Yo', '1234', 'alonso@gmail.com', '', '', '', '', '', '', ''),
	(94, 'CaspiYo', '1234', 'alonso@gmail.com', '', '', '', '', '', '', ''),
	(104, 'SinImpresoras', '1234', 'alonso.caspi@gmail.com', '', '', '', '', '', '', '');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;


-- Volcando estructura para tabla ambrosia.lotes
CREATE TABLE IF NOT EXISTS `lotes` (
  `LoteId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Momento` datetime DEFAULT NULL,
  `NumeElem` smallint(6) NOT NULL DEFAULT '0',
  `NombCuen` varchar(5) COLLATE latin1_spanish_ci NOT NULL DEFAULT '0',
  `Sesion` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`LoteId`),
  KEY `Sesion` (`Sesion`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla ambrosia.lotes: ~35 rows (aproximadamente)
/*!40000 ALTER TABLE `lotes` DISABLE KEYS */;
INSERT INTO `lotes` (`LoteId`, `Momento`, `NumeElem`, `NombCuen`, `Sesion`) VALUES
	(2, '2018-01-26 20:56:54', 0, '0', 1),
	(4, '2018-01-27 10:44:07', 2, '0', 1),
	(5, '2018-01-27 10:50:18', 4, '55', 1),
	(9, '2018-01-27 11:03:40', 1, '8', 1),
	(10, '2018-01-27 11:21:31', 1, '89', 1),
	(11, '2018-01-27 11:31:31', 1, '15', 1),
	(12, '2018-01-27 11:37:38', 1, '888', 1),
	(13, '2018-01-27 12:06:15', 3, '44', 1),
	(14, '2018-01-27 12:21:19', 3, '41', 1),
	(16, '2018-01-27 12:29:30', 3, '5', 1),
	(18, '2018-01-27 12:55:02', 2, '55', 1),
	(20, '2018-01-27 13:04:08', 3, '55', 1),
	(21, '2018-01-27 19:05:52', 3, '4', 1),
	(22, '2018-01-27 19:16:32', 3, '5', 1),
	(24, '2018-01-27 19:32:21', 4, '5', 1),
	(25, '2018-01-28 11:11:46', 1, '5', 1),
	(28, '2018-01-28 11:37:10', 1, '5', 1),
	(29, '2018-01-28 11:44:45', 1, '5', 1),
	(34, '2018-01-28 12:53:18', 1, '5', 1),
	(35, '2018-01-28 13:01:02', 1, '5', 1),
	(36, '2018-01-28 13:06:10', 1, '4125', 1),
	(37, '2018-01-28 14:23:43', 1, '5', 1),
	(38, '2018-01-28 14:25:14', 1, '12345', 1),
	(40, '2018-01-28 14:44:38', 1, '12345', 1),
	(42, '2018-01-28 17:29:10', 3, '15', 1),
	(44, '2018-01-28 17:36:35', 2, '6', 1),
	(45, '2018-01-28 17:39:16', 3, '6', 1),
	(46, '2018-01-28 17:40:03', 2, '7', 1),
	(47, '2018-01-28 19:07:28', 2, '5', 1),
	(48, '2018-01-28 19:36:24', 2, '5', 1),
	(49, '2018-01-28 19:43:10', 3, '5', 1),
	(50, '2018-01-28 19:53:20', 3, '5', 1),
	(51, '2018-01-28 20:11:00', 8, '12', 1),
	(52, '2018-01-29 12:16:21', 10, '5', 1),
	(53, '2018-01-29 12:23:24', 8, '5', 1),
	(54, '2018-01-29 12:58:45', 14, '5', 1);
/*!40000 ALTER TABLE `lotes` ENABLE KEYS */;


-- Volcando estructura para tabla ambrosia.terminalconfig
CREATE TABLE IF NOT EXISTS `terminalconfig` (
  `ElementoId` int(11) NOT NULL,
  `NombreTerminal` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ambrosia.terminalconfig: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `terminalconfig` DISABLE KEYS */;
INSERT INTO `terminalconfig` (`ElementoId`, `NombreTerminal`) VALUES
	(2194, 'Terminal-Cocina'),
	(2194, 'Terminal-Primeros'),
	(2194, 'Terminal-Segundos'),
	(6435, 'Terminal-Cocina'),
	(6435, 'Terminal-Postres'),
	(6442, 'Terminal-Espetos');
/*!40000 ALTER TABLE `terminalconfig` ENABLE KEYS */;


-- Volcando estructura para tabla ambrosia.terminales
CREATE TABLE IF NOT EXISTS `terminales` (
  `TerminalId` int(11) NOT NULL AUTO_INCREMENT,
  `NombreTerminal` varchar(30) NOT NULL,
  PRIMARY KEY (`TerminalId`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ambrosia.terminales: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `terminales` DISABLE KEYS */;
INSERT INTO `terminales` (`TerminalId`, `NombreTerminal`) VALUES
	(74, 'Terminal-Barra'),
	(84, 'Terminal-Caja'),
	(94, 'Terminal-Cocina'),
	(154, 'Terminal-Primeros'),
	(164, 'Terminal-Segundos'),
	(174, 'Terminal-Postres'),
	(184, 'Terminal-Espetos');
/*!40000 ALTER TABLE `terminales` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
