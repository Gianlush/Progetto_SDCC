CREATE DATABASE  IF NOT EXISTS `my_library` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `my_library`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: my_library
-- ------------------------------------------------------
-- Server version	5.6.51-log

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
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (2,'50 sfumature di grigio','Romanzo','Per adulti (18+)','E. L. James'),(3,'50 sfumature di nero','Romanzo','Per adulti (18+)','E. L. James'),(4,'50 sfumature di rosso','Romanzo','Per adulti (18+)','E. L. James'),(5,'Assassinio sull\'Orient Express','Giallo ','Per ragazzi (11-17)','Agatha Christie'),(6,'La serie infernale','Giallo ','Per ragazzi (11-17)','Agatha Christie'),(7,'Fuoco e sangue','Avventura','Per ragazzi (11-17)','George R. R. Martin'),(8,'L\'ascesa del drago','Avventura','Per ragazzi (11-17)','George R. R. Martin'),(9,'Uno scontro di Re','Avventura','Per ragazzi (11-17)','George R. R. Martin'),(10,'Harry Potter e il Calice di Fuoco','Fantasy','Per ragazzi (11-17)','J. K. Rowling'),(11,'Harry Potter e il prigioniero di Azkaban','Fantasy','Per ragazzi (11-17)','J. K. Rowling'),(12,'Harry Potter e il principe Mezzosangue','Fantasy','Per ragazzi (11-17)','J. K. Rowling'),(13,'Harry Potter e i Doni della Morte','Fantasy','Per ragazzi (11-17)','J. K. Rowling'),(14,'Harry Potter e l\'Ordine della Fenice','Fantasy','Per ragazzi (11-17)','J. K. Rowling'),(15,'Harry Potter e la Camera dei Segreti','Fantasy','Per ragazzi (11-17)','J. K. Rowling'),(16,'Harry Potter e la Pietra Filosofale','Fantasy','Per ragazzi (11-17)','J. K. Rowling'),(17,'Il giro del mondo in 80 giorni','Avventura','Per bambini (3-10)','Jules Verne'),(18,'Il nome della rosa','Romanzo','Per adulti (18+)','Umberto Eco'),(19,'Il piccolo Principe','Fantasy','Per bambini (3-10)','Antoine de Saint-Exupéry'),(20,'IT','Horror','Per adulti (18+)','Stephen King'),(21,'L\'altra verità','Autobiografico','Per adulti (18+)','Alda Merini'),(22,'L\'isola misteriosa','Avventura','Per bambini (3-10)','Jules Verne'),(23,'Lungo cammino verso la libertà','Autobiografico','Per ragazzi (11-17)','Nelson Mandela'),(24,'Storia delle tenebre e dei luoghi leggendari','Romanzo','Per adulti (18+)','Umberto Eco'),(25,'The Shining','Horror','Per adulti (18+)','Stephen King'),(26,'The Outsider','Horror','Per adulti (18+)','Stephen King'),(27,'Ventimila leghe sotto i mari','Avventura','Per bambini (3-10)','Jules Verne'),(28,'Billy Budd','Romanzo','Per adulti (18+)','Herman Melville'),(29,'Io, Nelson Mandela','Autobiografico','Per adulti (18+)','Nelson Mandela'),(30,'Io sono Malala','Autobiografico','Per ragazzi (11-17)','Christina Lamb'),(31,'La compagnia dell\'anello','Avventura','Per ragazzi (11-17)','J. R. R. Tolkien'),(32,'Lettere dal carcere','Autobiografico','Per adulti (18+)','Antonio Gramsci'),(33,'Le due torri','Avventura','Per ragazzi (11-17)','J. R. R. Tolkien'),(34,'Lo Hobbit','Avventura','Per ragazzi (11-17)','J. R. R. Tolkien'),(35,'Moby Dick','Avventura','Per ragazzi (11-17)','Herman Melville'),(36,'Taipi','Romanzo','Per ragazzi (11-17)','Herman Melville'),(37,'Terra degli uomini','Autobiografico','Per ragazzi (11-17)','Antoine de Saint-Exupéry'),(38,'Una persona alla volta','Autobiografico','Per ragazzi (11-17)','Gino Strada'),(39,'Una terra promessa','Autobiografico','Per adulti (18+)','Barack Obama'),(40,'Volo di notte','Romanzo','Per ragazzi (11-17)','Antoine de Saint-Exupéry');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-24 19:23:54
