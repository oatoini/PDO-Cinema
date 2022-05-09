-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           5.7.33 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour cinema
CREATE DATABASE IF NOT EXISTS `cinema` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cinema`;

-- Listage de la structure de la table cinema. acteur
CREATE TABLE IF NOT EXISTS `acteur` (
  `id_acteur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_acteur` varchar(50) NOT NULL DEFAULT '',
  `prenom_acteur` varchar(50) NOT NULL DEFAULT '',
  `date_naissance_acteur` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sexe_acteur` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_acteur`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- Listage des données de la table cinema.acteur : ~23 rows (environ)
/*!40000 ALTER TABLE `acteur` DISABLE KEYS */;
INSERT INTO `acteur` (`id_acteur`, `nom_acteur`, `prenom_acteur`, `date_naissance_acteur`, `sexe_acteur`) VALUES
	(1, 'Eastwood', 'Clint', '1930-05-31 00:00:00', 'Masculin'),
	(2, 'Crowe', 'Russell', '1964-04-07 00:00:00', 'Masculin'),
	(3, 'Joaquin', 'Phoenix', '1974-10-28 00:00:00', 'Masculin'),
	(4, 'Di Caprio', 'Leonardo', '1974-11-11 00:00:00', 'Masculin'),
	(5, 'Hardy', 'Tom', '1977-09-15 00:00:00', 'Masculin'),
	(6, 'Watanabe', 'Ken', '1959-10-21 00:00:00', 'Masculin'),
	(7, 'Nielsen', 'Connie', '1965-07-03 00:00:00', 'Feminin'),
	(8, 'Foxx', 'Jamie', '1967-12-13 00:00:00', 'Masculin'),
	(9, 'Waltz', 'Christoph', '1956-10-04 00:00:00', 'Masculin'),
	(10, 'Jackson', 'Samuel L.', '1948-12-21 00:00:00', 'Masculin'),
	(11, 'Wood', 'Elijah', '1981-01-28 00:00:00', 'Masculin'),
	(12, 'McKellen', 'Ian', '1939-05-25 00:00:00', 'Masculin'),
	(13, 'Mortensen', 'Viggo', '1958-10-20 00:00:00', 'Masculin'),
	(14, 'McConaughey', 'Matthew', '1969-11-04 00:00:00', 'Masculin'),
	(15, 'Hathaway', 'Anne', '1982-11-12 00:00:00', 'Feminin'),
	(16, 'Chastain', 'Jessica', '1977-03-24 00:00:00', 'Feminin'),
	(17, 'Cooper', 'Bradley', '1975-01-05 00:00:00', 'Masculin'),
	(18, 'Fischburn', 'Laurence', '1961-07-30 00:00:00', 'Masculin'),
	(19, 'Travolta', 'John', '1954-02-18 00:00:00', 'Masculin'),
	(20, 'Willis', 'Bruce', '1955-03-19 00:00:00', 'Masculin'),
	(21, 'Thurman', 'Uma', '1970-04-29 00:00:00', 'Feminin'),
	(22, 'Gordon-Levitt', 'Joseph', '1981-02-17 00:00:00', 'Masculin'),
	(23, 'Damon', 'Matt', '1970-10-08 00:00:00', 'Masculin');
/*!40000 ALTER TABLE `acteur` ENABLE KEYS */;

-- Listage de la structure de la table cinema. appartenance
CREATE TABLE IF NOT EXISTS `appartenance` (
  `id_film` int(11) NOT NULL,
  `id_genre` int(11) NOT NULL,
  KEY `id_film_id_genre` (`id_film`,`id_genre`),
  KEY `FK_appartenance_genre` (`id_genre`),
  CONSTRAINT `FK_appartenance_film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `FK_appartenance_genre` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table cinema.appartenance : ~10 rows (environ)
/*!40000 ALTER TABLE `appartenance` DISABLE KEYS */;
INSERT INTO `appartenance` (`id_film`, `id_genre`) VALUES
	(1, 1),
	(2, 2),
	(3, 1),
	(4, 3),
	(5, 4),
	(6, 1),
	(6, 5),
	(7, 1),
	(8, 6),
	(8, 7);
/*!40000 ALTER TABLE `appartenance` ENABLE KEYS */;

-- Listage de la structure de la table cinema. casting
CREATE TABLE IF NOT EXISTS `casting` (
  `id_film` int(11) NOT NULL,
  `id_acteur` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  KEY `id_film_id_acteur_id_role` (`id_film`,`id_acteur`,`id_role`),
  KEY `FK_casting_role` (`id_role`),
  KEY `FK_casting_acteur` (`id_acteur`),
  CONSTRAINT `FK_casting_acteur` FOREIGN KEY (`id_acteur`) REFERENCES `acteur` (`id_acteur`),
  CONSTRAINT `FK_casting_film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `FK_casting_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table cinema.casting : ~25 rows (environ)
/*!40000 ALTER TABLE `casting` DISABLE KEYS */;
INSERT INTO `casting` (`id_film`, `id_acteur`, `id_role`) VALUES
	(1, 2, 2),
	(1, 3, 3),
	(1, 7, 4),
	(2, 4, 5),
	(2, 5, 7),
	(2, 6, 8),
	(2, 22, 27),
	(3, 1, 1),
	(4, 4, 11),
	(4, 8, 9),
	(4, 10, 12),
	(5, 11, 13),
	(5, 12, 14),
	(5, 13, 15),
	(6, 14, 16),
	(6, 15, 17),
	(6, 16, 18),
	(6, 23, 19),
	(7, 1, 20),
	(7, 17, 21),
	(7, 18, 22),
	(8, 10, 24),
	(8, 19, 23),
	(8, 20, 25),
	(8, 21, 26);
/*!40000 ALTER TABLE `casting` ENABLE KEYS */;

-- Listage de la structure de la table cinema. film
CREATE TABLE IF NOT EXISTS `film` (
  `id_film` int(11) NOT NULL AUTO_INCREMENT,
  `titre_film` varchar(50) NOT NULL DEFAULT '',
  `date_sortie_film` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `duree_film` int(11) NOT NULL DEFAULT '0',
  `synopsis_film` text NOT NULL,
  `affiche_film` varchar(255) NOT NULL DEFAULT '0',
  `note_film` double NOT NULL DEFAULT '0',
  `⁪id_realisateur` int(11) NOT NULL,
  PRIMARY KEY (`id_film`),
  KEY `⁪id_realisateur` (`⁪id_realisateur`),
  CONSTRAINT `FK_film_realisateur` FOREIGN KEY (`⁪id_realisateur`) REFERENCES `realisateur` (`id_realisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Listage des données de la table cinema.film : ~8 rows (environ)
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` (`id_film`, `titre_film`, `date_sortie_film`, `duree_film`, `synopsis_film`, `affiche_film`, `note_film`, `⁪id_realisateur`) VALUES
	(1, 'Gladiator', '2000-06-20 00:00:00', 155, 'L\'intrigue raconte ainsi la chute du général romain Maximus Decimus , destiné à devenir le successeur de Marc Aurèle , avant que l\'empereur ne soit assassiné et le général brutalement trahi et laissé pour mort par l\'ambitieux et maléfique Commode qui en profite pour revêtir la pourpre. Maximus, dont la famille a été massacrée, va devenir un esclave gladiateur, conquérir le cœur du peuple romain par ses talents de combattant dans l\'arène du Colisée et finalement affronter Commode dans un ultime combat.  ', '0', 4.3, 1),
	(2, 'Inception', '2010-07-21 00:00:00', 147, 'Dans un futur proche, les États-Unis ont développé ce qui est appelé le « rêve partagé », une méthode permettant d\'influencer l\'inconscient d\'une victime pendant qu\'elle rêve, donc à partir de son subconscient. Des « extracteurs » s\'immiscent alors dans ce rêve, qu\'ils ont préalablement modelé et qu\'ils peuvent contrôler, afin d\'y voler des informations sensibles stockées dans le subconscient de la cible. ', '0', 4.1, 2),
	(3, 'Gran torino', '2008-12-17 00:00:00', 112, 'Walt Kowalski, vétéran de la guerre de Corée, raciste et irascible, vient de perdre sa femme. Une nuit, il surprend Thao, un de ses jeunes voisins d\'origine Hmong, en train d\'essayer de voler sa Ford Gran Torino 1972, dans le cadre d\'une épreuve imposée par le gang qui veut le recruter. Cet événement fera évoluer les rapports du jeune homme et sa famille avec M. Kowalski.', '0', 4.7, 3),
	(4, 'Django Unchained', '2013-01-16 00:00:00', 165, 'Dans le sud des États-Unis, deux ans avant la guerre de Sécession, le Dr King Schultz, un chasseur de primes allemand, fait l’acquisition de Django, un esclave qui peut l’aider à traquer les frères Brittle, les meurtriers qu’il recherche. Schultz promet à Django de lui rendre sa liberté lorsqu’il aura capturé les Brittle – morts ou vifs.', '0', 4.5, 4),
	(5, 'The Lord of The Rings: The Fellowship of the Ring', '2001-01-21 00:00:00', 228, 'Dans ce chapitre de la trilogie, le jeune et timide Hobbit, Frodon Sacquet, hérite d\'un anneau. Bien loin d\'être une simple babiole, il s\'agit de l\'Anneau Unique, un instrument de pouvoir absolu qui permettrait à Sauron, le Seigneur des ténèbres, de régner sur la Terre du Milieu et de réduire en esclavage ses peuples. À moins que Frodon, aidé d\'une Compagnie constituée de Hobbits, d\'Hommes, d\'un Magicien, d\'un Nain, et d\'un Elfe, ne parvienne à emporter l\'Anneau à travers la Terre du Milieu jusqu\'à la Crevasse du Destin, lieu où il a été forgé, et à le détruire pour toujours. Un tel périple signifie s\'aventurer très loin en Mordor, les terres du Seigneur des ténèbres, où est rassemblée son armée d\'Orques maléfiques... La Compagnie doit non seulement combattre les forces extérieures du mal mais aussi les dissensions internes et l\'influence corruptrice qu\'exerce l\'Anneau lui-même.', '0', 4.5, 5),
	(6, 'Interstellar', '2014-10-29 00:00:00', 169, 'Alors que la Terre se meurt, une équipe d\'astronautes franchit un trou de ver apparu près de Saturne et conduisant à une autre galaxie, afin d\'explorer un nouveau système stellaire et dans l\'espoir de trouver une planète habitable et y établir une colonie spatiale pour sauver l\'humanité.', '0', 4.5, 2),
	(7, 'The Mule', '2019-01-23 00:00:00', 116, 'Earl Stone est un paisible horticulteur âgé de plus de 80 ans, ancien combattant de la guerre de Corée. Endetté jusqu’au cou et sans perspective réelle d’emploi, il accepte un travail particulièrement facile et lucratif : celui de chauffeur. On lui demande seulement de transporter des sacs d\'El Paso à l\'Illinois au volant de son pick-up. Il découvre assez rapidement qu\'il s\'agit de drogue et qu\'il travaille pour le compte d’un cartel mexicain : un go fast apaisé, pense-t-il. Mais alors que ses factures passent au rayon des mauvais souvenirs, le poids de son passé refait surface : aider la famille et les amis. Il ne peut s\'empêcher de leur venir en aide en poursuivant cette activité. Mais il va falloir faire vite, car Colin Bates, agent de la Drug Enforcement Administration (DEA, agence fédérale américaine luttant contre le trafic de drogues), se met à traquer ce passeur efficace.', '0', 3.1, 3),
	(8, 'Pulp Fiction', '1994-10-26 00:00:00', 164, 'L\'odyssée sanglante et burlesque de petits malfrats dans la jungle de Hollywood à travers trois histoires qui s\'entremêlent.', '0', 5, 4);
/*!40000 ALTER TABLE `film` ENABLE KEYS */;

-- Listage de la structure de la table cinema. genre
CREATE TABLE IF NOT EXISTS `genre` (
  `id_genre` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_genre` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Listage des données de la table cinema.genre : ~7 rows (environ)
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` (`id_genre`, `libelle_genre`) VALUES
	(1, 'Drame'),
	(2, 'Thriller'),
	(3, 'Western'),
	(4, 'Fantasy'),
	(5, 'Science-fiction'),
	(6, 'Gangster'),
	(7, 'Comedie');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;

-- Listage de la structure de la table cinema. realisateur
CREATE TABLE IF NOT EXISTS `realisateur` (
  `id_realisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_realisateur` varchar(50) NOT NULL DEFAULT '',
  `prenom_realisateur` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_realisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Listage des données de la table cinema.realisateur : ~5 rows (environ)
/*!40000 ALTER TABLE `realisateur` DISABLE KEYS */;
INSERT INTO `realisateur` (`id_realisateur`, `nom_realisateur`, `prenom_realisateur`) VALUES
	(1, 'Scott', 'Ridley'),
	(2, 'Nolan', 'Christopher'),
	(3, 'Eastwood', 'Clint'),
	(4, 'Tarantino', 'Quentin'),
	(5, 'Jackson', 'Peter'),
	(6, 'Atoini', 'Othmann');
/*!40000 ALTER TABLE `realisateur` ENABLE KEYS */;

-- Listage de la structure de la table cinema. role
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `nom_role` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- Listage des données de la table cinema.role : ~27 rows (environ)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id_role`, `nom_role`) VALUES
	(1, 'Walt Kowalski'),
	(2, 'Maximus Decimus Meridius'),
	(3, 'Commode'),
	(4, 'Lucilla'),
	(5, 'Dominic « Dom » Cobb'),
	(6, 'Arthur'),
	(7, 'Eames'),
	(8, 'Mr. Saito'),
	(9, 'Django Freeman'),
	(10, 'King Schultz'),
	(11, 'Calvin J. Candie'),
	(12, 'Stephen'),
	(13, 'Frodon Sacquet'),
	(14, 'Gandalf le Gris'),
	(15, 'Aragorn'),
	(16, 'Joseph Cooper'),
	(17, 'Dr Amelia Brand'),
	(18, 'Murphy Cooper'),
	(19, 'Dr Mann'),
	(20, 'Earl Stone'),
	(21, 'Colin Bates'),
	(22, 'Carl'),
	(23, 'Vincent Vega'),
	(24, 'Jules Winnfield'),
	(25, 'Butch Coolidge'),
	(26, 'Mia Wallace'),
	(27, 'Arthur');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
