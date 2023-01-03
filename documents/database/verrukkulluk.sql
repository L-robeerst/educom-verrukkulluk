-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2023 at 11:21 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `verrukkulluk`
--

-- --------------------------------------------------------

--
-- Table structure for table `artikel`
--

CREATE TABLE `artikel` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `omschrijving` text NOT NULL,
  `prijs` float NOT NULL,
  `eenheid` varchar(20) NOT NULL,
  `verpakking` float NOT NULL,
  `afbeelding` text NOT NULL,
  `calorien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artikel`
--

INSERT INTO `artikel` (`id`, `naam`, `omschrijving`, `prijs`, `eenheid`, `verpakking`, `afbeelding`, `calorien`) VALUES
(1, 'knoflook', 'een bol knoflook', 0.7, 'teentjes', 15, 'http://localhost/educom-verrukkulluk/assets/img/artikelen/knoflook.png', 100),
(2, 'ansjovis', 'een klein hartig  en zout visje ingelegd in olie', 2.8, 'ansjovis filet', 8, 'http://localhost/educom-verrukkulluk/assets/img/artikelen/ansjovis.png', 200),
(3, 'zwarte olijven', 'zwarte olijven in olie', 0.8, 'g', 140, 'http://localhost/educom-verrukkulluk/assets/img/artikelen/zwarte_olijven.png', 144),
(4, 'kappertjes', 'ingelegde kappertjes', 0.8, 'el', 10, 'http://localhost/educom-verrukkulluk/assets/img/artikelen/kappertjes.png', 45),
(5, 'tomatenblokjes', 'tomatenblokjes in sap', 0.7, 'g', 400, 'http://localhost/educom-verrukkulluk/assets/img/artikelen/tomatenblokjes.png', 92),
(6, 'spaghetti', 'gedroogde pasta slierten', 1.1, 'g', 1000, 'http://localhost/educom-verrukkulluk/assets/img/artikelen/spaghetti.png', 1400),
(7, 'italiaanse kruiden', 'Mix van kruiden en zwarte peper.', 3, 'g', 32, 'http://localhost/educom-verrukkulluk/assets/img/artikelen/italiaanse_kruiden.png', 10),
(8, 'rundergehakt', 'Gehakt/Rundvleesbereiding', 5.3, 'g', 500, 'http://localhost/educom-verrukkulluk/assets/img/artikelen/rundergehakt.png', 1215),
(9, 'bolognese kruiden', 'een potje met bolognese kruiden', 3.3, 'g', 68, 'http://localhost/educom-verrukkulluk/assets/img/artikelen/bolognese_kruiden.png', 50),
(10, 'hamburgerbroodjes', 'Wit tarwebroodje gedecoreerd met sesamzaad', 1.9, 'broodje(s)', 6, 'http://localhost/educom-verrukkulluk/assets/img/artikelen/hamburgerbroodjes.png', 285),
(11, 'guacamolepakket', 'Maak simpel en snel een heerlijke verse guacamole met dit EAT ME guacamolepakket. Alle benodigde ingrediënten zitten in het pakket en achterop de verpakking vind je de bereidingswijze.', 2.4, 'doos', 1, 'http://localhost/educom-verrukkulluk/assets/img/artikelen/guacamolepakket.png', 300),
(12, 'vegetarische hamburger', 'Veganistische burger op basis van soja en tarwe, verrijkt met vitamine B12. Bron van ijzer en rijk aan eiwitten.', 5.5, 'burgers', 2, 'http://localhost/educom-verrukkulluk/assets/img/artikelen/vegetarische_hamburger.png', 520);

-- --------------------------------------------------------

--
-- Table structure for table `boodschappenlijst`
--

CREATE TABLE `boodschappenlijst` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `artikel_id` int(11) NOT NULL,
  `aantal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gerecht`
--

CREATE TABLE `gerecht` (
  `id` int(11) NOT NULL,
  `keuken_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `datum_toegevoegd` date NOT NULL,
  `titel` varchar(60) NOT NULL,
  `korte_omschrijving` tinytext NOT NULL,
  `lange_omschrijving` text NOT NULL,
  `afbeelding` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gerecht`
--

INSERT INTO `gerecht` (`id`, `keuken_id`, `type_id`, `user_id`, `datum_toegevoegd`, `titel`, `korte_omschrijving`, `lange_omschrijving`, `afbeelding`) VALUES
(1, 1, 4, 1, '2022-12-21', 'Spaghetti alla puttanesca', 'Een heerlijke klassieke Italiaanse pasta op basis van tomatensaus, kappertjes, ansjovis en olijven. Deze pasta is de definitie van groter dan de som van zijn delen ', 'Spaghetti alla puttanesca is een pasta met een ietwat opvallende naam. ‘Puttana’ betekent in het Italiaans namelijk prostituee. Er zijn talloos veel verhalen over de oorsprong van dit gerecht, maar tot op heden is het eigenlijk niet duidelijk waar -ie precies vandaan komt. Het enige wat vrijwel zeker is, is dat de pasta is ontstaan in de rosse buurt van Rome. Maakten de dames van lichte zeden dit gerecht voor zichzelf, of voor iemand anders? Of waren de ingrediënten een verwijzing naar de vrouwen: vurig, pittig en intens?\r\n\r\nDe pasta is hoe dan ook spicy, hoog op smaak en, ja: lekker intens. Dit Italiaanse maaltje is briljant in zijn eenvoud: met blokjes tomaat, goede olijfolie, ansjovisfilets, smaakvolle olijven, kappertjes, chilivlokken en lekker veel knoflook.', 'http://localhost/educom-verrukkulluk/assets/img/gerechten/putanesca.jpg'),
(2, 1, 5, 2, '2022-10-07', 'Spaghetti met tomaten-gehaktsaus', 'Een kidsproof recept voor spaghetti! Het lijkt alsof er geen groenten in zitten, maar je kunt de groenten gewoon pureren. Simpel, maar zo lekker!', 'Een kidsproof recept voor spaghetti! Het lijkt alsof er geen groenten in zitten, maar je kunt de groenten gewoon pureren. Simpel, maar zo lekker.\r\n\r\nEen kidsproof recept voor spaghetti! Het lijkt alsof er geen groenten in zitten, maar je kunt de groenten gewoon pureren. Simpel, maar zo lekker\r\n\r\nHeb dit twee keer geschreven omdat ik niet weet hoe ik in het lang spaghetti met tomatensaus moet beschrijven', 'http://localhost/educom-verrukkulluk/assets/img/gerechten/spaghetti_tomaat.jpeg'),
(3, 2, 5, 3, '2021-08-06', 'Een simpele hamburger', 'Een hamburger is een schijf gebakken of gegrild gemalen vlees, meestal rundergehakt. Vaak wordt \'hamburger\' ook als pars pro toto gebruikt voor een broodje dat met deze schijf belegd is.', 'Een hamburger is een schijf gebakken of gegrild gemalen vlees, meestal rundergehakt. Vaak wordt \'hamburger\' ook als pars pro toto gebruikt voor een broodje dat met deze schijf belegd is. Ook wordt informeel de term \'burger\' gebruikt. Vaak worden sla, tomaat, ui, spek, ei, augurken en kaas aan toegevoegd en sauzen als mosterd, mayonaise, ketchup of chilisaus. De hamburger wordt gebakken op een bakplaat, in een pan of op een grill of barbecue. Dit gerecht kent verschillende nationale en regionale varianten.\nEen hamburger is een schijf gebakken of gegrild gemalen vlees, meestal rundergehakt. Vaak wordt \'hamburger\' ook als pars pro toto gebruikt voor een broodje dat met deze schijf belegd is. Ook wordt informeel de term \'burger\' gebruikt. Vaak worden sla, tomaat, ui, spek, ei, augurken en kaas aan toegevoegd en sauzen als mosterd, mayonaise, ketchup of chilisaus. De hamburger wordt gebakken op een bakplaat, in een pan of op een grill of barbecue. Dit gerecht kent verschillende nationale en regionale varianten.\n2 keer want is hamburger', 'http://localhost/educom-verrukkulluk/assets/img/gerechten/hamburger.jpeg'),
(4, 3, 4, 4, '2022-07-28', 'Vegan burgers met guacamole', 'een lekker vegetarisch alternatief op de klassieke hamburger', 'Een tijdje geleden at ik een hele lekkere vega burger. Ik besloot het recept nog eens te maken en met jullie te delen. Deze vega burger met guacamole is in ongeveer 20 minuten klaar en een echte aanrader!\r\nEen tijdje geleden at ik een hele lekkere vega burger. Ik besloot het recept nog eens te maken en met jullie te delen. Deze vega burger met guacamole is in ongeveer 20 minuten klaar en een echte aanrader!\r\n2 keer voor de lengte', 'http://localhost/educom-verrukkulluk/assets/img/gerechten/vega_burger.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `gerecht_info`
--

CREATE TABLE `gerecht_info` (
  `id` int(11) NOT NULL,
  `record_type` varchar(1) NOT NULL,
  `gerecht_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `datum` date NOT NULL,
  `nummeriekveld` float DEFAULT NULL,
  `tekstveld` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gerecht_info`
--

INSERT INTO `gerecht_info` (`id`, `record_type`, `gerecht_id`, `user_id`, `datum`, `nummeriekveld`, `tekstveld`) VALUES
(1, 'b', 1, NULL, '0000-00-00', 1, 'Doe wat olie samen met de knoflook in een grote hapjespan. Zet op laag vuur en laat 5 minuten opwarmen.'),
(2, 'b', 1, NULL, '0000-00-00', 2, 'Voeg de ansjovisfilets toe, draai het vuur iets hoger en laat ze smelten in de pan. Voeg de olijven en kappertjes toe en bak ze 5 minuten op middelhoog vuur mee.'),
(3, 'b', 1, NULL, '0000-00-00', 3, 'Doe de tomaatblokjes erbij en breng het geheel op hoog vuur aan de kook. Draai het vuur helemaal omlaag en laat de puttanescasaus 10-15 minuten pruttelen.'),
(4, 'b', 1, NULL, '0000-00-00', 4, 'Kook intussen de spaghetti volgens de aanwijzingen op het pak net beetgaar in gezouten water. Giet de pasta af en vang daarbij wat van het kookwater op.'),
(5, 'b', 1, NULL, '0000-00-00', 5, 'Doe de pasta bij de saus. Roer het geheel indien gewenst los met een scheut kookwater.'),
(6, 'b', 2, NULL, '0000-00-00', 1, 'Verhit de olie in een braad- of hapjespan en bak hierin het gehakt rul. Voeg de knoflook toe en breng op smaak met peper. Kook de spaghetti beetgaar.'),
(7, 'b', 2, NULL, '0000-00-00', 2, 'Giet de tomaten samen met de kruiden door het gehakt en roer goed. Breng aan de kook en laat al roerend zachtjes doorkoken, tot de saus iets dikker wordt. Voeg eventueel een extra scheutje water toe.'),
(8, 'b', 2, NULL, '0000-00-00', 3, 'Serveer de tomaten-gehaktsaus met de spaghetti en bestrooi optioneel met kaas.\r\n'),
(9, 'b', 3, NULL, '0000-00-00', 1, 'Kneed het gehakt met de knoflook en een scheutje olie. voeg zout en peper naar smaak toe'),
(10, 'b', 3, NULL, '0000-00-00', 2, 'Verdeel in 4 gelijke ballen en vorm ze tot een hamburger.'),
(11, 'b', 3, NULL, '0000-00-00', 3, 'Barbecue de hamburgers 3 tot 5 minuten per kant.'),
(12, 'b', 3, NULL, '0000-00-00', 4, 'Leg ze op de broodjes.'),
(13, 'b', 4, NULL, '0000-00-00', 1, 'Begin met de ingrediënten uit het guacamole-pakket. Snijd de knoflook fijn. Snipper de sjalot. Rasp de groene schil van de limoen en pers de vrucht uit. Snijd de tomaat in kleine stukjes en verwijder de zaadlijsten. Halveer de rode peper in de lengte en verwijder de zaadlijsten. Snijd het vruchtvlees fijn. Prak de avocado met een vork in een kom fijn. Roer de knoflook, sjalot, limoenrasp en tomaat erdoor. Breng op smaak met limoensap, rode peper, zout en tabasco'),
(14, 'b', 4, NULL, '0000-00-00', 2, 'Bak de burgers op middelhoog vuur in ca. 6 min. goudbruin en gaar. Keer ze halverwege.'),
(15, 'b', 4, NULL, '0000-00-00', 3, 'Snijd de broodjes open en rooster ze met de snijkant naar beneden ca. 1 min. in de hete pan.'),
(16, 'b', 4, NULL, '0000-00-00', 4, 'Bestrijk de onderkant van de bollen met een beetje guacamole. Leg de burgers erop. Verdeel de rest van de guacamole erover en dek af met de bovenste helften van de broodjes.'),
(17, 'o', 2, 3, '2022-12-27', NULL, 'is lekker met een knoepert erbij'),
(18, 'o', 2, 4, '2022-12-28', NULL, 'zelfs ik kan dit maken'),
(19, 'o', 4, 1, '2022-12-27', NULL, 'smaakt goed samen met een blik shultenbrau'),
(20, 'w', 1, NULL, '0000-00-00', 4, ''),
(21, 'w', 2, NULL, '0000-00-00', 3, ''),
(22, 'w', 3, NULL, '0000-00-00', 4, ''),
(23, 'w', 4, NULL, '0000-00-00', 2, ''),
(25, 'f', 1, 1, '0000-00-00', NULL, ''),
(27, 'f', 3, 3, '0000-00-00', NULL, ''),
(29, 'f', 1, 2, '0000-00-00', NULL, ''),
(31, 'f', 4, 2, '0000-00-00', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `gerecht_id` int(11) NOT NULL,
  `artikel_id` int(11) NOT NULL,
  `aantal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`id`, `gerecht_id`, `artikel_id`, `aantal`) VALUES
(1, 1, 1, 2),
(2, 1, 2, 4),
(3, 1, 3, 100),
(4, 1, 4, 2),
(5, 1, 5, 400),
(6, 1, 6, 150),
(7, 2, 8, 350),
(8, 2, 1, 2),
(9, 2, 6, 400),
(10, 2, 9, 15),
(11, 1, 7, 10),
(12, 3, 8, 500),
(13, 3, 1, 2),
(14, 3, 7, 15),
(15, 3, 10, 4),
(16, 4, 11, 2),
(17, 4, 12, 4),
(18, 4, 10, 4),
(19, 2, 5, 400);

-- --------------------------------------------------------

--
-- Table structure for table `keuken_type`
--

CREATE TABLE `keuken_type` (
  `id` int(11) NOT NULL,
  `record_type` varchar(1) NOT NULL,
  `omschrijving` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keuken_type`
--

INSERT INTO `keuken_type` (`id`, `record_type`, `omschrijving`) VALUES
(1, 'k', 'Italiaans'),
(2, 'k', 'Amerikaans'),
(3, 'k', 'Mexikaans'),
(4, 't', 'vegetarisch'),
(5, 't', 'vlees');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(60) NOT NULL,
  `afbeelding` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_name`, `password`, `email`, `afbeelding`) VALUES
(1, 'Richard Batsbak', 'appel', 'richardbatsbak@gmail.com', 'http://localhost/educom-verrukkulluk/assets/img/users/richard_batsbak.jpeg'),
(2, 'Gerrie Van Boven', 'peer', 'gerrievanboven@gmail.com', 'http://localhost/educom-verrukkulluk/assets/img/users/gerrie_van_boven.jpeg'),
(3, 'Rikkert Biemans', 'kers', 'rikkertbiemans@gmail.com', 'http://localhost/educom-verrukkulluk/assets/img/users/rikkert_biemans.png'),
(4, 'Barrie Butsers', 'pruim', 'barriebutsers@gmail.com', 'http://localhost/educom-verrukkulluk/assets/img/users/barrie_butser.jpeg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `boodschappenlijst`
--
ALTER TABLE `boodschappenlijst`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user_id`),
  ADD KEY `artikel` (`artikel_id`);

--
-- Indexes for table `gerecht`
--
ALTER TABLE `gerecht`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keuken_id` (`keuken_id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `gerecht_info`
--
ALTER TABLE `gerecht_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gerecht_id` (`gerecht_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artikel_id` (`artikel_id`),
  ADD KEY `gerecht_id` (`gerecht_id`);

--
-- Indexes for table `keuken_type`
--
ALTER TABLE `keuken_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `boodschappenlijst`
--
ALTER TABLE `boodschappenlijst`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `gerecht`
--
ALTER TABLE `gerecht`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gerecht_info`
--
ALTER TABLE `gerecht_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `keuken_type`
--
ALTER TABLE `keuken_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gerecht`
--
ALTER TABLE `gerecht`
  ADD CONSTRAINT `gerecht_ibfk_1` FOREIGN KEY (`keuken_id`) REFERENCES `keuken_type` (`id`),
  ADD CONSTRAINT `gerecht_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `keuken_type` (`id`),
  ADD CONSTRAINT `gerecht_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `gerecht_info`
--
ALTER TABLE `gerecht_info`
  ADD CONSTRAINT `gerecht_info_ibfk_1` FOREIGN KEY (`gerecht_id`) REFERENCES `gerecht` (`id`);

--
-- Constraints for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`artikel_id`) REFERENCES `artikel` (`id`),
  ADD CONSTRAINT `ingredient_ibfk_2` FOREIGN KEY (`gerecht_id`) REFERENCES `gerecht` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
