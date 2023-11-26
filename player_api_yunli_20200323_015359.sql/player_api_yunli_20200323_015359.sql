-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: player_api_yunli
-- ------------------------------------------------------
-- Server version	5.7.29-log

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
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `id` varchar(32) NOT NULL,
  `name` varchar(30) DEFAULT NULL COMMENT '播放器名称',
  `user_id` varchar(32) DEFAULT NULL COMMENT '关联用户id',
  `auto_player` int(1) DEFAULT NULL COMMENT '是否自动播放',
  `random_player` int(1) DEFAULT NULL COMMENT '是否随机播放',
  `default_volume` int(3) DEFAULT NULL COMMENT '默认音量',
  `show_lrc` int(1) DEFAULT NULL COMMENT '是否显示歌词',
  `site_name` varchar(30) DEFAULT NULL COMMENT '站点名称  用于播放器显示名称',
  `greeting` varchar(30) DEFAULT NULL COMMENT '欢迎语',
  `show_greeting` int(1) DEFAULT NULL COMMENT '是否显示欢迎语',
  `default_album` int(3) DEFAULT NULL COMMENT '默认专辑',
  `background` int(1) DEFAULT NULL COMMENT '模糊背景是否开启',
  `player_width` int(11) DEFAULT '-1' COMMENT '播放器宽度',
  `cover_width` int(11) DEFAULT '-1' COMMENT '封面图宽度',
  `show_notes` int(1) DEFAULT '1' COMMENT '显示音符：0不显示1显示',
  `auto_popup_player` int(11) DEFAULT '-1' COMMENT '几秒后弹出音符：-1不弹出 >0秒后弹出',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES ('0498d1be7d404ed2b87e32d469915397','音乐播放器','b05e53e61d074a97a0241f3a8fee81cd',1,1,75,1,'IT技术宅','欢迎光临寒舍！',1,1,1,-1,-1,1,-1,NULL),('1c047fe0dc1d43118ffe89caf5efc4f4','云凌阁','1',0,1,25,1,'云凌阁','欢迎光临寒舍！',1,1,1,-1,-1,1,-1,NULL),('5e24f264780b4c229dbb08fcd0a9a722','播放器','925da2c8b2174f298869ae6ece63c628',1,1,50,1,'最美女人圈','欢迎光临寒舍！',1,1,1,-1,-1,1,-1,NULL),('d32b538279cc4bab8459604532bac93c','音乐盒','a988e40a07bc4242bef9a998aa8280a1',1,1,75,1,'小幼掌上通','欢迎光临寒舍！',1,1,0,-1,-1,1,-1,NULL),('d49ae851f7fd4583b5f7897e489b1e4e','音乐','2c8f6de5a8b64c03a51d0eb6bcf9c588',1,1,50,0,'云凌社区','欢迎光临寒舍！',0,1,1,-1,-1,-1,-1,NULL);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_song_sheet`
--

DROP TABLE IF EXISTS `player_song_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_song_sheet` (
  `player_id` varchar(32) DEFAULT NULL COMMENT '播放器id',
  `song_sheet_id` varchar(32) DEFAULT NULL COMMENT '歌单id',
  `taxis` int(3) DEFAULT NULL COMMENT '排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_song_sheet`
--

LOCK TABLES `player_song_sheet` WRITE;
/*!40000 ALTER TABLE `player_song_sheet` DISABLE KEYS */;
INSERT INTO `player_song_sheet` VALUES ('1c047fe0dc1d43118ffe89caf5efc4f4','bc7a82b0020d45289d9ce9b9b3e0c43c',0),('d49ae851f7fd4583b5f7897e489b1e4e','e433d86e33cd4dbba5b7b603faa1c4ec',0),('5e24f264780b4c229dbb08fcd0a9a722','0b0dc71471ca477a8fa96770c3dd0535',0),('d32b538279cc4bab8459604532bac93c','7b3110ef1a214b66a8cb8f60acc83dc6',0),('d32b538279cc4bab8459604532bac93c','f13ba7a68341438c9515e4387be5f7f4',1);
/*!40000 ALTER TABLE `player_song_sheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song` (
  `id` varchar(32) NOT NULL,
  `song_id` varchar(32) DEFAULT NULL COMMENT '歌曲id',
  `song_sheet_id` varchar(32) DEFAULT NULL COMMENT '所属歌单',
  `name` varchar(100) DEFAULT NULL COMMENT '歌曲名称',
  `type` varchar(10) DEFAULT NULL COMMENT '歌曲类型',
  `album_name` varchar(100) DEFAULT NULL COMMENT '专辑名称',
  `artist_name` varchar(100) DEFAULT NULL COMMENT '歌手名称',
  `album_cover` varchar(100) DEFAULT NULL COMMENT '专辑图片',
  `location` varchar(150) DEFAULT NULL COMMENT '歌曲地址',
  `lyric` varchar(100) DEFAULT NULL COMMENT '歌词地址',
  `taxis` int(3) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES ('00c16b0589de4a54bcadf3a61b711b7d','25657361','e433d86e33cd4dbba5b7b603faa1c4ec','傻瓜','wy','我的歌声里','李代沫','https://p1.music.126.net/Y_fa89dGcUwimGXb4TSKYQ==/109951163169028103.jpg?param=300x300',NULL,NULL,21),('0d0284dd35ce497b880606ed2789e35d','864196929','bc7a82b0020d45289d9ce9b9b3e0c43c','Talk','wy','Talk','Why Don\'t We','https://p1.music.126.net/OZYrR35iQ4veyuG0k8Ow0Q==/109951163638703735.jpg?param=300x300',NULL,NULL,6),('0fbd749480d046e5b9998b6470938b6d','1361159651','9d1b3b80583e4b15a070f7e70261f648','你笑起来真好看 (合唱版)','wy','你笑起来真好看 (合唱版)','李昕融,中央少年广播合唱团','https://p2.music.126.net/jR-LLb2IY6tboptf8Y8N3A==/109951164105185202.jpg?param=300x300',NULL,NULL,1),('10fa99596ed24db5969ae3faf108d3e0','29814898','e433d86e33cd4dbba5b7b603faa1c4ec','可惜没如果','wy','新地球','林俊杰','https://p1.music.126.net/X0EDfXzxMQJiQ-71JFGdZw==/3238061746556733.jpg?param=300x300',NULL,NULL,14),('135263396ec746b7a1ebf3b543e68f66','1381303904','9d1b3b80583e4b15a070f7e70261f648','你是太阳我是星星-andy 杨璨（Cover：泰歌 小臭臭）','wy','尔音家族的孩子们第一季','尔音快乐家族','https://p1.music.126.net/seuzLbSuAIPF04qhBrbW7g==/109951164254762451.jpg?param=300x300',NULL,NULL,0),('1ee1f08278ce49fa9f1c8d5afb980fc1','1406809993','e433d86e33cd4dbba5b7b603faa1c4ec','重演','wy','重演','王巨星','https://p2.music.126.net/nqw7mcUKGY-I4aKTtC9BZA==/109951164519394300.jpg?param=300x300',NULL,NULL,6),('204def84540c4d89a0cf23dd9235418f','33340067','e433d86e33cd4dbba5b7b603faa1c4ec','默','wy','默','简弘亦','https://p1.music.126.net/J_7KkUP733Jzp_Te4lp_mQ==/109951164033795686.jpg?param=300x300',NULL,NULL,10),('235419336c3843ee8f92fe8f5c171607','1380646702','e433d86e33cd4dbba5b7b603faa1c4ec','风度（全网第一锦鲤）（Cover：汪苏泷）','wy','风度（cover：汪苏泷）','高鱼','https://p2.music.126.net/XN7bC3ortHldIQS51W_9wg==/109951164316766804.jpg?param=300x300',NULL,NULL,28),('2965b1a5775a427d8700d2cd265ffc8a','1382385235','e433d86e33cd4dbba5b7b603faa1c4ec','拜拜（Cover：浙音4811（一个大金意））','wy','拜拜','王巨星','https://p2.music.126.net/AY9cfpRmp5M3K1gBqvLF1w==/109951164269119670.jpg?param=300x300',NULL,NULL,2),('3e9acdd035e84745906a310bfecc854d','480517594','bc7a82b0020d45289d9ce9b9b3e0c43c','Hold Us Together','wy','Hold Us Together','WILD','https://p1.music.126.net/auzqCFarAiytWK8yqf8S7A==/17885755649290496.jpg?param=300x300',NULL,NULL,2),('444320d40a2a4eae90604504ab10c9a1','1396073496','e433d86e33cd4dbba5b7b603faa1c4ec','拾忆（抖音版）','wy','拾忆','王巨星','https://p2.music.126.net/b0NJ30nG8b3ctZotpnv_zw==/109951164439172599.jpg?param=300x300',NULL,NULL,8),('46e3d895d52e42f0916eedeecb79a57c','1385856956','e433d86e33cd4dbba5b7b603faa1c4ec','太阳','wy','太阳（完整版）','王巨星','https://p2.music.126.net/hWHt1pPaf3mxkO-vLQbhKg==/109951164400130453.jpg?param=300x300',NULL,NULL,9),('4da8b66e977d4bb6ac8b9abd43ddccc4','449577226','e433d86e33cd4dbba5b7b603faa1c4ec','你就不要想起我','wy','你就不要想起我','简弘亦','https://p2.music.126.net/m9psWT0vrunTgxY3NeEXUg==/109951164694992804.jpg?param=300x300',NULL,NULL,11),('53d3809269634d4a9bfa622b1de2f204','1361159651','f13ba7a68341438c9515e4387be5f7f4','你笑起来真好看 (合唱版)','wy','你笑起来真好看 (合唱版)','李昕融,中央少年广播合唱团','https://p1.music.126.net/jR-LLb2IY6tboptf8Y8N3A==/109951164105185202.jpg?param=300x300',NULL,NULL,0),('58e4d4606d9245d4b43ce4f055f85861','429769189','0b0dc71471ca477a8fa96770c3dd0535','青鸟-钢琴版 ','wy','最新热歌慢摇118','Animenz','https://p1.music.126.net/y5Z-8Vnz6DVLQkDKdn2Hpw==/109951163927003280.jpg?param=300x300',NULL,NULL,0),('59a152bf8e5f45fcb4eb70d91f31a6b6','31010566','bc7a82b0020d45289d9ce9b9b3e0c43c','Sold Out','wy','Diamonds','Hawk Nelson','https://p1.music.126.net/UR8jAfqus_o1j_QkaYkZ_g==/109951163664241365.jpg?param=300x300',NULL,NULL,1),('5effde39bd6945d08ad7a54efec6c4fb','25641187','e433d86e33cd4dbba5b7b603faa1c4ec','如果没有你','wy','中国好声音第一季澳门演唱会','李代沫','https://p1.music.126.net/ghSaDKtWhHE1xDWlN_zgSg==/763061069718043.jpg?param=300x300',NULL,NULL,20),('5f5e5c28a03040689192d9643fa492bf','427542143','bc7a82b0020d45289d9ce9b9b3e0c43c','Cutting Shapes','wy','Cutting Shapes','Don Diablo','https://p1.music.126.net/iy45NywFpdf7W9NZbVN67Q==/109951163111734324.jpg?param=300x300',NULL,NULL,3),('6088002d2adf4a7fa4e692291eda9d51','1365467627','e433d86e33cd4dbba5b7b603faa1c4ec','心仪（Cover：徐秉龙）','wy','Cover 1','千里狗','https://p2.music.126.net/6N3LfKrWgiDxFatdZko6Yw==/109951164075911446.jpg?param=300x300',NULL,NULL,0),('6ed60ce30934403295674b1fa296d37e','108138','e433d86e33cd4dbba5b7b603faa1c4ec','那些你很冒险的梦','wy','学不会','林俊杰','https://p1.music.126.net/nQUhiSnK620HHLbZwnrJ3g==/109951163298363015.jpg?param=300x300',NULL,NULL,15),('6efb90de889749758b52ce88b32025ff','1369383684','e433d86e33cd4dbba5b7b603faa1c4ec','化身孤岛的鲸（Cover：群星）','wy','化身孤岛的鲸','王巨星','https://p2.music.126.net/iezjJlf0Rb3VtCS8LUCsRw==/109951164119675165.jpg?param=300x300',NULL,NULL,1),('7ee7c6cb3de24d5da9794df8ac307f6e','1396073496','e433d86e33cd4dbba5b7b603faa1c4ec','拾忆（抖音版）','wy','拾忆','王巨星','https://p2.music.126.net/b0NJ30nG8b3ctZotpnv_zw==/109951164439172599.jpg?param=300x300',NULL,NULL,32),('7f3071e48ca6438c9be81270ef7ccb76','1321575661','bc7a82b0020d45289d9ce9b9b3e0c43c','Xenogenesis','wy','Sounds of Syndication, Vol. 2 (Presented by Syndicate)','TheFatRat','https://p1.music.126.net/BlnTFWk2LGIoRVLUNcn1vw==/109951163635080334.jpg?param=300x300',NULL,NULL,4),('86e1296a01bd4324bea7f8427463a5ba','27553170','bc7a82b0020d45289d9ce9b9b3e0c43c','Tremble (Original Mix)','wy','Tremble','Vicetone','https://p1.music.126.net/MG_0axVwGBRge5PNaDVUEA==/109951163354311680.jpg?param=300x300',NULL,NULL,0),('88e3292f9832401eaa2450881289f224','484365611','bc7a82b0020d45289d9ce9b9b3e0c43c','Parties','wy','2:00am in LA','Jake Miller','https://p2.music.126.net/P3c_pg1RI5KXw7DFxGEh0w==/109951163784021165.jpg?param=300x300',NULL,NULL,12),('8ac350a13e5b45eea26af94e51738e94','25657364','e433d86e33cd4dbba5b7b603faa1c4ec','我是不是你最疼爱的人','wy','我的歌声里','李代沫','https://p1.music.126.net/Y_fa89dGcUwimGXb4TSKYQ==/109951163169028103.jpg?param=300x300',NULL,NULL,17),('8be2ad18cdad48ca9c5f4c26095657e5','1381303904','7b3110ef1a214b66a8cb8f60acc83dc6','你是太阳我是星星-andy 杨璨（Cover：泰歌 小臭臭）','wy','尔音家族的孩子们第一季','尔音快乐家族','https://p2.music.126.net/seuzLbSuAIPF04qhBrbW7g==/109951164254762451.jpg?param=300x300',NULL,NULL,0),('8fc67225ca37412d92886268c7ed3c72','1374086946','bc7a82b0020d45289d9ce9b9b3e0c43c','放个大招给你看','wy','放个大招给你看','永彬Ryan.B','https://p1.music.126.net/dM5UkUR6auof6V6Q8CdloQ==/109951164173169271.jpg?param=300x300',NULL,NULL,5),('93dfa97e65694accb795d59addde334c','511678913','bc7a82b0020d45289d9ce9b9b3e0c43c','Sucker for You','wy','Sucker for You','Matt Terry','https://p2.music.126.net/q7nbE35cIJC5pEo4gSQSdw==/18334356393745926.jpg?param=300x300',NULL,NULL,8),('96ce35dc5f4349cda102059f2ae89761','25650033','e433d86e33cd4dbba5b7b603faa1c4ec','遗憾','wy','遗憾','李代沫','https://p1.music.126.net/jEoJh6uUBsZCC_zncoPp2w==/938982930173076.jpg?param=300x300',NULL,NULL,24),('978115a7725c4abe9cb38f5f0a770fe7','1369303149','e433d86e33cd4dbba5b7b603faa1c4ec','放生（Cover：范逸臣）','wy','阳阳的弹唱第五弹','陈阳','https://p1.music.126.net/lY3OOz3MhuSRIGMVQ9WtdQ==/109951164118251096.jpg?param=300x300',NULL,NULL,30),('9e7496c97b6b45d0a744e83e0abf69fa','1421066886','e433d86e33cd4dbba5b7b603faa1c4ec','王巨星《关键词》（Cover：林俊杰）','wy','王巨星的翻唱集','王巨星','https://p2.music.126.net/vyVifQXEw_ovXBDyScCXZA==/109951164107215413.jpg?param=300x300',NULL,NULL,5),('a1b5db26d3fb416dbd6b1266ee82ff09','516323185','e433d86e33cd4dbba5b7b603faa1c4ec','这就是爱情','wy','你来 我在','李代沫','https://p1.music.126.net/RQBF9kqZb7PtLCaOxi9ngQ==/109951163053984533.jpg?param=300x300',NULL,NULL,25),('abeea35527234d69864cc0850c87523b','422428548','bc7a82b0020d45289d9ce9b9b3e0c43c','Landing Guy','wy','鱼干铺里','刘昊霖,kidult.','https://p2.music.126.net/2q8ThUAEszBuxGlGJz8XUw==/17731824021476100.jpg?param=300x300',NULL,NULL,7),('b18790e341d74002b139017c57f09d88','25657364','e433d86e33cd4dbba5b7b603faa1c4ec','我是不是你最疼爱的人','wy','我的歌声里','李代沫','https://p1.music.126.net/Y_fa89dGcUwimGXb4TSKYQ==/109951163169028103.jpg?param=300x300',NULL,NULL,23),('b3fd49f74b4c4c6795692f7e2bb0fe56','1408381837','e433d86e33cd4dbba5b7b603faa1c4ec','像极了（Cover：KARD）','wy','像极了','薛玺林','https://p1.music.126.net/4LRsFtTtyz9t_VrCcNwhZg==/109951164534782956.jpg?param=300x300',NULL,NULL,26),('bd2c547055e0479a8a865bcea70aef0d','108914','e433d86e33cd4dbba5b7b603faa1c4ec','江南','wy','第二天堂','林俊杰','https://p1.music.126.net/3jBJ00NEgPuhRFAYwErgag==/109951163533012556.jpg?param=300x300',NULL,NULL,12),('c0a63ed8b2894c6182a23fe9ab6e4b94','1365032837','e433d86e33cd4dbba5b7b603faa1c4ec','错的人(片段版)（Cover：萧亚轩）','wy','错的人','王泽科','https://p2.music.126.net/-Sx6DpOZRxlT-BBpx2ytFw==/109951164071691709.jpg?param=300x300',NULL,NULL,31),('c689c7d304134a189798494a0a6052af','108245','e433d86e33cd4dbba5b7b603faa1c4ec','爱笑的眼睛','wy','她说 概念自选辑','林俊杰','https://p1.music.126.net/peLODpaxX1Hl4RWYKR-34Q==/109951163071284933.jpg?param=300x300',NULL,NULL,13),('cfc08adca01349f889004c0fd2addedb','1379416556','e433d86e33cd4dbba5b7b603faa1c4ec','画','wy','画','王巨星','https://p2.music.126.net/XoOjqWvL3MUZIDADjoNacA==/109951164347163273.jpg?param=300x300',NULL,NULL,4),('d70e0bf4b49640fd9859ab6860757e83','1411576088','e433d86e33cd4dbba5b7b603faa1c4ec','情字难（男版）','wy','情字难 (男版)','王巨星','https://p2.music.126.net/zuinxxqLArVNf-zp6Kf1cg==/109951164575721512.jpg?param=300x300',NULL,NULL,3),('e43afab02a4644ec8971c6a1176561d0','1383742769','e433d86e33cd4dbba5b7b603faa1c4ec','有一种悲伤（治愈烟嗓）（Cover：A-Lin）','wy','那些情感','七元','https://p2.music.126.net/957fiIza19BvaE3g3O0P1A==/109951163911552327.jpg?param=300x300',NULL,NULL,29),('e44b775452b4416f925b351f764e114a','439139817','e433d86e33cd4dbba5b7b603faa1c4ec','为你我受冷风吹','wy','大壮首张限量定制翻唱','大壮','https://p2.music.126.net/dnRTxhaQ2Y_DoqrfwCpfJQ==/109951162806037796.jpg?param=300x300',NULL,NULL,27),('e5b7293109ad436cacf5ca05451785d6','28566210','bc7a82b0020d45289d9ce9b9b3e0c43c','Boom Clap','wy','The Fault In Our Stars (Music From the Motion Picture)','Charli XCX','https://p2.music.126.net/90VlOVM9DUe9HBVPvZ035g==/5936263278604377.jpg?param=300x300',NULL,NULL,10),('e7755bc0a3744c81abcecd47c7c75dec','456185577','bc7a82b0020d45289d9ce9b9b3e0c43c','Fractures','wy','Fractures','ILLENIUM,Nevve','https://p2.music.126.net/YgDqFhazYZ3s10RmkgIHzg==/18748872278605604.jpg?param=300x300',NULL,NULL,11),('eadb54c1daa1426ba55ec903bb3d430f','25657367','e433d86e33cd4dbba5b7b603faa1c4ec','我最亲爱的','wy','我的歌声里','李代沫','https://p1.music.126.net/Y_fa89dGcUwimGXb4TSKYQ==/109951163169028103.jpg?param=300x300',NULL,NULL,19),('eb31dec17fa84fc792a50889008e9951','26584214','e433d86e33cd4dbba5b7b603faa1c4ec','骨子里的我','wy','敏感者','李代沫','https://p1.music.126.net/nlmn2lfWroQRaDbTE5u1OQ==/109951163169023732.jpg?param=300x300',NULL,NULL,22),('ee383eeb04974310b9c49ea9e865a612','1369564749','e433d86e33cd4dbba5b7b603faa1c4ec','勿忘','wy','勿忘','李代沫','https://p1.music.126.net/XqOSNWrmwwoV4RbaRr5Tiw==/109951164358496806.jpg?param=300x300',NULL,NULL,18),('f17cddaf91a84cb2b342da49fb9dedf9','19192338','bc7a82b0020d45289d9ce9b9b3e0c43c','My Dilemma','wy','When The Sun Goes Down','Selena Gomez & The Scene','https://p2.music.126.net/Km-4SOHI1aJJHjiOe1gxqw==/6653144860633670.jpg?param=300x300',NULL,NULL,9),('fd9b88440b8a4067b4ea2fe2f8ad5cee','25650032','e433d86e33cd4dbba5b7b603faa1c4ec','到不了','wy','遗憾','李代沫','https://p1.music.126.net/jEoJh6uUBsZCC_zncoPp2w==/938982930173076.jpg?param=300x300',NULL,NULL,16),('ff457e25fdb343aaa9e46afa73779cdd','1415621951','e433d86e33cd4dbba5b7b603faa1c4ec','越界','wy','越界','王巨星','https://p2.music.126.net/P6nxsjx-qqkzS2OWUp5bnw==/109951164614547543.jpg?param=300x300',NULL,NULL,7);
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_sheet`
--

DROP TABLE IF EXISTS `song_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song_sheet` (
  `id` varchar(32) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `sheet_id` varchar(20) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL COMMENT '歌单所属用户',
  `name` varchar(30) DEFAULT NULL COMMENT '歌单名称',
  `author` varchar(30) DEFAULT NULL COMMENT '歌单作者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_sheet`
--

LOCK TABLES `song_sheet` WRITE;
/*!40000 ALTER TABLE `song_sheet` DISABLE KEYS */;
INSERT INTO `song_sheet` VALUES ('0b0dc71471ca477a8fa96770c3dd0535','sdtj','','925da2c8b2174f298869ae6ece63c628','青鸟','lbr57118794','2020-02-27 16:20:09'),('443c78e4b8744f2aa41f76fc0836850e','sdtj',NULL,'b05e53e61d074a97a0241f3a8fee81cd','音乐','Crusher','2020-02-28 20:55:24'),('7b3110ef1a214b66a8cb8f60acc83dc6','sdtj',NULL,'a988e40a07bc4242bef9a998aa8280a1','你是太阳','xiangyata','2020-02-28 20:39:22'),('bc7a82b0020d45289d9ce9b9b3e0c43c','wygd','3124655033','1','好听','admin','2020-02-19 04:17:57'),('e433d86e33cd4dbba5b7b603faa1c4ec','sdtj','','2c8f6de5a8b64c03a51d0eb6bcf9c588','yy','yunling','2020-02-23 12:26:42'),('f13ba7a68341438c9515e4387be5f7f4','sdtj',NULL,'a988e40a07bc4242bef9a998aa8280a1','你笑起来真好看','xiangyata','2020-02-28 20:47:09');
/*!40000 ALTER TABLE `song_sheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` varchar(32) NOT NULL,
  `username` varchar(20) DEFAULT NULL COMMENT '用户账号',
  `password` varchar(32) DEFAULT NULL COMMENT '用户密码',
  `qq` varchar(15) DEFAULT NULL COMMENT 'QQ号码',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱地址',
  `status` int(1) DEFAULT '1' COMMENT '状态 1:启用 0:禁用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_ip` varchar(32) DEFAULT NULL COMMENT '创建时ip',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1','admin','4e3cf2c7b11fb8d8011fbe523a5c2fd9','1','1',1,'2018-08-30 09:50:10','1','2020-02-29 09:28:36'),('2c8f6de5a8b64c03a51d0eb6bcf9c588','yunling','3b51470b078a5d99708338f69455c63c','1400585504',NULL,1,'2020-02-19 20:05:06','60.6.73.37','2020-03-01 12:22:02'),('818e95fc3bbd42f9ab4488a80ce50a9d',NULL,'d41d8cd98f00b204e9800998ecf8427e',NULL,NULL,1,'2020-02-28 19:51:29','120.92.72.96',NULL),('925da2c8b2174f298869ae6ece63c628','lbr57118794','068b0203a9a7ac24f93979ed85858b91','2997236027',NULL,1,'2020-02-27 11:15:25','42.88.91.143','2020-02-27 16:16:24'),('a988e40a07bc4242bef9a998aa8280a1','xiangyata','3d6d419d99fccfeb339b3b61fbce3b22','2563561314',NULL,1,'2020-02-27 11:08:38','117.95.57.156','2020-02-28 20:26:56'),('b05e53e61d074a97a0241f3a8fee81cd','Crusher','8440dd1a4d9b586e65bccc411d1eccfe','1260075261',NULL,1,'2020-02-28 20:55:05','60.6.73.37','2020-03-01 11:29:08');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-23  1:54:00
