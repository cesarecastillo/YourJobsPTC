-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2024 at 10:35 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yourjob_db`
--
CREATE DATABASE IF NOT EXISTS `yourjob_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `yourjob_db`;

-- --------------------------------------------------------

--
-- Table structure for table `administradores`
--

CREATE TABLE `administradores` (
  `Id_Admin` int(11) NOT NULL,
  `Usuario` varchar(50) NOT NULL,
  `Password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `administradores`
--

INSERT INTO `administradores` (`Id_Admin`, `Usuario`, `Password`) VALUES
(1, 'administrador@santacecilia.edu.sv', 'ZA9GIqGme/mu7CLxC1fQhQ==');

-- --------------------------------------------------------

--
-- Table structure for table `empresas`
--

CREATE TABLE `empresas` (
  `Id_Empresa` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  `Contraseña` varchar(256) NOT NULL,
  `ActividadEconomica` varchar(50) NOT NULL,
  `Pais` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `empresas`
--

INSERT INTO `empresas` (`Id_Empresa`, `Nombre`, `Email`, `Telefono`, `Contraseña`, `ActividadEconomica`, `Pais`) VALUES
(1, 'Company Inc', 'info@company.com', '1234567890', 'encrypted_password_here', 'Technology', 'USA'),
(12, 'Electronic Arts', 'brandonzelaya1@gmail.com', '123123123123', 'zZ787sele/5CLAo2GWjfVg==', 'CallCenter', 'San Salvador'),
(13, 'Tigo1', 'tigo3@gmail.com', '123123123123', 'zZ787sele/5CLAo2GWjfVg==', 'CallCenter', 'San Vicente'),
(14, 'Electronic Arts', 'tig21|2o@gmail.com', '123123123123', 'Id2JPdD1tm03M2rXD2p8RA==', 'CallCenter', 'San Salvador');

-- --------------------------------------------------------

--
-- Table structure for table `joboffers`
--

CREATE TABLE `joboffers` (
  `Id` int(11) NOT NULL,
  `PositionAppliedFor` varchar(255) NOT NULL,
  `PositionsVacancies` int(11) NOT NULL,
  `ExperienceLevel` varchar(50) NOT NULL,
  `Salary` varchar(50) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `OfferDetails` text NOT NULL,
  `PhotoUrl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `joboffers`
--

INSERT INTO `joboffers` (`Id`, `PositionAppliedFor`, `PositionsVacancies`, `ExperienceLevel`, `Salary`, `Location`, `OfferDetails`, `PhotoUrl`) VALUES
(2, 'Programmer', 1, 'One Million', '1000 dollars', 'Ingles', 'i dont asl', NULL),
(3, 'Creative', 1, 'One Million 2', '10003 dollars', 'Ingles', 'i dont3333', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id_language` int(11) NOT NULL,
  `resume_id` int(10) NOT NULL,
  `language` varchar(50) NOT NULL,
  `level` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `resume`
--

CREATE TABLE `resume` (
  `id_resume` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phone` varchar(8) NOT NULL,
  `marital_status` varchar(50) NOT NULL,
  `work_experience` text NOT NULL,
  `education` varchar(60) NOT NULL,
  `field_of_study` varchar(60) NOT NULL,
  `sector` varchar(60) NOT NULL,
  `skills` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `civil_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resume`
--

INSERT INTO `resume` (`id_resume`, `user_id`, `phone`, `marital_status`, `work_experience`, `education`, `field_of_study`, `sector`, `skills`, `photo`, `nationality`, `civil_status`) VALUES
(3, 1, '23232342', '', 'ASASASDASD', 'Bachiller', 'Ciencias', 'Salud', 'ADSASDASD', '~/Images/Untitled Project.jpg', 'Honduras', 'Soltero/a'),
(4, 1, '23232312', '', 'ASASASDASD', 'Bachiller', 'Ciencias', 'Salud', 'ADSASDASD', '~/Images/1920x1080-px-cityscape-1220148-wallhere.com.jpg', 'Honduras', 'Soltero/a'),
(5, 2, '12321312', '', 'Donador de Organos', 'Bachiller', 'Ingeniería', 'Servicios', 'C# PhP ', '~/Images/Untitled Project.jpg', 'El Salvador', 'Viudo/a');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `Id_Usuario` int(11) NOT NULL,
  `Nombre_Usuario` varchar(50) NOT NULL,
  `Apellido_Usuario` varchar(50) NOT NULL,
  `Genero` enum('male','female') NOT NULL,
  `Password` varchar(256) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Edad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`Id_Usuario`, `Nombre_Usuario`, `Apellido_Usuario`, `Genero`, `Password`, `Correo`, `Edad`) VALUES
(1, 'Brandon', 'Zelaya', 'male', 'ObuwLGEZqoxiZJDFM4o98g==', 'brandonzelaya241@gmail.com', 33),
(2, 'Cesar', 'Castillo', 'female', 'ObuwLGEZqoxiZJDFM4o98g==', 'cesar@gmail.com', 33);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios_resume`
--

CREATE TABLE `usuarios_resume` (
  `Id_Usuario` int(11) NOT NULL,
  `Nombre_Usuario` varchar(50) NOT NULL,
  `Apellido_Usuario` varchar(50) NOT NULL,
  `Genero` enum('male','female') NOT NULL,
  `Password` varchar(256) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `phone` varchar(8) NOT NULL,
  `work_experience` text NOT NULL,
  `education` varchar(60) NOT NULL,
  `skills` text NOT NULL,
  `mastered_languages` varchar(300) NOT NULL,
  `photo` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuarios_resume`
--

INSERT INTO `usuarios_resume` (`Id_Usuario`, `Nombre_Usuario`, `Apellido_Usuario`, `Genero`, `Password`, `Correo`, `phone`, `work_experience`, `education`, `skills`, `mastered_languages`, `photo`) VALUES
(1, 'John', 'Doe', 'male', 'encrypted_password', 'john.doe@example.com', '12345678', '5 años de experiencia en desarrollo de software\n2 años en gestión de proyectos', 'Licenciado en Ciencias de la Computación', 'C#, ASP.NET, SQL, JavaScript', 'Inglés, Español', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`Id_Admin`),
  ADD UNIQUE KEY `Usuario` (`Usuario`);

--
-- Indexes for table `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`Id_Empresa`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `joboffers`
--
ALTER TABLE `joboffers`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id_language`),
  ADD KEY `resume_id` (`resume_id`);

--
-- Indexes for table `resume`
--
ALTER TABLE `resume`
  ADD PRIMARY KEY (`id_resume`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Id_Usuario`),
  ADD UNIQUE KEY `Correo` (`Correo`);

--
-- Indexes for table `usuarios_resume`
--
ALTER TABLE `usuarios_resume`
  ADD PRIMARY KEY (`Id_Usuario`),
  ADD UNIQUE KEY `Correo` (`Correo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administradores`
--
ALTER TABLE `administradores`
  MODIFY `Id_Admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `empresas`
--
ALTER TABLE `empresas`
  MODIFY `Id_Empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `joboffers`
--
ALTER TABLE `joboffers`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id_language` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resume`
--
ALTER TABLE `resume`
  MODIFY `id_resume` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usuarios_resume`
--
ALTER TABLE `usuarios_resume`
  MODIFY `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `languages`
--
ALTER TABLE `languages`
  ADD CONSTRAINT `languages_ibfk_1` FOREIGN KEY (`resume_id`) REFERENCES `resume` (`id_resume`);

--
-- Constraints for table `resume`
--
ALTER TABLE `resume`
  ADD CONSTRAINT `resume_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`Id_Usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
