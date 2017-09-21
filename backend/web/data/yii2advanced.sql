/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.7.14 : Database - yii2advanced
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yii2advanced` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `yii2advanced`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `column` int(2) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `created_at` varchar(11) NOT NULL,
  `updated_at` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `article` */

/*Table structure for table `auth_assignment` */

DROP TABLE IF EXISTS `auth_assignment`;

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auth_assignment` */

insert  into `auth_assignment`(`item_name`,`user_id`,`created_at`) values 
('后台管理员','1',1505457776),
('超级管理员','2',1505456842);

/*Table structure for table `auth_item` */

DROP TABLE IF EXISTS `auth_item`;

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auth_item` */

insert  into `auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) values 
('/*',2,NULL,NULL,NULL,1505457206,1505457206),
('/admin/*',2,NULL,NULL,NULL,1505456187,1505456187),
('/admin/assignment/index',2,NULL,NULL,NULL,1505462264,1505462264),
('/admin/menu/index',2,NULL,NULL,NULL,1505461403,1505461403),
('/admin/permission/index',2,NULL,NULL,NULL,1505461410,1505461410),
('/admin/role/index',2,NULL,NULL,NULL,1505461417,1505461417),
('/admin/route/index',2,NULL,NULL,NULL,1505461424,1505461424),
('/article/*',2,NULL,NULL,NULL,1505960172,1505960172),
('/article/index',2,NULL,NULL,NULL,1505961162,1505961162),
('/blog/*',2,NULL,NULL,NULL,1505456675,1505456675),
('/blog/index',2,NULL,NULL,NULL,1505462789,1505462789),
('/column/*',2,NULL,NULL,NULL,1505457178,1505457178),
('/column/index',2,NULL,NULL,NULL,1505462795,1505462795),
('/debug/*',2,NULL,NULL,NULL,1505457165,1505457165),
('/gii/*',2,NULL,NULL,NULL,1505457163,1505457163),
('/rbac/*',2,NULL,NULL,NULL,1505457187,1505457187),
('/site/*',2,NULL,NULL,NULL,1505457193,1505457193),
('/user-backend/*',2,NULL,NULL,NULL,1505457223,1505457223),
('全局管理',2,'超级管理权限',NULL,NULL,1505457341,1505457400),
('博客管理',2,NULL,NULL,NULL,1505456628,1505456628),
('后台管理员',1,'管理后台模块内容',NULL,NULL,1505457558,1505457558),
('文章管理',2,NULL,NULL,NULL,1505960241,1505960241),
('权限管理',2,NULL,NULL,NULL,1505456381,1505456381),
('栏目管理',2,NULL,NULL,NULL,1505457698,1505457698),
('超级管理员',1,'所有权限',NULL,NULL,1505379634,1505457458);

/*Table structure for table `auth_item_child` */

DROP TABLE IF EXISTS `auth_item_child`;

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auth_item_child` */

insert  into `auth_item_child`(`parent`,`child`) values 
('全局管理','/*'),
('权限管理','/admin/*'),
('文章管理','/article/*'),
('博客管理','/blog/*'),
('栏目管理','/column/*'),
('超级管理员','全局管理'),
('后台管理员','博客管理'),
('后台管理员','文章管理'),
('后台管理员','栏目管理');

/*Table structure for table `auth_rule` */

DROP TABLE IF EXISTS `auth_rule`;

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auth_rule` */

/*Table structure for table `blog` */

DROP TABLE IF EXISTS `blog`;

CREATE TABLE `blog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `created_at` varchar(11) NOT NULL DEFAULT '' COMMENT '添加时间',
  `updated_at` varchar(11) NOT NULL DEFAULT '' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `blog` */

insert  into `blog`(`id`,`title`,`content`,`views`,`created_at`,`updated_at`) values 
(1,'第一次','<p><img src=\"/images/20170919/1505784581106959.jpg\" title=\"1505784581106959.jpg\" alt=\"1.jpg\" width=\"388\" height=\"185\" style=\"width: 388px; height: 185px;\"/>这是一张图片</p>',0,'',''),
(2,'资源','<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: 微软雅黑, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Hiragino Sans GB&#39;, &#39;Microsoft Yahei&#39;, sans-serif; font-size: 14px; line-height: 20px; white-space: normal; background-color: rgb(255, 255, 255);\">RESTful 的 API 都是关于访问和操作&nbsp;<em style=\"box-sizing: border-box;\">资源</em>，可将资源看成MVC模式中的&nbsp;<a href=\"http://www.yii-china.com/doc/guide.html?id=structure_models\" style=\"box-sizing: border-box; color: rgb(51, 122, 183); text-decoration: none; outline: none; cursor: pointer; background-color: transparent;\">模型</a></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: 微软雅黑, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Hiragino Sans GB&#39;, &#39;Microsoft Yahei&#39;, sans-serif; font-size: 14px; line-height: 20px; white-space: normal; background-color: rgb(255, 255, 255);\">在如何代表一个资源没有固定的限定，在Yii中通常使用 yii\\base\\Model 或它的子类（如 yii\\db\\ActiveRecord） 代表资源，是为以下原因：</p><ul style=\"box-sizing: border-box; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Hiragino Sans GB&#39;, &#39;Microsoft Yahei&#39;, sans-serif; font-size: 14px; line-height: 20px; white-space: normal; background-color: rgb(255, 255, 255);\" class=\" list-paddingleft-2\"><li><p>yii\\base\\Model 实现了 yii\\base\\Arrayable 接口，它允许你通过RESTful API自定义你想要公开的资源数据。</p></li><li><p>yii\\base\\Model 支持&nbsp;<a href=\"http://www.yii-china.com/doc/guide.html?id=input_validation\" style=\"box-sizing: border-box; color: rgb(51, 122, 183); text-decoration: none; outline: none; cursor: pointer; background-color: transparent;\">输入验证</a>, 在你的RESTful API需要支持数据输入时非常有用。</p></li><li><p>yii\\db\\ActiveRecord 提供了强大的数据库访问和操作方面的支持，如资源数据需要存到数据库它提供了完美的支持。</p></li></ul><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: 微软雅黑, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Hiragino Sans GB&#39;, &#39;Microsoft Yahei&#39;, sans-serif; font-size: 14px; line-height: 20px; white-space: normal; background-color: rgb(255, 255, 255);\">本节主要描述资源类如何从 yii\\base\\Model (或它的子类) 继承并指定哪些数据可通过RESTful API返回，如果资源类没有 继承 yii\\base\\Model 会将它所有的公开成员变量返回。</p><h2 style=\"box-sizing: border-box; font-family: 微软雅黑, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Hiragino Sans GB&#39;, &#39;Microsoft Yahei&#39;, sans-serif; font-weight: 500; line-height: 1.1; color: rgb(51, 51, 51); margin-top: 20px; margin-bottom: 10px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255);\">字段<a style=\"box-sizing: border-box; color: rgb(51, 122, 183); outline: none; cursor: pointer; background-color: transparent;\"></a></h2><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: 微软雅黑, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Hiragino Sans GB&#39;, &#39;Microsoft Yahei&#39;, sans-serif; font-size: 14px; line-height: 20px; white-space: normal; background-color: rgb(255, 255, 255);\">当RESTful API响应中包含一个资源时，该资源需要序列化成一个字符串。 Yii将这个过程分成两步，首先，资源会被yii\\rest\\Serializer转换成数组， 然后，该数组会通过yii\\web\\ResponseFormatterInterface根据请求格式(如JSON, XML)被序列化成字符串。 当开发一个资源类时应重点关注第一步。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: 微软雅黑, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Hiragino Sans GB&#39;, &#39;Microsoft Yahei&#39;, sans-serif; font-size: 14px; line-height: 20px; white-space: normal; background-color: rgb(255, 255, 255);\">通过覆盖 yii\\base\\Model::fields() 和/或 yii\\base\\Model::extraFields() 方法, 可指定资源中称为&nbsp;<em style=\"box-sizing: border-box;\">字段</em>&nbsp;的数据放入展现数组中，两个方法的差别为前者指定默认包含到展现数组的字段集合， 后者指定由于终端用户的请求包含&nbsp;<code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, &#39;Courier New&#39;, monospace; font-size: 12.6px; padding: 2px 4px; color: rgb(199, 37, 78); border-radius: 4px; background-color: rgb(249, 242, 244);\">expand</code>&nbsp;参数哪些额外的字段应被包含到展现数组，例如，</p><p><br/></p>',0,'',''),
(3,'文件上传','<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: 微软雅黑, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Hiragino Sans GB&#39;, &#39;Microsoft Yahei&#39;, sans-serif; font-size: 14px; line-height: 20px; white-space: normal; background-color: rgb(255, 255, 255);\">在Yii里上传文件通常使用yii\\web\\UploadedFile类， 它把每个上传的文件封装成&nbsp;<code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, &#39;Courier New&#39;, monospace; font-size: 12.6px; padding: 2px 4px; color: rgb(199, 37, 78); border-radius: 4px; background-color: rgb(249, 242, 244);\">UploadedFile</code>&nbsp;对象。 结合yii\\widgets\\ActiveForm和<a href=\"http://www.yii-china.com/doc/guide.html?id=structure_models\" style=\"box-sizing: border-box; color: rgb(51, 122, 183); text-decoration: none; outline: none; cursor: pointer; background-color: transparent;\">models</a>，你可以轻松实现安全的上传文件机制。</p><h2 style=\"box-sizing: border-box; font-family: 微软雅黑, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Hiragino Sans GB&#39;, &#39;Microsoft Yahei&#39;, sans-serif; font-weight: 500; line-height: 1.1; color: rgb(51, 51, 51); margin-top: 20px; margin-bottom: 10px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255);\">创建模型<span style=\"box-sizing: border-box;\"></span></h2><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: 微软雅黑, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Hiragino Sans GB&#39;, &#39;Microsoft Yahei&#39;, sans-serif; font-size: 14px; line-height: 20px; white-space: normal; background-color: rgb(255, 255, 255);\">和普通的文本输入框类似，当要上传一个文件时，你需要创建一个模型类并且用其中的某个属性来接收上传的文件实例。 你还需要声明一条验证规则以验证上传的文件。 举例来讲，</p><pre style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &#39;Courier New&#39;, monospace; font-size: 13px; padding: 9.5px; margin-top: 0px; margin-bottom: 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; word-wrap: break-word; border: 1px solid rgb(204, 204, 204); border-radius: 4px; background-color: rgb(245, 245, 245);\">namespace&nbsp;app\\models;use&nbsp;yii\\base\\Model;use&nbsp;yii\\web\\UploadedFile;class&nbsp;UploadForm&nbsp;extends&nbsp;Model{&nbsp;&nbsp;&nbsp;&nbsp;/**\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;@var&nbsp;UploadedFile\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/\r\n&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;$imageFile;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;function&nbsp;rules()\r\n&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;[\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[[&#39;imageFile&#39;],&nbsp;&#39;file&#39;,&nbsp;&#39;skipOnEmpty&#39;&nbsp;=&gt;&nbsp;false,&nbsp;&#39;extensions&#39;&nbsp;=&gt;&nbsp;&#39;png,&nbsp;jpg&#39;],\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;];\r\n&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;function&nbsp;upload()\r\n&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;($this-&gt;validate())&nbsp;{&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$this-&gt;imageFile-&gt;saveAs(&#39;uploads/&#39;&nbsp;.&nbsp;$this-&gt;imageFile-&gt;baseName&nbsp;.&nbsp;&#39;.&#39;&nbsp;.&nbsp;$this-&gt;imageFile-&gt;extension);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;true;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;else&nbsp;{&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;false;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n}</pre><p><br/></p>',0,'','');

/*Table structure for table `column` */

DROP TABLE IF EXISTS `column`;

CREATE TABLE `column` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` varchar(11) DEFAULT NULL,
  `updated_at` varchar(11) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL COMMENT '图片',
  `file2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `column` */

insert  into `column`(`id`,`name`,`created_at`,`updated_at`,`file`,`file2`) values 
(3,'文海拾贝',NULL,NULL,NULL,NULL),
(4,'时事新闻',NULL,NULL,NULL,NULL),
(5,'行业技术',NULL,NULL,NULL,NULL);

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`id`,`name`,`parent`,`route`,`order`,`data`) values 
(1,'权限管理',NULL,'/admin/menu/index',10,NULL),
(2,'路由设置',1,'/admin/route/index',1,NULL),
(3,'权限设置',1,'/admin/permission/index',2,NULL),
(4,'角色设置',1,'/admin/role/index',3,NULL),
(5,'用户角色分配',1,'/admin/assignment/index',4,NULL),
(6,'博客管理',NULL,'/blog/index',1,NULL),
(7,'栏目管理',NULL,'/column/index',3,NULL),
(8,'菜单管理',1,'/admin/menu/index',5,NULL),
(9,'文章管理',NULL,'/article/index',2,NULL);

/*Table structure for table `migration` */

DROP TABLE IF EXISTS `migration`;

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `migration` */

insert  into `migration`(`version`,`apply_time`) values 
('m000000_000000_base',1504774846),
('m130524_201442_init',1504774855),
('m170912_014011_add_role_to_user_table',1505182697),
('m170912_093533_create_table_column',1505209723),
('m170912_094952_create_table_article',1505210015),
('m140506_102106_rbac_init',1505371645),
('m140602_111327_create_menu_table',1505460287);

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `test` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `role` int(1) NOT NULL DEFAULT '0' COMMENT '角色等级',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`auth_key`,`password_hash`,`password_reset_token`,`email`,`status`,`created_at`,`updated_at`,`role`) values 
(1,'wlzx120','L9ltlfxCE6cSY5h3AezjW33ZvOu1qL63','$2y$13$gCT4l/eUykz4Xbr6f75krekoaFDKUfp19F/Zrd/9zfpiVyzFZJy7a','8U4hZkbyZXsfVy5F38SgCzwTHHrUrBkZ_1505096702','wlzx120@163.com',10,1504774945,1505096702,0),
(2,'wlzx121','NdTALL2WJUx5UcaPsq-0818QtOw2yPqj','$2y$13$QryuQ4rbt0GVI.CIpjyV4eM7phyHo8aabjGT37YaYUu0A4AxCTprO',NULL,'270077706@qq.com',10,1505095113,1505100508,0),
(3,'wlzx122','qemnwma5gNYnCRn_-71_0qI48Zxvn5nG','$2y$13$HtAoofa2vHL1W.H5yc7L8ewYokgohjABtXkEu6dUCDfCNvojkoFSa',NULL,'wlzx122@163.com',10,1505095989,1505095989,0);

/*Table structure for table `user_backend` */

DROP TABLE IF EXISTS `user_backend`;

CREATE TABLE `user_backend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_backend` */

insert  into `user_backend`(`id`,`username`,`auth_key`,`password_hash`,`email`,`created_at`,`updated_at`) values 
(1,'wlzx121','_kxSyYfdzVHHajoyLhWwFL-HmbKvSWgX','$2y$13$YmurhgUs2fC/rKKphrpAw.Qx.uLP09CoMggDaP9ao90wlJdyxD/U2','270077706@qq.com','2017-09-14 11:47:01','2017-09-14 11:47:01'),
(2,'wlzx120','CWXikcCj5FNom0asvjCPdZ5vaAsYFTFM','$2y$13$RRtxgIG4TFnI9bY3o.Hh7.uAvGraxUthVGP.7AKGrKUn1qOgFNFTm','wlzx120@163.com','2017-09-14 17:08:25','2017-09-14 17:08:25');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
