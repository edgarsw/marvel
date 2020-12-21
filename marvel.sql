drop database if exists marvel;
create database marvel;
use marvel;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: marvel
-- ------------------------------------------------------
-- Server version	8.0-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `colorist`
--

DROP TABLE IF EXISTS `colorist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `colorist` (
  `idcolorist` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET latin1 NOT NULL,
  `idcharacter` int(11) NOT NULL,
  PRIMARY KEY (`idcolorist`),
  KEY `fk_colorist_character_idx` (`idcharacter`),
  CONSTRAINT `fk_colorist_character` FOREIGN KEY (`idcharacter`) REFERENCES `person` (`idcharacter`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colorist`
--

LOCK TABLES `colorist` WRITE;
/*!40000 ALTER TABLE `colorist` DISABLE KEYS */;
INSERT INTO `colorist` VALUES (174,'Jay David Ramos',1011334),(175,'Christopher Sotomayor',1011334),(176,'Matt Milla',1011334),(177,'Luca Malisan',1011334),(178,'Christina Strain',1011334),(179,'Daniele Rudoni',1011334),(180,'Shannon Blanchard',1011334),(181,'Don Warfield',1011334),(182,'George Roussos',1011334),(183,'Jorge Maese',1011334),(184,'Val Staples',1017100),(185,'Jesus Aburtov',1017100),(186,'Dean White',1009144),(187,'Guru Efx',1009144),(188,'Frank D\'ARMATA',1009144),(189,'Christopher Sotomayor',1010699),(190,'Chris Sotomayor',1010699),(191,'Frank Martin',1010699),(192,'Antonio Fabela',1010699),(193,'Rachelle C Rosenberg',1010699),(194,'Val Staples',1010699),(195,'Pete Pantazis',1010699),(196,'Paul Mounts',1009146),(197,'Guru-eFX',1009146),(198,'Jason Keith',1009146),(199,'Bill Crabtree',1009146),(200,'Val Staples',1009146),(201,'Melissa Edwards',1009146),(202,'Matt Hollingsworth',1009146),(203,'James Sinclair',1009146),(204,'Matt Nelson',1009146),(205,'Paul Becton',1009146),(206,'Glynis Oliver',1009146),(207,'Arsia Rozegar',1009146),(208,'Avalon Studio',1009146),(209,'Raul Trevino',1009146),(210,'Tom Smith',1009146),(211,'Christopher Sotomayor',1009146),(212,'Richard Isanove',1016823),(213,'Dave Sharpe',1016823),(214,'Dave Stewart',1016823),(215,'Paul Mounts',1009148),(216,'Martin Simmonds',1009148),(217,'Jeromy Cox',1009148),(218,'Steve Buccellato',1009149),(219,'Digital Chameleon',1009149),(220,'Electric Crayon',1009149),(221,'Hi-Fi Design',1009149),(222,'Avalon Andy Troy',1009149),(223,'Steve Buccellato',1010903),(224,'Digital Chameleon',1010903),(225,'Electric Crayon',1010903),(226,'Hi-Fi Design',1010903),(227,'Mike Thomas',1010903),(228,'Frank Martin',1010354),(229,'Jordie Bellaire',1010354),(230,'Ian Laughlin',1010354),(231,'Max Scheele',1010354),(232,'Michael Garland',1011297),(233,'Frank D\'ARMATA',1011297),(234,'Christopher Sotomayor',1011297),(235,'Matthew Wilson',1011297),(236,'Laura Martin',1011297),(237,'Gotham Entertainment Group',1011031),(238,'Shane Law',1011031),(239,'Udon Comics Angelo Tsang',1011031),(240,'Chris Chuckry',1011031),(241,'Udon Comics Company',1011031),(242,'Michael Atiyeh',1009150),(243,'Dean White',1009150),(244,'Tom Chu',1009150),(245,'Tom Chus Color Dojo',1009150),(246,'Avalon Studios',1009150),(247,'Raymond Lee',1009150),(248,'Matt Milla',1009150),(249,'Jose Villarrubia',1009150),(250,'GCW',1009150),(251,'Mike Thomas',1009150),(252,'Marie Javins',1009150),(253,'Dana Moreshead',1009150),(254,'Rachelle Rosenberg',1011198),(255,'Jordie Bellaire',1011198),(256,'David Curiel',1011198),(257,'Romulo Fajardo Jr.',1011198),(258,'Triona Farrell',1011198),(259,'Marte Gracia',1011198),(260,'Federico Blee',1011198),(261,'Dono Sanchez-Almara',1011198),(262,'Andres Mossa',1011198),(263,'Elizabeth Dismang Breitweiser',1011198),(264,'Edgar Delgado',1011198),(265,'Adi Granov',1011198),(266,'Christopher Sotomayor',1011198),(267,'Dave Johnson',1011198),(268,'Joe Chiodo',1011136),(269,'Wildstorm FX',1011136),(270,'Martin Jimenez',1011136),(271,'June Chung',1011136),(272,'Dennis Calero',1011176),(273,'Marte Gracia',1011176),(274,'Raul Trevino',1011176),(275,'Dean White',1011176);
/*!40000 ALTER TABLE `colorist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comic`
--

DROP TABLE IF EXISTS `comic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `comic` (
  `idcomic` int(11) NOT NULL AUTO_INCREMENT,
  `idcomicservice` int(11) NOT NULL,
  `title` varchar(250) CHARACTER SET latin1 NOT NULL,
  `idcharacter` int(11) NOT NULL,
  PRIMARY KEY (`idcomic`),
  KEY `fk_comic_character_idx` (`idcharacter`),
  CONSTRAINT `fk_comic_character` FOREIGN KEY (`idcharacter`) REFERENCES `person` (`idcharacter`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comic`
--

LOCK TABLES `comic` WRITE;
/*!40000 ALTER TABLE `comic` DISABLE KEYS */;
INSERT INTO `comic` VALUES (1,22506,'Avengers: The Initiative (2007) #19',1011334),(2,22300,'Avengers: The Initiative (2007) #18 (ZOMBIE VARIANT)',1011334),(3,22299,'Avengers: The Initiative (2007) #18',1011334),(4,21975,'Avengers: The Initiative (2007) #17',1011334),(5,21741,'Avengers: The Initiative (2007) #16',1011334),(6,21546,'Avengers: The Initiative (2007) #15',1011334),(7,21366,'Avengers: The Initiative (2007) #14',1011334),(8,24571,'Avengers: The Initiative (2007) #14 (SPOTLIGHT VARIANT)',1011334),(9,8500,'Deadpool (1997) #44',1011334),(10,10225,'Marvel Premiere (1972) #37',1011334),(11,10224,'Marvel Premiere (1972) #36',1011334),(12,10223,'Marvel Premiere (1972) #35',1011334),(13,40628,'Hulk (2008) #55',1017100),(14,40630,'Hulk (2008) #54',1017100),(15,40632,'Hulk (2008) #53',1017100),(16,65941,'Iron Man Epic Collection: Doom (Trade Paperback)',1009144),(17,65466,'Captain America by Mark Waid, Ron Garney & Andy Kubert (Hardcover)',1009144),(18,65357,'Marvel Universe Avengers: Ultron Revolution (2017) #2',1009144),(19,64790,'Avengers by Brian Michael Bendis: The Complete Collection Vol. 2 (Trade Paperback)',1009144),(20,63220,'Avengers and Power Pack (2017) #6',1009144),(21,63219,'Avengers and Power Pack (2017) #5',1009144),(22,63218,'Avengers and Power Pack (2017) #4',1009144),(23,63217,'Avengers and Power Pack (2017) #3',1009144),(24,48818,'Secret Avengers (2013) #16',1009144),(25,48817,'Secret Avengers (2013) #15',1009144),(26,48816,'Secret Avengers (2013) #14',1009144),(27,46168,'Indestructible Hulk (2012) #3',1009144),(28,43944,'Iron Man (2012) #1',1009144),(29,36737,'Marvel Adventures Super Heroes (2010) #16',1009144),(30,36972,'Taskmaster (Trade Paperback)',1009144),(31,36763,'Ant-Man & the Wasp (2010) #3',1009144),(32,31068,'Incredible Hulks (2010) #606 (VARIANT)',1009144),(33,4214,'Avengers and Power Pack Assemble! (2006) #2',1009144),(34,2110,'MARVEL MASTERWORKS: CAPTAIN AMERICA VOL. 1 HC (Hardcover)',1009144),(35,2820,'Marvel Masterworks: Doctor Strange Vol. (Hardcover)',1009144),(36,40786,'Dark Avengers (2012) #183',1010699),(37,40787,'Dark Avengers (2012) #182',1010699),(38,40778,'Dark Avengers (2012) #181',1010699),(39,40774,'Dark Avengers (2012) #180',1010699),(40,40773,'Dark Avengers (2012) #179',1010699),(41,40776,'Dark Avengers (2012) #177',1010699),(42,38073,'Hulk (2008) #43',1010699),(43,11905,'Universe X (2000) #12',1010699),(44,11904,'Universe X (2000) #11',1010699),(45,11903,'Universe X (2000) #10',1010699),(46,11913,'Universe X (2000) #9',1010699),(47,11912,'Universe X (2000) #8',1010699),(48,11911,'Universe X (2000) #7',1010699),(49,11910,'Universe X (2000) #6',1010699),(50,60446,'Marvel Masterworks: The Incredible Hulk Vol. 11 (Hardcover)',1009146),(51,60692,'Incredible Hulk Epic Collection: The Hulk Must Die (Trade Paperback)',1009146),(52,59511,'Marvel Cinematic Universe Guidebook: The Avengers Initiative (Hardcover)',1009146),(53,34050,'Incredible Hulks (2010) #619',1009146),(54,31236,'Incredible Hulks (2010) #618',1009146),(55,29541,'Incredible Hulks (2010) #602 (SHS VARIANT)',1009146),(56,20863,'Hulk (2008) #3',1009146),(57,15894,'Irredeemable Ant-Man Vol. 1: Low-Life (2007)',1009146),(58,15908,'KILLRAVEN PREMIERE HC (Hardcover)',1009146),(59,5199,'Irredeemable Ant-Man (2006) #1',1009146),(60,4241,'EARTH X TPB (Trade Paperback)',1009146),(61,3435,'MARVEL MASTERWORKS: THE INCREDIBLE HULK VOL. 3 HC (Hardcover)',1009146),(62,2499,'Hulk: Destruction (2005) #4',1009146),(63,2577,'Marvel Visionaries: John Romita Jr. (Hardcover)',1009146),(64,1187,'Incredible Hulk Vol. IV: Abominable (Trade Paperback)',1009146),(65,1153,'Incredible Hulk Vol. 4: Abominable (Trade Paperback)',1009146),(66,14454,'Hulk (1999) #54',1009146),(67,14453,'Hulk (1999) #53',1009146),(68,14451,'Hulk (1999) #51',1009146),(69,1098,'Avengers Vol. 1: World Trust (Trade Paperback)',1009146),(70,40638,'Hulk (2008) #50',1016823),(71,15717,'Ultimate X-Men (2001) #26',1016823),(72,68619,'Immortal Hulk Vol. 2: The Green Door (Trade Paperback)',1009148),(73,67140,'Immortal Hulk (2018) #9',1009148),(74,66777,'Marvel Masterworks: The Avengers Vol. 18 (Hardcover)',1009148),(75,65327,'Black Bolt Vol. 1: Hard Time (Trade Paperback)',1009148),(76,66533,'Black Bolt (2017) #11',1009148),(77,64278,'Black Bolt (2017) #4',1009148),(78,63662,'Black Bolt (2017) #3',1009148),(79,55857,'Illuminati (2015) #7',1009148),(80,55856,'Illuminati (2015) #6',1009148),(81,55855,'Illuminati (2015) #5',1009148),(82,55854,'Illuminati (2015) #4',1009148),(83,55853,'Illuminati (2015) #3',1009148),(84,55851,'Illuminati (2015) #2',1009148),(85,55849,'Illuminati (2015) #1',1009148),(86,43507,'A+X (2012) #8',1009148),(87,36484,'Avengers Academy (2010) #19',1009148),(88,36479,'Avengers Academy (2010) #18',1009148),(89,38452,'Fear Itself: Fellowship of Fear (2011) #1',1009148),(90,36480,'Avengers Academy (2010) #17',1009148),(91,41433,'Fear Itself (2010) #2 (3rd Printing Variant)',1009148),(92,2539,'X-Men: The Complete Age of Apocalypse Epic Book 2 (Trade Paperback)',1009149),(93,13972,'Uncanny X-Men (1963) #431',1009149),(94,13970,'Uncanny X-Men (1963) #429',1009149),(95,13947,'Uncanny X-Men (1963) #406',1009149),(96,13946,'Uncanny X-Men (1963) #405',1009149),(97,13945,'Uncanny X-Men (1963) #404',1009149),(98,13943,'Uncanny X-Men (1963) #402',1009149),(99,12386,'X-Men: Alpha (1995) #1',1009149),(100,2539,'X-Men: The Complete Age of Apocalypse Epic Book 2 (Trade Paperback)',1010903),(101,18099,'Weapon X (1995) #1',1010903),(102,12386,'X-Men: Alpha (1995) #1',1010903),(103,73526,'Guardians Of The Galaxy Vol. 2: Faithless (Trade Paperback)',1010354),(104,71572,'Infinity Wars By Gerry Duggan: The Complete Collection (Hardcover)',1010354),(105,76749,'Guardians Of The Galaxy Annual (2019) #1',1010354),(106,73554,'Infinity War Omnibus (Hardcover)',1010354),(107,72781,'Infinity By Starlin & Hickman (Hardcover)',1010354),(108,74762,'Infinity Wars: Infinity (2019) #1',1010354),(109,67151,'Infinity Wars (2018) #6',1010354),(110,70422,'Warlock: Second Coming (Trade Paperback)',1010354),(111,67147,'Infinity Wars (2018) #2',1010354),(112,67349,'Infinity Wars Prime (2018) #1',1010354),(113,68656,'Infinity Countdown (2018) #5',1010354),(114,68653,'Infinity Countdown (2018) #4',1010354),(115,67022,'Infinity Countdown (2018) #3',1010354),(116,66964,'True Believers: Infinity War (2018) #1',1010354),(117,66684,'Infinity Countdown (2018) #2',1010354),(118,66801,'True Believers: Infinity Gauntlet (2018) #1',1010354),(119,62151,'All-New Guardians of the Galaxy Vol. 3: Infinity Quest (Trade Paperback)',1010354),(120,66429,'Infinity Gauntlet Aftermath (Hardcover)',1010354),(121,66436,'Infinity War Aftermath (Hardcover)',1010354),(122,66425,'Infinity Crusade (Hardcover)',1010354),(123,61430,'The Mighty Captain Marvel (2017) #5',1011297),(124,45950,'Cable and X-Force (2012) #8',1011297),(125,38319,'Astonishing X-Men (2004) #40',1011297),(126,40024,'Astonishing X-Men (2004) #40 (I Am Captain America Variant)',1011297),(127,38318,'Astonishing X-Men (2004) #38',1011297),(128,39890,'Heralds (Trade Paperback)',1011297),(129,30518,'S.W.O.R.D. (2009) #5',1011297),(130,26234,'S.W.O.R.D. (2009) #4',1011297),(131,26233,'S.W.O.R.D. (2009) #3',1011297),(132,24504,'Astonishing X-Men (2004) #33',1011297),(133,26232,'S.W.O.R.D. (2009) #2',1011297),(134,24503,'Astonishing X-Men (2004) #32',1011297),(135,17353,'Astonishing X-Men (2004) #24',1011297),(136,16119,'Astonishing X-Men (2004) #23',1011297),(137,6309,'Astonishing X-Men (2004) #22',1011297),(138,6120,'Astonishing X-Men (2004) #21',1011297),(139,5477,'Astonishing X-Men (2004) #19 (Variant)',1011297),(140,21845,'Cable & Deadpool (2004) #46 (Zombie Variant)',1011031),(141,5761,'Cable & Deadpool Vol. 2: The Burnt Offering (Trade Paperback)',1011031),(142,1649,'Cable & Deadpool (2004) #12',1011031),(143,394,'Agent X (2002) #15',1011031),(144,17707,'Agent X (2002) #14',1011031),(145,17706,'Agent X (2002) #13',1011031),(146,17705,'Agent X (2002) #12',1011031),(147,17704,'Agent X (2002) #11',1011031),(148,17703,'Agent X (2002) #10',1011031),(149,17716,'Agent X (2002) #9',1011031),(150,17715,'Agent X (2002) #8',1011031),(151,17714,'Agent X (2002) #7',1011031),(152,17713,'Agent X (2002) #6',1011031),(153,17712,'Agent X (2002) #5',1011031),(154,17711,'Agent X (2002) #4',1011031),(155,17710,'Agent X (2002) #3',1011031),(156,17709,'Agent X (2002) #2',1011031),(157,17702,'Agent X (2002) #1',1011031),(158,3357,'Weapon X: Days of Future Now (Trade Paperback)',1009150),(159,3016,'Weapon X: Days of Future Now (2005) #5',1009150),(160,2439,'Weapon X: Days of Future Now (2005) #4',1009150),(161,2324,'Weapon X: Days of Future Now (2005) #2',1009150),(162,2438,'Weapon X: Days of Future Now (2005) #3',1009150),(163,2204,'Weapon X: Days of Future Now (2005) #1',1009150),(164,246,'Weapon X (2002) #13',1009150),(165,18074,'Weapon X (2002) #12',1009150),(166,18092,'Weapon X (2002) #3',1009150),(167,18082,'Weapon X (2002) #2',1009150),(168,18408,'Weapon X: The Draft – Agent Zero (2002) #1',1009150),(169,14121,'Wolverine (1988) #176',1009150),(170,14110,'Wolverine (1988) #166',1009150),(171,14107,'Wolverine (1988) #163',1009150),(172,1023,'Wolverine/Deadpool: Weapon X (Trade Paperback)',1009150),(173,18176,'X-Man (1995) #-1',1009150),(174,18116,'X-Men Unlimited (1993) #15',1009150),(175,14211,'Wolverine (1988) #87',1009150),(176,18132,'X-Men Unlimited (1993) #3',1009150),(177,14190,'Wolverine (1988) #68',1009150),(178,83996,'Atlantis Attacks (2020) #5',1011198),(179,83995,'Atlantis Attacks (2020) #4',1011198),(180,83994,'Atlantis Attacks (2020) #3',1011198),(181,76984,'Incoming! (2019) #1',1011198),(182,76290,'War Of The Realms: New Agents Of Atlas (Trade Paperback)',1011198),(183,77001,'Agents of Atlas (2019) #1',1011198),(184,77260,'War of the Realms: New Agents of Atlas (2019) #4',1011198),(185,66661,'Agents of Atlas: The Complete Collection Vol. 1 (Trade Paperback)',1011198),(186,60490,'Wolverine: Prehistory (Trade Paperback)',1011198),(187,30040,'Atlas (2010) #5',1011198),(188,30039,'Atlas (2010) #4',1011198),(189,30037,'Atlas (2010) #2',1011198),(190,30033,'Atlas (2010) #1',1011198),(191,30286,'Avengers Vs. Atlas (2010) #4',1011198),(192,33560,'Avengers Vs. Atlas (2010) #3',1011198),(193,30284,'Avengers Vs. Atlas (2010) #2',1011198),(194,29620,'Avengers Vs. Atlas (2010) #1',1011198),(195,30760,'Avengers Vs. Atlas (2010) #1 (VARIANT)',1011198),(196,24355,'Agents of Atlas (2009) #11',1011198),(197,24354,'Agents of Atlas (2009) #10',1011198),(198,5589,'Heroes Reborn: Iron Man (Trade Paperback)',1011136),(199,4108,'Annihilation: Silver Surfer (2006) #1',1011136),(200,16331,'Iron Man (1996) #12',1011136),(201,16330,'Iron Man (1996) #11',1011136),(202,21707,'Incredible Hercules (2008) #120',1011176),(203,21505,'Incredible Hercules (2008) #119',1011176),(204,21324,'Incredible Hercules (2008) #118',1011176),(205,21175,'Incredible Hercules (2008) #117',1011176);
/*!40000 ALTER TABLE `comic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editor`
--

DROP TABLE IF EXISTS `editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `editor` (
  `ideditor` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET latin1 NOT NULL,
  `idcharacter` int(11) NOT NULL,
  PRIMARY KEY (`ideditor`),
  KEY `fk_editor_character_idx` (`idcharacter`),
  CONSTRAINT `fk_editor_character` FOREIGN KEY (`idcharacter`) REFERENCES `person` (`idcharacter`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editor`
--

LOCK TABLES `editor` WRITE;
/*!40000 ALTER TABLE `editor` DISABLE KEYS */;
INSERT INTO `editor` VALUES (168,'Tom Brevoort',1011334),(169,'Mark Paniccia',1017100),(170,'Jeff Youngquist',1009144),(171,'Nate Cosby',1009144),(172,'MacKenzie Cadenhead',1009144),(173,'Mark Paniccia',1009144),(174,'Tom Brevoort',1009144),(175,'Jonathan Moisan',1009144),(176,'Stephen Wacker',1009144),(177,'Jordan White',1009144),(178,'Tom Brennan',1010699),(179,'Mark Paniccia',1010699),(180,'Mike Marts',1010699),(181,'Jeff Youngquist',1009146),(182,'Mark Paniccia',1009146),(183,'Jordan White',1009146),(184,'Tom Brevoort',1009146),(185,'Joe Quesada',1009146),(186,'Aubrey Sitterson',1009146),(187,'Polly Watson',1009146),(188,'Marc Sumerak',1009146),(189,'Axel Alonso',1009146),(190,'Mike Marts',1009146),(191,'Mark Paniccia',1016823),(192,'C.B. Cebulski',1016823),(193,'Ralph Macchio',1016823),(194,'Brian Smith',1016823),(195,'Jeff Youngquist',1009148),(196,'Wilson Moss',1009148),(197,'Katie Kubert',1009148),(198,'Axel Alonso',1009148),(199,'Nick Lowe',1009148),(200,'Jordan White',1009148),(201,'Bill Rosemann',1009148),(202,'Mike O\'sullivan',1009148),(203,'Tom Brevoort',1009148),(204,'Kelly Corvese',1009149),(205,'Tom Defalco',1009149),(206,'Suzanne Gaffney',1009149),(207,'Bob Harras',1009149),(208,'Kelly Corvese',1010903),(209,'Tom Defalco',1010903),(210,'Suzanne Gaffney',1010903),(211,'Bob Harras',1010903),(212,'Jeff Youngquist',1010354),(213,'Darren Shan',1010354),(214,'Jordan White',1010354),(215,'Craig Anderson',1010354),(216,'Sana Amanat',1011297),(217,'Daniel Ketchum',1011297),(218,'Nick Lowe',1011297),(219,'Jeff Youngquist',1011297),(220,'Axel Alonso',1011297),(221,'Nicole Boose',1011031),(222,'Lauren Sankovitch',1011031),(223,'Nicole Wiley',1011031),(224,'Marc Sumerak',1011031),(225,'Tom Brevoort',1009150),(226,'Mike Marts',1009150),(227,'Ralph Macchio',1009150),(228,'Mike Raicht',1009150),(229,'Brian Smith',1009150),(230,'Jaye Gardner',1009150),(231,'Dan Hosek',1009150),(232,'Kelly Corvese',1009150),(233,'Bob Harras',1009150),(234,'Mark Paniccia',1011198),(235,'Tom Brevoort',1011198),(236,'Jeff Youngquist',1011198),(237,'Ruben Diaz',1011136),(238,'Michael Heisler',1011136),(239,'Mike Rockwitz',1011136),(240,'Michelle Upchurch',1011136),(241,'Mark Paniccia',1011176);
/*!40000 ALTER TABLE `editor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `idcharacter` int(11) NOT NULL,
  `name` varchar(250) CHARACTER SET latin1 NOT NULL,
  `last_sync` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idcharacter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1009144,'A.I.M.','2020-12-21 12:07:01'),(1009146,'Abomination (Emil Blonsky)','2020-12-21 12:07:06'),(1009148,'Absorbing Man','2020-12-21 12:07:09'),(1009149,'Abyss','2020-12-21 12:07:09'),(1009150,'Agent Zero','2020-12-21 12:07:14'),(1010354,'Adam Warlock','2020-12-21 12:07:12'),(1010699,'Aaron Stack','2020-12-21 12:07:04'),(1010846,'Aegis (Trey Rollins)','2020-12-21 12:07:13'),(1010870,'Ajaxis','2020-12-21 12:07:21'),(1010903,'Abyss (Age of Apocalypse)','2020-12-21 12:07:11'),(1011031,'Agent X (Nijo)','2020-12-21 12:07:14'),(1011136,'Air-Walker (Gabriel Lan)','2020-12-21 12:07:20'),(1011175,'Aginar','2020-12-21 12:07:20'),(1011176,'Ajak','2020-12-21 12:07:20'),(1011198,'Agents of Atlas','2020-12-21 12:07:17'),(1011266,'Adam Destine','2020-12-21 12:07:12'),(1011297,'Agent Brand','2020-12-21 12:07:13'),(1011334,'3-D Man','2020-12-21 12:07:00'),(1016823,'Abomination (Ultimate)','2020-12-21 12:07:08'),(1017100,'A-Bomb (HAS)','2020-12-21 12:07:01');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `writer`
--

DROP TABLE IF EXISTS `writer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `writer` (
  `idwriter` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET latin1 NOT NULL,
  `idcharacter` int(11) NOT NULL,
  PRIMARY KEY (`idwriter`),
  KEY `fk_writer_character_idx` (`idcharacter`),
  CONSTRAINT `fk_writer_character` FOREIGN KEY (`idcharacter`) REFERENCES `person` (`idcharacter`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=412 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `writer`
--

LOCK TABLES `writer` WRITE;
/*!40000 ALTER TABLE `writer` DISABLE KEYS */;
INSERT INTO `writer` VALUES (276,'Christos Gage',1011334),(277,'Dan Slott',1011334),(278,'Christopher Priest',1011334),(279,'Roy Thomas',1011334),(280,'Donald F. Glut',1011334),(281,'Jeff Parker',1017100),(282,'Danny Fingeroth',1009144),(283,'Randall Frenz',1009144),(284,'Dwayne Mcduffie',1009144),(285,'David Michelinie',1009144),(286,'Dann Thomas',1009144),(287,'Roy Thomas',1009144),(288,'Mark Waid',1009144),(289,'Vc Joe Caramagna',1009144),(290,'Brian Michael Bendis',1009144),(291,'Marc Sumerak',1009144),(292,'Nick Spencer',1009144),(293,'Ales Kot',1009144),(294,'Kieron Gillen',1009144),(295,'Todd Dezago',1009144),(296,'Fred Van Lente',1009144),(297,'Greg Pak',1009144),(298,'Jeff Parker',1010699),(299,'Jim Krueger',1010699),(300,'Robert Cassell',1009146),(301,'Len Wein',1009146),(302,'Gary Friedrich',1009146),(303,'Stan Lee',1009146),(304,'Greg Pak',1009146),(305,'Fred Van Lente',1009146),(306,'Jeph Loeb',1009146),(307,'Robert Kirkman',1009146),(308,'#X',1009146),(309,'Jim Krueger',1009146),(310,'Alex Ross',1009146),(311,'Peter David',1009146),(312,'Chris Claremont',1009146),(313,'Chuck Dixon',1009146),(314,'Paul Jenkins',1009146),(315,'Bruce Jones',1009146),(316,'Bob Layton',1009146),(317,'David Michelinie',1009146),(318,'Frank Miller',1009146),(319,'Ann Nocenti',1009146),(320,'Roger Stern',1009146),(321,'Chuck Austen',1009146),(322,'Geoff Johns',1009146),(323,'Bruce Jones',1016823),(324,'Mark Millar',1016823),(325,'Al Ewing',1009148),(326,'Tom Defalco',1009148),(327,'Scott Edelman',1009148),(328,'Mark Evanier',1009148),(329,'Steve Gerber',1009148),(330,'Steven Grant',1009148),(331,'Mark Gruenwald',1009148),(332,'Bill Mantlo',1009148),(333,'David Michelinie',1009148),(334,'Jim Shooter',1009148),(335,'Roger Slifer',1009148),(336,'Saladin Ahmed',1009148),(337,'Joshua Williamson',1009148),(338,'Gerry Duggan',1009148),(339,'Nathan Edmondson',1009148),(340,'Christopher Hastings',1009148),(341,'Christos Gage',1009148),(342,'Kevin Garcia',1009148),(343,'Matt Fraction',1009148),(344,'Warren Ellis',1009149),(345,'Larry Hama',1009149),(346,'Chuck Austen',1009149),(347,'Joe Casey',1009149),(348,'Scott Lobdell',1009149),(349,'Mark Waid',1009149),(350,'Warren Ellis',1010903),(351,'Larry Hama',1010903),(352,'Scott Lobdell',1010903),(353,'Mark Waid',1010903),(354,'Various',1010354),(355,'Gerry Duggan',1010354),(356,'Donny Cates',1010354),(357,'Al Ewing',1010354),(358,'Tini Howard',1010354),(359,'Lonnie Nadler',1010354),(360,'Zac Thompson',1010354),(361,'Tom Defalco',1010354),(362,'Ron Marz',1010354),(363,'Jim Starlin',1010354),(364,'Roy Thomas',1010354),(365,'Jonathan Hickman',1010354),(366,'Nick Spencer',1010354),(367,'Greg Pak',1010354),(368,'Mark Gruenwald',1010354),(369,'Margaret Stohl',1011297),(370,'Dennis \"Hopeless\" Hallum',1011297),(371,'Christos Gage',1011297),(372,'Kathryn Immonen',1011297),(373,'Kieron Gillen',1011297),(374,'Warren Ellis',1011297),(375,'Joss Whedon',1011297),(376,'Fabian Nicieza',1011031),(377,'Gail Simone',1011031),(378,'Daniel Way',1011031),(379,'Evan Dorkin',1011031),(380,'Buddy Scalera',1011031),(381,'Frank Tieri',1009150),(382,'Bruce Jones',1009150),(383,'Kelly Corvese',1009150),(384,'Terry Kavanagh',1009150),(385,'Larry Hama',1009150),(386,'Fabian Nicieza',1009150),(387,'Greg Pak',1011198),(388,'Jason Aaron',1011198),(389,'Saladin Ahmed',1011198),(390,'Ed Brisson',1011198),(391,'Donny Cates',1011198),(392,'Al Ewing',1011198),(393,'Eve Ewing',1011198),(394,'Jeff Parker',1011198),(395,'Don Glut',1011198),(396,'Neal Adams',1011198),(397,'Joe Casey',1011198),(398,'Christos Gage',1011198),(399,'Larry Hama',1011198),(400,'David Lapham',1011198),(401,'Howard Mackie',1011198),(402,'Mark Millar',1011198),(403,'Rick Spears',1011198),(404,'Timothy Truman',1011198),(405,'Paul Cornell',1011198),(406,'Jim Lee',1011136),(407,'Scott Lobdell',1011136),(408,'Jeph Loeb',1011136),(409,'Keith Giffen',1011136),(410,'Greg Pak',1011176),(411,'Fred Van Lente',1011176);
/*!40000 ALTER TABLE `writer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-21  9:14:33
