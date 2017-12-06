-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-12-2017 a las 04:59:53
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ecaptain`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `food_detail`
--

CREATE TABLE `food_detail` (
  `idfood_detail` int(10) UNSIGNED NOT NULL,
  `id_isla` int(10) UNSIGNED NOT NULL,
  `food_name` varchar(45) NOT NULL,
  `food_weight` double NOT NULL,
  `status` varchar(45) NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `food_detail`
--

INSERT INTO `food_detail` (`idfood_detail`, `id_isla`, `food_name`, `food_weight`, `status`, `date_time`) VALUES
(1, 1, 'arroz', 22.4, 'completo', '2017-12-05 19:28:43'),
(2, 1, 'ArrozArduini', 20.1, 'lleno', '2017-12-05 19:40:14'),
(3, 1, 'ArrozArduini', 20.1, 'lleno', '2017-12-05 19:40:24'),
(4, 1, 'ArrozArduini', 20.1, 'lleno', '2017-12-05 19:40:34'),
(5, 1, 'ArrozArduini', 20.1, 'lleno', '2017-12-05 19:40:44'),
(6, 1, 'ArrozArduini', 20.1, 'lleno', '2017-12-05 19:44:28'),
(7, 1, 'ArrozArduini', 20.1, 'lleno', '2017-12-05 19:44:38'),
(8, 1, 'ArrozArduini', 20.1, 'lleno', '2017-12-05 19:44:48');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `food_detail`
--
ALTER TABLE `food_detail`
  ADD PRIMARY KEY (`idfood_detail`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `food_detail`
--
ALTER TABLE `food_detail`
  MODIFY `idfood_detail` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
