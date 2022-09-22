-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: purcell20200891
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `candidate_details`
--

DROP TABLE IF EXISTS `candidate_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate_details` (
  `candidateid` int NOT NULL COMMENT 'Candidate ID - Primary Key',
  `firstname` varchar(30) NOT NULL COMMENT 'First Name Candidate',
  `surname` varchar(30) NOT NULL COMMENT 'Surname of Candidate',
  `address` varchar(45) DEFAULT NULL COMMENT 'Residential Address of Candidate',
  `telephone` varchar(20) NOT NULL COMMENT 'Telephone Number of Candidate',
  PRIMARY KEY (`candidateid`),
  UNIQUE KEY `candidateid_UNIQUE` (`candidateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_details`
--

LOCK TABLES `candidate_details` WRITE;
/*!40000 ALTER TABLE `candidate_details` DISABLE KEYS */;
INSERT INTO `candidate_details` VALUES (1210,'John','Creighton','56 Whitethorn Avenue','01269442'),(1212,'Shireen','Ohani','24 Chestnut Grove','01269433'),(1213,'Matt','Townshend','33 Oak Road','01269123'),(1233,'Michael','Lowry','11 Main St','01269334'),(1332,'Susan','Leary','12 Oak Road','01288966'),(1334,'Aoife','Burke','2 Woodbine Park','01269231'),(5678,'Alex','Dihrak','67 Maple Avenue','01288699'),(5679,'Lou','Ryan','11 Blackbush Drive','01288696'),(5680,'Hannah','Zhang','71 Maple Avenue','01288669'),(5681,'Dan','Smith','31 Chestnut Grove','01269444');
/*!40000 ALTER TABLE `candidate_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department_details`
--

DROP TABLE IF EXISTS `department_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department_details` (
  `departmentid` int NOT NULL COMMENT 'Department ID - Primary Key',
  `departmentname` varchar(30) NOT NULL COMMENT 'Department Name',
  `address` varchar(30) NOT NULL COMMENT 'Address of Department in Building',
  `telephone` varchar(20) NOT NULL COMMENT 'Telephone Number of the Department',
  PRIMARY KEY (`departmentid`),
  UNIQUE KEY `departmentid_UNIQUE` (`departmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_details`
--

LOCK TABLES `department_details` WRITE;
/*!40000 ALTER TABLE `department_details` DISABLE KEYS */;
INSERT INTO `department_details` VALUES (12,'Database Mgmt','Floor 1A, Main St','44212344'),(13,'Accounts','Floor 1B, Main St','44212345'),(14,'Administration','Floor 1C, Main St','44212346'),(15,'Software Dev','Floor 2A, Main St','44212377'),(16,'Marketing','Floor 2B, Main St','44212378'),(17,'HR','Floor 2C, Main St','44212379'),(18,'Sales','Floor 3A, Main St','44212380'),(19,'Purchasing','Floor 3B, Main St','44212381'),(20,'Logistics','Floor 3C, Main St','44212382'),(21,'IT','Floor 4A, Main St','44212383');
/*!40000 ALTER TABLE `department_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interview_details`
--

DROP TABLE IF EXISTS `interview_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interview_details` (
  `interviewid` int NOT NULL COMMENT 'Interview ID Number - Primary Key',
  `departmentid` int NOT NULL COMMENT 'Department ID - Foreign Key of Dept_Details Table',
  `candidateid` int NOT NULL COMMENT 'Candidate ID - Foreign Key of Candidate Details Table',
  `positionid` int NOT NULL COMMENT 'Position ID - Foreign Key of Positions Table',
  `skillpos_id` varchar(15) NOT NULL COMMENT 'Position Skill  ID - Foreign Key of skills_position Table',
  `skillcan_id` varchar(15) NOT NULL COMMENT 'Candidate Skill  ID - Foreign Key of skills_candidate Table',
  `dateinterview` date NOT NULL COMMENT 'Date Interview took place',
  `interviewpass` varchar(5) NOT NULL DEFAULT 'FALSE' COMMENT 'Was candidate offered another interview or role? TRUE if yes FALSE if no',
  PRIMARY KEY (`interviewid`),
  UNIQUE KEY `interviewid_UNIQUE` (`interviewid`),
  KEY `departmentid_idx` (`departmentid`),
  KEY `positionid_idx` (`positionid`),
  KEY `skillpos_id_idx` (`skillpos_id`),
  KEY `skillcan_id_idx` (`skillcan_id`),
  KEY `candidateid` (`candidateid`),
  CONSTRAINT `candidateid` FOREIGN KEY (`candidateid`) REFERENCES `candidate_details` (`candidateid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `departmentid` FOREIGN KEY (`departmentid`) REFERENCES `department_details` (`departmentid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `positionid` FOREIGN KEY (`positionid`) REFERENCES `positions` (`positionid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `skillcan_id` FOREIGN KEY (`skillcan_id`) REFERENCES `skills_candidate` (`skillid_can`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `skillpos_id` FOREIGN KEY (`skillpos_id`) REFERENCES `skills_position` (`skillid_pos`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview_details`
--

LOCK TABLES `interview_details` WRITE;
/*!40000 ALTER TABLE `interview_details` DISABLE KEYS */;
INSERT INTO `interview_details` VALUES (100,12,1212,1,'12A','1A2','2020-11-11','FALSE'),(101,12,1212,6,'12B','1A2','2020-11-13','TRUE'),(102,12,5680,1,'12A','1B5','2020-11-16','TRUE'),(103,12,1212,6,'12B','1A2','2020-11-17','TRUE'),(104,15,1210,4,'15A','2A1','2020-11-17','TRUE'),(105,15,1334,4,'15A','1B4','2020-11-18','TRUE'),(106,13,1332,2,'13A','1A3','2020-11-18','FALSE'),(107,21,1233,9,'21A','1B2','2020-11-19','TRUE'),(108,13,5678,7,'13B','1B3','2020-11-19','TRUE'),(109,18,5681,5,'18A','1A8','2020-11-19','FALSE');
/*!40000 ALTER TABLE `interview_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `positionid` int NOT NULL COMMENT 'Position ID - Primary Key',
  `departmentid` int NOT NULL COMMENT 'Department ID - Foreign key from Department Details Table',
  `positiontype` varchar(30) NOT NULL COMMENT 'Details of Position',
  PRIMARY KEY (`positionid`),
  UNIQUE KEY `positionid_UNIQUE` (`positionid`),
  KEY `deparmentid_idx` (`departmentid`),
  CONSTRAINT `deparmentid` FOREIGN KEY (`departmentid`) REFERENCES `department_details` (`departmentid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,12,'Database Manager'),(2,13,'Accounts Supervisor'),(3,14,'Secretary'),(4,15,'Back End Engineer'),(5,18,'Sales Supervisor'),(6,12,'Database Administrator'),(7,13,'Accountant'),(8,14,'Intern'),(9,21,'IT Administrator'),(10,15,'Front End Engineer');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills_candidate`
--

DROP TABLE IF EXISTS `skills_candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills_candidate` (
  `skillid_can` varchar(10) NOT NULL COMMENT 'ID for the skills of candidate table - Primary Key',
  `candidate_id` int NOT NULL COMMENT 'ID of candidate from candidate_details table. Foreign Key',
  `skillone` varchar(25) NOT NULL COMMENT 'Details of skill of candidate',
  `skilltwo` varchar(25) NOT NULL COMMENT 'Details of skills of candidate',
  PRIMARY KEY (`skillid_can`),
  UNIQUE KEY `skillid_can_UNIQUE` (`skillid_can`),
  KEY `candidate_id_idx` (`candidate_id`),
  CONSTRAINT `candidate_id` FOREIGN KEY (`candidate_id`) REFERENCES `candidate_details` (`candidateid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills_candidate`
--

LOCK TABLES `skills_candidate` WRITE;
/*!40000 ALTER TABLE `skills_candidate` DISABLE KEYS */;
INSERT INTO `skills_candidate` VALUES ('1A2',1212,'SQL','PHP'),('1A3',1332,'Admin','Phone'),('1A4',1213,'Sales','Phone'),('1A5',5679,'Python','HTML'),('1A8',5681,'Phone','Supervisor Exp'),('1B2',1233,'SQL','Hardware'),('1B3',5678,'Excel','Tax'),('1B4',1334,'Excel','Python'),('1B5',5680,'SQL','Manage Exp'),('2A1',1210,'HTML','Python');
/*!40000 ALTER TABLE `skills_candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills_position`
--

DROP TABLE IF EXISTS `skills_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills_position` (
  `skillid_pos` varchar(15) NOT NULL COMMENT 'ID for the skills position requires table - Primary Key',
  `position_id` int NOT NULL COMMENT 'ID of position from positions table. Foreign Key',
  `skill1` varchar(20) NOT NULL COMMENT 'Details skills required for position',
  `skill2` varchar(20) NOT NULL COMMENT 'Details skills required for position',
  PRIMARY KEY (`skillid_pos`),
  UNIQUE KEY `skillid_pos_UNIQUE` (`skillid_pos`),
  KEY `position_id_idx` (`position_id`),
  CONSTRAINT `position_id` FOREIGN KEY (`position_id`) REFERENCES `positions` (`positionid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills_position`
--

LOCK TABLES `skills_position` WRITE;
/*!40000 ALTER TABLE `skills_position` DISABLE KEYS */;
INSERT INTO `skills_position` VALUES ('12A',1,'SQL','Manage Exp'),('12B',6,'SQL','PHP'),('13A',2,'Excel','Supervisor Exp'),('13B',7,'Excel','Tax'),('14A',3,'Admin','Phone'),('14B',8,'Admin','Excel'),('15A',4,'SQL','Python'),('15B',10,'HTML','Python'),('18A',5,'Phone','Sales'),('21A',9,'HTML','Hardware');
/*!40000 ALTER TABLE `skills_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'purcell20200891'
--

--
-- Dumping routines for database 'purcell20200891'
--
/*!50003 DROP PROCEDURE IF EXISTS `Candidate_Interview_Date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Candidate_Interview_Date`(IN p_dateinterview DATE)
BEGIN
SELECT i.candidateid
FROM interview_details i
WHERE i.dateinterview = p_dateinterview;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Candidate_Interview_More` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Candidate_Interview_More`()
BEGIN
SELECT i.candidateid, c.firstname, c.surname
FROM interview_details i, candidate_details c 
WHERE i.candidateid = c.candidateid
group by i.candidateid having count(*) > 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Candidate_Position_Skill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Candidate_Position_Skill`(IN p_skill1 VARCHAR(20), p_skill2 VARCHAR(20))
BEGIN
SELECT *
FROM interview_details i, skills_position sp, skills_candidate sc
WHERE i.positionid = sp.position_id
AND i.candidateid = sc.candidate_id
AND sp.skill1 = p_skill1
AND sp.skill2 = p_skill2
GROUP BY i.candidateid
HAVING sc.skillone = sp.skill1
OR sc.skilltwo = sp.skill2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DepartmentID_Finder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DepartmentID_Finder`(IN p_departmentname VARCHAR(30))
BEGIN
SELECT *
FROM department_details d
WHERE departmentname = p_departmentname;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Find_Eee_Firstname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Find_Eee_Firstname`(IN p_firstname varchar(30))
BEGIN
SELECT *
FROM candidate_details cd
WHERE firstname = p_firstname;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Find_Eee_Name_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Find_Eee_Name_ID`(IN p_candidateid INT)
BEGIN
SELECT cd.surname
FROM candidate_details cd
WHERE candidateid = p_candidateid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ID_Interview_Date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ID_Interview_Date`(IN p_dateinterview DATE)
BEGIN
SELECT *
FROM interview_details i 
WHERE i.dateinterview = p_dateinterview;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_Row_Candidate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_Row_Candidate`(IN p_candidateid INT, p_firstname varchar(30),
 p_surname varchar(30), p_address varchar(45), p_telephone varchar(20))
BEGIN
INSERT INTO `purcell20200891`.`candidate_details` (`candidateid`, `firstname`, `surname`, `address`, `telephone`)
VALUES (`p_candidateid`, `p_firstname`, `p_surname`, `p_address`, `p_telephone`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_Row_Department` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_Row_Department`(IN p_departmentid INT, p_departmentname varchar(30),
p_address varchar(30), p_telephone varchar(20))
BEGIN
INSERT INTO `purcell20200891`.`department_details` (`departmentid`, `departmentname`, `address`, `telephone`) 
VALUES (`p_departmentid`, `p_departmentname`, `p_address`, `p_telephone`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_Row_Interview` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_Row_Interview`(IN p_interviewid INT, p_departmentid INT, p_candidateid INT, p_positionid INT,
p_skillpos_id VARCHAR(15), p_skillcan_id VARCHAR(15), p_dateinterview DATE, p_interviewpass VARCHAR(5))
BEGIN
INSERT INTO `purcell20200891`.`interview_details` (`interviewid`, `departmentid`, `candidateid`, `positionid`,
 `skillpos_id`, `skillcan_id`, `dateinterview`, `interviewpass`) 
VALUES (`p_interviewid`, `p_departmentid`, `p_candidateid`, `p_positionid`, `p_skillpos_id`, `p_skillcan_id`,
 `p_dateinterview`, `p_interviewpass`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_Row_Positions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_Row_Positions`(IN p_positionid INT, p_departmentid INT, p_positiontype VARCHAR(30))
BEGIN
INSERT INTO `purcell20200891`.`positions` (`positionid`, `departmentid`, `positiontype`) 
VALUES (`p_positionid`, `p_departmentid`, `p_positiontype`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_Row_Skill_Can` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_Row_Skill_Can`(IN p_skillid_can VARCHAR(10), p_candidate_id INT, p_skillone VARCHAR(25),
p_skilltwo VARCHAR(25))
BEGIN
INSERT INTO `purcell20200891`.`skills_candidate` (`skillid_can`, `candidate_id`, `skillone`, `skilltwo`)
VALUES (`p_skillid_can`, `p_candidate_id`, `p_skillone`, `p_skilltwo`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insert_Row_Skill_Pos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_Row_Skill_Pos`(IN p_skillid_pos VARCHAR(15), p_position_id INT, p_skill1 VARCHAR(20),
p_skill2 VARCHAR(20))
BEGIN
INSERT INTO `purcell20200891`.`skills_position` (`skillid_pos`, `position_id`, `skill1`, `skill2`)
VALUES (`p_skillid_pos`, `p_position_id`, `p_skill1`, `p_skill2`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Number_Hires` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Number_Hires`()
BEGIN
SELECT count(i.interviewpass)
FROM interview_details i 
WHERE i.interviewpass = "TRUE";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Positions Admin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Positions Admin`()
BEGIN
SELECT count(sp.position_id)
FROM skills_position sp
WHERE skill1 = "Admin"
OR skill2 = "Admin";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Position_Skill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Position_Skill`(IN p_skill1 VARCHAR(20), p_skill2 VARCHAR(20))
BEGIN
SELECT p.positiontype
FROM positions p, skills_position sp
WHERE sp.position_id = p.positionid
AND sp.skill1 = p_skill1 
OR sp.skill2 = p_skill2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Position_Sort` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Position_Sort`()
BEGIN
SELECT p.positiontype
FROM positions p 
ORDER BY departmentid ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-23 15:13:00
