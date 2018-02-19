-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Lun 19 Février 2018 à 10:15
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `nf1`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE `articles` (
  `idArticle` int(11) NOT NULL,
  `nameFile` varchar(255) NOT NULL,
  `nameImage` varchar(255) NOT NULL,
  `updateDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `idCategory` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `articles`
--

INSERT INTO `articles` (`idArticle`, `nameFile`, `nameImage`, `updateDate`, `idCategory`, `title`) VALUES
(1, 'schedule_f1_nascar_points', 'f1_2017_driver_standing_race_18', '2017-11-02 13:30:53', 3, 'What if we change points system in F1 to Nascar\'s points system.'),
(2, 'things_change_f1', 'things_change_f1', '2017-12-05 13:57:52', 2, '5 things that F1 should change'),
(3, 'things_change_nascar', 'things_change_nascar', '2017-12-05 21:37:29', 1, '5 things that Nascar should change');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `idCategory` int(11) NOT NULL,
  `nameCategory` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`idCategory`, `nameCategory`) VALUES
(1, 'Nascar'),
(2, 'F1'),
(3, 'What if');

-- --------------------------------------------------------

--
-- Structure de la table `circuit`
--

CREATE TABLE `circuit` (
  `idCircuit` int(11) NOT NULL,
  `nameCircuit` varchar(255) NOT NULL,
  `place` varchar(255) NOT NULL,
  `idDiscipline` int(11) NOT NULL,
  `idSeason` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `circuit`
--

INSERT INTO `circuit` (`idCircuit`, `nameCircuit`, `place`, `idDiscipline`, `idSeason`) VALUES
(1, 'Melbourne', 'Australia', 2, 2017),
(2, 'Shanghai', 'China', 2, 2017),
(3, 'Sakhir', 'Bahreïn', 2, 2017),
(4, 'Sotchi', 'Russia', 2, 2017),
(5, 'Barcelone', 'Spain', 2, 2017),
(6, 'Monaco', 'Monaco', 2, 2017),
(7, 'Monreal', 'Canada', 2, 2017),
(8, 'Bakou', 'Azerbaijan', 2, 2017),
(9, 'Spielberg', 'Austria', 2, 2017),
(10, 'Silverstone', 'Grande-Bretagne', 2, 2017),
(11, 'Budapest', 'Hungary', 2, 2017),
(12, 'Spa-Francorchamps', 'Belgium', 2, 2017),
(13, 'Monza', 'Italia', 2, 2017),
(14, 'Singapore', 'Singapore', 2, 2017),
(15, 'Kuala Lumpur', 'Malaysia', 2, 2017),
(16, 'Suzuka', 'Japan', 2, 2017),
(17, 'Texas', 'United States of America', 2, 2017),
(18, 'Mexico City', 'Mexico', 2, 2017),
(19, 'Interlagos', 'Brasil', 2, 2017),
(20, 'Abu Dhabi', 'United Arab Emirates', 2, 2017),
(101, 'Daytona 500', 'Daytona International Speedway', 1, 1),
(102, 'Folds of Honor QuikTrip 500', 'Atlanta Motor Speedway', 1, 1),
(103, 'Kobalt 400', 'Las Vegas Motor Speedway', 1, 1),
(104, 'Camping World 500', 'Phoenix International Raceway', 1, 1),
(105, 'Auto Club 400', 'Auto Club Speedway, Fontana', 1, 1),
(106, 'STP 500', 'Martinsville Speedway', 1, 1),
(107, 'O\'Reilly Auto Parts 500', 'Texas Motor Speedway', 1, 1),
(108, 'Food City 500', 'Bristol Motor Speedway', 1, 1),
(109, 'Toyota Owners 400', 'Richmond International Raceway', 1, 1),
(110, 'Geico 500', 'Talladega Superspeedway', 1, 1),
(111, 'Go Bowling 400', 'Kansas Speedway', 1, 1),
(112, 'Coca-Cola 600', 'Charlotte Motor Speedway', 1, 1),
(113, 'AAA 400 Drive for Autism', 'Dover International Speedway', 1, 1),
(114, 'Pocono 400', 'Pocono Raceway', 1, 1),
(115, 'Firekeepers Casino 400', 'Michigan International Speedway', 1, 1),
(116, 'Toyota/Save Mart 350', 'Sonoma Raceway', 1, 1),
(117, 'Coke Zero 400', 'Daytona International Speedway', 1, 1),
(118, 'Quaker State 400', 'Kentucky Speedway', 1, 1),
(119, 'Overton\'s 301', 'New Hampshire Motor Speedway, Loudon', 1, 1),
(120, 'Brickyard 400', 'Indianapolis Motor Speedway', 1, 1),
(121, 'Pennsylvania 400', 'Pocono Raceway', 1, 1),
(122, 'Watkins Glen 355', 'Watkins Glen International', 1, 1),
(123, 'Pure Michigan 400', 'Michigan International Speedway', 1, 1),
(124, 'Bass Pro Shops NRA Night Race', 'Bristol Motor Speedway', 1, 1),
(125, 'Bojangles\' Southern 500', 'Darlington Raceway', 1, 1),
(126, 'Federated Auto Parts 400', 'Richmond International Raceway', 1, 1),
(127, 'Tales of the Turtles 400', 'Chicagoland Speedway', 1, 1),
(128, 'ISM Connect 300', 'New Hampshire Motor Speedway, Loudon', 1, 1),
(129, 'Apache Warrior 400', 'Dover International Speedway', 1, 1),
(130, 'Bank of America 500', 'Charlotte Motor Speedway', 1, 1),
(131, 'Hellmann\'s 500', 'Talladega Superspeedway', 1, 1),
(132, 'Hollywood Casino 400', 'Kansas Speedway', 1, 1),
(133, 'Goody\'s Fast Relief 500', 'Martinsville Speedway', 1, 1),
(134, 'AAA Texas 500', 'Texas Motor Speedway', 1, 1),
(135, 'Cam-Am 500', 'Phoenix International Raceway', 1, 1),
(136, 'Ford EcoBoost 400', 'Homestead-Miami Speedway', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `discipline`
--

CREATE TABLE `discipline` (
  `idDiscipline` int(11) NOT NULL,
  `nameDiscipline` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `discipline`
--

INSERT INTO `discipline` (`idDiscipline`, `nameDiscipline`) VALUES
(1, 'Nascar Cup Series'),
(2, 'Formula 1');

-- --------------------------------------------------------

--
-- Structure de la table `pilot`
--

CREATE TABLE `pilot` (
  `idPilot` int(11) NOT NULL,
  `namePilot` varchar(255) NOT NULL,
  `idTeam` int(11) DEFAULT NULL,
  `idDiscipline` int(11) NOT NULL,
  `pilotNumber` int(11) DEFAULT NULL,
  `placeBirth` varchar(255) DEFAULT NULL,
  `dateBirth` date DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `pilot`
--

INSERT INTO `pilot` (`idPilot`, `namePilot`, `idTeam`, `idDiscipline`, `pilotNumber`, `placeBirth`, `dateBirth`, `country`) VALUES
(1, 'Lewis Hamilton', 1, 2, 44, 'Stevenage', '1985-01-07', 'United Kingdom'),
(2, 'Valtteri Bottas', 1, 2, 77, 'Nastola', '1989-08-28', 'Finland'),
(3, 'Sebastian Vettel', 2, 2, 5, 'Heppenheim\r\n', '1987-07-03', 'Germany\r\n'),
(4, 'Kimi Räikkönen', 2, 2, 7, 'Espoo\r\n', '1979-10-17', 'Finland\r\n'),
(5, 'Daniel Ricciardo', 3, 2, 3, 'Perth\r\n', '1989-07-01', 'Australia\r\n'),
(6, 'Max Verstappen', 3, 2, 33, 'Hasselt \r\n', '1997-09-30', 'The Netherlands\r\n'),
(7, 'Esteban Ocon', 4, 2, 31, 'Evreux\r\n', '1996-09-17', 'France\r\n'),
(8, 'Sergio Perez', 4, 2, 11, 'Guadalajara\r\n', '1990-01-26', 'Mexico\r\n'),
(9, 'Lance Stroll', 5, 2, 18, 'Montréal\r\n', '1998-10-29', 'Canada\r\n'),
(10, 'Felipe Massa', 5, 2, 19, 'São Paolo\r\n', '1981-04-25', 'Brasil\r\n'),
(11, 'Daniil Kyvat', 6, 2, 26, 'Oufa\r\n', '1994-04-26', 'Russia\r\n'),
(12, 'Brandon Hartley', 6, 2, 28, 'Palmerston North\r\n', '1989-11-10', 'New-Zeland\r\n'),
(13, 'Pierre Gasly', 6, 2, 10, 'Rouen\r\n', '1996-02-07', 'France\r\n'),
(14, 'Carlos Sainz', 7, 2, 55, 'Madrid\r\n', '1994-09-01', 'Spain\r\n'),
(15, 'Nico Hulkenberg', 7, 2, 27, 'Emmerich \r\n', '1987-08-19', 'Germany\r\n'),
(16, 'Jolyon Palmer', 7, 2, 30, 'Horcham\r\n', '1991-01-20', 'United Kingdom\r\n'),
(17, 'Romain Grosjean', 8, 2, 8, 'Genève\r\n', '1986-04-17', 'France\r\n'),
(18, 'Kevin Magnussen', 8, 2, 20, 'Roskilde\r\n', '1992-10-05', 'Denmark\r\n'),
(19, 'Stoffel Vandoorne', 9, 2, 2, 'Courtrai\r\n', '1992-03-26', 'Belgium\r\n'),
(20, 'Fernando Alonso', 9, 2, 14, 'Oviedo\r\n', '1981-07-29', 'Spain\r\n'),
(21, 'Jenson Button', 9, 2, 22, 'Frome \r\n', '1980-01-19', 'United Kingdom\r\n'),
(22, 'Marcus Ericsson', 10, 2, 9, 'Kumla\r\n', '1990-09-02', 'Sweeden\r\n'),
(23, 'Pascal Wherlein', 10, 2, 94, 'Sigmaringen\r\n', '1994-10-18', 'Germany\r\n'),
(24, 'Antonio Giovinazzi', 10, 2, 50, 'Martina Franca\r\n', '1993-12-14', 'Italia\r\n'),
(25, 'Paul Di Resta', 5, 2, 19, 'Uphall\r\n', '1986-04-16', 'United Kingdom\r\n'),
(101, 'Bredan Gaughan', 101, 1, 75, 'Las Vegas\r\n', '1975-07-10', 'United States of America\r\n'),
(102, 'Jamie McMurray', 102, 1, 1, 'Joplin\r\n\r\n', '1976-06-03', 'United States of America\r\n'),
(103, 'Kyle Larson', 102, 1, 42, 'Sacremento\r\n', '1992-07-31', 'United States of America\r\n'),
(104, 'Jeffrey Earnhardt', 103, 1, 33, 'Mooresville\r\n', '1989-06-22', 'United States of America\r\n'),
(105, 'Ty Dillon', 104, 1, 13, 'Lewisville\r\n', '1992-02-27', 'United States of America\r\n'),
(106, 'Kasey Kahne', 105, 1, 5, 'Enumclaw\r\n', '1980-04-10', 'United States of America\r\n'),
(107, 'Chase Elliott', 105, 1, 24, 'Dawsonville\r\n', '1995-11-28', 'United States of America\r\n'),
(108, 'Jimmie Johnson', 105, 1, 48, 'El Cajon\r\n', '1975-09-17', 'United States of America\r\n'),
(109, 'Dale Earnhardt Jr.', 105, 1, 88, 'Kannapolis\r\n', '1974-10-10', 'United States of America\r\n'),
(110, 'Chris Buescher', 106, 1, 37, 'Prosper\r\n', '1992-10-29', 'United States of America\r\n'),
(111, 'A. J. Allmendinger', 106, 1, 47, 'Los Gatos\r\n', '1981-12-16', 'United States of America\r\n'),
(112, 'Micheal Mcdowell', 107, 1, 95, 'Phoenix\r\n', '1984-12-21', 'United States of America\r\n'),
(113, 'Austin Dillon', 108, 1, 3, 'Lewisville\r\n', '1990-04-27', 'United States of America\r\n'),
(114, 'Paul Menard', 108, 1, 27, 'Eau Claire \r\n', '1980-08-21', 'United States of America\r\n'),
(115, 'Ryan Newman', 108, 1, 31, 'South Bend\r\n', '1977-12-08', 'United States of America\r\n'),
(116, 'Timmy Hill', 109, 1, 51, 'Port Tobacco\r\n', '1993-02-25', 'United States of America\r\n'),
(117, 'Cody Ware', 109, 1, 51, 'Greensboro\r\n', '1995-11-07', 'United States of America\r\n'),
(118, 'Stanton Barret', 109, 1, 51, 'Bishop\r\n', '1972-12-01', 'United States of America\r\n'),
(119, 'Kevin O\'Connell', 109, 1, 51, 'Newport Beach\r\n', '1967-04-29', 'United States of America\r\n'),
(120, 'Elliott Sadler', 110, 1, 7, 'Emporia\r\n', '1975-04-30', 'United States of America\r\n'),
(121, 'Landon Cassill', 111, 1, 34, 'Cedar Rapids\r\n', '1989-07-07', 'United States of America\r\n'),
(122, 'David Ragan', 111, 1, 38, 'Unadilla\r\n', '1985-12-04', 'United States of America\r\n'),
(123, 'Matt DiBenedetto', 112, 1, 32, 'Grass Valley\r\n', '1991-07-27', 'United States of America\r\n'),
(124, 'Aric Almirola', 113, 1, 43, 'Tampa\r\n', '1984-03-14', 'United States of America\r\n'),
(125, 'Regan Smith', 113, 1, 43, 'Cato\r\n', '1983-09-23', 'United States of America\r\n'),
(126, 'Darrell Wallace Jr.', 113, 1, 43, 'Mobile\r\n', '1993-10-08', 'United States of America'),
(127, 'Trevor Bayne', 114, 1, 6, 'Knoxville\r\n', '1991-02-19', 'United States of America'),
(128, 'Ricky Stenhouse Jr', 114, 1, 17, 'Olive Branch\r\n', '1987-10-02', 'United States of America'),
(129, 'Kevin Harvick', 115, 1, 4, 'Bakersfield\r\n', '1975-12-08', 'United States of America'),
(130, 'Danica Patrick', 115, 1, 10, 'Beloit\r\n', '1982-03-25', 'United States of America'),
(131, 'Clint Bowyer', 115, 1, 14, 'Emporia\r\n', '1979-05-30', 'United States of America'),
(132, 'Kurt Busch', 115, 1, 41, 'Las Vegas\r\n', '1978-08-04', 'United States of America'),
(133, 'Brad Keselowski', 116, 1, 2, 'Auburn Hills\r\n', '1984-02-12', 'United States of America'),
(134, 'Joey Logano', 116, 1, 22, 'Middleton\r\n', '1990-05-24', 'United States of America'),
(135, 'Ryan Blaney', 117, 1, 21, 'High Point\r\n', '1993-12-31', 'United States of America'),
(136, 'Joey Gase', 118, 1, 23, 'Cedar Rapids\r\n', '1993-02-08', 'United States of America'),
(137, 'Grey Gaulding', 118, 1, 23, 'Colonial Heights\r\n', '1998-02-10', 'United States of America'),
(138, 'Corey Lajoie', 118, 1, 83, 'Kannapolis\r\n', '1991-09-25', 'United States of America'),
(139, 'Erik Jones', 119, 1, 77, 'Byron\r\n', '1996-05-30', 'United States of America'),
(140, 'Martin Truex Jr.', 119, 1, 78, 'Mayetta\r\n', '1980-06-29', 'United States of America'),
(141, 'D. J. Kennington', 120, 1, 96, 'St Thomas\r\n', '1977-07-15', 'Canada\r\n'),
(142, 'Denny Hamlin', 121, 1, 11, 'Chesterfield\r\n', '1980-11-18', 'United States of America'),
(143, 'Kyle Busch', 121, 1, 18, 'Las Vegas\r\n', '1985-05-02', 'United States of America'),
(144, 'Daniel Suarez', 121, 1, 19, 'Monterrey\r\n', '1992-01-07', 'Mexico\r\n'),
(145, 'Matt Kenseth', 121, 1, 20, 'Cambridge\r\n', '1972-03-10', 'United States of America'),
(146, 'Micheal Waltrip', 122, 1, 15, 'Owensboro\r\n', '1963-04-30', 'United States of America'),
(147, 'Reed Sorenson', 122, 1, 15, 'Peachtree City \r\n', '1986-02-05', 'United States of America'),
(148, 'Derrike Cope', 122, 1, 55, 'Spanaway\r\n', '1958-11-02', 'United States of America'),
(149, 'Cole Whitt', 123, 1, 72, 'Alpine\r\n', '1991-06-22', 'United States of America');

-- --------------------------------------------------------

--
-- Structure de la table `race`
--

CREATE TABLE `race` (
  `ìdRace` int(11) NOT NULL,
  `idCircuit` int(11) NOT NULL,
  `idPilot` int(11) NOT NULL,
  `idTeam` int(11) NOT NULL,
  `idDiscipline` int(11) NOT NULL,
  `idSeason` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `race`
--

INSERT INTO `race` (`ìdRace`, `idCircuit`, `idPilot`, `idTeam`, `idDiscipline`, `idSeason`, `position`, `points`) VALUES
(1, 1, 1, 1, 2, 2017, 2, 18),
(2, 1, 2, 1, 2, 2017, 3, 15),
(3, 1, 3, 2, 2, 2017, 1, 25),
(4, 1, 4, 2, 2, 2017, 4, 12),
(5, 1, 5, 3, 2, 2017, 17, 0),
(6, 1, 6, 3, 2, 2017, 5, 10),
(7, 1, 7, 4, 2, 2017, 10, 1),
(8, 1, 8, 4, 2, 2017, 7, 6),
(9, 1, 9, 5, 2, 2017, 16, 0),
(10, 1, 10, 5, 2, 2017, 6, 8),
(11, 1, 11, 6, 2, 2017, 9, 2),
(12, 1, 14, 6, 2, 2017, 8, 4),
(13, 1, 15, 7, 2, 2017, 11, 0),
(14, 1, 16, 7, 2, 2017, 19, 0),
(15, 1, 17, 8, 2, 2017, 20, 0),
(16, 1, 18, 8, 2, 2017, 15, 0),
(17, 1, 19, 9, 2, 2017, 13, 0),
(18, 1, 20, 9, 2, 2017, 14, 0),
(19, 1, 22, 10, 2, 2017, 18, 0),
(20, 1, 24, 10, 2, 2017, 12, 0),
(21, 101, 132, 115, 1, 1, 1, 48),
(22, 101, 135, 117, 1, 1, 2, 44),
(23, 101, 111, 106, 1, 1, 3, 39),
(24, 101, 124, 113, 1, 1, 4, 33),
(25, 101, 114, 108, 1, 1, 5, 32),
(26, 101, 134, 116, 1, 1, 6, 40),
(27, 101, 106, 105, 1, 1, 7, 30),
(28, 101, 146, 122, 1, 1, 8, 29),
(29, 101, 123, 112, 1, 1, 9, 28),
(30, 101, 127, 114, 1, 1, 10, 27),
(31, 101, 101, 101, 1, 1, 11, 0),
(32, 101, 103, 102, 1, 1, 12, 33),
(33, 101, 140, 119, 1, 1, 13, 24),
(34, 101, 107, 105, 1, 1, 14, 23),
(35, 101, 112, 107, 1, 1, 15, 22),
(36, 101, 121, 111, 1, 1, 16, 21),
(37, 101, 142, 121, 1, 1, 17, 23),
(38, 101, 149, 123, 1, 1, 18, 19),
(39, 101, 113, 108, 1, 1, 19, 18),
(40, 101, 120, 110, 1, 1, 20, 0),
(41, 101, 115, 108, 1, 1, 21, 18),
(42, 101, 129, 115, 1, 1, 22, 34),
(43, 101, 136, 118, 1, 1, 23, 0),
(44, 101, 138, 118, 1, 1, 24, 13),
(45, 101, 122, 111, 1, 1, 25, 12),
(46, 101, 104, 103, 1, 1, 26, 11),
(47, 101, 133, 116, 1, 1, 27, 24),
(48, 101, 102, 102, 1, 1, 28, 13),
(49, 101, 144, 121, 1, 1, 29, 8),
(50, 101, 105, 104, 1, 1, 30, 7),
(51, 101, 128, 114, 1, 1, 31, 6),
(52, 101, 131, 115, 1, 1, 32, 9),
(53, 101, 130, 115, 1, 1, 33, 11),
(54, 101, 108, 105, 1, 1, 34, 5),
(55, 101, 110, 106, 1, 1, 35, 2),
(56, 101, 141, 120, 1, 1, 36, 1),
(57, 101, 109, 105, 1, 1, 37, 7),
(58, 101, 143, 121, 1, 1, 38, 11),
(59, 101, 139, 119, 1, 1, 39, 1),
(60, 101, 145, 120, 1, 1, 40, 1),
(61, 2, 1, 1, 2, 2017, 1, 25),
(62, 2, 3, 2, 2, 2017, 2, 18),
(63, 2, 6, 3, 2, 2017, 3, 15),
(64, 2, 5, 3, 2, 2017, 4, 12),
(65, 2, 4, 2, 2, 2017, 5, 10),
(66, 2, 2, 1, 2, 2017, 6, 8),
(67, 2, 14, 6, 2, 2017, 7, 6),
(68, 2, 18, 8, 2, 2017, 8, 4),
(69, 2, 8, 4, 2, 2017, 9, 2),
(70, 2, 7, 4, 2, 2017, 10, 1),
(71, 2, 17, 8, 2, 2017, 11, 0),
(72, 2, 15, 7, 2, 2017, 12, 0),
(73, 2, 16, 7, 2, 2017, 13, 0),
(74, 2, 10, 5, 2, 2017, 14, 0),
(75, 2, 22, 10, 2, 2017, 15, 0),
(76, 2, 20, 9, 2, 2017, 16, 0),
(77, 2, 11, 6, 2, 2017, 17, 0),
(78, 2, 19, 9, 2, 2017, 18, 0),
(79, 2, 24, 10, 2, 2017, 19, 0),
(80, 2, 9, 5, 2, 2017, 20, 0),
(81, 3, 3, 2, 2, 2017, 1, 25),
(82, 3, 1, 1, 2, 2017, 2, 18),
(83, 3, 2, 1, 2, 2017, 3, 15),
(84, 3, 4, 2, 2, 2017, 4, 12),
(85, 3, 5, 3, 2, 2017, 5, 10),
(86, 3, 10, 5, 2, 2017, 6, 8),
(87, 3, 8, 4, 2, 2017, 7, 6),
(88, 3, 17, 8, 2, 2017, 8, 4),
(89, 3, 15, 7, 2, 2017, 9, 2),
(90, 3, 7, 4, 2, 2017, 10, 1),
(91, 3, 23, 10, 2, 2017, 11, 0),
(92, 3, 11, 6, 2, 2017, 12, 0),
(93, 3, 16, 7, 2, 2017, 13, 0),
(94, 3, 20, 9, 2, 2017, 14, 0),
(95, 3, 22, 10, 2, 2017, 15, 0),
(96, 3, 14, 6, 2, 2017, 16, 0),
(97, 3, 9, 5, 2, 2017, 17, 0),
(98, 3, 6, 3, 2, 2017, 18, 0),
(99, 3, 18, 8, 2, 2017, 19, 0),
(100, 3, 19, 9, 2, 2017, 20, 0);

-- --------------------------------------------------------

--
-- Structure de la table `season`
--

CREATE TABLE `season` (
  `idSeason` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `idDiscipline` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `season`
--

INSERT INTO `season` (`idSeason`, `year`, `idDiscipline`) VALUES
(1, 2017, 1),
(2017, 2017, 2);

-- --------------------------------------------------------

--
-- Structure de la table `team`
--

CREATE TABLE `team` (
  `idTeam` int(11) NOT NULL,
  `nameTeam` varchar(255) DEFAULT NULL,
  `idDiscipline` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `team`
--

INSERT INTO `team` (`idTeam`, `nameTeam`, `idDiscipline`) VALUES
(1, 'Mercedes', 2),
(2, 'Ferrari', 2),
(3, 'Red Bull Racing Tag Heueur', 2),
(4, 'Force India Mercedes', 2),
(5, 'Williams Mercedes', 2),
(6, 'Toro Rosso', 2),
(7, 'Renault', 2),
(8, 'Haas Ferrari', 2),
(9, 'McLaren Honda', 2),
(10, 'Sauber Ferrari', 2),
(101, 'Beard Motorsports', 1),
(102, 'Chip Ganassi Racing', 1),
(103, 'Circle Sport', 1),
(104, 'Germain Racing', 1),
(105, 'Hendrick Motorsports', 1),
(106, 'JTG Daugherty Racing', 1),
(107, 'Leavine Family Racing', 1),
(108, 'Richard Childress Racing', 1),
(109, 'Rick Ware Racing', 1),
(110, 'Tommy Baldwin Racing', 1),
(111, 'Front Row Motorsports', 1),
(112, 'Go Fas Racing', 1),
(113, 'Richard Petty Motorsports', 1),
(114, 'Roush Fenway Racing', 1),
(115, 'Stewart-Haas Racing', 1),
(116, 'Team Penske', 1),
(117, 'Wood Brothers Racing', 1),
(118, 'Bk Racing', 1),
(119, 'Furniture Row Racing', 1),
(120, 'Gaunt Brothers Racing', 1),
(121, 'Joe Gibbs Racing', 1),
(122, 'Premium Motorsports', 1),
(123, 'TriStar Motorsports', 1);

-- --------------------------------------------------------

--
-- Structure de la table `videos`
--

CREATE TABLE `videos` (
  `idVideos` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Contenu de la table `videos`
--
INSERT INTO `videos` (`idVideos`, `title`, `link`) VALUES
(1, 'NF1 Podcast #1', 'https://www.youtube.com/embed/K7NsMzfDsGA');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`idArticle`),
  ADD KEY `Fk_Article_Category` (`idCategory`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idCategory`);

--
-- Index pour la table `circuit`
--
ALTER TABLE `circuit`
  ADD PRIMARY KEY (`idCircuit`,`idSeason`),
  ADD KEY `Fk_Circuit_Discipline` (`idDiscipline`),
  ADD KEY `Fk_Circuit_Season` (`idSeason`);

--
-- Index pour la table `discipline`
--
ALTER TABLE `discipline`
  ADD PRIMARY KEY (`idDiscipline`);

--
-- Index pour la table `pilot`
--
ALTER TABLE `pilot`
  ADD PRIMARY KEY (`idPilot`),
  ADD KEY `Fk_Pilot_Team` (`idTeam`),
  ADD KEY `Fk_Pilot_Discipline` (`idDiscipline`);

--
-- Index pour la table `race`
--
ALTER TABLE `race`
  ADD PRIMARY KEY (`ìdRace`),
  ADD KEY `Fk_Race_Circuit` (`idCircuit`),
  ADD KEY `Fk_Race_Pilot` (`idPilot`),
  ADD KEY `Fk_Race_Discipline` (`idDiscipline`),
  ADD KEY `Fk_Race_Season` (`idSeason`);

--
-- Index pour la table `season`
--
ALTER TABLE `season`
  ADD PRIMARY KEY (`idSeason`),
  ADD KEY `Fk_Season_Discipline` (`idDiscipline`);

--
-- Index pour la table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`idTeam`),
  ADD KEY `Fk_Team_Discipline` (`idDiscipline`);

ALTER TABLE `videos`
  ADD PRIMARY KEY (`idVideos`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `articles`
--
ALTER TABLE `articles`
  MODIFY `idArticle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `idCategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `circuit`
--
ALTER TABLE `circuit`
  MODIFY `idCircuit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;
--
-- AUTO_INCREMENT pour la table `pilot`
--
ALTER TABLE `pilot`
  MODIFY `idPilot` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;
--
-- AUTO_INCREMENT pour la table `race`
--
ALTER TABLE `race`
  MODIFY `ìdRace` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT pour la table `season`
--
ALTER TABLE `season`
  MODIFY `idSeason` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2018;
--
-- AUTO_INCREMENT pour la table `videos`
--
ALTER TABLE `videos`
  MODIFY `idVideos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `Fk_Article_Category` FOREIGN KEY (`idCategory`) REFERENCES `category` (`idCategory`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `circuit`
--
ALTER TABLE `circuit`
  ADD CONSTRAINT `Fk_Circuit_Discipline` FOREIGN KEY (`idDiscipline`) REFERENCES `discipline` (`idDiscipline`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_Circuit_Season` FOREIGN KEY (`idSeason`) REFERENCES `season` (`idSeason`) ON DELETE CASCADE;

--
-- Contraintes pour la table `pilot`
--
ALTER TABLE `pilot`
  ADD CONSTRAINT `Fk_Pilot_Discipline` FOREIGN KEY (`idDiscipline`) REFERENCES `discipline` (`idDiscipline`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_Pilot_Team` FOREIGN KEY (`idTeam`) REFERENCES `team` (`idTeam`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `race`
--
ALTER TABLE `race`
  ADD CONSTRAINT `Fk_Race_Circuit` FOREIGN KEY (`idCircuit`) REFERENCES `circuit` (`idCircuit`) ON DELETE CASCADE,
  ADD CONSTRAINT `Fk_Race_Discipline` FOREIGN KEY (`idDiscipline`) REFERENCES `discipline` (`idDiscipline`) ON DELETE CASCADE,
  ADD CONSTRAINT `Fk_Race_Pilot` FOREIGN KEY (`idPilot`) REFERENCES `pilot` (`idPilot`) ON DELETE CASCADE,
  ADD CONSTRAINT `Fk_Race_Season` FOREIGN KEY (`idSeason`) REFERENCES `season` (`idSeason`) ON DELETE CASCADE;

--
-- Contraintes pour la table `season`
--
ALTER TABLE `season`
  ADD CONSTRAINT `Fk_Season_Discipline` FOREIGN KEY (`idDiscipline`) REFERENCES `discipline` (`idDiscipline`) ON DELETE CASCADE;

--
-- Contraintes pour la table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `Fk_Team_Discipline` FOREIGN KEY (`idDiscipline`) REFERENCES `discipline` (`idDiscipline`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
