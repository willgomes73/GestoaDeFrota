-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23-Nov-2021 às 22:22
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `gestaofrota`
--
CREATE DATABASE IF NOT EXISTS `gestaofrota` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `gestaofrota`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `abastecimento`
--

DROP TABLE IF EXISTS `abastecimento`;
CREATE TABLE IF NOT EXISTS `abastecimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `placa` varchar(8) NOT NULL,
  `idCombustivel` int(11) NOT NULL,
  `km` float NOT NULL,
  `litros` float NOT NULL,
  `valorgasto` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `placa` (`placa`),
  KEY `idCombustivel` (`idCombustivel`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `abastecimento`
--

INSERT INTO `abastecimento` (`id`, `data`, `placa`, `idCombustivel`, `km`, `litros`, `valorgasto`) VALUES
(1, '2021-05-10', 'YUH-3452', 7, 68587, 15, '100.00'),
(2, '2021-05-13', 'ABC-1234', 4, 68895, 60, '150.00'),
(7, '2021-06-03', 'ABC-1234', 4, 87010, 15, '210.00'),
(8, '2021-06-06', 'ABC-1234', 4, 87350, 15, '210.00'),
(9, '2021-06-09', 'ABC-1234', 4, 87556, 15, '210.56'),
(10, '2021-06-01', 'BCD-2345', 4, 50345, 35, '187.00'),
(11, '2021-06-03', 'BCD-2345', 4, 50685, 35, '187.00'),
(12, '2021-06-06', 'BCD-2345', 4, 51285, 35, '187.00'),
(13, '2021-05-13', 'ABC-1234', 4, 87856, 60, '150.00'),
(16, '2021-06-15', 'PPP-0123', 4, 100000, 20, '200.00'),
(18, '2021-06-15', 'ABC-1234', 8, 345678, 30, '250.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `combustivel`
--

DROP TABLE IF EXISTS `combustivel`;
CREATE TABLE IF NOT EXISTS `combustivel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `combustivel`
--

INSERT INTO `combustivel` (`id`, `nome`) VALUES
(4, 'Gasolina'),
(5, 'Etanol'),
(6, 'GNV'),
(7, 'DIESEL S50'),
(8, 'Premium');

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
CREATE TABLE IF NOT EXISTS `veiculo` (
  `placa` varchar(8) NOT NULL,
  `modelo` varchar(15) NOT NULL,
  `fabricante` varchar(15) NOT NULL,
  `ano` int(11) NOT NULL,
  `cor` varchar(15) NOT NULL,
  PRIMARY KEY (`placa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `veiculo`
--

INSERT INTO `veiculo` (`placa`, `modelo`, `fabricante`, `ano`, `cor`) VALUES
('ABC-1234', 'CORSA', 'GM', 2000, 'PRATA'),
('BCD-2345', 'MONZA', 'GM', 2010, 'VERMELHO'),
('iii-0000', 'PONTIAC', 'GM', 2021, 'Preto'),
('PPP-0123', 'PONTIAC', 'GM', 2011, 'PRATA'),
('YUH-3452', 'A3', 'AUDI', 2018, 'vermelho');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `abastecimento`
--
ALTER TABLE `abastecimento`
  ADD CONSTRAINT `abastecimento_ibfk_1` FOREIGN KEY (`placa`) REFERENCES `veiculo` (`placa`),
  ADD CONSTRAINT `abastecimento_ibfk_2` FOREIGN KEY (`idCombustivel`) REFERENCES `combustivel` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
