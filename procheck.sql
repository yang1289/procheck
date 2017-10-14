CREATE DATABASE  IF NOT EXISTS `procheck` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `procheck`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
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
-- Table structure for table `pro_academy`
--

DROP TABLE IF EXISTS `pro_academy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_academy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_academy`
--

LOCK TABLES `pro_academy` WRITE;
/*!40000 ALTER TABLE `pro_academy` DISABLE KEYS */;
INSERT INTO `pro_academy` VALUES (11,'数学与计算机学院'),(12,'电气信息工程学院');
/*!40000 ALTER TABLE `pro_academy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_grade`
--

DROP TABLE IF EXISTS `pro_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `major_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkrgwpogck8rn51ur98yy2sgml` (`major_id`),
  CONSTRAINT `FKkrgwpogck8rn51ur98yy2sgml` FOREIGN KEY (`major_id`) REFERENCES `pro_major` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_grade`
--

LOCK TABLES `pro_grade` WRITE;
/*!40000 ALTER TABLE `pro_grade` DISABLE KEYS */;
INSERT INTO `pro_grade` VALUES (1,'计算机科学与技术14级1班',2),(2,'软件工程14级1班',3),(3,'测控技术与仪器15级1班',4),(4,'电子信息工程13级1班',5);
/*!40000 ALTER TABLE `pro_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_major`
--

DROP TABLE IF EXISTS `pro_major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_major` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `academy_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn5hsnhc01uxypj8os29p6f1rf` (`academy_id`),
  CONSTRAINT `FKn5hsnhc01uxypj8os29p6f1rf` FOREIGN KEY (`academy_id`) REFERENCES `pro_academy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_major`
--

LOCK TABLES `pro_major` WRITE;
/*!40000 ALTER TABLE `pro_major` DISABLE KEYS */;
INSERT INTO `pro_major` VALUES (2,'计算机科学与技术',11),(3,'软件工程',11),(4,'测控技术与仪器',12),(5,'电子信息工程',12);
/*!40000 ALTER TABLE `pro_major` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_permission`
--

LOCK TABLES `pro_permission` WRITE;
/*!40000 ALTER TABLE `pro_permission` DISABLE KEYS */;
INSERT INTO `pro_permission` VALUES (1,'个人主页','index',0,NULL),(2,'项目申请','proapply',0,NULL),(3,'项目进展','proprocess',0,NULL),(4,'申请项目','project:apply',21,'/project/apply'),(5,'申请中的项目','project:applying',21,'/project/applying'),(6,'申请成功的项目','project:success',21,'/project/success'),(7,'申请失败的项目','project:fails',21,'/project/fails'),(8,'项目进展记录','proprocess:process',3,'/proprocess/process'),(9,'项目中期进展记录','proprocess:midreport',3,'/proprocess/midreport'),(10,'项目结项报告','proprocess:finreport',3,'/proprocess/finreport'),(11,'申请日期设置','setApplyTime',0,NULL),(12,'初始化管理','startManage',0,NULL),(13,'账号管理','user',0,NULL),(14,'账号列表','user:list',13,'/user/list'),(15,'设置申请日期','setApplyTime:set',11,'/setApplyTime/set'),(16,'初始化','startManage:initialization',12,'/startManage/initialization'),(17,'权限','permission',0,NULL),(18,'权限列表','permission:list',17,'/permission/list'),(19,'角色','role',0,NULL),(20,'角色列表','role:list',19,'/role/list'),(21,'项目','project',0,NULL),(22,'审核项目','project:checklist',21,'/project/checklist'),(23,'添加权限','permission:add',17,'/permission/add'),(25,'添加账户','user:add',13,'/user/add'),(26,'统计','statistics',0,NULL),(27,'项目列表','project:list',21,'/project/list'),(28,'学院','academy',0,NULL),(29,'学院列表','academy:list',28,'/academy/list'),(30,'添加学院信息','academy:add',28,'/academy/add'),(31,'表格','protable',0,NULL),(32,'表格设置','protable:add',31,'/protable/add');
/*!40000 ALTER TABLE `pro_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_project`
--

DROP TABLE IF EXISTS `pro_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(45) DEFAULT NULL,
  `project_intro` longtext,
  `adviser_advice` varchar(45) DEFAULT NULL,
  `adviser_is_check` bit(1) DEFAULT NULL,
  `academy_advice` varchar(45) DEFAULT NULL,
  `academy_is_check` bit(1) DEFAULT NULL,
  `college_advice` varchar(45) DEFAULT NULL,
  `college_is_check` bit(1) DEFAULT NULL,
  `published` bit(1) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `project_info` longtext,
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `academy_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpsj16xq3xfuun5jep8hq7gvm6` (`user_id`),
  KEY `FK2iuvnoy5fwtbtjn3sicx2oq49` (`academy_id`),
  CONSTRAINT `FK2iuvnoy5fwtbtjn3sicx2oq49` FOREIGN KEY (`academy_id`) REFERENCES `pro_academy` (`id`),
  CONSTRAINT `FKpsj16xq3xfuun5jep8hq7gvm6` FOREIGN KEY (`user_id`) REFERENCES `pro_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_project`
--

LOCK TABLES `pro_project` WRITE;
/*!40000 ALTER TABLE `pro_project` DISABLE KEYS */;
INSERT INTO `pro_project` VALUES (1,'阿斯顿发',NULL,NULL,'\0',NULL,'\0',NULL,'\0','\0',NULL,'2017-03-03 23:03:17','<p>没有什么好说的了</p>',1,1,11),(2,'阿斯顿发',NULL,'我同意了','','数计的院系专家组审核通过','',NULL,'\0','\0',NULL,'2017-03-03 23:28:59','<p>只是我的第二个项目</p>',NULL,1,11),(3,'图形识别技术',NULL,'没有什么问题','','yang的审核通过','','','\0','\0',NULL,'2017-03-04 13:14:08','<h1 style=\"font-size: 32px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: center; margin: 0px 0px 20px;\">图片识别技术<br/></h1><h2>项目成员：<br/></h2><table><tbody><tr class=\"firstRow\"><td width=\"249\" valign=\"top\" style=\"word-break: break-all;\">成员姓名</td><td width=\"313\" valign=\"top\" style=\"word-break: break-all;\">成员年级</td><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\">成员院系</td></tr><tr><td width=\"249\" valign=\"top\" style=\"word-break: break-all;\">杨智强</td><td width=\"313\" valign=\"top\" style=\"word-break: break-all;\">14级计算机科学与技术1班</td><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\">数学与计算机学院</td></tr><tr><td width=\"249\" valign=\"top\" style=\"word-break: break-all;\">陈前华<br/></td><td width=\"313\" valign=\"top\" style=\"word-break: break-all;\">14级软件工程1班</td><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\">数学与计算机学院</td></tr></tbody></table><h2>项目介绍：</h2><p>关于这个项目没有什么介绍</p><p><br/></p><h2>创新点</h2><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p><span style=\"font-size:14px;font-family:宋体\">采用了现在流行的企业级开发方式。</span></p></li><li><p><span style=\"font-size:14px;font-family:宋体\"><span style=\"font-size:14px;font-family:楷体_GB2312\">敏捷的开发过程。</span></span></p></li><li><p><span style=\"font-size:14px;font-family:宋体\"><span style=\"font-size:14px;font-family:楷体_GB2312\"><span style=\"font-size:14px;font-family:楷体_GB2312\">具有一定的安全性</span></span></span><br/></p></li></ol>',NULL,4,12),(4,'创新创业项目管理系统',NULL,NULL,'\0',NULL,'\0',NULL,'\0','\0',NULL,'2017-03-12 13:53:19','<table width=\"-302\"><tbody><tr class=\"firstRow\"><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><h3>项目名称<br/></h3></td><td valign=\"top\" colspan=\"3\" rowspan=\"1\" style=\"word-break: break-all;\"><h3><span style=\"font-family: arial, helvetica, sans-serif; font-size: 18px;\">基于springboot的框架的大学生创新创业项目信息管理系统</span></h3></td></tr><tr><td valign=\"top\" style=\"word-break: break-all;\" colspan=\"4\"><h3>申请小组成员</h3></td></tr><tr><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\"><h4>申请人姓名</h4></td><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\"><h4>专业<br/></h4></td><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\"><h4>学号<br/></h4></td><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\"><h4>班级</h4></td></tr><tr><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\">杨智强</td><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\"><span style=\"font-size:14px;font-family:宋体\">计算机科学与技术</span></td><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\"><span style=\"font-size:14px;font-family: &#39;Times New Roman&#39;,&#39;serif&#39;\">20131687</span></td><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\"><span style=\"font-size:14px;font-family: &#39;Times New Roman&#39;,&#39;serif&#39;\">14</span><span style=\"font-size:14px;font-family:宋体\">级</span><span style=\"font-size:14px;font-family:&#39;Times New Roman&#39;,&#39;serif&#39;\">1</span><span style=\"font-size:14px;font-family:宋体\">班</span></td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><span style=\"font-size:14px;font-family:宋体\">胡立根</span><span style=\"font-size:14px;font-family:&#39;Times New Roman&#39;,&#39;serif&#39;\">&nbsp; &nbsp;</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><span style=\"font-size:14px;font-family:宋体\">网络工程</span><span style=\"font-size:14px;font-family:&#39;Times New Roman&#39;,&#39;serif&#39;\">&nbsp;&nbsp;</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><span style=\"font-size:14px;font-family: &#39;Times New Roman&#39;,&#39;serif&#39;\">201410803007</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><span style=\"font-size:14px;font-family: &#39;Times New Roman&#39;,&#39;serif&#39;\">14</span><span style=\"font-size:14px;font-family:宋体\">级</span><span style=\"font-size:14px;font-family:&#39;Times New Roman&#39;,&#39;serif&#39;\">1</span><span style=\"font-size:14px;font-family:宋体\">班</span></td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><span style=\"font-size:14px;font-family:宋体\">李思茂</span><span style=\"font-size:14px;font-family:&#39;Times New Roman&#39;,&#39;serif&#39;\">&nbsp;</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><span style=\"font-size:14px;font-family:宋体\">网络工程</span><span style=\"font-size:14px;font-family:&#39;Times New Roman&#39;,&#39;serif&#39;\">&nbsp; &nbsp;</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><span style=\"font-size:14px;font-family: &#39;Times New Roman&#39;,&#39;serif&#39;\">201410803018</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><span style=\"font-size:14px;font-family: &#39;Times New Roman&#39;,&#39;serif&#39;\">14</span><span style=\"font-size:14px;font-family:宋体\">级</span><span style=\"font-size:14px;font-family:&#39;Times New Roman&#39;,&#39;serif&#39;\">1</span><span style=\"font-size:14px;font-family:宋体\">班</span></td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><h4>指导老师：</h4></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\"><br/></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><h4>职称：<br/></h4></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\"><br/></td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><h4>实验室名称：<br/></h4></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><br/></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><h4>所属教学单位：<br/></h4></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\"><br/></td></tr><tr><td valign=\"top\" colspan=\"4\" rowspan=\"1\" style=\"word-break: break-all;\"><h4>研究现状：</h4><p><span style=\"font-size:14px;font-family:宋体\">学校每年都开展创新创业项目申请，但是由于项目的申请都是通过纸质申请，申请过于麻烦，同时申请的项目不方便管理，所以决定做一个基于</span><span style=\"font-size:14px;font-family:&#39;Times New Roman&#39;,&#39;serif&#39;\">springboot</span><span style=\"font-size:14px;font-family:宋体\">的创新创业项目管理系统，能够更方便同时利于管理。</span></p><p><br/></p><p><br/></p></td></tr><tr><td valign=\"top\" colspan=\"4\" rowspan=\"1\" style=\"word-break: break-all;\"><h4>研究方案：</h4><p><span style=\"font-size:14px;font-family:宋体\">通过</span><span style=\"font-size:14px;font-family:&#39;Times New Roman&#39;,&#39;serif&#39;\">java+springboot</span><span style=\"font-size:14px;font-family:宋体\">的做网站的开发能够实现更方便的开发模式，同时具有一定的安全性。对创新创业项目的管理也能够一定方便。</span></p><p><br/></p></td></tr><tr><td valign=\"top\" colspan=\"4\" rowspan=\"1\" style=\"word-break: break-all;\"><h4>创新点：</h4><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>采用了现在流行的企业级开发方式。</p></li><li><p><span style=\"font-family: 楷体_GB2312;\">敏捷的开发过程。</span></p></li><li><p><span style=\"font-size:14px;font-family:楷体_GB2312\">具有一定的安全性。</span></p></li></ol><p><br/></p><p><br/></p></td></tr><tr><td valign=\"top\" colspan=\"4\" rowspan=\"1\" style=\"word-break: break-all;\"><h4><span style=\"font-size:14px;font-family:宋体\">研究工作的条件保障（实验室、研究基地等）：</span></h4><p><span style=\"font-size:14px;font-family:宋体\"><br/></span></p><p><span style=\"font-size:14px;font-family:宋体\"><br/></span></p></td></tr><tr><td valign=\"top\" colspan=\"4\" rowspan=\"1\" style=\"word-break: break-all;\"><h4><span style=\";font-family:宋体\">进度计划：</span></h4><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>2017年1月12日，学习springboot的开发方式。</p></li><li><p>2017年2月15日，开始搭建结构框架。</p></li><li><p>2017年2月18日，编写逻辑，同时做前段的结合。</p></li></ol><p><span style=\";font-family:宋体\"><br/></span><br/></p><p><span style=\";font-family:宋体\"><br/></span></p></td></tr><tr><td valign=\"top\" colspan=\"4\" rowspan=\"1\" style=\"word-break: break-all;\"><h4><span style=\";font-family:宋体\">拟提供成果及成果形式：</span></h4><p><span style=\";font-family:宋体\"><span style=\"font-size:14px;font-family:宋体\">成果是一个项目文件，同时程序能运行在学校的服务器上</span></span></p><p><span style=\";font-family:宋体\"><br/></span></p></td></tr><tr><td valign=\"top\" style=\"word-break: break-all;\" colspan=\"4\"><h4><span style=\";font-family:宋体\">经费预算：（包括</span><span style=\"font-family:宋体\">分析测试费、实验材料费</span><span style=\";font-family:宋体\">、</span><span style=\"font-family:宋体\">图书资料费</span><span style=\";font-family:宋体\">等）：</span></h4><p><span style=\";font-family:宋体\"><span style=\"font-size:14px;font-family:宋体\">预算在</span><span style=\"font-size:14px;font-family:&#39;Times New Roman&#39;,&#39;serif&#39;\">3000</span><span style=\"font-size:14px;font-family:宋体\">元左右。</span></span></p><p><span style=\";font-family:宋体\"><br/></span></p></td></tr></tbody></table><p><br/></p>',NULL,1,11),(5,'信息管理系统',NULL,NULL,'\0',NULL,'\0',NULL,'\0','\0',NULL,'2017-03-12 13:56:10','<p><span style=\"font-size: 16px;\"><font face=\"仿宋_GB2312\">&nbsp; &nbsp;&nbsp;</font></span><span style=\"font-size: 16px;font-family: 宋体\"> &nbsp;</span><strong><span style=\"font-size:21px;font-family:黑体\">攀枝花学院大学生创新创业训练计划项目申请表</span></strong></p><table width=\"588\"><tbody><tr style=\";page-break-inside:avoid;height:39px\" class=\"firstRow\"><td width=\"96\" style=\"border-width: 2px 1px 1px 2px; border-color: windowtext; padding: 0px 7px;\"><p style=\"text-align:center\"><span style=\";font-family:宋体\">项目名称</span></p></td><td width=\"492\" colspan=\"5\" style=\"border-top-width: 2px; border-top-color: windowtext; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 2px; border-right-color: windowtext; padding: 0px 7px;\"><p><span style=\";font-family:宋体\">基于</span>springboot<span style=\";font-family:宋体\">的框架的大学生创新创业项目信息管理系统</span></p></td></tr><tr style=\";page-break-inside:avoid;height:30px\"><td width=\"588\" colspan=\"6\" style=\"border-top: none; border-left-width: 2px; border-left-color: windowtext; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 2px; border-right-color: windowtext; padding: 0px 7px;\"><p style=\"text-align:center\"><span style=\";font-family:宋体\">申请小组成员</span></p></td></tr><tr style=\";page-break-inside:avoid;height:30px\"><td width=\"96\" style=\"border-top: none; border-left-width: 2px; border-left-color: windowtext; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;\"><p style=\"text-align:center\"><span style=\";font-family:宋体\">申请人姓名</span></p></td><td width=\"192\" colspan=\"2\" style=\"border-top: none; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;\"><p style=\"text-align:center\"><span style=\";font-family:宋体\">专</span>&nbsp;&nbsp;&nbsp; <span style=\";font-family:宋体\">业</span></p></td><td width=\"72\" style=\"border-top: none; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;\"><p style=\"text-align:center\"><span style=\";font-family:宋体\">学</span>&nbsp; <span style=\";font-family:宋体\">号</span></p></td><td width=\"228\" colspan=\"2\" style=\"border-top: none; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 2px; border-right-color: windowtext; padding: 0px 7px;\"><p style=\"text-align:center\"><span style=\";font-family:宋体\">班</span>&nbsp; <span style=\";font-family:宋体\">级</span></p></td></tr><tr style=\";height:29px\"><td width=\"96\" style=\"border-top: none; border-left-width: 2px; border-left-color: windowtext; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;\"><p style=\"text-align:center\"><span style=\";font-family:宋体\">杨智强</span></p></td><td width=\"192\" colspan=\"2\" style=\"border-top: none; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;\"><p style=\"text-align:center\"><span style=\";font-family:宋体\">计算机科学与技术</span></p></td><td width=\"72\" style=\"border-top: none; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;\"><p style=\"text-align:center\">20131687</p></td><td width=\"228\" colspan=\"2\" style=\"border-top: none; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 2px; border-right-color: windowtext; padding: 0px 7px;\"><p style=\"text-align:center\">14<span style=\";font-family:宋体\">级</span>1<span style=\";font-family:宋体\">班</span></p></td></tr><tr style=\";height:30px\"><td width=\"96\" style=\"border-top: none; border-left-width: 2px; border-left-color: windowtext; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;\"><p style=\"text-align:center\"><span style=\";font-family:宋体\">胡立根</span>&nbsp;&nbsp;</p></td><td width=\"192\" colspan=\"2\" style=\"border-top: none; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;\"><p style=\"text-align:center\"><span style=\";font-family:宋体\">网络工程</span>&nbsp;</p></td><td width=\"72\" style=\"border-top: none; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;\"><p style=\"text-align:center\">201410803007</p></td><td width=\"228\" colspan=\"2\" style=\"border-top: none; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 2px; border-right-color: windowtext; padding: 0px 7px;\"><p style=\"text-align:center\">14<span style=\";font-family:宋体\">级</span>1<span style=\";font-family:宋体\">班</span></p></td></tr><tr style=\";height:30px\"><td width=\"96\" style=\"border-top: none; border-left-width: 2px; border-left-color: windowtext; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;\"><p style=\"text-align:center\"><span style=\";font-family:宋体\">李思茂</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</p></td><td width=\"192\" colspan=\"2\" style=\"border-top: none; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;\"><p style=\"text-align:center\"><span style=\";font-family:宋体\">网络工程</span>&nbsp;&nbsp;</p></td><td width=\"72\" style=\"border-top: none; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;\"><p style=\"text-align:center\">201410803018</p></td><td width=\"228\" colspan=\"2\" style=\"border-top: none; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 2px; border-right-color: windowtext; padding: 0px 7px;\"><p style=\"text-align:center\">14<span style=\";font-family:宋体\">级</span>1<span style=\";font-family:宋体\">班</span></p></td></tr><tr style=\";height:30px\"><td width=\"96\" style=\"border-top: none; border-left-width: 2px; border-left-color: windowtext; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;\"><br/></td><td width=\"192\" colspan=\"2\" style=\"border-top: none; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;\"><br/></td><td width=\"72\" style=\"border-top: none; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;\"><br/></td><td width=\"228\" colspan=\"2\" style=\"border-top: none; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 2px; border-right-color: windowtext; padding: 0px 7px;\"><br/></td></tr><tr style=\";height:30px\"><td width=\"96\" style=\"border-top: none; border-left-width: 2px; border-left-color: windowtext; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;\"><br/></td><td width=\"192\" colspan=\"2\" style=\"border-top: none; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;\"><br/></td><td width=\"72\" style=\"border-top: none; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;\"><br/></td><td width=\"228\" colspan=\"2\" style=\"border-top: none; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 2px; border-right-color: windowtext; padding: 0px 7px;\"><br/></td></tr><tr style=\";height:36px\"><td width=\"96\" style=\"border-top: none; border-left-width: 2px; border-left-color: windowtext; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;\"><p style=\"text-align:center\"><span style=\";font-family:宋体\">指导教师</span></p></td><td width=\"168\" style=\"border-top: none; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;\"><br/></td><td width=\"133\" colspan=\"3\" style=\"border-top: none; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;\"><p style=\"text-align:center\"><span style=\";font-family:宋体\">职</span> <span style=\";font-family:宋体\">称</span></p></td><td width=\"191\" style=\"border-top: none; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 2px; border-right-color: windowtext; padding: 0px 7px;\"><br/></td></tr><tr style=\";height:30px\"><td width=\"96\" style=\"border-top: none; border-left-width: 2px; border-left-color: windowtext; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;\"><p style=\"text-align:center\"><span style=\";font-family:宋体\">实验室名称</span></p></td><td width=\"168\" style=\"border-top: none; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;\"><br/></td><td width=\"133\" colspan=\"3\" style=\"border-top: none; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;\"><p style=\"text-align:center\"><span style=\";font-family:宋体\">所属教学单位</span></p></td><td width=\"191\" style=\"border-top: none; border-left: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 2px; border-right-color: windowtext; padding: 0px 7px;\"><br/></td></tr><tr style=\";page-break-inside:avoid;height:120px\"><td width=\"588\" colspan=\"6\" valign=\"top\" style=\"border-top: none; border-left-width: 2px; border-left-color: windowtext; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 2px; border-right-color: windowtext; padding: 0px 7px;\"><p><span style=\";font-family:宋体\">研究现状：</span></p><p><span style=\";font-family:宋体\">学校每年都开展创新创业项目申请，但是由于项目的申请都是通过纸质申请，申请过于麻烦，同时申请的项目不方便管理，所以决定做一个基于</span>springboot<span style=\";font-family:宋体\">的创新创业项目管理系统，能够更方便同时利于管理。</span></p></td></tr><tr style=\";page-break-inside:avoid;height:155px\"><td width=\"588\" colspan=\"6\" valign=\"top\" style=\"border-top: none; border-left-width: 2px; border-left-color: windowtext; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 2px; border-right-color: windowtext; padding: 0px 7px;\"><p><span style=\";font-family:宋体\">研究方案：</span></p><p><span style=\";font-family:宋体\">通过</span>java+springboot<span style=\";font-family:宋体\">的做网站的开发能够实现更方便的开发模式，同时具有一定的安全性。对创新创业项目的管理也能够一定方便。</span></p></td></tr><tr style=\";page-break-inside:avoid;height:154px\"><td width=\"588\" colspan=\"6\" valign=\"top\" style=\"border-top: none; border-left-width: 2px; border-left-color: windowtext; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 2px; border-right-color: windowtext; padding: 0px 7px;\"><p><span style=\";font-family:宋体\">创新点：</span></p><p style=\"margin-left:37px\"><span style=\";font-family:宋体\">1， </span><span style=\";font-family:宋体\">采用了现在流行的企业级开发方式。</span></p><p style=\"margin-left:37px\"><span style=\";font-family:楷体_GB2312\">2， </span><span style=\";font-family:楷体_GB2312\">敏捷的开发过程。</span></p><p style=\"margin-left:37px\"><span style=\";font-family:楷体_GB2312\">3， </span><span style=\";font-family:楷体_GB2312\">具有一定的安全性。</span></p></td></tr><tr style=\";page-break-inside:avoid;height:175px\"><td width=\"588\" colspan=\"6\" valign=\"top\" style=\"border-top: none; border-left-width: 2px; border-left-color: windowtext; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 2px; border-right-color: windowtext; padding: 0px 7px;\"><p><span style=\";font-family:宋体\">研究工作的条件保障（实验室、研究基地等）</span>&nbsp;&nbsp;</p><p>&nbsp;</p></td></tr><tr style=\";page-break-inside:avoid;height:166px\"><td width=\"588\" colspan=\"6\" valign=\"top\" style=\"border-top: none; border-left-width: 2px; border-left-color: windowtext; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 2px; border-right-color: windowtext; padding: 0px 7px;\"><p><span style=\";font-family:宋体\">进度计划：</span></p><p style=\"margin-left:37px\">1，<span style=\"font-variant-numeric: normal;font-stretch: normal;font-size: 9px;line-height: normal;font-family: &#39;Times New Roman&#39;\">&nbsp; </span>2017<span style=\";font-family:宋体\">年</span>1<span style=\";font-family:宋体\">月</span>12<span style=\";font-family:宋体\">日，学习</span>springboot<span style=\";font-family:宋体\">的开发方式。</span></p><p style=\"margin-left:37px\">2，<span style=\"font-variant-numeric: normal;font-stretch: normal;font-size: 9px;line-height: normal;font-family: &#39;Times New Roman&#39;\">&nbsp; </span>2017<span style=\";font-family:宋体\">年</span>2<span style=\";font-family:宋体\">月</span>15<span style=\";font-family:宋体\">日，开始搭建结构框架。</span></p><p style=\"margin-left:37px\">3，<span style=\"font-variant-numeric: normal;font-stretch: normal;font-size: 9px;line-height: normal;font-family: &#39;Times New Roman&#39;\">&nbsp; </span>2017<span style=\";font-family:宋体\">年</span>2<span style=\";font-family:宋体\">月</span>18<span style=\";font-family:宋体\">日，编写逻辑，同时做前段的结合。</span></p></td></tr><tr style=\";page-break-inside:avoid;height:166px\"><td width=\"588\" colspan=\"6\" valign=\"top\" style=\"border-top: none; border-left-width: 2px; border-left-color: windowtext; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 2px; border-right-color: windowtext; padding: 0px 7px;\"><p><span style=\";font-family:宋体\">拟提供成果及成果形式：</span></p><p><span style=\";font-family:宋体\">成果是一个项目文件，同时程序能运行在学校的服务器上。</span></p></td></tr><tr style=\";page-break-inside:avoid;height:124px\"><td width=\"588\" colspan=\"6\" valign=\"top\" style=\"border-top: none; border-left-width: 2px; border-left-color: windowtext; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 2px; border-right-color: windowtext; padding: 0px 7px;\"><p><span style=\";font-family:宋体\">经费预算：（包括</span><span style=\"font-family:宋体\">分析测试费、实验材料费</span><span style=\";font-family:宋体\">、</span><span style=\"font-family:宋体\">图书资料费</span><span style=\";font-family:宋体\">等）</span></p><p><span style=\";font-family:宋体\">预算在</span>3000<span style=\";font-family:宋体\">元左右。</span></p></td></tr><tr style=\";page-break-inside:avoid;height:134px\"><td width=\"588\" colspan=\"6\" valign=\"top\" style=\"border-right-width: 2px; border-bottom-width: 2px; border-left-width: 2px; border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; border-top: none; padding: 0px 7px;\"><p><span style=\";font-family:宋体\">院（系）负责人意见：</span></p><p>&nbsp;</p><p>&nbsp;</p><p style=\"text-indent:294px;line-height:150%\"><span style=\";line-height:150%;font-family:宋体\">负责人签字：</span><span style=\";line-height:150%\"> <span style=\"text-decoration:underline;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></p><p style=\"text-indent:336px;line-height:150%\"><span style=\"text-decoration:underline;\"><span style=\";line-height:150%\">&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style=\";line-height:150%;font-family:宋体\">年</span><span style=\"text-decoration:underline;\"><span style=\";line-height:150%\">&nbsp;&nbsp; </span></span><span style=\";line-height:150%;font-family:宋体\">月</span><span style=\"text-decoration:underline;\"><span style=\";line-height:150%\">&nbsp;&nbsp; </span></span><span style=\";line-height:150%;font-family:宋体\">日</span></p></td></tr><tr style=\";page-break-inside:avoid;height:102px\"><td width=\"588\" colspan=\"6\" valign=\"top\" style=\"border-right-width: 2px; border-bottom-width: 2px; border-left-width: 2px; border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; border-top: none; padding: 0px 7px;\"><p><span style=\";font-family:宋体\">学校主管部门意见</span></p><p style=\"text-indent:301px;line-height:150%\"><span style=\";line-height:150%;font-family:宋体\">负责人签字：</span><span style=\"text-decoration:underline;\"><span style=\";line-height:150%\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style=\";line-height:150%\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p style=\"text-indent:301px;line-height:150%\"><span style=\"text-decoration:underline;\"><span style=\";line-height:150%\">&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style=\";line-height:150%;font-family:宋体\">年</span><span style=\"text-decoration:underline;\"><span style=\";line-height:150%\">&nbsp;&nbsp; </span></span><span style=\";line-height:150%;font-family:宋体\">月</span><span style=\"text-decoration:underline;\"><span style=\";line-height:150%\">&nbsp;&nbsp; </span></span><span style=\";line-height:150%;font-family:宋体\">日</span></p></td></tr><tr><td width=\"92\" style=\"border-width: initial;border-style: none;border-color: initial\"><br/></td><td width=\"159\" style=\"border-width: initial;border-style: none;border-color: initial\"><br/></td><td width=\"23\" style=\"border-width: initial;border-style: none;border-color: initial\"><br/></td><td width=\"98\" style=\"border-width: initial;border-style: none;border-color: initial\"><br/></td><td width=\"35\" style=\"border-width: initial;border-style: none;border-color: initial\"><br/></td><td width=\"181\" style=\"border-width: initial;border-style: none;border-color: initial\"><br/></td></tr></tbody></table><p style=\"line-height:37px\">&nbsp;</p><p><br/></p>',NULL,1,11);
/*!40000 ALTER TABLE `pro_project` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_role_permission`
--

LOCK TABLES `pro_role_permission` WRITE;
/*!40000 ALTER TABLE `pro_role_permission` DISABLE KEYS */;
INSERT INTO `pro_role_permission` VALUES (48,7,22),(49,5,14),(82,4,22),(83,4,27),(84,3,8),(85,3,10),(86,3,4),(87,3,9),(88,3,27),(89,6,27),(90,6,22),(110,1,15),(111,1,22),(112,1,18),(113,1,29),(114,1,16),(115,1,14),(116,1,23),(117,1,20),(118,1,27),(119,1,32),(120,1,30);
/*!40000 ALTER TABLE `pro_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_table`
--

DROP TABLE IF EXISTS `pro_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tablename` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `table_value` longtext,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_table`
--

LOCK TABLES `pro_table` WRITE;
/*!40000 ALTER TABLE `pro_table` DISABLE KEYS */;
INSERT INTO `pro_table` VALUES (1,NULL,'申请表','<table width=\"-302\"><tbody><tr class=\"firstRow\"><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><h3>项目名称<br/></h3></td><td valign=\"top\" colspan=\"3\" rowspan=\"1\" style=\"word-break: break-all;\"><h3><br/></h3></td></tr><tr><td valign=\"top\" colspan=\"4\" style=\"word-break: break-all;\"><h3>申请小组成员</h3></td></tr><tr><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\"><h4>申请人姓名</h4></td><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\"><h4>专业<br/></h4></td><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\"><h4>学号<br/></h4></td><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\"><h4>班级</h4></td></tr><tr><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\"><br/></td><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\"><br/></td><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\"><br/></td><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\"><br/></td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><br/></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><br/></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><br/></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><br/></td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><br/></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><br/></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><br/></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><br/></td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><h4>指导老师：</h4></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\"><br/></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><h4>职称：<br/></h4></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\"><br/></td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><h4>实验室名称：<br/></h4></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><br/></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><h4>所属教学单位：<br/></h4></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\"><br/></td></tr><tr><td valign=\"top\" colspan=\"4\" rowspan=\"1\" style=\"word-break: break-all;\"><h4>研究现状：</h4><p><br/></p><p><br/></p><p><br/></p></td></tr><tr><td valign=\"top\" colspan=\"4\" rowspan=\"1\" style=\"word-break: break-all;\"><h4>研究方案：</h4><p><br/></p><p><br/></p></td></tr><tr><td valign=\"top\" colspan=\"4\" rowspan=\"1\" style=\"word-break: break-all;\"><h4>创新点：</h4><p><br/></p><p><br/></p></td></tr><tr><td valign=\"top\" colspan=\"4\" rowspan=\"1\" style=\"word-break: break-all;\"><h4><span style=\"font-size: 14px; font-family: 宋体;\">研究工作的条件保障（实验室、研究基地等）：</span></h4><p><span style=\"font-size: 14px; font-family: 宋体;\"><br/></span></p><p><span style=\"font-size: 14px; font-family: 宋体;\"><br/></span></p></td></tr><tr><td valign=\"top\" colspan=\"4\" rowspan=\"1\" style=\"word-break: break-all;\"><h4><span style=\"font-family: 宋体;\">进度计划：</span></h4><p><br/></p><p><span style=\"font-family: 宋体;\"><br/></span><br/></p><p><span style=\"font-family: 宋体;\"><br/></span></p></td></tr><tr><td valign=\"top\" colspan=\"4\" rowspan=\"1\" style=\"word-break: break-all;\"><h4><span style=\"font-family: 宋体;\">拟提供成果及成果形式：</span></h4><p><br/></p><p><span style=\"font-family: 宋体;\"><br/></span></p></td></tr><tr><td valign=\"top\" colspan=\"4\" style=\"word-break: break-all;\"><h4><span style=\"font-family: 宋体;\">经费预算：（包括</span><span style=\"font-family: 宋体;\">分析测试费、实验材料费</span><span style=\"font-family: 宋体;\">、</span><span style=\"font-family: 宋体;\">图书资料费</span><span style=\"font-family: 宋体;\">等）：</span></h4><p><br/></p><p><span style=\"font-family: 宋体;\"><br/></span></p></td></tr></tbody></table><p><br/></p>','applytable'),(2,NULL,'申请表','<table width=\"-302\"><tbody><tr class=\"firstRow\"><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><h3>项目名称<br/></h3></td><td valign=\"top\" colspan=\"3\" rowspan=\"1\" style=\"word-break: break-all;\"><h3><br/></h3></td></tr><tr><td valign=\"top\" colspan=\"4\" style=\"word-break: break-all;\"><h3>申请小组成员</h3></td></tr><tr><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\"><h4>申请人姓名</h4></td><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\"><h4>专业<br/></h4></td><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\"><h4>学号<br/></h4></td><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\"><h4>班级</h4></td></tr><tr><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\"><br/></td><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\"><br/></td><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\"><br/></td><td width=\"281\" valign=\"top\" style=\"word-break: break-all;\"><br/></td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><br/></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><br/></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><br/></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><br/></td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><br/></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><br/></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><br/></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><br/></td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><h4>指导老师：</h4></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\"><br/></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><h4>职称：<br/></h4></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\"><br/></td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><h4>实验室名称：<br/></h4></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><br/></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\"><h4>所属教学单位：<br/></h4></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\"><br/></td></tr><tr><td valign=\"top\" colspan=\"4\" rowspan=\"1\" style=\"word-break: break-all;\"><h4>研究现状：</h4><p><br/></p><p><br/></p><p><br/></p></td></tr><tr><td valign=\"top\" colspan=\"4\" rowspan=\"1\" style=\"word-break: break-all;\"><h4>研究方案：</h4><p><br/></p><p><br/></p></td></tr><tr><td valign=\"top\" colspan=\"4\" rowspan=\"1\" style=\"word-break: break-all;\"><h4>创新点：</h4><p><br/></p><p><br/></p></td></tr><tr><td valign=\"top\" colspan=\"4\" rowspan=\"1\" style=\"word-break: break-all;\"><h4><span style=\"font-size: 14px; font-family: 宋体;\">研究工作的条件保障（实验室、研究基地等）：</span></h4><p><span style=\"font-size: 14px; font-family: 宋体;\"><br/></span></p><p><span style=\"font-size: 14px; font-family: 宋体;\"><br/></span></p></td></tr><tr><td valign=\"top\" colspan=\"4\" rowspan=\"1\" style=\"word-break: break-all;\"><h4><span style=\"font-family: 宋体;\">进度计划：</span></h4><p><br/></p><p><span style=\"font-family: 宋体;\"><br/></span><br/></p><p><span style=\"font-family: 宋体;\"><br/></span></p></td></tr><tr><td valign=\"top\" colspan=\"4\" rowspan=\"1\" style=\"word-break: break-all;\"><h4><span style=\"font-family: 宋体;\">拟提供成果及成果形式：</span></h4><p><br/></p><p><span style=\"font-family: 宋体;\"><br/></span></p></td></tr><tr><td valign=\"top\" colspan=\"4\" style=\"word-break: break-all;\"><h4><span style=\"font-family: 宋体;\">经费预算：（包括</span><span style=\"font-family: 宋体;\">分析测试费、实验材料费</span><span style=\"font-family: 宋体;\">、</span><span style=\"font-family: 宋体;\">图书资料费</span><span style=\"font-family: 宋体;\">等）：</span></h4><p><br/></p><p><span style=\"font-family: 宋体;\"><br/></span></p></td></tr></tbody></table><p><br/></p>','applytable');
/*!40000 ALTER TABLE `pro_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_table_permission`
--

DROP TABLE IF EXISTS `pro_table_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_table_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3d193chaktqmqemv5heg5mp9o` (`table_id`),
  KEY `FK5ajdds791w9nkbqfr1eh5ej4g` (`permission_id`),
  CONSTRAINT `FK3d193chaktqmqemv5heg5mp9o` FOREIGN KEY (`table_id`) REFERENCES `pro_table` (`id`),
  CONSTRAINT `FK5ajdds791w9nkbqfr1eh5ej4g` FOREIGN KEY (`permission_id`) REFERENCES `pro_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_table_permission`
--

LOCK TABLES `pro_table_permission` WRITE;
/*!40000 ALTER TABLE `pro_table_permission` DISABLE KEYS */;
INSERT INTO `pro_table_permission` VALUES (1,2,4);
/*!40000 ALTER TABLE `pro_table_permission` ENABLE KEYS */;
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
  `chinese_name` varchar(45) DEFAULT NULL,
  `academy_id` int(11) DEFAULT NULL,
  `grade_id` int(11) DEFAULT NULL,
  `major_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKivedrvvi3fd98oma9xkcyf4ll` (`academy_id`),
  KEY `FKc9nf08360m4tn3jdep33jxh50` (`grade_id`),
  KEY `FKrd29l4k0hws48mbh15tnx259d` (`major_id`),
  CONSTRAINT `FKc9nf08360m4tn3jdep33jxh50` FOREIGN KEY (`grade_id`) REFERENCES `pro_grade` (`id`),
  CONSTRAINT `FKivedrvvi3fd98oma9xkcyf4ll` FOREIGN KEY (`academy_id`) REFERENCES `pro_academy` (`id`),
  CONSTRAINT `FKrd29l4k0hws48mbh15tnx259d` FOREIGN KEY (`major_id`) REFERENCES `pro_major` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_user`
--

LOCK TABLES `pro_user` WRITE;
/*!40000 ALTER TABLE `pro_user` DISABLE KEYS */;
INSERT INTO `pro_user` VALUES (1,'yangqiang1289','$2a$10$DnLAjEQLANW.HOMM8.iNpeyzYj5xkdfSAz4MxcGlmDwWEOjWPWFzG','2017-02-09 16:46:51','yangqiang1289@qq.com','http://baidu.com','杨智强',11,1,2),(2,'admin','$2a$10$LlAgw6N3rDG0aG/jQy3wreHX42PxNgsBR4/XKmt8sbbKLKWLIiY3i','2017-02-19 11:54:14','gtmdwh@qq.com','http://baidu.com','党伟华',11,NULL,NULL),(3,'532544220','$2a$10$MHlLxNHgkyhjAnO2BJtI.eJ2YlU8IqcDDtCWzO5da7zg9Fd6ksOr6','2017-02-22 13:27:16','zhangsan@qq.com','http://zhansan.com','张三',11,NULL,NULL),(4,'sykki','$2a$10$9EdfIZ2fjpn2VkuDC/jOIOATZ07v/QfJu4V8FkRRVF51HRwK5ws8a','2017-03-04 13:04:48','lisi@126.com','http://lisi.com','李四',12,4,5),(5,'yang','$2a$10$X.EGJ2NRxApWDu6ErD4t9e2B08tD4XlurV4yD/5VHhao1eVS.e5LW','2017-03-07 14:04:07','wangwu@outlook.com','http://wangwu.com','王五',11,NULL,NULL);
/*!40000 ALTER TABLE `pro_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_user_project`
--

DROP TABLE IF EXISTS `pro_user_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_user_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8nd22p1tshmckb32l68qggi8g` (`project_id`),
  KEY `FK3i50gausiy3ywvmu1wh6p2vu7` (`user_id`),
  CONSTRAINT `FK3i50gausiy3ywvmu1wh6p2vu7` FOREIGN KEY (`user_id`) REFERENCES `pro_user` (`id`),
  CONSTRAINT `FKeelj1tsp4o5gq4oyimfuw1i8n` FOREIGN KEY (`project_id`) REFERENCES `pro_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_user_project`
--

LOCK TABLES `pro_user_project` WRITE;
/*!40000 ALTER TABLE `pro_user_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `pro_user_project` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_user_role`
--

LOCK TABLES `pro_user_role` WRITE;
/*!40000 ALTER TABLE `pro_user_role` DISABLE KEYS */;
INSERT INTO `pro_user_role` VALUES (1,1,3),(5,3,4),(6,2,1),(9,4,3),(10,5,6);
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

-- Dump completed on 2017-03-14 16:39:35
