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
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_dtm` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`goal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal`
--

LOCK TABLES `goal` WRITE;
/*!40000 ALTER TABLE `goal` DISABLE KEYS */;
INSERT INTO `goal` VALUES (1,'Create the Life Helper Application','','2025-01-03 11:58:53',NULL,NULL,'2025-01-03 11:56:15','2025-01-03 11:58:53'),(2,'Put the NWS Temperature App on the web','',NULL,'2025-01-16 10:11:46',NULL,'2025-01-03 11:56:45','2025-01-16 10:11:46'),(3,'adding a goal','','2025-01-03 15:57:18','2025-01-16 10:11:46','2025-01-03 16:24:55','2025-01-03 15:47:35','2025-01-16 10:11:46'),(4,'another goal to cancel/delete','',NULL,'2025-01-16 10:11:46','2025-01-03 16:12:30','2025-01-03 16:12:25','2025-01-16 10:11:46'),(5,'See if this generates a web push get request.','',NULL,'2025-01-16 10:11:46','2025-01-15 08:48:20','2025-01-04 08:21:53','2025-01-16 10:11:46'),(6,'Create a NWS Prediction Tracker','Build this application using TypeScript and VITE. Deploy it to GitHub using the GitHub Actions and not from a branch so that index.html does not have to reside at the root of the project.',NULL,NULL,NULL,'2025-01-08 07:37:07',NULL),(7,'Master Web Authentication','','2025-01-19 07:11:36',NULL,NULL,'2025-01-19 07:09:41','2025-01-19 07:11:36'),(8,'test goal to save','','2025-01-29 07:27:21','2025-01-29 07:27:34',NULL,'2025-01-29 07:27:05','2025-01-29 07:27:34'),(9,'Study Artificial Intelligence','','2025-01-30 09:43:34',NULL,NULL,'2025-01-30 09:42:17','2025-01-30 09:43:34'),(10,'Clean Kitchen','','2025-02-01 11:32:34','2025-02-01 11:32:35',NULL,'2025-02-01 07:26:23','2025-02-01 11:32:35'),(11,'Review Bills & Accounts','','2025-02-01 15:21:43',NULL,'2025-02-02 08:13:37','2025-02-01 07:26:39','2025-02-02 08:13:37'),(12,'Make chicken soup','','2025-02-01 16:30:46',NULL,'2025-02-02 08:13:08','2025-02-01 16:08:48','2025-02-02 08:13:08'),(13,'Miscellaneous','',NULL,NULL,'2025-02-02 08:12:52','2025-02-02 08:11:16','2025-02-02 08:12:52'),(14,'Miscellaneous','','2025-02-02 13:18:48',NULL,'2025-02-03 13:12:38','2025-02-02 08:14:14','2025-02-03 13:12:38'),(15,'Enhance the resume','',NULL,NULL,NULL,'2025-02-02 10:39:35',NULL),(16,'Miscellaneous','','2025-02-06 08:24:14','2025-02-06 08:24:15',NULL,'2025-02-03 13:13:08','2025-02-06 08:24:15'),(17,'Miscellaneous','','2025-02-06 08:29:28','2025-02-06 20:12:28',NULL,'2025-02-06 08:24:44','2025-02-06 20:12:28');
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
    
    -- Since task_id never changes once a task is created then OLD.task_id = NEW.task_id
    set @goal_id = OLD.goal_id;

    IF OLD.started_dtm is null AND NEW.started_dtm is not null THEN
		-- A goal has been started. If there are any objectives for which 
        -- this is the first of their goals to be started then
        -- the objective should be marked as started.

		Insert into trigger_log (statement) select "In the started IF";
        
		Create temporary table trigger_goal_update_temp select o.objective_id from objective_goal og
        inner join objective o on og.objective_id = o.objective_id
		where og.goal_id = @goal_id
        and o.started_dtm Is Null;

		update objective set started_dtm = now() where objective_id in (select objective_id from trigger_goal_update_temp);
        
		drop temporary table if exists trigger_goal_update_temp;
    END IF;
    IF OLD.completed_dtm is null AND NEW.completed_dtm is not null THEN
		-- A goal has been completed. If there are no other open goals
        -- associated with any of the objective it applies to
        -- then each of those objective should be completed.
        
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
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
INSERT INTO `goal_note` VALUES (2,1,NULL,'2025-01-03 11:57:55');
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
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
INSERT INTO `goal_task` VALUES (1,1,NULL,'2025-01-03 11:58:37'),(1,2,NULL,'2025-01-03 11:59:36'),(1,3,NULL,'2025-01-03 12:01:36'),(1,4,NULL,'2025-01-03 12:11:12'),(1,5,NULL,'2025-01-03 12:13:46'),(1,6,NULL,'2025-01-03 12:16:35'),(1,7,NULL,'2025-01-03 12:18:26'),(1,8,NULL,'2025-01-03 12:18:45'),(1,9,NULL,'2025-01-03 12:26:02'),(1,12,NULL,'2025-01-03 16:24:05'),(1,13,NULL,'2025-01-04 08:42:18'),(1,16,NULL,'2025-01-15 08:55:46'),(1,17,NULL,'2025-01-15 09:04:18'),(1,18,NULL,'2025-01-15 09:23:20'),(1,19,NULL,'2025-01-15 09:25:32'),(1,20,NULL,'2025-01-15 13:40:41'),(1,21,NULL,'2025-01-15 13:43:27'),(1,22,NULL,'2025-01-15 16:19:27'),(1,23,NULL,'2025-01-15 16:20:20'),(1,24,NULL,'2025-01-16 10:12:44'),(1,25,NULL,'2025-01-16 10:13:48'),(1,26,NULL,'2025-01-16 11:21:31'),(1,29,NULL,'2025-01-19 08:27:45'),(1,32,NULL,'2025-01-29 07:38:05'),(1,35,NULL,'2025-01-30 15:28:55'),(1,36,NULL,'2025-01-30 15:43:49'),(1,37,NULL,'2025-01-31 08:25:56'),(1,38,NULL,'2025-01-31 08:28:41'),(1,39,NULL,'2025-01-31 09:31:40'),(1,40,NULL,'2025-01-31 11:02:01'),(1,41,NULL,'2025-01-31 11:19:29'),(1,42,NULL,'2025-01-31 14:08:20'),(1,43,NULL,'2025-01-31 14:24:50'),(1,44,NULL,'2025-01-31 15:48:16'),(1,45,NULL,'2025-01-31 16:27:13'),(1,59,NULL,'2025-02-02 10:09:17'),(1,62,NULL,'2025-02-03 08:36:15'),(1,63,NULL,'2025-02-03 08:45:28'),(1,64,NULL,'2025-02-03 08:46:48'),(1,65,NULL,'2025-02-03 09:01:58'),(1,66,NULL,'2025-02-03 09:56:05'),(1,67,NULL,'2025-02-03 09:57:56'),(1,69,NULL,'2025-02-03 16:44:34'),(1,70,NULL,'2025-02-03 16:53:06'),(1,71,NULL,'2025-02-05 08:49:06'),(1,72,NULL,'2025-02-05 09:10:06'),(1,73,NULL,'2025-02-05 09:18:37'),(1,74,NULL,'2025-02-05 09:23:25'),(1,78,NULL,'2025-02-06 10:26:27'),(1,84,NULL,'2025-02-07 15:58:05'),(1,85,NULL,'2025-02-08 10:44:30'),(3,10,NULL,'2025-01-03 15:51:17'),(3,11,NULL,'2025-01-03 16:09:00'),(6,14,NULL,'2025-01-08 07:39:34'),(6,15,NULL,'2025-01-08 07:40:22'),(6,30,NULL,'2025-01-19 10:39:53'),(7,27,NULL,'2025-01-19 07:10:49'),(7,28,NULL,'2025-01-19 07:11:32'),(8,31,NULL,'2025-01-29 07:27:17'),(9,33,NULL,'2025-01-30 09:42:47'),(9,34,NULL,'2025-01-30 09:43:21'),(10,50,NULL,'2025-02-01 11:32:31'),(11,46,NULL,'2025-02-01 07:27:05'),(11,47,NULL,'2025-02-01 07:28:47'),(11,48,NULL,'2025-02-01 07:29:18'),(11,49,NULL,'2025-02-01 10:06:24'),(11,54,NULL,'2025-02-01 16:10:31'),(12,51,NULL,'2025-02-01 16:09:10'),(12,52,NULL,'2025-02-01 16:09:37'),(12,53,NULL,'2025-02-01 16:09:46'),(13,55,NULL,'2025-02-02 08:11:26'),(14,56,NULL,'2025-02-02 08:14:27'),(14,57,NULL,'2025-02-02 08:14:47'),(14,58,NULL,'2025-02-02 08:15:01'),(14,60,NULL,'2025-02-02 10:17:35'),(15,61,NULL,'2025-02-02 10:39:50'),(16,68,NULL,'2025-02-03 13:13:18'),(17,75,NULL,'2025-02-06 08:24:58'),(17,76,NULL,'2025-02-06 08:25:12'),(17,77,NULL,'2025-02-06 08:29:19'),(17,79,NULL,'2025-02-06 11:21:02'),(17,80,NULL,'2025-02-06 11:24:02'),(17,81,NULL,'2025-02-06 11:27:51'),(17,82,NULL,'2025-02-06 11:29:41'),(17,83,NULL,'2025-02-06 11:33:23');
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
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
INSERT INTO `note` VALUES (1,'I believe the easiest route would be to store the data locally using local storage in the browser. See https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage.',NULL,'2025-01-03 11:57:55'),(2,'Use this documentation to simplify the affectItem function in the helperFunctions.js file in the front-end application.',NULL,'2025-01-03 12:14:51'),(3,'Only allow logged in users interact with tasks',NULL,'2025-01-03 12:19:14'),(4,'I should implement the login process and the user paradigm before I proceed with this task.',NULL,'2025-01-03 12:22:54'),(5,'See https://frontendmasters.com/courses/web-auth-apis/. This is the tutorial that I started given by Maximiliano Firtman.',NULL,'2025-01-03 12:25:32'),(6,'Start with the classic username/password',NULL,'2025-01-03 12:26:30'),(7,'Add a note to an objective',NULL,'2025-01-03 15:55:35'),(8,'Also, when a task is canceled/deleted un-pause it.',NULL,'2025-01-15 09:04:46'),(9,'Add the p_attach_item stored procedure to the database',NULL,'2025-01-15 13:41:15'),(10,'Add the /attach/[goal|task] route to server.js and the stored procedure call to db.js',NULL,'2025-01-15 13:42:18'),(11,'This test ensures that if a task is started then the correct goals and objectives are also started if they are not already started',NULL,'2025-01-15 16:17:35'),(12,'This can\'t be done without some effort because the target of the update can not be used in the where clause. See https://stackoverflow.com/questions/45494/mysql-error-1093-cant-specify-target-table-for-update-in-from-clause.',NULL,'2025-01-15 16:46:32'),(13,'The statement is not true, the changes made in the task update trigger cause the goal update trigger to fire. I made all the necessary changes to the code.',NULL,'2025-01-16 10:11:43'),(15,'Break the registration process into two steps, entry of a user name and the entry of a password and a confirmation of that password.',NULL,'2025-01-19 10:56:27'),(16,'The task_note to task foreign key already exists. It is just the task_note to note fk that needs to be added. Also, the goal_note to note and objective_note to note fks are also missing.',NULL,'2025-01-20 08:42:06'),(17,'To implement these changes I needed to first update the stored procedures in the following sql scripts p_add_objective_note_foreign_keys.sql, p_add_goal_note_foreign_keys.sql and p_add_task_note_foreign_keys.sql. Then I needed to recreate them. Then I checked the sql script, execute_p_create_table_schema.sql, to ensure it was passing true to p_create_table_schema so that the production data is preseved. Finally, I needed to run the shell script, create_schema.sh.',NULL,'2025-01-20 08:53:29'),(18,'Do not highlight inputs as invalid if they have no contents or, perhaps even better give fields that have not yet been interacted with a special \'sparkle\'.',NULL,'2025-01-26 07:32:14'),(28,'A test note to make sure all the existing notes retain the same number.',NULL,'2025-01-30 12:54:21'),(29,'Only return user name, full name, display name and create_dtm from user table when logging in. Store these values in a user object in the GlobalStateProvider.  ',NULL,'2025-01-30 15:31:24'),(30,'Perhaps the data should reside on the XHD.',NULL,'2025-01-31 08:27:04'),(31,'This can be done simply by opening up a terminal and running npm start',NULL,'2025-01-31 09:35:47'),(32,'This was not a good idea',NULL,'2025-01-31 12:48:22'),(33,'Implement this using drop and drop.',NULL,'2025-02-01 08:08:14'),(34,'I should probably use this for drag and drop in SolidJS apps, https://solid-dnd.com/?example=Custom%2520transformer%2520%28limit%2520x-axis%29#get-it',NULL,'2025-02-01 13:33:30'),(35,'It turns out that solid-dnd is not beng maintained...it has not been updated in 2 years and has outstanding PRs which have been ignored. Hence, I will not be using that package.',NULL,'2025-02-03 08:30:45'),(36,'Also, since many people may be looking at the same tasks persisting the reordering of them for one individual will require a significant amount of work. I cm going to abandon this task for now.',NULL,'2025-02-03 08:33:23'),(37,'I can\'t complete this until a mechanism is in place to assign a user to a started task.',NULL,'2025-02-03 09:02:48'),(38,'I don\'t think this is a worthwhile effort as it will probably be deprecated soon, is not supported in Safari and some other browsers and I need to focus on Passkeys.',NULL,'2025-02-06 20:14:41');
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
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_dtm` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`objective_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objective`
--

LOCK TABLES `objective` WRITE;
/*!40000 ALTER TABLE `objective` DISABLE KEYS */;
INSERT INTO `objective` VALUES (1,'Get a Computer Science Job','','2025-01-03 11:58:53',NULL,NULL,'2025-01-03 11:55:58','2025-01-03 11:58:53'),(2,'A test objective to document route for add','Some description','2025-01-03 15:57:18','2025-01-16 10:11:46','2025-01-15 08:48:28','2025-01-03 15:45:56','2025-01-16 12:37:06'),(3,'testing disabling','asdasd',NULL,NULL,'2025-01-26 07:57:02','2025-01-26 07:56:54','2025-01-26 07:57:02'),(4,'testing disabling again','',NULL,NULL,'2025-01-26 07:57:34','2025-01-26 07:57:23','2025-01-26 07:57:34'),(5,'test adding objective','',NULL,NULL,'2025-01-26 08:00:41','2025-01-26 08:00:26','2025-01-26 08:00:41'),(6,'ASDasdADSasd','',NULL,NULL,'2025-01-26 08:25:37','2025-01-26 08:25:00','2025-01-26 08:25:37'),(7,'adsADSadsADS','',NULL,NULL,'2025-01-26 08:27:38','2025-01-26 08:27:33','2025-01-26 08:27:38'),(8,'test objective','','2025-01-29 07:27:21','2025-01-29 07:27:34',NULL,'2025-01-29 07:26:50','2025-01-29 07:27:34'),(9,'test adding an item','',NULL,NULL,'2025-01-30 11:53:51','2025-01-30 09:59:47','2025-01-30 11:53:51'),(10,'test adding a new item','',NULL,NULL,'2025-01-30 10:06:51','2025-01-30 10:06:05','2025-01-30 10:06:51'),(11,'test adding an objective','',NULL,NULL,'2025-01-30 12:38:09','2025-01-30 11:57:55','2025-01-30 12:38:09'),(12,'sddddddffff','',NULL,NULL,'2025-01-30 12:38:05','2025-01-30 12:04:19','2025-01-30 12:38:05'),(13,'adasdasdasdasdasdad','',NULL,NULL,'2025-01-30 12:37:58','2025-01-30 12:07:20','2025-01-30 12:37:58'),(14,'ASasASsAasASa','',NULL,NULL,'2025-01-30 12:37:53','2025-01-30 12:10:12','2025-01-30 12:37:53'),(15,'asdsdddddddddd','',NULL,NULL,'2025-01-30 12:38:02','2025-01-30 12:14:42','2025-01-30 12:38:02'),(16,'test adding another objective','',NULL,NULL,'2025-01-30 12:38:25','2025-01-30 12:38:20','2025-01-30 12:38:25'),(17,'test adding a new objective','',NULL,NULL,'2025-01-31 12:21:04','2025-01-31 12:20:59','2025-01-31 12:21:04'),(18,'test adding a new objective','With a description',NULL,NULL,'2025-01-31 12:46:42','2025-01-31 12:42:22','2025-01-31 12:46:42'),(19,'test adding something','',NULL,NULL,'2025-01-31 12:47:49','2025-01-31 12:47:45','2025-01-31 12:47:49'),(20,'Saturday 2/1/2025','','2025-02-01 11:32:34',NULL,'2025-02-02 08:13:47','2025-02-01 07:26:01','2025-02-02 08:13:47'),(21,'Sunday 2/2/2025','','2025-02-02 13:18:48',NULL,'2025-02-03 13:12:44','2025-02-02 08:13:59','2025-02-03 13:12:44'),(22,'Monday 2/3/2025','','2025-02-06 08:24:14','2025-02-06 08:24:15',NULL,'2025-02-03 13:12:56','2025-02-06 08:24:15'),(23,'test web push','',NULL,NULL,'2025-02-05 09:14:52','2025-02-05 09:14:08','2025-02-05 09:14:52'),(24,'Thursday 2/6/2025','','2025-02-06 08:29:28','2025-02-06 20:12:28',NULL,'2025-02-06 08:24:36','2025-02-06 20:12:28'),(25,'test logToConsole in index.js','',NULL,NULL,'2025-02-06 11:19:30','2025-02-06 10:47:31','2025-02-06 11:19:30'),(26,'test logToConsole in index.js a second time','',NULL,NULL,'2025-02-06 11:19:36','2025-02-06 10:49:19','2025-02-06 11:19:36'),(27,'test logToConsole in index.js a third time','',NULL,NULL,'2025-02-06 11:19:39','2025-02-06 10:50:04','2025-02-06 11:19:39'),(28,'test logToConsole in index.js a forth time','',NULL,NULL,'2025-02-06 11:19:33','2025-02-06 10:50:41','2025-02-06 11:19:33');
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
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
INSERT INTO `objective_goal` VALUES (1,1,NULL,'2025-01-03 11:56:15'),(1,2,NULL,'2025-01-03 11:56:45'),(1,6,NULL,'2025-01-08 07:37:07'),(1,7,NULL,'2025-01-19 07:09:41'),(1,9,NULL,'2025-01-30 09:42:17'),(1,15,NULL,'2025-02-02 10:39:35'),(2,3,NULL,'2025-01-03 15:47:35'),(2,4,NULL,'2025-01-03 16:12:25'),(2,5,NULL,'2025-01-04 08:21:53'),(8,8,NULL,'2025-01-29 07:27:05'),(20,10,NULL,'2025-02-01 07:26:23'),(20,11,NULL,'2025-02-01 07:26:39'),(20,12,NULL,'2025-02-01 16:08:48'),(20,13,NULL,'2025-02-02 08:11:16'),(21,14,NULL,'2025-02-02 08:14:14'),(22,16,NULL,'2025-02-03 13:13:08'),(24,17,NULL,'2025-02-06 08:24:44');
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
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
INSERT INTO `objective_note` VALUES (2,7,NULL,'2025-01-03 15:55:35');
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
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sql_error_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_error`
--

LOCK TABLES `sql_error` WRITE;
/*!40000 ALTER TABLE `sql_error` DISABLE KEYS */;
INSERT INTO `sql_error` VALUES (1,'ERROR 1136 (21S01): Column count doesn\'t match value count at row 1','p_create_table','table name: user_login','2025-01-20 14:11:47'),(2,'ERROR 3730 (HY000): Cannot drop table \'task\' referenced by a foreign key constraint \'fk_task_note_to_task\' on table \'task_note\'.','p_create_table','table name: task','2025-02-04 10:48:41');
/*!40000 ALTER TABLE `sql_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_goal`
--

DROP TABLE IF EXISTS `t_goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_goal` (
  `goal_id` int NOT NULL DEFAULT '0',
  `item_name` varchar(50) NOT NULL,
  `item_description` varchar(1000) NOT NULL,
  `started_dtm` datetime DEFAULT NULL,
  `completed_dtm` datetime DEFAULT NULL,
  `deleted_dtm` datetime DEFAULT NULL,
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_dtm` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_goal`
--

LOCK TABLES `t_goal` WRITE;
/*!40000 ALTER TABLE `t_goal` DISABLE KEYS */;
INSERT INTO `t_goal` VALUES (1,'Create the Life Helper Application','','2025-01-03 11:58:53',NULL,NULL,'2025-01-03 11:56:15','2025-01-03 11:58:53'),(2,'Put the NWS Temperature App on the web','',NULL,'2025-01-16 10:11:46',NULL,'2025-01-03 11:56:45','2025-01-16 10:11:46'),(3,'adding a goal','','2025-01-03 15:57:18','2025-01-16 10:11:46','2025-01-03 16:24:55','2025-01-03 15:47:35','2025-01-16 10:11:46'),(4,'another goal to cancel/delete','',NULL,'2025-01-16 10:11:46','2025-01-03 16:12:30','2025-01-03 16:12:25','2025-01-16 10:11:46'),(5,'See if this generates a web push get request.','',NULL,'2025-01-16 10:11:46','2025-01-15 08:48:20','2025-01-04 08:21:53','2025-01-16 10:11:46'),(6,'Create a NWS Prediction Tracker','Build this application using TypeScript and VITE. Deploy it to GitHub using the GitHub Actions and not from a branch so that index.html does not have to reside at the root of the project.',NULL,NULL,NULL,'2025-01-08 07:37:07',NULL),(7,'Master Web Authentication','','2025-01-19 07:11:36',NULL,NULL,'2025-01-19 07:09:41','2025-01-19 07:11:36'),(8,'test goal to save','','2025-01-29 07:27:21','2025-01-29 07:27:34',NULL,'2025-01-29 07:27:05','2025-01-29 07:27:34'),(9,'Study Artificial Intelligence','','2025-01-30 09:43:34',NULL,NULL,'2025-01-30 09:42:17','2025-01-30 09:43:34'),(10,'Clean Kitchen','','2025-02-01 11:32:34','2025-02-01 11:32:35',NULL,'2025-02-01 07:26:23','2025-02-01 11:32:35'),(11,'Review Bills & Accounts','','2025-02-01 15:21:43',NULL,'2025-02-02 08:13:37','2025-02-01 07:26:39','2025-02-02 08:13:37'),(12,'Make chicken soup','','2025-02-01 16:30:46',NULL,'2025-02-02 08:13:08','2025-02-01 16:08:48','2025-02-02 08:13:08'),(13,'Miscellaneous','',NULL,NULL,'2025-02-02 08:12:52','2025-02-02 08:11:16','2025-02-02 08:12:52'),(14,'Miscellaneous','','2025-02-02 13:18:48',NULL,'2025-02-03 13:12:38','2025-02-02 08:14:14','2025-02-03 13:12:38'),(15,'Enhance the resume','',NULL,NULL,NULL,'2025-02-02 10:39:35',NULL),(16,'Miscellaneous','',NULL,NULL,NULL,'2025-02-03 13:13:08',NULL);
/*!40000 ALTER TABLE `t_goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_goal_note`
--

DROP TABLE IF EXISTS `t_goal_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_goal_note` (
  `goal_id` int NOT NULL,
  `note_id` int NOT NULL,
  `deleted_dtm` datetime DEFAULT NULL,
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_goal_note`
--

LOCK TABLES `t_goal_note` WRITE;
/*!40000 ALTER TABLE `t_goal_note` DISABLE KEYS */;
INSERT INTO `t_goal_note` VALUES (2,1,NULL,'2025-01-03 11:57:55');
/*!40000 ALTER TABLE `t_goal_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_goal_task`
--

DROP TABLE IF EXISTS `t_goal_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_goal_task` (
  `goal_id` int NOT NULL,
  `task_id` int NOT NULL,
  `deleted_dtm` datetime DEFAULT NULL,
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_goal_task`
--

LOCK TABLES `t_goal_task` WRITE;
/*!40000 ALTER TABLE `t_goal_task` DISABLE KEYS */;
INSERT INTO `t_goal_task` VALUES (1,1,NULL,'2025-01-03 11:58:37'),(1,2,NULL,'2025-01-03 11:59:36'),(1,3,NULL,'2025-01-03 12:01:36'),(1,4,NULL,'2025-01-03 12:11:12'),(1,5,NULL,'2025-01-03 12:13:46'),(1,6,NULL,'2025-01-03 12:16:35'),(1,7,NULL,'2025-01-03 12:18:26'),(1,8,NULL,'2025-01-03 12:18:45'),(1,9,NULL,'2025-01-03 12:26:02'),(1,12,NULL,'2025-01-03 16:24:05'),(1,13,NULL,'2025-01-04 08:42:18'),(1,16,NULL,'2025-01-15 08:55:46'),(1,17,NULL,'2025-01-15 09:04:18'),(1,18,NULL,'2025-01-15 09:23:20'),(1,19,NULL,'2025-01-15 09:25:32'),(1,20,NULL,'2025-01-15 13:40:41'),(1,21,NULL,'2025-01-15 13:43:27'),(1,22,NULL,'2025-01-15 16:19:27'),(1,23,NULL,'2025-01-15 16:20:20'),(1,24,NULL,'2025-01-16 10:12:44'),(1,25,NULL,'2025-01-16 10:13:48'),(1,26,NULL,'2025-01-16 11:21:31'),(1,29,NULL,'2025-01-19 08:27:45'),(3,10,NULL,'2025-01-03 15:51:17'),(3,11,NULL,'2025-01-03 16:09:00'),(6,14,NULL,'2025-01-08 07:39:34'),(6,15,NULL,'2025-01-08 07:40:22'),(6,30,NULL,'2025-01-19 10:39:53'),(7,27,NULL,'2025-01-19 07:10:49'),(7,28,NULL,'2025-01-19 07:11:32');
/*!40000 ALTER TABLE `t_goal_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_note`
--

DROP TABLE IF EXISTS `t_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_note` (
  `note_id` int NOT NULL DEFAULT '0',
  `note` varchar(1000) NOT NULL,
  `deleted_dtm` datetime DEFAULT NULL,
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_note`
--

LOCK TABLES `t_note` WRITE;
/*!40000 ALTER TABLE `t_note` DISABLE KEYS */;
INSERT INTO `t_note` VALUES (1,'I believe the easiest route would be to store the data locally using local storage in the browser. See https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage.',NULL,'2025-01-03 11:57:55'),(2,'Use this documentation to simplify the affectItem function in the helperFunctions.js file in the front-end application.',NULL,'2025-01-03 12:14:51'),(3,'Only allow logged in users interact with tasks',NULL,'2025-01-03 12:19:14'),(4,'I should implement the login process and the user paradigm before I proceed with this task.',NULL,'2025-01-03 12:22:54'),(5,'See https://frontendmasters.com/courses/web-auth-apis/. This is the tutorial that I started given by Maximiliano Firtman.',NULL,'2025-01-03 12:25:32'),(6,'Start with the classic username/password',NULL,'2025-01-03 12:26:30'),(7,'Add a note to an objective',NULL,'2025-01-03 15:55:35'),(8,'Also, when a task is canceled/deleted un-pause it.',NULL,'2025-01-15 09:04:46'),(9,'Add the p_attach_item stored procedure to the database',NULL,'2025-01-15 13:41:15'),(10,'Add the /attach/[goal|task] route to server.js and the stored procedure call to db.js',NULL,'2025-01-15 13:42:18'),(11,'This test ensures that if a task is started then the correct goals and objectives are also started if they are not already started',NULL,'2025-01-15 16:17:35'),(12,'This can\'t be done without some effort because the target of the update can not be used in the where clause. See https://stackoverflow.com/questions/45494/mysql-error-1093-cant-specify-target-table-for-update-in-from-clause.',NULL,'2025-01-15 16:46:32'),(13,'The statement is not true, the changes made in the task update trigger cause the goal update trigger to fire. I made all the necessary changes to the code.',NULL,'2025-01-16 10:11:43'),(15,'Break the registration process into two steps, entry of a user name and the entry of a password and a confirmation of that password.',NULL,'2025-01-19 10:56:27'),(16,'The task_note to task foreign key already exists. It is just the task_note to note fk that needs to be added. Also, the goal_note to note and objective_note to note fks are also missing.',NULL,'2025-01-20 08:42:06'),(17,'To implement these changes I needed to first update the stored procedures in the following sql scripts p_add_objective_note_foreign_keys.sql, p_add_goal_note_foreign_keys.sql and p_add_task_note_foreign_keys.sql. Then I needed to recreate them. Then I checked the sql script, execute_p_create_table_schema.sql, to ensure it was passing true to p_create_table_schema so that the production data is preseved. Finally, I needed to run the shell script, create_schema.sh.',NULL,'2025-01-20 08:53:29');
/*!40000 ALTER TABLE `t_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_objective`
--

DROP TABLE IF EXISTS `t_objective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_objective` (
  `objective_id` int NOT NULL DEFAULT '0',
  `item_name` varchar(50) NOT NULL,
  `item_description` varchar(1000) NOT NULL,
  `started_dtm` datetime DEFAULT NULL,
  `completed_dtm` datetime DEFAULT NULL,
  `deleted_dtm` datetime DEFAULT NULL,
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_dtm` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_objective`
--

LOCK TABLES `t_objective` WRITE;
/*!40000 ALTER TABLE `t_objective` DISABLE KEYS */;
INSERT INTO `t_objective` VALUES (1,'Get a Computer Science Job','','2025-01-03 11:58:53',NULL,NULL,'2025-01-03 11:55:58','2025-01-03 11:58:53'),(2,'A test objective to document route for add','Some description','2025-01-03 15:57:18','2025-01-16 10:11:46','2025-01-15 08:48:28','2025-01-03 15:45:56','2025-01-16 12:37:06');
/*!40000 ALTER TABLE `t_objective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_objective_goal`
--

DROP TABLE IF EXISTS `t_objective_goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_objective_goal` (
  `objective_id` int NOT NULL,
  `goal_id` int NOT NULL,
  `deleted_dtm` datetime DEFAULT NULL,
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_objective_goal`
--

LOCK TABLES `t_objective_goal` WRITE;
/*!40000 ALTER TABLE `t_objective_goal` DISABLE KEYS */;
INSERT INTO `t_objective_goal` VALUES (1,1,NULL,'2025-01-03 11:56:15'),(1,2,NULL,'2025-01-03 11:56:45'),(1,6,NULL,'2025-01-08 07:37:07'),(1,7,NULL,'2025-01-19 07:09:41'),(2,3,NULL,'2025-01-03 15:47:35'),(2,4,NULL,'2025-01-03 16:12:25'),(2,5,NULL,'2025-01-04 08:21:53');
/*!40000 ALTER TABLE `t_objective_goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_objective_note`
--

DROP TABLE IF EXISTS `t_objective_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_objective_note` (
  `objective_id` int NOT NULL,
  `note_id` int NOT NULL,
  `deleted_dtm` datetime DEFAULT NULL,
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_objective_note`
--

LOCK TABLES `t_objective_note` WRITE;
/*!40000 ALTER TABLE `t_objective_note` DISABLE KEYS */;
INSERT INTO `t_objective_note` VALUES (2,7,NULL,'2025-01-03 15:55:35');
/*!40000 ALTER TABLE `t_objective_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sql_error`
--

DROP TABLE IF EXISTS `t_sql_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sql_error` (
  `sql_error_id` int NOT NULL DEFAULT '0',
  `sql_error` varchar(1024) NOT NULL,
  `stored_procedure_name` varchar(50) NOT NULL,
  `additional_information` varchar(1024) NOT NULL,
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sql_error`
--

LOCK TABLES `t_sql_error` WRITE;
/*!40000 ALTER TABLE `t_sql_error` DISABLE KEYS */;
INSERT INTO `t_sql_error` VALUES (1,'ERROR 1136 (21S01): Column count doesn\'t match value count at row 1','p_create_table','table name: user_login','2025-01-20 14:11:47');
/*!40000 ALTER TABLE `t_sql_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_task`
--

DROP TABLE IF EXISTS `t_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_task` (
  `task_id` int NOT NULL DEFAULT '0',
  `item_name` varchar(50) NOT NULL,
  `item_description` varchar(1000) NOT NULL,
  `started_dtm` datetime DEFAULT NULL,
  `paused_dtm` datetime DEFAULT NULL,
  `completed_dtm` datetime DEFAULT NULL,
  `deleted_dtm` datetime DEFAULT NULL,
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_dtm` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_task`
--

LOCK TABLES `t_task` WRITE;
/*!40000 ALTER TABLE `t_task` DISABLE KEYS */;
INSERT INTO `t_task` VALUES (1,'Enable pausing tasks','','2025-01-03 12:09:58','2025-01-03 12:15:07','2025-01-03 12:16:48',NULL,'2025-01-03 11:58:37','2025-01-03 12:16:48'),(2,'Disable Save button once clicked','Disable the save button on both AddItem and AddNote once it is clicked.','2025-01-26 08:28:49',NULL,'2025-01-26 08:28:51',NULL,'2025-01-03 11:59:36','2025-01-26 08:28:51'),(3,'Create a Venn Diagram to show filters','Create some kind of Venn-Diagram like display to show the affect of the selected state filters to the user.',NULL,NULL,NULL,NULL,'2025-01-03 12:01:36',NULL),(4,'Make sure the life_helper database is backed up','Make sure the life_helper database is backed up regularly',NULL,NULL,NULL,NULL,'2025-01-03 12:11:12',NULL),(5,'Document the data route structure','Add a section to the express server documentation documenting the data routes. After I have done this I should standardize their structure.','2025-01-16 10:10:12',NULL,'2025-01-16 10:10:14',NULL,'2025-01-03 12:13:46','2025-01-16 10:10:14'),(6,'When a task is paused italicize it','I may decide on another indicator later down the line','2025-01-15 09:01:40',NULL,'2025-01-16 16:45:27',NULL,'2025-01-03 12:16:35','2025-01-16 16:45:27'),(7,'When a task is started pause all other tasks','When a task is started pause the currently started but un-paused task if one exists. Note, there should only ever bee one such task.',NULL,NULL,NULL,'2025-01-16 10:12:56','2025-01-03 12:18:26','2025-01-16 10:12:56'),(8,'create a login mechanism','','2025-01-03 12:26:08',NULL,'2025-01-30 17:30:35',NULL,'2025-01-03 12:18:45','2025-01-30 17:30:35'),(9,'Allow links to be put in descriptions and notes','',NULL,NULL,NULL,NULL,'2025-01-03 12:26:02',NULL),(10,'some task.','and it\'s description','2025-01-03 15:57:18','2025-01-03 16:06:11',NULL,'2025-01-03 16:10:28','2025-01-03 15:51:17','2025-01-03 16:10:28'),(11,'Another task to start','','2025-01-03 16:09:03',NULL,'2025-01-03 16:09:31',NULL,'2025-01-03 16:09:00','2025-01-03 16:09:31'),(12,'Don\'t allow logically orphaned items.','If a goal has tasks that are not all canceled than don\'t allow the goal to be cancelled. Likewise, if an objective has goals that are not all canceled than don\'t allow the objective to be cancelled.\n\n',NULL,NULL,NULL,NULL,'2025-01-03 16:24:05',NULL),(13,'Service Worker Enhancement #1','Do not request a web push subscription once one has been obtained.',NULL,NULL,NULL,NULL,'2025-01-04 08:42:18',NULL),(14,'Scaffold this app','Start with a bare bone VITE scaffolding using TypeScript and SolidJS.',NULL,NULL,NULL,NULL,'2025-01-08 07:39:34',NULL),(15,'Use this TypeScript advice','See this site, https://dev.to/fkrasnowski/simple-kv-storage-on-top-of-indexeddb-3jcg to assist in building the promise based solution.',NULL,NULL,NULL,NULL,'2025-01-08 07:40:22',NULL),(16,'Verify Cascading Triggers Statement','Ensure that the claim I made in the task trigger about cascading triggers is true. If not, remove that statement from the code and consider using them.','2025-01-16 10:11:45',NULL,'2025-01-16 10:11:46',NULL,'2025-01-15 08:55:46','2025-01-16 10:11:46'),(17,'When a task is completed un-pause it','','2025-01-15 09:15:16',NULL,'2025-01-16 16:44:35',NULL,'2025-01-15 09:04:18','2025-01-16 16:44:35'),(18,'Create a test for the task trigger','Create a test to ensure the task trigger works properly.','2025-01-15 09:26:11',NULL,'2025-01-15 16:18:26',NULL,'2025-01-15 09:23:20','2025-01-15 16:18:26'),(19,'Ensure that the task trigger works properly','Currently the task trigger does not directly use the task_id of the task that was started or completed to effect the data. This should not be the case...it should definitely restrict its affects to only those goals and objectives associated with the specific task that was started or created.','2025-01-15 09:25:56',NULL,'2025-01-17 14:41:14',NULL,'2025-01-15 09:25:32','2025-01-17 14:41:14'),(20,'Create \"attach\" route','The \"attach\" route is the route that the application uses to attach an existing goal to an objective or an existing task to a goal.','2025-01-15 13:43:33',NULL,'2025-01-21 11:45:30',NULL,'2025-01-15 13:40:41','2025-01-21 11:45:30'),(21,'Add the \"attach\" capability to the application.','Enhance Life Helper to allow an existing goal to be attached to an objective or an existing task to be attached to a goal.',NULL,NULL,NULL,NULL,'2025-01-15 13:43:27',NULL),(22,'Create test 2 for the task trigger','Model this test after test 1 but as relates to propagating the completed status.','2025-01-15 16:19:37',NULL,'2025-01-16 10:09:52',NULL,'2025-01-15 16:19:27','2025-01-16 10:09:52'),(23,'Remove use of temp tables from triggers','Remove the use of temp tables from the task update and the goal update triggers.','2025-01-15 16:20:26',NULL,'2025-01-15 16:46:34',NULL,'2025-01-15 16:20:20','2025-01-15 16:46:34'),(24,'Enable un-pausing a task','','2025-01-16 16:50:00',NULL,'2025-01-16 16:50:01',NULL,'2025-01-16 10:12:44','2025-01-16 16:50:01'),(25,'When a task is started pause all other user tasks ','When a task is started pause all other tasks associated with that user. ',NULL,NULL,NULL,NULL,'2025-01-16 10:13:48',NULL),(26,'Service Worker Enhancement #2','Make sure that an given web push only happens once. I am suspicious that this may not be the case.',NULL,NULL,NULL,NULL,'2025-01-16 11:21:31','2025-01-16 11:23:43'),(27,'Complete \"Web Authentication APIs\" Tutorial','','2025-01-19 07:11:36',NULL,NULL,NULL,'2025-01-19 07:10:49','2025-01-19 07:11:36'),(28,'Integrate this functionality into Life Helper','',NULL,NULL,NULL,NULL,'2025-01-19 07:11:32',NULL),(29,'Add a foreign key to task_note','Add a foreign key references from task_note to task and from task_note to note.','2025-01-20 08:38:57',NULL,'2025-01-20 08:55:23',NULL,'2025-01-19 08:27:45','2025-01-20 08:55:23'),(30,'Create a run date store','Create a run date store and use it to enforce the one-run-per-day rule.',NULL,NULL,NULL,NULL,'2025-01-19 10:39:53',NULL),(31,'test task to use','','2025-01-29 07:27:21',NULL,'2025-01-29 07:27:34',NULL,'2025-01-29 07:27:17','2025-01-29 07:27:34'),(32,'Implement CSS nesting ','See forms.css for an example of CSS nesting with the fieldset.','2025-01-31 08:26:08','2025-01-31 08:26:10',NULL,NULL,'2025-01-29 07:38:05','2025-01-31 08:26:10'),(33,'Watch this video','https://www.youtube.com/watch?v=mC76YxBpwAQ',NULL,NULL,NULL,NULL,'2025-01-30 09:42:47',NULL),(34,'Return to this tutorial after watching the video','The video in task 33','2025-01-30 09:43:34','2025-01-30 09:43:36',NULL,NULL,'2025-01-30 09:43:21','2025-01-30 09:43:36'),(35,'Add phone number to sign up','',NULL,NULL,NULL,'2025-01-31 14:08:04','2025-01-30 15:28:55','2025-01-31 14:08:04'),(36,'Create a logout mechanism','','2025-01-30 17:30:28',NULL,'2025-01-30 17:30:39',NULL,'2025-01-30 15:43:49','2025-01-30 17:30:39'),(37,'Ensure the password manager works','Make sure the chrome password manager stores the user name and password during registration. ',NULL,NULL,NULL,NULL,'2025-01-31 08:25:56',NULL),(38,'Create an action button component','This component should ensure that the button cannot be clicked a second time without completing the activity launched by the first click. ','2025-01-31 08:28:47','2025-01-31 11:02:13',NULL,'2025-01-31 12:48:27','2025-01-31 08:28:41','2025-01-31 12:48:27'),(39,'Deploy the data server as a service','Create a way to launch the server outside of VSCode.','2025-01-31 09:35:49',NULL,'2025-01-31 09:35:51',NULL,'2025-01-31 09:31:40','2025-01-31 09:35:51'),(40,'Organize the code','Create folders in the src directory to better organize the code. Start with a CSS directory. ','2025-01-31 11:02:06',NULL,'2025-01-31 12:55:14',NULL,'2025-01-31 11:02:01','2025-01-31 12:55:14'),(41,'Make the login button the default button','',NULL,NULL,NULL,NULL,'2025-01-31 11:19:29',NULL),(42,'Add email address to user information','','2025-02-03 09:33:57','2025-02-03 09:34:01',NULL,NULL,'2025-01-31 14:08:20','2025-02-03 09:34:01'),(43,'Provide a way to rank items','','2025-02-01 10:06:40',NULL,NULL,'2025-02-03 08:33:29','2025-01-31 14:24:50','2025-02-03 08:33:29'),(44,'Create a strategy for database migration','Create a strategy for database migration that ensures that there are always two databases that are in sync after the migration is successful.',NULL,NULL,NULL,NULL,'2025-01-31 15:48:16',NULL),(45,'Create a strategy to test the migration scripts','I believe this strategy is partly in place. The strategy should be to run the create_schema.sh script in the t_life_helper database and then compare it to the production life_helper schema. ',NULL,NULL,NULL,NULL,'2025-01-31 16:27:13',NULL),(46,'Reconcile Banking for January','','2025-02-01 15:21:51',NULL,'2025-02-01 16:09:53',NULL,'2025-02-01 07:27:05','2025-02-01 16:09:53'),(47,'Create February cash workbook','',NULL,NULL,NULL,'2025-02-02 08:12:32','2025-02-01 07:28:47','2025-02-02 08:12:32'),(48,'Reconcile January cash workbook to 2025 workbook','','2025-02-01 16:29:32',NULL,'2025-02-01 16:29:34',NULL,'2025-02-01 07:29:18','2025-02-01 16:29:34'),(49,'Freedom VISA receipts','','2025-02-01 15:21:43',NULL,'2025-02-01 15:21:44',NULL,'2025-02-01 10:06:24','2025-02-01 15:21:44'),(50,'Do it all.','','2025-02-01 11:32:34',NULL,'2025-02-01 11:32:35',NULL,'2025-02-01 11:32:31','2025-02-01 11:32:35'),(51,'Purchase and cook chicken','','2025-02-02 08:11:55',NULL,'2025-02-02 08:11:56',NULL,'2025-02-01 16:09:10','2025-02-02 08:11:56'),(52,'Determine what is needed for chicken soup','','2025-02-01 16:30:46',NULL,'2025-02-01 16:30:48',NULL,'2025-02-01 16:09:37','2025-02-01 16:30:48'),(53,'Make chicken soup','',NULL,NULL,NULL,'2025-02-02 08:13:01','2025-02-01 16:09:46','2025-02-02 08:13:01'),(54,'Reconcile January cash workbook to Quicken','','2025-02-01 16:10:37',NULL,'2025-02-01 16:16:40',NULL,'2025-02-01 16:10:31','2025-02-01 16:16:40'),(55,'Go through email','',NULL,NULL,NULL,'2025-02-02 08:12:45','2025-02-02 08:11:26','2025-02-02 08:12:45'),(56,'Go through email','','2025-02-02 13:18:53',NULL,'2025-02-02 13:18:54',NULL,'2025-02-02 08:14:27','2025-02-02 13:18:54'),(57,'Make chicken soup','','2025-02-02 13:18:48',NULL,'2025-02-02 13:18:49',NULL,'2025-02-02 08:14:47','2025-02-02 13:18:49'),(58,'Create February cash workbook','','2025-02-03 13:12:22',NULL,'2025-02-03 13:12:23',NULL,'2025-02-02 08:15:01','2025-02-03 13:12:23'),(59,'Allow the user to create a random list of tasks.','Allow the user to create a random list of tasks that act as a schedule of activities.',NULL,NULL,NULL,'2025-02-03 09:34:38','2025-02-02 10:09:17','2025-02-03 09:34:38'),(60,'Make time for reading','',NULL,NULL,NULL,'2025-02-03 13:12:29','2025-02-02 10:17:35','2025-02-03 13:12:29'),(61,'Add Full stack to the resume','',NULL,NULL,NULL,NULL,'2025-02-02 10:39:50',NULL),(62,'Allow the user to create a work queue of tasks','Provide a mechanism to allow a user to identify tasks to be added to a work queue such as a context menu with an \"add to work queue\" option to select. This mechanism must work equally well on a laptop or a mobile device.','2025-02-03 08:36:23',NULL,NULL,'2025-02-03 08:38:20','2025-02-03 08:36:15','2025-02-03 08:38:20'),(63,'Add an \"assigned to me\" checkbox to the filters','When checked the user will only see tasks in the current context that are assigned to them','2025-02-03 08:45:31','2025-02-03 09:02:15',NULL,NULL,'2025-02-03 08:45:28','2025-02-03 09:02:15'),(64,'When navigating around site remember the list.','When a user navigates away from the list remember where they were and return them there.','2025-02-03 08:46:58','2025-02-03 08:46:59',NULL,NULL,'2025-02-03 08:46:48','2025-02-03 08:46:59'),(65,'Associate a user with a started task','','2025-02-03 09:02:02','2025-02-03 09:58:11',NULL,NULL,'2025-02-03 09:01:58','2025-02-03 09:58:11'),(66,'Create a log of the time a use worked on tasks','See the README Enhancements->Associate users with tasks description for the implementation details.','2025-02-03 09:56:10',NULL,NULL,NULL,'2025-02-03 09:56:05','2025-02-03 09:56:10'),(67,'Change deleted_dtm column name in task','Change deleted_dtm column name in task to canceled_deleted_dtm','2025-02-03 09:58:04',NULL,NULL,'2025-02-03 10:03:00','2025-02-03 09:57:56','2025-02-03 10:03:00'),(68,'Make time for reading','',NULL,NULL,NULL,NULL,'2025-02-03 13:13:18',NULL),(69,'Navigate to Home after logging in','',NULL,NULL,NULL,NULL,'2025-02-03 16:44:34',NULL),(70,'Add a confirm email step to registration','',NULL,NULL,NULL,NULL,'2025-02-03 16:53:06',NULL);
/*!40000 ALTER TABLE `t_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_task_note`
--

DROP TABLE IF EXISTS `t_task_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_task_note` (
  `task_id` int NOT NULL,
  `note_id` int NOT NULL,
  `deleted_dtm` datetime DEFAULT NULL,
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_task_note`
--

LOCK TABLES `t_task_note` WRITE;
/*!40000 ALTER TABLE `t_task_note` DISABLE KEYS */;
INSERT INTO `t_task_note` VALUES (5,2,NULL,'2025-01-03 12:14:51'),(7,4,NULL,'2025-01-03 12:22:54'),(8,3,NULL,'2025-01-03 12:19:14'),(8,5,NULL,'2025-01-03 12:25:32'),(8,6,NULL,'2025-01-03 12:26:30'),(8,15,NULL,'2025-01-19 10:56:27'),(16,13,NULL,'2025-01-16 10:11:43'),(17,8,NULL,'2025-01-15 09:04:46'),(18,11,NULL,'2025-01-15 16:17:35'),(20,9,NULL,'2025-01-15 13:41:15'),(20,10,NULL,'2025-01-15 13:42:18'),(23,12,NULL,'2025-01-15 16:46:32'),(29,16,NULL,'2025-01-20 08:42:06'),(29,17,NULL,'2025-01-20 08:53:29');
/*!40000 ALTER TABLE `t_task_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_trigger_log`
--

DROP TABLE IF EXISTS `t_trigger_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_trigger_log` (
  `trigger_log_id` int NOT NULL DEFAULT '0',
  `statement` varchar(100) DEFAULT NULL,
  `integer_result` int DEFAULT NULL,
  `string_result` varchar(100) DEFAULT NULL,
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_trigger_log`
--

LOCK TABLES `t_trigger_log` WRITE;
/*!40000 ALTER TABLE `t_trigger_log` DISABLE KEYS */;
INSERT INTO `t_trigger_log` VALUES (1,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-03 11:58:53'),(2,'In the started IF',NULL,NULL,'2025-01-03 11:58:53'),(3,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-03 12:05:33'),(4,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-03 12:09:58'),(5,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-03 12:15:07'),(6,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-03 12:16:48'),(7,'In the completed IF',NULL,NULL,'2025-01-03 12:16:48'),(8,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-03 12:26:08'),(9,'In the started IF',NULL,NULL,'2025-01-03 12:26:08'),(10,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-03 15:57:18'),(11,'In the started IF',NULL,NULL,'2025-01-03 15:57:18'),(12,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-03 16:06:11'),(13,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-03 16:09:03'),(14,'In the started IF',NULL,NULL,'2025-01-03 16:09:03'),(15,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-03 16:09:31'),(16,'In the completed IF',NULL,NULL,'2025-01-03 16:09:31'),(17,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-03 16:10:28'),(18,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 08:56:22'),(19,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 09:01:40'),(20,'In the started IF',NULL,NULL,'2025-01-15 09:01:40'),(21,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 09:03:26'),(22,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 09:03:33'),(23,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 09:15:16'),(24,'In the started IF',NULL,NULL,'2025-01-15 09:15:16'),(25,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 09:25:56'),(26,'In the started IF',NULL,NULL,'2025-01-15 09:25:56'),(27,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 09:25:58'),(28,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 09:26:11'),(29,'In the started IF',NULL,NULL,'2025-01-15 09:26:11'),(30,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 09:26:19'),(31,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 13:43:33'),(32,'In the started IF',NULL,NULL,'2025-01-15 13:43:33'),(33,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 16:18:26'),(34,'In the completed IF',NULL,NULL,'2025-01-15 16:18:26'),(35,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 16:19:37'),(36,'In the started IF',NULL,NULL,'2025-01-15 16:19:37'),(37,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 16:20:26'),(38,'In the started IF',NULL,NULL,'2025-01-15 16:20:26'),(39,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 16:46:34'),(40,'In the completed IF',NULL,NULL,'2025-01-15 16:46:34'),(41,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 10:09:52'),(42,'In the completed IF',NULL,NULL,'2025-01-16 10:09:52'),(43,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 10:10:12'),(44,'In the started IF',NULL,NULL,'2025-01-16 10:10:12'),(45,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 10:10:14'),(46,'In the completed IF',NULL,NULL,'2025-01-16 10:10:14'),(47,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 10:11:45'),(48,'In the started IF',NULL,NULL,'2025-01-16 10:11:45'),(49,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 10:11:46'),(50,'In the completed IF',NULL,NULL,'2025-01-16 10:11:46'),(51,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 10:12:02'),(52,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 10:12:56'),(53,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 11:23:43'),(55,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 16:44:35'),(56,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 16:44:35'),(57,'In the completed IF',NULL,NULL,'2025-01-16 16:44:35'),(58,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 16:45:27'),(59,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 16:45:27'),(60,'In the completed IF',NULL,NULL,'2025-01-16 16:45:27'),(61,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 16:49:46'),(62,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 16:49:48'),(63,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 16:49:49'),(64,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 16:49:56'),(65,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 16:50:00'),(66,'In the started IF',NULL,NULL,'2025-01-16 16:50:00'),(67,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 16:50:01'),(68,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 16:50:01'),(69,'In the completed IF',NULL,NULL,'2025-01-16 16:50:01'),(70,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 19:31:17'),(71,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 19:31:18'),(72,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-17 14:41:14'),(73,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-17 14:41:14'),(74,'In the completed IF',NULL,NULL,'2025-01-17 14:41:14'),(75,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-19 07:11:36'),(76,'In the started IF',NULL,NULL,'2025-01-19 07:11:36'),(77,'In the trigger, trigger_goal_update',NULL,NULL,'2025-01-19 07:11:36'),(78,'In the started IF',NULL,NULL,'2025-01-19 07:11:36'),(79,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-19 10:56:40'),(80,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-19 10:56:43'),(81,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-19 14:35:57'),(82,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-19 14:35:58'),(83,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-19 16:24:23'),(84,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-19 16:24:24'),(85,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-19 16:24:25'),(86,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-19 16:24:28'),(87,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-19 16:24:31'),(88,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-19 16:24:32'),(89,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-19 16:25:35'),(90,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-20 08:38:57'),(91,'In the started IF',NULL,NULL,'2025-01-20 08:38:57'),(92,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-20 08:55:23'),(93,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-20 08:55:23'),(94,'In the completed IF',NULL,NULL,'2025-01-20 08:55:23'),(95,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-20 08:55:31');
/*!40000 ALTER TABLE `t_trigger_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_login`
--

DROP TABLE IF EXISTS `t_user_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user_login` (
  `user_login_id` int NOT NULL DEFAULT '0',
  `user_name` varchar(30) NOT NULL,
  `hashed_password` varchar(100) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `display_name` varchar(30) NOT NULL,
  `email_address` varchar(100) DEFAULT NULL,
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_dtm` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_login`
--

LOCK TABLES `t_user_login` WRITE;
/*!40000 ALTER TABLE `t_user_login` DISABLE KEYS */;
INSERT INTO `t_user_login` VALUES (19,'Tom.Langan@Comcast.net','$2b$10$BDsUwGu6G9/y50N3DaC8ouZpOGo8/0mJYF5cP9DHj6EhipwVw.1De','Thomas H Langan','Tom',NULL,'2025-01-28 15:20:31',NULL),(24,'Wendy.Langan@Comcast.net','$2b$10$4XaGc7wEtYncxliBLabmjO8og7vnMqz5MNDnlWCednxsi9Hjq8txy','Wendy L Langan','Wendy',NULL,'2025-02-03 16:43:35',NULL),(28,'FredTheFrog','$2b$10$ebd09GsGSMWwfu3Ac43hCeTvjMfcraibXhrvvvrmQoVIMPphLN.JK','Fred Durrs','Fred','fred@frog.net','2025-02-04 15:21:10',NULL);
/*!40000 ALTER TABLE `t_user_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_web_push_subscription`
--

DROP TABLE IF EXISTS `t_web_push_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_web_push_subscription` (
  `web_push_subscription_id` int NOT NULL DEFAULT '0',
  `capability_url` varchar(250) NOT NULL,
  `public_key` varchar(100) NOT NULL,
  `private_key` varchar(100) NOT NULL,
  `subscribed_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `unsubscribed_or_expired_dtm` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_web_push_subscription`
--

LOCK TABLES `t_web_push_subscription` WRITE;
/*!40000 ALTER TABLE `t_web_push_subscription` DISABLE KEYS */;
INSERT INTO `t_web_push_subscription` VALUES (1,'https://fcm.googleapis.com/fcm/send/fPyXIz1Sics:APA91bHxUDOTegKvpS5EpbG5-2-zyeKoJtd_GnWoe3s9KnueDeBogrSmPPv6o7XRZy3pCtupbpjUVlcvngnFWEra1f9mY0q6f5RH3n7AkFYf8IDjmuBgufzcnCroIlcb4quneIqS0FqP','BPHuI-JEG2KCvT8xm1nuw1Urz9dNlMrDISWh1hvcuwbniou5iplBXE0aQXtapSFfmN_F2TyjBL8uVNgFVZtVLP4','FuqWYxSp_dn2Hk5sfefAfA','2025-01-04 08:22:14',NULL),(2,'https://fcm.googleapis.com/fcm/send/fPyXIz1Sics:APA91bHxUDOTegKvpS5EpbG5-2-zyeKoJtd_GnWoe3s9KnueDeBogrSmPPv6o7XRZy3pCtupbpjUVlcvngnFWEra1f9mY0q6f5RH3n7AkFYf8IDjmuBgufzcnCroIlcb4quneIqS0FqP','BPHuI-JEG2KCvT8xm1nuw1Urz9dNlMrDISWh1hvcuwbniou5iplBXE0aQXtapSFfmN_F2TyjBL8uVNgFVZtVLP4','FuqWYxSp_dn2Hk5sfefAfA','2025-01-04 08:22:21',NULL),(3,'https://fcm.googleapis.com/fcm/send/fPyXIz1Sics:APA91bHxUDOTegKvpS5EpbG5-2-zyeKoJtd_GnWoe3s9KnueDeBogrSmPPv6o7XRZy3pCtupbpjUVlcvngnFWEra1f9mY0q6f5RH3n7AkFYf8IDjmuBgufzcnCroIlcb4quneIqS0FqP','BPHuI-JEG2KCvT8xm1nuw1Urz9dNlMrDISWh1hvcuwbniou5iplBXE0aQXtapSFfmN_F2TyjBL8uVNgFVZtVLP4','FuqWYxSp_dn2Hk5sfefAfA','2025-01-04 08:25:25',NULL),(4,'https://fcm.googleapis.com/fcm/send/fPyXIz1Sics:APA91bHxUDOTegKvpS5EpbG5-2-zyeKoJtd_GnWoe3s9KnueDeBogrSmPPv6o7XRZy3pCtupbpjUVlcvngnFWEra1f9mY0q6f5RH3n7AkFYf8IDjmuBgufzcnCroIlcb4quneIqS0FqP','BPHuI-JEG2KCvT8xm1nuw1Urz9dNlMrDISWh1hvcuwbniou5iplBXE0aQXtapSFfmN_F2TyjBL8uVNgFVZtVLP4','FuqWYxSp_dn2Hk5sfefAfA','2025-01-04 08:25:37',NULL);
/*!40000 ALTER TABLE `t_web_push_subscription` ENABLE KEYS */;
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
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_dtm` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'Enable pausing tasks','','2025-01-03 12:09:58','2025-01-03 12:15:07','2025-01-03 12:16:48',NULL,'2025-01-03 11:58:37','2025-01-03 12:16:48'),(2,'Disable Save button once clicked','Disable the save button on both AddItem and AddNote once it is clicked.','2025-01-26 08:28:49',NULL,'2025-01-26 08:28:51',NULL,'2025-01-03 11:59:36','2025-01-26 08:28:51'),(3,'Create a Venn Diagram to show filters','Create some kind of Venn-Diagram like display to show the affect of the selected state filters to the user.',NULL,NULL,NULL,NULL,'2025-01-03 12:01:36',NULL),(4,'Make sure the life_helper database is backed up','Make sure the life_helper database is backed up regularly',NULL,NULL,NULL,NULL,'2025-01-03 12:11:12',NULL),(5,'Document the data route structure','Add a section to the express server documentation documenting the data routes. After I have done this I should standardize their structure.','2025-01-16 10:10:12',NULL,'2025-01-16 10:10:14',NULL,'2025-01-03 12:13:46','2025-01-16 10:10:14'),(6,'When a task is paused italicize it','I may decide on another indicator later down the line','2025-01-15 09:01:40',NULL,'2025-01-16 16:45:27',NULL,'2025-01-03 12:16:35','2025-01-16 16:45:27'),(7,'When a task is started pause all other tasks','When a task is started pause the currently started but un-paused task if one exists. Note, there should only ever bee one such task.',NULL,NULL,NULL,'2025-01-16 10:12:56','2025-01-03 12:18:26','2025-01-16 10:12:56'),(8,'create a login mechanism','','2025-01-03 12:26:08',NULL,'2025-01-30 17:30:35',NULL,'2025-01-03 12:18:45','2025-01-30 17:30:35'),(9,'Allow links to be put in descriptions and notes','',NULL,NULL,NULL,NULL,'2025-01-03 12:26:02',NULL),(10,'some task.','and it\'s description','2025-01-03 15:57:18','2025-01-03 16:06:11',NULL,'2025-01-03 16:10:28','2025-01-03 15:51:17','2025-01-03 16:10:28'),(11,'Another task to start','','2025-01-03 16:09:03',NULL,'2025-01-03 16:09:31',NULL,'2025-01-03 16:09:00','2025-01-03 16:09:31'),(12,'Don\'t allow logically orphaned items.','If a goal has tasks that are not all canceled than don\'t allow the goal to be cancelled. Likewise, if an objective has goals that are not all canceled than don\'t allow the objective to be cancelled.\n\n',NULL,NULL,NULL,NULL,'2025-01-03 16:24:05',NULL),(13,'Service Worker Enhancement #1','Do not request a web push subscription once one has been obtained.','2025-02-05 09:12:50',NULL,'2025-02-05 09:12:56',NULL,'2025-01-04 08:42:18','2025-02-05 09:12:56'),(14,'Scaffold this app','Start with a bare bone VITE scaffolding using TypeScript and SolidJS.',NULL,NULL,NULL,NULL,'2025-01-08 07:39:34',NULL),(15,'Use this TypeScript advice','See this site, https://dev.to/fkrasnowski/simple-kv-storage-on-top-of-indexeddb-3jcg to assist in building the promise based solution.',NULL,NULL,NULL,NULL,'2025-01-08 07:40:22',NULL),(16,'Verify Cascading Triggers Statement','Ensure that the claim I made in the task trigger about cascading triggers is true. If not, remove that statement from the code and consider using them.','2025-01-16 10:11:45',NULL,'2025-01-16 10:11:46',NULL,'2025-01-15 08:55:46','2025-01-16 10:11:46'),(17,'When a task is completed un-pause it','','2025-01-15 09:15:16',NULL,'2025-01-16 16:44:35',NULL,'2025-01-15 09:04:18','2025-01-16 16:44:35'),(18,'Create a test for the task trigger','Create a test to ensure the task trigger works properly.','2025-01-15 09:26:11',NULL,'2025-01-15 16:18:26',NULL,'2025-01-15 09:23:20','2025-01-15 16:18:26'),(19,'Ensure that the task trigger works properly','Currently the task trigger does not directly use the task_id of the task that was started or completed to effect the data. This should not be the case...it should definitely restrict its affects to only those goals and objectives associated with the specific task that was started or created.','2025-01-15 09:25:56',NULL,'2025-01-17 14:41:14',NULL,'2025-01-15 09:25:32','2025-01-17 14:41:14'),(20,'Create \"attach\" route','The \"attach\" route is the route that the application uses to attach an existing goal to an objective or an existing task to a goal.','2025-01-15 13:43:33',NULL,'2025-01-21 11:45:30',NULL,'2025-01-15 13:40:41','2025-01-21 11:45:30'),(21,'Add the \"attach\" capability to the application.','Enhance Life Helper to allow an existing goal to be attached to an objective or an existing task to be attached to a goal.',NULL,NULL,NULL,NULL,'2025-01-15 13:43:27',NULL),(22,'Create test 2 for the task trigger','Model this test after test 1 but as relates to propagating the completed status.','2025-01-15 16:19:37',NULL,'2025-01-16 10:09:52',NULL,'2025-01-15 16:19:27','2025-01-16 10:09:52'),(23,'Remove use of temp tables from triggers','Remove the use of temp tables from the task update and the goal update triggers.','2025-01-15 16:20:26',NULL,'2025-01-15 16:46:34',NULL,'2025-01-15 16:20:20','2025-01-15 16:46:34'),(24,'Enable un-pausing a task','','2025-01-16 16:50:00',NULL,'2025-01-16 16:50:01',NULL,'2025-01-16 10:12:44','2025-01-16 16:50:01'),(25,'When a task is started pause all other user tasks ','When a task is started pause all other tasks associated with that user. ',NULL,NULL,NULL,NULL,'2025-01-16 10:13:48',NULL),(26,'Service Worker Enhancement #2','Make sure that an given web push only happens once. I am suspicious that this may not be the case.',NULL,NULL,NULL,NULL,'2025-01-16 11:21:31','2025-01-16 11:23:43'),(27,'Complete \"Web Authentication APIs\" Tutorial','','2025-01-19 07:11:36','2025-02-07 15:57:30',NULL,NULL,'2025-01-19 07:10:49','2025-02-07 15:57:30'),(28,'Integrate this functionality into Life Helper','',NULL,NULL,NULL,NULL,'2025-01-19 07:11:32',NULL),(29,'Add a foreign key to task_note','Add a foreign key references from task_note to task and from task_note to note.','2025-01-20 08:38:57',NULL,'2025-01-20 08:55:23',NULL,'2025-01-19 08:27:45','2025-01-20 08:55:23'),(30,'Create a run date store','Create a run date store and use it to enforce the one-run-per-day rule.',NULL,NULL,NULL,NULL,'2025-01-19 10:39:53',NULL),(31,'test task to use','','2025-01-29 07:27:21',NULL,'2025-01-29 07:27:34',NULL,'2025-01-29 07:27:17','2025-01-29 07:27:34'),(32,'Implement CSS nesting ','See forms.css for an example of CSS nesting with the fieldset.','2025-01-31 08:26:08','2025-01-31 08:26:10',NULL,NULL,'2025-01-29 07:38:05','2025-01-31 08:26:10'),(33,'Watch this video','https://www.youtube.com/watch?v=mC76YxBpwAQ',NULL,NULL,NULL,NULL,'2025-01-30 09:42:47',NULL),(34,'Return to this tutorial after watching the video','The video in task 33','2025-01-30 09:43:34','2025-01-30 09:43:36',NULL,NULL,'2025-01-30 09:43:21','2025-01-30 09:43:36'),(35,'Add phone number to sign up','',NULL,NULL,NULL,'2025-01-31 14:08:04','2025-01-30 15:28:55','2025-01-31 14:08:04'),(36,'Create a logout mechanism','','2025-01-30 17:30:28',NULL,'2025-01-30 17:30:39',NULL,'2025-01-30 15:43:49','2025-01-30 17:30:39'),(37,'Ensure the password manager works','Make sure the chrome password manager stores the user name and password during registration. ',NULL,NULL,NULL,NULL,'2025-01-31 08:25:56',NULL),(38,'Create an action button component','This component should ensure that the button cannot be clicked a second time without completing the activity launched by the first click. ','2025-01-31 08:28:47','2025-01-31 11:02:13',NULL,'2025-01-31 12:48:27','2025-01-31 08:28:41','2025-01-31 12:48:27'),(39,'Deploy the data server as a service','Create a way to launch the server outside of VSCode.','2025-01-31 09:35:49',NULL,'2025-01-31 09:35:51',NULL,'2025-01-31 09:31:40','2025-01-31 09:35:51'),(40,'Organize the code','Create folders in the src directory to better organize the code. Start with a CSS directory. ','2025-01-31 11:02:06',NULL,'2025-01-31 12:55:14',NULL,'2025-01-31 11:02:01','2025-01-31 12:55:14'),(41,'Make the login button the default button','',NULL,NULL,NULL,NULL,'2025-01-31 11:19:29',NULL),(42,'Add email address to user information','','2025-02-03 09:33:57',NULL,'2025-02-04 15:32:30',NULL,'2025-01-31 14:08:20','2025-02-04 15:32:30'),(43,'Provide a way to rank items','','2025-02-01 10:06:40',NULL,NULL,'2025-02-03 08:33:29','2025-01-31 14:24:50','2025-02-03 08:33:29'),(44,'Create a strategy for database migration','Create a strategy for database migration that ensures that there are always two databases that are in sync after the migration is successful.',NULL,NULL,NULL,NULL,'2025-01-31 15:48:16',NULL),(45,'Create a strategy to test the migration scripts','I believe this strategy is partly in place. The strategy should be to run the create_schema.sh script in the t_life_helper database and then compare it to the production life_helper schema. ',NULL,NULL,NULL,NULL,'2025-01-31 16:27:13',NULL),(46,'Reconcile Banking for January','','2025-02-01 15:21:51',NULL,'2025-02-01 16:09:53',NULL,'2025-02-01 07:27:05','2025-02-01 16:09:53'),(47,'Create February cash workbook','',NULL,NULL,NULL,'2025-02-02 08:12:32','2025-02-01 07:28:47','2025-02-02 08:12:32'),(48,'Reconcile January cash workbook to 2025 workbook','','2025-02-01 16:29:32',NULL,'2025-02-01 16:29:34',NULL,'2025-02-01 07:29:18','2025-02-01 16:29:34'),(49,'Freedom VISA receipts','','2025-02-01 15:21:43',NULL,'2025-02-01 15:21:44',NULL,'2025-02-01 10:06:24','2025-02-01 15:21:44'),(50,'Do it all.','','2025-02-01 11:32:34',NULL,'2025-02-01 11:32:35',NULL,'2025-02-01 11:32:31','2025-02-01 11:32:35'),(51,'Purchase and cook chicken','','2025-02-02 08:11:55',NULL,'2025-02-02 08:11:56',NULL,'2025-02-01 16:09:10','2025-02-02 08:11:56'),(52,'Determine what is needed for chicken soup','','2025-02-01 16:30:46',NULL,'2025-02-01 16:30:48',NULL,'2025-02-01 16:09:37','2025-02-01 16:30:48'),(53,'Make chicken soup','',NULL,NULL,NULL,'2025-02-02 08:13:01','2025-02-01 16:09:46','2025-02-02 08:13:01'),(54,'Reconcile January cash workbook to Quicken','','2025-02-01 16:10:37',NULL,'2025-02-01 16:16:40',NULL,'2025-02-01 16:10:31','2025-02-01 16:16:40'),(55,'Go through email','',NULL,NULL,NULL,'2025-02-02 08:12:45','2025-02-02 08:11:26','2025-02-02 08:12:45'),(56,'Go through email','','2025-02-02 13:18:53',NULL,'2025-02-02 13:18:54',NULL,'2025-02-02 08:14:27','2025-02-02 13:18:54'),(57,'Make chicken soup','','2025-02-02 13:18:48',NULL,'2025-02-02 13:18:49',NULL,'2025-02-02 08:14:47','2025-02-02 13:18:49'),(58,'Create February cash workbook','','2025-02-03 13:12:22',NULL,'2025-02-03 13:12:23',NULL,'2025-02-02 08:15:01','2025-02-03 13:12:23'),(59,'Allow the user to create a random list of tasks.','Allow the user to create a random list of tasks that act as a schedule of activities.',NULL,NULL,NULL,'2025-02-03 09:34:38','2025-02-02 10:09:17','2025-02-03 09:34:38'),(60,'Make time for reading','',NULL,NULL,NULL,'2025-02-03 13:12:29','2025-02-02 10:17:35','2025-02-03 13:12:29'),(61,'Add Full stack to the resume','',NULL,NULL,NULL,NULL,'2025-02-02 10:39:50',NULL),(62,'Allow the user to create a work queue of tasks','Provide a mechanism to allow a user to identify tasks to be added to a work queue such as a context menu with an \"add to work queue\" option to select. This mechanism must work equally well on a laptop or a mobile device.','2025-02-03 08:36:23',NULL,NULL,'2025-02-03 08:38:20','2025-02-03 08:36:15','2025-02-03 08:38:20'),(63,'Add an \"assigned to me\" checkbox to the filters','When checked the user will only see tasks in the current context that are assigned to them','2025-02-03 08:45:31','2025-02-03 09:02:15',NULL,NULL,'2025-02-03 08:45:28','2025-02-03 09:02:15'),(64,'When navigating around site remember the list.','When a user navigates away from the list remember where they were and return them there.','2025-02-03 08:46:58','2025-02-03 08:46:59',NULL,NULL,'2025-02-03 08:46:48','2025-02-03 08:46:59'),(65,'Associate a user with a started task','','2025-02-03 09:02:02','2025-02-03 09:58:11',NULL,NULL,'2025-02-03 09:01:58','2025-02-03 09:58:11'),(66,'Create a log of the time a use worked on tasks','See the README Enhancements->Associate users with tasks description for the implementation details.','2025-02-03 09:56:10','2025-02-05 09:23:37',NULL,NULL,'2025-02-03 09:56:05','2025-02-05 09:23:37'),(67,'Change deleted_dtm column name in task','Change deleted_dtm column name in task to canceled_deleted_dtm','2025-02-03 09:58:04',NULL,NULL,'2025-02-03 10:03:00','2025-02-03 09:57:56','2025-02-03 10:03:00'),(68,'Make time for reading','','2025-02-06 08:24:14',NULL,'2025-02-06 08:24:15',NULL,'2025-02-03 13:13:18','2025-02-06 08:24:15'),(69,'Navigate to Home after logging in','',NULL,NULL,NULL,NULL,'2025-02-03 16:44:34',NULL),(70,'Add a confirm email step to registration','',NULL,NULL,NULL,NULL,'2025-02-03 16:53:06',NULL),(71,'Create a daily task list that is user specific','This is a list of tasks that the user can create that pop up every day to be completed and that are not associated with goals or objectives. This is just a list of tasks and can be reordered by the user using drag and drop.',NULL,NULL,NULL,NULL,'2025-02-05 08:49:06',NULL),(72,'Disable Web Push Request Button when appropriate','Disable the \"Request A Web Push Subscription\" button if the service worker sends a message that it has been activated.','2025-02-05 09:10:10',NULL,'2025-02-05 09:10:13',NULL,'2025-02-05 09:10:06','2025-02-05 09:10:13'),(73,'Search Capability to find keywords','Add a search capability to find keywords in various textual data in the database and return a list of items that qualify.',NULL,NULL,NULL,NULL,'2025-02-05 09:18:37',NULL),(74,'Implement auto login using Credential Mgmt API','','2025-02-05 09:23:30','2025-02-06 10:43:00',NULL,'2025-02-06 20:14:44','2025-02-05 09:23:25','2025-02-06 20:14:44'),(75,'Make time for reading','','2025-02-06 20:12:26',NULL,'2025-02-06 20:12:28',NULL,'2025-02-06 08:24:58','2025-02-06 20:12:28'),(76,'Do reminders','','2025-02-06 08:29:28',NULL,'2025-02-06 10:23:47',NULL,'2025-02-06 08:25:12','2025-02-06 10:23:47'),(77,'Review Alex\'s essay...see email','','2025-02-06 10:23:41',NULL,'2025-02-06 10:23:42',NULL,'2025-02-06 08:29:19','2025-02-06 10:23:42'),(78,'wrap console.log with a time stamping mechanism','','2025-02-06 10:26:42',NULL,'2025-02-06 12:06:21',NULL,'2025-02-06 10:26:27','2025-02-06 12:06:21'),(79,'test starting a task for web push reasons','','2025-02-06 11:21:09',NULL,NULL,'2025-02-06 11:21:36','2025-02-06 11:21:02','2025-02-06 11:21:36'),(80,'test for seeing what the service worker is sending','','2025-02-06 11:24:38',NULL,NULL,'2025-02-06 11:27:35','2025-02-06 11:24:02','2025-02-06 11:27:35'),(81,'test seeing what service worker is sending','','2025-02-06 11:27:54',NULL,NULL,'2025-02-06 11:28:27','2025-02-06 11:27:51','2025-02-06 11:28:27'),(82,'test seeing what service worker is sending','','2025-02-06 11:29:44',NULL,NULL,'2025-02-06 11:33:16','2025-02-06 11:29:41','2025-02-06 11:33:16'),(83,'test seeing what service worker is sending','','2025-02-06 11:33:45',NULL,NULL,'2025-02-06 11:34:47','2025-02-06 11:33:23','2025-02-06 11:34:47'),(84,'Implement Federated Login','','2025-02-07 15:58:17','2025-02-07 15:58:18',NULL,NULL,'2025-02-07 15:58:05','2025-02-07 15:58:18'),(85,'Explore need for diff and missing sql in bootstrap','I don\'t think the diff and missing sql scripts in bootstrap are necessary, the MySQL comparison tools should be sufficient.','2025-02-08 10:44:42',NULL,NULL,NULL,'2025-02-08 10:44:30','2025-02-08 10:44:42');
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
		-- A task has been started. If there are any goals for which 
        -- this is the first of their tasks to be started then
        -- the goal should be marked as started.
        -- Apply the same logic to the relationship between goals and objectives
        -- in the trigger trigger_goal_update.

		Insert into trigger_log (statement) select "In the started IF";
        
		Create temporary table trigger_task_update_temp select g.goal_id from goal_task gt
        inner join goal g on gt.goal_id = g.goal_id
		where gt.task_id = OLD.task_id
        and g.started_dtm Is Null;
        
		update goal set started_dtm = now() where goal_id in (select goal_id from trigger_task_update_temp);
        
		drop temporary table if exists trigger_task_update_temp;
    END IF;
    IF OLD.completed_dtm is null AND NEW.completed_dtm is not null THEN
		-- A task has been completed. If there are no other open tasks
        -- associated with any of the goals it applies to
        -- then each of those goals should be completed.
        -- Apply the same logic to the relationship between goals and objectives
        -- in the trigger trigger_goal_update.
        
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
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
INSERT INTO `task_note` VALUES (4,30,NULL,'2025-01-31 08:27:04'),(5,2,NULL,'2025-01-03 12:14:51'),(7,4,NULL,'2025-01-03 12:22:54'),(8,3,NULL,'2025-01-03 12:19:14'),(8,5,NULL,'2025-01-03 12:25:32'),(8,6,NULL,'2025-01-03 12:26:30'),(8,15,NULL,'2025-01-19 10:56:27'),(8,18,NULL,'2025-01-26 07:32:14'),(8,28,NULL,'2025-01-30 12:54:21'),(8,29,NULL,'2025-01-30 15:31:24'),(16,13,NULL,'2025-01-16 10:11:43'),(17,8,NULL,'2025-01-15 09:04:46'),(18,11,NULL,'2025-01-15 16:17:35'),(20,9,NULL,'2025-01-15 13:41:15'),(20,10,NULL,'2025-01-15 13:42:18'),(23,12,NULL,'2025-01-15 16:46:32'),(29,16,NULL,'2025-01-20 08:42:06'),(29,17,NULL,'2025-01-20 08:53:29'),(38,32,NULL,'2025-01-31 12:48:22'),(39,31,NULL,'2025-01-31 09:35:47'),(43,33,NULL,'2025-02-01 08:08:14'),(43,34,NULL,'2025-02-01 13:33:30'),(43,35,NULL,'2025-02-03 08:30:45'),(43,36,NULL,'2025-02-03 08:33:23'),(63,37,NULL,'2025-02-03 09:02:48'),(74,38,NULL,'2025-02-06 20:14:41');
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
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`trigger_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_log`
--

LOCK TABLES `trigger_log` WRITE;
/*!40000 ALTER TABLE `trigger_log` DISABLE KEYS */;
INSERT INTO `trigger_log` VALUES (1,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-03 11:58:53'),(2,'In the started IF',NULL,NULL,'2025-01-03 11:58:53'),(3,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-03 12:05:33'),(4,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-03 12:09:58'),(5,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-03 12:15:07'),(6,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-03 12:16:48'),(7,'In the completed IF',NULL,NULL,'2025-01-03 12:16:48'),(8,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-03 12:26:08'),(9,'In the started IF',NULL,NULL,'2025-01-03 12:26:08'),(10,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-03 15:57:18'),(11,'In the started IF',NULL,NULL,'2025-01-03 15:57:18'),(12,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-03 16:06:11'),(13,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-03 16:09:03'),(14,'In the started IF',NULL,NULL,'2025-01-03 16:09:03'),(15,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-03 16:09:31'),(16,'In the completed IF',NULL,NULL,'2025-01-03 16:09:31'),(17,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-03 16:10:28'),(18,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 08:56:22'),(19,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 09:01:40'),(20,'In the started IF',NULL,NULL,'2025-01-15 09:01:40'),(21,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 09:03:26'),(22,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 09:03:33'),(23,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 09:15:16'),(24,'In the started IF',NULL,NULL,'2025-01-15 09:15:16'),(25,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 09:25:56'),(26,'In the started IF',NULL,NULL,'2025-01-15 09:25:56'),(27,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 09:25:58'),(28,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 09:26:11'),(29,'In the started IF',NULL,NULL,'2025-01-15 09:26:11'),(30,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 09:26:19'),(31,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 13:43:33'),(32,'In the started IF',NULL,NULL,'2025-01-15 13:43:33'),(33,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 16:18:26'),(34,'In the completed IF',NULL,NULL,'2025-01-15 16:18:26'),(35,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 16:19:37'),(36,'In the started IF',NULL,NULL,'2025-01-15 16:19:37'),(37,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 16:20:26'),(38,'In the started IF',NULL,NULL,'2025-01-15 16:20:26'),(39,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-15 16:46:34'),(40,'In the completed IF',NULL,NULL,'2025-01-15 16:46:34'),(41,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 10:09:52'),(42,'In the completed IF',NULL,NULL,'2025-01-16 10:09:52'),(43,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 10:10:12'),(44,'In the started IF',NULL,NULL,'2025-01-16 10:10:12'),(45,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 10:10:14'),(46,'In the completed IF',NULL,NULL,'2025-01-16 10:10:14'),(47,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 10:11:45'),(48,'In the started IF',NULL,NULL,'2025-01-16 10:11:45'),(49,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 10:11:46'),(50,'In the completed IF',NULL,NULL,'2025-01-16 10:11:46'),(51,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 10:12:02'),(52,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 10:12:56'),(53,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 11:23:43'),(55,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 16:44:35'),(56,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 16:44:35'),(57,'In the completed IF',NULL,NULL,'2025-01-16 16:44:35'),(58,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 16:45:27'),(59,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 16:45:27'),(60,'In the completed IF',NULL,NULL,'2025-01-16 16:45:27'),(61,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 16:49:46'),(62,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 16:49:48'),(63,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 16:49:49'),(64,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 16:49:56'),(65,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 16:50:00'),(66,'In the started IF',NULL,NULL,'2025-01-16 16:50:00'),(67,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 16:50:01'),(68,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 16:50:01'),(69,'In the completed IF',NULL,NULL,'2025-01-16 16:50:01'),(70,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 19:31:17'),(71,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-16 19:31:18'),(72,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-17 14:41:14'),(73,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-17 14:41:14'),(74,'In the completed IF',NULL,NULL,'2025-01-17 14:41:14'),(75,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-19 07:11:36'),(76,'In the started IF',NULL,NULL,'2025-01-19 07:11:36'),(77,'In the trigger, trigger_goal_update',NULL,NULL,'2025-01-19 07:11:36'),(78,'In the started IF',NULL,NULL,'2025-01-19 07:11:36'),(79,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-19 10:56:40'),(80,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-19 10:56:43'),(81,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-19 14:35:57'),(82,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-19 14:35:58'),(83,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-19 16:24:23'),(84,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-19 16:24:24'),(85,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-19 16:24:25'),(86,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-19 16:24:28'),(87,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-19 16:24:31'),(88,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-19 16:24:32'),(89,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-19 16:25:35'),(90,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-20 08:38:57'),(91,'In the started IF',NULL,NULL,'2025-01-20 08:38:57'),(92,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-20 08:55:23'),(93,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-20 08:55:23'),(94,'In the completed IF',NULL,NULL,'2025-01-20 08:55:23'),(95,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-20 08:55:31'),(96,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-21 11:45:25'),(97,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-21 11:45:26'),(98,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-21 11:45:27'),(99,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-21 11:45:28'),(100,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-21 11:45:29'),(101,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-21 11:45:30'),(102,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-21 11:45:30'),(103,'In the completed IF',NULL,NULL,'2025-01-21 11:45:30'),(104,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-26 08:28:49'),(105,'In the started IF',NULL,NULL,'2025-01-26 08:28:49'),(106,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-26 08:28:51'),(107,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-26 08:28:51'),(108,'In the completed IF',NULL,NULL,'2025-01-26 08:28:51'),(109,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-29 07:27:21'),(110,'In the started IF',NULL,NULL,'2025-01-29 07:27:21'),(111,'In the trigger, trigger_goal_update',NULL,NULL,'2025-01-29 07:27:21'),(112,'In the started IF',NULL,NULL,'2025-01-29 07:27:21'),(113,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-29 07:27:24'),(114,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-29 07:27:25'),(115,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-29 07:27:34'),(116,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-29 07:27:34'),(117,'In the completed IF',NULL,NULL,'2025-01-29 07:27:34'),(118,'In the trigger, trigger_goal_update',NULL,NULL,'2025-01-29 07:27:34'),(119,'In the completed IF',NULL,NULL,'2025-01-29 07:27:34'),(120,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-30 09:43:34'),(121,'In the started IF',NULL,NULL,'2025-01-30 09:43:34'),(122,'In the trigger, trigger_goal_update',NULL,NULL,'2025-01-30 09:43:34'),(123,'In the started IF',NULL,NULL,'2025-01-30 09:43:34'),(124,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-30 09:43:36'),(125,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-30 12:38:35'),(126,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-30 12:38:36'),(127,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-30 17:30:28'),(128,'In the started IF',NULL,NULL,'2025-01-30 17:30:28'),(129,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-30 17:30:35'),(130,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-30 17:30:35'),(131,'In the completed IF',NULL,NULL,'2025-01-30 17:30:35'),(132,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-30 17:30:39'),(133,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-30 17:30:39'),(134,'In the completed IF',NULL,NULL,'2025-01-30 17:30:39'),(135,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-31 08:26:08'),(136,'In the started IF',NULL,NULL,'2025-01-31 08:26:08'),(137,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-31 08:26:10'),(138,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-31 08:28:47'),(139,'In the started IF',NULL,NULL,'2025-01-31 08:28:47'),(140,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-31 09:35:49'),(141,'In the started IF',NULL,NULL,'2025-01-31 09:35:49'),(142,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-31 09:35:51'),(143,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-31 09:35:51'),(144,'In the completed IF',NULL,NULL,'2025-01-31 09:35:51'),(145,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-31 11:02:06'),(146,'In the started IF',NULL,NULL,'2025-01-31 11:02:06'),(147,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-31 11:02:13'),(148,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-31 12:48:27'),(149,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-31 12:55:14'),(150,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-31 12:55:14'),(151,'In the completed IF',NULL,NULL,'2025-01-31 12:55:14'),(152,'In the trigger, trigger_task_update',NULL,NULL,'2025-01-31 14:08:04'),(153,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-01 10:06:40'),(154,'In the started IF',NULL,NULL,'2025-02-01 10:06:40'),(155,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-01 11:32:34'),(156,'In the started IF',NULL,NULL,'2025-02-01 11:32:34'),(157,'In the trigger, trigger_goal_update',NULL,NULL,'2025-02-01 11:32:34'),(158,'In the started IF',NULL,NULL,'2025-02-01 11:32:34'),(159,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-01 11:32:35'),(160,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-01 11:32:35'),(161,'In the completed IF',NULL,NULL,'2025-02-01 11:32:35'),(162,'In the trigger, trigger_goal_update',NULL,NULL,'2025-02-01 11:32:35'),(163,'In the completed IF',NULL,NULL,'2025-02-01 11:32:35'),(164,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-01 15:21:43'),(165,'In the started IF',NULL,NULL,'2025-02-01 15:21:43'),(166,'In the trigger, trigger_goal_update',NULL,NULL,'2025-02-01 15:21:43'),(167,'In the started IF',NULL,NULL,'2025-02-01 15:21:43'),(168,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-01 15:21:44'),(169,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-01 15:21:44'),(170,'In the completed IF',NULL,NULL,'2025-02-01 15:21:44'),(171,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-01 15:21:51'),(172,'In the started IF',NULL,NULL,'2025-02-01 15:21:51'),(173,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-01 16:09:53'),(174,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-01 16:09:53'),(175,'In the completed IF',NULL,NULL,'2025-02-01 16:09:53'),(176,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-01 16:10:37'),(177,'In the started IF',NULL,NULL,'2025-02-01 16:10:37'),(178,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-01 16:16:40'),(179,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-01 16:16:40'),(180,'In the completed IF',NULL,NULL,'2025-02-01 16:16:40'),(181,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-01 16:29:32'),(182,'In the started IF',NULL,NULL,'2025-02-01 16:29:32'),(183,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-01 16:29:34'),(184,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-01 16:29:34'),(185,'In the completed IF',NULL,NULL,'2025-02-01 16:29:34'),(186,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-01 16:30:46'),(187,'In the started IF',NULL,NULL,'2025-02-01 16:30:46'),(188,'In the trigger, trigger_goal_update',NULL,NULL,'2025-02-01 16:30:46'),(189,'In the started IF',NULL,NULL,'2025-02-01 16:30:46'),(190,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-01 16:30:48'),(191,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-01 16:30:48'),(192,'In the completed IF',NULL,NULL,'2025-02-01 16:30:48'),(193,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-02 08:11:55'),(194,'In the started IF',NULL,NULL,'2025-02-02 08:11:55'),(195,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-02 08:11:56'),(196,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-02 08:11:56'),(197,'In the completed IF',NULL,NULL,'2025-02-02 08:11:56'),(198,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-02 08:12:32'),(199,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-02 08:12:45'),(200,'In the trigger, trigger_goal_update',NULL,NULL,'2025-02-02 08:12:52'),(201,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-02 08:13:01'),(202,'In the trigger, trigger_goal_update',NULL,NULL,'2025-02-02 08:13:08'),(203,'In the trigger, trigger_goal_update',NULL,NULL,'2025-02-02 08:13:37'),(204,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-02 13:18:48'),(205,'In the started IF',NULL,NULL,'2025-02-02 13:18:48'),(206,'In the trigger, trigger_goal_update',NULL,NULL,'2025-02-02 13:18:48'),(207,'In the started IF',NULL,NULL,'2025-02-02 13:18:48'),(208,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-02 13:18:49'),(209,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-02 13:18:49'),(210,'In the completed IF',NULL,NULL,'2025-02-02 13:18:49'),(211,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-02 13:18:53'),(212,'In the started IF',NULL,NULL,'2025-02-02 13:18:53'),(213,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-02 13:18:54'),(214,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-02 13:18:54'),(215,'In the completed IF',NULL,NULL,'2025-02-02 13:18:54'),(216,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-03 08:33:29'),(217,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-03 08:36:23'),(218,'In the started IF',NULL,NULL,'2025-02-03 08:36:23'),(219,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-03 08:38:20'),(220,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-03 08:45:31'),(221,'In the started IF',NULL,NULL,'2025-02-03 08:45:31'),(222,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-03 08:46:58'),(223,'In the started IF',NULL,NULL,'2025-02-03 08:46:58'),(224,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-03 08:46:59'),(225,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-03 09:02:02'),(226,'In the started IF',NULL,NULL,'2025-02-03 09:02:02'),(227,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-03 09:02:15'),(228,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-03 09:33:57'),(229,'In the started IF',NULL,NULL,'2025-02-03 09:33:57'),(230,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-03 09:34:01'),(231,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-03 09:34:38'),(232,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-03 09:56:10'),(233,'In the started IF',NULL,NULL,'2025-02-03 09:56:10'),(234,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-03 09:58:04'),(235,'In the started IF',NULL,NULL,'2025-02-03 09:58:04'),(236,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-03 09:58:11'),(237,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-03 10:03:00'),(238,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-03 13:12:22'),(239,'In the started IF',NULL,NULL,'2025-02-03 13:12:22'),(240,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-03 13:12:23'),(241,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-03 13:12:23'),(242,'In the completed IF',NULL,NULL,'2025-02-03 13:12:23'),(243,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-03 13:12:29'),(244,'In the trigger, trigger_goal_update',NULL,NULL,'2025-02-03 13:12:38'),(245,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-04 15:32:30'),(246,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-04 15:32:30'),(247,'In the completed IF',NULL,NULL,'2025-02-04 15:32:30'),(248,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-05 09:10:10'),(249,'In the started IF',NULL,NULL,'2025-02-05 09:10:10'),(250,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-05 09:10:13'),(251,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-05 09:10:13'),(252,'In the completed IF',NULL,NULL,'2025-02-05 09:10:13'),(253,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-05 09:12:50'),(254,'In the started IF',NULL,NULL,'2025-02-05 09:12:50'),(255,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-05 09:12:56'),(256,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-05 09:12:56'),(257,'In the completed IF',NULL,NULL,'2025-02-05 09:12:56'),(258,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-05 09:23:30'),(259,'In the started IF',NULL,NULL,'2025-02-05 09:23:30'),(260,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-05 09:23:37'),(261,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 08:24:14'),(262,'In the started IF',NULL,NULL,'2025-02-06 08:24:14'),(263,'In the trigger, trigger_goal_update',NULL,NULL,'2025-02-06 08:24:14'),(264,'In the started IF',NULL,NULL,'2025-02-06 08:24:14'),(265,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 08:24:15'),(266,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 08:24:15'),(267,'In the completed IF',NULL,NULL,'2025-02-06 08:24:15'),(268,'In the trigger, trigger_goal_update',NULL,NULL,'2025-02-06 08:24:15'),(269,'In the completed IF',NULL,NULL,'2025-02-06 08:24:15'),(270,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 08:29:28'),(271,'In the started IF',NULL,NULL,'2025-02-06 08:29:28'),(272,'In the trigger, trigger_goal_update',NULL,NULL,'2025-02-06 08:29:28'),(273,'In the started IF',NULL,NULL,'2025-02-06 08:29:28'),(274,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 10:23:41'),(275,'In the started IF',NULL,NULL,'2025-02-06 10:23:41'),(276,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 10:23:42'),(277,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 10:23:42'),(278,'In the completed IF',NULL,NULL,'2025-02-06 10:23:42'),(279,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 10:23:47'),(280,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 10:23:47'),(281,'In the completed IF',NULL,NULL,'2025-02-06 10:23:47'),(282,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 10:26:42'),(283,'In the started IF',NULL,NULL,'2025-02-06 10:26:42'),(284,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 10:27:02'),(285,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 10:42:56'),(286,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 10:43:00'),(287,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 11:21:09'),(288,'In the started IF',NULL,NULL,'2025-02-06 11:21:09'),(289,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 11:21:36'),(290,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 11:24:38'),(291,'In the started IF',NULL,NULL,'2025-02-06 11:24:38'),(292,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 11:27:35'),(293,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 11:27:54'),(294,'In the started IF',NULL,NULL,'2025-02-06 11:27:54'),(295,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 11:28:27'),(296,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 11:29:44'),(297,'In the started IF',NULL,NULL,'2025-02-06 11:29:44'),(298,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 11:33:16'),(299,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 11:33:45'),(300,'In the started IF',NULL,NULL,'2025-02-06 11:33:45'),(301,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 11:34:47'),(302,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 12:06:21'),(303,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 12:06:21'),(304,'In the completed IF',NULL,NULL,'2025-02-06 12:06:21'),(305,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 20:12:26'),(306,'In the started IF',NULL,NULL,'2025-02-06 20:12:26'),(307,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 20:12:28'),(308,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 20:12:28'),(309,'In the completed IF',NULL,NULL,'2025-02-06 20:12:28'),(310,'In the trigger, trigger_goal_update',NULL,NULL,'2025-02-06 20:12:28'),(311,'In the completed IF',NULL,NULL,'2025-02-06 20:12:28'),(312,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-06 20:14:44'),(313,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-07 15:57:30'),(314,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-07 15:58:17'),(315,'In the started IF',NULL,NULL,'2025-02-07 15:58:17'),(316,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-07 15:58:18'),(317,'In the trigger, trigger_task_update',NULL,NULL,'2025-02-08 10:44:42'),(318,'In the started IF',NULL,NULL,'2025-02-08 10:44:42');
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
  `create_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_dtm` datetime DEFAULT NULL,
  PRIMARY KEY (`user_login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login`
--

LOCK TABLES `user_login` WRITE;
/*!40000 ALTER TABLE `user_login` DISABLE KEYS */;
INSERT INTO `user_login` VALUES (19,'Tom.Langan@Comcast.net','$2b$10$BDsUwGu6G9/y50N3DaC8ouZpOGo8/0mJYF5cP9DHj6EhipwVw.1De','Thomas H Langan','Tom',NULL,'2025-01-28 15:20:31',NULL),(24,'Wendy.Langan@Comcast.net','$2b$10$4XaGc7wEtYncxliBLabmjO8og7vnMqz5MNDnlWCednxsi9Hjq8txy','Wendy L Langan','Wendy',NULL,'2025-02-03 16:43:35',NULL),(28,'FredTheFrog','$2b$10$ebd09GsGSMWwfu3Ac43hCeTvjMfcraibXhrvvvrmQoVIMPphLN.JK','Fred Durrs','Fred',NULL,'2025-02-04 15:21:10',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_push_subscription`
--

LOCK TABLES `web_push_subscription` WRITE;
/*!40000 ALTER TABLE `web_push_subscription` DISABLE KEYS */;
INSERT INTO `web_push_subscription` VALUES (4,'https://fcm.googleapis.com/fcm/send/fPyXIz1Sics:APA91bHxUDOTegKvpS5EpbG5-2-zyeKoJtd_GnWoe3s9KnueDeBogrSmPPv6o7XRZy3pCtupbpjUVlcvngnFWEra1f9mY0q6f5RH3n7AkFYf8IDjmuBgufzcnCroIlcb4quneIqS0FqP','BPHuI-JEG2KCvT8xm1nuw1Urz9dNlMrDISWh1hvcuwbniou5iplBXE0aQXtapSFfmN_F2TyjBL8uVNgFVZtVLP4','FuqWYxSp_dn2Hk5sfefAfA','2025-01-04 08:25:37',NULL);
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
	call p_add_objective_goal_foreign_keys();
	call p_add_goal_task_foreign_keys();
    call p_add_objective_note_foreign_keys();
    call p_add_goal_note_foreign_keys();
    call p_add_task_note_foreign_keys();
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
    set @hashed_password = JSON_UNQUOTE(JSON_EXTRACT(data, '$.password'));
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
		create_dtm datetime default current_timestamp not null,
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
		create_dtm datetime default current_timestamp not null,
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
		create_dtm datetime default current_timestamp not null,
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
		create_dtm datetime default current_timestamp not null,
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
		create_dtm datetime default current_timestamp not null,
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
		create_dtm datetime default current_timestamp not null,
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
		create_dtm datetime default current_timestamp not null,
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
		create_dtm datetime default current_timestamp not null,
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
				INSERT INTO sql_error (sql_error, stored_procedure_name, additional_information, create_dtm) values (@full_error, sp_name, CONCAT('table name: ', t_name), now());
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
		create_dtm datetime default current_timestamp not null,
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
		create_dtm datetime default current_timestamp not null,
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
        create_dtm datetime default current_timestamp not null,
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
		create_dtm datetime default current_timestamp not null,
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
    SET @SQL = CONCAT(@SQL, ' order by n.create_dtm desc');

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
		INSERT INTO sql_error (sql_error, stored_procedure_name, additional_information, create_dtm) values (@sql_error, @sp_name, @additional_information, now());
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
    insert into goal_note select * from t_objective;
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
    insert into user_login (user_login_id, user_name, hashed_password, full_name, display_name, email_address, create_dtm, deleted_dtm )
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

-- Dump completed on 2025-02-08 17:20:39
