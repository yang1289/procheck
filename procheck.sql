CREATE DATABASE  IF NOT EXISTS `procheck` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `procheck`;
-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: procheck
-- ------------------------------------------------------
-- Server version	5.7.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `pro_permission`
--

DROP TABLE IF EXISTS `pro_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_permission`
--

LOCK TABLES `pro_permission` WRITE;
/*!40000 ALTER TABLE `pro_permission` DISABLE KEYS */;
INSERT INTO `pro_permission` VALUES (1,'个人主页','index',0,NULL),(2,'项目申请','proapply',0,NULL),(3,'项目进展','proprocess',0,NULL),(4,'申请项目','proapply:apply',2,'/proapply/apply'),(5,'申请中的项目','proapply:applying',2,'/proapply/*/applying'),(6,'申请成功的项目','proapply:success',2,'/proapply/*/success'),(7,'申请失败的项目','proapply:fails',2,'/proapply/*/fails'),(8,'项目进展记录','proprocess:process',3,'/proprocess/process'),(9,'项目中期进展记录','proprocess:midreport',3,'/proprocess/midreport'),(10,'项目结项报告','proprocess:finreport',3,'/proprocess/finreport'),(11,'申请日期设置','setApplyTime',0,NULL),(12,'初始化管理','startManage',0,NULL),(13,'账号管理','user',0,NULL),(14,'账号列表','user:list',13,'/user/list'),(15,'设置申请日期','setApplyTime:set',11,'/setApplyTime/set'),(16,'初始化','startManage:initialization',12,'/startManage/initialization'),(17,'权限','permission',0,NULL),(18,'权限列表','permission:list',17,'/permission/list'),(19,'角色','role',0,NULL),(20,'角色列表','role:list',19,'/role/list'),(21,'项目','project',0,NULL),(22,'审核项目','project:check',21,'/project/check'),(23,'添加权限','permission:add',17,'/permission/add'),(25,'添加账户','user:add',13,'/user/add'),(26,'统计','statistics',0,NULL);
/*!40000 ALTER TABLE `pro_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_role`
--

DROP TABLE IF EXISTS `pro_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_role`
--

LOCK TABLES `pro_role` WRITE;
/*!40000 ALTER TABLE `pro_role` DISABLE KEYS */;
INSERT INTO `pro_role` VALUES (1,'教务处管理员','dsoAdmin'),(3,'学生','student'),(4,'指导老师','adviser'),(5,'学院教学秘书','ctsecretary'),(6,'院系专家组','fpgroup'),(7,'校级专家组','cpgroup');
/*!40000 ALTER TABLE `pro_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_role_permission`
--

DROP TABLE IF EXISTS `pro_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3rx94j1800415q0fd42p53v9p` (`permission_id`),
  KEY `FKlgcpcrxyi7jekqxfaxdctwhdi` (`role_id`),
  CONSTRAINT `FK3rx94j1800415q0fd42p53v9p` FOREIGN KEY (`permission_id`) REFERENCES `pro_permission` (`id`),
  CONSTRAINT `FKf4acku5p3b9cwjyfp7vs1v73m` FOREIGN KEY (`role_id`) REFERENCES `pro_role` (`id`),
  CONSTRAINT `FKlgcpcrxyi7jekqxfaxdctwhdi` FOREIGN KEY (`role_id`) REFERENCES `pro_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_role_permission`
--

LOCK TABLES `pro_role_permission` WRITE;
/*!40000 ALTER TABLE `pro_role_permission` DISABLE KEYS */;
INSERT INTO `pro_role_permission` VALUES (1,3,4),(2,3,5),(3,3,6),(4,3,7),(5,3,8),(6,3,9),(7,3,10),(48,7,22),(49,5,14),(66,1,16),(67,1,18),(68,1,23),(69,1,20),(70,1,15),(71,1,14),(72,1,22),(73,4,22);
/*!40000 ALTER TABLE `pro_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_user`
--

DROP TABLE IF EXISTS `pro_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(60) NOT NULL,
  `regist_time` datetime DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_user`
--

LOCK TABLES `pro_user` WRITE;
/*!40000 ALTER TABLE `pro_user` DISABLE KEYS */;
INSERT INTO `pro_user` VALUES (1,'yangqiang1289','$2a$10$DnLAjEQLANW.HOMM8.iNpeyzYj5xkdfSAz4MxcGlmDwWEOjWPWFzG','2017-02-09 16:46:51',NULL,NULL),(2,'admin','$2a$10$LlAgw6N3rDG0aG/jQy3wreHX42PxNgsBR4/XKmt8sbbKLKWLIiY3i','2017-02-19 11:54:14',NULL,NULL),(3,'532544220','$2a$10$MHlLxNHgkyhjAnO2BJtI.eJ2YlU8IqcDDtCWzO5da7zg9Fd6ksOr6','2017-02-22 13:27:16',NULL,NULL);
/*!40000 ALTER TABLE `pro_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_user_role`
--

DROP TABLE IF EXISTS `pro_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKa0jx0ladvp4xhw01d7t53m22e` (`user_id`),
  KEY `FK7k5exuxagt6p9eqkjyerh70b1` (`role_id`),
  CONSTRAINT `FK7k5exuxagt6p9eqkjyerh70b1` FOREIGN KEY (`role_id`) REFERENCES `pro_role` (`id`),
  CONSTRAINT `FKa0jx0ladvp4xhw01d7t53m22e` FOREIGN KEY (`user_id`) REFERENCES `pro_user` (`id`),
  CONSTRAINT `FKrf8htihwtcxamai3fu9mfi3fq` FOREIGN KEY (`role_id`) REFERENCES `pro_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_user_role`
--

LOCK TABLES `pro_user_role` WRITE;
/*!40000 ALTER TABLE `pro_user_role` DISABLE KEYS */;
INSERT INTO `pro_user_role` VALUES (1,1,3),(5,3,4),(6,2,1);
/*!40000 ALTER TABLE `pro_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tasks`
--

DROP TABLE IF EXISTS `t_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `data_created` datetime DEFAULT NULL,
  `finished` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tasks`
--

LOCK TABLES `t_tasks` WRITE;
/*!40000 ALTER TABLE `t_tasks` DISABLE KEYS */;
INSERT INTO `t_tasks` VALUES (1,'task1','description','2017-02-01 23:56:07','\0'),(2,'no task','no description','2017-02-01 23:56:56',''),(4,'&#26472;&#24535;&#24378;','&#25105;22&#23681;','2017-02-02 00:23:53','\0'),(8,'杨志强','我叫杨志强，今年十八岁','2017-02-08 00:30:48',''),(9,'郭君','郭君是我的妈妈','2017-02-08 00:37:55','\0'),(10,'杨紫洢','这是我的妹妹','2017-02-09 18:28:20','\0');
/*!40000 ALTER TABLE `t_tasks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-22 18:52:40
