CREATE DATABASE  IF NOT EXISTS `uepbnew` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `uepbnew`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: uepbnew
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `matricula` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cpf` int NOT NULL,
  `id_campus` int NOT NULL,
  PRIMARY KEY (`matricula`),
  UNIQUE KEY `cpf` (`cpf`),
  KEY `id_campus` (`id_campus`),
  CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`id_campus`) REFERENCES `campus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,'Rafaela',123456789,1),(2,'Ewerton',123456788,1),(3,'Joao',123456787,1),(4,'Mariana',123456786,1);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `armario`
--

DROP TABLE IF EXISTS `armario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `armario` (
  `registro_mobilia` int NOT NULL,
  PRIMARY KEY (`registro_mobilia`),
  UNIQUE KEY `registro_mobilia` (`registro_mobilia`),
  CONSTRAINT `armario_ibfk_1` FOREIGN KEY (`registro_mobilia`) REFERENCES `mobilia` (`registro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `armario`
--

LOCK TABLES `armario` WRITE;
/*!40000 ALTER TABLE `armario` DISABLE KEYS */;
INSERT INTO `armario` VALUES (6),(7);
/*!40000 ALTER TABLE `armario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacao` (
  `data_criacao` datetime NOT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  `nota` int NOT NULL,
  `matricula_aluno` int NOT NULL,
  `referencia_laboratorio` int NOT NULL,
  PRIMARY KEY (`matricula_aluno`,`referencia_laboratorio`),
  KEY `referencia_laboratorio` (`referencia_laboratorio`),
  CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`referencia_laboratorio`) REFERENCES `laboratorio` (`referencia`),
  CONSTRAINT `avaliacao_ibfk_2` FOREIGN KEY (`matricula_aluno`) REFERENCES `aluno` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
INSERT INTO `avaliacao` VALUES ('2022-03-19 03:14:07','2022-01-19 04:14:07',8,1,1),('2022-03-16 03:14:07','2022-01-17 04:14:07',7,2,2),('2022-03-15 03:14:07','2022-01-15 04:14:07',6,3,2);
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bancada`
--

DROP TABLE IF EXISTS `bancada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bancada` (
  `registro_mobilia` int NOT NULL,
  PRIMARY KEY (`registro_mobilia`),
  UNIQUE KEY `registro_mobilia` (`registro_mobilia`),
  CONSTRAINT `bancada_ibfk_1` FOREIGN KEY (`registro_mobilia`) REFERENCES `mobilia` (`registro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bancada`
--

LOCK TABLES `bancada` WRITE;
/*!40000 ALTER TABLE `bancada` DISABLE KEYS */;
INSERT INTO `bancada` VALUES (4),(5),(9),(10),(11),(12),(13),(14),(15);
/*!40000 ALTER TABLE `bancada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cadeira`
--

DROP TABLE IF EXISTS `cadeira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cadeira` (
  `registro_mobilia` int NOT NULL,
  PRIMARY KEY (`registro_mobilia`),
  UNIQUE KEY `registro_mobilia` (`registro_mobilia`),
  CONSTRAINT `cadeira_ibfk_1` FOREIGN KEY (`registro_mobilia`) REFERENCES `mobilia` (`registro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadeira`
--

LOCK TABLES `cadeira` WRITE;
/*!40000 ALTER TABLE `cadeira` DISABLE KEYS */;
INSERT INTO `cadeira` VALUES (2),(3),(16);
/*!40000 ALTER TABLE `cadeira` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campus`
--

DROP TABLE IF EXISTS `campus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campus` (
  `id` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `rua` varchar(50) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `cep` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campus`
--

LOCK TABLES `campus` WRITE;
/*!40000 ALTER TABLE `campus` DISABLE KEYS */;
INSERT INTO `campus` VALUES (1,'UEPB','baraunas','universitario',1,58429500);
/*!40000 ALTER TABLE `campus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computador`
--

DROP TABLE IF EXISTS `computador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `computador` (
  `registro` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) DEFAULT NULL,
  `processador` varchar(50) NOT NULL,
  `referencia_laboratorio` int NOT NULL,
  PRIMARY KEY (`registro`),
  KEY `referencia_laboratorio` (`referencia_laboratorio`),
  CONSTRAINT `computador_ibfk_1` FOREIGN KEY (`referencia_laboratorio`) REFERENCES `laboratorio` (`referencia`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computador`
--

LOCK TABLES `computador` WRITE;
/*!40000 ALTER TABLE `computador` DISABLE KEYS */;
INSERT INTO `computador` VALUES (1,'lenovo','INTEL 7700K',1),(2,'apple','INTEL 7700Kcomputador',1),(3,'dell','AMD 2700',1),(4,'positivo','INTEL 7700K',2),(5,'dell','AMD 2700',3),(6,'acer','AMD 2700K',2);
/*!40000 ALTER TABLE `computador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipamento`
--

DROP TABLE IF EXISTS `equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `referencia_laboratorio` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `referencia_laboratorio` (`referencia_laboratorio`),
  CONSTRAINT `equipamento_ibfk_1` FOREIGN KEY (`referencia_laboratorio`) REFERENCES `laboratorio` (`referencia`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipamento`
--

LOCK TABLES `equipamento` WRITE;
/*!40000 ALTER TABLE `equipamento` DISABLE KEYS */;
INSERT INTO `equipamento` VALUES (1,'multimidia',1),(2,'impressora',1),(3,'impressora hp',2),(4,'camera',2),(5,'pc',3);
/*!40000 ALTER TABLE `equipamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instala`
--

DROP TABLE IF EXISTS `instala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instala` (
  `registro_computador` int NOT NULL,
  `matricula_tecnico` int NOT NULL,
  `registro_software` int NOT NULL,
  PRIMARY KEY (`registro_computador`,`registro_software`),
  KEY `matricula_tecnico` (`matricula_tecnico`),
  KEY `registro_software` (`registro_software`),
  CONSTRAINT `instala_ibfk_1` FOREIGN KEY (`registro_computador`) REFERENCES `computador` (`registro`),
  CONSTRAINT `instala_ibfk_2` FOREIGN KEY (`matricula_tecnico`) REFERENCES `responsavel_tecnico` (`matricula`),
  CONSTRAINT `instala_ibfk_3` FOREIGN KEY (`registro_software`) REFERENCES `software` (`registro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instala`
--

LOCK TABLES `instala` WRITE;
/*!40000 ALTER TABLE `instala` DISABLE KEYS */;
INSERT INTO `instala` VALUES (1,1,1),(2,2,2),(6,2,5),(4,3,6),(3,4,3);
/*!40000 ALTER TABLE `instala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratorio`
--

DROP TABLE IF EXISTS `laboratorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratorio` (
  `referencia` int NOT NULL AUTO_INCREMENT,
  `capacidade` int DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `rua` varchar(50) DEFAULT NULL,
  `bloco` varchar(50) DEFAULT NULL,
  `data_criacao` date DEFAULT NULL,
  `id_campus` int NOT NULL,
  PRIMARY KEY (`referencia`),
  UNIQUE KEY `nome` (`nome`),
  KEY `id_campus` (`id_campus`),
  CONSTRAINT `laboratorio_ibfk_1` FOREIGN KEY (`id_campus`) REFERENCES `campus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratorio`
--

LOCK TABLES `laboratorio` WRITE;
/*!40000 ALTER TABLE `laboratorio` DISABLE KEYS */;
INSERT INTO `laboratorio` VALUES (1,30,'lp2','baraunas','cct','2012-03-04',1),(2,30,'lab','baraunas','cct','2011-04-11',1),(3,30,'metodologia','baraunas','ciac','2011-03-04',1);
/*!40000 ALTER TABLE `laboratorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livro` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `autor` varchar(50) NOT NULL,
  `edicao` varchar(50) DEFAULT NULL,
  `referencia_laboratorio` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `referencia_laboratorio` (`referencia_laboratorio`),
  CONSTRAINT `livro_ibfk_1` FOREIGN KEY (`referencia_laboratorio`) REFERENCES `laboratorio` (`referencia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES (1,'introducao a sistema de bd','Christopher','8',1),(2,'projeto de banco de dados','Carlos Albert','1',1),(3,'sistema de banco de dados','Elmasri','6',2),(4,'sql e teoria relacional','Christopher','1',2);
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobilia`
--

DROP TABLE IF EXISTS `mobilia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mobilia` (
  `registro` int NOT NULL AUTO_INCREMENT,
  `modelo` varchar(50) NOT NULL,
  `status_conservacao` varchar(50) NOT NULL,
  `referencia_laboratorio` int NOT NULL,
  PRIMARY KEY (`registro`),
  UNIQUE KEY `registro` (`registro`),
  KEY `referencia_laboratorio` (`referencia_laboratorio`),
  CONSTRAINT `mobilia_ibfk_1` FOREIGN KEY (`referencia_laboratorio`) REFERENCES `laboratorio` (`referencia`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobilia`
--

LOCK TABLES `mobilia` WRITE;
/*!40000 ALTER TABLE `mobilia` DISABLE KEYS */;
INSERT INTO `mobilia` VALUES (1,'estante de aço','novo',1),(2,'cadeira','velho',1),(3,'cadeira','velho',2),(4,'bancada','moderado',2),(5,'bancada','moderado',1),(6,'armario','velho',1),(7,'armario','velho',2),(8,'bancada','moderado',2),(9,'prateleira','novo',2),(10,'bancada','velho',2),(11,'bancada','moderado',2),(12,'bancada','moderado',2),(13,'bancada','moderado',2),(14,'bancada','moderado',2),(15,'bancada','novo',2),(16,'bancada','moderado',2),(17,'cadeira','velho',2),(18,'estante de aço','novo',1),(19,'cadeira','velho',1),(20,'cadeira','velho',2),(21,'bancada','moderado',2),(22,'bancada','moderado',1),(23,'armario','velho',1),(24,'armario','velho',2),(25,'bancada','moderado',2),(26,'prateleira','novo',2),(27,'bancada','velho',2),(28,'bancada','moderado',2),(29,'bancada','moderado',2),(30,'bancada','moderado',2),(31,'bancada','moderado',2),(32,'bancada','novo',2),(33,'bancada','moderado',2),(34,'cadeira','velho',2);
/*!40000 ALTER TABLE `mobilia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `matricula` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `id_campus` int NOT NULL,
  PRIMARY KEY (`matricula`),
  UNIQUE KEY `matricula` (`matricula`),
  KEY `id_campus` (`id_campus`),
  CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`id_campus`) REFERENCES `campus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,'Fabio',1);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsavel_tecnico`
--

DROP TABLE IF EXISTS `responsavel_tecnico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsavel_tecnico` (
  `matricula` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `id_campus` int NOT NULL,
  `referencia_laboratorio` int NOT NULL,
  PRIMARY KEY (`matricula`),
  UNIQUE KEY `nome` (`nome`),
  KEY `id_campus` (`id_campus`),
  KEY `referencia_laboratorio` (`referencia_laboratorio`),
  CONSTRAINT `responsavel_tecnico_ibfk_1` FOREIGN KEY (`id_campus`) REFERENCES `campus` (`id`),
  CONSTRAINT `responsavel_tecnico_ibfk_2` FOREIGN KEY (`referencia_laboratorio`) REFERENCES `laboratorio` (`referencia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsavel_tecnico`
--

LOCK TABLES `responsavel_tecnico` WRITE;
/*!40000 ALTER TABLE `responsavel_tecnico` DISABLE KEYS */;
INSERT INTO `responsavel_tecnico` VALUES (1,'José Bonito',1,1),(2,'Pedro',1,2),(3,'Maria Feia',1,2),(4,'Joao',1,2);
/*!40000 ALTER TABLE `responsavel_tecnico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `software`
--

DROP TABLE IF EXISTS `software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `software` (
  `registro` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `versao` varchar(50) DEFAULT NULL,
  `licenca` varchar(50) NOT NULL,
  PRIMARY KEY (`registro`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `software`
--

LOCK TABLES `software` WRITE;
/*!40000 ALTER TABLE `software` DISABLE KEYS */;
INSERT INTO `software` VALUES (1,'chrome','2022','10'),(2,'slack','2017','11'),(3,'skype','2022','20'),(4,'OS Linux','20.04','15'),(5,'Linux OS','18.04','17'),(6,'discord','2021','13');
/*!40000 ALTER TABLE `software` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao`
--

DROP TABLE IF EXISTS `solicitacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitacao` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `referencia_laboratorio` int NOT NULL,
  `matricula_professor` int NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `referencia_laboratorio` (`referencia_laboratorio`),
  KEY `matricula_professor` (`matricula_professor`),
  CONSTRAINT `solicitacao_ibfk_1` FOREIGN KEY (`referencia_laboratorio`) REFERENCES `laboratorio` (`referencia`),
  CONSTRAINT `solicitacao_ibfk_2` FOREIGN KEY (`matricula_professor`) REFERENCES `professor` (`matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao`
--

LOCK TABLES `solicitacao` WRITE;
/*!40000 ALTER TABLE `solicitacao` DISABLE KEYS */;
INSERT INTO `solicitacao` VALUES (6,1,1,'encaminhado'),(7,2,1,'finalizado'),(8,2,1,'aberto'),(9,3,1,'aberto'),(10,3,1,'aberto');
/*!40000 ALTER TABLE `solicitacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usa`
--

DROP TABLE IF EXISTS `usa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usa` (
  `referencia_laboratorio` int NOT NULL,
  `matricula_aluno` int NOT NULL,
  PRIMARY KEY (`referencia_laboratorio`,`matricula_aluno`),
  KEY `matricula_aluno` (`matricula_aluno`),
  CONSTRAINT `usa_ibfk_1` FOREIGN KEY (`referencia_laboratorio`) REFERENCES `laboratorio` (`referencia`),
  CONSTRAINT `usa_ibfk_2` FOREIGN KEY (`matricula_aluno`) REFERENCES `aluno` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usa`
--

LOCK TABLES `usa` WRITE;
/*!40000 ALTER TABLE `usa` DISABLE KEYS */;
INSERT INTO `usa` VALUES (1,1),(2,2),(2,3),(1,4);
/*!40000 ALTER TABLE `usa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utiliza`
--

DROP TABLE IF EXISTS `utiliza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utiliza` (
  `referencia_laboratorio` int NOT NULL,
  `matricula_professor` int NOT NULL,
  PRIMARY KEY (`referencia_laboratorio`,`matricula_professor`),
  KEY `matricula_professor` (`matricula_professor`),
  CONSTRAINT `utiliza_ibfk_1` FOREIGN KEY (`referencia_laboratorio`) REFERENCES `laboratorio` (`referencia`),
  CONSTRAINT `utiliza_ibfk_2` FOREIGN KEY (`matricula_professor`) REFERENCES `professor` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utiliza`
--

LOCK TABLES `utiliza` WRITE;
/*!40000 ALTER TABLE `utiliza` DISABLE KEYS */;
INSERT INTO `utiliza` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `utiliza` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-06 12:53:08
