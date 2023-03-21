-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql
-- Tiempo de generación: 21-03-2023 a las 16:58:57
-- Versión del servidor: 8.0.28
-- Versión de PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `examen`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admins`
--

CREATE TABLE `admins` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `status` tinyint NOT NULL,
  `deleted` tinyint NOT NULL,
  `login_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `status`, `deleted`, `login_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Jorge', 'jorge@mail.es', '806cc6e9290ccac7e77a34f545b28fdf3c8a87dab0f144f3885b2411483e433df0a34d9d11355f20b74df86b9bbbe5dd95d4046be9430851b8fbdbc390dc8e54', 1, 0, '2022-10-11 17:26:13', '2022-10-07 18:00:41', '2022-10-11 17:27:38', NULL),
(4, 'Jaime', 'jaime@mail.es', '806cc6e9290ccac7e77a34f545b28fdf3c8a87dab0f144f3885b2411483e433df0a34d9d11355f20b74df86b9bbbe5dd95d4046be9430851b8fbdbc390dc8e54', 1, 0, '2022-10-11 18:57:02', '2022-10-11 18:02:06', NULL, NULL),
(6, 'admin', 'admin@gmail.com', 'dd25af7e2570f3e1ce8d41adb736a960b6bedb8acf0fc7b6cf4c827910b2aaf14fa6ff0682bc5e037443bad12438cfcdd1ce02a953b7700f99f6b1697236b6e2', 1, 0, '2023-03-21 16:23:52', '2023-03-10 19:17:04', '2023-03-10 19:17:04', '2023-03-10 19:17:04'),
(7, 'admin', 'admin@gmail.es', 'dd25af7e2570f3e1ce8d41adb736a960b6bedb8acf0fc7b6cf4c827910b2aaf14fa6ff0682bc5e037443bad12438cfcdd1ce02a953b7700f99f6b1697236b6e2', 1, 0, '2023-03-21 12:15:17', '2023-03-14 18:02:02', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carts`
--

CREATE TABLE `carts` (
  `id` int NOT NULL,
  `state` tinyint NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `send` decimal(10,2) NOT NULL,
  `date` datetime NOT NULL,
  `product_price` decimal(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `carts`
--

INSERT INTO `carts` (`id`, `state`, `user_id`, `product_id`, `quantity`, `discount`, `send`, `date`, `product_price`) VALUES
(17, 0, 3, 1, '1.00', '0.99', '1.99', '2023-03-21 15:23:50', '0.00'),
(18, 0, 3, 2, '1.00', '1.99', '2.99', '2023-03-21 16:23:35', '19.99');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config`
--

CREATE TABLE `config` (
  `id` int NOT NULL,
  `type` varchar(50) NOT NULL,
  `value` int NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `config`
--

INSERT INTO `config` (`id`, `type`, `value`, `description`) VALUES
(1, 'adminStatus', 0, 'Inactivo'),
(2, 'adminStatus', 1, 'Activo'),
(3, 'productType', 1, 'Curso en línea'),
(4, 'productType', 2, 'Libro'),
(5, 'productStatus', 0, 'Inactivo'),
(6, 'productStatus', 1, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE `payments` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `payments`
--

INSERT INTO `payments` (`id`, `name`) VALUES
(1, 'Tarjeta de crédito MasterCard'),
(2, 'Tarjeta de crédito Visa'),
(3, 'Tarjeta de débito'),
(4, 'Efectivo'),
(5, 'Paypal'),
(6, 'Bitcoins');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `type` char(1) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `name` varchar(200) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `send` decimal(10,2) NOT NULL,
  `image` varchar(100) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `published` date NOT NULL,
  `relation1` int NOT NULL,
  `relation2` int NOT NULL,
  `relation3` int NOT NULL,
  `mostSold` char(1) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `new` char(1) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `status` tinyint NOT NULL,
  `deleted` tinyint NOT NULL,
  `create_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `author` varchar(200) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `publisher` varchar(200) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `pages` int NOT NULL,
  `people` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `objetives` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `necesites` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `type`, `name`, `description`, `price`, `discount`, `send`, `image`, `published`, `relation1`, `relation2`, `relation3`, `mostSold`, `new`, `status`, `deleted`, `create_at`, `updated_at`, `deleted_at`, `author`, `publisher`, `pages`, `people`, `objetives`, `necesites`) VALUES
(1, '2', 'El nombre de la rosa', '&lt;p&gt;dfvsdfv jdfd &amp;nbsp;&amp;nbsp;&lt;strong&gt;kjdfh&lt;/strong&gt; kjf &lt;i&gt;jdjgk&lt;/i&gt; vjk&lt;/p&gt;', '9.99', '0.99', '1.99', '20150613-mac.jpg', '2022-10-19', 0, 0, 0, '1', '1', 0, 0, '2022-10-18 19:12:02', NULL, NULL, 'Pepe', 'Jos&eacute;', 100, '', '', ''),
(2, '2', 'El retorno del rey', '&lt;p&gt;dfvsdfv jdfd &amp;nbsp;&amp;nbsp;&lt;strong&gt;kjdfh&lt;/strong&gt; kjf &lt;i&gt;jdjgk&lt;/i&gt; vjk&lt;/p&gt;', '19.99', '1.99', '2.99', '20150627-mac.jpg', '2022-10-26', 0, 0, 0, '0', '1', 0, 0, '2022-10-18 19:16:16', '2022-10-19 17:38:33', NULL, 'Pepe', 'Jos&eacute;', 100, '', '', ''),
(3, '1', 'From zero to master in PHP', '&lt;p&gt;&lt;i&gt;Mejora hasta el infinito&lt;/i&gt; tus habilidades en &lt;strong&gt;PHP&lt;/strong&gt; y programaci&oacute;n orientada a objetos, &lt;strong&gt;POO&lt;/strong&gt;.&lt;/p&gt;&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod&lt;br&gt;tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,&lt;br&gt;quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo&lt;br&gt;consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse&lt;br&gt;cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non&lt;br&gt;proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod&lt;br&gt;tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,&lt;br&gt;quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo&lt;br&gt;consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse&lt;br&gt;cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non&lt;br&gt;proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;', '9.99', '0.99', '0.00', '20150711-mac.jpg', '2022-10-27', 0, 0, 0, '1', '1', 1, 0, '2022-10-20 14:23:44', '2022-10-20 14:25:24', NULL, 'Pepe', 'Jos&eacute;', 100, 'Novatos', 'Desde la nada al todo en PHP', 'Ganas, muchas ganas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `first_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `last_name_1` varchar(100) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `last_name_2` varchar(100) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `email` varchar(200) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `address` varchar(150) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `city` varchar(100) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `state` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `zipcode` varchar(10) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `country` varchar(100) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `password` varchar(200) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name_1`, `last_name_2`, `email`, `address`, `city`, `state`, `zipcode`, `country`, `password`) VALUES
(1, 'Pepe', 'Pérez', 'Sánchez', 'pepe@mail.es', 'c/ La suya 1', 'Murcia', 'Murcia', '30001', 'España', 'a69f16dbd2c154898e4bf453fd0694a11d429bc86972a26b521ffd9c2c84b9ca6253e0b10ae26c39d0d7b71f0eb973758f6b43eba1949fd9c4faaeeb18dd5b74'),
(2, 'Juan', 'García', 'Martínez', 'juan@juan.es', 'c/ La otra', 'Valencia', 'Valencia', '46001', 'España', '806cc6e9290ccac7e77a34f545b28fdf3c8a87dab0f144f3885b2411483e433df0a34d9d11355f20b74df86b9bbbe5dd95d4046be9430851b8fbdbc390dc8e54'),
(3, 'alumno', 'alumno', 'alumno', 'alumno@gmail.es', 'alumno', 'alumno', 'alumno', '30033', 'alumno', '8ce78deff63b81325864e5b9e32d2be49144759bb3a6adacdde8094cc7cd510efe13bc193d4b2ab5f97d79444cbaf4e130a4bd90d2460a152c7bda010daea2a6');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `config`
--
ALTER TABLE `config`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
