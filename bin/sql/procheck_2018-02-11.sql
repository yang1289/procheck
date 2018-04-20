-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_academy`
--

LOCK TABLES `pro_academy` WRITE;
/*!40000 ALTER TABLE `pro_academy` DISABLE KEYS */;
INSERT INTO `pro_academy` VALUES (11,'数学与计算机学院'),(12,'电气信息工程学院'),(13,'攀枝花学院');
/*!40000 ALTER TABLE `pro_academy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_applyuser`
--

DROP TABLE IF EXISTS `pro_applyuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_applyuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_grade` varchar(255) DEFAULT NULL,
  `apply_major` varchar(255) DEFAULT NULL,
  `apply_name` varchar(255) DEFAULT NULL,
  `apply_number` varchar(255) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKke3otu6gnrlwlc113acu41jml` (`project_id`),
  CONSTRAINT `FKke3otu6gnrlwlc113acu41jml` FOREIGN KEY (`project_id`) REFERENCES `pro_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_applyuser`
--

LOCK TABLES `pro_applyuser` WRITE;
/*!40000 ALTER TABLE `pro_applyuser` DISABLE KEYS */;
INSERT INTO `pro_applyuser` VALUES (13,'14级1班','计算机科学与技术','曾卫','20131687',NULL),(14,'14级2班','软件工程','杨智强','20131699',NULL),(19,'14级1班','计算机科学与技术','杨智强','20131687',NULL),(20,'14级1班','软件工程','张三','201420131687',NULL),(21,'14级一班','计算机科学与技术','杨志强','20131687',NULL),(22,'14级1班','计算机科学与技术','杨智强','20131687',NULL),(23,'14级2班','软件技术','陈前华','20140001',NULL),(26,'14级2班,14级1班','软件技术,计算机科学与技术','陈前华,杨智强','20140001,20131687',NULL);
/*!40000 ALTER TABLE `pro_applyuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_expenditure`
--

DROP TABLE IF EXISTS `pro_expenditure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_expenditure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `money` double NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcvvljy2a7td8n1x3mqqn6nwbk` (`project_id`),
  CONSTRAINT `FKcvvljy2a7td8n1x3mqqn6nwbk` FOREIGN KEY (`project_id`) REFERENCES `pro_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_expenditure`
--

LOCK TABLES `pro_expenditure` WRITE;
/*!40000 ALTER TABLE `pro_expenditure` DISABLE KEYS */;
INSERT INTO `pro_expenditure` VALUES (1,'书本,电脑',300,',',NULL),(10,'资料的打印费用',800,'',NULL),(11,'用于书籍资料的购买',1200,'',NULL),(12,'电脑',5000,'测试的时候需要用',NULL),(14,'资料费',300,'',NULL),(15,'阿斯顿发',3000,'',NULL);
/*!40000 ALTER TABLE `pro_expenditure` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_permission`
--

LOCK TABLES `pro_permission` WRITE;
/*!40000 ALTER TABLE `pro_permission` DISABLE KEYS */;
INSERT INTO `pro_permission` VALUES (1,'个人主页','index',0,NULL),(2,'项目申请','proapply',0,NULL),(3,'项目进展','proprocess',0,NULL),(4,'申请项目','project:apply',21,'/project/apply'),(5,'申请中的项目','project:applying',21,'/project/applying'),(6,'申请成功的项目','project:success',21,'/project/success'),(7,'申请失败的项目','project:fails',21,'/project/fails'),(8,'项目进展记录','proprocess:process',3,'/proprocess/process'),(9,'项目中期进展记录','proprocess:midreport',3,'/proprocess/midreport'),(10,'项目结项报告','proprocess:finreport',3,'/proprocess/finreport'),(11,'申请日期设置','setApplyTime',0,NULL),(12,'初始化管理','startManage',0,NULL),(13,'账号管理','user',0,NULL),(14,'账号列表','user:list',13,'/user/list'),(15,'设置申请日期','setApplyTime:set',11,'/setApplyTime/set'),(16,'初始化','startManage:initialization',12,'/startManage/initialization'),(17,'权限','permission',0,NULL),(18,'权限列表','permission:list',17,'/permission/list'),(19,'角色','role',0,NULL),(20,'角色列表','role:list',19,'/role/list'),(21,'项目','project',0,NULL),(22,'审核项目','project:checklist',21,'/project/checklist'),(23,'添加权限','permission:add',17,'/permission/add'),(25,'添加账户','user:add',13,'/user/add'),(26,'统计','statistics',0,NULL),(27,'项目列表','project:list',21,'/project/list'),(28,'学院','academy',0,NULL),(29,'学院列表','academy:list',28,'/academy/list'),(30,'添加学院信息','academy:add',28,'/academy/add'),(31,'表格','protable',0,NULL),(32,'表格设置','protable:add',31,'/protable/add'),(33,'数据备份管理','dataManage',0,NULL),(34,'数据备份列表','dataManage:list',33,'/dataManage/list'),(35,'发布项目','project:publish',21,'/project/publish');
/*!40000 ALTER TABLE `pro_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_progressplan`
--

DROP TABLE IF EXISTS `pro_progressplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_progressplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd3fls7gqcjs2vls0k71yjoymy` (`project_id`),
  CONSTRAINT `FKd3fls7gqcjs2vls0k71yjoymy` FOREIGN KEY (`project_id`) REFERENCES `pro_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_progressplan`
--

LOCK TABLES `pro_progressplan` WRITE;
/*!40000 ALTER TABLE `pro_progressplan` DISABLE KEYS */;
INSERT INTO `pro_progressplan` VALUES (1,'软件测试','','20131687',NULL),(2,'软件设计','','20171012',NULL),(3,'软件设计','','20171012',NULL),(4,'','','',NULL),(7,'完成软件的代码编写','无','2017年10月12日',NULL),(10,'调试bug，让程序基本没有什么问题','','2017-12-10',NULL),(11,'完成基本的系统','','2017-10-12',NULL),(12,'完成基本内容','','20171013',NULL),(13,'手动阀','','20171012',NULL);
/*!40000 ALTER TABLE `pro_progressplan` ENABLE KEYS */;
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
  `achievenment_method` longtext,
  `adviser` varchar(255) DEFAULT NULL,
  `create_point` longtext,
  `job_title` varchar(255) DEFAULT NULL,
  `lib_name` varchar(255) DEFAULT NULL,
  `search_condition` longtext,
  `search_condition_support` longtext,
  `search_plan` longtext,
  `teach_unit` varchar(255) DEFAULT NULL,
  `is_created` bit(1) NOT NULL,
  `need_check` bit(1) NOT NULL,
  `adviser_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpsj16xq3xfuun5jep8hq7gvm6` (`user_id`),
  KEY `FK2iuvnoy5fwtbtjn3sicx2oq49` (`academy_id`),
  KEY `FKd45vvhuxaiicecbt246qtc646` (`adviser_id`),
  CONSTRAINT `FK2iuvnoy5fwtbtjn3sicx2oq49` FOREIGN KEY (`academy_id`) REFERENCES `pro_academy` (`id`),
  CONSTRAINT `FKd45vvhuxaiicecbt246qtc646` FOREIGN KEY (`adviser_id`) REFERENCES `pro_user` (`id`),
  CONSTRAINT `FKpsj16xq3xfuun5jep8hq7gvm6` FOREIGN KEY (`user_id`) REFERENCES `pro_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_project`
--

LOCK TABLES `pro_project` WRITE;
/*!40000 ALTER TABLE `pro_project` DISABLE KEYS */;
INSERT INTO `pro_project` VALUES (7,'项目管理系统',NULL,'审核通过','','审核通过','','审核通过','','\0',NULL,'2017-10-07 09:59:29',NULL,NULL,1,11,'成果形式1\r\n成果形式3','罗学刚','创新点1\r\n创新点2','讲师','计算机实验室','研究现状1\r\n研究现状2','条件保障1\r\n条件保障2','研究方案1\r\n研究方案2','数学与计算机学院','','',3),(11,'测试项目',NULL,NULL,'\0',NULL,'\0',NULL,'\0','\0',NULL,'2017-08-31 18:50:12',NULL,NULL,1,11,'“儿子，冷不冷？”火腿的父亲在屋里听见我们的脚步声，隔着门帘喊道。\r\n\r\n虽然已经是初夏，但见面那天，天津气温骤降。我穿了件衬衫，仍然觉得有些凉意。\r\n\r\n火腿家住的是平房，院里停着一辆残疾人专用三轮车，主要是火腿的父亲用。他平时出远门，就骑这辆三轮车，近的话骑电瓶车。\r\n\r\n火腿不会骑。“我要会骑的话，早就出门接活了。”他的视力不行，反应也有点慢。\r\n\r\n火腿的父亲正在客厅看电视，见了我，热情地打招呼。客厅进门处摆着一个鱼缸，没有鱼。柜顶上摆着一排鸟笼，没有鸟。方桌上铺着一张白色的宣纸，旁边堆了厚厚一摞写满字的废纸。\r\n\r\n你们慢慢聊啊，火腿的父亲推着电瓶车走出院门，回头说了声。火腿的父亲以前和别人合伙开饭店，后来经营不下去，饭店倒了，他就到处给人打零工。前段时间在一家工厂的食堂做，做了一个多月，辞职回家，乘空把院里堆杂物的那间屋子清理出来，给火腿当书房用。','老师q','以前采访过不少身患残疾的玩家，视障者、听障者、脑瘫者、自闭症者。那时的我希望更多的人听见他们的声音、理解游戏带给他们的快乐。但渐渐地，我发现，人们的同情心来得快，去得也快，最后好像什么都没留下。可能是因为听了太多类似的故事，也可能是因为我写了太多无关紧要的细节。\r\n\r\n那些细节，我全都记得，像照片一样清晰。比如，有天晚上，我去一个自闭症孩子的家里采访，孩子的母亲留我吃饭。他们家很小，灯光昏暗。我们三个人坐在小桌前，孩子不肯好好吃饭，有点闹腾，母亲在旁边哄他。我心里难受，草草扒了几口饭。母亲问，是不是菜烧得不好吃。我说，天太热，吃不下，你们慢慢吃。放下碗筷后，我坐在旁边，看着他们家门旁供奉的一尊小小的佛像。\r\n\r\n和我以前采访的那些残障人士相比，火腿的症状算是轻的，生活基本不受影响。行走无需依靠工具，双手活动自如，智商没什么问题，也能够与他人正常交流。家里的经济条件，不算好，也不算差。\r\n\r\n朋友圈里的他，是一个有点逗逼又有点念旧的人。篮球、日剧、古龙、游戏，是出现最频繁的四个话题，最近又加上了棒球。现实中，和火腿接触时，你能感觉到他身上有一股韧劲。自尊心强，不愿麻烦别人，又比较在意别人对他的看法，所以，很多情绪，只能自己消化。总之，火腿的性格和经历，不怎么符合主流媒体报道残障人士时所热衷于表达的那些价值观。\r\n\r\n采访火腿，不是出于同情，也不是因为励志，而是为了某种意义上的平等。听起来有点冠冕堂皇，但确实如此。同情很容易变成居高临下的俯视。人们可以毫不吝啬地为自己的同情心买单，却不一定能够包容在公众场合突然发作的自闭症者；人们愿意在网上欣赏并分享脑瘫患者的画作，却不一定愿意了解真实的他们或是在现实中同他们打交道。平等的概念则要具体得多，有一些切实可行的规则。例如，给残障人士一条能够自由进出的无障碍通道，给他们一个可以自由发言的无障碍平台，不要用奇怪的眼光盯着他们看，不要把他们同这个社会隔离开来，给予他们同等的被报道的机会，给予他们同等的入学或就业机会。','讲师','计算机实验室','我是在微博上认识火腿的。他的微博头像是日本女子偶像团体AKB48的前成员之一板野友美。板野友美的脸微微侧着，露齿而笑。“你的笑，是最美的阳光。”这是火腿最常发的一条微博，配以板野友美的若干照片。\r\n\r\n还有一句，“做好自己能做的事，别想没用的，好好活着”，也经常出现在他的微博上。他的微博没什么人看，所以我想，这句话应该是他写给自己的。\r\n\r\n见面后，我们在火腿家附近的一间奶茶店坐了会儿。火腿是个脾气温和的人，客客气气，话不多，语速、动作都比较慢。离开奶茶店后，他去旁边的电脑维修店买了副十几块钱的耳塞，和店主寒暄了几句，然后带我去了他家。','机核的那句口号，“玩游戏的，都是朋友”，体现的就是一种平等。无论健康与否，无论性别、年龄、种族、信仰、阶层如何，无论全机种制霸、每天花四五个小时玩游戏的重度玩家，还是只有一台掌机、每天只能利用碎片时间玩游戏的轻度玩家，都是朋友。\r\n\r\n既然是朋友，就不该有什么条条框框。见个面，聊聊天，把谈话过程记下来，不一定非得有什么意义。\r\n\r\n所以，我还是把火腿的故事写了下来。很短，用火腿的话说，差不多四百字就能讲完。','我是在微博上认识火腿的。他的微博头像是日本女子偶像团体AKB48的前成员之一板野友美。板野友美的脸微微侧着，露齿而笑。“你的笑，是最美的阳光。”这是火腿最常发的一条微博，配以板野友美的若干照片。\r\n\r\n还有一句，“做好自己能做的事，别想没用的，好好活着”，也经常出现在他的微博上。他的微博没什么人看，所以我想，这句话应该是他写给自己的。\r\n\r\n见面后，我们在火腿家附近的一间奶茶店坐了会儿。火腿是个脾气温和的人，客客气气，话不多，语速、动作都比较慢。离开奶茶店后，他去旁边的电脑维修店买了副十几块钱的耳塞，和店主寒暄了几句，然后带我去了他家。','数学与计算机学院','','',3),(12,'项目123',NULL,'审核OK','','ok','',NULL,'\0','\0',NULL,'2017-10-07 10:58:06',NULL,NULL,4,12,'以管理员身份运行cmd（一定要用管理员身份运行，不然权限不够），\r\n输入：cd C:\\Program Files\\MySQL\\MySQL Server 5.6\\bin 进入mysql的bin文件夹(不管有没有配置过环境变量，也要进入bin文件夹，否则之后启动服务仍然会报错误2)\r\n输入mysqld -install(如果不用管理员身份运行，将会因为权限不够而出现错误：Install/Remove of the Service Denied!) \r\n安装成功',NULL,'完成上述步骤之后，很多用户开始使用MySQL，但会出现图示的错误。这是因为没有配置环境变量所致。配置环境变量很简单：\r\n我的电脑->属性->高级->环境变量\r\n选择PATH,在其后面添加: 你的mysql bin文件夹的路径 (如:C:\\Program Files\\MySQL\\MySQL Server 5.6\\bin )\r\nPATH=.......;C:\\Program Files\\MySQL\\MySQL Server 5.6\\bin (注意是追加,不是覆盖)','讲师','计算机实验室','MySQL安装文件分为两种，一种是msi格式的，一种是zip格式的。如果是msi格式的可以直接点击安装，按照它给出的安装提示进行安装（相信大家的英文可以看懂英文提示），一般MySQL将会安装在C:\\Program Files\\MySQL\\MySQL Server 5.6 该目录中；zip格式是自己解压，解压缩之后其实MySQL就可以使用了，但是要进行配置。','配置完环境变量之后先别忙着启动mysql，我们还需要修改一下配置文件（如果没有配置，之后启动的时候就会出现图中的错误哦！:错误2 系统找不到文件），mysql-5.6.1X默认的配置文件是在C:\\Program Files\\MySQL\\MySQL Server 5.6\\my-default.ini，或者自己建立一个my.ini文件，\r\n在其中修改或添加配置（如图）： \r\n[mysqld] \r\nbasedir=C:\\Program Files\\MySQL\\MySQL Server 5.6（mysql所在目录） \r\ndatadir=C:\\Program Files\\MySQL\\MySQL Server 5.6\\data （mysql所在目录\\data）','解压之后可以将该文件夹改名，放到合适的位置，个人建议把文件夹改名为MySQL Server 5.6，放到C:\\Program Files\\MySQL路径中。当然你也可以放到自己想放的任意位置。','数学与计算机学院','','',8),(13,'test1',NULL,'手动阀啊','',NULL,'\0',NULL,'\0','\0',NULL,'2017-10-10 14:55:36',NULL,NULL,1,11,'撒地方阿斯蒂芬阿萨德',NULL,'撒地方阿萨德发到',' 讲师','计算机科学实验室','撒的发生','发到发斯蒂芬按时','水电费啊','数学与计算机学院','','',3),(14,'froalaTest',NULL,NULL,'\0',NULL,'\0',NULL,'\0','\0',NULL,'2017-10-13 14:44:09',NULL,NULL,1,11,'<p>项目手动阀</p><p>sdafa&nbsp;</p><ol><li>编号1</li><li>编号2</li></ol>',NULL,'<p>项目手动阀</p><p>sdafa&nbsp;</p><ol><li>编号1</li><li>编号2</li></ol>','讲师','计算机科学实验室','<p>项目手动阀</p><p>sdafa&nbsp;</p><ol><li>编号1</li><li>编号2</li></ol>','<p>项目手动阀</p><p>sdafa&nbsp;</p><ol><li>编号1</li><li>编号2</li></ol>','<p>项目手动阀</p><p>sdafa&nbsp;</p><ol><li>编号1</li><li>编号2</li></ol>','数学与计算机学院','\0','\0',3);
/*!40000 ALTER TABLE `pro_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_project_applyuser`
--

DROP TABLE IF EXISTS `pro_project_applyuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_project_applyuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `applyuser_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm13vm5lwbewuoqfa5c7mglrvm` (`applyuser_id`),
  KEY `FKeudqfx3miukjvjnwgjdq2yv9e` (`project_id`),
  CONSTRAINT `FKeudqfx3miukjvjnwgjdq2yv9e` FOREIGN KEY (`project_id`) REFERENCES `pro_project` (`id`),
  CONSTRAINT `FKm13vm5lwbewuoqfa5c7mglrvm` FOREIGN KEY (`applyuser_id`) REFERENCES `pro_applyuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_project_applyuser`
--

LOCK TABLES `pro_project_applyuser` WRITE;
/*!40000 ALTER TABLE `pro_project_applyuser` DISABLE KEYS */;
INSERT INTO `pro_project_applyuser` VALUES (13,7,14),(14,7,13),(19,11,19),(20,12,20),(21,12,21),(22,13,22),(23,13,23),(26,14,26);
/*!40000 ALTER TABLE `pro_project_applyuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_project_expenditure`
--

DROP TABLE IF EXISTS `pro_project_expenditure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_project_expenditure` (
  `project_id` int(11) NOT NULL,
  `expenditure_id` int(11) NOT NULL,
  PRIMARY KEY (`project_id`,`expenditure_id`),
  KEY `FKj90xlrh1v676qmlrrxy7jrw05` (`expenditure_id`),
  CONSTRAINT `FKeiiq4rjme858bso6einunonld` FOREIGN KEY (`project_id`) REFERENCES `pro_project` (`id`),
  CONSTRAINT `FKj90xlrh1v676qmlrrxy7jrw05` FOREIGN KEY (`expenditure_id`) REFERENCES `pro_expenditure` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_project_expenditure`
--

LOCK TABLES `pro_project_expenditure` WRITE;
/*!40000 ALTER TABLE `pro_project_expenditure` DISABLE KEYS */;
INSERT INTO `pro_project_expenditure` VALUES (11,10),(11,11),(7,12),(12,14),(13,15);
/*!40000 ALTER TABLE `pro_project_expenditure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_project_progressplans`
--

DROP TABLE IF EXISTS `pro_project_progressplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_project_progressplans` (
  `project_id` int(11) NOT NULL,
  `progressplan_id` int(11) NOT NULL,
  PRIMARY KEY (`project_id`,`progressplan_id`),
  KEY `FKjmrhluv0e8w3e70i23ik5b28g` (`progressplan_id`),
  CONSTRAINT `FK5it2vs1aspocybkelp4tral60` FOREIGN KEY (`project_id`) REFERENCES `pro_project` (`id`),
  CONSTRAINT `FKjmrhluv0e8w3e70i23ik5b28g` FOREIGN KEY (`progressplan_id`) REFERENCES `pro_progressplan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_project_progressplans`
--

LOCK TABLES `pro_project_progressplans` WRITE;
/*!40000 ALTER TABLE `pro_project_progressplans` DISABLE KEYS */;
INSERT INTO `pro_project_progressplans` VALUES (7,7),(11,10),(11,11),(12,12),(13,13);
/*!40000 ALTER TABLE `pro_project_progressplans` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_role_permission`
--

LOCK TABLES `pro_role_permission` WRITE;
/*!40000 ALTER TABLE `pro_role_permission` DISABLE KEYS */;
INSERT INTO `pro_role_permission` VALUES (49,5,14),(82,4,22),(83,4,27),(89,6,27),(90,6,22),(173,3,8),(174,3,10),(175,3,27),(176,3,5),(177,3,4),(178,3,9),(179,3,6),(180,1,20),(181,1,23),(182,1,29),(183,1,30),(184,1,35),(185,1,22),(186,1,34),(187,1,14),(188,1,27),(189,1,15),(190,1,18),(191,1,16),(192,1,32),(193,7,27),(194,7,22);
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
  `education` varchar(255) DEFAULT NULL,
  `job_tile` varchar(255) DEFAULT NULL,
  `profession` varchar(255) DEFAULT NULL,
  `sex` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKivedrvvi3fd98oma9xkcyf4ll` (`academy_id`),
  KEY `FKc9nf08360m4tn3jdep33jxh50` (`grade_id`),
  KEY `FKrd29l4k0hws48mbh15tnx259d` (`major_id`),
  CONSTRAINT `FKc9nf08360m4tn3jdep33jxh50` FOREIGN KEY (`grade_id`) REFERENCES `pro_grade` (`id`),
  CONSTRAINT `FKivedrvvi3fd98oma9xkcyf4ll` FOREIGN KEY (`academy_id`) REFERENCES `pro_academy` (`id`),
  CONSTRAINT `FKrd29l4k0hws48mbh15tnx259d` FOREIGN KEY (`major_id`) REFERENCES `pro_major` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_user`
--

LOCK TABLES `pro_user` WRITE;
/*!40000 ALTER TABLE `pro_user` DISABLE KEYS */;
INSERT INTO `pro_user` VALUES (1,'yangqiang1289','$2a$10$DnLAjEQLANW.HOMM8.iNpeyzYj5xkdfSAz4MxcGlmDwWEOjWPWFzG','2017-02-09 16:46:51','yangqiang1289@qq.com','http://baidu.com','杨智强',11,1,2,NULL,NULL,NULL,''),(2,'admin','$2a$10$LlAgw6N3rDG0aG/jQy3wreHX42PxNgsBR4/XKmt8sbbKLKWLIiY3i','2017-02-19 11:54:14','gtmdwh@qq.com','http://baidu.com','党伟华',11,NULL,NULL,NULL,NULL,NULL,''),(3,'532544220','$2a$10$MHlLxNHgkyhjAnO2BJtI.eJ2YlU8IqcDDtCWzO5da7zg9Fd6ksOr6','2017-02-22 13:27:16','zhangsan@qq.com','http://zhansan.com','张三',11,NULL,NULL,NULL,NULL,NULL,''),(4,'sykki','$2a$10$9EdfIZ2fjpn2VkuDC/jOIOATZ07v/QfJu4V8FkRRVF51HRwK5ws8a','2017-03-04 13:04:48','lisi@126.com','http://lisi.com','李四',12,4,5,NULL,NULL,NULL,''),(5,'yang','$2a$10$X.EGJ2NRxApWDu6ErD4t9e2B08tD4XlurV4yD/5VHhao1eVS.e5LW','2017-03-07 14:04:07','wangwu@outlook.com','http://wangwu.com','王五',11,NULL,NULL,NULL,NULL,NULL,''),(6,'cpgroup','$2a$10$HWV58yAHIb9wTPQoTxmp4uV2fUg3FM3yq6hRIBAVQcLuW4N/WZy0i','2017-03-22 15:31:27','caocao@126.com','http://caocao.com','曹操',13,NULL,NULL,NULL,NULL,NULL,''),(7,'zhangsan','$2a$10$bieRdLveaMZTq1PlcMJ.2OG1yJxX8nWcHEdyPciO2XGkqFLH/jUAS','2017-08-28 22:04:16','zsf@qq.com','http://zsf.com','张三丰',13,NULL,NULL,NULL,NULL,NULL,''),(8,'adviser1','$2a$10$hBHOPMRayHyEjCW4/6Suo.NSqep1TRJRJf7fuM7tl7wAn2I4wXPbW','2017-08-31 17:18:53','laoshi1@qq.com','http://loashi.com','老师1',12,NULL,NULL,NULL,NULL,NULL,''),(9,'user1','$2a$10$1W6Cg09MpDcKkKb5OJzvIOEcUUvXBqM8ZMFgbF7zfp8T/V6qu3ovK','2017-10-07 09:37:42','yi@qq.com','http://1.com','一',13,NULL,NULL,NULL,NULL,NULL,''),(10,'fpgroup1','$2a$10$qvzED9qxfs0N2oLwO.5EnuCPpoQvt9NLQ0MIgcsgsFuNIxwt8942S','2017-10-07 11:09:03','fpgroup1@gmail.com','','fpgroup1',12,NULL,NULL,NULL,NULL,NULL,''),(11,'visitor','$2a$10$s9KAYngikf2NQ3cTcRMSEezTbhMvoCoacHTRb9P78Qc3ZOZCJNtw2','2017-10-11 15:38:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),(12,'20131687','$2a$10$nENywwZ1uZ3Ae1w6pCyZEOC.iPxWK3EESMC7wt4r0F/weja5vLDpC','2018-02-10 11:18:15',NULL,NULL,'杨智强',11,1,2,NULL,NULL,NULL,'\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_user_role`
--

LOCK TABLES `pro_user_role` WRITE;
/*!40000 ALTER TABLE `pro_user_role` DISABLE KEYS */;
INSERT INTO `pro_user_role` VALUES (1,1,3),(5,3,4),(6,2,1),(9,4,3),(10,5,6),(11,6,7),(13,7,1),(14,8,4),(15,9,7),(16,10,6),(17,12,3);
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

-- Dump completed on 2018-02-11 13:00:00
