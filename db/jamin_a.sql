-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 13 nov 2024 om 21:42
-- Serverversie: 8.2.0
-- PHP-versie: 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jamin_a`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `spGetAllergenenByProductId`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetAllergenenByProductId` (IN `productId` INT)   BEGIN
    SELECT a.Naam, a.Omschrijving
    FROM Allergenen a
    INNER JOIN ProductAllergenen pa ON a.Id = pa.AllergeenId
    WHERE pa.ProductId = productId
    ORDER BY a.Naam ASC;
END$$

DROP PROCEDURE IF EXISTS `spGetLeveringByProductId`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetLeveringByProductId` (IN `productId` MEDIUMINT)   BEGIN
    SELECT LeverancierNaam, Contactpersoon, Leveranciernummer, Mobiel, LeveringsDatum, VerwachteLeveringsDatum, Aantal
    FROM Levering
    WHERE ProductId = productId
    ORDER BY LeveringsDatum ASC;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `allergeen`
--

DROP TABLE IF EXISTS `allergeen`;
CREATE TABLE IF NOT EXISTS `allergeen` (
  `Id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Naam` varchar(255) NOT NULL,
  `Omschrijving` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `allergeen`
--

INSERT INTO `allergeen` (`Id`, `Naam`, `Omschrijving`) VALUES
(1, 'Gluten', 'Dit product bevat gluten'),
(2, 'Gelatine', 'Dit product bevat gelatine'),
(3, 'AZO-Kleurstof', 'Dit product bevat AZO-kleurstoffen'),
(4, 'Lactose', 'Dit product bevat lactose'),
(5, 'Soja', 'Dit product bevat soja'),
(21, 'Gluten', 'Dit product bevat gluten'),
(22, 'Gelatine', 'Dit product bevat gelatine'),
(23, 'AZO-Kleurstof', 'Dit product bevat AZO-kleurstoffen'),
(24, 'Lactose', 'Dit product bevat lactose'),
(25, 'Soja', 'Dit product bevat soja'),
(26, 'Gluten', 'Dit product bevat gluten'),
(27, 'Gelatine', 'Dit product bevat gelatine'),
(28, 'AZO-Kleurstof', 'Dit product bevat AZO-kleurstoffen'),
(29, 'Lactose', 'Dit product bevat lactose'),
(30, 'Soja', 'Dit product bevat soja');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `allergenen`
--

DROP TABLE IF EXISTS `allergenen`;
CREATE TABLE IF NOT EXISTS `allergenen` (
  `Id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Naam` varchar(255) NOT NULL,
  `Omschrijving` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `allergenen`
--

INSERT INTO `allergenen` (`Id`, `Naam`, `Omschrijving`) VALUES
(1, 'Gluten', 'Gluten is een eiwit dat voorkomt in tarwe, gerst en rogge.'),
(2, 'Noten', 'Noten zijn een veelvoorkomende oorzaak van allergische reacties.'),
(3, 'Lactose', 'Lactose is een suiker die voorkomt in melk en zuivelproducten.'),
(4, 'Gluten', 'Gluten is een eiwit dat voorkomt in tarwe, gerst en rogge.'),
(5, 'Noten', 'Noten zijn een veelvoorkomende oorzaak van allergische reacties.'),
(6, 'Lactose', 'Lactose is een suiker die voorkomt in melk en zuivelproducten.'),
(7, 'Gluten', 'Gluten is een eiwit dat voorkomt in tarwe, gerst en rogge.'),
(8, 'Noten', 'Noten zijn een veelvoorkomende oorzaak van allergische reacties.'),
(9, 'Lactose', 'Lactose is een suiker die voorkomt in melk en zuivelproducten.'),
(10, 'Gluten', 'Gluten is een eiwit dat voorkomt in tarwe, gerst en rogge.'),
(11, 'Noten', 'Noten zijn een veelvoorkomende oorzaak van allergische reacties.'),
(12, 'Lactose', 'Lactose is een suiker die voorkomt in melk en zuivelproducten.'),
(13, 'Gluten', 'Gluten is een eiwit dat voorkomt in tarwe, gerst en rogge.'),
(14, 'Noten', 'Noten zijn een veelvoorkomende oorzaak van allergische reacties.'),
(15, 'Lactose', 'Lactose is een suiker die voorkomt in melk en zuivelproducten.');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `Id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` varchar(250) NOT NULL,
  `CapitalCity` varchar(250) NOT NULL,
  `Continent` varchar(250) NOT NULL,
  `Population` int UNSIGNED NOT NULL,
  `Zipcode` varchar(6) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(255) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `country`
--

INSERT INTO `country` (`Id`, `Name`, `CapitalCity`, `Continent`, `Population`, `Zipcode`, `IsActief`, `Opmerkingen`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 'Tanzania', 'Dodoma', 'Afrika', 63590000, '1234SD', b'1', NULL, '2024-11-13 19:45:05.101667', '2024-11-13 19:45:05.101669'),
(2, 'Japan', 'Tokio', 'Azi&euml;', 125700000, '2354RR', b'1', NULL, '2024-11-13 19:45:05.101755', '2024-11-13 19:45:05.101755'),
(3, 'Zwitserlandd', 'Bern', 'Europa', 8703000, '3267AS', b'1', NULL, '2024-11-13 19:45:05.101765', '2024-11-13 19:45:05.101765'),
(4, 'Noorwegen', 'Oslo', 'Europa', 5550203, '8967DD', b'1', NULL, '2024-11-13 19:45:05.101768', '2024-11-13 19:45:05.101768'),
(5, 'Litouwen', 'Vilnius', 'Europa', 340000000, '4376WS', b'1', NULL, '2024-11-13 19:45:05.101771', '2024-11-13 19:45:05.101771'),
(6, 'Marokko', 'Rabat', 'Afrika', 37500000, '2982ER', b'1', NULL, '2024-11-13 19:45:05.101774', '2024-11-13 19:45:05.101774'),
(7, 'Nepal', 'Kathmandu', 'Azi&euml;', 30000000, '3925DF', b'1', NULL, '2024-11-13 19:45:05.101777', '2024-11-13 19:45:05.101777'),
(8, 'Chili', 'Santiago', 'Zuid-Amerika', 18276870, '2300SD', b'1', NULL, '2024-11-13 19:45:05.101779', '2024-11-13 19:45:05.101779');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `leverancier`
--

DROP TABLE IF EXISTS `leverancier`;
CREATE TABLE IF NOT EXISTS `leverancier` (
  `Id` int NOT NULL,
  `Naam` varchar(50) DEFAULT NULL,
  `ContactPersoon` varchar(50) DEFAULT NULL,
  `LeverancierNummer` varchar(20) DEFAULT NULL,
  `Mobiel` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `leverancier`
--

INSERT INTO `leverancier` (`Id`, `Naam`, `ContactPersoon`, `LeverancierNummer`, `Mobiel`) VALUES
(1, 'Venco', 'Bert van Linge', 'L1029384719', '06-28493827'),
(2, 'Astra Sweets', 'Jasper del Monte', 'L1029284315', '06-39398734'),
(3, 'Haribo', 'Sven Stalman', 'L1029324748', '06-24383291'),
(4, 'Basset', 'Joyce Stelterberg', 'L1023845773', '06-48293823'),
(5, 'De Bron', 'Remco Veenstra', 'L1023857736', '06-34291234');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `levering`
--

DROP TABLE IF EXISTS `levering`;
CREATE TABLE IF NOT EXISTS `levering` (
  `Id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ProductId` mediumint UNSIGNED NOT NULL,
  `LeverancierNaam` varchar(255) NOT NULL,
  `Contactpersoon` varchar(255) NOT NULL,
  `Leveranciernummer` varchar(50) NOT NULL,
  `Mobiel` varchar(15) NOT NULL,
  `LeveringsDatum` datetime NOT NULL,
  `VerwachteLeveringsDatum` datetime NOT NULL,
  `Aantal` int UNSIGNED NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `ProductId` (`ProductId`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `levering`
--

INSERT INTO `levering` (`Id`, `ProductId`, `LeverancierNaam`, `Contactpersoon`, `Leveranciernummer`, `Mobiel`, `LeveringsDatum`, `VerwachteLeveringsDatum`, `Aantal`) VALUES
(1, 1, 'Leverancier A', 'Jan Jansen', '12345', '0612345678', '2023-10-01 10:00:00', '2023-10-05 10:00:00', 100),
(2, 2, 'Leverancier B', 'Piet Pietersen', '67890', '0687654321', '2023-10-02 11:00:00', '2023-10-06 11:00:00', 200),
(3, 3, 'Leverancier C', 'Klaas Klaassen', '54321', '0611122233', '2023-10-03 12:00:00', '2023-10-07 12:00:00', 150),
(4, 4, 'Leverancier D', 'Henk Henkens', '98765', '0698765432', '2023-10-04 13:00:00', '2023-10-08 13:00:00', 250),
(5, 5, 'Leverancier E', 'Wim Wimmers', '11223', '0612345679', '2023-10-05 14:00:00', '2023-10-09 14:00:00', 300);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `magazijn`
--

DROP TABLE IF EXISTS `magazijn`;
CREATE TABLE IF NOT EXISTS `magazijn` (
  `Id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ProductId` mediumint UNSIGNED NOT NULL,
  `VerpakkingsEenheid` decimal(4,1) NOT NULL,
  `AantalAanwezig` smallint UNSIGNED NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(255) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Magazijn_ProductId_Product_Id` (`ProductId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `magazijn`
--

INSERT INTO `magazijn` (`Id`, `ProductId`, `VerpakkingsEenheid`, `AantalAanwezig`, `IsActief`, `Opmerkingen`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 1, 5.0, 453, b'1', NULL, '2024-11-13 19:45:05.221871', '2024-11-13 19:45:05.221873'),
(2, 2, 2.5, 400, b'1', NULL, '2024-11-13 19:45:05.221934', '2024-11-13 19:45:05.221934'),
(3, 3, 5.0, 1, b'1', NULL, '2024-11-13 19:45:05.221945', '2024-11-13 19:45:05.221946'),
(4, 4, 1.0, 800, b'1', NULL, '2024-11-13 19:45:05.221950', '2024-11-13 19:45:05.221950'),
(5, 5, 3.0, 234, b'1', NULL, '2024-11-13 19:45:05.221955', '2024-11-13 19:45:05.221955'),
(6, 6, 2.0, 345, b'1', NULL, '2024-11-13 19:45:05.221959', '2024-11-13 19:45:05.221959'),
(7, 7, 1.0, 795, b'1', NULL, '2024-11-13 19:45:05.221963', '2024-11-13 19:45:05.221963'),
(8, 8, 10.0, 233, b'1', NULL, '2024-11-13 19:45:05.221967', '2024-11-13 19:45:05.221967'),
(9, 9, 2.5, 123, b'1', NULL, '2024-11-13 19:45:05.221972', '2024-11-13 19:45:05.221972'),
(10, 10, 3.0, 0, b'1', NULL, '2024-11-13 19:45:05.221976', '2024-11-13 19:45:05.221976'),
(11, 11, 2.0, 367, b'1', NULL, '2024-11-13 19:45:05.221980', '2024-11-13 19:45:05.221980'),
(12, 12, 1.0, 467, b'1', NULL, '2024-11-13 19:45:05.221985', '2024-11-13 19:45:05.221985'),
(13, 13, 5.0, 20, b'1', NULL, '2024-11-13 19:45:05.221989', '2024-11-13 19:45:05.221989');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `Id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `Naam` varchar(255) NOT NULL,
  `Barcode` varchar(13) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(255) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `product`
--

INSERT INTO `product` (`Id`, `Naam`, `Barcode`, `IsActief`, `Opmerkingen`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 'Mintnopjes', '8719587231278', b'1', NULL, '2024-11-13 19:45:05.163275', '2024-11-13 19:45:05.163277'),
(2, 'Schoolkrijt', '8719587326713', b'1', NULL, '2024-11-13 19:45:05.163331', '2024-11-13 19:45:05.163332'),
(3, 'Honingdrop', '8719587327836', b'1', NULL, '2024-11-13 19:45:05.163341', '2024-11-13 19:45:05.163341'),
(4, 'Zure Beren', '8719587321441', b'1', NULL, '2024-11-13 19:45:05.163343', '2024-11-13 19:45:05.163343'),
(5, 'Cola Flesjes', '8719587321237', b'1', NULL, '2024-11-13 19:45:05.163346', '2024-11-13 19:45:05.163346'),
(6, 'Turtles', '8719587322245', b'1', NULL, '2024-11-13 19:45:05.163348', '2024-11-13 19:45:05.163348'),
(7, 'Witte Muizen', '8719587328256', b'1', NULL, '2024-11-13 19:45:05.163350', '2024-11-13 19:45:05.163350'),
(8, 'Reuzen Slangen', '8719587325641', b'1', NULL, '2024-11-13 19:45:05.163352', '2024-11-13 19:45:05.163353'),
(9, 'Zoute Rijen', '8719587322739', b'1', NULL, '2024-11-13 19:45:05.163355', '2024-11-13 19:45:05.163355'),
(10, 'Winegums', '8719587327527', b'1', NULL, '2024-11-13 19:45:05.163357', '2024-11-13 19:45:05.163357'),
(11, 'Drop Munten', '8719587322345', b'1', NULL, '2024-11-13 19:45:05.163359', '2024-11-13 19:45:05.163360'),
(12, 'Kruis Drop', '8719587322265', b'1', NULL, '2024-11-13 19:45:05.163364', '2024-11-13 19:45:05.163364'),
(13, 'Zoute Ruitjes', '8719587323256', b'1', NULL, '2024-11-13 19:45:05.163367', '2024-11-13 19:45:05.163367'),
(14, 'Zoute Ruitjes', '8719587323256', b'1', NULL, '2024-11-13 22:30:12.678564', '2024-11-13 22:30:12.678567');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `productallergeen`
--

DROP TABLE IF EXISTS `productallergeen`;
CREATE TABLE IF NOT EXISTS `productallergeen` (
  `Id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ProductId` mediumint UNSIGNED NOT NULL,
  `AllergeenId` int UNSIGNED NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `ProductId` (`ProductId`),
  KEY `AllergeenId` (`AllergeenId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `productallergeen`
--

INSERT INTO `productallergeen` (`Id`, `ProductId`, `AllergeenId`) VALUES
(1, 9, 1),
(2, 9, 2);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `productallergenen`
--

DROP TABLE IF EXISTS `productallergenen`;
CREATE TABLE IF NOT EXISTS `productallergenen` (
  `Id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ProductId` mediumint UNSIGNED NOT NULL,
  `AllergeenId` int UNSIGNED NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `ProductId` (`ProductId`),
  KEY `AllergeenId` (`AllergeenId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `productallergenen`
--

INSERT INTO `productallergenen` (`Id`, `ProductId`, `AllergeenId`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `productperallergeen`
--

DROP TABLE IF EXISTS `productperallergeen`;
CREATE TABLE IF NOT EXISTS `productperallergeen` (
  `Id` int NOT NULL,
  `ProductId` int DEFAULT NULL,
  `AllergeenId` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `productperallergeen`
--

INSERT INTO `productperallergeen` (`Id`, `ProductId`, `AllergeenId`) VALUES
(1, 1, 2),
(2, 1, 1),
(3, 1, 3),
(4, 3, 4),
(5, 6, 5),
(6, 9, 2),
(7, 9, 5),
(8, 10, 2),
(9, 12, 4),
(10, 13, 1),
(11, 13, 4),
(12, 13, 5);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `productperleverancier`
--

DROP TABLE IF EXISTS `productperleverancier`;
CREATE TABLE IF NOT EXISTS `productperleverancier` (
  `Id` int NOT NULL,
  `LeverancierId` int DEFAULT NULL,
  `ProductId` int DEFAULT NULL,
  `DatumLevering` date DEFAULT NULL,
  `Aantal` int DEFAULT NULL,
  `DatumEerstVolgendeLevering` date DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `productperleverancier`
--

INSERT INTO `productperleverancier` (`Id`, `LeverancierId`, `ProductId`, `DatumLevering`, `Aantal`, `DatumEerstVolgendeLevering`) VALUES
(1, 1, 1, '2024-10-09', 23, '2024-10-16'),
(2, 1, 1, '2024-10-18', 21, '2024-10-25'),
(3, 1, 2, '2024-10-09', 12, '2024-10-16'),
(4, 1, 3, '2024-10-10', 11, '2024-10-17'),
(5, 2, 4, '2024-10-14', 16, '2024-10-21'),
(6, 2, 4, '2024-10-21', 23, '2024-10-28'),
(7, 2, 5, '2024-10-14', 45, '2024-10-21'),
(8, 2, 6, '2024-10-14', 30, '2024-10-21'),
(9, 3, 7, '2024-10-12', 12, '2024-10-19'),
(10, 3, 7, '2024-10-19', 23, '2024-10-26'),
(11, 3, 8, '2024-10-10', 12, '2024-10-17'),
(12, 3, 9, '2024-10-11', 1, '2024-10-18'),
(13, 4, 10, '2024-10-16', 24, '2024-10-30'),
(14, 5, 11, '2024-10-10', 47, '2024-10-17'),
(15, 5, 11, '2024-10-19', 60, '2024-10-26'),
(16, 5, 12, '2024-10-11', 45, NULL),
(17, 5, 13, '2024-10-12', 23, NULL);

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `magazijn`
--
ALTER TABLE `magazijn`
  ADD CONSTRAINT `FK_Magazijn_ProductId_Product_Id` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`);

--
-- Beperkingen voor tabel `productallergenen`
--
ALTER TABLE `productallergenen`
  ADD CONSTRAINT `productallergenen_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`),
  ADD CONSTRAINT `productallergenen_ibfk_2` FOREIGN KEY (`AllergeenId`) REFERENCES `allergenen` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
