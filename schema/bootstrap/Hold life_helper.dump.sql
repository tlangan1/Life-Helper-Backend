-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: life_helper
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `goal`
--

DROP TABLE IF EXISTS `goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goal` (
  `goal_id` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(50) NOT NULL,
  `item_description` varchar(1000) NOT NULL,
  `started_dtm` datetime DEFAULT NULL,
  `completed_dtm` datetime DEFAULT NULL,
  `deleted_dtm` datetime DEFAULT NULL,
  `created_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_dtm` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`goal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal`
--

LOCK TABLES `goal` WRITE;
/*!40000 ALTER TABLE `goal` DISABLE KEYS */;
INSERT INTO `goal` VALUES (1,'Backup the \"life_helper\" database regularly','',NULL,NULL,NULL,'2025-02-12 15:07:43',NULL),(2,'Maintain Life Helper documentation','','2025-02-12 19:11:04',NULL,NULL,'2025-02-12 15:08:23','2025-02-12 19:11:04'),(3,'Allow links to be added to descriptions and notes','',NULL,NULL,NULL,'2025-02-12 15:12:24',NULL),(4,'Don\'t allow logically orphaned items.','For example, If a goal has tasks that are not all canceled than don\'t allow the goal to be cancelled. Likewise, if an objective has goals that are not all canceled than don\'t allow the objective to be cancelled.',NULL,NULL,NULL,'2025-02-12 15:13:47',NULL),(5,'Service worker enhancements','',NULL,NULL,NULL,'2025-02-12 15:14:40',NULL),(6,'Create the ability to attach goals and tasks','Enhance Life Helper to allow an existing goal to be attached to an objective or an existing task to be attached to a goal.',NULL,NULL,NULL,'2025-02-12 15:17:40',NULL),(7,'Use CSS nesting where applicable and useful','',NULL,NULL,NULL,'2025-02-12 15:20:38',NULL),(8,'Add an assigned to me checkbox in the filters','',NULL,NULL,NULL,'2025-02-12 15:22:15',NULL),(9,'When navigating around site remember the list.','When a user navigates away from the list remember where they were and return them there.',NULL,NULL,NULL,'2025-02-12 15:22:52',NULL),(10,'Associate a user with a started task','','2025-02-19 18:07:19',NULL,NULL,'2025-02-12 15:23:38','2025-02-19 18:07:19'),(11,'Create a log of the time a use worked on tasks','See the README Enhancements->Associate users with tasks description for the implementation details.',NULL,NULL,NULL,'2025-02-12 15:24:07',NULL),(12,'Miscellaneous enhancements','','2025-02-19 17:59:56',NULL,NULL,'2025-02-12 15:25:52','2025-02-19 17:59:56'),(13,'Add a confirm email step to registration','',NULL,NULL,NULL,'2025-02-12 15:27:46',NULL),(14,'Create a daily task list that is user specific','This is a list of tasks that the user can create that pop up every day to be completed and that are not associated with goals or objectives. This is just a list of tasks and can be reordered by the user using drag and drop.',NULL,NULL,NULL,'2025-02-12 15:28:41',NULL),(15,'Search Capability to find keywords','Add a search capability to find keywords in various textual data in the database and return a list of items that qualify.',NULL,NULL,NULL,'2025-02-12 15:29:40',NULL),(16,'Implement Federated Login','',NULL,NULL,NULL,'2025-02-12 15:30:25',NULL),(17,'Explore need for diff and missing sql in bootstrap','I don\'t think the diff and missing sql scripts in bootstrap are necessary, the MySQL comparison tools should be sufficient.',NULL,NULL,'2025-02-19 15:31:12','2025-02-12 15:30:53','2025-02-19 15:31:12'),(18,'Scaffold this app','Start with a bare bone VITE scaffolding using TypeScript and SolidJS.',NULL,NULL,NULL,'2025-02-12 15:43:54',NULL),(19,'Create a run date store','Create a run date store and use it to enforce the one-run-per-day rule.',NULL,NULL,NULL,'2025-02-12 15:44:47',NULL),(20,'Complete \"Web Authentication APIs\" Tutorial','',NULL,NULL,NULL,'2025-02-12 15:47:43',NULL),(21,'Integrate this functionality into Life Helper','',NULL,NULL,NULL,'2025-02-12 15:47:52',NULL),(22,'Watch this video','https://www.youtube.com/watch?v=mC76YxBpwAQ',NULL,NULL,NULL,'2025-02-12 15:48:33',NULL),(23,'Return to this tutorial after watching this video','https://www.youtube.com/watch?v=mC76YxBpwAQ',NULL,NULL,NULL,'2025-02-12 15:49:33',NULL),(24,'Miscellaneous enhancements','',NULL,NULL,NULL,'2025-02-12 15:50:35',NULL),(25,'Test goal for test Objective','',NULL,NULL,NULL,'2025-02-14 14:36:16',NULL),(26,'Implement Fetch Timeouts','','2025-02-19 13:47:13',NULL,NULL,'2025-02-19 12:46:46','2025-02-19 13:47:13'),(27,'Push events to application','If a user has signed up for web push then they will receive web pushes for all data updates','2025-02-19 15:36:56','2025-02-19 17:50:26',NULL,'2025-02-19 15:35:41','2025-02-19 17:50:26'),(28,'Create a list of assigned tasks ','Create a list of tasks which the user is currently  working on.',NULL,NULL,NULL,'2025-02-19 18:03:11',NULL);
/*!40000 ALTER TABLE `goal` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`tlangan`@`%`*/ /*!50003 TRIGGER `trigger_goal_update` AFTER UPDATE ON `goal` FOR EACH ROW BEGIN
    DECLARE done BOOL DEFAULT false;
    DECLARE id int;
	declare cur_objectives CURSOR for Select o.objective_id from objective o
    inner join objective_goal og on o.objective_id = og.objective_id and og.goal_id = OLD.goal_id;
	-- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER 
	FOR NOT FOUND SET done = true;

	Insert into trigger_log (statement) select "In the trigger, trigger_goal_update";
    
    drop temporary table if exists trigger_goal_update_temp;
    
    -- Since goal_id never changes once a goal is created then OLD.goal_id = NEW.goal_id
    set @goal_id = OLD.goal_id;

    IF OLD.started_dtm is null AND NEW.started_dtm is not null THEN
		-- This logic enforces the integrity of the data. It ensures
        -- that if an objective relies on one or more goals and at least one
        -- of them has been started then the objective should be in the 
        -- started state. The logic is enforced as follows:
		-- A goal has been started. If there are any objectives for which 
        -- this is the first of their goals to be started then
        -- the objective should be marked as started.
        -- Analogous logic is applied to the relationship between
        -- goals and tasks in the task update trigger.

		Insert into trigger_log (statement) select "In the started IF";
        
		Create temporary table trigger_goal_update_temp select o.objective_id from objective_goal og
        inner join objective o on og.objective_id = o.objective_id
		where og.goal_id = @goal_id
        and o.started_dtm Is Null;

		update objective set started_dtm = now() where objective_id in (select objective_id from trigger_goal_update_temp);
        
		drop temporary table if exists trigger_goal_update_temp;
    END IF;
    IF OLD.completed_dtm is null AND NEW.completed_dtm is not null THEN
		-- This logic enforces the integrity of the data. It ensures
        -- that if an objective relies on one or more goals and all of them
        -- have been completed then the objective should be in the completed
        -- state. The logic is enforced as follows:
		-- A goal has been completed. If there are no other open goals
        -- associated with any of the objectives it applies to then each of
        -- those objectives should be completed.
        -- Analogous logic is applied to the relationship between
        -- goals and tasks in the task update trigger.
        
		Insert into trigger_log (statement) select "In the completed IF";

		-- open the cursor
		OPEN cur_objectives;
		
		FETCH cur_objectives into id;
		WHILE Not done DO
			select count(*) into @open_goal_count from objective_goal og inner join goal g on og.goal_id = g.goal_id
			where og.objective_id = id
            and   g.completed_dtm Is Null
			and   g.deleted_dtm Is Null;
			
			IF @open_goal_count = 0 THEN
				update objective set completed_dtm = now() where objective_id = id;
			END IF;
			
			FETCH cur_objectives into id;
		END WHILE;

		-- close the cursor
		CLOSE cur_objectives;
	END IF;

	drop temporary table if exists trigger_goal_update_temp;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `goal_note`
--

DROP TABLE IF EXISTS `goal_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goal_note` (
  `goal_id` int NOT NULL,
  `note_id` int NOT NULL,
  `deleted_dtm` datetime DEFAULT NULL,
  `created_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`goal_id`,`note_id`),
  KEY `fk_goal_note_to_note` (`note_id`),
  CONSTRAINT `fk_goal_note_to_goal` FOREIGN KEY (`goal_id`) REFERENCES `goal` (`goal_id`),
  CONSTRAINT `fk_goal_note_to_note` FOREIGN KEY (`note_id`) REFERENCES `note` (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_note`
--

LOCK TABLES `goal_note` WRITE;
/*!40000 ALTER TABLE `goal_note` DISABLE KEYS */;
INSERT INTO `goal_note` VALUES (25,1,NULL,'2025-02-14 14:37:09');
/*!40000 ALTER TABLE `goal_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal_task`
--

DROP TABLE IF EXISTS `goal_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goal_task` (
  `goal_id` int NOT NULL,
  `task_id` int NOT NULL,
  `deleted_dtm` datetime DEFAULT NULL,
  `created_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`goal_id`,`task_id`),
  KEY `fk_goal_task_to_task` (`task_id`),
  CONSTRAINT `fk_goal_task_to_goal` FOREIGN KEY (`goal_id`) REFERENCES `goal` (`goal_id`),
  CONSTRAINT `fk_goal_task_to_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_task`
--

LOCK TABLES `goal_task` WRITE;
/*!40000 ALTER TABLE `goal_task` DISABLE KEYS */;
INSERT INTO `goal_task` VALUES (2,1,NULL,'2025-02-12 15:09:52'),(2,2,NULL,'2025-02-12 15:10:59'),(2,11,NULL,'2025-02-19 12:46:02'),(5,3,NULL,'2025-02-12 15:15:34'),(5,6,NULL,'2025-02-12 15:29:18'),(6,4,NULL,'2025-02-12 15:18:49'),(10,16,NULL,'2025-02-19 18:07:15'),(12,5,NULL,'2025-02-12 15:26:05'),(12,9,NULL,'2025-02-12 15:57:41'),(12,10,NULL,'2025-02-12 15:59:26'),(12,17,NULL,'2025-02-25 10:15:51'),(18,7,NULL,'2025-02-12 15:44:24'),(24,8,NULL,'2025-02-12 15:50:53'),(26,12,NULL,'2025-02-19 12:47:29'),(26,13,NULL,'2025-02-19 12:47:35'),(26,14,NULL,'2025-02-19 12:47:56'),(27,15,NULL,'2025-02-19 15:36:46');
/*!40000 ALTER TABLE `goal_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `note` (
  `note_id` int NOT NULL AUTO_INCREMENT,
  `note` varchar(1000) NOT NULL,
  `deleted_dtm` datetime DEFAULT NULL,
  `created_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
INSERT INTO `note` VALUES (1,'Test note for test goal',NULL,'2025-02-14 14:37:09');
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objective`
--

DROP TABLE IF EXISTS `objective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objective` (
  `objective_id` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(50) NOT NULL,
  `item_description` varchar(1000) NOT NULL,
  `started_dtm` datetime DEFAULT NULL,
  `completed_dtm` datetime DEFAULT NULL,
  `deleted_dtm` datetime DEFAULT NULL,
  `created_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_dtm` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`objective_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objective`
--

LOCK TABLES `objective` WRITE;
/*!40000 ALTER TABLE `objective` DISABLE KEYS */;
INSERT INTO `objective` VALUES (1,'Create the Life Helper Application','','2025-02-12 19:11:04',NULL,NULL,'2025-02-12 15:05:16','2025-02-12 19:11:04'),(2,'Create a NWS Prediction Tracker','Build this application using TypeScript and VITE. Deploy it to GitHub using the GitHub Actions and not from a branch so that index.html does not have to reside at the root of the project.',NULL,NULL,NULL,'2025-02-12 15:43:24',NULL),(3,'Master Web Authentication','',NULL,NULL,NULL,'2025-02-12 15:47:21',NULL),(4,'Study Artificial Intelligence','',NULL,NULL,NULL,'2025-02-12 15:48:11',NULL),(5,'Enhance my resume','',NULL,NULL,NULL,'2025-02-12 15:50:06',NULL),(6,'Test Objective','',NULL,NULL,NULL,'2025-02-14 14:35:51',NULL);
/*!40000 ALTER TABLE `objective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objective_goal`
--

DROP TABLE IF EXISTS `objective_goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objective_goal` (
  `objective_id` int NOT NULL,
  `goal_id` int NOT NULL,
  `deleted_dtm` datetime DEFAULT NULL,
  `created_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`objective_id`,`goal_id`),
  KEY `fk_objective_goal_to_goal` (`goal_id`),
  CONSTRAINT `fk_objective_goal_to_goal` FOREIGN KEY (`goal_id`) REFERENCES `goal` (`goal_id`),
  CONSTRAINT `fk_objective_goal_to_objective` FOREIGN KEY (`objective_id`) REFERENCES `objective` (`objective_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objective_goal`
--

LOCK TABLES `objective_goal` WRITE;
/*!40000 ALTER TABLE `objective_goal` DISABLE KEYS */;
INSERT INTO `objective_goal` VALUES (1,1,NULL,'2025-02-12 15:07:43'),(1,2,NULL,'2025-02-12 15:08:23'),(1,3,NULL,'2025-02-12 15:12:24'),(1,4,NULL,'2025-02-12 15:13:47'),(1,5,NULL,'2025-02-12 15:14:40'),(1,6,NULL,'2025-02-12 15:17:40'),(1,7,NULL,'2025-02-12 15:20:38'),(1,8,NULL,'2025-02-12 15:22:15'),(1,9,NULL,'2025-02-12 15:22:52'),(1,10,NULL,'2025-02-12 15:23:38'),(1,11,NULL,'2025-02-12 15:24:07'),(1,12,NULL,'2025-02-12 15:25:52'),(1,13,NULL,'2025-02-12 15:27:46'),(1,14,NULL,'2025-02-12 15:28:41'),(1,15,NULL,'2025-02-12 15:29:40'),(1,16,NULL,'2025-02-12 15:30:25'),(1,17,NULL,'2025-02-12 15:30:53'),(1,26,NULL,'2025-02-19 12:46:46'),(1,27,NULL,'2025-02-19 15:35:41'),(1,28,NULL,'2025-02-19 18:03:11'),(2,18,NULL,'2025-02-12 15:43:54'),(2,19,NULL,'2025-02-12 15:44:47'),(3,20,NULL,'2025-02-12 15:47:43'),(3,21,NULL,'2025-02-12 15:47:52'),(4,22,NULL,'2025-02-12 15:48:33'),(4,23,NULL,'2025-02-12 15:49:33'),(5,24,NULL,'2025-02-12 15:50:35'),(6,25,NULL,'2025-02-14 14:36:16');
/*!40000 ALTER TABLE `objective_goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objective_note`
--

DROP TABLE IF EXISTS `objective_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objective_note` (
  `objective_id` int NOT NULL,
  `note_id` int NOT NULL,
  `deleted_dtm` datetime DEFAULT NULL,
  `created_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`objective_id`,`note_id`),
  KEY `fk_objective_note_to_note` (`note_id`),
  CONSTRAINT `fk_objective_note_to_note` FOREIGN KEY (`note_id`) REFERENCES `note` (`note_id`),
  CONSTRAINT `fk_objective_note_to_objective` FOREIGN KEY (`objective_id`) REFERENCES `objective` (`objective_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objective_note`
--

LOCK TABLES `objective_note` WRITE;
/*!40000 ALTER TABLE `objective_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `objective_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_error`
--

DROP TABLE IF EXISTS `sql_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sql_error` (
  `sql_error_id` int NOT NULL AUTO_INCREMENT,
  `sql_error` varchar(1024) NOT NULL,
  `stored_procedure_name` varchar(50) NOT NULL,
  `additional_information` varchar(1024) NOT NULL,
  `created_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sql_error_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_error`
--

LOCK TABLES `sql_error` WRITE;
/*!40000 ALTER TABLE `sql_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `sql_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `task_id` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(50) NOT NULL,
  `item_description` varchar(1000) NOT NULL,
  `started_dtm` datetime DEFAULT NULL,
  `paused_dtm` datetime DEFAULT NULL,
  `completed_dtm` datetime DEFAULT NULL,
  `deleted_dtm` datetime DEFAULT NULL,
  `created_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_dtm` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'Include the new routes in the documentation','I do not think the isProduction and possibly the login and registration routes are documented.','2025-02-12 19:11:04',NULL,'2025-02-12 19:11:07',NULL,'2025-02-12 15:09:52','2025-02-12 19:11:07'),(2,'Document the registration and login mechanisms','',NULL,NULL,NULL,NULL,'2025-02-12 15:10:59',NULL),(3,'Prevent requesting multiple web push subscription ','',NULL,NULL,NULL,NULL,'2025-02-12 15:15:34',NULL),(4,'Create an attach item route','',NULL,NULL,NULL,NULL,'2025-02-12 15:18:49',NULL),(5,'Navigate to Home after logging in','','2025-02-19 17:59:56',NULL,'2025-02-19 17:59:58',NULL,'2025-02-12 15:26:05','2025-02-19 17:59:58'),(6,'Disable Web Push Request Button when appropriate','Disable the Request A Web Push Subscription\" button if the service worker sends a message that it has been activated.\"',NULL,NULL,NULL,NULL,'2025-02-12 15:29:18',NULL),(7,'Use this TypeScript advice','See this site, https://dev.to/fkrasnowski/simple-kv-storage-on-top-of-indexeddb-3jcg to assist in building the promise based solution.',NULL,NULL,NULL,NULL,'2025-02-12 15:44:24',NULL),(8,'Add Full stack to the resume','',NULL,NULL,NULL,NULL,'2025-02-12 15:50:53',NULL),(9,'Put service worker buttons in account route','Put the \"web push request\" and the \"send the service worker a message\" buttons on the account panel.',NULL,NULL,NULL,NULL,'2025-02-12 15:57:41',NULL),(10,'Replace failed login alert with a DOM message','Instead of displaying \"login failed\" as an alert, use the DOM to communicate the failure.',NULL,NULL,NULL,NULL,'2025-02-12 15:59:26',NULL),(11,'Document response payloads in Express README','','2025-02-19 15:12:00',NULL,'2025-02-19 15:12:02',NULL,'2025-02-19 12:46:02','2025-02-19 15:12:02'),(12,'Add a fetch timeout for post requests','','2025-02-19 15:29:11','2025-02-19 17:48:58',NULL,NULL,'2025-02-19 12:47:29','2025-02-19 17:48:58'),(13,'Add a fetch timeout for get requests','','2025-02-19 13:47:13','2025-02-19 17:48:50',NULL,NULL,'2025-02-19 12:47:35','2025-02-19 17:48:50'),(14,'Ignore fetch timeouts in \"dev\" mode','',NULL,NULL,NULL,NULL,'2025-02-19 12:47:56',NULL),(15,'Enable web pushes for goals and objectives','Note, tasks already function','2025-02-19 15:36:56',NULL,'2025-02-19 17:50:26',NULL,'2025-02-19 15:36:46','2025-02-19 17:50:26'),(16,'Design a way to associate users with tasks','','2025-02-19 18:07:19',NULL,NULL,NULL,'2025-02-19 18:07:15','2025-02-19 18:07:19'),(17,'Add domain name to web_push_subscription entity.','','2025-02-25 10:15:55',NULL,NULL,NULL,'2025-02-25 10:15:51','2025-02-25 10:15:55');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`tlangan`@`%`*/ /*!50003 TRIGGER `trigger_task_update` AFTER UPDATE ON `task` FOR EACH ROW BEGIN
    DECLARE done BOOL DEFAULT false;
    DECLARE id int;
	DECLARE cur_goals CURSOR for Select g.goal_id from goal g
    inner join goal_task gt on g.goal_id = gt.goal_id and task_id = OLD.task_id;
	-- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER 
	FOR NOT FOUND SET done = true;

	Insert into trigger_log (statement) select "In the trigger, trigger_task_update";
    
    drop temporary table if exists trigger_task_update_temp;
    
    -- Since task_id never changes once a task is created then OLD.task_id = NEW.task_id

    IF OLD.started_dtm is null AND NEW.started_dtm is not null THEN
		-- This logic enforces the integrity of the data. It ensures
        -- that if a goal relies on one or more tasks and at least one
        -- of them has been started then the goal should be in the 
        -- started state. The logic is enforced as follows:
		-- A task has been started. If there are any goals for which 
        -- this is the first of their tasks to be started then
        -- the goal should be marked as started.
        -- Analogous logic is applied to the relationship between
        -- objectives and goals in the goal update trigger.

		Insert into trigger_log (statement) select "In the started IF";
        
		Create temporary table trigger_task_update_temp select g.goal_id from goal_task gt
        inner join goal g on gt.goal_id = g.goal_id
		where gt.task_id = OLD.task_id
        and g.started_dtm Is Null;
        
		update goal set started_dtm = now() where goal_id in (select goal_id from trigger_task_update_temp);
        
		drop temporary table if exists trigger_task_update_temp;
    END IF;
    IF OLD.completed_dtm is null AND NEW.completed_dtm is not null THEN
		-- This logic enforces the integrity of the data. It ensures
        -- that if a goal relies on one or more tasks and all of them
        -- have been completed then the goal should be in the completed
        -- state. The logic is enforced as follows:
		-- A task has been completed. If there are no other open tasks
        -- associated with any of the goals it applies to then each of
        -- those goals should be completed.
        -- Analogous logic is applied to the relationship between
        -- objectives and goals in the goal update trigger.
        
		Insert into trigger_log (statement) select "In the completed IF";

		-- open the cursor
		OPEN cur_goals;
		
		FETCH cur_goals into id;
		WHILE Not done DO
			select count(*) into @open_task_count from goal_task gt inner join task t on gt.task_id = t.task_id
			where gt.goal_id = id
            and   t.completed_dtm Is Null
			and   t.deleted_dtm Is Null;
			
			IF @open_task_count = 0 THEN
				update goal set completed_dtm = now() where goal_id = id;
			END IF;
			
			FETCH cur_goals into id;
		END WHILE;

		-- close the cursor
		CLOSE cur_goals;
	END IF;

	drop temporary table if exists trigger_task_update_temp;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `task_note`
--

DROP TABLE IF EXISTS `task_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_note` (
  `task_id` int NOT NULL,
  `note_id` int NOT NULL,
  `deleted_dtm` datetime DEFAULT NULL,
  `created_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`task_id`,`note_id`),
  KEY `fk_task_note_to_note` (`note_id`),
  CONSTRAINT `fk_task_note_to_note` FOREIGN KEY (`note_id`) REFERENCES `note` (`note_id`),
  CONSTRAINT `fk_task_note_to_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_note`
--

LOCK TABLES `task_note` WRITE;
/*!40000 ALTER TABLE `task_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_log`
--

DROP TABLE IF EXISTS `trigger_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trigger_log` (
  `trigger_log_id` int NOT NULL AUTO_INCREMENT,
  `statement` varchar(100) DEFAULT NULL,
  `integer_result` int DEFAULT NULL,
  `string_result` varchar(100) DEFAULT NULL,
  `created_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`trigger_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_log`
--

LOCK TABLES `trigger_log` WRITE;
/*!40000 ALTER TABLE `trigger_log` DISABLE KEYS */;
INSERT INTO `trigger_log` VALUES (1,'In the trigger, trigger_goal_update',NULL,NULL,'2025-02-12 15:55:21'),(2,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-12 19:11:04'),(3,'In the started IF',NULL,NULL,'2025-02-12 19:11:04'),(4,'In the trigger, trigger_goal_update',NULL,NULL,'2025-02-12 19:11:04'),(5,'In the started IF',NULL,NULL,'2025-02-12 19:11:04'),(6,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-12 19:11:07'),(7,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-12 19:11:07'),(8,'In the completed IF',NULL,NULL,'2025-02-12 19:11:07'),(9,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-19 13:47:13'),(10,'In the started IF',NULL,NULL,'2025-02-19 13:47:13'),(11,'In the trigger, trigger_goal_update',NULL,NULL,'2025-02-19 13:47:13'),(12,'In the started IF',NULL,NULL,'2025-02-19 13:47:13'),(13,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-19 13:49:17'),(14,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-19 13:49:19'),(15,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-19 13:52:43'),(16,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-19 13:52:47'),(17,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-19 13:52:50'),(18,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-19 13:53:30'),(19,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-19 13:53:34'),(20,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-19 13:53:45'),(21,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-19 15:12:00'),(22,'In the started IF',NULL,NULL,'2025-02-19 15:12:00'),(23,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-19 15:12:02'),(24,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-19 15:12:02'),(25,'In the completed IF',NULL,NULL,'2025-02-19 15:12:02'),(26,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-19 15:29:11'),(27,'In the started IF',NULL,NULL,'2025-02-19 15:29:11'),(28,'In the trigger, trigger_goal_update',NULL,NULL,'2025-02-19 15:31:12'),(29,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-19 15:36:56'),(30,'In the started IF',NULL,NULL,'2025-02-19 15:36:56'),(31,'In the trigger, trigger_goal_update',NULL,NULL,'2025-02-19 15:36:56'),(32,'In the started IF',NULL,NULL,'2025-02-19 15:36:56'),(33,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-19 17:48:50'),(34,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-19 17:48:58'),(35,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-19 17:50:26'),(36,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-19 17:50:26'),(37,'In the completed IF',NULL,NULL,'2025-02-19 17:50:26'),(38,'In the trigger, trigger_goal_update',NULL,NULL,'2025-02-19 17:50:26'),(39,'In the completed IF',NULL,NULL,'2025-02-19 17:50:26'),(40,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-19 17:59:56'),(41,'In the started IF',NULL,NULL,'2025-02-19 17:59:56'),(42,'In the trigger, trigger_goal_update',NULL,NULL,'2025-02-19 17:59:56'),(43,'In the started IF',NULL,NULL,'2025-02-19 17:59:56'),(44,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-19 17:59:58'),(45,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-19 17:59:58'),(46,'In the completed IF',NULL,NULL,'2025-02-19 17:59:58'),(47,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-19 18:07:19'),(48,'In the started IF',NULL,NULL,'2025-02-19 18:07:19'),(49,'In the trigger, trigger_goal_update',NULL,NULL,'2025-02-19 18:07:19'),(50,'In the started IF',NULL,NULL,'2025-02-19 18:07:19'),(51,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-25 10:15:55'),(52,'In the started IF',NULL,NULL,'2025-02-25 10:15:55');
/*!40000 ALTER TABLE `trigger_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login`
--

DROP TABLE IF EXISTS `user_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_login` (
  `user_login_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `hashed_password` varchar(100) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `display_name` varchar(30) NOT NULL,
  `email_address` varchar(100) DEFAULT NULL,
  `created_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_dtm` datetime DEFAULT NULL,
  PRIMARY KEY (`user_login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login`
--

LOCK TABLES `user_login` WRITE;
/*!40000 ALTER TABLE `user_login` DISABLE KEYS */;
INSERT INTO `user_login` VALUES (1,'Tom.Langan@Comcast.net','$2b$10$bKNmdmCM.WC.wjfmSavLZuzxgVrRLtL3aGlOZFVnAljgcG5g6qN5.','Thomas H Langan','Thomas','Tom.Langan@Comcast.net','2025-02-13 10:02:39',NULL);
/*!40000 ALTER TABLE `user_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_push_subscription`
--

DROP TABLE IF EXISTS `web_push_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_push_subscription` (
  `web_push_subscription_id` int NOT NULL AUTO_INCREMENT,
  `capability_url` varchar(250) NOT NULL,
  `public_key` varchar(100) NOT NULL,
  `private_key` varchar(100) NOT NULL,
  `subscribed_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `unsubscribed_or_expired_dtm` datetime DEFAULT NULL,
  PRIMARY KEY (`web_push_subscription_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_push_subscription`
--

LOCK TABLES `web_push_subscription` WRITE;
/*!40000 ALTER TABLE `web_push_subscription` DISABLE KEYS */;
INSERT INTO `web_push_subscription` VALUES (4,'https://fcm.googleapis.com/fcm/send/fPyXIz1Sics:APA91bHxUDOTegKvpS5EpbG5-2-zyeKoJtd_GnWoe3s9KnueDeBogrSmPPv6o7XRZy3pCtupbpjUVlcvngnFWEra1f9mY0q6f5RH3n7AkFYf8IDjmuBgufzcnCroIlcb4quneIqS0FqP','BPHuI-JEG2KCvT8xm1nuw1Urz9dNlMrDISWh1hvcuwbniou5iplBXE0aQXtapSFfmN_F2TyjBL8uVNgFVZtVLP4','FuqWYxSp_dn2Hk5sfefAfA','2025-01-04 08:25:37',NULL),(5,'https://fcm.googleapis.com/fcm/send/fTOuK5kqMYw:APA91bGdUq5SmjpzJOjovFXgplJ58lpcHjvt35mHN-O90oI3PnfgN6CLvFTWwa0u23WzGXSrTHdUF_SwFgURmJVQHY1zE2l47QkI0n1-Tw0OZbuRdFNmR0FgInRdpgLhUZkcIX4USZrl','BDtL5ZtxBMjWDtb31sCkdyjA5f2DcY9JF5Mgxv-6h_3a32FHnTN0Fo2dno0Ne6f_xP4BTkE68iLcZm-CCekQMBM','fzbibL2SOjScBAAb07mzJQ','2025-02-19 13:53:38',NULL);
/*!40000 ALTER TABLE `web_push_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'life_helper'
--
/*!50003 DROP PROCEDURE IF EXISTS `p_add_all_foreign_keys` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_all_foreign_keys`()
BEGIN
    call p_add_goal_note_to_goal_fk();
    call p_add_goal_note_to_note_fk();
    call p_add_goal_task_to_goal_fk();
    call p_add_goal_task_to_task_fk();
	call p_add_objective_goal_to_goal_fk();
	call p_add_objective_goal_to_objective_fk();
    call p_add_objective_note_to_note_fk();
    call p_add_objective_note_to_objective_fk();
    call p_add_task_note_to_note_fk();
    call p_add_task_note_to_task_fk();
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_goal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_goal`(IN type varchar(30), IN data JSON)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
            -- I believe this is the correct way to guarantee all transactions are resolved
            -- with either a commit or rollback as this handler catches all SQL exceptions.
			GET STACKED DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
				@errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
            rollback;

            -- Always make sure the rollback proceeds the error logging.
            -- Otherwise, the error logging will also be rolled back.
            SET @error_information = JSON_OBJECT('error_number', @errno, 'sql_state', @sqlstate, 'error_text', @text);
			SET @params = JSON_OBJECT('sp_name', 'p_add_goal', 'error_information', @error_information, 'additional_information', data);
			call p_handle_db_error(@params);
        END;
	START TRANSACTION;
	insert into goal (item_name, item_description) values (JSON_UNQUOTE(JSON_EXTRACT(data, '$.item_name')), JSON_UNQUOTE(JSON_EXTRACT(data, '$.item_description')));
	insert into objective_goal (objective_id, goal_id) values (JSON_EXTRACT(data, '$.parent_id'), LAST_INSERT_ID());
    COMMIT;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_goal_note` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_goal_note`(IN data JSON)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
            -- I believe this is the correct way to guarantee all transactions are resolved
            -- with either a commit or rollback as this handler catches all SQL exceptions.
			GET STACKED DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
				@errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
            rollback;

            -- Always make sure the rollback proceeds the error logging.
            -- Otherwise, the error logging will also be rolled back.
            SET @error_information = JSON_OBJECT('error_number', @errno, 'sql_state', @sqlstate, 'error_text', @text);
			SET @params = JSON_OBJECT('sp_name', 'p_add_goal_note', 'error_information', @error_information, 'additional_information', data);
			call p_handle_db_error(@params);
        END;
	START TRANSACTION;
	insert into note (note) values (JSON_UNQUOTE(JSON_EXTRACT(data, '$.note_text')));
	insert into goal_note (goal_id, note_id) values (JSON_EXTRACT(data, '$.parent_id'), LAST_INSERT_ID());
    COMMIT;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_goal_note_foreign_keys` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_goal_note_foreign_keys`()
BEGIN
	alter table goal_note add constraint fk_goal_note_to_goal foreign key fk_goal_note_to_goal (goal_id) references goal(goal_id);
	alter table goal_note add constraint fk_goal_note_to_note foreign key fk_goal_note_to_note (note_id) references note(note_id);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_goal_note_to_goal_fk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_goal_note_to_goal_fk`()
BEGIN
	alter table goal_note add constraint fk_goal_note_to_goal foreign key fk_goal_note_to_goal (goal_id) references goal(goal_id);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_goal_note_to_note_fk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_goal_note_to_note_fk`()
BEGIN
	alter table goal_note add constraint fk_goal_note_to_note foreign key fk_goal_note_to_note (note_id) references note(note_id);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_goal_task_foreign_keys` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_goal_task_foreign_keys`()
BEGIN
	alter table goal_task add constraint fk_goal_task_to_goal foreign key fk_goal_task_to_goal (goal_id) references goal(goal_id);
	alter table goal_task add constraint fk_goal_task_to_task foreign key fk_goal_task_to_task (task_id) references task(task_id);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_goal_task_to_goal_fk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_goal_task_to_goal_fk`()
BEGIN
	alter table goal_task add constraint fk_goal_task_to_goal foreign key fk_goal_task_to_goal (goal_id) references goal(goal_id);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_goal_task_to_task_fk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_goal_task_to_task_fk`()
BEGIN
	alter table goal_task add constraint fk_goal_task_to_task foreign key fk_goal_task_to_task (task_id) references task(task_id);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_item`(IN type varchar(30), IN data JSON)
BEGIN
	CASE type
		WHEN "objective" THEN
            call p_add_objective(type, data);
		WHEN "goal" THEN
			call p_add_goal(type, data);
		WHEN "task" THEN
			call p_add_task(type, data);
		WHEN "web_push_subscription" THEN
        	insert into web_push_subscription (capability_url, public_key, private_key) values (JSON_UNQUOTE(JSON_EXTRACT(data, '$.endpoint')), JSON_UNQUOTE(JSON_EXTRACT(data, '$.keys.p256dh')), JSON_UNQUOTE(JSON_EXTRACT(data, '$.keys.auth')));
		WHEN "note" THEN
			call p_add_note(data);
		WHEN "user_login" THEN
			call p_add_user_login(data);
	END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_note` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_note`(IN data JSON)
BEGIN
    set @type = JSON_UNQUOTE(JSON_EXTRACT(data, '$.item_type'));
	CASE @type
		WHEN "objective" THEN
            call p_add_objective_note(data);
		WHEN "goal" THEN
			call p_add_goal_note(data);
		WHEN "task" THEN
			call p_add_task_note(data);
	END CASE;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_objective` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_objective`(IN type varchar(30), IN data JSON)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
            -- I believe this is the correct way to guarantee all transactions are resolved
            -- with either a commit or rollback as this handler catches all SQL exceptions.
			GET STACKED DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
				@errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;

            -- Always make sure the rollback proceeds the error logging.
            -- Otherwise, the error logging will also be rolled back.
            SET @error_information = JSON_OBJECT('error_number', @errno, 'sql_state', @sqlstate, 'error_text', @text);
			SET @params = JSON_OBJECT('sp_name', 'p_add_objective', 'error_information', @error_information, 'additional_information', data);
			call p_handle_db_error(@params);
        END;
	
    insert into objective (item_name, item_description) values (JSON_UNQUOTE(JSON_EXTRACT(data, '$.item_name')), JSON_UNQUOTE(JSON_EXTRACT(data, '$.item_description')));
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_objective_goal_foreign_keys` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_objective_goal_foreign_keys`()
BEGIN
	alter table objective_goal add constraint fk_objective_goal_to_objective foreign key fk_objective_goal_to_objective (objective_id) references objective(objective_id);
	alter table objective_goal add constraint fk_objective_goal_to_goal foreign key fk_objective_goal_to_goal (goal_id) references goal(goal_id);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_objective_goal_to_goal_fk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_objective_goal_to_goal_fk`()
BEGIN
	alter table objective_goal add constraint fk_objective_goal_to_goal foreign key fk_objective_goal_to_goal (goal_id) references goal(goal_id);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_objective_goal_to_objective_fk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_objective_goal_to_objective_fk`()
BEGIN
	alter table objective_goal add constraint fk_objective_goal_to_objective foreign key fk_objective_goal_to_objective (objective_id) references objective(objective_id);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_objective_note` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_objective_note`(IN data JSON)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
            -- I believe this is the correct way to guarantee all transactions are resolved
            -- with either a commit or rollback as this handler catches all SQL exceptions.
			GET STACKED DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
				@errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
            rollback;

            -- Always make sure the rollback proceeds the error logging.
            -- Otherwise, the error logging will also be rolled back.
            SET @error_information = JSON_OBJECT('error_number', @errno, 'sql_state', @sqlstate, 'error_text', @text);
			SET @params = JSON_OBJECT('sp_name', 'p_add_objective_note', 'error_information', @error_information, 'additional_information', data);
			call p_handle_db_error(@params);
        END;
	START TRANSACTION;
	insert into note (note) values (JSON_UNQUOTE(JSON_EXTRACT(data, '$.note_text')));
	insert into objective_note (objective_id, note_id) values (JSON_EXTRACT(data, '$.parent_id'), LAST_INSERT_ID());
    COMMIT;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_objective_note_foreign_keys` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_objective_note_foreign_keys`()
BEGIN
	alter table objective_note add constraint fk_objective_note_to_objective foreign key fk_objective_note_to_objective (objective_id) references objective(objective_id);
	alter table objective_note add constraint fk_objective_note_to_note foreign key fk_objective_note_to_note (note_id) references note(note_id);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_objective_note_to_note_fk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_objective_note_to_note_fk`()
BEGIN
	alter table objective_note add constraint fk_objective_note_to_note foreign key fk_objective_note_to_note (note_id) references note(note_id);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_objective_note_to_objective_fk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_objective_note_to_objective_fk`()
BEGIN
	alter table objective_note add constraint fk_objective_note_to_objective foreign key fk_objective_note_to_objective (objective_id) references objective(objective_id);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_task` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_task`(IN type varchar(30), IN data JSON)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
            -- I believe this is the correct way to guarantee all transactions are resolved
            -- with either a commit or rollback as this handler catches all SQL exceptions.
			GET STACKED DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
				@errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
            rollback;

            -- Always make sure the rollback proceeds the error logging.
            -- Otherwise, the error logging will also be rolled back.
            SET @error_information = JSON_OBJECT('error_number', @errno, 'sql_state', @sqlstate, 'error_text', @text);
			SET @params = JSON_OBJECT('sp_name', 'p_add_task', 'error_information', @error_information, 'additional_information', data);
			call p_handle_db_error(@params);
        END;
    
	START TRANSACTION;
	insert into task (item_name, item_description) values (JSON_UNQUOTE(JSON_EXTRACT(data, '$.item_name')), JSON_UNQUOTE(JSON_EXTRACT(data, '$.item_description')));
	insert into goal_task (goal_id, task_id) values (JSON_EXTRACT(data, '$.parent_id'), LAST_INSERT_ID());
    COMMIT;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_task_note` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_task_note`(IN data JSON)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
            -- I believe this is the correct way to guarantee all transactions are resolved
            -- with either a commit or rollback as this handler catches all SQL exceptions.
			GET STACKED DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
				@errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
            rollback;

            -- Always make sure the rollback proceeds the error logging.
            -- Otherwise, the error logging will also be rolled back.
            SET @error_information = JSON_OBJECT('error_number', @errno, 'sql_state', @sqlstate, 'error_text', @text);
			SET @params = JSON_OBJECT('sp_name', 'p_add_task_note', 'error_information', @error_information, 'additional_information', data);
			call p_handle_db_error(@params);
        END;
	START TRANSACTION;
	insert into note (note) values (JSON_UNQUOTE(JSON_EXTRACT(data, '$.note_text')));
	insert into task_note (task_id, note_id) values (JSON_EXTRACT(data, '$.parent_id'), LAST_INSERT_ID());
    COMMIT;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_task_note_foreign_keys` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_task_note_foreign_keys`()
BEGIN
	alter table task_note add constraint fk_task_note_to_task foreign key fk_task_note_to_task (task_id) references task(task_id);
	alter table task_note add constraint fk_task_note_to_note foreign key fk_task_note_to_note (note_id) references note(note_id);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_task_note_to_note_fk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_task_note_to_note_fk`()
BEGIN
	alter table task_note add constraint fk_task_note_to_note foreign key fk_task_note_to_note (note_id) references note(note_id);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_task_note_to_task_fk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_task_note_to_task_fk`()
BEGIN
	alter table task_note add constraint fk_task_note_to_task foreign key fk_task_note_to_task (task_id) references task(task_id);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_task_user_to_task_fk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_task_user_to_task_fk`()
BEGIN
	alter table task_user add constraint fk_task_user_to_task foreign key fk_task_user_to_task (task_id) references task(task_id);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_task_user_to_user_login_fk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_task_user_to_user_login_fk`()
BEGIN
	alter table task_user add constraint fk_task_user_to_user_login foreign key fk_task_user_to_user_login (user_login_id) references user_login(user_login_id);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_user_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_add_user_login`(IN data JSON)
BEGIN
    set @user_name = JSON_UNQUOTE(JSON_EXTRACT(data, '$.user_name'));
    set @hashed_password = JSON_UNQUOTE(JSON_EXTRACT(data, '$.hashed_password'));
    set @full_name = JSON_UNQUOTE(JSON_EXTRACT(data, '$.full_name'));
    set @display_name = JSON_UNQUOTE(JSON_EXTRACT(data, '$.display_name'));
    set @email_address = JSON_UNQUOTE(JSON_EXTRACT(data, '$.email_address'));

	insert into user_login (user_name, hashed_password, full_name, display_name, email_address)
    values (@user_name, @hashed_password, @full_name, @display_name, @email_address);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_attach_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_attach_item`(IN type varchar(30), IN data JSON)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
            -- I believe this is the correct way to guarantee all transactions are resolved
            -- with either a commit or rollback as this handler catches all SQL exceptions.
			GET STACKED DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
				@errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
            rollback;

            -- Always make sure the rollback proceeds the error logging.
            -- Otherwise, the error logging will also be rolled back.
            SET @error_information = JSON_OBJECT('error_number', @errno, 'sql_state', @sqlstate, 'error_text', @text);
			SET @params = JSON_OBJECT('sp_name', 'p_attach_item', 'error_information', @error_information, 'additional_information', data);
			call p_handle_db_error(@params);
        END;
	CASE type
		WHEN "goal" THEN
			insert into objective_goal (objective_id, goal_id) values (JSON_EXTRACT(data, '$.parent_id'), JSON_EXTRACT(data, '$.child_id'));
		WHEN "task" THEN
			insert into goal_task (goal_id, task_id) values (JSON_EXTRACT(data, '$.parent_id'), JSON_EXTRACT(data, '$.child_id'));
	END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_cancel_delete_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_cancel_delete_item`(IN data JSON)
BEGIN
	set @type = JSON_UNQUOTE(JSON_EXTRACT(data, '$.item_type'));
    select @type;
	CASE @type
		WHEN "objective" THEN
			update objective set deleted_dtm = current_timestamp() where objective_id = JSON_EXTRACT(data, '$.item_id');
		WHEN "goal" THEN
			update goal set deleted_dtm = current_timestamp() where goal_id = JSON_EXTRACT(data, '$.item_id');
		WHEN "task" THEN
			update task set deleted_dtm = current_timestamp() where task_id = JSON_EXTRACT(data, '$.item_id');
		WHEN "web_push_subscription" THEN
            update web_push_subscription set unsubscribed_or_expired_dtm = current_timestamp() where capability_url = JSON_EXTRACT(data, '$.capability_url');
	END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_create_goal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_create_goal`()
BEGIN
    drop table IF EXISTS goal;

	create table goal (
		goal_id int not null auto_increment,
		item_name varchar(50) not null,
		item_description varchar(1000) not null,
		started_dtm datetime null,
		completed_dtm datetime null,
		deleted_dtm datetime null,
		created_dtm datetime default current_timestamp not null,
		last_update_dtm datetime on update current_timestamp,
		PRIMARY KEY (goal_id)
	);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_create_goal_note` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_create_goal_note`()
BEGIN
	drop table IF EXISTS goal_note;

	create table goal_note (
		goal_id int not null,
		note_id int not null,
		deleted_dtm datetime null,
		created_dtm datetime default current_timestamp not null,
		PRIMARY KEY (goal_id, note_id)
	);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_create_goal_task` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_create_goal_task`()
BEGIN
	drop table IF EXISTS goal_task;

	create table goal_task (
		goal_id int not null,
		task_id int not null,
		deleted_dtm datetime null,
		created_dtm datetime default current_timestamp not null,
		PRIMARY KEY (goal_id, task_id)
	);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_create_note` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_create_note`()
BEGIN
    drop table if exists note;
    
	create table note (
		note_id int not null auto_increment,
		note varchar(1000) not null,
		deleted_dtm datetime null,
		created_dtm datetime default current_timestamp not null,
		PRIMARY KEY (note_id)
	);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_create_objective` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_create_objective`()
BEGIN
    drop table if exists objective;
    
	create table objective (
		objective_id int not null auto_increment,
		item_name varchar(50) not null,
		item_description varchar(1000) not null,
		started_dtm datetime null,
		completed_dtm datetime null,
		deleted_dtm datetime null,
		created_dtm datetime default current_timestamp not null,
		last_update_dtm datetime on update current_timestamp,
		PRIMARY KEY (objective_id)
	);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_create_objective_goal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_create_objective_goal`()
BEGIN
	drop table IF EXISTS objective_goal;

	create table objective_goal (
		objective_id int not null,
		goal_id int not null,
		deleted_dtm datetime null,
		created_dtm datetime default current_timestamp not null,
		PRIMARY KEY (objective_id, goal_id)
	);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_create_objective_note` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_create_objective_note`()
BEGIN
	drop table IF EXISTS objective_note;

	create table objective_note (
		objective_id int not null,
		note_id int not null,
		deleted_dtm datetime null,
		created_dtm datetime default current_timestamp not null,
		PRIMARY KEY (objective_id, note_id)
	);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_create_sql_error` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_create_sql_error`()
BEGIN
	drop table IF EXISTS sql_error;

	create table sql_error (
		sql_error_id int not null auto_increment,
		sql_error varchar(1024) Not Null,
		stored_procedure_name varchar(50) not null,
        additional_information varchar(1024) not null,
		created_dtm datetime default current_timestamp not null,
		PRIMARY KEY (sql_error_id)
	);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_create_table` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_create_table`(IN t_name VARCHAR(50), IN preserve_data bool)
BEGIN
		declare sp_name varchar(50) default 'p_create_table';
		declare target_table_exists bool default false;

		DECLARE EXIT HANDLER FOR SQLEXCEPTION
			BEGIN
				select CONCAT("An exception occurred in ", sp_name) as stored_procedure_name, t_name as table_name;
				GET STACKED DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
					@errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
				SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
				select @full_error;
				INSERT INTO sql_error (sql_error, stored_procedure_name, additional_information, created_dtm) values (@full_error, sp_name, CONCAT('table name: ', t_name), now());
			END;
        
		SELECT true into target_table_exists FROM information_schema.tables WHERE table_schema = database() and table_name = t_name ;
        
		-- drop table if exists t_objective;
       	SET @SQL = CONCAT('drop table if exists t_', t_name);
		PREPARE prepared_statement FROM @SQL;
		EXECUTE prepared_statement;
		DEALLOCATE PREPARE prepared_statement;

        IF target_table_exists AND preserve_data THEN
            -- create table t_objective select * from objective;
			SET @SQL = CONCAT('create table t_', t_name, ' select * from ', t_name);
			PREPARE prepared_statement FROM @SQL;
			EXECUTE prepared_statement;
			DEALLOCATE PREPARE prepared_statement;
		END IF;
        
-- 		call p_create_objective();
       	SET @SQL = CONCAT('call p_create_', t_name, '()');
		PREPARE prepared_statement FROM @SQL;
		EXECUTE prepared_statement;
		DEALLOCATE PREPARE prepared_statement;
        
        IF target_table_exists AND preserve_data THEN
			-- Note, the code in the called stored procedures is unique
            -- to the exact change being implemented.
			-- When not making any changes to the structure of a table the
			-- they should contain a simple 
            -- insert into [table name] select * from t_[table name] statement

-- 			insert into [table name] select * from t_[table name];
			SET @SQL = CONCAT('call p_migrate_', t_name, '()');
			PREPARE prepared_statement FROM @SQL;
			EXECUTE prepared_statement;
			DEALLOCATE PREPARE prepared_statement;
		END IF;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_create_table_schema` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_create_table_schema`(IN preserve_data bool)
BEGIN
    call p_drop_all_foreign_keys();
    call p_create_table('objective_goal', preserve_data);
    call p_create_table('goal_task', preserve_data);
    call p_create_table('objective_note', preserve_data);
    call p_create_table('goal_note', preserve_data);
    call p_create_table('task_note', preserve_data);

    call p_create_table('web_push_subscription', preserve_data);
    call p_create_table('sql_error', preserve_data);
    call p_create_table('objective', preserve_data);
    call p_create_table('goal', preserve_data);
    call p_create_table('task', preserve_data);
    call p_create_table('note', preserve_data);

    call p_create_table('user_login', preserve_data);

    call p_create_table('trigger_log', preserve_data);

    call p_add_all_foreign_keys();
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_create_task` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_create_task`()
BEGIN
    drop table IF EXISTS task;

	create table task (
		task_id int not null auto_increment,
		item_name varchar(50) not null,
		item_description varchar(1000) not null,
		started_dtm datetime null,
		paused_dtm datetime null,
		completed_dtm datetime null,
		deleted_dtm datetime null,
		created_dtm datetime default current_timestamp not null,
		last_update_dtm datetime on update current_timestamp,
		PRIMARY KEY (task_id)
	);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_create_task_note` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_create_task_note`()
BEGIN
	drop table IF EXISTS task_note;

	create table task_note (
		task_id int not null,
		note_id int not null,
		deleted_dtm datetime null,
		created_dtm datetime default current_timestamp not null,
		PRIMARY KEY (task_id, note_id)
	);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_create_trigger_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_create_trigger_log`()
BEGIN
	drop table IF EXISTS trigger_log;

    create table trigger_log (
        trigger_log_id int not null auto_increment,
        statement varchar(100) default null,
        integer_result int default null,
        string_result varchar(100) default null,
        created_dtm datetime default current_timestamp not null,
        PRIMARY KEY (trigger_log_id)
        );

    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_create_user_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_create_user_login`()
BEGIN
    drop table if exists user_login;
    
	create table user_login (
		user_login_id int not null auto_increment,
		user_name varchar(30) not null,
        hashed_password varchar(100) not null,
		full_name varchar(100) not null,
		display_name varchar(30) not null,
        email_address varchar(100) null,
		created_dtm datetime default current_timestamp not null,
		deleted_dtm datetime null,
		PRIMARY KEY (user_login_id)
	);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_create_web_push_subscription` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_create_web_push_subscription`()
BEGIN
	drop table IF EXISTS web_push_subscription;

	create table web_push_subscription (
		web_push_subscription_id int not null auto_increment,
		capability_url varchar(250) not null,
		public_key varchar(100) not null,
		private_key varchar(100) not null,
		subscribed_dtm datetime default current_timestamp not null,
		unsubscribed_or_expired_dtm datetime null,
		PRIMARY KEY (web_push_subscription_id)
	);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_drop_all_foreign_keys` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_drop_all_foreign_keys`()
BEGIN
    DECLARE done BOOL DEFAULT false;
    DECLARE t_name varchar(100);
    DECLARE fk_name varchar(100);
    
    declare cur_foreign_keys CURSOR for SELECT table_name, constraint_name FROM information_schema.table_constraints
		WHERE table_schema = database()
		and constraint_type = 'FOREIGN KEY';
        
	-- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER 
	FOR NOT FOUND SET done = true;

    -- open the cursor
    OPEN cur_foreign_keys;
    
	FETCH cur_foreign_keys into t_name, fk_name;
    WHILE Not done DO
		SET @drop_fkSQL = CONCAT('alter table ', t_name, ' drop foreign key ', fk_name);

		PREPARE prepared_statement FROM @drop_fkSQL;
		EXECUTE prepared_statement;
		DEALLOCATE PREPARE prepared_statement;
		FETCH cur_foreign_keys into t_name, fk_name;
	END WHILE;

	-- close the cursor
    CLOSE cur_foreign_keys;

	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_get_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_get_item`(IN type varchar(30), IN data JSON)
BEGIN
	CASE type
		WHEN "objective" THEN
		    select * from objective
            where objective_id = JSON_EXTRACT(data, '$.item_id');
		WHEN "goal" THEN
		    select * from goal
            where goal_id = JSON_EXTRACT(data, '$.item_id');
		WHEN "task" THEN
		    select * from task
            where task_id = JSON_EXTRACT(data, '$.item_id');
	END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_get_items` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_get_items`(IN type varchar(30), IN data JSON)
BEGIN
	drop temporary table if exists t1;
	CASE type
		WHEN "objectives" THEN
		    create temporary table t1 as select objective_id as item_id, objective.*
            from objective
            where if(JSON_EXTRACT(data, '$.item_id') Is Null, 1 = 1, objective_id = JSON_EXTRACT(data, '$.item_id'));
		WHEN "goals" THEN
			create temporary table t1 as select g.goal_id as item_id, g.*
			from goal g inner join objective_goal og on g.goal_id = og.goal_id
			where og.objective_id = JSON_EXTRACT(data, '$.parent_id')
            and if(JSON_EXTRACT(data, '$.item_id') Is Null, 1 = 1, g.goal_id = JSON_EXTRACT(data, '$.item_id'));
		WHEN "tasks" THEN
			create temporary table t1 as select t.task_id as item_id, t.*
			from task t inner join goal_task gt on t.task_id = gt.task_id
			where gt.goal_id = JSON_EXTRACT(data, '$.parent_id')
            and if(JSON_EXTRACT(data, '$.item_id') Is Null, 1 = 1, t.task_id = JSON_EXTRACT(data, '$.item_id'));
		WHEN "subscriptions" THEN
			select * from web_push_subscription where unsubscribed_or_expired_dtm Is Null;
		WHEN "notes" THEN
			call p_get_notes(data);
		WHEN "user_login" THEN
			call p_get_user_login(data);
	END CASE;
    if type = "objectives" or type = "goals" or type = "tasks" THEN
		select * from t1
		WHERE CASE
			WHEN JSON_EXTRACT(data, '$.completed_items') = "yes" THEN completed_dtm Is Not Null
			WHEN JSON_EXTRACT(data, '$.completed_items') = "no" THEN completed_dtm Is Null
			ELSE 1 = 1
		END
		AND CASE
			WHEN JSON_EXTRACT(data, '$.started_items') = "yes" THEN started_dtm Is Not Null
			WHEN JSON_EXTRACT(data, '$.started_items') = "no" THEN started_dtm Is Null
			ELSE 1 = 1
		END
		AND CASE
			WHEN JSON_EXTRACT(data, '$.deleted_items') = "yes" THEN deleted_dtm Is Not Null
			WHEN JSON_EXTRACT(data, '$.deleted_items') = "no" THEN deleted_dtm Is Null
			ELSE 1 = 1
		END
		order by item_name asc;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_get_notes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_get_notes`(IN data JSON)
BEGIN
	Set @type = JSON_UNQUOTE(JSON_EXTRACT(data, '$.item_type'));
    Set @item_id = JSON_EXTRACT(data, '$.item_id');

	SET @SQL = CONCAT('select n.note from ', @type);
    SET @SQL = CONCAT(@SQL, ' x inner join ', @type);
    SET @SQL = CONCAT(@SQL, '_note xn on x.', @type);
    SET @SQL = CONCAT(@SQL, '_id = xn.', @type, '_id');
    SET @SQL = CONCAT(@SQL, ' inner join note n on xn.note_id = n.note_id');
    SET @SQL = CONCAT(@SQL, ' where x.', @type, '_id = ', @item_id);
    SET @SQL = CONCAT(@SQL, ' order by n.created_dtm desc');

	PREPARE prepared_statement FROM @SQL;
	EXECUTE prepared_statement;
	DEALLOCATE PREPARE prepared_statement;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_get_user_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_get_user_login`(IN data JSON)
BEGIN
	Set @user_name = JSON_UNQUOTE(JSON_EXTRACT(data, '$.user_name'));
    
    select * from user_login where user_name = @user_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_handle_db_error` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_handle_db_error`(IN error_event_information varchar(1000))
BEGIN
        SET @sp_name = JSON_UNQUOTE(JSON_EXTRACT(error_event_information, '$.sp_name'));
        SET @error_information = JSON_UNQUOTE(JSON_EXTRACT(error_event_information, '$.error_information'));
        SET @additional_information = JSON_EXTRACT(error_event_information, '$.additional_information');
        SET @error_no = JSON_EXTRACT(@error_information, '$.error_number');
        SET @sql_state = JSON_EXTRACT(@error_information, '$.sql_state');
        SET @error_text = JSON_EXTRACT(@error_information, '$.error_text');
		SET @sql_error = CONCAT('ERROR errno ', @error_no, ' (sqlstate ', @sql_state, '): ', @error_text);
        
        select @sp_name as 'stored procedure name', @error_information as 'SQL error', @additional_information as 'Additional Information';
		INSERT INTO sql_error (sql_error, stored_procedure_name, additional_information, created_dtm) values (@sql_error, @sp_name, @additional_information, now());
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = @error_text;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_migrate_goal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_migrate_goal`()
BEGIN
    insert into goal select * from t_goal;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_migrate_goal_note` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_migrate_goal_note`()
BEGIN
    insert into goal_note select * from t_goal_note;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_migrate_goal_task` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_migrate_goal_task`()
BEGIN
    insert into goal_task select * from t_goal_task;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_migrate_note` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_migrate_note`()
BEGIN
    insert into note select * from t_note;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_migrate_objective` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_migrate_objective`()
BEGIN
    insert into objective select * from t_objective;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_migrate_objective_goal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_migrate_objective_goal`()
BEGIN
    insert into objective_goal select * from t_objective_goal;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_migrate_objective_note` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_migrate_objective_note`()
BEGIN
    insert into objective_note select * from t_objective_note;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_migrate_sql_error` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_migrate_sql_error`()
BEGIN
    insert into sql_error select * from t_sql_error;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_migrate_task` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_migrate_task`()
BEGIN
    insert into task select * from t_task;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_migrate_task_note` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_migrate_task_note`()
BEGIN
    insert into task_note select * from t_task_note;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_migrate_trigger_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_migrate_trigger_log`()
BEGIN
    insert into trigger_log select * from t_trigger_log;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_migrate_user_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_migrate_user_login`()
BEGIN
    insert into user_login (user_login_id, user_name, hashed_password, full_name, display_name, email_address, created_dtm, deleted_dtm )
    select user_login_id, user_name, hashed_password, full_name, display_name, null, create_dtm, deleted_dtm from t_user_login;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_migrate_web_push_subscription` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_migrate_web_push_subscription`()
BEGIN
    insert into web_push_subscription select * from t_web_push_subscription;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_search_for_dependencies` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_search_for_dependencies`(IN pattern varchar(100))
BEGIN
	SET @dependencySQL = CONCAT('SELECT ROUTINE_NAME
		FROM information_schema.ROUTINES
		WHERE ROUTINE_TYPE="PROCEDURE"
		AND ROUTINE_SCHEMA = ', "'", database(), "'",
		' AND ROUTINE_DEFINITION LIKE ', "'%", pattern, "%'");
        
	select @dependencySQL;
	PREPARE prepared_statement FROM @dependencySQL;
	EXECUTE prepared_statement;
	DEALLOCATE PREPARE prepared_statement;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_update_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tlangan`@`%` PROCEDURE `p_update_item`(IN type varchar(30), IN data JSON)
BEGIN
	set @task_id = JSON_EXTRACT(data, '$.task_id');
	CASE type
		WHEN "start" THEN
			update task set started_dtm = current_timestamp where task_id = @task_id;
		WHEN "pause" THEN
			-- This logic can not be put in the task update trigger since it is, itself, an update to the same task
            -- This logic esentially acts as a toggle for the paused state.
			select paused_dtm into @paused_dtm from task where task_id = @task_id;
            if @paused_dtm Is Null THEN
				update task set paused_dtm = now() where task_id = @task_id;
			else
				update task set paused_dtm = null where task_id = @task_id;
			END IF;
		WHEN "complete" THEN
			update task set paused_dtm = null where task_id = @task_id;
			update task set completed_dtm = current_timestamp where task_id = @task_id;
		WHEN "cancel_delete" THEN
			call p_cancel_delete_item(data);
    END CASE;
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

-- Dump completed on 2025-02-25 15:57:31
