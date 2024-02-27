-- MySQL dump 10.13  Distrib 8.2.0, for Win64 (x86_64)
--
-- Host: localhost    Database: company_constraints
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `departament`
--

DROP TABLE IF EXISTS `departament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departament` (
  `Dname` varchar(15) NOT NULL,
  `Dnumber` int NOT NULL,
  `Mgr_ssn` char(9) NOT NULL,
  `Mgr_start_date` date DEFAULT NULL,
  `Dept_create_date` date DEFAULT NULL,
  PRIMARY KEY (`Dnumber`),
  UNIQUE KEY `unique_name_dept` (`Dname`),
  KEY `fk_dept` (`Mgr_ssn`),
  KEY `Departament_Name_Idx` (`Dname`),
  CONSTRAINT `fk_dept` FOREIGN KEY (`Mgr_ssn`) REFERENCES `employee` (`Ssn`) ON UPDATE CASCADE,
  CONSTRAINT `chk_date_dept` CHECK ((`Dept_create_date` < `Mgr_start_date`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departament`
--

LOCK TABLES `departament` WRITE;
/*!40000 ALTER TABLE `departament` DISABLE KEYS */;
INSERT INTO `departament` VALUES ('Headquarters',1,'888665555','1981-06-19','1980-06-19'),('Administration',4,'987654321','1995-01-01','1994-01-01'),('Research',5,'333445555','1988-05-22','1986-05-22');
/*!40000 ALTER TABLE `departament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependent` (
  `Essn` char(9) NOT NULL,
  `Dependent_name` varchar(15) NOT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Relationship` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`Essn`,`Dependent_name`),
  CONSTRAINT `fk_dependent` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
INSERT INTO `dependent` VALUES ('123456789','Alice','F','1988-12-30','Daughter'),('123456789','Elizabeth','F','1967-05-05','Spouse'),('123456789','Michael','M','1988-01-04','Son'),('333445555','Alice','F','1986-04-05','Daughter'),('333445555','Joy','F','1958-05-03','Spouse'),('333445555','Theodore','M','1983-10-25','Son'),('987654321','Abner','M','1942-02-28','Spouse');
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_locations`
--

DROP TABLE IF EXISTS `dept_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept_locations` (
  `Dnumber` int NOT NULL,
  `Dlocation` varchar(15) NOT NULL,
  PRIMARY KEY (`Dnumber`,`Dlocation`),
  KEY `DeptLocation_Idx` (`Dlocation`),
  CONSTRAINT `fk_dept_locations` FOREIGN KEY (`Dnumber`) REFERENCES `departament` (`Dnumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_locations`
--

LOCK TABLES `dept_locations` WRITE;
/*!40000 ALTER TABLE `dept_locations` DISABLE KEYS */;
INSERT INTO `dept_locations` VALUES (5,'Bellaire'),(1,'Houston'),(5,'Houston'),(4,'Stafford'),(5,'Sugarland');
/*!40000 ALTER TABLE `dept_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Fname` varchar(15) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `Ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(9) DEFAULT NULL,
  `Dno` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`Ssn`),
  KEY `Employee_Name_Idx` (`Fname`,`Lname`),
  CONSTRAINT `chk_salary_employee` CHECK ((`Salary` > 2000.0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('John','B','Smith','123456789','1965-01-09','731-Fondren-Houston-TX','M',30000.00,'333445555',5),('Franklin','T','Wong','333445555','1955-12-08','638-Voss-Houston-TX','M',40000.00,'888665555',5),('Joyce','A','English','453453453','1972-07-31','5631-Rice-Houston-TX','F',25000.00,'333445555',5),('Ramesh','K','Narayan','666884444','1962-09-15','975-Fire-Oak-Humble-TX','M',38000.00,'333445555',5),('James','E','Borg','888665555','1937-11-10','450-Stone-Houston-TX','M',55000.00,'895761324',1),('Jennifer','S','Wallace','987654321','1941-06-20','291-Berry-Bellaire-TX','F',43000.00,'888665555',4),('Ahmad','V','Jabbar','987987987','1969-03-29','980-Dallas-Houston-TX','M',25000.00,'987654321',4);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_salary` BEFORE UPDATE ON `employee` FOR EACH ROW BEGIN
    IF NEW.Salary <> OLD.Salary THEN
        INSERT INTO salary_history (Fname, Lname, Ssn, Old_salary, New_salary, Update_date)
        VALUES (Fname, Lname, Ssn, Old.Salary, New.Salary, now());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `backup_before_delete` BEFORE DELETE ON `employee` FOR EACH ROW BEGIN
    INSERT INTO users_backup (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
    VALUES (OLD.Fname, OLD.Minit, OLD.Lname, OLD.Ssn, OLD.Bdate, OLD.Address, OLD.Sex, OLD.Salary, OLD.Super_ssn, OLD.Dno);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `employee_dependent_manager_vw`
--

DROP TABLE IF EXISTS `employee_dependent_manager_vw`;
/*!50001 DROP VIEW IF EXISTS `employee_dependent_manager_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_dependent_manager_vw` AS SELECT 
 1 AS `Employees`,
 1 AS `Ssn`,
 1 AS `Dependents`,
 1 AS `Manager`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employees_by_department`
--

DROP TABLE IF EXISTS `employees_by_department`;
/*!50001 DROP VIEW IF EXISTS `employees_by_department`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employees_by_department` AS SELECT 
 1 AS `Department`,
 1 AS `Department_Number`,
 1 AS `Employee_by_Depto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employees_by_departments`
--

DROP TABLE IF EXISTS `employees_by_departments`;
/*!50001 DROP VIEW IF EXISTS `employees_by_departments`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employees_by_departments` AS SELECT 
 1 AS `Department`,
 1 AS `Department_Number`,
 1 AS `Employee_by_Depto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `manager_by_department`
--

DROP TABLE IF EXISTS `manager_by_department`;
/*!50001 DROP VIEW IF EXISTS `manager_by_department`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `manager_by_department` AS SELECT 
 1 AS `Department`,
 1 AS `Department_Number`,
 1 AS `Manager_Ssn`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `Pname` varchar(15) NOT NULL,
  `Pnumber` int NOT NULL,
  `Plocation` varchar(15) DEFAULT NULL,
  `Dnum` int NOT NULL,
  PRIMARY KEY (`Pnumber`),
  UNIQUE KEY `unique_project` (`Pname`),
  KEY `fk_project` (`Dnum`),
  CONSTRAINT `fk_project` FOREIGN KEY (`Dnum`) REFERENCES `departament` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('ProductX',1,'Bellaire',5),('ProductY',2,'Sugarland',5),('ProductZ',3,'Houston',5),('Computerization',10,'Stafford',4),('Reorganization',20,'Houston',1),('Newbenefits',30,'Stafford',4);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `project_department_manager`
--

DROP TABLE IF EXISTS `project_department_manager`;
/*!50001 DROP VIEW IF EXISTS `project_department_manager`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `project_department_manager` AS SELECT 
 1 AS `Project`,
 1 AS `Department`,
 1 AS `Manager`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `projects_employees`
--

DROP TABLE IF EXISTS `projects_employees`;
/*!50001 DROP VIEW IF EXISTS `projects_employees`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `projects_employees` AS SELECT 
 1 AS `Project`,
 1 AS `Employees`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `salary_history`
--

DROP TABLE IF EXISTS `salary_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_history` (
  `Fname` varchar(15) DEFAULT NULL,
  `Lname` varchar(15) DEFAULT NULL,
  `Ssn` char(9) NOT NULL,
  `Old_salary` decimal(10,2) DEFAULT NULL,
  `New_salary` decimal(10,2) DEFAULT NULL,
  `Update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_history`
--

LOCK TABLES `salary_history` WRITE;
/*!40000 ALTER TABLE `salary_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_backup`
--

DROP TABLE IF EXISTS `users_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_backup` (
  `Fname` varchar(15) DEFAULT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(15) DEFAULT NULL,
  `Ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(9) DEFAULT NULL,
  `Dno` int DEFAULT NULL,
  PRIMARY KEY (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_backup`
--

LOCK TABLES `users_backup` WRITE;
/*!40000 ALTER TABLE `users_backup` DISABLE KEYS */;
INSERT INTO `users_backup` VALUES ('Alicia','J','Zelaya','999887777','1968-01-19','3321-Castle-Spring-TX','F',25000.00,'987654321',4);
/*!40000 ALTER TABLE `users_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_on` (
  `Essn` char(9) NOT NULL,
  `Pno` int NOT NULL,
  `Hours` decimal(3,1) NOT NULL,
  PRIMARY KEY (`Essn`,`Pno`),
  KEY `fk_project_works_on` (`Pno`),
  CONSTRAINT `fk_employee_works_on` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`),
  CONSTRAINT `fk_project_works_on` FOREIGN KEY (`Pno`) REFERENCES `project` (`Pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
INSERT INTO `works_on` VALUES ('123456789',1,32.5),('123456789',2,7.5),('333445555',2,10.0),('333445555',3,10.0),('333445555',10,10.0),('333445555',20,10.0),('453453453',1,20.0),('453453453',2,20.0),('666884444',3,40.0),('888665555',20,0.0),('987654321',20,15.0),('987654321',30,20.0),('987987987',10,35.0),('987987987',30,5.0);
/*!40000 ALTER TABLE `works_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `employee_dependent_manager_vw`
--

/*!50001 DROP VIEW IF EXISTS `employee_dependent_manager_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_dependent_manager_vw` AS select concat(`employee`.`Fname`,' ',`employee`.`Lname`) AS `Employees`,`employee`.`Ssn` AS `Ssn`,count(0) AS `Dependents`,(case when ((`employee`.`Ssn` = `dependent`.`Essn`) and (`employee`.`Super_ssn` = `departament`.`Mgr_ssn`)) then 'YES' else 'NO' end) AS `Manager` from ((`employee` join `dependent` on((`employee`.`Ssn` = `dependent`.`Essn`))) join `departament` on((`employee`.`Super_ssn` = `departament`.`Mgr_ssn`))) where (`employee`.`Ssn` = `dependent`.`Essn`) group by `employee`.`Ssn` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employees_by_department`
--

/*!50001 DROP VIEW IF EXISTS `employees_by_department`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employees_by_department` AS select `departament`.`Dname` AS `Department`,`employee`.`Dno` AS `Department_Number`,count(0) AS `Employee_by_Depto` from (`employee` join `departament` on((`employee`.`Dno` = `departament`.`Dnumber`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employees_by_departments`
--

/*!50001 DROP VIEW IF EXISTS `employees_by_departments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employees_by_departments` AS select `departament`.`Dname` AS `Department`,`employee`.`Dno` AS `Department_Number`,count(0) AS `Employee_by_Depto` from (`employee` join `departament` on((`employee`.`Dno` = `departament`.`Dnumber`))) group by `employee`.`Dno` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `manager_by_department`
--

/*!50001 DROP VIEW IF EXISTS `manager_by_department`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `manager_by_department` AS select `departament`.`Dname` AS `Department`,`departament`.`Dnumber` AS `Department_Number`,`departament`.`Mgr_ssn` AS `Manager_Ssn` from `departament` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `project_department_manager`
--

/*!50001 DROP VIEW IF EXISTS `project_department_manager`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `project_department_manager` AS select `project`.`Pname` AS `Project`,`departament`.`Dname` AS `Department`,`departament`.`Mgr_ssn` AS `Manager` from (`project` join `departament` on((`project`.`Dnum` = `departament`.`Dnumber`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `projects_employees`
--

/*!50001 DROP VIEW IF EXISTS `projects_employees`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `projects_employees` AS select `project`.`Pname` AS `Project`,count(0) AS `Employees` from ((`project` join `departament` on((`project`.`Dnum` = `departament`.`Dnumber`))) join `employee` on((`employee`.`Dno` = `departament`.`Dnumber`))) group by `project`.`Pname` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-27 14:32:16
