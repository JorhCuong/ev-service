-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ev_service_center
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `Booking_ID` char(36) NOT NULL,
  `Service_center_ID` char(36) DEFAULT NULL,
  `Customer_ID` char(36) DEFAULT NULL,
  `Service_type` enum('MAINTENANCE','REPAIR','CHECKUP') NOT NULL,
  `Status` enum('PENDING','CONFIRMED','IN_PROGRESS','DONE','CANCELLED') DEFAULT 'PENDING',
  `Scheduled_at` timestamp NOT NULL,
  `Created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_at` timestamp NULL DEFAULT NULL,
  `Booking_date` date NOT NULL,
  PRIMARY KEY (`Booking_ID`),
  KEY `Service_center_ID` (`Service_center_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`Service_center_ID`) REFERENCES `service_centers` (`Service_center_ID`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`Customer_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `checklist_items`
--

DROP TABLE IF EXISTS `checklist_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checklist_items` (
  `Checklist_item_ID` char(36) NOT NULL,
  `Work_order_ID` char(36) DEFAULT NULL,
  `Description` text NOT NULL,
  `Status` enum('TODO','DONE') DEFAULT 'TODO',
  PRIMARY KEY (`Checklist_item_ID`),
  KEY `Work_order_ID` (`Work_order_ID`),
  CONSTRAINT `checklist_items_ibfk_1` FOREIGN KEY (`Work_order_ID`) REFERENCES `work_orders` (`Work_order_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `Invoice_ID` char(36) NOT NULL,
  `Booking_ID` char(36) DEFAULT NULL,
  `Total_amount` decimal(10,2) NOT NULL,
  `Status` enum('UNPAID','PAID','CANCELLED') DEFAULT 'UNPAID',
  `Created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Invoice_ID`),
  KEY `Booking_ID` (`Booking_ID`),
  CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`Booking_ID`) REFERENCES `bookings` (`Booking_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parts`
--

DROP TABLE IF EXISTS `parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parts` (
  `Part_ID` char(36) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Stock_qty` int DEFAULT '0',
  `Min_stock` int DEFAULT '0',
  `Price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Part_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parts_used`
--

DROP TABLE IF EXISTS `parts_used`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parts_used` (
  `Part_used_ID` char(36) NOT NULL,
  `Work_order_ID` char(36) DEFAULT NULL,
  `Part_ID` char(36) DEFAULT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`Part_used_ID`),
  KEY `Work_order_ID` (`Work_order_ID`),
  KEY `Part_ID` (`Part_ID`),
  CONSTRAINT `parts_used_ibfk_1` FOREIGN KEY (`Work_order_ID`) REFERENCES `work_orders` (`Work_order_ID`),
  CONSTRAINT `parts_used_ibfk_2` FOREIGN KEY (`Part_ID`) REFERENCES `parts` (`Part_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `Payment_ID` char(36) NOT NULL,
  `Invoice_ID` char(36) DEFAULT NULL,
  `Method` enum('EWALLET','BANKING','CASH') NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Paid_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Payment_ID`),
  KEY `Invoice_ID` (`Invoice_ID`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`Invoice_ID`) REFERENCES `invoices` (`Invoice_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `refresh_tokens`
--

DROP TABLE IF EXISTS `refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refresh_tokens` (
  `Refresh_token_ID` char(36) NOT NULL,
  `User_ID` char(36) DEFAULT NULL,
  `Token` varchar(512) NOT NULL,
  `Expires_at` timestamp NOT NULL,
  `Created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Refresh_token_ID`),
  UNIQUE KEY `Token` (`Token`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `refresh_tokens_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_centers`
--

DROP TABLE IF EXISTS `service_centers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_centers` (
  `Service_center_ID` char(36) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `Contact_phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Service_center_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `User_ID` char(36) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` text NOT NULL,
  `Role` enum('CUSTOMER','STAFF','TECHNICIAN','ADMIN') NOT NULL,
  `Created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `work_orders`
--

DROP TABLE IF EXISTS `work_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_orders` (
  `Work_order_ID` char(36) NOT NULL,
  `Booking_ID` char(36) DEFAULT NULL,
  `Technician_ID` char(36) DEFAULT NULL,
  `Status` enum('WAITING','IN_PROGRESS','COMPLETED') DEFAULT 'WAITING',
  `Scheduled_at` timestamp NULL DEFAULT NULL,
  `Created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Work_order_ID`),
  KEY `Booking_ID` (`Booking_ID`),
  KEY `Technician_ID` (`Technician_ID`),
  CONSTRAINT `work_orders_ibfk_1` FOREIGN KEY (`Booking_ID`) REFERENCES `bookings` (`Booking_ID`),
  CONSTRAINT `work_orders_ibfk_2` FOREIGN KEY (`Technician_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-29 23:27:45
