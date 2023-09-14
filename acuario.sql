-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-09-2023 a las 20:21:38
-- Versión del servidor: 11.1.0-MariaDB
-- Versión de PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `acuario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `car`
--

CREATE TABLE `car` (
  `CarritoID` int(20) NOT NULL,
  `id_Usuario` int(20) NOT NULL,
  `id_producto` int(20) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `nombre_producto` varchar(50) NOT NULL,
  `imagen_producto` varchar(1000) NOT NULL,
  `precio_producto` int(11) NOT NULL,
  `cantidad` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(20) NOT NULL,
  `nombreP` varchar(50) DEFAULT NULL,
  `preciop` int(11) DEFAULT NULL,
  `descripcionp` varchar(100) DEFAULT NULL,
  `imagen` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombreP`, `preciop`, `descripcionp`, `imagen`) VALUES
(34, 'peces beta', 500, 'conjunto', 'peces beta06-40-39'),
(37, 'peces locos', 132, 'peces varios', 'pecesbeta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(20) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellido_P` varchar(50) DEFAULT NULL,
  `Apellido_M` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `Contrasena` varchar(50) DEFAULT NULL,
  `telefono` int(15) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `Nombre`, `Apellido_P`, `Apellido_M`, `correo`, `Contrasena`, `telefono`, `Direccion`) VALUES
(1, 'Ivan Noe', 'Villalobos', 'Castillo', 'ivanovicas@hotmail.com', 'ivanoe123', 33179462, 'Casa'),
(18, 'Julio Manuel', 'lopez', 'perez', 'julio@gmail.com', '123', 1234567, '123asd'),
(24, 'Jair Alberto', 'Tapia', 'Becerra', 'jair.alberto1905@gmail.com', '123456789', 12354702, 'La ChinoHouse'),
(25, 'juan', 'cruz', 'alexandre', 'juan@gmail.com', '123', 12345, 'casa'),
(26, 'montserrat', 'cruz', 'alexandre', 'juan@gmail.com', '123', 12345, 'casa'),
(31, 'diego', 'almaraz', 'rodriguez', 'a21110136@ceti.mx', '123', 123123, 'ceti colomos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `VentaID` int(11) NOT NULL,
  `UsuarioID` int(10) DEFAULT NULL,
  `Fecha_Compra` datetime DEFAULT NULL,
  `Total` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`VentaID`, `UsuarioID`, `Fecha_Compra`, `Total`) VALUES
(5, 18, '2023-06-19 06:28:05', 1000),
(6, 18, '2023-06-19 06:28:19', 1000),
(7, 24, '2023-06-19 06:31:08', 1000),
(8, 31, '2023-06-20 06:44:33', 1000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`CarritoID`),
  ADD KEY `id_Usuario` (`id_Usuario`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`VentaID`),
  ADD KEY `UsuarioID` (`UsuarioID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `car`
--
ALTER TABLE `car`
  MODIFY `CarritoID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `VentaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_Usuario`) REFERENCES `usuarios` (`ID`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `UsuarioID` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
