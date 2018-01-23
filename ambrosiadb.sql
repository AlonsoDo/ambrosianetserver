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
	(6416, 2194, 4, 'Segundos Menus', 0.00, 0.00, 0, 1, '#000000', '#ed7c13', 1, 1, 'C:\\AmbrosiaClient\\Img\\segundos.jpg', 1),
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


-- Volcando estructura para tabla ambrosia.impresoraconfig
CREATE TABLE IF NOT EXISTS `impresoraconfig` (
  `ElementoId` int(11) NOT NULL,
  `NombreImpresora` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ambrosia.impresoraconfig: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `impresoraconfig` DISABLE KEYS */;
INSERT INTO `impresoraconfig` (`ElementoId`, `NombreImpresora`) VALUES
	(2194, 'Cocina'),
	(2194, 'Cocina-Primeros'),
	(2194, 'Cocina-Segundos'),
	(6435, 'Cocina'),
	(6408, 'Barra');
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
