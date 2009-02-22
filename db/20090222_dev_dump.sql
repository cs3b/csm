-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.67-0ubuntu6


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema csm_development
--

CREATE DATABASE IF NOT EXISTS csm_development;
USE csm_development;

DROP TABLE IF EXISTS `audits`;
CREATE TABLE `audits` (
  `object_type` int(11) default NULL,
  `object_id` int(11) default NULL,
  `attribute_id` int(11) default NULL,
  `before` varchar(255) default NULL,
  `after` varchar(255) default NULL,
  `by` varchar(255) default NULL,
  `by_id` int(11) default NULL,
  `created_at` datetime default NULL,
  KEY `objects` (`object_type`,`object_id`),
  KEY `creation_time` (`created_at`),
  KEY `creator` (`by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `audits` VALUES  (30,74,31,'and ','and oraz nie jestem zalogowany',NULL,NULL,'2009-02-21 14:52:51'),
 (30,73,31,'given jestem na stronie gÅ‚Ã³wnej','given znajduje siÄ™ na stronie gÅ‚Ã³wnej',NULL,NULL,'2009-02-21 14:54:17'),
 (30,74,31,'and oraz nie jestem zalogowany','and nie jestem zalogowany',NULL,NULL,'2009-02-21 14:54:31'),
 (30,71,31,'when kliknÄ™ link zaloguj','when kliknÄ™ link \'zaloguj\'',NULL,NULL,'2009-02-21 14:55:01'),
 (30,72,31,'then zobacze strone logowani','then powinien zobaczyÄ‡ stronÄ™ logowani',NULL,NULL,'2009-02-21 14:55:17'),
 (30,72,31,'then powinien zobaczyÄ‡ stronÄ™ logowani','then powinien zobaczyÄ‡ stronÄ™ logowania',NULL,NULL,'2009-02-21 14:55:21'),
 (30,72,31,'Wtedy powinien zobaczyÄ‡ stronÄ™ logowania','Wtedy powinien zobaczyÄ‡ stronÄ™ logowaniaa',NULL,NULL,'2009-02-21 14:57:53'),
 (30,75,31,'Ale ','Ale nii',NULL,NULL,'2009-02-21 14:58:36'),
 (30,75,32,'202',NULL,NULL,NULL,'2009-02-21 15:22:20'),
 (30,75,31,'nii',NULL,NULL,NULL,'2009-02-21 15:22:20');
INSERT INTO `audits` VALUES  (30,76,31,'Oraz ','Oraz cierpliwie chwile poczekam',NULL,NULL,'2009-02-21 15:29:37'),
 (30,76,31,'Oraz cierpliwie chwile poczekam',NULL,NULL,NULL,'2009-02-21 15:29:44'),
 (30,77,31,'','Oraz cierpliwie poczekam',NULL,NULL,'2009-02-21 15:33:10'),
 (30,77,31,'Oraz cierpliwie poczekam',NULL,NULL,NULL,'2009-02-21 15:33:22'),
 (30,78,31,'','Oraz moc sie zalogowa',NULL,NULL,'2009-02-21 15:43:00'),
 (30,78,31,'Oraz moc sie zalogowa','Oraz mÃ³c sie zalogowa',NULL,NULL,'2009-02-21 15:43:51'),
 (30,78,31,'Oraz mÃ³c sie zalogowa','Oraz mÃ³c sie zalogowaÄ‡',NULL,NULL,'2009-02-21 15:43:57'),
 (10,16,12,'Logowanie sie uÅ¼ytkownikÃ³w','Logowanie sie uÅ¼ytkownika',NULL,NULL,'2009-02-21 15:47:12'),
 (10,16,15,'W celu determinowania autorstwa zawartosci','W celu jednoznacznoÅ›ci autorstwa zawartosci',NULL,NULL,'2009-02-21 15:47:27'),
 (10,16,14,'wszyscy','wszyscy uÅ¼ytkownicy',NULL,NULL,'2009-02-21 15:47:32'),
 (10,16,13,'ktÃ³ryz zaÅ‚oÅ¼Ä… konto bedÄ… mogli siÄ™ zalogowaÄ‡','ktÃ³rzy zaÅ‚oÅ¼Ä… konto bedÄ… mieli moÅ¼liwoÅ›Ä‡ siÄ™ zalogowaÄ‡',NULL,NULL,'2009-02-21 15:47:54'),
 (30,78,31,'Oraz mÃ³c sie zalogowaÄ‡',NULL,NULL,NULL,'2009-02-21 15:48:46');
INSERT INTO `audits` VALUES  (10,16,12,'Logowanie sie uÅ¼ytkownika','Logowanie siÄ™ uÅ¼ytkownika',NULL,NULL,'2009-02-21 19:54:08'),
 (10,3,12,'Utworzenie Cechy','Dodanie Cechy',NULL,NULL,'2009-02-21 19:54:30'),
 (30,21,31,'Dane jestem na stronie cech','Dane jestem na stronie wÅ‚Ä…sciwoÅ›ci',NULL,NULL,'2009-02-21 19:58:54'),
 (10,3,12,'Dodanie Cechy','Utworzenie nowej cechy',NULL,NULL,'2009-02-21 20:08:28'),
 (10,3,13,'Chce miec mozliwosc dodawania nowych \'Wlasciwosci\'','ChcÄ™ miec mozliwosc dodawania nowych \'Wlasciwosci\'','1',1,'2009-02-22 16:10:14'),
 (20,5,12,'Przejscie na stronÄ™ formularzy tworzenie \'Wlasciwosci\'','PrzejÅ›cie na stronÄ™ formularzy tworzenie \'Wlasciwosci\'','michalczyz@gmail.com',1,'2009-02-22 16:11:53');

DROP TABLE IF EXISTS `features`;
CREATE TABLE `features` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `what` varchar(255) default NULL,
  `who` varchar(255) default NULL,
  `why` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `deleted_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
INSERT INTO `features` VALUES  (3,'Utworzenie nowej cechy','ChcÄ™ miec mozliwosc dodawania nowych \'Wlasciwosci\'','jako klient','Aby opisywac nowe wlasciwosci w tworzonejj aplikacji','2009-02-01 18:45:33','2009-02-22 16:10:14',NULL),
 (4,'Przegladanie Cech','Chce mieÄ‡ moÅ¼liwoÅ›Ä‡ przeglÄ…dania \'WÅ‚aÅ›ciwoÅ›ci\'','jako klient i developer','Aby zobaczyÄ‡ jakie wÅ‚aÅ›ciwoÅ›ci posiada system','2009-02-01 19:00:24','2009-02-01 20:51:26',NULL),
 (5,'Edycja Cechy','Chce mieÄ‡ moÅ¼liwoÅ›Ä‡ edycji istniejÄ…cych juÅ¼ opisanych Cech systemu','jako klient','Aby poprawiaÄ‡ bÅ‚edy, oraz zmieniaÄ‡ zachownaie istniejÄ…cych funkcjonalnoÅ›ci','2009-02-01 19:04:48','2009-02-01 19:04:48',NULL),
 (6,'Zdeaktywowania Cechy','ChcÄ™ mieÄ‡ moÅ¼liwoÅ›Ä‡ deaktywowaÄ‡ ceche poprzez usuniÄ™cie','jako klient','W celu okreÅ›lenia Cechy systemu jako niepoÅ¼adanej','2009-02-01 19:07:06','2009-02-01 19:07:06',NULL),
 (7,'Dodanie Scenariusza','ChcÄ™ mieÄ‡ moÅ¼liwoÅ›Ä‡ dodawanie scenariuszy do cech','jako klient i developer','Aby prezentowaÄ‡ szczegÃ³lne przypadki w systemie','2009-02-01 19:13:47','2009-02-01 19:13:47',NULL),
 (8,'Dodanie Kroku do Scenariusza','chcÄ™ mieÄ‡ moÅ¼liwoÅ›Ä‡ dodanie dowolnej iloÅ›ci krokÃ³w do Scenariusza','jako klient i developer','Aby mÃ³c opisaÄ‡ sekwencje dziaÅ‚aÅ„ w scenariuszu','2009-02-01 19:17:52','2009-02-01 19:17:52',NULL);
INSERT INTO `features` VALUES  (10,'Logowanie siÄ™ uÅ¼ytkownikÃ³w','BÄ™dzie mÃ³gÅ‚ siÄ™ zalogowaÄ‡','KaÅ¼dy uÅ¼ytkownik','W celu determinowania autorstwa treÅ›ci wprowadzanej','2009-02-17 21:34:48','2009-02-21 09:57:46','2009-02-21 09:57:46'),
 (14,'title','oh','now','how','2009-02-21 09:26:41','2009-02-21 09:37:55','2009-02-21 09:37:54'),
 (15,'title','yujt','gfs','shdf','2009-02-21 14:18:12','2009-02-21 14:18:12','2009-02-21 14:36:45'),
 (16,'Logowanie siÄ™ uÅ¼ytkownika','ktÃ³rzy zaÅ‚oÅ¼Ä… konto bedÄ… mieli moÅ¼liwoÅ›Ä‡ siÄ™ zalogowaÄ‡','wszyscy uÅ¼ytkownicy','W celu jednoznacznoÅ›ci autorstwa zawartosci','2009-02-21 14:38:20','2009-02-21 19:54:08',NULL);

DROP TABLE IF EXISTS `scenario_steps`;
CREATE TABLE `scenario_steps` (
  `id` int(11) NOT NULL auto_increment,
  `keyword_id` int(11) default NULL,
  `instruction` varchar(255) default NULL,
  `parent_id` int(11) default NULL,
  `scenario_id` int(11) default NULL,
  `position` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `deleted_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
INSERT INTO `scenario_steps` VALUES  (1,101,'jestem na stronie tworzenia opisu funkcjonalności',0,1,1,'2009-01-26 18:47:56','2009-01-26 18:47:56',NULL),
 (2,201,'”umożliwić zarządzanie opisami funkcjonalności” w pole \'cel\'',3,1,1,NULL,NULL,NULL),
 (3,102,'wpisze ”Zarządzanie Scenariuszami” w pole \'tytuł\'',NULL,1,2,NULL,NULL,NULL),
 (4,1,'jestem na stronie tworzenia opisu funkcjonalnoÅ›ci',NULL,2,2,'2009-01-26 19:58:30','2009-01-26 19:58:30',NULL),
 (5,1,'jestem na stronie tworzenia opisu funkcjonalnoÅ›ci',NULL,2,2,'2009-01-26 20:06:57','2009-01-26 20:06:57',NULL),
 (6,101,NULL,NULL,NULL,2,'2009-01-26 20:09:15','2009-01-26 20:09:15',NULL),
 (7,101,NULL,NULL,NULL,2,'2009-01-26 20:09:50','2009-01-26 20:09:50',NULL),
 (8,101,'jestem na stronie tworzenia opisu funkcjonalnoÅ›ci',NULL,2,2,'2009-01-26 20:11:32','2009-01-26 20:11:32',NULL),
 (9,102,'wpisze â€ZarzÄ…dzanie Scenariuszamiâ€ w pole \'tytuÅ‚\'',NULL,2,2,'2009-01-26 20:13:30','2009-01-26 20:13:30',NULL),
 (10,103,'powinien zostaÄ‡ przeniesiony na stronÄ™ funcjonalnoÅ›ci',NULL,2,2,'2009-01-26 20:13:48','2009-01-26 20:13:48',NULL);
INSERT INTO `scenario_steps` VALUES  (11,101,'Jestem na stronie z listy funkcjonalnoÅ›ci',NULL,4,2,'2009-01-26 20:14:21','2009-01-26 20:14:21',NULL),
 (12,102,'wybiorÄ™ zakres \'od\' z kalendarza \'01.01.2009\'',NULL,4,2,'2009-01-26 20:14:36','2009-01-26 20:14:36',NULL),
 (13,201,'wybiorÄ™ zakres \'do\' z kalendarza \'10.01.2009\'',12,4,2,'2009-01-26 20:14:47','2009-01-26 20:14:47',NULL),
 (14,103,'powinienem zobaczyÄ‡ funcjonalnoÅ›ci dodane w okresie od \'01.01.2009\' do \'10.01.2009\'',NULL,4,2,'2009-01-26 20:17:50','2009-01-26 20:17:50',NULL),
 (15,201,'â€umoÅ¼liwiÄ‡ zarzÄ…dzanie opisami funkcjonalnoÅ›ciâ€ w pole \'cel\'',9,2,2,'2009-01-26 20:19:12','2009-01-26 20:19:12',NULL),
 (16,201,'â€klient lub programistaâ€ w pole \'jako\'',9,2,2,'2009-01-26 20:19:21','2009-01-26 20:19:21',NULL),
 (17,201,'â€mieÄ‡ moÅ¼liwoÅ›Ä‡ zarzÄ…dzania(dodawanie, edytowanie, usuwanie, przegladania) funkcjonalnoÅ›ciâ€ w polÄ™ \'chcÄ™\'',9,2,2,'2009-01-26 20:19:32','2009-01-26 20:19:32',NULL),
 (18,201,'nacisnÄ™ przycisk utwÃ³rz',9,2,2,'2009-01-26 20:19:46','2009-01-26 20:19:46',NULL);
INSERT INTO `scenario_steps` VALUES  (19,103,'Powinienem zobaczyÄ‡ formularz tworzenia cechy',NULL,5,2,'2009-02-01 19:47:50','2009-02-01 19:47:50',NULL),
 (20,102,'Klikne link \'dodaj nowÄ… ceche\'',NULL,5,2,'2009-02-01 19:48:18','2009-02-01 19:48:18',NULL),
 (21,101,'jestem na stronie wÅ‚Ä…sciwoÅ›ci',NULL,5,2,'2009-02-01 19:48:47','2009-02-21 19:58:54',NULL),
 (22,101,'jestem na stronie tworzenia nowej cechy',NULL,6,2,'2009-02-01 19:50:59','2009-02-01 19:50:59',NULL),
 (23,102,'wpisze \'dodanie nowej cechy\' w pole tytul',NULL,6,2,'2009-02-01 19:51:33','2009-02-01 19:51:33',NULL),
 (24,103,'wtedy powinienem zobaczyÄ‡ komunikat \'ceche dodano poprawnie\'',NULL,6,2,'2009-02-01 19:52:17','2009-02-01 19:52:17',NULL),
 (26,201,'o kliknÄ™ button \'utwÃ³rz\'',23,NULL,2,'2009-02-01 20:45:10','2009-02-01 20:45:10',NULL),
 (27,201,'i zostaÄ‡ przeniesiony na stronÄ™ cechy',24,NULL,1,'2009-02-01 20:49:09','2009-02-01 20:49:09',NULL),
 (28,102,'pojde tam gdzie chce',NULL,11,2,'2009-02-14 19:20:05','2009-02-15 18:52:52',NULL),
 (29,103,'byc moze bede tam gdzie chce',NULL,11,2,'2009-02-14 19:20:05','2009-02-15 18:53:09',NULL);
INSERT INTO `scenario_steps` VALUES  (30,101,'jestem tam gdzie jestem',NULL,11,2,'2009-02-14 19:20:05','2009-02-15 18:52:43',NULL),
 (31,102,'wwwww',NULL,12,2,'2009-02-14 20:33:58','2009-02-15 13:41:02',NULL),
 (32,201,'b-',31,NULL,1,'2009-02-14 20:33:58','2009-02-14 20:33:58',NULL),
 (33,103,'a',NULL,12,2,'2009-02-14 20:33:58','2009-02-14 20:33:58',NULL),
 (34,201,'a+',33,NULL,1,'2009-02-14 20:33:58','2009-02-14 20:33:58',NULL),
 (35,101,'c',NULL,12,2,'2009-02-14 20:33:58','2009-02-14 20:33:58',NULL),
 (36,202,'c+',35,NULL,1,'2009-02-14 20:33:58','2009-02-14 20:33:58',NULL),
 (37,102,'d',NULL,13,2,'2009-02-14 22:01:32','2009-02-14 22:01:32',NULL),
 (38,202,'dd',37,NULL,1,'2009-02-14 22:01:32','2009-02-14 22:01:32',NULL),
 (39,103,'t',NULL,13,2,'2009-02-14 22:01:32','2009-02-14 22:01:32',NULL),
 (40,202,'tt',39,NULL,1,'2009-02-14 22:01:32','2009-02-14 22:01:32',NULL),
 (41,101,'o',NULL,13,2,'2009-02-14 22:01:32','2009-02-14 22:01:32',NULL),
 (42,201,'aaaaaaaaaaaaaaaaa',41,NULL,1,'2009-02-14 22:01:32','2009-02-15 13:27:15',NULL),
 (43,102,'',NULL,14,2,'2009-02-14 23:07:01','2009-02-14 23:07:01',NULL);
INSERT INTO `scenario_steps` VALUES  (44,103,'tez',NULL,14,2,'2009-02-14 23:07:01','2009-02-15 13:36:11',NULL),
 (45,202,'kot ma ale',44,NULL,1,'2009-02-14 23:07:01','2009-02-15 14:34:29',NULL),
 (46,201,'hej tam w dolinie',44,NULL,2,'2009-02-14 23:07:01','2009-02-15 13:29:33',NULL),
 (47,201,'lae nie',44,NULL,3,'2009-02-14 23:07:01','2009-02-15 13:34:48',NULL),
 (48,101,'',NULL,14,2,'2009-02-14 23:07:01','2009-02-14 23:07:01',NULL),
 (49,102,'',NULL,15,2,'2009-02-14 23:24:35','2009-02-14 23:24:35','2009-02-21 14:36:45'),
 (50,103,'',NULL,15,2,'2009-02-14 23:24:35','2009-02-14 23:24:35','2009-02-21 14:36:45'),
 (51,202,'',50,NULL,1,'2009-02-14 23:24:35','2009-02-14 23:24:35','2009-02-21 14:36:45'),
 (52,202,'',50,NULL,2,'2009-02-14 23:24:35','2009-02-14 23:24:35','2009-02-21 14:36:45'),
 (53,101,'',NULL,15,2,'2009-02-14 23:24:35','2009-02-14 23:24:35','2009-02-21 14:36:45'),
 (55,201,'sie nie znuze',54,NULL,1,'2009-02-15 11:53:00','2009-02-15 11:53:00','2009-02-21 14:44:09'),
 (57,201,'aplikacja bedzie super',56,NULL,1,'2009-02-15 11:53:00','2009-02-15 11:53:00','2009-02-21 14:44:13'),
 (59,201,'troche pracy grafika',58,NULL,1,'2009-02-15 11:53:00','2009-02-15 11:53:00','2009-02-21 14:44:20');
INSERT INTO `scenario_steps` VALUES  (60,202,'nie bedzie mnie tu gdzie jestem',29,NULL,1,'2009-02-15 18:53:28','2009-02-15 18:53:28',NULL),
 (67,102,'test',NULL,15,NULL,'2009-02-21 14:21:35','2009-02-21 14:21:35','2009-02-21 14:36:45'),
 (68,103,'hej',NULL,15,NULL,'2009-02-21 14:21:35','2009-02-21 14:21:35','2009-02-21 14:36:45'),
 (69,202,'ho',68,NULL,NULL,'2009-02-21 14:21:35','2009-02-21 14:21:35','2009-02-21 14:36:45'),
 (70,101,'top',NULL,15,NULL,'2009-02-21 14:21:35','2009-02-21 14:21:35','2009-02-21 14:36:45'),
 (71,102,'kliknÄ™ link \'zaloguj\'',NULL,16,NULL,'2009-02-21 14:39:19','2009-02-21 14:55:01',NULL),
 (72,103,'powinien zobaczyÄ‡ stronÄ™ logowaniaa',NULL,16,NULL,'2009-02-21 14:39:19','2009-02-21 14:57:53',NULL),
 (73,101,'znajduje siÄ™ na stronie gÅ‚Ã³wnej',NULL,16,NULL,'2009-02-21 14:39:19','2009-02-21 14:54:17',NULL),
 (74,201,'nie jestem zalogowany',73,NULL,NULL,'2009-02-21 14:52:51','2009-02-21 14:54:31',NULL),
 (75,202,'nii',71,NULL,NULL,'2009-02-21 14:58:36','2009-02-21 14:58:36','2009-02-21 15:22:20'),
 (76,201,'cierpliwie chwile poczekam',71,NULL,NULL,'2009-02-21 15:29:37','2009-02-21 15:29:37','2009-02-21 15:29:44');
INSERT INTO `scenario_steps` VALUES  (77,201,'cierpliwie poczekam',71,NULL,NULL,'2009-02-21 15:33:10','2009-02-21 15:33:10','2009-02-21 15:33:22'),
 (78,201,'mÃ³c sie zalogowaÄ‡',72,NULL,NULL,'2009-02-21 15:43:00','2009-02-21 15:43:57','2009-02-21 15:48:46');

DROP TABLE IF EXISTS `scenarios`;
CREATE TABLE `scenarios` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `feature_id` int(11) default NULL,
  `position` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `deleted_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
INSERT INTO `scenarios` VALUES  (1,'Dodanie nowego opisu funcjonalności',1,NULL,'2009-01-26 17:26:47','2009-01-26 17:26:47',NULL),
 (2,'Dodanie nowego opisu funcjonalnoÅ›ci',2,NULL,'2009-01-26 19:09:52','2009-01-26 19:09:52',NULL),
 (4,'PrzÄ™gladnia funkcjonalnoÅ›ci ze wzgledu na date dodania',2,NULL,'2009-01-26 19:27:16','2009-01-26 19:27:16',NULL),
 (5,'PrzejÅ›cie na stronÄ™ formularzy tworzenie \'Wlasciwosci\'',3,NULL,'2009-02-01 18:48:23','2009-02-22 16:11:53',NULL),
 (6,'                                Utworzenie \'Wlasciwosci\'               ',3,NULL,'2009-02-01 18:49:04','2009-02-15 14:16:10',NULL),
 (7,'Przgladanie listy',4,NULL,'2009-02-01 20:52:11','2009-02-01 20:52:11',NULL),
 (8,'Przeszukiwanie listy',4,NULL,'2009-02-01 21:04:25','2009-02-01 21:04:25',NULL),
 (9,'dodanie scenariusza',7,NULL,'2009-02-01 21:28:41','2009-02-01 21:28:41',NULL),
 (10,'PrÃ³ba dodania scenariusza bez opisu',7,NULL,'2009-02-01 21:31:17','2009-02-01 21:31:17',NULL),
 (15,'wow',15,NULL,'2009-02-21 14:21:35','2009-02-21 14:21:35','2009-02-21 14:36:45'),
 (16,'Przejscie na strone logowania',16,NULL,'2009-02-21 14:39:19','2009-02-21 14:39:38',NULL);

DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `schema_migrations` VALUES  ('20081227082348'),
 ('20090101184824'),
 ('20090126163815'),
 ('20090219185335'),
 ('20090221092802'),
 ('20090221163035'),
 ('20090221173309');

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL auto_increment,
  `session_id` varchar(255) NOT NULL,
  `data` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
INSERT INTO `sessions` VALUES  (1,'BAh7CToQX2NzcmZfdG9rZW4iMVg0Mjlxa2JsMkhYK0ExMUp1VTltRWJTU0FRcmgxZENnbFRRKzhZTEFUdEU9Og9zZXNzaW9uX2lkIiViNTZhYzg2MGNhOGViNDFmYjM4ZTA3NzExZWYyYzk1MjoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA--2e4753558246092d2','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2009-02-21 17:34:16','2009-02-21 17:34:16'),
 (2,'BAh7CToQX2NzcmZfdG9rZW4iMVg0Mjlxa2JsMkhYK0ExMUp1VTltRWJTU0FRcmgxZENnbFRRKzhZTEFUdEU9Og9zZXNzaW9uX2lkIiViNTZhYzg2MGNhOGViNDFmYjM4ZTA3NzExZWYyYzk1MjoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA--2e4753558246092d2','BAh7BzoQX2NzcmZfdG9rZW4iMVJRamlOT2Vka0tOck5TaTlpKzdZaTBqc3N6\nWUlka3NFbnpSVlpOSzZxRVU9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy\nOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2009-02-21 17:34:21','2009-02-21 17:34:21'),
 (3,'BAh7CToQX2NzcmZfdG9rZW4iMVg0Mjlxa2JsMkhYK0ExMUp1VTltRWJTU0FRcmgxZENnbFRRKzhZTEFUdEU9Og9zZXNzaW9uX2lkIiViNTZhYzg2MGNhOGViNDFmYjM4ZTA3NzExZWYyYzk1MjoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA--2e4753558246092d2','BAh7BzoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpG\nbGFzaDo6Rmxhc2hIYXNoewY6C25vdGljZSIcU2lnbmVkIGluIHN1Y2Nlc3Nm\ndWxseS4GOgpAdXNlZHsGOwdG\n','2009-02-21 17:34:24','2009-02-21 17:34:24'),
 (4,'BAh7CToQX2NzcmZfdG9rZW4iMVg0Mjlxa2JsMkhYK0ExMUp1VTltRWJTU0FRcmgxZENnbFRRKzhZTEFUdEU9Og9zZXNzaW9uX2lkIiViNTZhYzg2MGNhOGViNDFmYjM4ZTA3NzExZWYyYzk1MjoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA--2e4753558246092d2','BAh7BzoQX2NzcmZfdG9rZW4iMXE1djZFWWd5SEI4bUxUVW1WUnkvalNvNG9T\nSEUyUGg2WmFGdk5DcnNSZWc9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy\nOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2009-02-21 17:34:24','2009-02-21 17:34:24');
INSERT INTO `sessions` VALUES  (5,'BAh7CToQX2NzcmZfdG9rZW4iMVg0Mjlxa2JsMkhYK0ExMUp1VTltRWJTU0FRcmgxZENnbFRRKzhZTEFUdEU9Og9zZXNzaW9uX2lkIiViNTZhYzg2MGNhOGViNDFmYjM4ZTA3NzExZWYyYzk1MjoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA--2e4753558246092d2','BAh7BzoQX2NzcmZfdG9rZW4iMTM2VVFQZEdULzFPQWZaSkpwSmViRDkzRGxR\nZzJvY3E2N3I3d1NpbFN0Q1k9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy\nOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2009-02-21 17:43:27','2009-02-21 17:43:27'),
 (6,'BAh7CToQX2NzcmZfdG9rZW4iMVg0Mjlxa2JsMkhYK0ExMUp1VTltRWJTU0FRcmgxZENnbFRRKzhZTEFUdEU9Og9zZXNzaW9uX2lkIiViNTZhYzg2MGNhOGViNDFmYjM4ZTA3NzExZWYyYzk1MjoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA--2e4753558246092d2','BAh7BzoQX2NzcmZfdG9rZW4iMXJSdFgxNlhiai9lblE1emZIV1BkSUthZ1Rn\nKzNuU3cxSkpvR01LdGZlUms9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy\nOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2009-02-21 17:43:31','2009-02-21 17:43:31'),
 (7,'BAh7CToQX2NzcmZfdG9rZW4iMVg0Mjlxa2JsMkhYK0ExMUp1VTltRWJTU0FRcmgxZENnbFRRKzhZTEFUdEU9Og9zZXNzaW9uX2lkIiViNTZhYzg2MGNhOGViNDFmYjM4ZTA3NzExZWYyYzk1MjoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA--2e4753558246092d2','BAh7BzoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpG\nbGFzaDo6Rmxhc2hIYXNoewY6C25vdGljZSIcU2lnbmVkIGluIHN1Y2Nlc3Nm\ndWxseS4GOgpAdXNlZHsGOwdG\n','2009-02-21 17:43:34','2009-02-21 17:43:34'),
 (8,'BAh7CToQX2NzcmZfdG9rZW4iMVg0Mjlxa2JsMkhYK0ExMUp1VTltRWJTU0FRcmgxZENnbFRRKzhZTEFUdEU9Og9zZXNzaW9uX2lkIiViNTZhYzg2MGNhOGViNDFmYjM4ZTA3NzExZWYyYzk1MjoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA--2e4753558246092d2','BAh7BzoQX2NzcmZfdG9rZW4iMW1rOGZOVER2NSszNXUvdlpqYzFZaEU0cDds\nSnAyM0I1bjJFMWlPOTZMZjA9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy\nOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2009-02-21 17:43:34','2009-02-21 17:43:34');
INSERT INTO `sessions` VALUES  (9,'BAh7CToQX2NzcmZfdG9rZW4iMVg0Mjlxa2JsMkhYK0ExMUp1VTltRWJTU0FRcmgxZENnbFRRKzhZTEFUdEU9Og9zZXNzaW9uX2lkIiViNTZhYzg2MGNhOGViNDFmYjM4ZTA3NzExZWYyYzk1MjoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA--2e4753558246092d2','BAh7BzoQX2NzcmZfdG9rZW4iMVlkb3pSejJ1NWJKb2VYWlhCNTBrSVhUVmY1\nN0dEK0VPWHBZTC9hUk1FUGM9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy\nOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2009-02-21 17:43:40','2009-02-21 17:43:40'),
 (10,'BAh7CToQX2NzcmZfdG9rZW4iMVg0Mjlxa2JsMkhYK0ExMUp1VTltRWJTU0FRcmgxZENnbFRRKzhZTEFUdEU9Og9zZXNzaW9uX2lkIiViNTZhYzg2MGNhOGViNDFmYjM4ZTA3NzExZWYyYzk1MjoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA--2e4753558246092d2','BAh7BzoQX2NzcmZfdG9rZW4iMXNpNkVzWXNSaHRMK2VVY1Jadkt3UWtJRDAr\nZ3BVNTVIaFZST1VlSThUaW89IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy\nOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2009-02-21 17:43:55','2009-02-21 17:43:55'),
 (11,'BAh7CToQX2NzcmZfdG9rZW4iMVg0Mjlxa2JsMkhYK0ExMUp1VTltRWJTU0FRcmgxZENnbFRRKzhZTEFUdEU9Og9zZXNzaW9uX2lkIiViNTZhYzg2MGNhOGViNDFmYjM4ZTA3NzExZWYyYzk1MjoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA--2e4753558246092d2','BAh7BjoMdXNlcl9pZGkG\n','2009-02-21 17:43:58','2009-02-21 17:43:58'),
 (12,'BAh7CToQX2NzcmZfdG9rZW4iMVg0Mjlxa2JsMkhYK0ExMUp1VTltRWJTU0FRcmgxZENnbFRRKzhZTEFUdEU9Og9zZXNzaW9uX2lkIiViNTZhYzg2MGNhOGViNDFmYjM4ZTA3NzExZWYyYzk1MjoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA--2e4753558246092d2','BAh7BjoMdXNlcl9pZGkG\n','2009-02-21 17:44:36','2009-02-21 17:44:36');
INSERT INTO `sessions` VALUES  (13,'71aa40eecdb54e46bc602bc90378d81c','BAh7BzoQX2NzcmZfdG9rZW4iMWU0KytJTUloN3IzN0VtOXVrY2RkRFkxZXNW\nQTYrcGVvQVFVb0h5NFh3Zk09IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy\nOjpGbGFzaDo6Rmxhc2hIYXNoewY6C25vdGljZSIeWW91IGhhdmUgYmVlbiBz\naWduZWQgb3V0LgY6CkB1c2VkewY7B1Q=\n','2009-02-21 17:45:02','2009-02-21 22:34:39'),
 (14,'4978eea593a1efbe6b33b01d501fd336','BAh7CDoQX2NzcmZfdG9rZW4iMStMbS9PYS9nMGU3RjlhNGJORHJwYmxxQ2dT\nMjN3QW1uRjEvOThud2ZHc1k9Ogx1c2VyX2lkaQYiCmZsYXNoSUM6J0FjdGlv\nbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2009-02-22 16:09:55','2009-02-22 16:50:44');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `email` varchar(255) default NULL,
  `encrypted_password` varchar(128) default NULL,
  `salt` varchar(128) default NULL,
  `token` varchar(128) default NULL,
  `token_expires_at` datetime default NULL,
  `email_confirmed` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `index_users_on_id_and_token` (`id`,`token`),
  KEY `index_users_on_email` (`email`),
  KEY `index_users_on_token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
INSERT INTO `users` VALUES  (1,'michalczyz@gmail.com','153f0a83d1fb21e6c8c7775b5430b35a097c0747','dc937ae4e36d62c0896b9273f98cd33210fa395d',NULL,NULL,1);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
