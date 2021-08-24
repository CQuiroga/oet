-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2021 at 05:49 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `acme`
--

-- --------------------------------------------------------

--
-- Table structure for table `conductores`
--

CREATE TABLE `conductores` (
  `id` int(11) NOT NULL,
  `cedulaConductor` varchar(12) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `prNomConductor` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `segNombreConductor` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `apellidosConductor` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `direccionConductor` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `telefonoConductor` varchar(12) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `ciudadConductor` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `conductores`
--

INSERT INTO `conductores` (`id`, `cedulaConductor`, `prNomConductor`, `segNombreConductor`, `apellidosConductor`, `direccionConductor`, `telefonoConductor`, `ciudadConductor`) VALUES
(1, '85958', 'Miguel', 'Lorenzo', 'Gonzales García', 'Cll 6 N 10 - 38', '3194562515', 'Bogotá'),
(2, '42892481', 'Jeison', 'Antonio', 'Camargo Robles', 'Diag 22 N 15 - 25', '3184751598', 'La Guajira'),
(3, '45825735', 'Hugo', 'Mario', 'Pinzón Mendoza', 'Av 15  N 87 - 25', '2285391', 'Popayán'),
(4, '285559', 'Pedro', 'José', 'Santana', 'Cra 15 N 62 -30 Sur', '6863278', 'Bogotá');

-- --------------------------------------------------------

--
-- Table structure for table `propietarios`
--

CREATE TABLE `propietarios` (
  `id` int(11) NOT NULL,
  `cedulaPropietario` varchar(12) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `primerNombrePropietario` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `segNombrePropietario` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `apellidosPropietario` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `direccionPropietario` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `telefonoPropietario` varchar(12) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `ciudadPropietario` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `propietarios`
--

INSERT INTO `propietarios` (`id`, `cedulaPropietario`, `primerNombrePropietario`, `segNombrePropietario`, `apellidosPropietario`, `direccionPropietario`, `telefonoPropietario`, `ciudadPropietario`) VALUES
(1, '1018429826', 'Camilo', 'Andrés', 'Quiroga Martínez', 'Av 123', '123456789', 'Bogotá'),
(2, '20589958', 'María', 'Rosalba', 'Rodríguez Beltran', 'Cra 103 a N 133 a 41', '3138561047', 'Bogotá'),
(3, '19275846', 'Luis', 'Edilberto', 'Albornoz Pachón', 'Cra 103 a N 133 a 25', '3118301109', 'La Mesa - Cmrca'),
(4, '52825735', 'Yudi', 'Angélica', 'Aguilar Martínez', 'Dig 164 N 45 - 87', '3142461529', 'Pasto'),
(5, '358379', 'Antonio', 'José', 'Saenz Iriarte', 'Calle 56 N 25-30', '3197077260', 'Caldas'),
(6, '3574094', 'María', 'Aracelly', 'Quiroga Martínez', 'Cra 147 N 141 a 50', '3158246155', 'Bucaramanga'),
(7, '1015411398', 'Laura', 'Sofía', 'Albornoz de Quiroga', 'Calle 93 N 12 - 15', '987654321', 'Bogotá'),
(8, '123456', 'Polli', 'Estefanía', 'Quiroga Albornoz', 'Calle 93 N 12 - 15', '0005', 'Bogotá'),
(9, '154595', 'Rogelio', 'Andrés', 'Cardona Fernández', 'Transversal 95 N 7 -11', '6828355', 'Pereira');

-- --------------------------------------------------------

--
-- Table structure for table `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id` int(11) NOT NULL,
  `placa` varchar(7) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `color` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipo` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_conductor` int(11) NOT NULL,
  `id_propietario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehiculos`
--

INSERT INTO `vehiculos` (`id`, `placa`, `color`, `marca`, `tipo`, `id_conductor`, `id_propietario`) VALUES
(1, 'BBO324', 'Verde', 'Mazda', 'Particular', 2, 3),
(2, 'CNJ336', 'Azul', 'Peugeot', 'Público', 1, 6),
(3, 'AXX72D', 'Rojo', 'Honda', 'Particular', 4, 2),
(4, 'RXN684', 'Gris', 'Hyundai', 'Público', 3, 8),
(5, 'QPR468', 'Blanco', 'Renault', 'Público', 1, 9),
(6, 'APQ924', 'Amarillo', 'Mazda', 'Público', 2, 1),
(7, 'OAJ45E', 'Negro', 'BMW', 'particular', 3, 7),
(8, 'RFT524', 'Verde', 'Mazda', 'particular', 2, 4),
(9, 'LCN613', 'Verde', 'Mazda', 'particular', 4, 3),
(10, 'BBC694', 'Verde', 'Mazda', 'particular', 2, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `conductores`
--
ALTER TABLE `conductores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `propietarios`
--
ALTER TABLE `propietarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_vehiculo_conductor` (`id_conductor`),
  ADD KEY `FK_vehiculo_propietario` (`id_propietario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `conductores`
--
ALTER TABLE `conductores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `propietarios`
--
ALTER TABLE `propietarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD CONSTRAINT `FK_vehiculo_conductor` FOREIGN KEY (`id_conductor`) REFERENCES `conductores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_vehiculo_propietario` FOREIGN KEY (`id_propietario`) REFERENCES `propietarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
