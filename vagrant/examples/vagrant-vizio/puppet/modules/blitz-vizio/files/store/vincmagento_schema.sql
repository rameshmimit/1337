-- MySQL dump 10.13  Distrib 5.1.58, for redhat-linux-gnu (x86_64)
--
-- Host: db02    Database: vincmagento
-- ------------------------------------------------------
-- Server version	5.0.86-log

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
-- Not dumping tablespaces as no INFORMATION_SCHEMA.FILES table on this server
--

--
-- Table structure for table `admin_assert`
--

DROP TABLE IF EXISTS `admin_assert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_assert` (
  `assert_id` int(10) unsigned NOT NULL auto_increment,
  `assert_type` varchar(20) NOT NULL default '',
  `assert_data` text,
  PRIMARY KEY  (`assert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ACL Asserts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_role`
--

DROP TABLE IF EXISTS `admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role` (
  `role_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL default '0',
  `tree_level` tinyint(3) unsigned NOT NULL default '0',
  `sort_order` tinyint(3) unsigned NOT NULL default '0',
  `role_type` char(1) NOT NULL default '0',
  `user_id` int(11) unsigned NOT NULL default '0',
  `role_name` varchar(50) NOT NULL default '',
  `gws_is_all` tinyint(1) NOT NULL default '1',
  `gws_websites` varchar(255) NOT NULL default '',
  `gws_store_groups` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`role_id`),
  KEY `parent_id` (`parent_id`,`sort_order`),
  KEY `tree_level` (`tree_level`)
) ENGINE=InnoDB AUTO_INCREMENT=13665 DEFAULT CHARSET=utf8 COMMENT='ACL Roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_rule`
--

DROP TABLE IF EXISTS `admin_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_rule` (
  `rule_id` int(10) unsigned NOT NULL auto_increment,
  `role_id` int(10) unsigned NOT NULL default '0',
  `resource_id` varchar(255) NOT NULL default '',
  `privileges` varchar(20) NOT NULL default '',
  `assert_id` int(10) unsigned NOT NULL default '0',
  `role_type` char(1) default NULL,
  `permission` varchar(10) default NULL,
  PRIMARY KEY  (`rule_id`),
  KEY `resource` (`resource_id`,`role_id`),
  KEY `role_id` (`role_id`,`resource_id`),
  CONSTRAINT `FK_admin_rule` FOREIGN KEY (`role_id`) REFERENCES `admin_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11533 DEFAULT CHARSET=utf8 COMMENT='ACL Rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user` (
  `user_id` mediumint(9) unsigned NOT NULL auto_increment,
  `firstname` varchar(32) NOT NULL default '',
  `lastname` varchar(32) NOT NULL default '',
  `email` varchar(128) NOT NULL default '',
  `username` varchar(40) NOT NULL default '',
  `password` varchar(100) NOT NULL default '',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified` datetime default NULL,
  `logdate` datetime default NULL,
  `lognum` smallint(5) unsigned NOT NULL default '0',
  `reload_acl_flag` tinyint(1) NOT NULL default '0',
  `is_active` tinyint(1) NOT NULL default '1',
  `extra` text,
  `failures_num` smallint(6) NOT NULL default '0',
  `first_failure` datetime default NULL,
  `lock_expires` datetime default NULL,
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `UNQ_ADMIN_USER_USERNAME` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2605 DEFAULT CHARSET=utf8 COMMENT='Users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adminnotification_inbox`
--

DROP TABLE IF EXISTS `adminnotification_inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminnotification_inbox` (
  `notification_id` int(10) unsigned NOT NULL auto_increment,
  `severity` tinyint(3) unsigned NOT NULL default '0',
  `date_added` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `url` varchar(255) NOT NULL,
  `is_read` tinyint(1) unsigned NOT NULL default '0',
  `is_remove` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`notification_id`),
  KEY `IDX_SEVERITY` (`severity`),
  KEY `IDX_IS_READ` (`is_read`),
  KEY `IDX_IS_REMOVE` (`is_remove`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aitsys_news`
--

DROP TABLE IF EXISTS `aitsys_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aitsys_news` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `date_added` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `type` enum('news','important') NOT NULL default 'news',
  PRIMARY KEY  (`entity_id`),
  KEY `date` (`date_added`)
) ENGINE=MyISAM AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aitsys_notification`
--

DROP TABLE IF EXISTS `aitsys_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aitsys_notification` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `assigned` varchar(64) NOT NULL,
  `severity` tinyint(3) unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(16) NOT NULL,
  `source` varchar(255) NOT NULL,
  `viewed` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entity_id`),
  KEY `date` (`date_added`),
  KEY `assigned` (`assigned`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aitsys_performer`
--

DROP TABLE IF EXISTS `aitsys_performer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aitsys_performer` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL,
  `code` mediumblob NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aitsys_status`
--

DROP TABLE IF EXISTS `aitsys_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aitsys_status` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `module` varchar(50) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `module` (`module`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `amazonpayments_api_debug`
--

DROP TABLE IF EXISTS `amazonpayments_api_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amazonpayments_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `transaction_id` varchar(255) NOT NULL default '',
  `debug_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY  (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_assert`
--

DROP TABLE IF EXISTS `api_assert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_assert` (
  `assert_id` int(10) unsigned NOT NULL auto_increment,
  `assert_type` varchar(20) NOT NULL default '',
  `assert_data` text,
  PRIMARY KEY  (`assert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Asserts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_role`
--

DROP TABLE IF EXISTS `api_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_role` (
  `role_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL default '0',
  `tree_level` tinyint(3) unsigned NOT NULL default '0',
  `sort_order` tinyint(3) unsigned NOT NULL default '0',
  `role_type` char(1) NOT NULL default '0',
  `user_id` int(11) unsigned NOT NULL default '0',
  `role_name` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`role_id`),
  KEY `parent_id` (`parent_id`,`sort_order`),
  KEY `tree_level` (`tree_level`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='Api ACL Roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_rule`
--

DROP TABLE IF EXISTS `api_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_rule` (
  `rule_id` int(10) unsigned NOT NULL auto_increment,
  `role_id` int(10) unsigned NOT NULL default '0',
  `resource_id` varchar(255) NOT NULL default '',
  `privileges` varchar(20) NOT NULL default '',
  `assert_id` int(10) unsigned NOT NULL default '0',
  `role_type` char(1) default NULL,
  `permission` varchar(10) default NULL,
  PRIMARY KEY  (`rule_id`),
  KEY `resource` (`resource_id`,`role_id`),
  KEY `role_id` (`role_id`,`resource_id`),
  CONSTRAINT `FK_api_rule` FOREIGN KEY (`role_id`) REFERENCES `api_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=447 DEFAULT CHARSET=utf8 COMMENT='Api ACL Rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_session`
--

DROP TABLE IF EXISTS `api_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_session` (
  `user_id` mediumint(9) unsigned NOT NULL,
  `logdate` datetime NOT NULL default '0000-00-00 00:00:00',
  `sessid` varchar(40) NOT NULL default '',
  KEY `API_SESSION_USER` (`user_id`),
  KEY `API_SESSION_SESSID` (`sessid`),
  CONSTRAINT `FK_API_SESSION_USER` FOREIGN KEY (`user_id`) REFERENCES `api_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api Sessions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_user`
--

DROP TABLE IF EXISTS `api_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_user` (
  `user_id` mediumint(9) unsigned NOT NULL auto_increment,
  `firstname` varchar(32) NOT NULL default '',
  `lastname` varchar(32) NOT NULL default '',
  `email` varchar(128) NOT NULL default '',
  `username` varchar(40) NOT NULL default '',
  `api_key` varchar(100) NOT NULL default '',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified` datetime default NULL,
  `lognum` smallint(5) unsigned NOT NULL default '0',
  `reload_acl_flag` tinyint(1) NOT NULL default '0',
  `is_active` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Api Users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aw_blog`
--

DROP TABLE IF EXISTS `aw_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aw_blog` (
  `post_id` int(11) unsigned NOT NULL auto_increment,
  `cat_id` smallint(11) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `post_content` text NOT NULL,
  `status` smallint(6) NOT NULL default '0',
  `created_time` datetime default NULL,
  `update_time` datetime default NULL,
  `identifier` varchar(255) NOT NULL default '',
  `user` varchar(255) NOT NULL default '',
  `update_user` varchar(255) NOT NULL default '',
  `meta_keywords` text NOT NULL,
  `meta_description` text NOT NULL,
  `comments` tinyint(11) NOT NULL,
  `tags` text NOT NULL,
  `short_content` text NOT NULL,
  `is_headline` tinyint(2) unsigned NOT NULL default '0',
  PRIMARY KEY  (`post_id`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=1289 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aw_blog_cat`
--

DROP TABLE IF EXISTS `aw_blog_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aw_blog_cat` (
  `cat_id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `identifier` varchar(255) NOT NULL default '',
  `sort_order` tinyint(6) NOT NULL,
  `meta_keywords` text NOT NULL,
  `meta_description` text NOT NULL,
  PRIMARY KEY  (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aw_blog_cat_store`
--

DROP TABLE IF EXISTS `aw_blog_cat_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aw_blog_cat_store` (
  `cat_id` smallint(6) unsigned default NULL,
  `store_id` smallint(6) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aw_blog_comment`
--

DROP TABLE IF EXISTS `aw_blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aw_blog_comment` (
  `comment_id` int(11) unsigned NOT NULL auto_increment,
  `post_id` smallint(11) NOT NULL default '0',
  `comment` text NOT NULL,
  `status` smallint(6) NOT NULL default '0',
  `created_time` datetime default NULL,
  `user` varchar(255) NOT NULL default '',
  `email` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aw_blog_post_cat`
--

DROP TABLE IF EXISTS `aw_blog_post_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aw_blog_post_cat` (
  `cat_id` smallint(6) unsigned default NULL,
  `post_id` smallint(6) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aw_blog_store`
--

DROP TABLE IF EXISTS `aw_blog_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aw_blog_store` (
  `post_id` smallint(6) unsigned default NULL,
  `store_id` smallint(6) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aw_blog_tags`
--

DROP TABLE IF EXISTS `aw_blog_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aw_blog_tags` (
  `id` int(11) NOT NULL auto_increment,
  `tag` varchar(255) NOT NULL,
  `tag_count` int(11) NOT NULL default '0',
  `store_id` tinyint(4) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `tag` (`tag`,`tag_count`,`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_anc_categs_index_idx`
--

DROP TABLE IF EXISTS `catalog_category_anc_categs_index_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_anc_categs_index_idx` (
  `category_id` int(10) unsigned NOT NULL default '0',
  `path` varchar(255) NOT NULL default '',
  KEY `IDX_CATEGORY` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_anc_categs_index_tmp`
--

DROP TABLE IF EXISTS `catalog_category_anc_categs_index_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_anc_categs_index_tmp` (
  `category_id` int(10) unsigned NOT NULL default '0',
  `path` varchar(255) NOT NULL default '',
  KEY `IDX_CATEGORY` (`category_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_anc_products_index_idx`
--

DROP TABLE IF EXISTS `catalog_category_anc_products_index_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_anc_products_index_idx` (
  `category_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `position` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_anc_products_index_tmp`
--

DROP TABLE IF EXISTS `catalog_category_anc_products_index_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_anc_products_index_tmp` (
  `category_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_entity`
--

DROP TABLE IF EXISTS `catalog_category_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `parent_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `path` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `children_count` int(11) NOT NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_LEVEL` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8 COMMENT='Category Entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_entity_datetime`
--

DROP TABLE IF EXISTS `catalog_category_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_datetime` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` datetime default NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_DATETIME_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_DATETIME_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DATETIME_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_entity_decimal`
--

DROP TABLE IF EXISTS `catalog_category_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_decimal` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` decimal(12,4) default NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_entity_int`
--

DROP TABLE IF EXISTS `catalog_category_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_int` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` int(11) default NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_INT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_EMTITY_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_EMTITY_INT_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_EMTITY_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_EMTITY_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_EMTITY_INT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1205 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_entity_text`
--

DROP TABLE IF EXISTS `catalog_category_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_text` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_TEXT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_TEXT_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_TEXT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=897 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_entity_varchar`
--

DROP TABLE IF EXISTS `catalog_category_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_varchar` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_BASE` USING BTREE (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1443 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_flat_store_1`
--

DROP TABLE IF EXISTS `catalog_category_flat_store_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_flat_store_1` (
  `entity_id` int(11) unsigned NOT NULL,
  `parent_id` int(11) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `path` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `children_count` int(11) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `all_children` text,
  `available_sort_by` text,
  `children` text,
  `custom_apply_to_products` int(10) NOT NULL default '0',
  `custom_design` varchar(255) NOT NULL default '',
  `custom_design_from` datetime NOT NULL default '0000-00-00 00:00:00',
  `custom_design_to` datetime NOT NULL default '0000-00-00 00:00:00',
  `custom_layout_update` text,
  `custom_use_parent_settings` int(10) NOT NULL default '0',
  `default_sort_by` varchar(255) NOT NULL default '',
  `description` text,
  `display_mode` varchar(255) NOT NULL default '',
  `filter_price_range` int(10) NOT NULL default '0',
  `image` varchar(255) NOT NULL default '',
  `include_in_menu` int(10) NOT NULL default '0',
  `is_active` int(10) NOT NULL default '0',
  `is_anchor` int(10) NOT NULL default '0',
  `landing_page` int(10) NOT NULL default '0',
  `meta_description` text,
  `meta_keywords` text,
  `meta_title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `page_layout` varchar(255) NOT NULL default '',
  `path_in_store` text,
  `thumbnail` varchar(255) NOT NULL default '',
  `url_key` varchar(255) NOT NULL default '',
  `url_path` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_PATH` (`path`),
  KEY `IDX_LEVEL` (`level`),
  CONSTRAINT `FK_CATEGORY_FLAT_CATEGORY_ID_STORE_1` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATEGORY_FLAT_STORE_ID_STORE_1` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_flat_store_4`
--

DROP TABLE IF EXISTS `catalog_category_flat_store_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_flat_store_4` (
  `entity_id` int(11) unsigned NOT NULL,
  `parent_id` int(11) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `path` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `children_count` int(11) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `all_children` text,
  `available_sort_by` text,
  `children` text,
  `custom_apply_to_products` int(10) NOT NULL default '0',
  `custom_design` varchar(255) NOT NULL default '',
  `custom_design_from` datetime NOT NULL default '0000-00-00 00:00:00',
  `custom_design_to` datetime NOT NULL default '0000-00-00 00:00:00',
  `custom_layout_update` text,
  `custom_use_parent_settings` int(10) NOT NULL default '0',
  `default_sort_by` varchar(255) NOT NULL default '',
  `description` text,
  `display_mode` varchar(255) NOT NULL default '',
  `filter_price_range` int(10) NOT NULL default '0',
  `image` varchar(255) NOT NULL default '',
  `include_in_menu` int(10) NOT NULL default '0',
  `is_active` int(10) NOT NULL default '0',
  `is_anchor` int(10) NOT NULL default '0',
  `landing_page` int(10) NOT NULL default '0',
  `meta_description` text,
  `meta_keywords` text,
  `meta_title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `page_layout` varchar(255) NOT NULL default '',
  `path_in_store` text,
  `thumbnail` varchar(255) NOT NULL default '',
  `url_key` varchar(255) NOT NULL default '',
  `url_path` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_PATH` (`path`),
  KEY `IDX_LEVEL` (`level`),
  CONSTRAINT `FK_CATEGORY_FLAT_CATEGORY_ID_STORE_4` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATEGORY_FLAT_STORE_ID_STORE_4` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_flat_store_6`
--

DROP TABLE IF EXISTS `catalog_category_flat_store_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_flat_store_6` (
  `entity_id` int(11) unsigned NOT NULL,
  `parent_id` int(11) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `path` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `children_count` int(11) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `all_children` text,
  `available_sort_by` text,
  `children` text,
  `custom_apply_to_products` int(10) NOT NULL default '0',
  `custom_design` varchar(255) NOT NULL default '',
  `custom_design_from` datetime NOT NULL default '0000-00-00 00:00:00',
  `custom_design_to` datetime NOT NULL default '0000-00-00 00:00:00',
  `custom_layout_update` text,
  `custom_use_parent_settings` int(10) NOT NULL default '0',
  `default_sort_by` varchar(255) NOT NULL default '',
  `description` text,
  `display_mode` varchar(255) NOT NULL default '',
  `filter_price_range` int(10) NOT NULL default '0',
  `image` varchar(255) NOT NULL default '',
  `include_in_menu` int(10) NOT NULL default '0',
  `is_active` int(10) NOT NULL default '0',
  `is_anchor` int(10) NOT NULL default '0',
  `landing_page` int(10) NOT NULL default '0',
  `meta_description` text,
  `meta_keywords` text,
  `meta_title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `page_layout` varchar(255) NOT NULL default '',
  `path_in_store` text,
  `thumbnail` varchar(255) NOT NULL default '',
  `url_key` varchar(255) NOT NULL default '',
  `url_path` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_PATH` (`path`),
  KEY `IDX_LEVEL` (`level`),
  CONSTRAINT `FK_CATEGORY_FLAT_CATEGORY_ID_STORE_6` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATEGORY_FLAT_STORE_ID_STORE_6` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_flat_store_8`
--

DROP TABLE IF EXISTS `catalog_category_flat_store_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_flat_store_8` (
  `entity_id` int(11) unsigned NOT NULL,
  `parent_id` int(11) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `path` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `children_count` int(11) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `all_children` text,
  `available_sort_by` text,
  `children` text,
  `custom_apply_to_products` int(10) NOT NULL default '0',
  `custom_design` varchar(255) NOT NULL default '',
  `custom_design_from` datetime NOT NULL default '0000-00-00 00:00:00',
  `custom_design_to` datetime NOT NULL default '0000-00-00 00:00:00',
  `custom_layout_update` text,
  `custom_use_parent_settings` int(10) NOT NULL default '0',
  `default_sort_by` varchar(255) NOT NULL default '',
  `description` text,
  `display_mode` varchar(255) NOT NULL default '',
  `filter_price_range` int(10) NOT NULL default '0',
  `image` varchar(255) NOT NULL default '',
  `include_in_menu` int(10) NOT NULL default '0',
  `is_active` int(10) NOT NULL default '0',
  `is_anchor` int(10) NOT NULL default '0',
  `landing_page` int(10) NOT NULL default '0',
  `meta_description` text,
  `meta_keywords` text,
  `meta_title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `page_layout` varchar(255) NOT NULL default '',
  `path_in_store` text,
  `thumbnail` varchar(255) NOT NULL default '',
  `url_key` varchar(255) NOT NULL default '',
  `url_path` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_PATH` (`path`),
  KEY `IDX_LEVEL` (`level`),
  CONSTRAINT `FK_CATEGORY_FLAT_CATEGORY_ID_STORE_8` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATEGORY_FLAT_STORE_ID_STORE_8` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_flat_store_9`
--

DROP TABLE IF EXISTS `catalog_category_flat_store_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_flat_store_9` (
  `entity_id` int(11) unsigned NOT NULL,
  `parent_id` int(11) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `path` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `children_count` int(11) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `all_children` text,
  `available_sort_by` text,
  `children` text,
  `custom_apply_to_products` int(10) NOT NULL default '0',
  `custom_design` varchar(255) NOT NULL default '',
  `custom_design_from` datetime NOT NULL default '0000-00-00 00:00:00',
  `custom_design_to` datetime NOT NULL default '0000-00-00 00:00:00',
  `custom_layout_update` text,
  `custom_use_parent_settings` int(10) NOT NULL default '0',
  `default_sort_by` varchar(255) NOT NULL default '',
  `description` text,
  `display_mode` varchar(255) NOT NULL default '',
  `filter_price_range` int(10) NOT NULL default '0',
  `image` varchar(255) NOT NULL default '',
  `include_in_menu` int(10) NOT NULL default '0',
  `is_active` int(10) NOT NULL default '0',
  `is_anchor` int(10) NOT NULL default '0',
  `landing_page` int(10) NOT NULL default '0',
  `meta_description` text,
  `meta_keywords` text,
  `meta_title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `page_layout` varchar(255) NOT NULL default '',
  `path_in_store` text,
  `thumbnail` varchar(255) NOT NULL default '',
  `url_key` varchar(255) NOT NULL default '',
  `url_path` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_PATH` (`path`),
  KEY `IDX_LEVEL` (`level`),
  CONSTRAINT `FK_CATEGORY_FLAT_CATEGORY_ID_STORE_9` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATEGORY_FLAT_STORE_ID_STORE_9` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_product`
--

DROP TABLE IF EXISTS `catalog_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product` (
  `category_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `position` int(10) NOT NULL default '0',
  UNIQUE KEY `UNQ_CATEGORY_PRODUCT` (`category_id`,`product_id`),
  KEY `CATALOG_CATEGORY_PRODUCT_CATEGORY` (`category_id`),
  KEY `CATALOG_CATEGORY_PRODUCT_PRODUCT` (`product_id`),
  CONSTRAINT `CATALOG_CATEGORY_PRODUCT_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CATALOG_CATEGORY_PRODUCT_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_product_index`
--

DROP TABLE IF EXISTS `catalog_category_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index` (
  `category_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `position` int(10) unsigned default NULL,
  `is_parent` tinyint(1) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `visibility` tinyint(3) unsigned NOT NULL,
  UNIQUE KEY `UNQ_CATEGORY_PRODUCT` (`category_id`,`product_id`,`store_id`),
  KEY `FK_CATALOG_CATEGORY_PRODUCT_INDEX_CATEGORY_ENTITY` (`category_id`),
  KEY `IDX_JOIN` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_BASE` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`),
  CONSTRAINT `FK_CATALOG_CATEGORY_PROD_IDX_PROD_ENTITY` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_PROD_IDX_CATEGORY_ENTITY` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATEGORY_PRODUCT_INDEX_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_product_index_enbl_idx`
--

DROP TABLE IF EXISTS `catalog_category_product_index_enbl_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index_enbl_idx` (
  `product_id` int(10) unsigned NOT NULL default '0',
  `visibility` int(11) unsigned NOT NULL default '0',
  KEY `IDX_PRODUCT` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_product_index_enbl_tmp`
--

DROP TABLE IF EXISTS `catalog_category_product_index_enbl_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index_enbl_tmp` (
  `product_id` int(10) unsigned NOT NULL default '0',
  `visibility` int(11) unsigned NOT NULL default '0',
  KEY `IDX_PRODUCT` (`product_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_product_index_idx`
--

DROP TABLE IF EXISTS `catalog_category_product_index_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index_idx` (
  `category_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `position` int(10) NOT NULL default '0',
  `is_parent` tinyint(1) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `visibility` tinyint(3) unsigned NOT NULL,
  KEY `IDX_PRODUCT_CATEGORY_STORE` (`product_id`,`category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_product_index_tmp`
--

DROP TABLE IF EXISTS `catalog_category_product_index_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index_tmp` (
  `category_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `position` int(10) NOT NULL default '0',
  `is_parent` tinyint(1) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `visibility` tinyint(3) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_compare_item`
--

DROP TABLE IF EXISTS `catalog_compare_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_compare_item` (
  `catalog_compare_item_id` int(11) unsigned NOT NULL auto_increment,
  `visitor_id` int(11) unsigned NOT NULL default '0',
  `customer_id` int(11) unsigned default NULL,
  `product_id` int(11) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned default NULL,
  PRIMARY KEY  (`catalog_compare_item_id`),
  KEY `FK_CATALOG_COMPARE_ITEM_CUSTOMER` (`customer_id`),
  KEY `FK_CATALOG_COMPARE_ITEM_PRODUCT` (`product_id`),
  KEY `IDX_VISITOR_PRODUCTS` (`visitor_id`,`product_id`),
  KEY `IDX_CUSTOMER_PRODUCTS` (`customer_id`,`product_id`),
  KEY `FK_CATALOG_COMPARE_ITEM_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_COMPARE_ITEM_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_COMPARE_ITEM_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_COMPARE_ITEM_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=267657 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_eav_attribute`
--

DROP TABLE IF EXISTS `catalog_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL auto_increment,
  `frontend_input_renderer` varchar(255) default NULL,
  `is_global` tinyint(1) unsigned NOT NULL default '1',
  `is_visible` tinyint(1) unsigned NOT NULL default '1',
  `is_searchable` tinyint(1) unsigned NOT NULL default '0',
  `search_weight` tinyint(1) unsigned NOT NULL default '1',
  `is_filterable` tinyint(1) unsigned NOT NULL default '0',
  `is_comparable` tinyint(1) unsigned NOT NULL default '0',
  `is_visible_on_front` tinyint(1) unsigned NOT NULL default '0',
  `is_html_allowed_on_front` tinyint(1) unsigned NOT NULL default '0',
  `is_used_for_price_rules` tinyint(1) unsigned NOT NULL default '0' COMMENT 'deprecated after 1.4.0.1',
  `is_filterable_in_search` tinyint(1) unsigned NOT NULL default '0',
  `used_in_product_listing` tinyint(1) unsigned NOT NULL default '0',
  `used_for_sort_by` tinyint(1) unsigned NOT NULL default '0',
  `is_configurable` tinyint(1) unsigned NOT NULL default '1',
  `apply_to` varchar(255) NOT NULL,
  `is_visible_in_advanced_search` tinyint(1) unsigned NOT NULL default '0',
  `position` int(11) NOT NULL,
  `is_wysiwyg_enabled` tinyint(1) unsigned NOT NULL default '0',
  `is_used_for_promo_rules` tinyint(1) unsigned NOT NULL default '0',
  `is_used_for_customer_segment` tinyint(1) unsigned NOT NULL default '0' COMMENT 'deprecated after 1.7.1.0',
  `is_used_for_target_rules` tinyint(1) unsigned NOT NULL default '0' COMMENT 'deprecated after 1.7.1.0',
  PRIMARY KEY  (`attribute_id`),
  KEY `IDX_USED_FOR_SORT_BY` (`used_for_sort_by`),
  KEY `IDX_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`),
  CONSTRAINT `FK_CATALOG_EAV_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1921 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_bundle_option`
--

DROP TABLE IF EXISTS `catalog_product_bundle_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_option` (
  `option_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL,
  `required` tinyint(1) unsigned NOT NULL default '0',
  `position` int(10) unsigned NOT NULL default '0',
  `type` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`option_id`),
  KEY `FK_CATALOG_PRODUCT_BUNDLE_OPTION_PARENT` (`parent_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_BUNDLE_OPTION_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='Bundle Options';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_bundle_option_value`
--

DROP TABLE IF EXISTS `catalog_product_bundle_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_option_value` (
  `value_id` int(10) unsigned NOT NULL auto_increment,
  `option_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `title` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_OPTION_STORE` (`option_id`,`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_BUNDLE_OPTION_VALUE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COMMENT='Bundle Selections';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_bundle_price_index`
--

DROP TABLE IF EXISTS `catalog_product_bundle_price_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_price_index` (
  `entity_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `customer_group_id` smallint(3) unsigned NOT NULL,
  `min_price` decimal(12,4) NOT NULL,
  `max_price` decimal(12,4) NOT NULL,
  PRIMARY KEY  (`entity_id`,`website_id`,`customer_group_id`),
  KEY `IDX_WEBSITE` (`website_id`),
  KEY `IDX_CUSTOMER_GROUP` (`customer_group_id`),
  CONSTRAINT `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_bundle_selection`
--

DROP TABLE IF EXISTS `catalog_product_bundle_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_selection` (
  `selection_id` int(10) unsigned NOT NULL auto_increment,
  `option_id` int(10) unsigned NOT NULL,
  `parent_product_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL default '0',
  `is_default` tinyint(1) unsigned NOT NULL default '0',
  `selection_price_type` tinyint(1) unsigned NOT NULL default '0',
  `selection_price_value` decimal(12,4) NOT NULL default '0.0000',
  `selection_qty` decimal(12,4) NOT NULL default '0.0000',
  `selection_can_change_qty` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`selection_id`),
  KEY `FK_CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION` (`option_id`),
  KEY `FK_CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT` (`product_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='Bundle Selections';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_bundle_selection_price`
--

DROP TABLE IF EXISTS `catalog_product_bundle_selection_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_selection_price` (
  `selection_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `selection_price_type` tinyint(1) unsigned NOT NULL default '0',
  `selection_price_value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`selection_id`,`website_id`),
  KEY `FK_BUNDLE_PRICE_SELECTION_WEBSITE` (`website_id`),
  CONSTRAINT `FK_BUNDLE_PRICE_SELECTION_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_BUNDLE_PRICE_SELECTION_ID` FOREIGN KEY (`selection_id`) REFERENCES `catalog_product_bundle_selection` (`selection_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_bundle_stock_index`
--

DROP TABLE IF EXISTS `catalog_product_bundle_stock_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_stock_index` (
  `entity_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `stock_id` smallint(5) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL default '0',
  `stock_status` tinyint(1) default '0',
  PRIMARY KEY  (`entity_id`,`stock_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_enabled_index`
--

DROP TABLE IF EXISTS `catalog_product_enabled_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_enabled_index` (
  `product_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `visibility` smallint(5) unsigned NOT NULL default '0',
  UNIQUE KEY `UNQ_PRODUCT_STORE` (`product_id`,`store_id`),
  KEY `IDX_PRODUCT_VISIBILITY_IN_STORE` (`product_id`,`store_id`,`visibility`),
  KEY `FK_CATALOG_PRODUCT_ENABLED_INDEX_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENABLED_INDEX_PRODUCT_ENTITY` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENABLED_INDEX_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_entity`
--

DROP TABLE IF EXISTS `catalog_product_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `type_id` varchar(32) NOT NULL default 'simple',
  `sku` varchar(64) default NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `has_options` smallint(1) NOT NULL default '0',
  `required_options` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `sku` (`sku`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1167 DEFAULT CHARSET=utf8 COMMENT='Product Entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_entity_datetime`
--

DROP TABLE IF EXISTS `catalog_product_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_datetime` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` datetime default NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DATETIME_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DATETIME_PRODUCT_ENTITY` (`entity_id`),
  CONSTRAINT `FK_CATALOG_PROD_ENTITY_DATETIME_PROD_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DATETIME_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4971 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_entity_decimal`
--

DROP TABLE IF EXISTS `catalog_product_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_decimal` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` decimal(12,4) default NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE` (`attribute_id`),
  CONSTRAINT `FK_CATALOG_PROD_ENTITY_DECIMAL_PROD_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5935 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_entity_gallery`
--

DROP TABLE IF EXISTS `catalog_product_entity_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_gallery` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `position` int(11) NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_GALLERY_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_GALLERY_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_GALLERY_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_GALLERY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_entity_int`
--

DROP TABLE IF EXISTS `catalog_product_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_int` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` mediumint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` int(11) default NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_INT_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_INT_PRODUCT_ENTITY` (`entity_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_INT_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_INT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=145255 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_entity_media_gallery`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_media_gallery` (
  `value_id` int(11) unsigned NOT NULL auto_increment,
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`value_id`),
  KEY `FK_CATALOG_PRODUCT_MEDIA_GALLERY_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_MEDIA_GALLERY_ENTITY` (`entity_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_MEDIA_GALLERY_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_MEDIA_GALLERY_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6917 DEFAULT CHARSET=utf8 COMMENT='Catalog product media gallery';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_entity_media_gallery_value`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_media_gallery_value` (
  `value_id` int(11) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `label` varchar(255) default NULL,
  `position` int(11) unsigned default NULL,
  `disabled` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`value_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_MEDIA_GALLERY_VALUE_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_MEDIA_GALLERY_VALUE_GALLERY` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_MEDIA_GALLERY_VALUE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog product media gallery values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_entity_text`
--

DROP TABLE IF EXISTS `catalog_product_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_text` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` mediumint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TEXT_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TEXT_PRODUCT_ENTITY` (`entity_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TEXT_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TEXT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68669 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_entity_tier_price`
--

DROP TABLE IF EXISTS `catalog_product_entity_tier_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_tier_price` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_id` int(10) unsigned NOT NULL default '0',
  `all_groups` tinyint(1) unsigned NOT NULL default '1',
  `customer_group_id` smallint(5) unsigned NOT NULL default '0',
  `qty` decimal(12,4) NOT NULL default '1.0000',
  `value` decimal(12,4) NOT NULL default '0.0000',
  `website_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_TIER_PRICE` (`entity_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TIER_PRICE_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TIER_PRICE_GROUP` (`customer_group_id`),
  KEY `FK_CATALOG_PRODUCT_TIER_WEBSITE` (`website_id`),
  CONSTRAINT `FK_CATALOG_PROD_ENTITY_TIER_PRICE_PROD_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TIER_PRICE_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_TIER_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_entity_varchar`
--

DROP TABLE IF EXISTS `catalog_product_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_varchar` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` mediumint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_PRODUCT_ENTITY` (`entity_id`),
  CONSTRAINT `FK_CATALOG_PROD_ENTITY_VARCHAR_PROD_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=354541 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_flat_1`
--

DROP TABLE IF EXISTS `catalog_product_flat_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_flat_1` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `type_id` varchar(32) NOT NULL default 'simple',
  `coming_soon` tinyint(1) default NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `display_name` varchar(255) default NULL,
  `email_template` varchar(255) default NULL,
  `enable_googlecheckout` tinyint(1) default NULL,
  `gift_message_available` tinyint(1) default NULL,
  `end_of_life` tinyint(1) default NULL,
  `giftcard_amounts` decimal(12,4) default NULL,
  `allow_open_amount` int(11) default NULL,
  `giftcard_type` tinyint(3) unsigned default NULL,
  `has_options` smallint(6) NOT NULL default '0',
  `image_label` varchar(255) default NULL,
  `is_redeemable` int(11) default NULL,
  `lifetime` int(11) default NULL,
  `links_purchased_separately` int(11) default NULL,
  `links_title` varchar(255) default NULL,
  `model_number` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `news_from_date` datetime default NULL,
  `news_to_date` datetime default NULL,
  `open_amount_max` decimal(12,4) default NULL,
  `open_amount_min` decimal(12,4) default NULL,
  `pre_order` tinyint(1) default NULL,
  `is_recurring` tinyint(1) default NULL,
  `recurring_profile` text,
  `links_exist` int(11) default NULL,
  `gift_wrapping_available` tinyint(1) default NULL,
  `gift_wrapping_price` decimal(12,4) default NULL,
  `is_imported` tinyint(1) default NULL,
  `price` decimal(12,4) default NULL,
  `price_type` int(11) default NULL,
  `sku_type` int(11) default NULL,
  `price_view` int(11) default NULL,
  `qvc_link` varchar(255) default NULL,
  `required_options` tinyint(3) unsigned NOT NULL default '0',
  `shipment_type` int(11) default NULL,
  `shipping_addon` varchar(255) default NULL,
  `shipping_is_percent` tinyint(1) default NULL,
  `shipping_price` decimal(12,4) default NULL,
  `short_description` text,
  `size` varchar(255) default NULL,
  `features_wifi` varchar(255) default NULL,
  `sku` varchar(64) default NULL,
  `small_image` varchar(255) default NULL,
  `small_image_label` varchar(255) default NULL,
  `special_from_date` datetime default NULL,
  `special_price` decimal(12,4) default NULL,
  `special_to_date` datetime default NULL,
  `cost` decimal(12,4) default NULL,
  `tax_class_id` int(11) default NULL,
  `tech_spec_resolution` varchar(255) default NULL,
  `thumbnail` varchar(255) default NULL,
  `thumbnail_label` varchar(255) default NULL,
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `url_key` varchar(255) default NULL,
  `url_path` varchar(255) default NULL,
  `visibility` tinyint(3) unsigned default NULL,
  `use_config_email_template` int(11) default NULL,
  `use_config_is_redeemable` int(11) default NULL,
  `use_config_lifetime` int(11) default NULL,
  `weight` decimal(12,4) default NULL,
  `weight_type` int(11) default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_TYPE_ID` (`type_id`),
  KEY `IDX_ATRRIBUTE_SET` (`attribute_set_id`),
  KEY `IDX_PRICE` (`price`),
  KEY `IDX_SIZE` (`size`),
  CONSTRAINT `FK_CATALOG_PRODUCT_FLAT_1_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1161 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_flat_4`
--

DROP TABLE IF EXISTS `catalog_product_flat_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_flat_4` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `type_id` varchar(32) NOT NULL default 'simple',
  `coming_soon` tinyint(1) default NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `display_name` varchar(255) default NULL,
  `email_template` varchar(255) default NULL,
  `enable_googlecheckout` tinyint(1) default NULL,
  `gift_message_available` tinyint(1) default NULL,
  `end_of_life` tinyint(1) default NULL,
  `giftcard_amounts` decimal(12,4) default NULL,
  `allow_open_amount` int(11) default NULL,
  `giftcard_type` tinyint(3) unsigned default NULL,
  `has_options` smallint(6) NOT NULL default '0',
  `image_label` varchar(255) default NULL,
  `is_redeemable` int(11) default NULL,
  `lifetime` int(11) default NULL,
  `links_purchased_separately` int(11) default NULL,
  `links_title` varchar(255) default NULL,
  `model_number` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `news_from_date` datetime default NULL,
  `news_to_date` datetime default NULL,
  `open_amount_max` decimal(12,4) default NULL,
  `open_amount_min` decimal(12,4) default NULL,
  `pre_order` tinyint(1) default NULL,
  `is_recurring` tinyint(1) default NULL,
  `recurring_profile` text,
  `links_exist` int(11) default NULL,
  `gift_wrapping_available` tinyint(1) default NULL,
  `gift_wrapping_price` decimal(12,4) default NULL,
  `is_imported` tinyint(1) default NULL,
  `price` decimal(12,4) default NULL,
  `price_type` int(11) default NULL,
  `sku_type` int(11) default NULL,
  `price_view` int(11) default NULL,
  `qvc_link` varchar(255) default NULL,
  `required_options` tinyint(3) unsigned NOT NULL default '0',
  `shipment_type` int(11) default NULL,
  `shipping_addon` varchar(255) default NULL,
  `shipping_is_percent` tinyint(1) default NULL,
  `shipping_price` decimal(12,4) default NULL,
  `short_description` text,
  `size` varchar(255) default NULL,
  `features_wifi` varchar(255) default NULL,
  `sku` varchar(64) default NULL,
  `small_image` varchar(255) default NULL,
  `small_image_label` varchar(255) default NULL,
  `special_from_date` datetime default NULL,
  `special_price` decimal(12,4) default NULL,
  `special_to_date` datetime default NULL,
  `cost` decimal(12,4) default NULL,
  `tax_class_id` int(11) default NULL,
  `tech_spec_resolution` varchar(255) default NULL,
  `thumbnail` varchar(255) default NULL,
  `thumbnail_label` varchar(255) default NULL,
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `url_key` varchar(255) default NULL,
  `url_path` varchar(255) default NULL,
  `visibility` tinyint(3) unsigned default NULL,
  `use_config_email_template` int(11) default NULL,
  `use_config_is_redeemable` int(11) default NULL,
  `use_config_lifetime` int(11) default NULL,
  `weight` decimal(12,4) default NULL,
  `weight_type` int(11) default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_TYPE_ID` (`type_id`),
  KEY `IDX_ATRRIBUTE_SET` (`attribute_set_id`),
  KEY `IDX_PRICE` (`price`),
  KEY `IDX_SIZE` (`size`),
  CONSTRAINT `FK_CATALOG_PRODUCT_FLAT_4_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1147 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_flat_6`
--

DROP TABLE IF EXISTS `catalog_product_flat_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_flat_6` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `type_id` varchar(32) NOT NULL default 'simple',
  `coming_soon` tinyint(1) default NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `display_name` varchar(255) default NULL,
  `email_template` varchar(255) default NULL,
  `enable_googlecheckout` tinyint(1) default NULL,
  `gift_message_available` tinyint(1) default NULL,
  `end_of_life` tinyint(1) default NULL,
  `giftcard_amounts` decimal(12,4) default NULL,
  `allow_open_amount` int(11) default NULL,
  `giftcard_type` tinyint(3) unsigned default NULL,
  `has_options` smallint(6) NOT NULL default '0',
  `image_label` varchar(255) default NULL,
  `is_redeemable` int(11) default NULL,
  `lifetime` int(11) default NULL,
  `links_purchased_separately` int(11) default NULL,
  `links_title` varchar(255) default NULL,
  `model_number` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `news_from_date` datetime default NULL,
  `news_to_date` datetime default NULL,
  `open_amount_max` decimal(12,4) default NULL,
  `open_amount_min` decimal(12,4) default NULL,
  `pre_order` tinyint(1) default NULL,
  `is_recurring` tinyint(1) default NULL,
  `recurring_profile` text,
  `links_exist` int(11) default NULL,
  `gift_wrapping_available` tinyint(1) default NULL,
  `gift_wrapping_price` decimal(12,4) default NULL,
  `is_imported` tinyint(1) default NULL,
  `price` decimal(12,4) default NULL,
  `price_type` int(11) default NULL,
  `sku_type` int(11) default NULL,
  `price_view` int(11) default NULL,
  `qvc_link` varchar(255) default NULL,
  `required_options` tinyint(3) unsigned NOT NULL default '0',
  `shipment_type` int(11) default NULL,
  `shipping_addon` varchar(255) default NULL,
  `shipping_is_percent` tinyint(1) default NULL,
  `shipping_price` decimal(12,4) default NULL,
  `short_description` text,
  `size` varchar(255) default NULL,
  `features_wifi` varchar(255) default NULL,
  `sku` varchar(64) default NULL,
  `small_image` varchar(255) default NULL,
  `small_image_label` varchar(255) default NULL,
  `special_from_date` datetime default NULL,
  `special_price` decimal(12,4) default NULL,
  `special_to_date` datetime default NULL,
  `cost` decimal(12,4) default NULL,
  `tax_class_id` int(11) default NULL,
  `tech_spec_resolution` varchar(255) default NULL,
  `thumbnail` varchar(255) default NULL,
  `thumbnail_label` varchar(255) default NULL,
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `url_key` varchar(255) default NULL,
  `url_path` varchar(255) default NULL,
  `visibility` tinyint(3) unsigned default NULL,
  `use_config_email_template` int(11) default NULL,
  `use_config_is_redeemable` int(11) default NULL,
  `use_config_lifetime` int(11) default NULL,
  `weight` decimal(12,4) default NULL,
  `weight_type` int(11) default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_TYPE_ID` (`type_id`),
  KEY `IDX_ATRRIBUTE_SET` (`attribute_set_id`),
  KEY `IDX_PRICE` (`price`),
  KEY `IDX_SIZE` (`size`),
  CONSTRAINT `FK_CATALOG_PRODUCT_FLAT_6_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=983 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_flat_8`
--

DROP TABLE IF EXISTS `catalog_product_flat_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_flat_8` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `type_id` varchar(32) NOT NULL default 'simple',
  `coming_soon` tinyint(1) default NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `display_name` varchar(255) default NULL,
  `email_template` varchar(255) default NULL,
  `enable_googlecheckout` tinyint(1) default NULL,
  `gift_message_available` tinyint(1) default NULL,
  `end_of_life` tinyint(1) default NULL,
  `giftcard_amounts` decimal(12,4) default NULL,
  `allow_open_amount` int(11) default NULL,
  `giftcard_type` tinyint(3) unsigned default NULL,
  `has_options` smallint(6) NOT NULL default '0',
  `image_label` varchar(255) default NULL,
  `is_redeemable` int(11) default NULL,
  `lifetime` int(11) default NULL,
  `links_purchased_separately` int(11) default NULL,
  `links_title` varchar(255) default NULL,
  `model_number` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `news_from_date` datetime default NULL,
  `news_to_date` datetime default NULL,
  `open_amount_max` decimal(12,4) default NULL,
  `open_amount_min` decimal(12,4) default NULL,
  `pre_order` tinyint(1) default NULL,
  `is_recurring` tinyint(1) default NULL,
  `recurring_profile` text,
  `links_exist` int(11) default NULL,
  `gift_wrapping_available` tinyint(1) default NULL,
  `gift_wrapping_price` decimal(12,4) default NULL,
  `is_imported` tinyint(1) default NULL,
  `price` decimal(12,4) default NULL,
  `price_type` int(11) default NULL,
  `sku_type` int(11) default NULL,
  `price_view` int(11) default NULL,
  `qvc_link` varchar(255) default NULL,
  `required_options` tinyint(3) unsigned NOT NULL default '0',
  `shipment_type` int(11) default NULL,
  `shipping_addon` varchar(255) default NULL,
  `shipping_is_percent` tinyint(1) default NULL,
  `shipping_price` decimal(12,4) default NULL,
  `short_description` text,
  `size` varchar(255) default NULL,
  `features_wifi` varchar(255) default NULL,
  `sku` varchar(64) default NULL,
  `small_image` varchar(255) default NULL,
  `small_image_label` varchar(255) default NULL,
  `special_from_date` datetime default NULL,
  `special_price` decimal(12,4) default NULL,
  `special_to_date` datetime default NULL,
  `cost` decimal(12,4) default NULL,
  `tax_class_id` int(11) default NULL,
  `tech_spec_resolution` varchar(255) default NULL,
  `thumbnail` varchar(255) default NULL,
  `thumbnail_label` varchar(255) default NULL,
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `url_key` varchar(255) default NULL,
  `url_path` varchar(255) default NULL,
  `visibility` tinyint(3) unsigned default NULL,
  `use_config_email_template` int(11) default NULL,
  `use_config_is_redeemable` int(11) default NULL,
  `use_config_lifetime` int(11) default NULL,
  `weight` decimal(12,4) default NULL,
  `weight_type` int(11) default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_TYPE_ID` (`type_id`),
  KEY `IDX_ATRRIBUTE_SET` (`attribute_set_id`),
  KEY `IDX_PRICE` (`price`),
  KEY `IDX_SIZE` (`size`),
  CONSTRAINT `FK_CATALOG_PRODUCT_FLAT_8_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=983 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_flat_9`
--

DROP TABLE IF EXISTS `catalog_product_flat_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_flat_9` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `type_id` varchar(32) NOT NULL default 'simple',
  `coming_soon` tinyint(1) default NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `display_name` varchar(255) default NULL,
  `email_template` varchar(255) default NULL,
  `enable_googlecheckout` tinyint(1) default NULL,
  `gift_message_available` tinyint(1) default NULL,
  `end_of_life` tinyint(1) default NULL,
  `giftcard_amounts` decimal(12,4) default NULL,
  `allow_open_amount` int(11) default NULL,
  `giftcard_type` tinyint(3) unsigned default NULL,
  `has_options` smallint(6) NOT NULL default '0',
  `image_label` varchar(255) default NULL,
  `is_redeemable` int(11) default NULL,
  `lifetime` int(11) default NULL,
  `links_purchased_separately` int(11) default NULL,
  `links_title` varchar(255) default NULL,
  `model_number` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `news_from_date` datetime default NULL,
  `news_to_date` datetime default NULL,
  `open_amount_max` decimal(12,4) default NULL,
  `open_amount_min` decimal(12,4) default NULL,
  `pre_order` tinyint(1) default NULL,
  `is_recurring` tinyint(1) default NULL,
  `recurring_profile` text,
  `links_exist` int(11) default NULL,
  `gift_wrapping_available` tinyint(1) default NULL,
  `gift_wrapping_price` decimal(12,4) default NULL,
  `is_imported` tinyint(1) default NULL,
  `price` decimal(12,4) default NULL,
  `price_type` int(11) default NULL,
  `sku_type` int(11) default NULL,
  `price_view` int(11) default NULL,
  `qvc_link` varchar(255) default NULL,
  `required_options` tinyint(3) unsigned NOT NULL default '0',
  `shipment_type` int(11) default NULL,
  `shipping_addon` varchar(255) default NULL,
  `shipping_is_percent` tinyint(1) default NULL,
  `shipping_price` decimal(12,4) default NULL,
  `short_description` text,
  `size` varchar(255) default NULL,
  `features_wifi` varchar(255) default NULL,
  `sku` varchar(64) default NULL,
  `small_image` varchar(255) default NULL,
  `small_image_label` varchar(255) default NULL,
  `special_from_date` datetime default NULL,
  `special_price` decimal(12,4) default NULL,
  `special_to_date` datetime default NULL,
  `cost` decimal(12,4) default NULL,
  `tax_class_id` int(11) default NULL,
  `tech_spec_resolution` varchar(255) default NULL,
  `thumbnail` varchar(255) default NULL,
  `thumbnail_label` varchar(255) default NULL,
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `url_key` varchar(255) default NULL,
  `url_path` varchar(255) default NULL,
  `visibility` tinyint(3) unsigned default NULL,
  `use_config_email_template` int(11) default NULL,
  `use_config_is_redeemable` int(11) default NULL,
  `use_config_lifetime` int(11) default NULL,
  `weight` decimal(12,4) default NULL,
  `weight_type` int(11) default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_TYPE_ID` (`type_id`),
  KEY `IDX_ATRRIBUTE_SET` (`attribute_set_id`),
  KEY `IDX_PRICE` (`price`),
  KEY `IDX_SIZE` (`size`),
  CONSTRAINT `FK_CATALOG_PRODUCT_FLAT_9_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1163 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_eav`
--

DROP TABLE IF EXISTS `catalog_product_index_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav` (
  `entity_id` int(10) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_VALUE` (`value`),
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_eav_decimal`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_decimal` (
  `entity_id` int(10) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` decimal(12,4) NOT NULL,
  PRIMARY KEY  (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_VALUE` (`value`),
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_eav_decimal_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_decimal_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` decimal(12,4) NOT NULL,
  PRIMARY KEY  (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_eav_decimal_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_decimal_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` decimal(12,4) NOT NULL,
  PRIMARY KEY  (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_eav_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_eav_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price`
--

DROP TABLE IF EXISTS `catalog_product_index_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `tax_class_id` smallint(5) unsigned default '0',
  `price` decimal(12,4) default NULL,
  `final_price` decimal(12,4) default NULL,
  `min_price` decimal(12,4) default NULL,
  `max_price` decimal(12,4) default NULL,
  `tier_price` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `IDX_WEBSITE` (`website_id`),
  KEY `IDX_MIN_PRICE` (`min_price`),
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_PRICE_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_bundle_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `tax_class_id` smallint(5) unsigned default '0',
  `price_type` tinyint(1) unsigned NOT NULL,
  `special_price` decimal(12,4) default NULL,
  `tier_percent` decimal(12,4) default NULL,
  `orig_price` decimal(12,4) default NULL,
  `price` decimal(12,4) default NULL,
  `min_price` decimal(12,4) default NULL,
  `max_price` decimal(12,4) default NULL,
  `tier_price` decimal(12,4) default NULL,
  `base_tier` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_bundle_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL default '0',
  `min_price` decimal(12,4) default NULL,
  `alt_price` decimal(12,4) default NULL,
  `max_price` decimal(12,4) default NULL,
  `tier_price` decimal(12,4) default NULL,
  `alt_tier_price` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_bundle_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL default '0',
  `min_price` decimal(12,4) default NULL,
  `alt_price` decimal(12,4) default NULL,
  `max_price` decimal(12,4) default NULL,
  `tier_price` decimal(12,4) default NULL,
  `alt_tier_price` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_bundle_sel_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_sel_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_sel_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL default '0',
  `selection_id` int(10) unsigned NOT NULL default '0',
  `group_type` tinyint(1) unsigned default '0',
  `is_required` tinyint(1) unsigned default '0',
  `price` decimal(12,4) default NULL,
  `tier_price` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_bundle_sel_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_sel_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_sel_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL default '0',
  `selection_id` int(10) unsigned NOT NULL default '0',
  `group_type` tinyint(1) unsigned default '0',
  `is_required` tinyint(1) unsigned default '0',
  `price` decimal(12,4) default NULL,
  `tier_price` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_bundle_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `tax_class_id` smallint(5) unsigned default '0',
  `price_type` tinyint(1) unsigned NOT NULL,
  `special_price` decimal(12,4) default NULL,
  `tier_percent` decimal(12,4) default NULL,
  `orig_price` decimal(12,4) default NULL,
  `price` decimal(12,4) default NULL,
  `min_price` decimal(12,4) default NULL,
  `max_price` decimal(12,4) default NULL,
  `tier_price` decimal(12,4) default NULL,
  `base_tier` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_agr_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_agr_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_agr_idx` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `price` decimal(12,4) default NULL,
  `tier_price` decimal(12,4) default NULL,
  PRIMARY KEY  (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_agr_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_agr_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_agr_tmp` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `price` decimal(12,4) default NULL,
  `tier_price` decimal(12,4) default NULL,
  PRIMARY KEY  (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `min_price` decimal(12,4) default NULL,
  `max_price` decimal(12,4) default NULL,
  `tier_price` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `min_price` decimal(12,4) default NULL,
  `max_price` decimal(12,4) default NULL,
  `tier_price` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_downlod_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_downlod_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_downlod_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `min_price` decimal(12,4) default NULL,
  `max_price` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_downlod_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_downlod_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_downlod_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `min_price` decimal(12,4) default NULL,
  `max_price` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_final_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_final_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_final_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `tax_class_id` smallint(5) unsigned default '0',
  `orig_price` decimal(12,4) default NULL,
  `price` decimal(12,4) default NULL,
  `min_price` decimal(12,4) default NULL,
  `max_price` decimal(12,4) default NULL,
  `tier_price` decimal(12,4) default NULL,
  `base_tier` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_final_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_final_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_final_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `tax_class_id` smallint(5) unsigned default '0',
  `orig_price` decimal(12,4) default NULL,
  `price` decimal(12,4) default NULL,
  `min_price` decimal(12,4) default NULL,
  `max_price` decimal(12,4) default NULL,
  `tier_price` decimal(12,4) default NULL,
  `base_tier` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `tax_class_id` smallint(5) unsigned default '0',
  `price` decimal(12,4) default NULL,
  `final_price` decimal(12,4) default NULL,
  `min_price` decimal(12,4) default NULL,
  `max_price` decimal(12,4) default NULL,
  `tier_price` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `IDX_WEBSITE` (`website_id`),
  KEY `IDX_MIN_PRICE` (`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_opt_agr_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_agr_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_opt_agr_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL default '0',
  `min_price` decimal(12,4) default NULL,
  `max_price` decimal(12,4) default NULL,
  `tier_price` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_opt_agr_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_agr_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_opt_agr_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL default '0',
  `min_price` decimal(12,4) default NULL,
  `max_price` decimal(12,4) default NULL,
  `tier_price` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `min_price` decimal(12,4) default NULL,
  `max_price` decimal(12,4) default NULL,
  `tier_price` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `min_price` decimal(12,4) default NULL,
  `max_price` decimal(12,4) default NULL,
  `tier_price` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `tax_class_id` smallint(5) unsigned default '0',
  `price` decimal(12,4) default NULL,
  `final_price` decimal(12,4) default NULL,
  `min_price` decimal(12,4) default NULL,
  `max_price` decimal(12,4) default NULL,
  `tier_price` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `IDX_WEBSITE` (`website_id`),
  KEY `IDX_MIN_PRICE` (`min_price`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_tier_price`
--

DROP TABLE IF EXISTS `catalog_product_index_tier_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_tier_price` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `min_price` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`,`customer_group_id`,`website_id`),
  KEY `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER` (`customer_group_id`),
  KEY `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE` (`website_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_website`
--

DROP TABLE IF EXISTS `catalog_product_index_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_website` (
  `website_id` smallint(5) unsigned NOT NULL,
  `date` date default NULL,
  `rate` float(12,4) unsigned default '1.0000',
  PRIMARY KEY  (`website_id`),
  KEY `IDX_DATE` (`date`),
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_link`
--

DROP TABLE IF EXISTS `catalog_product_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link` (
  `link_id` int(11) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL default '0',
  `linked_product_id` int(10) unsigned NOT NULL default '0',
  `link_type_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`link_id`),
  UNIQUE KEY `IDX_UNIQUE` (`link_type_id`,`product_id`,`linked_product_id`),
  KEY `FK_LINK_PRODUCT` (`product_id`),
  KEY `FK_LINKED_PRODUCT` (`linked_product_id`),
  KEY `FK_PRODUCT_LINK_TYPE` (`link_type_id`),
  CONSTRAINT `FK_PRODUCT_LINK_LINKED_PRODUCT` FOREIGN KEY (`linked_product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_LINK_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_LINK_TYPE` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12229 DEFAULT CHARSET=utf8 COMMENT='Related products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_link_attribute`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_attribute` (
  `product_link_attribute_id` smallint(6) unsigned NOT NULL auto_increment,
  `link_type_id` tinyint(3) unsigned NOT NULL default '0',
  `product_link_attribute_code` varchar(32) NOT NULL default '',
  `data_type` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`product_link_attribute_id`),
  KEY `FK_ATTRIBUTE_PRODUCT_LINK_TYPE` (`link_type_id`),
  CONSTRAINT `FK_ATTRIBUTE_PRODUCT_LINK_TYPE` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Attributes for product link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_link_attribute_decimal`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_attribute_decimal` (
  `value_id` int(11) unsigned NOT NULL auto_increment,
  `product_link_attribute_id` smallint(6) unsigned default NULL,
  `link_id` int(11) unsigned default NULL,
  `value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`value_id`),
  KEY `FK_DECIMAL_PRODUCT_LINK_ATTRIBUTE` (`product_link_attribute_id`),
  KEY `FK_DECIMAL_LINK` (`link_id`),
  CONSTRAINT `FK_DECIMAL_LINK` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DECIMAL_PRODUCT_LINK_ATTRIBUTE` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4107 DEFAULT CHARSET=utf8 COMMENT='Decimal attributes values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_link_attribute_int`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_attribute_int` (
  `value_id` int(11) unsigned NOT NULL auto_increment,
  `product_link_attribute_id` smallint(6) unsigned default NULL,
  `link_id` int(11) unsigned default NULL,
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_product_link_attribute_id_link_id` (`product_link_attribute_id`,`link_id`),
  KEY `FK_INT_PRODUCT_LINK_ATTRIBUTE` (`product_link_attribute_id`),
  KEY `FK_INT_PRODUCT_LINK` (`link_id`),
  CONSTRAINT `FK_INT_PRODUCT_LINK` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_INT_PRODUCT_LINK_ATTRIBUTE` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12037 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_link_attribute_varchar`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_attribute_varchar` (
  `value_id` int(11) unsigned NOT NULL auto_increment,
  `product_link_attribute_id` smallint(6) unsigned NOT NULL default '0',
  `link_id` int(11) unsigned default NULL,
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  KEY `FK_VARCHAR_PRODUCT_LINK_ATTRIBUTE` (`product_link_attribute_id`),
  KEY `FK_VARCHAR_LINK` (`link_id`),
  CONSTRAINT `FK_VARCHAR_LINK` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_VARCHAR_PRODUCT_LINK_ATTRIBUTE` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Varchar attributes values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_link_type`
--

DROP TABLE IF EXISTS `catalog_product_link_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_type` (
  `link_type_id` tinyint(3) unsigned NOT NULL auto_increment,
  `code` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`link_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Types of product link(Related, superproduct, bundles)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_option`
--

DROP TABLE IF EXISTS `catalog_product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option` (
  `option_id` int(10) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL default '0',
  `type` varchar(50) NOT NULL default '',
  `is_require` tinyint(1) NOT NULL default '1',
  `sku` varchar(64) NOT NULL default '',
  `max_characters` int(10) unsigned default NULL,
  `file_extension` varchar(50) default NULL,
  `image_size_x` smallint(5) unsigned NOT NULL,
  `image_size_y` smallint(5) unsigned NOT NULL,
  `sort_order` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRODUCT` (`product_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_option_price`
--

DROP TABLE IF EXISTS `catalog_product_option_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_price` (
  `option_price_id` int(10) unsigned NOT NULL auto_increment,
  `option_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `price` decimal(12,4) NOT NULL default '0.0000',
  `price_type` enum('fixed','percent') NOT NULL default 'fixed',
  PRIMARY KEY  (`option_price_id`),
  UNIQUE KEY `UNQ_OPTION_STORE` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRICE_OPTION` (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_PRICE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_PRICE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_option_title`
--

DROP TABLE IF EXISTS `catalog_product_option_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_title` (
  `option_title_id` int(10) unsigned NOT NULL auto_increment,
  `option_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`option_title_id`),
  UNIQUE KEY `UNQ_OPTION_STORE` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_OPTION` (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TITLE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_option_type_price`
--

DROP TABLE IF EXISTS `catalog_product_option_type_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_type_price` (
  `option_type_price_id` int(10) unsigned NOT NULL auto_increment,
  `option_type_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `price` decimal(12,4) NOT NULL default '0.0000',
  `price_type` enum('fixed','percent') NOT NULL default 'fixed',
  PRIMARY KEY  (`option_type_price_id`),
  UNIQUE KEY `UNQ_OPTION_TYPE_STORE` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE` (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_option_type_title`
--

DROP TABLE IF EXISTS `catalog_product_option_type_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_type_title` (
  `option_type_title_id` int(10) unsigned NOT NULL auto_increment,
  `option_type_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`option_type_title_id`),
  UNIQUE KEY `UNQ_OPTION_TYPE_STORE` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION` (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_option_type_value`
--

DROP TABLE IF EXISTS `catalog_product_option_type_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_type_value` (
  `option_type_id` int(10) unsigned NOT NULL auto_increment,
  `option_id` int(10) unsigned NOT NULL default '0',
  `sku` varchar(64) NOT NULL default '',
  `sort_order` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION` (`option_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_relation`
--

DROP TABLE IF EXISTS `catalog_product_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_relation` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`parent_id`,`child_id`),
  KEY `IDX_CHILD` (`child_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_RELATION_CHILD` FOREIGN KEY (`child_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_RELATION_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_super_attribute`
--

DROP TABLE IF EXISTS `catalog_product_super_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_super_attribute` (
  `product_super_attribute_id` int(10) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `position` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`product_super_attribute_id`),
  UNIQUE KEY `UNQ_product_id_attribute_id` (`product_id`,`attribute_id`),
  KEY `FK_SUPER_PRODUCT_ATTRIBUTE_PRODUCT` (`product_id`),
  CONSTRAINT `FK_SUPER_PRODUCT_ATTRIBUTE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_super_attribute_label`
--

DROP TABLE IF EXISTS `catalog_product_super_attribute_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_super_attribute_label` (
  `value_id` int(10) unsigned NOT NULL auto_increment,
  `product_super_attribute_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `use_default` tinyint(1) unsigned default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ATTRIBUTE_STORE` (`product_super_attribute_id`,`store_id`),
  KEY `FK_SUPER_PRODUCT_ATTRIBUTE_LABEL` (`product_super_attribute_id`),
  KEY `FK_CATALOG_PROD_SUPER_ATTR_LABEL_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PROD_SUPER_ATTR_LABEL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PROD_SUPER_ATTR_LABEL_ATTR` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_super_attribute_pricing`
--

DROP TABLE IF EXISTS `catalog_product_super_attribute_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_super_attribute_pricing` (
  `value_id` int(10) unsigned NOT NULL auto_increment,
  `product_super_attribute_id` int(10) unsigned NOT NULL default '0',
  `value_index` varchar(255) NOT NULL default '',
  `is_percent` tinyint(1) unsigned default '0',
  `pricing_value` decimal(12,4) default NULL,
  `website_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_product_super_attribute_id_value_index_website_id` (`product_super_attribute_id`,`value_index`,`website_id`),
  KEY `FK_SUPER_PRODUCT_ATTRIBUTE_PRICING` (`product_super_attribute_id`),
  KEY `FK_CATALOG_PRODUCT_SUPER_PRICE_WEBSITE` (`website_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_SUPER_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SUPER_PRODUCT_ATTRIBUTE_PRICING` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_super_link`
--

DROP TABLE IF EXISTS `catalog_product_super_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_super_link` (
  `link_id` int(10) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL default '0',
  `parent_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`link_id`),
  UNIQUE KEY `UNQ_product_id_parent_id` (`product_id`,`parent_id`),
  KEY `FK_SUPER_PRODUCT_LINK_PARENT` (`parent_id`),
  KEY `FK_catalog_product_super_link` (`product_id`),
  CONSTRAINT `FK_SUPER_PRODUCT_LINK_ENTITY` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SUPER_PRODUCT_LINK_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_website`
--

DROP TABLE IF EXISTS `catalog_product_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_website` (
  `product_id` int(10) unsigned NOT NULL auto_increment,
  `website_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`product_id`,`website_id`),
  KEY `FK_CATALOG_PRODUCT_WEBSITE_WEBSITE` (`website_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_WEBSITE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_WEBSITE_PRODUCT_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1167 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogindex_aggregation`
--

DROP TABLE IF EXISTS `catalogindex_aggregation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogindex_aggregation` (
  `aggregation_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `key` varchar(255) default NULL,
  `data` mediumtext,
  PRIMARY KEY  (`aggregation_id`),
  UNIQUE KEY `IDX_STORE_KEY` (`store_id`,`key`),
  CONSTRAINT `FK_CATALOGINDEX_AGGREGATION_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogindex_aggregation_tag`
--

DROP TABLE IF EXISTS `catalogindex_aggregation_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogindex_aggregation_tag` (
  `tag_id` int(10) unsigned NOT NULL auto_increment,
  `tag_code` varchar(255) NOT NULL,
  PRIMARY KEY  (`tag_id`),
  UNIQUE KEY `IDX_CODE` (`tag_code`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogindex_aggregation_to_tag`
--

DROP TABLE IF EXISTS `catalogindex_aggregation_to_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogindex_aggregation_to_tag` (
  `aggregation_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `IDX_AGGREGATION_TAG` (`aggregation_id`,`tag_id`),
  KEY `FK_CATALOGINDEX_AGGREGATION_TO_TAG_TAG` (`tag_id`),
  CONSTRAINT `FK_CATALOGINDEX_AGGREGATION_TO_TAG_AGGREGATION` FOREIGN KEY (`aggregation_id`) REFERENCES `catalogindex_aggregation` (`aggregation_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINDEX_AGGREGATION_TO_TAG_TAG` FOREIGN KEY (`tag_id`) REFERENCES `catalogindex_aggregation_tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogindex_eav`
--

DROP TABLE IF EXISTS `catalogindex_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogindex_eav` (
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`store_id`,`entity_id`,`attribute_id`,`value`),
  KEY `IDX_VALUE` (`value`),
  KEY `FK_CATALOGINDEX_EAV_ENTITY` (`entity_id`),
  KEY `FK_CATALOGINDEX_EAV_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOGINDEX_EAV_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOGINDEX_EAV_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINDEX_EAV_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINDEX_EAV_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogindex_minimal_price`
--

DROP TABLE IF EXISTS `catalogindex_minimal_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogindex_minimal_price` (
  `index_id` int(10) unsigned NOT NULL auto_increment,
  `entity_id` int(10) unsigned NOT NULL default '0',
  `customer_group_id` smallint(3) unsigned NOT NULL default '0',
  `qty` decimal(12,4) unsigned NOT NULL default '0.0000',
  `value` decimal(12,4) NOT NULL default '0.0000',
  `tax_class_id` smallint(6) NOT NULL default '0',
  `website_id` smallint(5) unsigned default NULL,
  PRIMARY KEY  (`index_id`),
  KEY `IDX_VALUE` (`value`),
  KEY `IDX_QTY` (`qty`),
  KEY `FK_CATALOGINDEX_MINIMAL_PRICE_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `FK_CI_MINIMAL_PRICE_WEBSITE_ID` (`website_id`),
  KEY `IDX_FULL` (`entity_id`,`qty`,`customer_group_id`,`value`,`website_id`),
  CONSTRAINT `FK_CATALOGINDEX_MINIMAL_PRICE_CUSTOMER_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINDEX_MINIMAL_PRICE_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CI_MINIMAL_PRICE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogindex_price`
--

DROP TABLE IF EXISTS `catalogindex_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogindex_price` (
  `entity_id` int(10) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `customer_group_id` smallint(3) unsigned NOT NULL default '0',
  `qty` decimal(12,4) unsigned NOT NULL default '0.0000',
  `value` decimal(12,4) NOT NULL default '0.0000',
  `tax_class_id` smallint(6) NOT NULL default '0',
  `website_id` smallint(5) unsigned default NULL,
  KEY `IDX_VALUE` (`value`),
  KEY `IDX_QTY` (`qty`),
  KEY `FK_CATALOGINDEX_PRICE_ENTITY` (`entity_id`),
  KEY `FK_CATALOGINDEX_PRICE_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOGINDEX_PRICE_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `IDX_RANGE_VALUE` (`entity_id`,`attribute_id`,`customer_group_id`,`value`),
  KEY `FK_CI_PRICE_WEBSITE_ID` (`website_id`),
  KEY `IDX_FULL` (`entity_id`,`attribute_id`,`customer_group_id`,`value`,`website_id`),
  CONSTRAINT `FK_CATALOGINDEX_PRICE_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINDEX_PRICE_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CI_PRICE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cataloginventory_stock`
--

DROP TABLE IF EXISTS `cataloginventory_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock` (
  `stock_id` smallint(4) unsigned NOT NULL auto_increment,
  `stock_name` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Catalog inventory Stocks list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cataloginventory_stock_item`
--

DROP TABLE IF EXISTS `cataloginventory_stock_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock_item` (
  `item_id` int(10) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL default '0',
  `stock_id` smallint(4) unsigned NOT NULL default '0',
  `qty` decimal(12,4) NOT NULL default '0.0000',
  `min_qty` decimal(12,4) NOT NULL default '0.0000',
  `use_config_min_qty` tinyint(1) unsigned NOT NULL default '1',
  `is_qty_decimal` tinyint(1) unsigned NOT NULL default '0',
  `backorders` tinyint(3) unsigned NOT NULL default '0',
  `use_config_backorders` tinyint(1) unsigned NOT NULL default '1',
  `min_sale_qty` decimal(12,4) NOT NULL default '1.0000',
  `use_config_min_sale_qty` tinyint(1) unsigned NOT NULL default '1',
  `max_sale_qty` decimal(12,4) NOT NULL default '0.0000',
  `use_config_max_sale_qty` tinyint(1) unsigned NOT NULL default '1',
  `is_in_stock` tinyint(1) unsigned NOT NULL default '0',
  `low_stock_date` datetime default NULL,
  `notify_stock_qty` decimal(12,4) default NULL,
  `use_config_notify_stock_qty` tinyint(1) unsigned NOT NULL default '1',
  `manage_stock` tinyint(1) unsigned NOT NULL default '0',
  `use_config_manage_stock` tinyint(1) unsigned NOT NULL default '1',
  `stock_status_changed_automatically` tinyint(1) unsigned NOT NULL default '0',
  `use_config_qty_increments` tinyint(1) unsigned NOT NULL default '1',
  `qty_increments` decimal(12,4) NOT NULL default '0.0000',
  `use_config_enable_qty_increments` tinyint(1) unsigned NOT NULL default '1',
  `enable_qty_increments` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`item_id`),
  UNIQUE KEY `IDX_STOCK_PRODUCT` (`product_id`,`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_ITEM_PRODUCT` (`product_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_ITEM_STOCK` (`stock_id`),
  CONSTRAINT `FK_CATALOGINVENTORY_STOCK_ITEM_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINVENTORY_STOCK_ITEM_STOCK` FOREIGN KEY (`stock_id`) REFERENCES `cataloginventory_stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1115 DEFAULT CHARSET=utf8 COMMENT='Inventory Stock Item Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cataloginventory_stock_status`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock_status` (
  `product_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `stock_id` smallint(4) unsigned NOT NULL,
  `qty` decimal(12,4) NOT NULL default '0.0000',
  `stock_status` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`product_id`,`website_id`,`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_STATUS_STOCK` (`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_STATUS_WEBSITE` (`website_id`),
  CONSTRAINT `FK_CATALOGINVENTORY_STOCK_STATUS_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINVENTORY_STOCK_STATUS_STOCK` FOREIGN KEY (`stock_id`) REFERENCES `cataloginventory_stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINVENTORY_STOCK_STATUS_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cataloginventory_stock_status_idx`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock_status_idx` (
  `product_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `stock_id` smallint(4) unsigned NOT NULL,
  `qty` decimal(12,4) NOT NULL default '0.0000',
  `stock_status` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`product_id`,`website_id`,`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_STATUS_STOCK` (`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_STATUS_WEBSITE` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cataloginventory_stock_status_tmp`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock_status_tmp` (
  `product_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `stock_id` smallint(4) unsigned NOT NULL,
  `qty` decimal(12,4) NOT NULL default '0.0000',
  `stock_status` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`product_id`,`website_id`,`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_STATUS_STOCK` (`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_STATUS_WEBSITE` (`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogrule`
--

DROP TABLE IF EXISTS `catalogrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule` (
  `rule_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `from_date` date default NULL,
  `to_date` date default NULL,
  `customer_group_ids` text,
  `is_active` tinyint(1) NOT NULL default '0',
  `conditions_serialized` mediumtext NOT NULL,
  `actions_serialized` mediumtext NOT NULL,
  `stop_rules_processing` tinyint(1) NOT NULL default '1',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `simple_action` varchar(32) NOT NULL,
  `discount_amount` decimal(12,4) NOT NULL,
  `website_ids` text,
  PRIMARY KEY  (`rule_id`),
  KEY `sort_order` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogrule_affected_product`
--

DROP TABLE IF EXISTS `catalogrule_affected_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_affected_product` (
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogrule_group_website`
--

DROP TABLE IF EXISTS `catalogrule_group_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_group_website` (
  `rule_id` int(10) unsigned NOT NULL default '0',
  `customer_group_id` smallint(5) unsigned NOT NULL default '0',
  `website_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`rule_id`,`customer_group_id`,`website_id`),
  KEY `rule_id` (`rule_id`),
  KEY `customer_group_id` (`customer_group_id`),
  KEY `website_id` (`website_id`),
  CONSTRAINT `FK_CATALOGRULE_GROUP_WEBSITE_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGRULE_GROUP_WEBSITE_RULE` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGRULE_GROUP_WEBSITE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogrule_product`
--

DROP TABLE IF EXISTS `catalogrule_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_product` (
  `rule_product_id` int(10) unsigned NOT NULL auto_increment,
  `rule_id` int(10) unsigned NOT NULL default '0',
  `from_time` int(10) unsigned NOT NULL default '0',
  `to_time` int(10) unsigned NOT NULL default '0',
  `customer_group_id` smallint(5) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `action_operator` enum('to_fixed','to_percent','by_fixed','by_percent') NOT NULL default 'to_fixed',
  `action_amount` decimal(12,4) NOT NULL default '0.0000',
  `action_stop` tinyint(1) NOT NULL default '0',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `website_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`rule_product_id`),
  UNIQUE KEY `sort_order` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `FK_catalogrule_product_rule` (`rule_id`),
  KEY `FK_catalogrule_product_customergroup` (`customer_group_id`),
  KEY `FK_catalogrule_product_website` (`website_id`),
  KEY `FK_CATALOGRULE_PRODUCT_PRODUCT` (`product_id`),
  KEY `IDX_FROM_TIME` (`from_time`),
  KEY `IDX_TO_TIME` (`to_time`),
  CONSTRAINT `FK_catalogrule_product_customergroup` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGRULE_PRODUCT_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_catalogrule_product_rule` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_catalogrule_product_website` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogrule_product_price`
--

DROP TABLE IF EXISTS `catalogrule_product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_product_price` (
  `rule_product_price_id` int(10) unsigned NOT NULL auto_increment,
  `rule_date` date NOT NULL default '0000-00-00',
  `customer_group_id` smallint(5) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `rule_price` decimal(12,4) NOT NULL default '0.0000',
  `website_id` smallint(5) unsigned NOT NULL,
  `latest_start_date` date default NULL,
  `earliest_end_date` date default NULL,
  PRIMARY KEY  (`rule_product_price_id`),
  UNIQUE KEY `rule_date` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `FK_catalogrule_product_price_customergroup` (`customer_group_id`),
  KEY `FK_catalogrule_product_price_website` (`website_id`),
  KEY `FK_CATALOGRULE_PRODUCT_PRICE_PRODUCT` (`product_id`),
  CONSTRAINT `FK_catalogrule_product_price_customergroup` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGRULE_PRODUCT_PRICE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_catalogrule_product_price_website` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogsearch_fulltext`
--

DROP TABLE IF EXISTS `catalogsearch_fulltext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogsearch_fulltext` (
  `product_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `data_index` longtext NOT NULL,
  PRIMARY KEY  (`product_id`,`store_id`),
  FULLTEXT KEY `data_index` (`data_index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogsearch_query`
--

DROP TABLE IF EXISTS `catalogsearch_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogsearch_query` (
  `query_id` int(10) unsigned NOT NULL auto_increment,
  `query_text` varchar(255) NOT NULL default '',
  `num_results` int(10) unsigned NOT NULL default '0',
  `popularity` int(10) unsigned NOT NULL default '0',
  `redirect` varchar(255) NOT NULL default '',
  `synonym_for` varchar(255) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `display_in_terms` tinyint(1) NOT NULL default '1',
  `is_active` tinyint(1) default '1',
  `is_processed` tinyint(1) default '0',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`query_id`),
  KEY `FK_CATALOGSEARCH_QUERY_STORE` (`store_id`),
  KEY `IDX_SEARCH_QUERY` (`query_text`,`store_id`,`popularity`),
  KEY `num_results` (`num_results`),
  KEY `query_text` (`query_text`),
  KEY `IDX_SEARCH_REC` (`query_text`,`store_id`,`num_results`),
  CONSTRAINT `FK_CATALOGSEARCH_QUERY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=839987 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogsearch_recommendations`
--

DROP TABLE IF EXISTS `catalogsearch_recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogsearch_recommendations` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `query_id` int(10) unsigned NOT NULL,
  `relation_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_EE_REMINDER_SEARCH_QUERY` (`query_id`),
  KEY `FK_EE_REMINDER_SEARCH_RELATION` (`relation_id`),
  CONSTRAINT `FK_EE_REMINDER_SEARCH_RELATION` FOREIGN KEY (`relation_id`) REFERENCES `catalogsearch_query` (`query_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EE_REMINDER_SEARCH_QUERY` FOREIGN KEY (`query_id`) REFERENCES `catalogsearch_query` (`query_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogsearch_result`
--

DROP TABLE IF EXISTS `catalogsearch_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogsearch_result` (
  `query_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `relevance` decimal(6,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`query_id`,`product_id`),
  KEY `IDX_QUERY` (`query_id`),
  KEY `IDX_PRODUCT` (`product_id`),
  KEY `IDX_RELEVANCE` (`query_id`,`relevance`),
  CONSTRAINT `FK_CATALOGSEARCH_RESULT_CATALOG_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGSEARCH_RESULT_QUERY` FOREIGN KEY (`query_id`) REFERENCES `catalogsearch_query` (`query_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `centerax_akismet`
--

DROP TABLE IF EXISTS `centerax_akismet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centerax_akismet` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `type` enum('contact','review') NOT NULL default 'contact',
  `status` int(1) unsigned NOT NULL default '1' COMMENT 'SPAM status',
  `extra` text NOT NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25935 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `checkout_agreement`
--

DROP TABLE IF EXISTS `checkout_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_agreement` (
  `agreement_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `content` text NOT NULL,
  `content_height` varchar(25) default NULL,
  `checkbox_text` text NOT NULL,
  `is_active` tinyint(4) NOT NULL default '0',
  `is_html` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`agreement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `checkout_agreement_store`
--

DROP TABLE IF EXISTS `checkout_agreement_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_agreement_store` (
  `agreement_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `agreement_id` (`agreement_id`,`store_id`),
  KEY `FK_CHECKOUT_AGREEMENT_STORE` (`store_id`),
  CONSTRAINT `FK_CHECKOUT_AGREEMENT` FOREIGN KEY (`agreement_id`) REFERENCES `checkout_agreement` (`agreement_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CHECKOUT_AGREEMENT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chronopay_api_debug`
--

DROP TABLE IF EXISTS `chronopay_api_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chronopay_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `debug_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY  (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_block`
--

DROP TABLE IF EXISTS `cms_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_block` (
  `block_id` smallint(6) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `identifier` varchar(255) NOT NULL default '',
  `content` mediumtext,
  `creation_time` datetime default NULL,
  `update_time` datetime default NULL,
  `is_active` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`block_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COMMENT='CMS Blocks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_block_store`
--

DROP TABLE IF EXISTS `cms_block_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_block_store` (
  `block_id` smallint(6) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`block_id`,`store_id`),
  KEY `FK_CMS_BLOCK_STORE_STORE` (`store_id`),
  CONSTRAINT `FK_CMS_BLOCK_STORE_BLOCK` FOREIGN KEY (`block_id`) REFERENCES `cms_block` (`block_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CMS_BLOCK_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Blocks to Stores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_page`
--

DROP TABLE IF EXISTS `cms_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page` (
  `page_id` smallint(6) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `root_template` varchar(255) NOT NULL default '',
  `meta_keywords` text NOT NULL,
  `meta_description` text NOT NULL,
  `identifier` varchar(100) NOT NULL default '',
  `content_heading` varchar(255) NOT NULL default '',
  `content` mediumtext,
  `creation_time` datetime default NULL,
  `update_time` datetime default NULL,
  `is_active` tinyint(1) NOT NULL default '1',
  `sort_order` tinyint(4) NOT NULL default '0',
  `layout_update_xml` text,
  `custom_theme` varchar(100) default NULL,
  `custom_root_template` varchar(255) NOT NULL default '',
  `custom_layout_update_xml` text,
  `custom_theme_from` date default NULL,
  `custom_theme_to` date default NULL,
  `published_revision_id` int(10) unsigned default NULL,
  `website_root` tinyint(1) NOT NULL default '1',
  `under_version_control` tinyint(1) unsigned default '0',
  PRIMARY KEY  (`page_id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COMMENT='CMS pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_page_store`
--

DROP TABLE IF EXISTS `cms_page_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page_store` (
  `page_id` smallint(6) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`page_id`,`store_id`),
  KEY `FK_CMS_PAGE_STORE_STORE` (`store_id`),
  CONSTRAINT `FK_CMS_PAGE_STORE_PAGE` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CMS_PAGE_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Pages to Stores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `core_cache`
--

DROP TABLE IF EXISTS `core_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_cache` (
  `id` varchar(255) NOT NULL,
  `data` mediumblob,
  `create_time` int(11) default NULL,
  `update_time` int(11) default NULL,
  `expire_time` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `IDX_EXPIRE_TIME` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `core_cache_option`
--

DROP TABLE IF EXISTS `core_cache_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_cache_option` (
  `code` varchar(32) NOT NULL,
  `value` tinyint(3) default NULL,
  PRIMARY KEY  (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `core_cache_tag`
--

DROP TABLE IF EXISTS `core_cache_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_cache_tag` (
  `tag` varchar(100) NOT NULL default '',
  `cache_id` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`tag`,`cache_id`),
  KEY `IDX_CACHE_ID` (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `core_config_data`
--

DROP TABLE IF EXISTS `core_config_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_config_data` (
  `config_id` int(10) unsigned NOT NULL auto_increment,
  `scope` enum('default','websites','stores','config') NOT NULL default 'default',
  `scope_id` int(11) NOT NULL default '0',
  `path` varchar(255) NOT NULL default 'general',
  `value` text NOT NULL,
  PRIMARY KEY  (`config_id`),
  UNIQUE KEY `config_scope` (`scope`,`scope_id`,`path`)
) ENGINE=InnoDB AUTO_INCREMENT=1977 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `core_email_template`
--

DROP TABLE IF EXISTS `core_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_email_template` (
  `template_id` int(7) unsigned NOT NULL auto_increment,
  `template_code` varchar(150) default NULL,
  `template_text` text,
  `template_styles` text,
  `template_type` int(3) unsigned default NULL,
  `template_subject` varchar(200) default NULL,
  `template_sender_name` varchar(200) default NULL,
  `template_sender_email` varchar(200) character set latin1 collate latin1_general_ci default NULL,
  `added_at` datetime default NULL,
  `modified_at` datetime default NULL,
  `orig_template_code` varchar(200) default NULL,
  `orig_template_variables` text NOT NULL,
  PRIMARY KEY  (`template_id`),
  UNIQUE KEY `template_code` (`template_code`),
  KEY `added_at` (`added_at`),
  KEY `modified_at` (`modified_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Email templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `core_flag`
--

DROP TABLE IF EXISTS `core_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_flag` (
  `flag_id` int(10) unsigned NOT NULL auto_increment,
  `flag_code` varchar(255) NOT NULL,
  `state` smallint(5) unsigned NOT NULL default '0',
  `flag_data` text,
  `last_update` datetime NOT NULL,
  PRIMARY KEY  (`flag_id`),
  KEY `last_update` (`last_update`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `core_layout_link`
--

DROP TABLE IF EXISTS `core_layout_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_layout_link` (
  `layout_link_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `area` varchar(64) NOT NULL default '',
  `package` varchar(64) NOT NULL default '',
  `theme` varchar(64) NOT NULL default '',
  `layout_update_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`layout_link_id`),
  UNIQUE KEY `store_id` (`store_id`,`package`,`theme`,`layout_update_id`),
  KEY `FK_core_layout_link_update` (`layout_update_id`),
  CONSTRAINT `FK_CORE_LAYOUT_LINK_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CORE_LAYOUT_LINK_UPDATE` FOREIGN KEY (`layout_update_id`) REFERENCES `core_layout_update` (`layout_update_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `core_layout_update`
--

DROP TABLE IF EXISTS `core_layout_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_layout_update` (
  `layout_update_id` int(10) unsigned NOT NULL auto_increment,
  `handle` varchar(255) default NULL,
  `xml` text,
  `sort_order` smallint(5) NOT NULL default '0',
  PRIMARY KEY  (`layout_update_id`),
  KEY `handle` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `core_resource`
--

DROP TABLE IF EXISTS `core_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_resource` (
  `code` varchar(50) NOT NULL default '',
  `version` varchar(50) NOT NULL default '',
  `data_version` varchar(50) default NULL,
  PRIMARY KEY  (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Resource version registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `core_session`
--

DROP TABLE IF EXISTS `core_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_session` (
  `session_id` varchar(255) NOT NULL default '',
  `website_id` smallint(5) unsigned default NULL,
  `session_expires` int(10) unsigned NOT NULL default '0',
  `session_data` mediumblob NOT NULL,
  PRIMARY KEY  (`session_id`),
  KEY `FK_SESSION_WEBSITE` (`website_id`),
  CONSTRAINT `FK_SESSION_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Session data store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `core_store`
--

DROP TABLE IF EXISTS `core_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_store` (
  `store_id` smallint(5) unsigned NOT NULL auto_increment,
  `code` varchar(32) NOT NULL default '',
  `website_id` smallint(5) unsigned default '0',
  `group_id` smallint(5) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  `sort_order` smallint(5) unsigned NOT NULL default '0',
  `is_active` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`store_id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK_STORE_WEBSITE` (`website_id`),
  KEY `is_active` (`is_active`,`sort_order`),
  KEY `FK_STORE_GROUP` (`group_id`),
  CONSTRAINT `FK_STORE_GROUP_STORE` FOREIGN KEY (`group_id`) REFERENCES `core_store_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_STORE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Stores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `core_store_group`
--

DROP TABLE IF EXISTS `core_store_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_store_group` (
  `group_id` smallint(5) unsigned NOT NULL auto_increment,
  `website_id` smallint(5) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  `root_category_id` int(10) unsigned NOT NULL default '0',
  `default_store_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`group_id`),
  KEY `FK_STORE_GROUP_WEBSITE` (`website_id`),
  KEY `default_store_id` (`default_store_id`),
  CONSTRAINT `FK_STORE_GROUP_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `core_translate`
--

DROP TABLE IF EXISTS `core_translate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_translate` (
  `key_id` int(10) unsigned NOT NULL auto_increment,
  `string` varchar(255) NOT NULL default '',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `translate` varchar(255) NOT NULL default '',
  `locale` varchar(20) NOT NULL default 'en_US',
  PRIMARY KEY  (`key_id`),
  UNIQUE KEY `IDX_CODE` (`store_id`,`locale`,`string`),
  KEY `FK_CORE_TRANSLATE_STORE` (`store_id`),
  CONSTRAINT `FK_CORE_TRANSLATE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8 COMMENT='Translation data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `core_url_rewrite`
--

DROP TABLE IF EXISTS `core_url_rewrite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_url_rewrite` (
  `url_rewrite_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `category_id` int(10) unsigned default NULL,
  `product_id` int(10) unsigned default NULL,
  `id_path` varchar(255) NOT NULL default '',
  `request_path` varchar(255) NOT NULL default '',
  `target_path` varchar(255) NOT NULL default '',
  `is_system` tinyint(1) unsigned default '1',
  `options` varchar(255) NOT NULL default '',
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`url_rewrite_id`),
  UNIQUE KEY `UNQ_REQUEST_PATH` (`request_path`,`store_id`),
  UNIQUE KEY `UNQ_PATH` (`id_path`,`is_system`,`store_id`),
  KEY `FK_CORE_URL_REWRITE_STORE` (`store_id`),
  KEY `IDX_ID_PATH` (`id_path`),
  KEY `FK_CORE_URL_REWRITE_PRODUCT` (`product_id`),
  KEY `IDX_CATEGORY_REWRITE` (`category_id`,`is_system`,`product_id`,`store_id`,`id_path`),
  KEY `IDX_TARGET_PATH` (`target_path`,`store_id`),
  CONSTRAINT `FK_CORE_URL_REWRITE_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CORE_URL_REWRITE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CORE_URL_REWRITE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12813 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `core_variable`
--

DROP TABLE IF EXISTS `core_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_variable` (
  `variable_id` int(11) unsigned NOT NULL auto_increment,
  `code` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`variable_id`),
  UNIQUE KEY `IDX_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `core_variable_value`
--

DROP TABLE IF EXISTS `core_variable_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_variable_value` (
  `value_id` int(11) unsigned NOT NULL auto_increment,
  `variable_id` int(11) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `plain_value` text NOT NULL,
  `html_value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_VARIABLE_STORE` (`variable_id`,`store_id`),
  KEY `IDX_VARIABLE_ID` (`variable_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_CORE_VARIABLE_VALUE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CORE_VARIABLE_VALUE_VARIABLE_ID` FOREIGN KEY (`variable_id`) REFERENCES `core_variable` (`variable_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `core_website`
--

DROP TABLE IF EXISTS `core_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_website` (
  `website_id` smallint(5) unsigned NOT NULL auto_increment,
  `code` varchar(32) NOT NULL default '',
  `name` varchar(64) NOT NULL default '',
  `sort_order` smallint(5) unsigned NOT NULL default '0',
  `default_group_id` smallint(5) unsigned NOT NULL default '0',
  `is_default` tinyint(1) unsigned default '0',
  `is_staging` tinyint(1) NOT NULL default '0',
  `master_login` varchar(40) NOT NULL,
  `master_password` varchar(100) NOT NULL,
  `visibility` varchar(40) NOT NULL default '',
  PRIMARY KEY  (`website_id`),
  UNIQUE KEY `code` (`code`),
  KEY `sort_order` (`sort_order`),
  KEY `default_group_id` (`default_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Websites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coupon_aggregated`
--

DROP TABLE IF EXISTS `coupon_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_aggregated` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL default '',
  `coupon_code` varchar(50) NOT NULL default '',
  `coupon_uses` int(11) NOT NULL default '0',
  `subtotal_amount` decimal(12,4) NOT NULL default '0.0000',
  `discount_amount` decimal(12,4) NOT NULL default '0.0000',
  `total_amount` decimal(12,4) NOT NULL default '0.0000',
  `subtotal_amount_actual` decimal(12,4) NOT NULL default '0.0000',
  `discount_amount_actual` decimal(12,4) NOT NULL default '0.0000',
  `total_amount_actual` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_COUPON_AGGREGATED_PSOC` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALESTRULE_COUPON_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7317 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coupon_aggregated_order`
--

DROP TABLE IF EXISTS `coupon_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_aggregated_order` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL default '',
  `coupon_code` varchar(50) NOT NULL default '',
  `coupon_uses` int(11) NOT NULL default '0',
  `subtotal_amount` decimal(12,4) NOT NULL default '0.0000',
  `discount_amount` decimal(12,4) NOT NULL default '0.0000',
  `total_amount` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_COUPON_AGGREGATED_ORDER_PSOC` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALESTRULE_COUPON_AGGREGATED_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cron_schedule`
--

DROP TABLE IF EXISTS `cron_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_schedule` (
  `schedule_id` int(10) unsigned NOT NULL auto_increment,
  `job_code` varchar(255) NOT NULL default '0',
  `status` enum('pending','running','success','missed','error') NOT NULL default 'pending',
  `messages` text,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `scheduled_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `executed_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `finished_at` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`schedule_id`),
  KEY `task_name` (`job_code`),
  KEY `scheduled_at` (`scheduled_at`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=427899 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_address_entity`
--

DROP TABLE IF EXISTS `customer_address_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `increment_id` varchar(50) NOT NULL default '',
  `parent_id` int(10) unsigned default NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entity_id`),
  KEY `FK_CUSTOMER_ADDRESS_CUSTOMER_ID` (`parent_id`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_CUSTOMER_ID` FOREIGN KEY (`parent_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=153475 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Customer Address Entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_address_entity_datetime`
--

DROP TABLE IF EXISTS `customer_address_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_datetime` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_address_entity_decimal`
--

DROP TABLE IF EXISTS `customer_address_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_decimal` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_address_entity_int`
--

DROP TABLE IF EXISTS `customer_address_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_int` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_INT_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=153459 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_address_entity_text`
--

DROP TABLE IF EXISTS `customer_address_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_text` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_TEXT_ENTITY` (`entity_id`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=153475 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_address_entity_varchar`
--

DROP TABLE IF EXISTS `customer_address_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_varchar` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1538433 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_eav_attribute`
--

DROP TABLE IF EXISTS `customer_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL auto_increment,
  `is_visible` tinyint(1) unsigned NOT NULL default '1',
  `input_filter` varchar(255) default NULL,
  `multiline_count` tinyint(3) unsigned NOT NULL default '1',
  `validate_rules` text,
  `is_system` tinyint(3) unsigned NOT NULL default '0',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `data_model` varchar(255) default NULL,
  `is_used_for_customer_segment` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`attribute_id`),
  CONSTRAINT `FK_CUSTOMER_EAV_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1305 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_eav_attribute_website`
--

DROP TABLE IF EXISTS `customer_eav_attribute_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_eav_attribute_website` (
  `attribute_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `is_visible` tinyint(1) unsigned default NULL,
  `is_required` tinyint(1) unsigned default NULL,
  `default_value` text,
  `multiline_count` tinyint(3) unsigned default NULL,
  PRIMARY KEY  (`attribute_id`,`website_id`),
  KEY `IDX_WEBSITE` (`website_id`),
  CONSTRAINT `FK_CUST_EAV_ATTR_WEBST_WEBST_CORE_WEBST` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUST_EAV_ATTR_WEBST_ATTR_EAV_ATTR` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_entity`
--

DROP TABLE IF EXISTS `customer_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `website_id` smallint(5) unsigned default NULL,
  `email` varchar(255) NOT NULL default '',
  `group_id` smallint(3) unsigned NOT NULL default '0',
  `increment_id` varchar(50) NOT NULL default '',
  `store_id` smallint(5) unsigned default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entity_id`),
  KEY `FK_CUSTOMER_ENTITY_STORE` (`store_id`),
  KEY `IDX_ENTITY_TYPE` (`entity_type_id`),
  KEY `IDX_AUTH` (`email`,`website_id`),
  KEY `FK_CUSTOMER_WEBSITE` (`website_id`),
  CONSTRAINT `FK_CUSTOMER_ENTITY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=735835 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Customer Entityies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_entity_datetime`
--

DROP TABLE IF EXISTS `customer_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_datetime` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_DATETIME_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_entity_decimal`
--

DROP TABLE IF EXISTS `customer_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_decimal` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_DECIMAL_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_entity_int`
--

DROP TABLE IF EXISTS `customer_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_int` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_INT_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=197253 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_entity_text`
--

DROP TABLE IF EXISTS `customer_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_text` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_TEXT_ENTITY` (`entity_id`),
  CONSTRAINT `FK_CUSTOMER_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_entity_varchar`
--

DROP TABLE IF EXISTS `customer_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_varchar` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_VARCHAR_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1222915 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_form_attribute`
--

DROP TABLE IF EXISTS `customer_form_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_form_attribute` (
  `form_code` char(32) NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`form_code`,`attribute_id`),
  KEY `IDX_CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE` (`attribute_id`),
  CONSTRAINT `FK_CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer attributes/forms relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_group`
--

DROP TABLE IF EXISTS `customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_group` (
  `customer_group_id` smallint(3) unsigned NOT NULL auto_increment,
  `customer_group_code` varchar(32) NOT NULL default '',
  `tax_class_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`customer_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Customer groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cybermut_api_debug`
--

DROP TABLE IF EXISTS `cybermut_api_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cybermut_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `debug_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY  (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cybersource_api_debug`
--

DROP TABLE IF EXISTS `cybersource_api_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cybersource_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `debug_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `action` varchar(255) default NULL,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY  (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataflow_batch`
--

DROP TABLE IF EXISTS `dataflow_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_batch` (
  `batch_id` int(10) unsigned NOT NULL auto_increment,
  `profile_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `adapter` varchar(128) default NULL,
  `params` text,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`batch_id`),
  KEY `FK_DATAFLOW_BATCH_PROFILE` (`profile_id`),
  KEY `FK_DATAFLOW_BATCH_STORE` (`store_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_DATAFLOW_BATCH_PROFILE` FOREIGN KEY (`profile_id`) REFERENCES `dataflow_profile` (`profile_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DATAFLOW_BATCH_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataflow_batch_export`
--

DROP TABLE IF EXISTS `dataflow_batch_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_batch_export` (
  `batch_export_id` bigint(20) unsigned NOT NULL auto_increment,
  `batch_id` int(10) unsigned NOT NULL default '0',
  `batch_data` longtext,
  `status` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`batch_export_id`),
  KEY `FK_DATAFLOW_BATCH_EXPORT_BATCH` (`batch_id`),
  CONSTRAINT `FK_DATAFLOW_BATCH_EXPORT_BATCH` FOREIGN KEY (`batch_id`) REFERENCES `dataflow_batch` (`batch_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataflow_batch_import`
--

DROP TABLE IF EXISTS `dataflow_batch_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_batch_import` (
  `batch_import_id` bigint(20) unsigned NOT NULL auto_increment,
  `batch_id` int(10) unsigned NOT NULL default '0',
  `batch_data` longtext,
  `status` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`batch_import_id`),
  KEY `FK_DATAFLOW_BATCH_IMPORT_BATCH` (`batch_id`),
  CONSTRAINT `FK_DATAFLOW_BATCH_IMPORT_BATCH` FOREIGN KEY (`batch_id`) REFERENCES `dataflow_batch` (`batch_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataflow_import_data`
--

DROP TABLE IF EXISTS `dataflow_import_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_import_data` (
  `import_id` int(11) NOT NULL auto_increment,
  `session_id` int(11) default NULL,
  `serial_number` int(11) NOT NULL default '0',
  `value` text,
  `status` int(1) NOT NULL default '0',
  PRIMARY KEY  (`import_id`),
  KEY `FK_dataflow_import_data` (`session_id`),
  CONSTRAINT `FK_dataflow_import_data` FOREIGN KEY (`session_id`) REFERENCES `dataflow_session` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataflow_profile`
--

DROP TABLE IF EXISTS `dataflow_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_profile` (
  `profile_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `actions_xml` text,
  `gui_data` text,
  `direction` enum('import','export') default NULL,
  `entity_type` varchar(64) NOT NULL default '',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `data_transfer` enum('file','interactive') default NULL,
  PRIMARY KEY  (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataflow_profile_history`
--

DROP TABLE IF EXISTS `dataflow_profile_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_profile_history` (
  `history_id` int(10) unsigned NOT NULL auto_increment,
  `profile_id` int(10) unsigned NOT NULL default '0',
  `action_code` varchar(64) default NULL,
  `user_id` int(10) unsigned NOT NULL default '0',
  `performed_at` datetime default NULL,
  PRIMARY KEY  (`history_id`),
  KEY `FK_dataflow_profile_history` (`profile_id`),
  CONSTRAINT `FK_dataflow_profile_history` FOREIGN KEY (`profile_id`) REFERENCES `dataflow_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataflow_session`
--

DROP TABLE IF EXISTS `dataflow_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_session` (
  `session_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `created_date` datetime default NULL,
  `file` varchar(255) default NULL,
  `type` varchar(32) default NULL,
  `direction` varchar(32) default NULL,
  `comment` varchar(255) default NULL,
  PRIMARY KEY  (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `design_change`
--

DROP TABLE IF EXISTS `design_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `design_change` (
  `design_change_id` int(11) NOT NULL auto_increment,
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `design` varchar(255) NOT NULL default '',
  `date_from` date default NULL,
  `date_to` date default NULL,
  PRIMARY KEY  (`design_change_id`),
  KEY `FK_DESIGN_CHANGE_STORE` (`store_id`),
  CONSTRAINT `FK_DESIGN_CHANGE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `directory_country`
--

DROP TABLE IF EXISTS `directory_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_country` (
  `country_id` varchar(2) NOT NULL default '',
  `iso2_code` varchar(2) NOT NULL default '',
  `iso3_code` varchar(3) NOT NULL default '',
  PRIMARY KEY  (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Countries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `directory_country_format`
--

DROP TABLE IF EXISTS `directory_country_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_country_format` (
  `country_format_id` int(10) unsigned NOT NULL auto_increment,
  `country_id` varchar(2) NOT NULL default '',
  `type` varchar(30) NOT NULL default '',
  `format` text NOT NULL,
  PRIMARY KEY  (`country_format_id`),
  UNIQUE KEY `country_type` (`country_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Countries format';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `directory_country_region`
--

DROP TABLE IF EXISTS `directory_country_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_country_region` (
  `region_id` mediumint(8) unsigned NOT NULL auto_increment,
  `country_id` varchar(4) NOT NULL default '0',
  `code` varchar(32) NOT NULL default '',
  `default_name` varchar(255) default NULL,
  PRIMARY KEY  (`region_id`),
  KEY `FK_REGION_COUNTRY` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=691 DEFAULT CHARSET=utf8 COMMENT='Country regions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `directory_country_region_name`
--

DROP TABLE IF EXISTS `directory_country_region_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_country_region_name` (
  `locale` varchar(8) NOT NULL default '',
  `region_id` mediumint(8) unsigned NOT NULL default '0',
  `name` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`locale`,`region_id`),
  KEY `FK_DIRECTORY_REGION_NAME_REGION` (`region_id`),
  CONSTRAINT `FK_DIRECTORY_REGION_NAME_REGION` FOREIGN KEY (`region_id`) REFERENCES `directory_country_region` (`region_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Regions names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `directory_currency_rate`
--

DROP TABLE IF EXISTS `directory_currency_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_currency_rate` (
  `currency_from` char(3) NOT NULL default '',
  `currency_to` char(3) NOT NULL default '',
  `rate` decimal(24,12) NOT NULL default '0.000000000000',
  PRIMARY KEY  (`currency_from`,`currency_to`),
  KEY `FK_CURRENCY_RATE_TO` (`currency_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `donate`
--

DROP TABLE IF EXISTS `donate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donate` (
  `donate_id` int(11) unsigned NOT NULL auto_increment,
  `first_name` varchar(100) NOT NULL default '',
  `last_name` varchar(100) NOT NULL default '',
  `address1` varchar(100) NOT NULL default '',
  `city` varchar(100) NOT NULL default '',
  `state` varchar(100) NOT NULL default '',
  `postal` varchar(100) NOT NULL default '',
  `country` varchar(100) NOT NULL default '',
  `fax` varchar(20) NOT NULL default '',
  `phone` varchar(20) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `org_name` varchar(100) NOT NULL default '',
  `org_city` varchar(100) NOT NULL default '',
  `org_state` varchar(100) NOT NULL default '',
  `org_website` varchar(255) NOT NULL default '',
  `org_nonprofit_mission` text NOT NULL,
  `org_provide_nonprofit_status` tinyint(1) unsigned NOT NULL default '0',
  `org_fed_taxid` varchar(30) NOT NULL default '',
  `org_fulltime_employees` varchar(20) NOT NULL default '',
  `org_vizio_past_support` tinyint(1) unsigned NOT NULL default '0',
  `org_vizio_past_support_desc` text,
  `req_connection` varchar(30) NOT NULL default '',
  `req_free_products` tinyint(1) NOT NULL default '0',
  `req_free_product_type` varchar(40) default NULL,
  `req_specific_product` tinyint(1) NOT NULL default '0',
  `req_specific_products_details` text,
  `req_needed_date` varchar(100) NOT NULL default '',
  `req_cash_donation` tinyint(1) NOT NULL default '0',
  `req_cash_donation_amount` varchar(30) NOT NULL default '',
  `req_percent_total_representation` tinyint(3) NOT NULL default '0',
  `req_project_seeking_support` text,
  `req_target_audience` text,
  `req_num_people_served` varchar(30) NOT NULL default '',
  `req_geographic_region_served` varchar(50) NOT NULL default '',
  `req_other_companies_and_foundations` varchar(255) NOT NULL default '',
  `oth_endorsed_vizio_employee` text,
  `oth_why_vizio` text,
  `status` tinyint(1) unsigned NOT NULL default '0',
  `created_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`donate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `downloadable_link`
--

DROP TABLE IF EXISTS `downloadable_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link` (
  `link_id` int(10) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL default '0',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `number_of_downloads` int(10) unsigned default NULL,
  `is_shareable` smallint(1) unsigned NOT NULL default '0',
  `link_url` varchar(255) NOT NULL default '',
  `link_file` varchar(255) NOT NULL default '',
  `link_type` varchar(20) NOT NULL default '',
  `sample_url` varchar(255) NOT NULL default '',
  `sample_file` varchar(255) NOT NULL default '',
  `sample_type` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`link_id`),
  KEY `DOWNLODABLE_LINK_PRODUCT` (`product_id`),
  KEY `DOWNLODABLE_LINK_PRODUCT_SORT_ORDER` (`product_id`,`sort_order`),
  CONSTRAINT `FK_DOWNLODABLE_LINK_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `downloadable_link_price`
--

DROP TABLE IF EXISTS `downloadable_link_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link_price` (
  `price_id` int(10) unsigned NOT NULL auto_increment,
  `link_id` int(10) unsigned NOT NULL default '0',
  `website_id` smallint(5) unsigned NOT NULL default '0',
  `price` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`price_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_LINK` (`link_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_WEBSITE` (`website_id`),
  CONSTRAINT `FK_DOWNLOADABLE_LINK_PRICE_LINK` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DOWNLOADABLE_LINK_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `downloadable_link_purchased`
--

DROP TABLE IF EXISTS `downloadable_link_purchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link_purchased` (
  `purchased_id` int(10) unsigned NOT NULL auto_increment,
  `order_id` int(10) unsigned default '0',
  `order_increment_id` varchar(50) NOT NULL default '',
  `order_item_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `customer_id` int(10) unsigned NOT NULL default '0',
  `product_name` varchar(255) NOT NULL default '',
  `product_sku` varchar(255) NOT NULL default '',
  `link_section_title` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`purchased_id`),
  KEY `DOWNLOADABLE_ORDER_ID` (`order_id`),
  KEY `DOWNLOADABLE_CUSTOMER_ID` (`customer_id`),
  KEY `KEY_DOWNLOADABLE_ORDER_ITEM_ID` (`order_item_id`),
  CONSTRAINT `FK_DOWNLOADABLE_LINK_ORDER_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `downloadable_link_purchased_item`
--

DROP TABLE IF EXISTS `downloadable_link_purchased_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link_purchased_item` (
  `item_id` int(10) unsigned NOT NULL auto_increment,
  `purchased_id` int(10) unsigned NOT NULL default '0',
  `order_item_id` int(10) unsigned default '0',
  `product_id` int(10) unsigned default '0',
  `link_hash` varchar(255) NOT NULL default '',
  `number_of_downloads_bought` int(10) unsigned NOT NULL default '0',
  `number_of_downloads_used` int(10) unsigned NOT NULL default '0',
  `link_id` int(20) unsigned NOT NULL default '0',
  `link_title` varchar(255) NOT NULL default '',
  `is_shareable` smallint(1) unsigned NOT NULL default '0',
  `link_url` varchar(255) NOT NULL default '',
  `link_file` varchar(255) NOT NULL default '',
  `link_type` varchar(255) NOT NULL default '',
  `status` varchar(50) NOT NULL default '',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ID` (`purchased_id`),
  KEY `DOWNLOADABLE_ORDER_ITEM_ID` (`order_item_id`),
  KEY `DOWNLOADALBE_LINK_HASH` (`link_hash`),
  CONSTRAINT `FK_DOWNLOADABLE_LINK_ORDER_ITEM_ID` FOREIGN KEY (`order_item_id`) REFERENCES `sales_flat_order_item` (`item_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_DOWNLOADABLE_LINK_PURCHASED_ID` FOREIGN KEY (`purchased_id`) REFERENCES `downloadable_link_purchased` (`purchased_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `downloadable_link_title`
--

DROP TABLE IF EXISTS `downloadable_link_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link_title` (
  `title_id` int(10) unsigned NOT NULL auto_increment,
  `link_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`title_id`),
  UNIQUE KEY `UNQ_LINK_TITLE_STORE` (`link_id`,`store_id`),
  KEY `DOWNLOADABLE_LINK_TITLE_LINK` (`link_id`),
  KEY `DOWNLOADABLE_LINK_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_DOWNLOADABLE_LINK_TITLE_LINK` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DOWNLOADABLE_LINK_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `downloadable_sample`
--

DROP TABLE IF EXISTS `downloadable_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_sample` (
  `sample_id` int(10) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL default '0',
  `sample_url` varchar(255) NOT NULL default '',
  `sample_file` varchar(255) NOT NULL default '',
  `sample_type` varchar(20) NOT NULL default '',
  `sort_order` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`sample_id`),
  KEY `DOWNLODABLE_SAMPLE_PRODUCT` (`product_id`),
  CONSTRAINT `FK_DOWNLODABLE_SAMPLE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `downloadable_sample_title`
--

DROP TABLE IF EXISTS `downloadable_sample_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_sample_title` (
  `title_id` int(10) unsigned NOT NULL auto_increment,
  `sample_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`title_id`),
  UNIQUE KEY `UNQ_SAMPLE_TITLE_STORE` (`sample_id`,`store_id`),
  KEY `DOWNLOADABLE_SAMPLE_TITLE_SAMPLE` (`sample_id`),
  KEY `DOWNLOADABLE_SAMPLE_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_DOWNLOADABLE_SAMPLE_TITLE_SAMPLE` FOREIGN KEY (`sample_id`) REFERENCES `downloadable_sample` (`sample_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DOWNLOADABLE_SAMPLE_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_attribute`
--

DROP TABLE IF EXISTS `eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_code` varchar(255) NOT NULL default '',
  `attribute_model` varchar(255) default NULL,
  `backend_model` varchar(255) default NULL,
  `backend_type` enum('static','datetime','decimal','int','text','varchar') NOT NULL default 'static',
  `backend_table` varchar(255) default NULL,
  `frontend_model` varchar(255) default NULL,
  `frontend_input` varchar(50) default NULL,
  `frontend_label` varchar(255) default NULL,
  `frontend_class` varchar(255) default NULL,
  `source_model` varchar(255) default NULL,
  `is_required` tinyint(1) unsigned NOT NULL default '0',
  `is_user_defined` tinyint(1) unsigned NOT NULL default '0',
  `default_value` text,
  `is_unique` tinyint(1) unsigned NOT NULL default '0',
  `note` varchar(255) NOT NULL,
  PRIMARY KEY  (`attribute_id`),
  UNIQUE KEY `entity_type_id` (`entity_type_id`,`attribute_code`),
  KEY `IDX_USED_FOR_SORT_BY` (`entity_type_id`),
  KEY `IDX_USED_IN_PRODUCT_LISTING` (`entity_type_id`),
  CONSTRAINT `FK_eav_attribute` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1921 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_attribute_group`
--

DROP TABLE IF EXISTS `eav_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_group` (
  `attribute_group_id` smallint(5) unsigned NOT NULL auto_increment,
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_group_name` varchar(255) NOT NULL default '',
  `sort_order` smallint(6) NOT NULL default '0',
  `default_id` smallint(5) unsigned default '0',
  PRIMARY KEY  (`attribute_group_id`),
  UNIQUE KEY `attribute_set_id` (`attribute_set_id`,`attribute_group_name`),
  KEY `attribute_set_id_2` (`attribute_set_id`,`sort_order`),
  CONSTRAINT `FK_eav_attribute_group` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_attribute_label`
--

DROP TABLE IF EXISTS `eav_attribute_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_label` (
  `attribute_label_id` int(11) unsigned NOT NULL auto_increment,
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`attribute_label_id`),
  KEY `IDX_ATTRIBUTE_LABEL_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_ATTRIBUTE_LABEL_STORE` (`store_id`),
  KEY `IDX_ATTRIBUTE_LABEL_ATTRIBUTE_STORE` (`attribute_id`,`store_id`),
  CONSTRAINT `FK_ATTRIBUTE_LABEL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ATTRIBUTE_LABEL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7181 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_attribute_option`
--

DROP TABLE IF EXISTS `eav_attribute_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_option` (
  `option_id` int(10) unsigned NOT NULL auto_increment,
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `sort_order` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`option_id`),
  KEY `FK_ATTRIBUTE_OPTION_ATTRIBUTE` (`attribute_id`),
  CONSTRAINT `FK_ATTRIBUTE_OPTION_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COMMENT='Attributes option (for source model)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_attribute_option_value`
--

DROP TABLE IF EXISTS `eav_attribute_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_option_value` (
  `value_id` int(10) unsigned NOT NULL auto_increment,
  `option_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  KEY `FK_ATTRIBUTE_OPTION_VALUE_OPTION` (`option_id`),
  KEY `FK_ATTRIBUTE_OPTION_VALUE_STORE` (`store_id`),
  CONSTRAINT `FK_ATTRIBUTE_OPTION_VALUE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `eav_attribute_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ATTRIBUTE_OPTION_VALUE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=407 DEFAULT CHARSET=utf8 COMMENT='Attribute option values per store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_attribute_set`
--

DROP TABLE IF EXISTS `eav_attribute_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_set` (
  `attribute_set_id` smallint(5) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_set_name` varchar(255) character set utf8 collate utf8_swedish_ci NOT NULL default '',
  `sort_order` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`attribute_set_id`),
  UNIQUE KEY `entity_type_id` (`entity_type_id`,`attribute_set_name`),
  KEY `entity_type_id_2` (`entity_type_id`,`sort_order`),
  CONSTRAINT `FK_eav_attribute_set` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_entity`
--

DROP TABLE IF EXISTS `eav_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `increment_id` varchar(50) NOT NULL default '',
  `parent_id` int(11) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entity_id`),
  KEY `FK_ENTITY_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ENTITY_STORE` (`store_id`),
  CONSTRAINT `FK_eav_entity` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_eav_entity_store` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Entityies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_entity_attribute`
--

DROP TABLE IF EXISTS `eav_entity_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_attribute` (
  `entity_attribute_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_group_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `sort_order` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`entity_attribute_id`),
  UNIQUE KEY `attribute_set_id_2` (`attribute_set_id`,`attribute_id`),
  UNIQUE KEY `attribute_group_id` (`attribute_group_id`,`attribute_id`),
  KEY `attribute_set_id_3` (`attribute_set_id`,`sort_order`),
  KEY `FK_EAV_ENTITY_ATTRIVUTE_ATTRIBUTE` (`attribute_id`),
  CONSTRAINT `FK_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_ATTRIBUTE_GROUP` FOREIGN KEY (`attribute_group_id`) REFERENCES `eav_attribute_group` (`attribute_group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=124811 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_entity_datetime`
--

DROP TABLE IF EXISTS `eav_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_datetime` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_DATETIME_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_DATETIME_ENTITY` (`entity_id`),
  KEY `value_by_attribute` (`attribute_id`,`value`),
  KEY `value_by_entity_type` (`entity_type_id`,`value`),
  CONSTRAINT `FK_EAV_ENTITY_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_DATETIME_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Datetime values of attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_entity_decimal`
--

DROP TABLE IF EXISTS `eav_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_decimal` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_ENTITY` (`entity_id`),
  KEY `value_by_attribute` (`attribute_id`,`value`),
  KEY `value_by_entity_type` (`entity_type_id`,`value`),
  CONSTRAINT `FK_EAV_ENTITY_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_DECIMAL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Decimal values of attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_entity_int`
--

DROP TABLE IF EXISTS `eav_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_int` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_INT_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_INT_ENTITY` (`entity_id`),
  KEY `value_by_attribute` (`attribute_id`,`value`),
  KEY `value_by_entity_type` (`entity_type_id`,`value`),
  CONSTRAINT `FK_EAV_ENTITY_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_INT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Integer values of attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_entity_store`
--

DROP TABLE IF EXISTS `eav_entity_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_store` (
  `entity_store_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `increment_prefix` varchar(20) NOT NULL default '',
  `increment_last_id` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`entity_store_id`),
  KEY `FK_eav_entity_store_entity_type` (`entity_type_id`),
  KEY `FK_eav_entity_store_store` (`store_id`),
  CONSTRAINT `FK_eav_entity_store_entity_type` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_eav_entity_store_store` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_entity_text`
--

DROP TABLE IF EXISTS `eav_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_text` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_TEXT_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_TEXT_ENTITY` (`entity_id`),
  CONSTRAINT `FK_EAV_ENTITY_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_TEXT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Text values of attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_entity_type`
--

DROP TABLE IF EXISTS `eav_entity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_type` (
  `entity_type_id` smallint(5) unsigned NOT NULL auto_increment,
  `entity_type_code` varchar(50) NOT NULL default '',
  `entity_model` varchar(255) NOT NULL,
  `attribute_model` varchar(255) NOT NULL,
  `entity_table` varchar(255) NOT NULL default '',
  `value_table_prefix` varchar(255) NOT NULL default '',
  `entity_id_field` varchar(255) NOT NULL default '',
  `is_data_sharing` tinyint(4) unsigned NOT NULL default '1',
  `data_sharing_key` varchar(100) default 'default',
  `default_attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `increment_model` varchar(255) NOT NULL default '',
  `increment_per_store` tinyint(1) unsigned NOT NULL default '0',
  `increment_pad_length` tinyint(8) unsigned NOT NULL default '8',
  `increment_pad_char` char(1) NOT NULL default '0',
  `additional_attribute_table` varchar(255) NOT NULL default '',
  `entity_attribute_collection` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`entity_type_id`),
  KEY `entity_name` (`entity_type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_entity_varchar`
--

DROP TABLE IF EXISTS `eav_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_varchar` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_ENTITY` (`entity_id`),
  KEY `value_by_attribute` (`attribute_id`,`value`),
  KEY `value_by_entity_type` (`entity_type_id`,`value`),
  CONSTRAINT `FK_EAV_ENTITY_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_VARCHAR_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Varchar values of attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_form_element`
--

DROP TABLE IF EXISTS `eav_form_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_element` (
  `element_id` int(10) unsigned NOT NULL auto_increment,
  `type_id` smallint(5) unsigned NOT NULL,
  `fieldset_id` smallint(5) unsigned default NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `sort_order` int(11) NOT NULL default '0',
  PRIMARY KEY  (`element_id`),
  UNIQUE KEY `UNQ_FORM_ATTRIBUTE` (`type_id`,`attribute_id`),
  KEY `IDX_FORM_TYPE` (`type_id`),
  KEY `IDX_FORM_FIELDSET` (`fieldset_id`),
  KEY `IDX_FORM_ATTRIBUTE` (`attribute_id`),
  CONSTRAINT `FK_EAV_FORM_ELEMENT_FORM_TYPE` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_FORM_ELEMENT_FORM_FIELDSET` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_FORM_ELEMENT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_form_fieldset`
--

DROP TABLE IF EXISTS `eav_form_fieldset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_fieldset` (
  `fieldset_id` smallint(5) unsigned NOT NULL auto_increment,
  `type_id` smallint(5) unsigned NOT NULL,
  `code` char(64) NOT NULL,
  `sort_order` int(11) NOT NULL default '0',
  PRIMARY KEY  (`fieldset_id`),
  UNIQUE KEY `UNQ_FORM_FIELDSET_CODE` (`type_id`,`code`),
  KEY `IDX_FORM_TYPE` (`type_id`),
  CONSTRAINT `FK_EAV_FORM_FIELDSET_FORM_TYPE` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_form_fieldset_label`
--

DROP TABLE IF EXISTS `eav_form_fieldset_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_fieldset_label` (
  `fieldset_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY  (`fieldset_id`,`store_id`),
  KEY `IDX_FORM_FIELDSET` (`fieldset_id`),
  KEY `IDX_STORE` (`store_id`),
  CONSTRAINT `FK_EAV_FORM_FIELDSET_LABEL_FORM_FIELDSET` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_FORM_FIELDSET_LABEL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_form_type`
--

DROP TABLE IF EXISTS `eav_form_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_type` (
  `type_id` smallint(5) unsigned NOT NULL auto_increment,
  `code` char(64) NOT NULL,
  `label` varchar(255) NOT NULL,
  `is_system` tinyint(1) unsigned NOT NULL default '0',
  `theme` varchar(64) NOT NULL default '',
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`type_id`),
  UNIQUE KEY `UNQ_FORM_TYPE_CODE` (`code`,`theme`,`store_id`),
  KEY `IDX_STORE` (`store_id`),
  CONSTRAINT `FK_EAV_FORM_TYPE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_form_type_entity`
--

DROP TABLE IF EXISTS `eav_form_type_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_type_entity` (
  `type_id` smallint(5) unsigned NOT NULL,
  `entity_type_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`type_id`,`entity_type_id`),
  KEY `IDX_EAV_ENTITY_TYPE` (`entity_type_id`),
  CONSTRAINT `FK_EAV_FORM_TYPE_ENTITY_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_FORM_TYPE_ENTITY_FORM_TYPE` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_admin_passwords`
--

DROP TABLE IF EXISTS `enterprise_admin_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_admin_passwords` (
  `password_id` int(10) unsigned NOT NULL auto_increment,
  `user_id` mediumint(9) unsigned NOT NULL default '0',
  `password_hash` varchar(100) NOT NULL default '',
  `expires` int(11) unsigned NOT NULL default '0',
  `last_updated` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`password_id`),
  KEY `FK_ADMIN_PASSWORDS_USER` (`user_id`),
  CONSTRAINT `FK_ADMIN_PASSWORDS_USER` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2939 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_banner`
--

DROP TABLE IF EXISTS `enterprise_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_banner` (
  `banner_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `is_enabled` int(1) NOT NULL,
  `types` varchar(255) default NULL,
  PRIMARY KEY  (`banner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Banners';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_banner_catalogrule`
--

DROP TABLE IF EXISTS `enterprise_banner_catalogrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_banner_catalogrule` (
  `banner_id` int(10) unsigned NOT NULL,
  `rule_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`banner_id`,`rule_id`),
  KEY `banner_id` (`banner_id`),
  KEY `rule_id` (`rule_id`),
  CONSTRAINT `FK_BANNER_CATALOGRULE_BANNER` FOREIGN KEY (`banner_id`) REFERENCES `enterprise_banner` (`banner_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_BANNER_CATALOGRULE_RULE` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Banners Relations to Catalog Rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_banner_content`
--

DROP TABLE IF EXISTS `enterprise_banner_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_banner_content` (
  `banner_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `banner_content` mediumtext NOT NULL,
  PRIMARY KEY  (`banner_id`,`store_id`),
  KEY `banner_id` (`banner_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `FK_BANNER_CONTENT_BANNER` FOREIGN KEY (`banner_id`) REFERENCES `enterprise_banner` (`banner_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_BANNER_CONTENT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Banners Content per Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_banner_customersegment`
--

DROP TABLE IF EXISTS `enterprise_banner_customersegment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_banner_customersegment` (
  `banner_id` int(10) unsigned NOT NULL default '0',
  `segment_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`banner_id`,`segment_id`),
  KEY `banner_id` (`banner_id`),
  KEY `segment_id` (`segment_id`),
  CONSTRAINT `FK_BANNER_CUSTOMER_SEGMENT_BANNER` FOREIGN KEY (`banner_id`) REFERENCES `enterprise_banner` (`banner_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_BANNER_CUSTOMER_SEGMENT_SEGMENT` FOREIGN KEY (`segment_id`) REFERENCES `enterprise_customersegment_segment` (`segment_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation Banners with Customer Segments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_banner_salesrule`
--

DROP TABLE IF EXISTS `enterprise_banner_salesrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_banner_salesrule` (
  `banner_id` int(10) unsigned NOT NULL,
  `rule_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`banner_id`,`rule_id`),
  KEY `banner_id` (`banner_id`),
  KEY `rule_id` (`rule_id`),
  CONSTRAINT `FK_BANNER_SALESRULE_BANNER` FOREIGN KEY (`banner_id`) REFERENCES `enterprise_banner` (`banner_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_BANNER_SALESRULE_RULE` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Banners Relations to Sales Rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_catalogevent_event`
--

DROP TABLE IF EXISTS `enterprise_catalogevent_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_catalogevent_event` (
  `event_id` int(10) unsigned NOT NULL auto_increment,
  `category_id` int(10) unsigned default NULL,
  `date_start` datetime default NULL,
  `date_end` datetime default NULL,
  `display_state` tinyint(3) unsigned default '0',
  `sort_order` int(10) unsigned default NULL,
  PRIMARY KEY  (`event_id`),
  UNIQUE KEY `category_id` (`category_id`),
  KEY `sort_order` (`date_start`,`date_end`),
  CONSTRAINT `FK_ENTERPRISE_CATALOGEVENT_EVENT_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Events';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_catalogevent_event_image`
--

DROP TABLE IF EXISTS `enterprise_catalogevent_event_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_catalogevent_event_image` (
  `event_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `image` varchar(255) NOT NULL,
  UNIQUE KEY `scope` (`event_id`,`store_id`),
  KEY `FK_ENTERPRISE_CATALOGEVENT_EVENT_IMAGE_STORE` (`store_id`),
  CONSTRAINT `FK_ENTERPRISE_CATALOGEVENT_EVENT_IMAGE_EVENT` FOREIGN KEY (`event_id`) REFERENCES `enterprise_catalogevent_event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ENTERPRISE_CATALOGEVENT_EVENT_IMAGE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Catalog Event Images';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_catalogpermissions`
--

DROP TABLE IF EXISTS `enterprise_catalogpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_catalogpermissions` (
  `permission_id` int(10) unsigned NOT NULL auto_increment,
  `category_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned default NULL,
  `customer_group_id` smallint(3) unsigned default NULL,
  `grant_catalog_category_view` tinyint(1) NOT NULL,
  `grant_catalog_product_price` tinyint(1) NOT NULL,
  `grant_checkout_items` tinyint(1) NOT NULL,
  PRIMARY KEY  (`permission_id`),
  UNIQUE KEY `UNQ_PERMISSION_SCOPE` (`category_id`,`website_id`,`customer_group_id`),
  KEY `FK_ENTERPRISE_CATALOGPEMISSIONS_PERMISSION_WEBSITE` (`website_id`),
  KEY `FK_ENTERPRISE_CATALOGPEMISSIONS_PERMISSION_CUSTGROUP` (`customer_group_id`),
  CONSTRAINT `FK_ENTERPRISE_CATALOGPEMISSIONS_PERMISSION_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ENTERPRISE_CATALOGPEMISSIONS_PERMISSION_CUSTGROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ENTERPRISE_CATALOGPEMISSIONS_PERMISSION_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_catalogpermissions_index`
--

DROP TABLE IF EXISTS `enterprise_catalogpermissions_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_catalogpermissions_index` (
  `category_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `customer_group_id` smallint(3) unsigned NOT NULL,
  `grant_catalog_category_view` tinyint(1) default NULL,
  `grant_catalog_product_price` tinyint(1) default NULL,
  `grant_checkout_items` tinyint(1) default NULL,
  KEY `FK_ENTERPRISE_CATALOGPEMISSIONS_INDEX_CATEGORY` (`category_id`),
  KEY `FK_ENTERPRISE_CATALOGPEMISSIONS_INDEX_WEBSITE` (`website_id`),
  KEY `FK_ENTERPRISE_CATALOGPEMISSIONS_INDEX_CUSTGROUP` (`customer_group_id`),
  CONSTRAINT `FK_ENTERPRISE_CATALOGPEMISSIONS_INDEX_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ENTERPRISE_CATALOGPEMISSIONS_INDEX_CUSTGROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ENTERPRISE_CATALOGPEMISSIONS_INDEX_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_catalogpermissions_index_product`
--

DROP TABLE IF EXISTS `enterprise_catalogpermissions_index_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_catalogpermissions_index_product` (
  `product_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `category_id` int(10) unsigned default NULL,
  `customer_group_id` smallint(3) unsigned NOT NULL,
  `grant_catalog_category_view` tinyint(1) default NULL,
  `grant_catalog_product_price` tinyint(1) default NULL,
  `grant_checkout_items` tinyint(1) default NULL,
  `is_config` tinyint(1) unsigned default '0',
  UNIQUE KEY `UNQ_PRODUCT_STORE_CATEGORY_AND_CUSTOMERGROUP` (`product_id`,`store_id`,`category_id`,`customer_group_id`),
  KEY `FK_ENTERPRISE_CATALOGPEMISSIONS_INDEX_PRODUCT` (`product_id`),
  KEY `FK_ENTERPRISE_CATALOGPEMISSIONS_INDEX_PRODUCT_STORE` (`store_id`),
  KEY `FK_ENTERPRISE_CATALOGPEMISSIONS_INDEX_PRODUCT_CUSTGROUP` (`customer_group_id`),
  KEY `FK_ENTERPRISE_CATALOGPEMISSIONS_INDEX_PRODUCT_CAT` (`category_id`),
  CONSTRAINT `FK_ENTERPRISE_CATALOGPEMISSIONS_INDEX_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ENTERPRISE_CATALOGPEMISSIONS_INDEX_PRODUCT_CAT` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ENTERPRISE_CATALOGPEMISSIONS_INDEX_PRODUCT_CUSTGROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ENTERPRISE_CATALOGPEMISSIONS_INDEX_PRODUCT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_cms_hierarchy_lock`
--

DROP TABLE IF EXISTS `enterprise_cms_hierarchy_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_cms_hierarchy_lock` (
  `lock_id` int(10) unsigned NOT NULL auto_increment,
  `user_id` mediumint(9) unsigned NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `session_id` varchar(50) NOT NULL,
  `started_at` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`lock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_cms_hierarchy_metadata`
--

DROP TABLE IF EXISTS `enterprise_cms_hierarchy_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_cms_hierarchy_metadata` (
  `node_id` int(10) unsigned NOT NULL,
  `meta_first_last` tinyint(1) NOT NULL default '0',
  `meta_next_previous` tinyint(1) NOT NULL default '0',
  `meta_chapter` tinyint(1) NOT NULL default '0',
  `meta_section` tinyint(1) NOT NULL default '0',
  `meta_cs_enabled` tinyint(4) unsigned NOT NULL default '0',
  `pager_visibility` tinyint(4) unsigned NOT NULL,
  `pager_frame` smallint(6) unsigned NOT NULL,
  `pager_jump` smallint(6) unsigned NOT NULL,
  `menu_visibility` tinyint(4) unsigned NOT NULL,
  `menu_excluded` tinyint(4) unsigned NOT NULL default '0',
  `menu_layout` varchar(50) NOT NULL default '',
  `menu_brief` tinyint(4) unsigned NOT NULL default '0',
  `menu_levels_down` tinyint(4) unsigned NOT NULL,
  `menu_ordered` tinyint(4) unsigned NOT NULL,
  `menu_list_type` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`node_id`),
  CONSTRAINT `FK_ENTERPRISE_CMS_HIERARCHY_METADATA_NODE` FOREIGN KEY (`node_id`) REFERENCES `enterprise_cms_hierarchy_node` (`node_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_cms_hierarchy_node`
--

DROP TABLE IF EXISTS `enterprise_cms_hierarchy_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_cms_hierarchy_node` (
  `node_id` int(10) unsigned NOT NULL auto_increment,
  `parent_node_id` int(10) unsigned default NULL,
  `page_id` smallint(6) default NULL,
  `identifier` varchar(100) default NULL,
  `label` varchar(255) default NULL,
  `level` tinyint(3) unsigned NOT NULL default '0',
  `sort_order` int(11) NOT NULL,
  `request_url` varchar(255) NOT NULL,
  `xpath` varchar(255) default '',
  PRIMARY KEY  (`node_id`),
  UNIQUE KEY `UNQ_REQUEST_URL` (`request_url`),
  KEY `IDX_PARENT_NODE` (`parent_node_id`),
  KEY `IDX_PAGE` (`page_id`),
  CONSTRAINT `FK_ENTERPRISE_CMS_HIERARCHY_NODE_PAGE` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ENTERPRISE_CMS_HIERARCHY_NODE_PARENT_NODE` FOREIGN KEY (`parent_node_id`) REFERENCES `enterprise_cms_hierarchy_node` (`node_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_cms_increment`
--

DROP TABLE IF EXISTS `enterprise_cms_increment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_cms_increment` (
  `increment_id` int(10) unsigned NOT NULL auto_increment,
  `type` int(10) NOT NULL,
  `node` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `last_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`increment_id`),
  UNIQUE KEY `IDX_TYPE_NODE_LEVEL` (`type`,`node`,`level`)
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_cms_page_revision`
--

DROP TABLE IF EXISTS `enterprise_cms_page_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_cms_page_revision` (
  `revision_id` int(10) unsigned NOT NULL auto_increment,
  `version_id` int(10) unsigned NOT NULL,
  `page_id` smallint(6) NOT NULL,
  `root_template` varchar(255) NOT NULL default '',
  `meta_keywords` text NOT NULL,
  `meta_description` text NOT NULL,
  `content_heading` varchar(255) NOT NULL default '',
  `content` mediumtext,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `layout_update_xml` text,
  `custom_theme` varchar(100) default NULL,
  `custom_root_template` varchar(255) NOT NULL default '',
  `custom_layout_update_xml` text,
  `custom_theme_from` date default NULL,
  `custom_theme_to` date default NULL,
  `user_id` mediumint(9) unsigned default NULL,
  `revision_number` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`revision_id`),
  KEY `IDX_VERSION_ID` (`version_id`),
  KEY `IDX_PAGE_ID` (`page_id`),
  KEY `IDX_USER_ID` (`user_id`),
  KEY `IDX_REVISION_NUMBER` (`revision_number`),
  CONSTRAINT `FK_CMS_REVISION_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CMS_REVISION_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_CMS_REVISION_VERSION_ID` FOREIGN KEY (`version_id`) REFERENCES `enterprise_cms_page_version` (`version_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_cms_page_version`
--

DROP TABLE IF EXISTS `enterprise_cms_page_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_cms_page_version` (
  `version_id` int(10) unsigned NOT NULL auto_increment,
  `label` varchar(255) default NULL,
  `access_level` enum('private','protected','public') NOT NULL,
  `page_id` smallint(6) NOT NULL,
  `user_id` mediumint(9) unsigned default NULL,
  `revisions_count` int(11) unsigned default NULL,
  `version_number` int(11) unsigned NOT NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`version_id`),
  KEY `IDX_PAGE_ID` (`page_id`),
  KEY `IDX_USER_ID` (`user_id`),
  KEY `IDX_VERSION_NUMBER` (`version_number`),
  CONSTRAINT `FK_CMS_VERSION_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CMS_VERSION_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_customer_sales_flat_order`
--

DROP TABLE IF EXISTS `enterprise_customer_sales_flat_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_customer_sales_flat_order` (
  `entity_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entity_id`),
  CONSTRAINT `FK_ENTERPRISE_CUSTOMER_SALES_ORDER` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_customer_sales_flat_order_address`
--

DROP TABLE IF EXISTS `enterprise_customer_sales_flat_order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_customer_sales_flat_order_address` (
  `entity_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entity_id`),
  CONSTRAINT `FK_ENTERPRISE_CUSTOMER_SALES_ORDER_ADDRESS` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_order_address` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_customer_sales_flat_quote`
--

DROP TABLE IF EXISTS `enterprise_customer_sales_flat_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_customer_sales_flat_quote` (
  `entity_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entity_id`),
  CONSTRAINT `FK_ENTERPRISE_CUSTOMER_SALES_QUOTE` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_customer_sales_flat_quote_address`
--

DROP TABLE IF EXISTS `enterprise_customer_sales_flat_quote_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_customer_sales_flat_quote_address` (
  `entity_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entity_id`),
  CONSTRAINT `FK_ENTERPRISE_CUSTOMER_SALES_QUOTE_ADDRESS` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_customerbalance`
--

DROP TABLE IF EXISTS `enterprise_customerbalance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_customerbalance` (
  `balance_id` int(10) unsigned NOT NULL auto_increment,
  `customer_id` int(10) unsigned NOT NULL default '0',
  `website_id` smallint(5) unsigned default NULL,
  `amount` decimal(12,4) NOT NULL default '0.0000',
  `base_currency_code` char(3) default NULL,
  PRIMARY KEY  (`balance_id`),
  UNIQUE KEY `UNQ_CUSTOMERBALANCE_CW` (`customer_id`,`website_id`),
  KEY `FK_CUSTOMERBALANCE_WEBSITE` (`website_id`),
  CONSTRAINT `FK_CUSTOMERBALANCE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMERBALANCE_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_customerbalance_history`
--

DROP TABLE IF EXISTS `enterprise_customerbalance_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_customerbalance_history` (
  `history_id` int(10) unsigned NOT NULL auto_increment,
  `balance_id` int(10) unsigned NOT NULL default '0',
  `updated_at` datetime default NULL,
  `action` tinyint(3) unsigned NOT NULL default '0',
  `balance_amount` decimal(12,4) unsigned NOT NULL default '0.0000',
  `balance_delta` decimal(12,4) NOT NULL default '0.0000',
  `additional_info` tinytext,
  `is_customer_notified` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`history_id`),
  KEY `FK_CUSTOMERBALANCE_HISTORY_BALANCE` (`balance_id`),
  CONSTRAINT `FK_CUSTOMERBALANCE_HISTORY_BALANCE` FOREIGN KEY (`balance_id`) REFERENCES `enterprise_customerbalance` (`balance_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_customersegment_customer`
--

DROP TABLE IF EXISTS `enterprise_customersegment_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_customersegment_customer` (
  `segment_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `added_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `UNQ_CUSTOMER` (`segment_id`,`website_id`,`customer_id`),
  KEY `FK_EE_CUSTOMER_SEGMENT_WEBSIE` (`website_id`),
  KEY `FK_CUSTOMER` (`customer_id`),
  CONSTRAINT `FK_EE_CUSTOMER_SEGMENT_WEBSIE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ENTERPRISE_CUSTOMERSEGMENT_CUSTOMER_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ENTERPRISE_CUSTOMERSEGMENT_CUSTOMER_SEGMENT` FOREIGN KEY (`segment_id`) REFERENCES `enterprise_customersegment_segment` (`segment_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_customersegment_event`
--

DROP TABLE IF EXISTS `enterprise_customersegment_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_customersegment_event` (
  `segment_id` int(10) unsigned NOT NULL,
  `event` varchar(255) NOT NULL default '',
  KEY `IDX_ENTERPRISE_CUSTOMERSEGMENT_EVENT_EVENT` (`event`),
  KEY `FK_ENTERPRISE_CUSTOMERSEGMENT_EVENT_SEGMENT` (`segment_id`),
  CONSTRAINT `FK_ENTERPRISE_CUSTOMERSEGMENT_EVENT_SEGMENT` FOREIGN KEY (`segment_id`) REFERENCES `enterprise_customersegment_segment` (`segment_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_customersegment_segment`
--

DROP TABLE IF EXISTS `enterprise_customersegment_segment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_customersegment_segment` (
  `segment_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `is_active` tinyint(1) NOT NULL default '0',
  `conditions_serialized` mediumtext NOT NULL,
  `processing_frequency` int(100) NOT NULL,
  `condition_sql` mediumtext,
  PRIMARY KEY  (`segment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_customersegment_website`
--

DROP TABLE IF EXISTS `enterprise_customersegment_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_customersegment_website` (
  `segment_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`segment_id`,`website_id`),
  KEY `FK_EE_SEGMENT_WEBSITE` (`website_id`),
  CONSTRAINT `FK_EE_SEGMENT_SEFMENT` FOREIGN KEY (`segment_id`) REFERENCES `enterprise_customersegment_segment` (`segment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EE_SEGMENT_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Segment to website association';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_giftcard_amount`
--

DROP TABLE IF EXISTS `enterprise_giftcard_amount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_giftcard_amount` (
  `value_id` int(11) NOT NULL auto_increment,
  `website_id` smallint(5) unsigned NOT NULL default '0',
  `value` decimal(12,4) NOT NULL default '0.0000',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `entity_type_id` smallint(5) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`value_id`),
  KEY `FK_GIFTCARD_AMOUNT_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_GIFTCARD_AMOUNT_WEBSITE` (`website_id`),
  KEY `FK_GIFTCARD_AMOUNT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `FK_GIFTCARD_AMOUNT_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_GIFTCARD_AMOUNT_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_GIFTCARD_AMOUNT_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_giftcardaccount`
--

DROP TABLE IF EXISTS `enterprise_giftcardaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_giftcardaccount` (
  `giftcardaccount_id` int(10) unsigned NOT NULL auto_increment,
  `code` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_created` date NOT NULL,
  `date_expires` date default NULL,
  `website_id` smallint(5) unsigned NOT NULL default '0',
  `balance` decimal(12,4) NOT NULL default '0.0000',
  `state` tinyint(1) NOT NULL default '0',
  `is_redeemable` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`giftcardaccount_id`),
  KEY `FK_GIFTCARDACCOUNT_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_GIFTCARDACCOUNT_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_giftcardaccount_history`
--

DROP TABLE IF EXISTS `enterprise_giftcardaccount_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_giftcardaccount_history` (
  `history_id` int(10) unsigned NOT NULL auto_increment,
  `giftcardaccount_id` int(10) unsigned NOT NULL default '0',
  `updated_at` datetime default NULL,
  `action` tinyint(3) unsigned NOT NULL default '0',
  `balance_amount` decimal(12,4) unsigned NOT NULL default '0.0000',
  `balance_delta` decimal(12,4) NOT NULL default '0.0000',
  `additional_info` tinytext,
  PRIMARY KEY  (`history_id`),
  KEY `FK_GIFTCARDACCOUNT_HISTORY_ACCOUNT` (`giftcardaccount_id`),
  CONSTRAINT `FK_GIFTCARDACCOUNT_HISTORY_ACCOUNT` FOREIGN KEY (`giftcardaccount_id`) REFERENCES `enterprise_giftcardaccount` (`giftcardaccount_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_giftcardaccount_pool`
--

DROP TABLE IF EXISTS `enterprise_giftcardaccount_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_giftcardaccount_pool` (
  `code` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY  (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_giftregistry_data`
--

DROP TABLE IF EXISTS `enterprise_giftregistry_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_giftregistry_data` (
  `entity_id` int(10) unsigned NOT NULL default '0',
  `event_date` date default NULL,
  `event_country` char(3) default NULL,
  `event_country_region` int(10) default NULL,
  `event_country_region_text` varchar(30) default NULL,
  `event_location` varchar(255) default NULL,
  PRIMARY KEY  (`entity_id`),
  CONSTRAINT `FK_EE_GR_DATA_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `enterprise_giftregistry_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_giftregistry_entity`
--

DROP TABLE IF EXISTS `enterprise_giftregistry_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_giftregistry_entity` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `type_id` int(10) unsigned NOT NULL default '0',
  `customer_id` int(10) unsigned NOT NULL default '0',
  `website_id` smallint(5) unsigned NOT NULL default '0',
  `is_public` tinyint(1) unsigned NOT NULL default '1',
  `url_key` varchar(100) default NULL,
  `title` varchar(255) NOT NULL default '',
  `message` text NOT NULL,
  `shipping_address` blob NOT NULL,
  `custom_values` text NOT NULL,
  `is_active` tinyint(4) NOT NULL default '0',
  `created_at` datetime default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_EE_GR_ENTITY_CUSTOMER` (`customer_id`),
  KEY `IDX_EE_GR_ENTITY_WEBSITE` (`website_id`),
  KEY `IDX_EE_GR_ENTITY_TYPE` (`type_id`),
  CONSTRAINT `FK_EE_GR_ENTITY_TYPE` FOREIGN KEY (`type_id`) REFERENCES `enterprise_giftregistry_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EE_GR_ENTITY_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EE_GR_ENTITY_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_giftregistry_item`
--

DROP TABLE IF EXISTS `enterprise_giftregistry_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_giftregistry_item` (
  `item_id` int(10) unsigned NOT NULL auto_increment,
  `entity_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `qty` decimal(12,4) NOT NULL,
  `qty_fulfilled` decimal(12,4) NOT NULL,
  `note` text NOT NULL,
  `added_at` datetime default NULL,
  `custom_options` text NOT NULL COMMENT 'Deprecated since 1.10',
  PRIMARY KEY  (`item_id`),
  KEY `IDX_EE_GR_ITEM_ENTITY` (`entity_id`),
  KEY `IDX_EE_GR_ITEM_PRODUCT` (`product_id`),
  CONSTRAINT `FK_EE_GR_ITEM_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `enterprise_giftregistry_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EE_GR_ITEM_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_giftregistry_item_option`
--

DROP TABLE IF EXISTS `enterprise_giftregistry_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_giftregistry_item_option` (
  `option_id` int(10) unsigned NOT NULL auto_increment,
  `item_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`option_id`),
  KEY `FK_GIFTREGISTRY_ITEM_OPTION_ITEM_ID` (`item_id`),
  CONSTRAINT `FK_GIFTREGISTRY_ITEM_OPTION_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `enterprise_giftregistry_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Additional options for giftregistry item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_giftregistry_label`
--

DROP TABLE IF EXISTS `enterprise_giftregistry_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_giftregistry_label` (
  `type_id` int(10) unsigned NOT NULL default '0',
  `attribute_code` varchar(32) NOT NULL default '',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `option_code` varchar(32) NOT NULL,
  `label` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`type_id`,`attribute_code`,`store_id`,`option_code`),
  KEY `IDX_EE_GR_LABEL_TYPE_ID` (`type_id`),
  KEY `IDX_EE_GR_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `FK_EE_GR_LABEL_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `enterprise_giftregistry_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EE_GR_LABEL_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_giftregistry_person`
--

DROP TABLE IF EXISTS `enterprise_giftregistry_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_giftregistry_person` (
  `person_id` int(10) unsigned NOT NULL auto_increment,
  `entity_id` int(10) unsigned NOT NULL default '0',
  `firstname` varchar(100) NOT NULL default '',
  `lastname` varchar(100) NOT NULL default '',
  `email` varchar(150) NOT NULL default '',
  `role` varchar(32) NOT NULL default '',
  `custom_values` text NOT NULL,
  PRIMARY KEY  (`person_id`),
  KEY `IDX_EE_GR_PERSON_ENTITY` (`entity_id`),
  CONSTRAINT `FK_EE_GR_PERSON_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `enterprise_giftregistry_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_giftregistry_type`
--

DROP TABLE IF EXISTS `enterprise_giftregistry_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_giftregistry_type` (
  `type_id` int(10) unsigned NOT NULL auto_increment,
  `code` varchar(15) NOT NULL default '',
  `meta_xml` blob,
  PRIMARY KEY  (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_giftregistry_type_info`
--

DROP TABLE IF EXISTS `enterprise_giftregistry_type_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_giftregistry_type_info` (
  `type_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `label` varchar(255) default NULL,
  `is_listed` tinyint(1) unsigned default NULL,
  `sort_order` tinyint(3) unsigned default NULL,
  PRIMARY KEY  (`type_id`,`store_id`),
  KEY `IDX_EE_GR_INFO_STORE` (`store_id`),
  CONSTRAINT `FK_EE_GR_INFO_TYPE` FOREIGN KEY (`type_id`) REFERENCES `enterprise_giftregistry_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EE_GR_INFO_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_giftwrapping`
--

DROP TABLE IF EXISTS `enterprise_giftwrapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_giftwrapping` (
  `wrapping_id` int(10) unsigned NOT NULL auto_increment,
  `status` tinyint(1) unsigned NOT NULL,
  `base_price` decimal(12,4) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY  (`wrapping_id`),
  KEY `IDX_EE_GW_STATUS` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_giftwrapping_store_attributes`
--

DROP TABLE IF EXISTS `enterprise_giftwrapping_store_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_giftwrapping_store_attributes` (
  `wrapping_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `design` varchar(255) NOT NULL,
  PRIMARY KEY  (`wrapping_id`,`store_id`),
  KEY `IDX_EE_GW_STORE_ID` (`store_id`),
  CONSTRAINT `FK_EE_GW_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EE_GW_ATTR_WRAPPING_ID` FOREIGN KEY (`wrapping_id`) REFERENCES `enterprise_giftwrapping` (`wrapping_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_giftwrapping_website`
--

DROP TABLE IF EXISTS `enterprise_giftwrapping_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_giftwrapping_website` (
  `wrapping_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`wrapping_id`,`website_id`),
  KEY `IDX_EE_GW_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_EE_GW_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EE_GW_WRAPPING_ID` FOREIGN KEY (`wrapping_id`) REFERENCES `enterprise_giftwrapping` (`wrapping_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_invitation`
--

DROP TABLE IF EXISTS `enterprise_invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_invitation` (
  `invitation_id` int(10) unsigned NOT NULL auto_increment,
  `customer_id` int(10) unsigned default NULL,
  `date` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `referral_id` int(10) unsigned default NULL,
  `protection_code` char(32) NOT NULL,
  `signup_date` datetime default NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `group_id` smallint(3) unsigned default NULL,
  `message` text,
  `status` enum('new','sent','accepted','canceled') NOT NULL default 'new',
  PRIMARY KEY  (`invitation_id`),
  KEY `IDX_customer_id` (`customer_id`),
  KEY `IDX_referral_id` (`referral_id`),
  KEY `FK_INVITATION_STORE` (`store_id`),
  KEY `FK_INVITATION_CUSTOMER_GROUP` (`group_id`),
  CONSTRAINT `FK_INVITATION_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_INVITATION_CUSTOMER_GROUP` FOREIGN KEY (`group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_INVITATION_REFERRAL` FOREIGN KEY (`referral_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_INVITATION_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_invitation_status_history`
--

DROP TABLE IF EXISTS `enterprise_invitation_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_invitation_status_history` (
  `history_id` int(10) unsigned NOT NULL auto_increment,
  `invitation_id` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL,
  `status` enum('new','sent','accepted','canceled') NOT NULL default 'new',
  PRIMARY KEY  (`history_id`),
  KEY `IDX_invitation_id` (`invitation_id`),
  CONSTRAINT `FK_INVITATION_HISTORY_INVITATION` FOREIGN KEY (`invitation_id`) REFERENCES `enterprise_invitation` (`invitation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_invitation_track`
--

DROP TABLE IF EXISTS `enterprise_invitation_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_invitation_track` (
  `track_id` int(10) unsigned NOT NULL auto_increment,
  `inviter_id` int(10) unsigned NOT NULL default '0',
  `referral_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`track_id`),
  UNIQUE KEY `UNQ_INVITATION_TRACK_IDS` (`inviter_id`,`referral_id`),
  KEY `FK_INVITATION_TRACK_REFERRAL` (`referral_id`),
  CONSTRAINT `FK_INVITATION_TRACK_INVITER` FOREIGN KEY (`inviter_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_INVITATION_TRACK_REFERRAL` FOREIGN KEY (`referral_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_logging_event`
--

DROP TABLE IF EXISTS `enterprise_logging_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_logging_event` (
  `log_id` int(11) NOT NULL auto_increment,
  `ip` bigint(20) NOT NULL default '0',
  `x_forwarded_ip` bigint(20) NOT NULL default '0',
  `event_code` varchar(100) NOT NULL default '',
  `time` datetime NOT NULL default '0000-00-00 00:00:00',
  `action` char(20) NOT NULL default '-',
  `info` varchar(255) NOT NULL default '-',
  `status` char(15) NOT NULL default 'success',
  `user` varchar(40) NOT NULL default '',
  `user_id` mediumint(9) unsigned default NULL,
  `fullaction` varchar(200) NOT NULL default '-',
  `error_message` text,
  PRIMARY KEY  (`log_id`),
  KEY `FK_LOGGING_EVENT_USER` (`user_id`),
  KEY `IDX_LOGGING_EVENT_USERNAME` (`user`),
  CONSTRAINT `FK_LOGGING_EVENT_USER` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18891 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_logging_event_changes`
--

DROP TABLE IF EXISTS `enterprise_logging_event_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_logging_event_changes` (
  `id` int(11) NOT NULL auto_increment,
  `source_name` varchar(150) NOT NULL,
  `event_id` int(11) default NULL,
  `source_id` int(11) default NULL,
  `original_data` text NOT NULL,
  `result_data` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `FK_LOGGING_EVENT_CHANGES_EVENT_ID` FOREIGN KEY (`event_id`) REFERENCES `enterprise_logging_event` (`log_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_reminder_rule`
--

DROP TABLE IF EXISTS `enterprise_reminder_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_reminder_rule` (
  `rule_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `conditions_serialized` mediumtext NOT NULL,
  `condition_sql` mediumtext,
  `is_active` tinyint(1) unsigned NOT NULL default '0',
  `salesrule_id` int(10) unsigned default NULL,
  `schedule` varchar(255) NOT NULL default '',
  `default_label` varchar(255) NOT NULL default '',
  `default_description` text NOT NULL,
  `active_from` datetime default NULL,
  `active_to` datetime default NULL,
  PRIMARY KEY  (`rule_id`),
  KEY `IDX_EE_REMINDER_SALESRULE` (`salesrule_id`),
  CONSTRAINT `FK_EE_REMINDER_SALESRULE` FOREIGN KEY (`salesrule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_reminder_rule_coupon`
--

DROP TABLE IF EXISTS `enterprise_reminder_rule_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_reminder_rule_coupon` (
  `rule_id` int(10) unsigned NOT NULL,
  `coupon_id` int(10) unsigned default NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `associated_at` datetime NOT NULL,
  `emails_failed` smallint(5) unsigned NOT NULL default '0',
  `is_active` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`rule_id`,`customer_id`),
  KEY `IDX_EE_REMINDER_RULE_COUPON` (`rule_id`),
  CONSTRAINT `FK_EE_REMINDER_RULE_COUPON` FOREIGN KEY (`rule_id`) REFERENCES `enterprise_reminder_rule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_reminder_rule_log`
--

DROP TABLE IF EXISTS `enterprise_reminder_rule_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_reminder_rule_log` (
  `log_id` int(10) unsigned NOT NULL auto_increment,
  `rule_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `sent_at` datetime NOT NULL,
  PRIMARY KEY  (`log_id`),
  KEY `IDX_EE_REMINDER_LOG_RULE` (`rule_id`),
  KEY `IDX_EE_REMINDER_LOG_CUSTOMER` (`customer_id`),
  CONSTRAINT `FK_EE_REMINDER_LOG_RULE` FOREIGN KEY (`rule_id`) REFERENCES `enterprise_reminder_rule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_reminder_rule_website`
--

DROP TABLE IF EXISTS `enterprise_reminder_rule_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_reminder_rule_website` (
  `rule_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`rule_id`,`website_id`),
  KEY `IDX_EE_REMINDER_WEBSITE` (`website_id`),
  CONSTRAINT `FK_EE_REMINDER_RULE` FOREIGN KEY (`rule_id`) REFERENCES `enterprise_reminder_rule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_reminder_template`
--

DROP TABLE IF EXISTS `enterprise_reminder_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_reminder_template` (
  `rule_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) NOT NULL,
  `template_id` int(10) unsigned default NULL,
  `label` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  PRIMARY KEY  (`rule_id`,`store_id`),
  KEY `IDX_EE_REMINDER_TEMPLATE_RULE` (`rule_id`),
  KEY `IDX_EE_REMINDER_TEMPLATE` (`template_id`),
  CONSTRAINT `FK_EE_REMINDER_TEMPLATE` FOREIGN KEY (`template_id`) REFERENCES `core_email_template` (`template_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_EE_REMINDER_TEMPLATE_RULE` FOREIGN KEY (`rule_id`) REFERENCES `enterprise_reminder_rule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_reward`
--

DROP TABLE IF EXISTS `enterprise_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_reward` (
  `reward_id` int(11) unsigned NOT NULL auto_increment,
  `customer_id` int(10) unsigned NOT NULL default '0',
  `website_id` smallint(5) unsigned default NULL,
  `points_balance` int(11) unsigned NOT NULL default '0',
  `website_currency_code` char(3) default NULL,
  PRIMARY KEY  (`reward_id`),
  UNIQUE KEY `UNQ_CUSTOMER_WEBSITE` (`customer_id`,`website_id`),
  KEY `FK_REWARD_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_REWARD_CUSTOMER_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_reward_history`
--

DROP TABLE IF EXISTS `enterprise_reward_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_reward_history` (
  `history_id` int(11) unsigned NOT NULL auto_increment,
  `reward_id` int(11) unsigned NOT NULL default '0',
  `website_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned default NULL,
  `action` tinyint(3) NOT NULL default '0',
  `entity` int(11) default NULL,
  `points_balance` int(11) unsigned NOT NULL default '0',
  `points_delta` int(11) NOT NULL default '0',
  `points_used` int(11) NOT NULL default '0',
  `currency_amount` decimal(12,4) unsigned NOT NULL default '0.0000',
  `currency_delta` decimal(12,4) NOT NULL default '0.0000',
  `base_currency_code` varchar(5) NOT NULL,
  `additional_data` text NOT NULL,
  `comment` text NOT NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `expired_at_static` datetime default '0000-00-00 00:00:00',
  `expired_at_dynamic` datetime default '0000-00-00 00:00:00',
  `is_expired` tinyint(3) NOT NULL default '0',
  `is_duplicate_of` int(11) unsigned default NULL,
  `notification_sent` tinyint(3) NOT NULL default '0',
  PRIMARY KEY  (`history_id`),
  KEY `IDX_REWARD_ID` (`reward_id`),
  KEY `IDX_WEBSITE_ID` (`website_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_REWARD_HISTORY_REWARD_ID` FOREIGN KEY (`reward_id`) REFERENCES `enterprise_reward` (`reward_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REWARD_HISTORY_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_REWARD_HISTORY_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_reward_rate`
--

DROP TABLE IF EXISTS `enterprise_reward_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_reward_rate` (
  `rate_id` int(11) unsigned NOT NULL auto_increment,
  `website_id` smallint(5) unsigned NOT NULL default '0',
  `customer_group_id` smallint(5) unsigned NOT NULL default '0',
  `direction` tinyint(3) NOT NULL default '1',
  `points` int(11) NOT NULL default '0',
  `currency_amount` decimal(12,4) unsigned NOT NULL default '0.0000',
  PRIMARY KEY  (`rate_id`),
  UNIQUE KEY `IDX_WEBSITE_GROUP_DIRECTION` (`website_id`,`customer_group_id`,`direction`),
  KEY `IDX_WEBSITE_ID` (`website_id`),
  KEY `IDX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `FK_REWARD_RATE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_reward_salesrule`
--

DROP TABLE IF EXISTS `enterprise_reward_salesrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_reward_salesrule` (
  `rule_id` int(10) unsigned NOT NULL default '0',
  `points_delta` int(11) unsigned NOT NULL default '0',
  KEY `FK_REWARD_SALESRULE_RULE_ID` (`rule_id`),
  CONSTRAINT `FK_REWARD_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_sales_creditmemo_grid_archive`
--

DROP TABLE IF EXISTS `enterprise_sales_creditmemo_grid_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_sales_creditmemo_grid_archive` (
  `entity_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned default NULL,
  `store_to_order_rate` decimal(12,4) default NULL,
  `base_to_order_rate` decimal(12,4) default NULL,
  `grand_total` decimal(12,4) default NULL,
  `store_to_base_rate` decimal(12,4) default NULL,
  `base_to_global_rate` decimal(12,4) default NULL,
  `base_grand_total` decimal(12,4) default NULL,
  `order_id` int(10) unsigned default NULL,
  `creditmemo_status` int(10) default NULL,
  `state` int(10) default NULL,
  `invoice_id` int(10) default NULL,
  `store_currency_code` char(3) default NULL,
  `order_currency_code` char(3) default NULL,
  `base_currency_code` char(3) default NULL,
  `global_currency_code` char(3) default NULL,
  `increment_id` varchar(50) default NULL,
  `order_increment_id` varchar(50) default NULL,
  `created_at` datetime default NULL,
  `order_created_at` datetime default NULL,
  `billing_name` varchar(255) default NULL,
  PRIMARY KEY  (`entity_id`),
  UNIQUE KEY `UNQ_INCREMENT_ID` (`increment_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `IDX_STATE` (`state`),
  KEY `IDX_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_BILLING_NAME` (`billing_name`),
  CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_GRID_ARCHIVE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_GRID_ARCHIVE_PARENT` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_sales_invoice_grid_archive`
--

DROP TABLE IF EXISTS `enterprise_sales_invoice_grid_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_sales_invoice_grid_archive` (
  `entity_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned default NULL,
  `base_grand_total` decimal(12,4) default NULL,
  `grand_total` decimal(12,4) default NULL,
  `order_id` int(10) unsigned default NULL,
  `state` int(10) default NULL,
  `store_currency_code` char(3) default NULL,
  `order_currency_code` char(3) default NULL,
  `base_currency_code` char(3) default NULL,
  `global_currency_code` char(3) default NULL,
  `increment_id` varchar(50) default NULL,
  `order_increment_id` varchar(50) default NULL,
  `created_at` datetime default NULL,
  `order_created_at` datetime default NULL,
  `billing_name` varchar(255) default NULL,
  PRIMARY KEY  (`entity_id`),
  UNIQUE KEY `UNQ_INCREMENT_ID` (`increment_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_STATE` (`state`),
  KEY `IDX_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_BILLING_NAME` (`billing_name`),
  CONSTRAINT `FK_SALES_FLAT_INVOICE_GRID_ARCHIVE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_INVOICE_GRID_ARCHIVE_PARENT` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_sales_order_grid_archive`
--

DROP TABLE IF EXISTS `enterprise_sales_order_grid_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_sales_order_grid_archive` (
  `entity_id` int(10) unsigned NOT NULL default '0',
  `status` varchar(32) default NULL,
  `status_preorder` varchar(50) default NULL,
  `store_id` smallint(5) unsigned default NULL,
  `store_name` varchar(255) default NULL,
  `customer_id` int(10) unsigned default NULL,
  `base_grand_total` decimal(12,4) default NULL,
  `base_total_paid` decimal(12,4) default NULL,
  `grand_total` decimal(12,4) default NULL,
  `total_paid` decimal(12,4) default NULL,
  `increment_id` varchar(50) default NULL,
  `base_currency_code` char(3) default NULL,
  `order_currency_code` varchar(255) default NULL,
  `shipping_name` varchar(255) default NULL,
  `billing_name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`entity_id`),
  UNIQUE KEY `UNQ_INCREMENT_ID` (`increment_id`),
  KEY `IDX_STATUS` (`status`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `IDX_BASE_TOTAL_PAID` (`base_total_paid`),
  KEY `IDX_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_TOTAL_PAID` (`total_paid`),
  KEY `IDX_SHIPPING_NAME` (`shipping_name`),
  KEY `IDX_BILLING_NAME` (`billing_name`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_UPDATED_AT` (`updated_at`),
  CONSTRAINT `FK_SALES_FLAT_ORDER_GRID_ARCHIVE_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_ORDER_GRID_ARCHIVE_PARENT` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_ORDER_GRID_ARCHIVE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_sales_shipment_grid_archive`
--

DROP TABLE IF EXISTS `enterprise_sales_shipment_grid_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_sales_shipment_grid_archive` (
  `entity_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned default NULL,
  `total_qty` decimal(12,4) default NULL,
  `order_id` int(10) unsigned default NULL,
  `shipment_status` int(10) default NULL,
  `increment_id` varchar(50) default NULL,
  `order_increment_id` varchar(50) default NULL,
  `created_at` datetime default NULL,
  `order_created_at` datetime default NULL,
  `shipping_name` varchar(255) default NULL,
  PRIMARY KEY  (`entity_id`),
  UNIQUE KEY `UNQ_INCREMENT_ID` (`increment_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_TOTAL_QTY` (`total_qty`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_SHIPMENT_STATUS` (`shipment_status`),
  KEY `IDX_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_SHIPPING_NAME` (`shipping_name`),
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_GRID_ARCHIVE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_GRID_ARCHIVE_PARENT` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_staging`
--

DROP TABLE IF EXISTS `enterprise_staging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_staging` (
  `staging_id` int(10) unsigned NOT NULL auto_increment,
  `type` varchar(50) NOT NULL default '',
  `master_website_id` smallint(5) unsigned default NULL,
  `staging_website_id` smallint(5) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `status` varchar(10) NOT NULL default '',
  `sort_order` smallint(5) unsigned NOT NULL default '0',
  `merge_scheduling_date` datetime default NULL,
  `merge_scheduling_map` text,
  PRIMARY KEY  (`staging_id`),
  KEY `IDX_ENTERPRISE_STAGING_STATUS` (`status`),
  KEY `IDX_ENTERPRISE_STAGING_SORT_ORDER` (`sort_order`),
  KEY `FK_ENTERPRISE_STAGING_MASTER_WEBSITE_ID` (`master_website_id`),
  KEY `FK_ENTERPRISE_STAGING_STAGING_WEBSITE_ID` (`staging_website_id`),
  CONSTRAINT `FK_ENTERPRISE_STAGING_MASTER_WEBSITE_ID` FOREIGN KEY (`master_website_id`) REFERENCES `core_website` (`website_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_ENTERPRISE_STAGING_STAGING_WEBSITE_ID` FOREIGN KEY (`staging_website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Staging';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_staging_action`
--

DROP TABLE IF EXISTS `enterprise_staging_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_staging_action` (
  `action_id` int(10) NOT NULL auto_increment,
  `staging_id` int(10) unsigned NOT NULL default '0',
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL default '',
  `status` char(20) NOT NULL default '',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `staging_table_prefix` varchar(255) NOT NULL default '',
  `map` text,
  `mage_version` char(50) NOT NULL default '',
  `mage_modules_version` text NOT NULL,
  `staging_website_id` smallint(5) unsigned default NULL,
  `master_website_id` smallint(5) unsigned default NULL,
  PRIMARY KEY  (`action_id`),
  KEY `IDX_STAGING_ACTION_STAGING_ID` (`staging_id`),
  KEY `IDX_STAGING_ACTION_STATUS` (`status`),
  KEY `IDX_STAGING_ACTION_VERSION` (`mage_version`),
  KEY `FK_STAGING_ACTION_MASTER_WEBSITE` (`master_website_id`),
  KEY `FK_STAGING_ACTION_STAGING_WEBSITE` (`staging_website_id`),
  KEY `IDX_STAGING_ACTION_TYPE` (`type`),
  CONSTRAINT `FK_STAGING_ACTION_STAGING_WEBSITE` FOREIGN KEY (`staging_website_id`) REFERENCES `core_website` (`website_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_STAGING_ACTION_MASTER_WEBSITE` FOREIGN KEY (`master_website_id`) REFERENCES `core_website` (`website_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Staging Actions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_staging_item`
--

DROP TABLE IF EXISTS `enterprise_staging_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_staging_item` (
  `staging_item_id` int(10) unsigned NOT NULL auto_increment,
  `staging_id` int(10) unsigned default NULL,
  `code` varchar(50) NOT NULL default '',
  `sort_order` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`staging_item_id`),
  UNIQUE KEY `UNQ_ENTERPRISE_STAGING_ITEM` (`staging_id`,`code`),
  KEY `IDX_ENTERPRISE_STAGING_ITEM_SORT_ORDER` (`staging_id`,`sort_order`),
  CONSTRAINT `FK_ENTERPRISE_STAGING_ITEM_STAGING_ID` FOREIGN KEY (`staging_id`) REFERENCES `enterprise_staging` (`staging_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='Staging Items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_staging_log`
--

DROP TABLE IF EXISTS `enterprise_staging_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_staging_log` (
  `log_id` int(10) NOT NULL auto_increment,
  `staging_id` int(10) unsigned NOT NULL default '0',
  `ip` bigint(20) NOT NULL default '0',
  `action` char(20) NOT NULL default '',
  `status` char(20) NOT NULL default '',
  `is_backuped` tinyint(1) NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL default '0',
  `username` varchar(255) NOT NULL default '',
  `is_admin_notified` tinyint(1) unsigned NOT NULL default '0',
  `additional_data` text,
  `map` text,
  `staging_website_id` smallint(5) unsigned default NULL,
  `staging_website_name` varchar(255) default NULL,
  `master_website_id` smallint(5) unsigned default NULL,
  `master_website_name` varchar(255) default NULL,
  PRIMARY KEY  (`log_id`),
  KEY `IDX_STAGING_LOG_STAGING_ID` (`staging_id`),
  KEY `IDX_STAGING_LOG_STATUS` (`status`),
  KEY `IDX_STAGING_LOG_IS_BACKUPED` (`is_backuped`),
  KEY `IDX_STAGING_LOG_NOTIFY` (`is_admin_notified`),
  KEY `FK_STAGING_LOG_MASTER_WEBSITE` (`master_website_id`),
  KEY `FK_STAGING_LOG_STAGING_WEBSITE` (`staging_website_id`),
  CONSTRAINT `FK_STAGING_LOG_MASTER_WEBSITE` FOREIGN KEY (`master_website_id`) REFERENCES `core_website` (`website_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_STAGING_LOG_STAGING_WEBSITE` FOREIGN KEY (`staging_website_id`) REFERENCES `core_website` (`website_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Staging Log History';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_targetrule`
--

DROP TABLE IF EXISTS `enterprise_targetrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_targetrule` (
  `rule_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `from_date` date default NULL,
  `to_date` date default NULL,
  `is_active` tinyint(1) NOT NULL default '0',
  `conditions_serialized` blob NOT NULL,
  `actions_serialized` blob NOT NULL,
  `positions_limit` int(5) NOT NULL default '0',
  `apply_to` tinyint(3) unsigned NOT NULL,
  `sort_order` int(10) default NULL,
  `use_customer_segment` tinyint(1) unsigned NOT NULL default '0',
  `action_select` blob,
  `action_select_bind` blob,
  PRIMARY KEY  (`rule_id`),
  KEY `IDX_IS_ACTIVE` (`is_active`),
  KEY `IDX_APPLY_TO` (`apply_to`),
  KEY `IDX_SORT_ORDER` (`sort_order`),
  KEY `IDX_USE_CUSTOMER_SEGMENT` (`use_customer_segment`),
  KEY `IDX_DATE` (`from_date`,`to_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_targetrule_customersegment`
--

DROP TABLE IF EXISTS `enterprise_targetrule_customersegment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_targetrule_customersegment` (
  `rule_id` int(10) unsigned NOT NULL,
  `segment_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`rule_id`,`segment_id`),
  KEY `IDX_SEGMENT` (`segment_id`),
  CONSTRAINT `FK_ENTERPRISE_TARGETRULE_CUSTOMERSEGMENT_RULE` FOREIGN KEY (`rule_id`) REFERENCES `enterprise_targetrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ENTERPRISE_TARGETRULE_CUSTOMERSEGMENT_SEGMENT` FOREIGN KEY (`segment_id`) REFERENCES `enterprise_customersegment_segment` (`segment_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_targetrule_index`
--

DROP TABLE IF EXISTS `enterprise_targetrule_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_targetrule_index` (
  `entity_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `type_id` tinyint(1) unsigned NOT NULL,
  `flag` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entity_id`,`store_id`,`customer_group_id`,`type_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `IDX_TYPE` (`type_id`),
  CONSTRAINT `FK_ENTERPRISE_TARGETRULE_INDEX_CUSTOMER_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ENTERPRISE_TARGETRULE_INDEX_PRODUCT` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ENTERPRISE_TARGETRULE_INDEX_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_targetrule_index_crosssell`
--

DROP TABLE IF EXISTS `enterprise_targetrule_index_crosssell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_targetrule_index_crosssell` (
  `entity_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `value` char(255) NOT NULL,
  PRIMARY KEY  (`entity_id`,`store_id`,`customer_group_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_CUSTOMER_GROUP` (`customer_group_id`),
  CONSTRAINT `FK_ENTERPRISE_TARGETRULE_INDEX_CROSSSELL_CUSTOMER_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ENTERPRISE_TARGETRULE_INDEX_CROSSSELL_PRODUCT` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ENTERPRISE_TARGETRULE_INDEX_CROSSSELL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_targetrule_index_related`
--

DROP TABLE IF EXISTS `enterprise_targetrule_index_related`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_targetrule_index_related` (
  `entity_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `value` char(255) NOT NULL,
  PRIMARY KEY  (`entity_id`,`store_id`,`customer_group_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_CUSTOMER_GROUP` (`customer_group_id`),
  CONSTRAINT `FK_ENTERPRISE_TARGETRULE_INDEX_RELATED_CUSTOMER_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ENTERPRISE_TARGETRULE_INDEX_RELATED_PRODUCT` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ENTERPRISE_TARGETRULE_INDEX_RELATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_targetrule_index_upsell`
--

DROP TABLE IF EXISTS `enterprise_targetrule_index_upsell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_targetrule_index_upsell` (
  `entity_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `value` char(255) NOT NULL,
  PRIMARY KEY  (`entity_id`,`store_id`,`customer_group_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_CUSTOMER_GROUP` (`customer_group_id`),
  CONSTRAINT `FK_ENTERPRISE_TARGETRULE_INDEX_UPSELL_CUSTOMER_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ENTERPRISE_TARGETRULE_INDEX_UPSELL_PRODUCT` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ENTERPRISE_TARGETRULE_INDEX_UPSELL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_targetrule_product`
--

DROP TABLE IF EXISTS `enterprise_targetrule_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_targetrule_product` (
  `rule_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`rule_id`,`product_id`,`store_id`),
  KEY `IDX_PRODUCT` (`product_id`),
  KEY `IDX_STORE` (`store_id`),
  CONSTRAINT `FK_ENTERPRISE_TARGETRULE_PRODUCT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ENTERPRISE_TARGETRULE_PRODUCT_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ENTERPRISE_TARGETRULE_PRODUCT_RULE` FOREIGN KEY (`rule_id`) REFERENCES `enterprise_targetrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eway_api_debug`
--

DROP TABLE IF EXISTS `eway_api_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eway_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `debug_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY  (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `find_feed_import_codes`
--

DROP TABLE IF EXISTS `find_feed_import_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `find_feed_import_codes` (
  `code_id` int(10) unsigned NOT NULL auto_increment,
  `import_code` varchar(255) NOT NULL,
  `eav_code` varchar(255) NOT NULL,
  `is_imported` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flo2cash_api_debug`
--

DROP TABLE IF EXISTS `flo2cash_api_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flo2cash_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `debug_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  `exception` text,
  PRIMARY KEY  (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frauddetection_data`
--

DROP TABLE IF EXISTS `frauddetection_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frauddetection_data` (
  `entity_id` int(10) NOT NULL auto_increment,
  `order_id` int(10) NOT NULL,
  `fraud_score` int(11) default '0',
  `fraud_data` text,
  `sent_data` text,
  PRIMARY KEY  (`entity_id`),
  KEY `order_id_idx` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11431 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frauddetection_stats`
--

DROP TABLE IF EXISTS `frauddetection_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frauddetection_stats` (
  `code` varchar(32) NOT NULL,
  `value` varchar(32) NOT NULL default '0',
  PRIMARY KEY  (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gift_message`
--

DROP TABLE IF EXISTS `gift_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift_message` (
  `gift_message_id` int(7) unsigned NOT NULL auto_increment,
  `customer_id` int(7) unsigned NOT NULL default '0',
  `sender` varchar(255) NOT NULL default '',
  `recipient` varchar(255) NOT NULL default '',
  `message` text NOT NULL,
  PRIMARY KEY  (`gift_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `googlebase_attributes`
--

DROP TABLE IF EXISTS `googlebase_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `googlebase_attributes` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `gbase_attribute` varchar(255) NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `GOOGLEBASE_ATTRIBUTES_ATTRIBUTE_ID` (`attribute_id`),
  KEY `GOOGLEBASE_ATTRIBUTES_TYPE_ID` (`type_id`),
  CONSTRAINT `GOOGLEBASE_ATTRIBUTES_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `GOOGLEBASE_ATTRIBUTES_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `googlebase_types` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='Google Base Attributes link Product Attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `googlebase_items`
--

DROP TABLE IF EXISTS `googlebase_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `googlebase_items` (
  `item_id` int(10) unsigned NOT NULL auto_increment,
  `type_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL,
  `gbase_item_id` varchar(255) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `published` datetime NOT NULL default '0000-00-00 00:00:00',
  `expires` datetime NOT NULL default '0000-00-00 00:00:00',
  `impr` smallint(5) unsigned NOT NULL default '0',
  `clicks` smallint(5) unsigned NOT NULL default '0',
  `views` smallint(5) unsigned NOT NULL default '0',
  `is_hidden` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`item_id`),
  KEY `GOOGLEBASE_ITEMS_PRODUCT_ID` (`product_id`),
  KEY `GOOGLEBASE_ITEMS_STORE_ID` (`store_id`),
  CONSTRAINT `GOOGLEBASE_ITEMS_PRODUCT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `GOOGLEBASE_ITEMS_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Google Base Items Products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `googlebase_types`
--

DROP TABLE IF EXISTS `googlebase_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `googlebase_types` (
  `type_id` int(10) unsigned NOT NULL auto_increment,
  `attribute_set_id` smallint(5) unsigned NOT NULL,
  `gbase_itemtype` varchar(255) NOT NULL,
  `target_country` varchar(2) NOT NULL default 'US',
  PRIMARY KEY  (`type_id`),
  KEY `GOOGLEBASE_TYPES_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  CONSTRAINT `GOOGLEBASE_TYPES_ATTRIBUTE_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Google Base Item Types link Attribute Sets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `googlecheckout_api_debug`
--

DROP TABLE IF EXISTS `googlecheckout_api_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `googlecheckout_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `dir` enum('in','out') default NULL,
  `url` varchar(255) default NULL,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY  (`debug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `googlecheckout_notification`
--

DROP TABLE IF EXISTS `googlecheckout_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `googlecheckout_notification` (
  `serial_number` varchar(30) NOT NULL,
  `started_at` datetime default NULL,
  `status` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `googleoptimizer_code`
--

DROP TABLE IF EXISTS `googleoptimizer_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `googleoptimizer_code` (
  `code_id` int(10) unsigned NOT NULL auto_increment,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_type` varchar(50) NOT NULL default '',
  `store_id` smallint(5) unsigned NOT NULL,
  `control_script` text,
  `tracking_script` text,
  `conversion_script` text,
  `conversion_page` varchar(255) NOT NULL default '',
  `additional_data` text,
  PRIMARY KEY  (`code_id`),
  KEY `GOOGLEOPTIMIZER_CODE_STORE` (`store_id`),
  CONSTRAINT `FK_GOOGLEOPTIMIZER_CODE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ideal_api_debug`
--

DROP TABLE IF EXISTS `ideal_api_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ideal_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `debug_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY  (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `importexport_importdata`
--

DROP TABLE IF EXISTS `importexport_importdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `importexport_importdata` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `entity` varchar(50) NOT NULL,
  `behavior` set('append','replace','delete') NOT NULL default 'append',
  `data` mediumtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `index_event`
--

DROP TABLE IF EXISTS `index_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_event` (
  `event_id` bigint(20) unsigned NOT NULL auto_increment,
  `type` varchar(64) NOT NULL,
  `entity` varchar(64) NOT NULL,
  `entity_pk` bigint(20) default NULL,
  `created_at` datetime NOT NULL,
  `old_data` mediumtext,
  `new_data` mediumtext,
  PRIMARY KEY  (`event_id`),
  UNIQUE KEY `IDX_UNIQUE_EVENT` (`type`,`entity`,`entity_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=2341 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `index_process`
--

DROP TABLE IF EXISTS `index_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_process` (
  `process_id` int(10) unsigned NOT NULL auto_increment,
  `indexer_code` varchar(32) NOT NULL,
  `status` enum('pending','working','require_reindex') NOT NULL default 'pending',
  `started_at` datetime default NULL,
  `ended_at` datetime default NULL,
  `mode` enum('real_time','manual') NOT NULL default 'real_time',
  PRIMARY KEY  (`process_id`),
  UNIQUE KEY `IDX_CODE` (`indexer_code`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `index_process_event`
--

DROP TABLE IF EXISTS `index_process_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_process_event` (
  `process_id` int(10) unsigned NOT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  `status` enum('new','working','done','error') NOT NULL default 'new',
  PRIMARY KEY  (`process_id`,`event_id`),
  KEY `FK_INDEX_EVNT_PROCESS` (`event_id`),
  CONSTRAINT `FK_INDEX_EVNT_PROCESS` FOREIGN KEY (`event_id`) REFERENCES `index_event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_INDEX_PROCESS_EVENT` FOREIGN KEY (`process_id`) REFERENCES `index_process` (`process_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_customer`
--

DROP TABLE IF EXISTS `log_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_customer` (
  `log_id` int(10) unsigned NOT NULL auto_increment,
  `visitor_id` bigint(20) unsigned default NULL,
  `customer_id` int(11) NOT NULL default '0',
  `login_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `logout_at` datetime default NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`log_id`),
  KEY `IDX_VISITOR` (`visitor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=346019 DEFAULT CHARSET=utf8 COMMENT='Customers log information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_quote`
--

DROP TABLE IF EXISTS `log_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_quote` (
  `quote_id` int(10) unsigned NOT NULL default '0',
  `visitor_id` bigint(20) unsigned default NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `deleted_at` datetime default NULL,
  PRIMARY KEY  (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quote log data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_summary`
--

DROP TABLE IF EXISTS `log_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_summary` (
  `summary_id` bigint(20) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned NOT NULL,
  `type_id` smallint(5) unsigned default NULL,
  `visitor_count` int(11) NOT NULL default '0',
  `customer_count` int(11) NOT NULL default '0',
  `add_date` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`summary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Summary log information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_summary_type`
--

DROP TABLE IF EXISTS `log_summary_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_summary_type` (
  `type_id` smallint(5) unsigned NOT NULL auto_increment,
  `type_code` varchar(64) NOT NULL default '',
  `period` smallint(5) unsigned NOT NULL default '0',
  `period_type` enum('MINUTE','HOUR','DAY','WEEK','MONTH') NOT NULL default 'MINUTE',
  PRIMARY KEY  (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Type of summary information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_url`
--

DROP TABLE IF EXISTS `log_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_url` (
  `url_id` bigint(20) unsigned NOT NULL default '0',
  `visitor_id` bigint(20) unsigned default NULL,
  `visit_time` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`url_id`),
  KEY `IDX_VISITOR` (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='URL visiting history';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_url_info`
--

DROP TABLE IF EXISTS `log_url_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_url_info` (
  `url_id` bigint(20) unsigned NOT NULL auto_increment,
  `url` varchar(255) NOT NULL default '',
  `referer` varchar(255) default NULL,
  PRIMARY KEY  (`url_id`)
) ENGINE=InnoDB AUTO_INCREMENT=166059 DEFAULT CHARSET=utf8 COMMENT='Detale information about url visit';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_visitor`
--

DROP TABLE IF EXISTS `log_visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_visitor` (
  `visitor_id` bigint(20) unsigned NOT NULL auto_increment,
  `session_id` char(64) NOT NULL default '',
  `first_visit_at` datetime default NULL,
  `last_visit_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_url_id` bigint(20) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`visitor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=526525 DEFAULT CHARSET=utf8 COMMENT='System visitors log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_visitor_info`
--

DROP TABLE IF EXISTS `log_visitor_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_visitor_info` (
  `visitor_id` bigint(20) unsigned NOT NULL default '0',
  `http_referer` varchar(255) default NULL,
  `http_user_agent` varchar(255) default NULL,
  `http_accept_charset` varchar(255) default NULL,
  `http_accept_language` varchar(255) default NULL,
  `server_addr` bigint(20) default NULL,
  `remote_addr` bigint(20) default NULL,
  PRIMARY KEY  (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Additional information by visitor';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_visitor_online`
--

DROP TABLE IF EXISTS `log_visitor_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_visitor_online` (
  `visitor_id` bigint(20) unsigned NOT NULL auto_increment,
  `visitor_type` char(1) NOT NULL,
  `remote_addr` bigint(20) NOT NULL,
  `first_visit_at` datetime default NULL,
  `last_visit_at` datetime default NULL,
  `customer_id` int(10) unsigned default NULL,
  `last_url` varchar(255) default NULL,
  PRIMARY KEY  (`visitor_id`),
  KEY `IDX_VISITOR_TYPE` (`visitor_type`),
  KEY `IDX_VISIT_TIME` (`first_visit_at`,`last_visit_at`),
  KEY `IDX_CUSTOMER` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1309959 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `newsletter_problem`
--

DROP TABLE IF EXISTS `newsletter_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_problem` (
  `problem_id` int(7) unsigned NOT NULL auto_increment,
  `subscriber_id` int(7) unsigned default NULL,
  `queue_id` int(7) unsigned NOT NULL default '0',
  `problem_error_code` int(3) unsigned default '0',
  `problem_error_text` varchar(200) default NULL,
  PRIMARY KEY  (`problem_id`),
  KEY `FK_PROBLEM_SUBSCRIBER` (`subscriber_id`),
  KEY `FK_PROBLEM_QUEUE` (`queue_id`),
  CONSTRAINT `FK_PROBLEM_QUEUE` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`),
  CONSTRAINT `FK_PROBLEM_SUBSCRIBER` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter problems';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `newsletter_queue`
--

DROP TABLE IF EXISTS `newsletter_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_queue` (
  `queue_id` int(7) unsigned NOT NULL auto_increment,
  `template_id` int(7) unsigned NOT NULL default '0',
  `newsletter_type` int(3) default NULL,
  `newsletter_text` text,
  `newsletter_styles` text,
  `newsletter_subject` varchar(200) default NULL,
  `newsletter_sender_name` varchar(200) default NULL,
  `newsletter_sender_email` varchar(200) character set latin1 collate latin1_general_ci default NULL,
  `queue_status` int(3) unsigned NOT NULL default '0',
  `queue_start_at` datetime default NULL,
  `queue_finish_at` datetime default NULL,
  PRIMARY KEY  (`queue_id`),
  KEY `FK_QUEUE_TEMPLATE` (`template_id`),
  CONSTRAINT `FK_QUEUE_TEMPLATE` FOREIGN KEY (`template_id`) REFERENCES `newsletter_template` (`template_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `newsletter_queue_link`
--

DROP TABLE IF EXISTS `newsletter_queue_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_queue_link` (
  `queue_link_id` int(9) unsigned NOT NULL auto_increment,
  `queue_id` int(7) unsigned NOT NULL default '0',
  `subscriber_id` int(7) unsigned NOT NULL default '0',
  `letter_sent_at` datetime default NULL,
  PRIMARY KEY  (`queue_link_id`),
  KEY `FK_QUEUE_LINK_SUBSCRIBER` (`subscriber_id`),
  KEY `FK_QUEUE_LINK_QUEUE` (`queue_id`),
  KEY `IDX_NEWSLETTER_QUEUE_LINK_SEND_AT` (`queue_id`,`letter_sent_at`),
  CONSTRAINT `FK_QUEUE_LINK_QUEUE` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_QUEUE_LINK_SUBSCRIBER` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter queue to subscriber link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `newsletter_queue_store_link`
--

DROP TABLE IF EXISTS `newsletter_queue_store_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_queue_store_link` (
  `queue_id` int(7) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`queue_id`,`store_id`),
  KEY `FK_NEWSLETTER_QUEUE_STORE_LINK_STORE` (`store_id`),
  CONSTRAINT `FK_LINK_QUEUE` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_NEWSLETTER_QUEUE_STORE_LINK_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `newsletter_subscriber`
--

DROP TABLE IF EXISTS `newsletter_subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_subscriber` (
  `subscriber_id` int(7) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned default '0',
  `change_status_at` datetime default NULL,
  `customer_id` int(11) unsigned NOT NULL default '0',
  `subscriber_email` varchar(150) character set latin1 collate latin1_general_ci NOT NULL default '',
  `subscriber_status` int(3) NOT NULL default '0',
  `subscriber_confirm_code` varchar(32) default 'NULL',
  PRIMARY KEY  (`subscriber_id`),
  KEY `FK_SUBSCRIBER_CUSTOMER` (`customer_id`),
  KEY `FK_NEWSLETTER_SUBSCRIBER_STORE` (`store_id`),
  CONSTRAINT `FK_NEWSLETTER_SUBSCRIBER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38987 DEFAULT CHARSET=utf8 COMMENT='Newsletter subscribers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `newsletter_template`
--

DROP TABLE IF EXISTS `newsletter_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_template` (
  `template_id` int(7) unsigned NOT NULL auto_increment,
  `template_code` varchar(150) default NULL,
  `template_text` text,
  `template_text_preprocessed` text COMMENT 'deprecated since 1.4.0.1',
  `template_styles` text,
  `template_type` int(3) unsigned default NULL,
  `template_subject` varchar(200) default NULL,
  `template_sender_name` varchar(200) default NULL,
  `template_sender_email` varchar(200) character set latin1 collate latin1_general_ci default NULL,
  `template_actual` tinyint(1) unsigned default '1',
  `added_at` datetime default NULL,
  `modified_at` datetime default NULL,
  PRIMARY KEY  (`template_id`),
  KEY `template_actual` (`template_actual`),
  KEY `added_at` (`added_at`),
  KEY `modified_at` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oscommerce_import`
--

DROP TABLE IF EXISTS `oscommerce_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oscommerce_import` (
  `import_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `host` varchar(255) NOT NULL,
  `port` int(5) NOT NULL,
  `db_name` varchar(255) default NULL,
  `db_user` varchar(255) default NULL,
  `db_password` varchar(255) default NULL,
  `db_type` varchar(32) default NULL,
  `table_prefix` varchar(32) default NULL,
  `send_subscription` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`import_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oscommerce_import_type`
--

DROP TABLE IF EXISTS `oscommerce_import_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oscommerce_import_type` (
  `type_id` int(2) unsigned NOT NULL auto_increment,
  `type_code` varchar(32) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY  (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oscommerce_orders`
--

DROP TABLE IF EXISTS `oscommerce_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oscommerce_orders` (
  `osc_magento_id` int(11) NOT NULL auto_increment,
  `orders_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL default '0',
  `magento_customers_id` int(11) NOT NULL default '0',
  `import_id` int(11) NOT NULL default '0',
  `website_id` int(11) NOT NULL default '0',
  `customers_name` varchar(64) NOT NULL default '',
  `customers_company` varchar(32) default NULL,
  `customers_street_address` varchar(64) NOT NULL default '',
  `customers_suburb` varchar(32) default NULL,
  `customers_city` varchar(32) NOT NULL default '',
  `customers_postcode` varchar(10) NOT NULL default '',
  `customers_state` varchar(32) default NULL,
  `customers_country` varchar(32) NOT NULL default '',
  `customers_telephone` varchar(32) NOT NULL default '',
  `customers_email_address` varchar(96) NOT NULL default '',
  `customers_address_format_id` int(5) NOT NULL default '0',
  `delivery_name` varchar(64) NOT NULL default '',
  `delivery_company` varchar(32) default NULL,
  `delivery_street_address` varchar(64) NOT NULL default '',
  `delivery_suburb` varchar(32) default NULL,
  `delivery_city` varchar(32) NOT NULL default '',
  `delivery_postcode` varchar(10) NOT NULL default '',
  `delivery_state` varchar(32) default NULL,
  `delivery_country` varchar(32) NOT NULL default '',
  `delivery_address_format_id` int(5) NOT NULL default '0',
  `billing_name` varchar(64) NOT NULL default '',
  `billing_company` varchar(32) default NULL,
  `billing_street_address` varchar(64) NOT NULL default '',
  `billing_suburb` varchar(32) default NULL,
  `billing_city` varchar(32) NOT NULL default '',
  `billing_postcode` varchar(10) NOT NULL default '',
  `billing_state` varchar(32) default NULL,
  `billing_country` varchar(32) NOT NULL default '',
  `billing_address_format_id` int(5) NOT NULL default '0',
  `payment_method` varchar(255) NOT NULL default '',
  `cc_type` varchar(20) default NULL,
  `cc_owner` varchar(64) default NULL,
  `cc_number` varchar(32) default NULL,
  `cc_expires` varchar(4) default NULL,
  `last_modified` datetime default NULL,
  `date_purchased` datetime default NULL,
  `orders_status` varchar(32) default NULL,
  `orders_date_finished` datetime default NULL,
  `currency` char(3) default NULL,
  `currency_value` decimal(14,6) default NULL,
  `currency_symbol` char(3) default NULL,
  `orders_total` decimal(14,6) default NULL,
  PRIMARY KEY  (`osc_magento_id`),
  KEY `idx_orders_customers_id` (`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oscommerce_orders_products`
--

DROP TABLE IF EXISTS `oscommerce_orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oscommerce_orders_products` (
  `orders_products_id` int(11) NOT NULL auto_increment,
  `osc_magento_id` int(11) NOT NULL default '0',
  `products_id` int(11) NOT NULL default '0',
  `products_model` varchar(12) default NULL,
  `products_name` varchar(64) NOT NULL default '',
  `products_price` decimal(15,4) NOT NULL default '0.0000',
  `final_price` decimal(15,4) NOT NULL default '0.0000',
  `products_tax` decimal(7,4) NOT NULL default '0.0000',
  `products_quantity` int(2) NOT NULL default '0',
  PRIMARY KEY  (`orders_products_id`),
  KEY `idx_orders_products_osc_magento_id` (`osc_magento_id`),
  KEY `idx_orders_products_products_id` (`products_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oscommerce_orders_status_history`
--

DROP TABLE IF EXISTS `oscommerce_orders_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oscommerce_orders_status_history` (
  `orders_status_history_id` int(11) NOT NULL auto_increment,
  `osc_magento_id` int(11) NOT NULL default '0',
  `orders_status_id` int(5) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `customer_notified` int(1) default '0',
  `comments` mediumtext,
  `orders_status` varchar(32) default NULL,
  PRIMARY KEY  (`orders_status_history_id`),
  KEY `idx_orders_status_history_osc_magento_id` (`osc_magento_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oscommerce_orders_total`
--

DROP TABLE IF EXISTS `oscommerce_orders_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oscommerce_orders_total` (
  `orders_total_id` int(10) unsigned NOT NULL auto_increment,
  `osc_magento_id` int(11) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `text` varchar(255) NOT NULL default '',
  `value` decimal(15,4) NOT NULL default '0.0000',
  `class` varchar(32) NOT NULL default '',
  `sort_order` int(11) NOT NULL default '0',
  PRIMARY KEY  (`orders_total_id`),
  KEY `idx_orders_total_osc_magento_id` (`osc_magento_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oscommerce_ref`
--

DROP TABLE IF EXISTS `oscommerce_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oscommerce_ref` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `import_id` int(10) NOT NULL,
  `type_id` int(10) NOT NULL,
  `value` int(10) NOT NULL,
  `ref_id` int(10) NOT NULL,
  `created_at` datetime default NULL,
  `user_id` int(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `passcode`
--

DROP TABLE IF EXISTS `passcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passcode` (
  `passcode_id` int(11) unsigned NOT NULL auto_increment,
  `admin_id` varchar(100) NOT NULL,
  `passcode` varchar(100) default NULL,
  `status` smallint(6) NOT NULL default '0',
  `created_time` datetime default NULL,
  `update_time` datetime default NULL,
  PRIMARY KEY  (`passcode_id`)
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paybox_api_debug`
--

DROP TABLE IF EXISTS `paybox_api_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paybox_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `debug_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `real_order_id` varchar(50) NOT NULL default '',
  `request_body` text,
  `response_body` text,
  PRIMARY KEY  (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paybox_question_number`
--

DROP TABLE IF EXISTS `paybox_question_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paybox_question_number` (
  `account_id` int(10) unsigned NOT NULL auto_increment,
  `account_hash` varchar(50) NOT NULL default '',
  `increment_value` int(10) unsigned NOT NULL default '1',
  `reset_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paygate_authorizenet_debug`
--

DROP TABLE IF EXISTS `paygate_authorizenet_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paygate_authorizenet_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `request_body` text,
  `response_body` text,
  `request_serialized` text,
  `result_serialized` text,
  `request_dump` text,
  `result_dump` text,
  PRIMARY KEY  (`debug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paypal_api_debug`
--

DROP TABLE IF EXISTS `paypal_api_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `debug_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY  (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paypal_cert`
--

DROP TABLE IF EXISTS `paypal_cert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_cert` (
  `cert_id` smallint(5) unsigned NOT NULL auto_increment,
  `website_id` smallint(5) unsigned NOT NULL default '0',
  `content` mediumblob NOT NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`cert_id`),
  KEY `IDX_PAYPAL_CERT_WEBSITE` (`website_id`),
  CONSTRAINT `FK_PAYPAL_CERT_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paypal_settlement_report`
--

DROP TABLE IF EXISTS `paypal_settlement_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_settlement_report` (
  `report_id` int(10) unsigned NOT NULL auto_increment,
  `report_date` date NOT NULL,
  `account_id` varchar(64) NOT NULL,
  `filename` varchar(24) NOT NULL,
  `last_modified` datetime NOT NULL,
  PRIMARY KEY  (`report_id`),
  UNIQUE KEY `UNQ_REPORT_DATE_ACCOUNT` (`report_date`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paypal_settlement_report_row`
--

DROP TABLE IF EXISTS `paypal_settlement_report_row`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_settlement_report_row` (
  `row_id` int(10) unsigned NOT NULL auto_increment,
  `report_id` int(10) unsigned NOT NULL,
  `transaction_id` varchar(19) NOT NULL,
  `invoice_id` varchar(127) default NULL,
  `paypal_reference_id` varchar(19) NOT NULL,
  `paypal_reference_id_type` enum('ODR','TXN','SUB','PAP','') NOT NULL,
  `transaction_event_code` char(5) NOT NULL default '',
  `transaction_initiation_date` datetime default NULL,
  `transaction_completion_date` datetime default NULL,
  `transaction_debit_or_credit` enum('CR','DR') NOT NULL default 'CR',
  `gross_transaction_amount` decimal(20,6) NOT NULL default '0.000000',
  `gross_transaction_currency` char(3) NOT NULL default '',
  `fee_debit_or_credit` enum('CR','DR') NOT NULL,
  `fee_amount` decimal(20,6) NOT NULL default '0.000000',
  `fee_currency` char(3) NOT NULL,
  `custom_field` varchar(255) default NULL,
  `consumer_id` varchar(127) NOT NULL default '',
  PRIMARY KEY  (`row_id`),
  KEY `IDX_REPORT_ID` (`report_id`),
  CONSTRAINT `FK_PAYPAL_SETTLEMENT_ROW_REPORT` FOREIGN KEY (`report_id`) REFERENCES `paypal_settlement_report` (`report_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paypaluk_api_debug`
--

DROP TABLE IF EXISTS `paypaluk_api_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypaluk_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `debug_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY  (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `poll`
--

DROP TABLE IF EXISTS `poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll` (
  `poll_id` int(10) unsigned NOT NULL auto_increment,
  `poll_title` varchar(255) NOT NULL default '',
  `votes_count` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned default '0',
  `date_posted` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_closed` datetime default NULL,
  `active` smallint(6) NOT NULL default '1',
  `closed` tinyint(1) NOT NULL default '0',
  `answers_display` smallint(6) default NULL,
  PRIMARY KEY  (`poll_id`),
  KEY `FK_POLL_STORE` (`store_id`),
  CONSTRAINT `FK_POLL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `poll_answer`
--

DROP TABLE IF EXISTS `poll_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_answer` (
  `answer_id` int(10) unsigned NOT NULL auto_increment,
  `poll_id` int(10) unsigned NOT NULL default '0',
  `answer_title` varchar(255) NOT NULL default '',
  `votes_count` int(10) unsigned NOT NULL default '0',
  `answer_order` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`answer_id`),
  KEY `FK_POLL_PARENT` (`poll_id`),
  CONSTRAINT `FK_POLL_PARENT` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`poll_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `poll_store`
--

DROP TABLE IF EXISTS `poll_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_store` (
  `poll_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`poll_id`,`store_id`),
  KEY `FK_POLL_STORE_STORE` (`store_id`),
  CONSTRAINT `FK_POLL_STORE_POLL` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`poll_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_POLL_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `poll_vote`
--

DROP TABLE IF EXISTS `poll_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_vote` (
  `vote_id` int(10) unsigned NOT NULL auto_increment,
  `poll_id` int(10) unsigned NOT NULL default '0',
  `poll_answer_id` int(10) unsigned NOT NULL default '0',
  `ip_address` bigint(20) default NULL,
  `customer_id` int(11) default NULL,
  `vote_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`vote_id`),
  KEY `FK_POLL_ANSWER` (`poll_answer_id`),
  CONSTRAINT `FK_POLL_ANSWER` FOREIGN KEY (`poll_answer_id`) REFERENCES `poll_answer` (`answer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_alert_price`
--

DROP TABLE IF EXISTS `product_alert_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_alert_price` (
  `alert_price_id` int(10) unsigned NOT NULL auto_increment,
  `customer_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `price` decimal(12,4) NOT NULL default '0.0000',
  `website_id` smallint(5) unsigned NOT NULL default '0',
  `add_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_send_date` datetime default NULL,
  `send_count` smallint(5) unsigned NOT NULL default '0',
  `status` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`alert_price_id`),
  KEY `FK_PRODUCT_ALERT_PRICE_CUSTOMER` (`customer_id`),
  KEY `FK_PRODUCT_ALERT_PRICE_PRODUCT` (`product_id`),
  KEY `FK_PRODUCT_ALERT_PRICE_WEBSITE` (`website_id`),
  CONSTRAINT `FK_PRODUCT_ALERT_PRICE_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ALERT_PRICE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ALERT_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_alert_stock`
--

DROP TABLE IF EXISTS `product_alert_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_alert_stock` (
  `alert_stock_id` int(10) unsigned NOT NULL auto_increment,
  `customer_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `website_id` smallint(5) unsigned NOT NULL default '0',
  `add_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `send_date` datetime default NULL,
  `send_count` smallint(5) unsigned NOT NULL default '0',
  `status` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`alert_stock_id`),
  KEY `FK_PRODUCT_ALERT_STOCK_CUSTOMER` (`customer_id`),
  KEY `FK_PRODUCT_ALERT_STOCK_PRODUCT` (`product_id`),
  KEY `FK_PRODUCT_ALERT_STOCK_WEBSITE` (`website_id`),
  CONSTRAINT `FK_PRODUCT_ALERT_STOCK_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ALERT_STOCK_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ALERT_STOCK_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `protx_api_debug`
--

DROP TABLE IF EXISTS `protx_api_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protx_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `transaction_id` varchar(255) NOT NULL default '',
  `debug_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY  (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `rating_id` smallint(6) unsigned NOT NULL auto_increment,
  `entity_id` smallint(6) unsigned NOT NULL default '0',
  `rating_code` varchar(64) NOT NULL default '',
  `position` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`rating_id`),
  UNIQUE KEY `IDX_CODE` (`rating_code`),
  KEY `FK_RATING_ENTITY` (`entity_id`),
  CONSTRAINT `FK_RATING_ENTITY_KEY` FOREIGN KEY (`entity_id`) REFERENCES `rating_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='ratings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rating_entity`
--

DROP TABLE IF EXISTS `rating_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_entity` (
  `entity_id` smallint(6) unsigned NOT NULL auto_increment,
  `entity_code` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`entity_id`),
  UNIQUE KEY `IDX_CODE` (`entity_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Rating entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rating_option`
--

DROP TABLE IF EXISTS `rating_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_option` (
  `option_id` int(10) unsigned NOT NULL auto_increment,
  `rating_id` smallint(6) unsigned NOT NULL default '0',
  `code` varchar(32) NOT NULL default '',
  `value` tinyint(3) unsigned NOT NULL default '0',
  `position` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`option_id`),
  KEY `FK_RATING_OPTION_RATING` (`rating_id`),
  CONSTRAINT `FK_RATING_OPTION_RATING` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Rating options';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rating_option_vote`
--

DROP TABLE IF EXISTS `rating_option_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_option_vote` (
  `vote_id` bigint(20) unsigned NOT NULL auto_increment,
  `option_id` int(10) unsigned NOT NULL default '0',
  `remote_ip` varchar(16) NOT NULL default '',
  `remote_ip_long` int(11) NOT NULL default '0',
  `customer_id` int(11) unsigned default '0',
  `entity_pk_value` bigint(20) unsigned NOT NULL default '0',
  `rating_id` smallint(6) unsigned NOT NULL default '0',
  `review_id` bigint(20) unsigned default NULL,
  `percent` tinyint(3) NOT NULL default '0',
  `value` tinyint(3) NOT NULL default '0',
  PRIMARY KEY  (`vote_id`),
  KEY `FK_RATING_OPTION_VALUE_OPTION` (`option_id`),
  KEY `FK_RATING_OPTION_REVIEW_ID` (`review_id`),
  CONSTRAINT `FK_RATING_OPTION_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RATING_OPTION_VALUE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `rating_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating option values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rating_option_vote_aggregated`
--

DROP TABLE IF EXISTS `rating_option_vote_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_option_vote_aggregated` (
  `primary_id` int(11) NOT NULL auto_increment,
  `rating_id` smallint(6) unsigned NOT NULL default '0',
  `entity_pk_value` bigint(20) unsigned NOT NULL default '0',
  `vote_count` int(10) unsigned NOT NULL default '0',
  `vote_value_sum` int(10) unsigned NOT NULL default '0',
  `percent` tinyint(3) NOT NULL default '0',
  `percent_approved` tinyint(3) default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`primary_id`),
  KEY `FK_RATING_OPTION_VALUE_AGGREGATE` (`rating_id`),
  KEY `FK_RATING_OPTION_VOTE_AGGREGATED_STORE` (`store_id`),
  CONSTRAINT `FK_RATING_OPTION_VALUE_AGGREGATE` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RATING_OPTION_VOTE_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rating_store`
--

DROP TABLE IF EXISTS `rating_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_store` (
  `rating_id` smallint(6) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`rating_id`,`store_id`),
  KEY `FK_RATING_STORE_STORE` (`store_id`),
  CONSTRAINT `FK_RATING_STORE_RATING` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_RATING_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rating_title`
--

DROP TABLE IF EXISTS `rating_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_title` (
  `rating_id` smallint(6) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`rating_id`,`store_id`),
  KEY `FK_RATING_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_RATING_TITLE` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RATING_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_compared_product_index`
--

DROP TABLE IF EXISTS `report_compared_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_compared_product_index` (
  `index_id` bigint(20) unsigned NOT NULL auto_increment,
  `visitor_id` int(10) unsigned default NULL,
  `customer_id` int(10) unsigned default NULL,
  `product_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned default NULL,
  `added_at` datetime NOT NULL,
  PRIMARY KEY  (`index_id`),
  UNIQUE KEY `UNQ_BY_VISITOR` (`visitor_id`,`product_id`),
  UNIQUE KEY `UNQ_BY_CUSTOMER` (`customer_id`,`product_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_SORT_ADDED_AT` (`added_at`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `FK_REPORT_COMPARED_PRODUCT_INDEX_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REPORT_COMPARED_PRODUCT_INDEX_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REPORT_COMPARED_PRODUCT_INDEX_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26073 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_event`
--

DROP TABLE IF EXISTS `report_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_event` (
  `event_id` bigint(20) unsigned NOT NULL auto_increment,
  `logged_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `event_type_id` smallint(6) unsigned NOT NULL default '0',
  `object_id` int(10) unsigned NOT NULL default '0',
  `subject_id` int(10) unsigned NOT NULL default '0',
  `subtype` tinyint(3) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`event_id`),
  KEY `IDX_EVENT_TYPE` (`event_type_id`),
  KEY `IDX_SUBJECT` (`subject_id`),
  KEY `IDX_OBJECT` (`object_id`),
  KEY `IDX_SUBTYPE` (`subtype`),
  KEY `FK_REPORT_EVENT_STORE` (`store_id`),
  CONSTRAINT `FK_REPORT_EVENT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REPORT_EVENT_TYPE` FOREIGN KEY (`event_type_id`) REFERENCES `report_event_types` (`event_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69110953 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_event_types`
--

DROP TABLE IF EXISTS `report_event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_event_types` (
  `event_type_id` smallint(6) unsigned NOT NULL auto_increment,
  `event_name` varchar(64) NOT NULL,
  `customer_login` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`event_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_viewed_product_index`
--

DROP TABLE IF EXISTS `report_viewed_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_viewed_product_index` (
  `index_id` bigint(20) unsigned NOT NULL auto_increment,
  `visitor_id` int(10) unsigned default NULL,
  `customer_id` int(10) unsigned default NULL,
  `product_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned default NULL,
  `added_at` datetime NOT NULL,
  PRIMARY KEY  (`index_id`),
  UNIQUE KEY `UNQ_BY_VISITOR` (`visitor_id`,`product_id`),
  UNIQUE KEY `UNQ_BY_CUSTOMER` (`customer_id`,`product_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_SORT_ADDED_AT` (`added_at`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `FK_REPORT_VIEWED_PRODUCT_INDEX_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REPORT_VIEWED_PRODUCT_INDEX_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REPORT_VIEWED_PRODUCT_INDEX_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8917319 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `review_id` bigint(20) unsigned NOT NULL auto_increment,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `entity_id` smallint(5) unsigned NOT NULL default '0',
  `entity_pk_value` int(10) unsigned NOT NULL default '0',
  `status_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`review_id`),
  KEY `FK_REVIEW_ENTITY` (`entity_id`),
  KEY `FK_REVIEW_STATUS` (`status_id`),
  KEY `FK_REVIEW_PARENT_PRODUCT` (`entity_pk_value`),
  CONSTRAINT `FK_REVIEW_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `review_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REVIEW_PARENT_PRODUCT` FOREIGN KEY (`entity_pk_value`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REVIEW_STATUS` FOREIGN KEY (`status_id`) REFERENCES `review_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='Review base information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `review_detail`
--

DROP TABLE IF EXISTS `review_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_detail` (
  `detail_id` bigint(20) unsigned NOT NULL auto_increment,
  `review_id` bigint(20) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned default '0',
  `title` varchar(255) NOT NULL default '',
  `detail` text NOT NULL,
  `nickname` varchar(128) NOT NULL default '',
  `customer_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`detail_id`),
  KEY `FK_REVIEW_DETAIL_REVIEW` (`review_id`),
  KEY `FK_REVIEW_DETAIL_STORE` (`store_id`),
  CONSTRAINT `FK_REVIEW_DETAIL_REVIEW` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REVIEW_DETAIL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='Review detail information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `review_entity`
--

DROP TABLE IF EXISTS `review_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_entity` (
  `entity_id` smallint(5) unsigned NOT NULL auto_increment,
  `entity_code` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `review_entity_summary`
--

DROP TABLE IF EXISTS `review_entity_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_entity_summary` (
  `primary_id` bigint(20) NOT NULL auto_increment,
  `entity_pk_value` bigint(20) NOT NULL default '0',
  `entity_type` tinyint(4) NOT NULL default '0',
  `reviews_count` smallint(6) NOT NULL default '0',
  `rating_summary` tinyint(4) NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`primary_id`),
  KEY `FK_REVIEW_ENTITY_SUMMARY_STORE` (`store_id`),
  CONSTRAINT `FK_REVIEW_ENTITY_SUMMARY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `review_status`
--

DROP TABLE IF EXISTS `review_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_status` (
  `status_id` tinyint(3) unsigned NOT NULL auto_increment,
  `status_code` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review statuses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `review_store`
--

DROP TABLE IF EXISTS `review_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_store` (
  `review_id` bigint(20) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`review_id`,`store_id`),
  KEY `FK_REVIEW_STORE_STORE` (`store_id`),
  CONSTRAINT `FK_REVIEW_STORE_REVIEW` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REVIEW_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_customer_address_entity`
--

DROP TABLE IF EXISTS `s_customer_address_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_customer_address_entity` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `increment_id` varchar(50) NOT NULL,
  `parent_id` int(10) unsigned default NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entity_id`),
  KEY `FK_CUSTOMER_ADDRESS_CUSTOMER_ID` (`parent_id`),
  CONSTRAINT `S_FK_CUSTOMER_ADDRESS_CUSTOMER_ID` FOREIGN KEY (`parent_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_customer_address_entity_datetime`
--

DROP TABLE IF EXISTS `s_customer_address_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_customer_address_entity_datetime` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `S_FK_CUSTOMER_ADDRESS_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_CUSTOMER_ADDRESS_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_CUSTOMER_ADDRESS_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_customer_address_entity_decimal`
--

DROP TABLE IF EXISTS `s_customer_address_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_customer_address_entity_decimal` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `S_FK_CUSTOMER_ADDRESS_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_customer_address_entity_int`
--

DROP TABLE IF EXISTS `s_customer_address_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_customer_address_entity_int` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_INT_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `S_FK_CUSTOMER_ADDRESS_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_CUSTOMER_ADDRESS_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_CUSTOMER_ADDRESS_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_customer_address_entity_text`
--

DROP TABLE IF EXISTS `s_customer_address_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_customer_address_entity_text` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_TEXT_ENTITY` (`entity_id`),
  CONSTRAINT `S_FK_CUSTOMER_ADDRESS_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_CUSTOMER_ADDRESS_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_CUSTOMER_ADDRESS_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_customer_address_entity_varchar`
--

DROP TABLE IF EXISTS `s_customer_address_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_customer_address_entity_varchar` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `S_FK_CUSTOMER_ADDRESS_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_customer_eav_attribute`
--

DROP TABLE IF EXISTS `s_customer_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_customer_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL auto_increment,
  `is_visible` tinyint(1) unsigned NOT NULL default '1',
  `input_filter` varchar(255) default NULL,
  `multiline_count` tinyint(3) unsigned NOT NULL default '1',
  `validate_rules` text,
  `is_system` tinyint(3) unsigned NOT NULL default '0',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `data_model` varchar(255) default NULL,
  `is_used_for_customer_segment` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`attribute_id`),
  CONSTRAINT `S_FK_CUSTOMER_EAV_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_customer_eav_attribute_website`
--

DROP TABLE IF EXISTS `s_customer_eav_attribute_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_customer_eav_attribute_website` (
  `attribute_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `is_visible` tinyint(1) unsigned default NULL,
  `is_required` tinyint(1) unsigned default NULL,
  `default_value` text,
  `multiline_count` tinyint(3) unsigned default NULL,
  PRIMARY KEY  (`attribute_id`,`website_id`),
  KEY `IDX_WEBSITE` (`website_id`),
  CONSTRAINT `S_FK_CUST_EAV_ATTR_WEBST_WEBST_CORE_WEBST` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_CUST_EAV_ATTR_WEBST_ATTR_EAV_ATTR` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_customer_entity`
--

DROP TABLE IF EXISTS `s_customer_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_customer_entity` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `website_id` smallint(5) unsigned default NULL,
  `email` varchar(255) NOT NULL,
  `group_id` smallint(3) unsigned NOT NULL default '0',
  `increment_id` varchar(50) NOT NULL,
  `store_id` smallint(5) unsigned default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entity_id`),
  KEY `FK_CUSTOMER_ENTITY_STORE` (`store_id`),
  KEY `IDX_ENTITY_TYPE` (`entity_type_id`),
  KEY `IDX_AUTH` (`email`,`website_id`),
  KEY `FK_CUSTOMER_WEBSITE` (`website_id`),
  CONSTRAINT `S_FK_CUSTOMER_ENTITY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `S_FK_CUSTOMER_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_customer_entity_datetime`
--

DROP TABLE IF EXISTS `s_customer_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_customer_entity_datetime` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_DATETIME_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `S_FK_CUSTOMER_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_CUSTOMER_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_CUSTOMER_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_customer_entity_decimal`
--

DROP TABLE IF EXISTS `s_customer_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_customer_entity_decimal` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_DECIMAL_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `S_FK_CUSTOMER_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_CUSTOMER_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_CUSTOMER_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_customer_entity_int`
--

DROP TABLE IF EXISTS `s_customer_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_customer_entity_int` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_INT_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `S_FK_CUSTOMER_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_CUSTOMER_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_CUSTOMER_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_customer_entity_text`
--

DROP TABLE IF EXISTS `s_customer_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_customer_entity_text` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_TEXT_ENTITY` (`entity_id`),
  CONSTRAINT `S_FK_CUSTOMER_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_CUSTOMER_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_CUSTOMER_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_customer_entity_varchar`
--

DROP TABLE IF EXISTS `s_customer_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_customer_entity_varchar` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_VARCHAR_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `S_FK_CUSTOMER_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_CUSTOMER_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_CUSTOMER_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_customer_form_attribute`
--

DROP TABLE IF EXISTS `s_customer_form_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_customer_form_attribute` (
  `form_code` char(32) NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`form_code`,`attribute_id`),
  KEY `IDX_CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE` (`attribute_id`),
  CONSTRAINT `S_FK_CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_log_customer`
--

DROP TABLE IF EXISTS `s_log_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_log_customer` (
  `log_id` int(10) unsigned NOT NULL auto_increment,
  `visitor_id` bigint(20) unsigned default NULL,
  `customer_id` int(11) NOT NULL default '0',
  `login_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `logout_at` datetime default NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`log_id`),
  KEY `IDX_VISITOR` (`visitor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_log_quote`
--

DROP TABLE IF EXISTS `s_log_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_log_quote` (
  `quote_id` int(10) unsigned NOT NULL default '0',
  `visitor_id` bigint(20) unsigned default NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `deleted_at` datetime default NULL,
  PRIMARY KEY  (`quote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_log_summary`
--

DROP TABLE IF EXISTS `s_log_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_log_summary` (
  `summary_id` bigint(20) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned NOT NULL,
  `type_id` smallint(5) unsigned default NULL,
  `visitor_count` int(11) NOT NULL default '0',
  `customer_count` int(11) NOT NULL default '0',
  `add_date` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`summary_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_log_summary_type`
--

DROP TABLE IF EXISTS `s_log_summary_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_log_summary_type` (
  `type_id` smallint(5) unsigned NOT NULL auto_increment,
  `type_code` varchar(64) NOT NULL,
  `period` smallint(5) unsigned NOT NULL default '0',
  `period_type` enum('MINUTE','HOUR','DAY','WEEK','MONTH') NOT NULL default 'MINUTE',
  PRIMARY KEY  (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_log_url`
--

DROP TABLE IF EXISTS `s_log_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_log_url` (
  `url_id` bigint(20) unsigned NOT NULL default '0',
  `visitor_id` bigint(20) unsigned default NULL,
  `visit_time` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`url_id`),
  KEY `IDX_VISITOR` (`visitor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_log_url_info`
--

DROP TABLE IF EXISTS `s_log_url_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_log_url_info` (
  `url_id` bigint(20) unsigned NOT NULL auto_increment,
  `url` varchar(255) NOT NULL,
  `referer` varchar(255) default NULL,
  PRIMARY KEY  (`url_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_log_visitor`
--

DROP TABLE IF EXISTS `s_log_visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_log_visitor` (
  `visitor_id` bigint(20) unsigned NOT NULL auto_increment,
  `session_id` char(64) NOT NULL,
  `first_visit_at` datetime default NULL,
  `last_visit_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_url_id` bigint(20) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`visitor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_log_visitor_info`
--

DROP TABLE IF EXISTS `s_log_visitor_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_log_visitor_info` (
  `visitor_id` bigint(20) unsigned NOT NULL default '0',
  `http_referer` varchar(255) default NULL,
  `http_user_agent` varchar(255) default NULL,
  `http_accept_charset` varchar(255) default NULL,
  `http_accept_language` varchar(255) default NULL,
  `server_addr` bigint(20) default NULL,
  `remote_addr` bigint(20) default NULL,
  PRIMARY KEY  (`visitor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_log_visitor_online`
--

DROP TABLE IF EXISTS `s_log_visitor_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_log_visitor_online` (
  `visitor_id` bigint(20) unsigned NOT NULL auto_increment,
  `visitor_type` char(1) NOT NULL,
  `remote_addr` bigint(20) NOT NULL,
  `first_visit_at` datetime default NULL,
  `last_visit_at` datetime default NULL,
  `customer_id` int(10) unsigned default NULL,
  `last_url` varchar(255) default NULL,
  PRIMARY KEY  (`visitor_id`),
  KEY `IDX_VISITOR_TYPE` (`visitor_type`),
  KEY `IDX_VISIT_TIME` (`first_visit_at`,`last_visit_at`),
  KEY `IDX_CUSTOMER` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_bestsellers_aggregated_daily`
--

DROP TABLE IF EXISTS `s_sales_bestsellers_aggregated_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_bestsellers_aggregated_daily` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `product_id` int(10) unsigned default NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(12,4) NOT NULL default '0.0000',
  `qty_ordered` decimal(12,4) NOT NULL default '0.0000',
  `rating_pos` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_PRODUCT` (`period`,`store_id`,`product_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `S_FK_PRODUCT_ORDERED_AGGREGATED_DAILY_PRODUCT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_PRODUCT_ORDERED_AGGREGATED_DAILY_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_bestsellers_aggregated_monthly`
--

DROP TABLE IF EXISTS `s_sales_bestsellers_aggregated_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_bestsellers_aggregated_monthly` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `product_id` int(10) unsigned default NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(12,4) NOT NULL default '0.0000',
  `qty_ordered` decimal(12,4) NOT NULL default '0.0000',
  `rating_pos` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_PRODUCT` (`period`,`store_id`,`product_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `S_FK_PRODUCT_ORDERED_AGGREGATED_MONTHLY_PRODUCT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_PRODUCT_ORDERED_AGGREGATED_MONTHLY_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_bestsellers_aggregated_yearly`
--

DROP TABLE IF EXISTS `s_sales_bestsellers_aggregated_yearly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_bestsellers_aggregated_yearly` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `product_id` int(10) unsigned default NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(12,4) NOT NULL default '0.0000',
  `qty_ordered` decimal(12,4) NOT NULL default '0.0000',
  `rating_pos` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_PRODUCT` (`period`,`store_id`,`product_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `S_FK_PRODUCT_ORDERED_AGGREGATED_YEARLY_PRODUCT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_PRODUCT_ORDERED_AGGREGATED_YEARLY_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_billing_agreement`
--

DROP TABLE IF EXISTS `s_sales_billing_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_billing_agreement` (
  `agreement_id` int(10) unsigned NOT NULL auto_increment,
  `customer_id` int(10) unsigned NOT NULL,
  `method_code` varchar(32) NOT NULL,
  `reference_id` varchar(32) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime default NULL,
  `store_id` smallint(5) unsigned default NULL,
  `agreement_label` varchar(255) default NULL,
  PRIMARY KEY  (`agreement_id`),
  KEY `IDX_CUSTOMER` (`customer_id`),
  KEY `FK_BILLING_AGREEMENT_STORE` (`store_id`),
  CONSTRAINT `S_FK_BILLING_AGREEMENT_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_BILLING_AGREEMENT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_billing_agreement_order`
--

DROP TABLE IF EXISTS `s_sales_billing_agreement_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_billing_agreement_order` (
  `agreement_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `UNQ_BILLING_AGREEMENT_ORDER` (`agreement_id`,`order_id`),
  KEY `FK_BILLING_AGREEMENT_ORDER_ORDER` (`order_id`),
  CONSTRAINT `S_FK_BILLING_AGREEMENT_ORDER_ORDER` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_BILLING_AGREEMENT_ORDER_AGREEMENT` FOREIGN KEY (`agreement_id`) REFERENCES `sales_billing_agreement` (`agreement_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_creditmemo`
--

DROP TABLE IF EXISTS `s_sales_flat_creditmemo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_creditmemo` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned default NULL,
  `adjustment_positive` decimal(12,4) default NULL,
  `base_shipping_tax_amount` decimal(12,4) default NULL,
  `store_to_order_rate` decimal(12,4) default NULL,
  `base_discount_amount` decimal(12,4) default NULL,
  `base_to_order_rate` decimal(12,4) default NULL,
  `grand_total` decimal(12,4) default NULL,
  `base_adjustment_negative` decimal(12,4) default NULL,
  `base_subtotal_incl_tax` decimal(12,4) default NULL,
  `shipping_amount` decimal(12,4) default NULL,
  `subtotal_incl_tax` decimal(12,4) default NULL,
  `adjustment_negative` decimal(12,4) default NULL,
  `base_shipping_amount` decimal(12,4) default NULL,
  `store_to_base_rate` decimal(12,4) default NULL,
  `base_to_global_rate` decimal(12,4) default NULL,
  `base_adjustment` decimal(12,4) default NULL,
  `base_subtotal` decimal(12,4) default NULL,
  `discount_amount` decimal(12,4) default NULL,
  `subtotal` decimal(12,4) default NULL,
  `adjustment` decimal(12,4) default NULL,
  `base_grand_total` decimal(12,4) default NULL,
  `base_adjustment_positive` decimal(12,4) default NULL,
  `base_tax_amount` decimal(12,4) default NULL,
  `shipping_tax_amount` decimal(12,4) default NULL,
  `tax_amount` decimal(12,4) default NULL,
  `order_id` int(10) unsigned NOT NULL,
  `email_sent` tinyint(1) unsigned default NULL,
  `creditmemo_status` int(10) default NULL,
  `state` int(10) default NULL,
  `shipping_address_id` int(10) default NULL,
  `billing_address_id` int(10) default NULL,
  `invoice_id` int(10) default NULL,
  `cybersource_token` varchar(255) default NULL,
  `store_currency_code` char(3) default NULL,
  `order_currency_code` char(3) default NULL,
  `base_currency_code` char(3) default NULL,
  `global_currency_code` char(3) default NULL,
  `transaction_id` varchar(255) default NULL,
  `increment_id` varchar(50) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `base_customer_balance_amount` decimal(12,4) default NULL,
  `base_customer_balance_total_refunded` decimal(12,4) default NULL,
  `base_gift_cards_amount` decimal(12,4) default NULL,
  `customer_balance_amount` decimal(12,4) default NULL,
  `customer_balance_total_refunded` decimal(12,4) default NULL,
  `gift_cards_amount` decimal(12,4) default NULL,
  `hidden_tax_amount` decimal(12,4) default NULL,
  `base_hidden_tax_amount` decimal(12,4) default NULL,
  `shipping_hidden_tax_amount` decimal(12,4) default NULL,
  `base_shipping_hidden_tax_amount` decimal(12,4) default NULL,
  `shipping_incl_tax` decimal(12,4) default NULL,
  `base_shipping_incl_tax` decimal(12,4) default NULL,
  `gw_base_price` decimal(12,4) default NULL,
  `gw_price` decimal(12,4) default NULL,
  `gw_items_base_price` decimal(12,4) default NULL,
  `gw_items_price` decimal(12,4) default NULL,
  `gw_printed_card_base_price` decimal(12,4) default NULL,
  `gw_printed_card_price` decimal(12,4) default NULL,
  `gw_base_tax_amount` decimal(12,4) default NULL,
  `gw_tax_amount` decimal(12,4) default NULL,
  `gw_items_base_tax_amount` decimal(12,4) default NULL,
  `gw_items_tax_amount` decimal(12,4) default NULL,
  `gw_printed_card_base_tax_amount` decimal(12,4) default NULL,
  `gw_printed_card_tax_amount` decimal(12,4) default NULL,
  `base_reward_currency_amount` decimal(12,4) default NULL,
  `reward_currency_amount` decimal(12,4) default NULL,
  `reward_points_balance` int(10) unsigned default NULL,
  `reward_points_balance_to_refund` int(10) unsigned default NULL,
  PRIMARY KEY  (`entity_id`),
  UNIQUE KEY `UNQ_INCREMENT_ID` (`increment_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `IDX_STATE` (`state`),
  KEY `IDX_CREATED_AT` (`created_at`),
  CONSTRAINT `S_FK_SALES_FLAT_CREDITMEMO_PARENT` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_FLAT_CREDITMEMO_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_creditmemo_comment`
--

DROP TABLE IF EXISTS `s_sales_flat_creditmemo_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_creditmemo_comment` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL,
  `is_customer_notified` int(10) default NULL,
  `is_visible_on_front` tinyint(1) unsigned NOT NULL default '0',
  `comment` text,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `S_FK_SALES_FLAT_CREDITMEMO_COMMENT_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_creditmemo_grid`
--

DROP TABLE IF EXISTS `s_sales_flat_creditmemo_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_creditmemo_grid` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned default NULL,
  `store_to_order_rate` decimal(12,4) default NULL,
  `base_to_order_rate` decimal(12,4) default NULL,
  `grand_total` decimal(12,4) default NULL,
  `store_to_base_rate` decimal(12,4) default NULL,
  `base_to_global_rate` decimal(12,4) default NULL,
  `base_grand_total` decimal(12,4) default NULL,
  `order_id` int(10) unsigned NOT NULL,
  `creditmemo_status` int(10) default NULL,
  `state` int(10) default NULL,
  `invoice_id` int(10) default NULL,
  `store_currency_code` char(3) default NULL,
  `order_currency_code` char(3) default NULL,
  `base_currency_code` char(3) default NULL,
  `global_currency_code` char(3) default NULL,
  `increment_id` varchar(50) default NULL,
  `order_increment_id` varchar(50) default NULL,
  `created_at` datetime default NULL,
  `order_created_at` datetime default NULL,
  `billing_name` varchar(255) default NULL,
  PRIMARY KEY  (`entity_id`),
  UNIQUE KEY `UNQ_INCREMENT_ID` (`increment_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `IDX_STATE` (`state`),
  KEY `IDX_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_BILLING_NAME` (`billing_name`),
  CONSTRAINT `S_FK_SALES_FLAT_CREDITMEMO_GRID_PARENT` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_FLAT_CREDITMEMO_GRID_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_creditmemo_item`
--

DROP TABLE IF EXISTS `s_sales_flat_creditmemo_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_creditmemo_item` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL,
  `weee_tax_applied_row_amount` decimal(12,4) default NULL,
  `base_price` decimal(12,4) default NULL,
  `base_weee_tax_row_disposition` decimal(12,4) default NULL,
  `tax_amount` decimal(12,4) default NULL,
  `base_weee_tax_applied_amount` decimal(12,4) default NULL,
  `weee_tax_row_disposition` decimal(12,4) default NULL,
  `base_row_total` decimal(12,4) default NULL,
  `discount_amount` decimal(12,4) default NULL,
  `row_total` decimal(12,4) default NULL,
  `weee_tax_applied_amount` decimal(12,4) default NULL,
  `base_discount_amount` decimal(12,4) default NULL,
  `base_weee_tax_disposition` decimal(12,4) default NULL,
  `price_incl_tax` decimal(12,4) default NULL,
  `base_tax_amount` decimal(12,4) default NULL,
  `weee_tax_disposition` decimal(12,4) default NULL,
  `base_price_incl_tax` decimal(12,4) default NULL,
  `qty` decimal(12,4) default NULL,
  `base_cost` decimal(12,4) default NULL,
  `base_weee_tax_applied_row_amount` decimal(12,4) default NULL,
  `price` decimal(12,4) default NULL,
  `base_row_total_incl_tax` decimal(12,4) default NULL,
  `row_total_incl_tax` decimal(12,4) default NULL,
  `product_id` int(10) default NULL,
  `order_item_id` int(10) default NULL,
  `additional_data` text,
  `description` text,
  `weee_tax_applied` text,
  `sku` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `hidden_tax_amount` decimal(12,4) default NULL,
  `base_hidden_tax_amount` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `S_FK_SALES_FLAT_CREDITMEMO_ITEM_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_invoice`
--

DROP TABLE IF EXISTS `s_sales_flat_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_invoice` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned default NULL,
  `base_grand_total` decimal(12,4) default NULL,
  `shipping_tax_amount` decimal(12,4) default NULL,
  `tax_amount` decimal(12,4) default NULL,
  `base_tax_amount` decimal(12,4) default NULL,
  `store_to_order_rate` decimal(12,4) default NULL,
  `base_shipping_tax_amount` decimal(12,4) default NULL,
  `base_discount_amount` decimal(12,4) default NULL,
  `base_to_order_rate` decimal(12,4) default NULL,
  `grand_total` decimal(12,4) default NULL,
  `shipping_amount` decimal(12,4) default NULL,
  `subtotal_incl_tax` decimal(12,4) default NULL,
  `base_subtotal_incl_tax` decimal(12,4) default NULL,
  `store_to_base_rate` decimal(12,4) default NULL,
  `base_shipping_amount` decimal(12,4) default NULL,
  `total_qty` decimal(12,4) default NULL,
  `base_to_global_rate` decimal(12,4) default NULL,
  `subtotal` decimal(12,4) default NULL,
  `base_subtotal` decimal(12,4) default NULL,
  `discount_amount` decimal(12,4) default NULL,
  `billing_address_id` int(10) default NULL,
  `is_used_for_refund` tinyint(1) unsigned default NULL,
  `order_id` int(10) unsigned NOT NULL,
  `email_sent` tinyint(1) unsigned default NULL,
  `can_void_flag` tinyint(1) unsigned default NULL,
  `state` int(10) default NULL,
  `shipping_address_id` int(10) default NULL,
  `cybersource_token` varchar(255) default NULL,
  `store_currency_code` char(3) default NULL,
  `transaction_id` varchar(255) default NULL,
  `order_currency_code` char(3) default NULL,
  `base_currency_code` char(3) default NULL,
  `global_currency_code` char(3) default NULL,
  `increment_id` varchar(50) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `base_customer_balance_amount` decimal(12,4) default NULL,
  `base_gift_cards_amount` decimal(12,4) default NULL,
  `customer_balance_amount` decimal(12,4) default NULL,
  `gift_cards_amount` decimal(12,4) default NULL,
  `hidden_tax_amount` decimal(12,4) default NULL,
  `base_hidden_tax_amount` decimal(12,4) default NULL,
  `shipping_hidden_tax_amount` decimal(12,4) default NULL,
  `base_shipping_hidden_tax_amount` decimal(12,4) default NULL,
  `shipping_incl_tax` decimal(12,4) default NULL,
  `base_shipping_incl_tax` decimal(12,4) default NULL,
  `base_total_refunded` decimal(12,4) default NULL,
  `gw_base_price` decimal(12,4) default NULL,
  `gw_price` decimal(12,4) default NULL,
  `gw_items_base_price` decimal(12,4) default NULL,
  `gw_items_price` decimal(12,4) default NULL,
  `gw_printed_card_base_price` decimal(12,4) default NULL,
  `gw_printed_card_price` decimal(12,4) default NULL,
  `gw_base_tax_amount` decimal(12,4) default NULL,
  `gw_tax_amount` decimal(12,4) default NULL,
  `gw_items_base_tax_amount` decimal(12,4) default NULL,
  `gw_items_tax_amount` decimal(12,4) default NULL,
  `gw_printed_card_base_tax_amount` decimal(12,4) default NULL,
  `gw_printed_card_tax_amount` decimal(12,4) default NULL,
  `base_reward_currency_amount` decimal(12,4) default NULL,
  `reward_currency_amount` decimal(12,4) default NULL,
  `reward_points_balance` int(10) unsigned default NULL,
  PRIMARY KEY  (`entity_id`),
  UNIQUE KEY `UNQ_INCREMENT_ID` (`increment_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_STATE` (`state`),
  KEY `IDX_CREATED_AT` (`created_at`),
  CONSTRAINT `S_FK_SALES_FLAT_INVOICE_PARENT` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_FLAT_INVOICE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_invoice_comment`
--

DROP TABLE IF EXISTS `s_sales_flat_invoice_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_invoice_comment` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL,
  `is_customer_notified` tinyint(1) unsigned default NULL,
  `is_visible_on_front` tinyint(1) unsigned NOT NULL default '0',
  `comment` text,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `S_FK_SALES_FLAT_INVOICE_COMMENT_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_invoice_grid`
--

DROP TABLE IF EXISTS `s_sales_flat_invoice_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_invoice_grid` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned default NULL,
  `base_grand_total` decimal(12,4) default NULL,
  `grand_total` decimal(12,4) default NULL,
  `order_id` int(10) unsigned NOT NULL,
  `state` int(10) default NULL,
  `store_currency_code` char(3) default NULL,
  `order_currency_code` char(3) default NULL,
  `base_currency_code` char(3) default NULL,
  `global_currency_code` char(3) default NULL,
  `increment_id` varchar(50) default NULL,
  `order_increment_id` varchar(50) default NULL,
  `created_at` datetime default NULL,
  `order_created_at` datetime default NULL,
  `billing_name` varchar(255) default NULL,
  PRIMARY KEY  (`entity_id`),
  UNIQUE KEY `UNQ_INCREMENT_ID` (`increment_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_STATE` (`state`),
  KEY `IDX_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_BILLING_NAME` (`billing_name`),
  CONSTRAINT `S_FK_SALES_FLAT_INVOICE_GRID_PARENT` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_FLAT_INVOICE_GRID_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_invoice_item`
--

DROP TABLE IF EXISTS `s_sales_flat_invoice_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_invoice_item` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL,
  `base_price` decimal(12,4) default NULL,
  `base_weee_tax_row_disposition` decimal(12,4) default NULL,
  `weee_tax_applied_row_amount` decimal(12,4) default NULL,
  `base_weee_tax_applied_amount` decimal(12,4) default NULL,
  `tax_amount` decimal(12,4) default NULL,
  `base_row_total` decimal(12,4) default NULL,
  `discount_amount` decimal(12,4) default NULL,
  `row_total` decimal(12,4) default NULL,
  `weee_tax_row_disposition` decimal(12,4) default NULL,
  `base_discount_amount` decimal(12,4) default NULL,
  `base_weee_tax_disposition` decimal(12,4) default NULL,
  `price_incl_tax` decimal(12,4) default NULL,
  `weee_tax_applied_amount` decimal(12,4) default NULL,
  `base_tax_amount` decimal(12,4) default NULL,
  `base_price_incl_tax` decimal(12,4) default NULL,
  `qty` decimal(12,4) default NULL,
  `weee_tax_disposition` decimal(12,4) default NULL,
  `base_cost` decimal(12,4) default NULL,
  `base_weee_tax_applied_row_amount` decimal(12,4) default NULL,
  `price` decimal(12,4) default NULL,
  `base_row_total_incl_tax` decimal(12,4) default NULL,
  `row_total_incl_tax` decimal(12,4) default NULL,
  `product_id` int(10) default NULL,
  `order_item_id` int(10) default NULL,
  `additional_data` text,
  `description` text,
  `weee_tax_applied` text,
  `sku` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `hidden_tax_amount` decimal(12,4) default NULL,
  `base_hidden_tax_amount` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `S_FK_SALES_FLAT_INVOICE_ITEM_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_order`
--

DROP TABLE IF EXISTS `s_sales_flat_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_order` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `state` varchar(32) default NULL,
  `status` varchar(32) default NULL,
  `coupon_code` varchar(255) default NULL,
  `protect_code` varchar(255) default NULL,
  `shipping_description` varchar(255) default NULL,
  `is_virtual` tinyint(1) unsigned default NULL,
  `store_id` smallint(5) unsigned default NULL,
  `customer_id` int(10) unsigned default NULL,
  `base_discount_amount` decimal(12,4) default NULL,
  `base_discount_canceled` decimal(12,4) default NULL,
  `base_discount_invoiced` decimal(12,4) default NULL,
  `base_discount_refunded` decimal(12,4) default NULL,
  `base_grand_total` decimal(12,4) default NULL,
  `base_shipping_amount` decimal(12,4) default NULL,
  `base_shipping_canceled` decimal(12,4) default NULL,
  `base_shipping_invoiced` decimal(12,4) default NULL,
  `base_shipping_refunded` decimal(12,4) default NULL,
  `base_shipping_tax_amount` decimal(12,4) default NULL,
  `base_shipping_tax_refunded` decimal(12,4) default NULL,
  `base_subtotal` decimal(12,4) default NULL,
  `base_subtotal_canceled` decimal(12,4) default NULL,
  `base_subtotal_invoiced` decimal(12,4) default NULL,
  `base_subtotal_refunded` decimal(12,4) default NULL,
  `base_tax_amount` decimal(12,4) default NULL,
  `base_tax_canceled` decimal(12,4) default NULL,
  `base_tax_invoiced` decimal(12,4) default NULL,
  `base_tax_refunded` decimal(12,4) default NULL,
  `base_to_global_rate` decimal(12,4) default NULL,
  `base_to_order_rate` decimal(12,4) default NULL,
  `base_total_canceled` decimal(12,4) default NULL,
  `base_total_invoiced` decimal(12,4) default NULL,
  `base_total_invoiced_cost` decimal(12,4) default NULL,
  `base_total_offline_refunded` decimal(12,4) default NULL,
  `base_total_online_refunded` decimal(12,4) default NULL,
  `base_total_paid` decimal(12,4) default NULL,
  `base_total_qty_ordered` decimal(12,4) default NULL,
  `base_total_refunded` decimal(12,4) default NULL,
  `discount_amount` decimal(12,4) default NULL,
  `discount_canceled` decimal(12,4) default NULL,
  `discount_invoiced` decimal(12,4) default NULL,
  `discount_refunded` decimal(12,4) default NULL,
  `grand_total` decimal(12,4) default NULL,
  `shipping_amount` decimal(12,4) default NULL,
  `shipping_canceled` decimal(12,4) default NULL,
  `shipping_invoiced` decimal(12,4) default NULL,
  `shipping_refunded` decimal(12,4) default NULL,
  `shipping_tax_amount` decimal(12,4) default NULL,
  `shipping_tax_refunded` decimal(12,4) default NULL,
  `store_to_base_rate` decimal(12,4) default NULL,
  `store_to_order_rate` decimal(12,4) default NULL,
  `subtotal` decimal(12,4) default NULL,
  `subtotal_canceled` decimal(12,4) default NULL,
  `subtotal_invoiced` decimal(12,4) default NULL,
  `subtotal_refunded` decimal(12,4) default NULL,
  `tax_amount` decimal(12,4) default NULL,
  `tax_canceled` decimal(12,4) default NULL,
  `tax_invoiced` decimal(12,4) default NULL,
  `tax_refunded` decimal(12,4) default NULL,
  `total_canceled` decimal(12,4) default NULL,
  `total_invoiced` decimal(12,4) default NULL,
  `total_offline_refunded` decimal(12,4) default NULL,
  `total_online_refunded` decimal(12,4) default NULL,
  `total_paid` decimal(12,4) default NULL,
  `total_qty_ordered` decimal(12,4) default NULL,
  `total_refunded` decimal(12,4) default NULL,
  `can_ship_partially` tinyint(1) unsigned default NULL,
  `can_ship_partially_item` tinyint(1) unsigned default NULL,
  `customer_is_guest` tinyint(1) unsigned default NULL,
  `customer_note_notify` tinyint(1) unsigned default NULL,
  `billing_address_id` int(10) default NULL,
  `customer_group_id` smallint(5) default NULL,
  `edit_increment` int(10) default NULL,
  `email_sent` tinyint(1) unsigned default NULL,
  `forced_do_shipment_with_invoice` tinyint(1) unsigned default NULL,
  `gift_message_id` int(10) default NULL,
  `payment_authorization_expiration` int(10) default NULL,
  `paypal_ipn_customer_notified` int(10) default NULL,
  `quote_address_id` int(10) default NULL,
  `quote_id` int(10) default NULL,
  `shipping_address_id` int(10) default NULL,
  `adjustment_negative` decimal(12,4) default NULL,
  `adjustment_positive` decimal(12,4) default NULL,
  `base_adjustment_negative` decimal(12,4) default NULL,
  `base_adjustment_positive` decimal(12,4) default NULL,
  `base_shipping_discount_amount` decimal(12,4) default NULL,
  `base_subtotal_incl_tax` decimal(12,4) default NULL,
  `base_total_due` decimal(12,4) default NULL,
  `payment_authorization_amount` decimal(12,4) default NULL,
  `shipping_discount_amount` decimal(12,4) default NULL,
  `subtotal_incl_tax` decimal(12,4) default NULL,
  `total_due` decimal(12,4) default NULL,
  `weight` decimal(12,4) default NULL,
  `customer_dob` datetime default NULL,
  `increment_id` varchar(50) default NULL,
  `applied_rule_ids` varchar(255) default NULL,
  `base_currency_code` char(3) default NULL,
  `customer_email` varchar(255) default NULL,
  `customer_firstname` varchar(255) default NULL,
  `customer_lastname` varchar(255) default NULL,
  `customer_middlename` varchar(255) default NULL,
  `customer_prefix` varchar(255) default NULL,
  `customer_suffix` varchar(255) default NULL,
  `customer_taxvat` varchar(255) default NULL,
  `discount_description` varchar(255) default NULL,
  `ext_customer_id` varchar(255) default NULL,
  `ext_order_id` varchar(255) default NULL,
  `global_currency_code` char(3) default NULL,
  `hold_before_state` varchar(255) default NULL,
  `hold_before_status` varchar(255) default NULL,
  `order_currency_code` varchar(255) default NULL,
  `original_increment_id` varchar(50) default NULL,
  `relation_child_id` varchar(32) default NULL,
  `relation_child_real_id` varchar(32) default NULL,
  `relation_parent_id` varchar(32) default NULL,
  `relation_parent_real_id` varchar(32) default NULL,
  `remote_ip` varchar(255) default NULL,
  `shipping_method` varchar(255) default NULL,
  `store_currency_code` char(3) default NULL,
  `store_name` varchar(255) default NULL,
  `x_forwarded_for` varchar(255) default NULL,
  `customer_note` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `total_item_count` smallint(5) unsigned default '0',
  `customer_gender` int(11) default NULL,
  `recycle_fee_amount` decimal(12,4) default NULL,
  `user_id` varchar(100) default NULL,
  `freight_tax` decimal(12,4) default NULL,
  `base_customer_balance_amount` decimal(12,4) default NULL,
  `base_customer_balance_invoiced` decimal(12,4) default NULL,
  `base_customer_balance_refunded` decimal(12,4) default NULL,
  `base_customer_balance_total_refunded` decimal(12,4) default NULL,
  `base_gift_cards_amount` decimal(12,4) default NULL,
  `base_gift_cards_invoiced` decimal(12,4) default NULL,
  `base_gift_cards_refunded` decimal(12,4) default NULL,
  `ccnumber` text,
  `cc_exp_month` text,
  `cc_exp_year` text,
  `customer_balance_amount` decimal(12,4) default NULL,
  `customer_balance_invoiced` decimal(12,4) default NULL,
  `customer_balance_refunded` decimal(12,4) default NULL,
  `customer_balance_total_refunded` decimal(12,4) default NULL,
  `cvv` text,
  `fraud_score` int(11) default NULL,
  `gift_cards` text,
  `gift_cards_amount` decimal(12,4) default NULL,
  `gift_cards_invoiced` decimal(12,4) default NULL,
  `gift_cards_refunded` decimal(12,4) default NULL,
  `paypal_auth_code` text,
  `paypal_reference_number` text,
  `shipping_signature` text,
  `hidden_tax_amount` decimal(12,4) default NULL,
  `base_hidden_tax_amount` decimal(12,4) default NULL,
  `shipping_hidden_tax_amount` decimal(12,4) default NULL,
  `base_shipping_hidden_tax_amount` decimal(12,4) default NULL,
  `hidden_tax_invoiced` decimal(12,4) default NULL,
  `base_hidden_tax_invoiced` decimal(12,4) default NULL,
  `hidden_tax_refunded` decimal(12,4) default NULL,
  `base_hidden_tax_refunded` decimal(12,4) default NULL,
  `shipping_incl_tax` decimal(12,4) default NULL,
  `base_shipping_incl_tax` decimal(12,4) default NULL,
  `gw_id` int(10) unsigned default NULL,
  `gw_allow_gift_receipt` int(10) unsigned default NULL,
  `gw_add_printed_card` int(10) unsigned default NULL,
  `gw_base_price` decimal(12,4) default NULL,
  `gw_price` decimal(12,4) default NULL,
  `gw_items_base_price` decimal(12,4) default NULL,
  `gw_items_price` decimal(12,4) default NULL,
  `gw_printed_card_base_price` decimal(12,4) default NULL,
  `gw_printed_card_price` decimal(12,4) default NULL,
  `gw_base_tax_amount` decimal(12,4) default NULL,
  `gw_tax_amount` decimal(12,4) default NULL,
  `gw_items_base_tax_amount` decimal(12,4) default NULL,
  `gw_items_tax_amount` decimal(12,4) default NULL,
  `gw_printed_card_base_tax_amount` decimal(12,4) default NULL,
  `gw_printed_card_tax_amount` decimal(12,4) default NULL,
  `gw_base_price_invoiced` decimal(12,4) default NULL,
  `gw_price_invoiced` decimal(12,4) default NULL,
  `gw_items_base_price_invoiced` decimal(12,4) default NULL,
  `gw_items_price_invoiced` decimal(12,4) default NULL,
  `gw_printed_card_base_price_invoiced` decimal(12,4) default NULL,
  `gw_printed_card_price_invoiced` decimal(12,4) default NULL,
  `gw_base_tax_amount_invoiced` decimal(12,4) default NULL,
  `gw_tax_amount_invoiced` decimal(12,4) default NULL,
  `gw_items_base_tax_amount_invoiced` decimal(12,4) default NULL,
  `gw_items_tax_amount_invoiced` decimal(12,4) default NULL,
  `gw_printed_card_base_tax_amount_invoiced` decimal(12,4) default NULL,
  `gw_printed_card_tax_amount_invoiced` decimal(12,4) default NULL,
  `gw_base_price_refunded` decimal(12,4) default NULL,
  `gw_price_refunded` decimal(12,4) default NULL,
  `gw_items_base_price_refunded` decimal(12,4) default NULL,
  `gw_items_price_refunded` decimal(12,4) default NULL,
  `gw_printed_card_base_price_refunded` decimal(12,4) default NULL,
  `gw_printed_card_price_refunded` decimal(12,4) default NULL,
  `gw_base_tax_amount_refunded` decimal(12,4) default NULL,
  `gw_tax_amount_refunded` decimal(12,4) default NULL,
  `gw_items_base_tax_amount_refunded` decimal(12,4) default NULL,
  `gw_items_tax_amount_refunded` decimal(12,4) default NULL,
  `gw_printed_card_base_tax_amount_refunded` decimal(12,4) default NULL,
  `gw_printed_card_tax_amount_refunded` decimal(12,4) default NULL,
  `reward_points_balance` int(10) unsigned default NULL,
  `base_reward_currency_amount` decimal(12,4) default NULL,
  `reward_currency_amount` decimal(12,4) default NULL,
  `base_reward_currency_amount_invoiced` decimal(12,4) default NULL,
  `reward_currency_amount_invoiced` decimal(12,4) default NULL,
  `base_reward_currency_amount_refunded` decimal(12,4) default NULL,
  `reward_currency_amount_refunded` decimal(12,4) default NULL,
  `reward_points_balance_refunded` int(10) unsigned default NULL,
  `reward_points_balance_to_refund` int(10) unsigned default NULL,
  `reward_salesrule_points` int(10) unsigned default NULL,
  PRIMARY KEY  (`entity_id`),
  UNIQUE KEY `UNQ_INCREMENT_ID` (`increment_id`),
  KEY `IDX_STATUS` (`status`),
  KEY `IDX_STATE` (`state`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_EXT_ORDER_ID` (`ext_order_id`),
  KEY `IDX_UPDATED_AT` (`updated_at`),
  KEY `IDX_QUOTE_ID` (`quote_id`),
  CONSTRAINT `S_FK_SALES_FLAT_ORDER_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_FLAT_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_order_address`
--

DROP TABLE IF EXISTS `s_sales_flat_order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_order_address` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned default NULL,
  `customer_address_id` int(10) default NULL,
  `quote_address_id` int(10) default NULL,
  `region_id` int(10) default NULL,
  `customer_id` int(10) default NULL,
  `fax` varchar(255) default NULL,
  `region` varchar(255) default NULL,
  `postcode` varchar(255) default NULL,
  `lastname` varchar(255) default NULL,
  `street` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `telephone` varchar(255) default NULL,
  `country_id` char(2) default NULL,
  `firstname` varchar(255) default NULL,
  `address_type` varchar(255) default NULL,
  `prefix` varchar(255) default NULL,
  `middlename` varchar(255) default NULL,
  `suffix` varchar(255) default NULL,
  `company` varchar(255) default NULL,
  `giftregistry_item_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `S_FK_SALES_FLAT_ORDER_ADDRESS_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_order_grid`
--

DROP TABLE IF EXISTS `s_sales_flat_order_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_order_grid` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `status` varchar(32) default NULL,
  `store_id` smallint(5) unsigned default NULL,
  `store_name` varchar(255) default NULL,
  `customer_id` int(10) unsigned default NULL,
  `base_grand_total` decimal(12,4) default NULL,
  `base_total_paid` decimal(12,4) default NULL,
  `grand_total` decimal(12,4) default NULL,
  `total_paid` decimal(12,4) default NULL,
  `increment_id` varchar(50) default NULL,
  `base_currency_code` char(3) default NULL,
  `order_currency_code` varchar(255) default NULL,
  `shipping_name` varchar(255) default NULL,
  `billing_name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`entity_id`),
  UNIQUE KEY `UNQ_INCREMENT_ID` (`increment_id`),
  KEY `IDX_STATUS` (`status`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `IDX_BASE_TOTAL_PAID` (`base_total_paid`),
  KEY `IDX_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_TOTAL_PAID` (`total_paid`),
  KEY `IDX_SHIPPING_NAME` (`shipping_name`),
  KEY `IDX_BILLING_NAME` (`billing_name`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_UPDATED_AT` (`updated_at`),
  CONSTRAINT `S_FK_SALES_FLAT_ORDER_GRID_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_FLAT_ORDER_GRID_PARENT` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_FLAT_ORDER_GRID_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_order_item`
--

DROP TABLE IF EXISTS `s_sales_flat_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_order_item` (
  `item_id` int(10) unsigned NOT NULL auto_increment,
  `order_id` int(10) unsigned NOT NULL default '0',
  `parent_item_id` int(10) unsigned default NULL,
  `quote_item_id` int(10) unsigned default NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `product_id` int(10) unsigned default NULL,
  `product_type` varchar(255) default NULL,
  `product_options` text,
  `weight` decimal(12,4) default '0.0000',
  `is_virtual` tinyint(1) unsigned default NULL,
  `sku` varchar(255) NOT NULL,
  `name` varchar(255) default NULL,
  `description` text,
  `applied_rule_ids` text,
  `additional_data` text,
  `free_shipping` tinyint(1) unsigned NOT NULL default '0',
  `is_qty_decimal` tinyint(1) unsigned default NULL,
  `no_discount` tinyint(1) unsigned default '0',
  `qty_backordered` decimal(12,4) default '0.0000',
  `qty_canceled` decimal(12,4) default '0.0000',
  `qty_invoiced` decimal(12,4) default '0.0000',
  `qty_ordered` decimal(12,4) default '0.0000',
  `qty_refunded` decimal(12,4) default '0.0000',
  `qty_shipped` decimal(12,4) default '0.0000',
  `cost` decimal(12,4) default '0.0000',
  `price` decimal(12,4) NOT NULL default '0.0000',
  `base_price` decimal(12,4) NOT NULL default '0.0000',
  `original_price` decimal(12,4) default NULL,
  `base_original_price` decimal(12,4) default NULL,
  `tax_percent` decimal(12,4) default '0.0000',
  `tax_amount` decimal(12,4) default '0.0000',
  `base_tax_amount` decimal(12,4) default '0.0000',
  `tax_invoiced` decimal(12,4) default '0.0000',
  `base_tax_invoiced` decimal(12,4) default '0.0000',
  `discount_percent` decimal(12,4) default '0.0000',
  `discount_amount` decimal(12,4) default '0.0000',
  `base_discount_amount` decimal(12,4) default '0.0000',
  `discount_invoiced` decimal(12,4) default '0.0000',
  `base_discount_invoiced` decimal(12,4) default '0.0000',
  `amount_refunded` decimal(12,4) default '0.0000',
  `base_amount_refunded` decimal(12,4) default '0.0000',
  `row_total` decimal(12,4) NOT NULL default '0.0000',
  `base_row_total` decimal(12,4) NOT NULL default '0.0000',
  `row_invoiced` decimal(12,4) NOT NULL default '0.0000',
  `base_row_invoiced` decimal(12,4) NOT NULL default '0.0000',
  `row_weight` decimal(12,4) default '0.0000',
  `gift_message_id` int(10) default NULL,
  `gift_message_available` int(10) default NULL,
  `base_tax_before_discount` decimal(12,4) default NULL,
  `tax_before_discount` decimal(12,4) default NULL,
  `ext_order_item_id` varchar(255) default NULL,
  `locked_do_invoice` int(10) unsigned default NULL,
  `locked_do_ship` int(10) unsigned default NULL,
  `weee_tax_applied` text,
  `weee_tax_applied_amount` decimal(12,4) default NULL,
  `weee_tax_applied_row_amount` decimal(12,4) default NULL,
  `base_weee_tax_applied_amount` decimal(12,4) default NULL,
  `base_weee_tax_applied_row_amount` decimal(12,4) default NULL,
  `weee_tax_disposition` decimal(12,4) default NULL,
  `weee_tax_row_disposition` decimal(12,4) default NULL,
  `base_weee_tax_disposition` decimal(12,4) default NULL,
  `base_weee_tax_row_disposition` decimal(12,4) default NULL,
  `event_id` int(10) unsigned default NULL,
  `event_name` varchar(255) default NULL,
  PRIMARY KEY  (`item_id`),
  KEY `IDX_ORDER` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_order_payment`
--

DROP TABLE IF EXISTS `s_sales_flat_order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_order_payment` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL,
  `base_shipping_captured` decimal(12,4) default NULL,
  `shipping_captured` decimal(12,4) default NULL,
  `amount_refunded` decimal(12,4) default NULL,
  `base_amount_paid` decimal(12,4) default NULL,
  `amount_canceled` decimal(12,4) default NULL,
  `base_amount_authorized` decimal(12,4) default NULL,
  `base_amount_paid_online` decimal(12,4) default NULL,
  `base_amount_refunded_online` decimal(12,4) default NULL,
  `base_shipping_amount` decimal(12,4) default NULL,
  `shipping_amount` decimal(12,4) default NULL,
  `amount_paid` decimal(12,4) default NULL,
  `amount_authorized` decimal(12,4) default NULL,
  `base_amount_ordered` decimal(12,4) default NULL,
  `base_shipping_refunded` decimal(12,4) default NULL,
  `shipping_refunded` decimal(12,4) default NULL,
  `base_amount_refunded` decimal(12,4) default NULL,
  `amount_ordered` decimal(12,4) default NULL,
  `base_amount_canceled` decimal(12,4) default NULL,
  `ideal_transaction_checked` tinyint(1) unsigned default NULL,
  `quote_payment_id` int(10) default NULL,
  `additional_data` text,
  `cc_exp_month` varchar(255) default NULL,
  `cc_ss_start_year` varchar(255) default NULL,
  `echeck_bank_name` varchar(255) default NULL,
  `method` varchar(255) default NULL,
  `cc_debug_request_body` varchar(255) default NULL,
  `cc_secure_verify` varchar(255) default NULL,
  `cybersource_token` varchar(255) default NULL,
  `ideal_issuer_title` varchar(255) default NULL,
  `protection_eligibility` varchar(255) default NULL,
  `cc_approval` varchar(255) default NULL,
  `cc_last4` varchar(255) default NULL,
  `cc_status_description` varchar(255) default NULL,
  `echeck_type` varchar(255) default NULL,
  `paybox_question_number` varchar(255) default NULL,
  `cc_debug_response_serialized` varchar(255) default NULL,
  `cc_ss_start_month` varchar(255) default NULL,
  `echeck_account_type` varchar(255) default NULL,
  `last_trans_id` varchar(255) default NULL,
  `cc_cid_status` varchar(255) default NULL,
  `cc_owner` varchar(255) default NULL,
  `cc_type` varchar(255) default NULL,
  `ideal_issuer_id` varchar(255) default NULL,
  `po_number` varchar(255) default NULL,
  `cc_exp_year` varchar(255) default NULL,
  `cc_status` varchar(255) default NULL,
  `echeck_routing_number` varchar(255) default NULL,
  `account_status` varchar(255) default NULL,
  `anet_trans_method` varchar(255) default NULL,
  `cc_debug_response_body` varchar(255) default NULL,
  `cc_ss_issue` varchar(255) default NULL,
  `echeck_account_name` varchar(255) default NULL,
  `cc_avs_status` varchar(255) default NULL,
  `cc_number_enc` varchar(255) default NULL,
  `cc_trans_id` varchar(255) default NULL,
  `flo2cash_account_id` varchar(255) default NULL,
  `paybox_request_number` varchar(255) default NULL,
  `address_status` varchar(255) default NULL,
  `additional_information` text,
  `maxmind_response` text,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `S_FK_SALES_FLAT_ORDER_PAYMENT_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_order_status_history`
--

DROP TABLE IF EXISTS `s_sales_flat_order_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_order_status_history` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL,
  `is_customer_notified` int(10) default NULL,
  `is_visible_on_front` tinyint(1) unsigned NOT NULL default '0',
  `comment` text,
  `status` varchar(32) default NULL,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  CONSTRAINT `S_FK_SALES_FLAT_ORDER_STATUS_HISTORY_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_quote`
--

DROP TABLE IF EXISTS `s_sales_flat_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_quote` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `converted_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned default '1',
  `is_virtual` tinyint(1) unsigned default '0',
  `is_multi_shipping` tinyint(1) unsigned default '0',
  `items_count` int(10) unsigned default '0',
  `items_qty` decimal(12,4) default '0.0000',
  `orig_order_id` int(10) unsigned default '0',
  `store_to_base_rate` decimal(12,4) default '0.0000',
  `store_to_quote_rate` decimal(12,4) default '0.0000',
  `base_currency_code` varchar(255) default NULL,
  `store_currency_code` varchar(255) default NULL,
  `quote_currency_code` varchar(255) default NULL,
  `grand_total` decimal(12,4) default '0.0000',
  `base_grand_total` decimal(12,4) default '0.0000',
  `checkout_method` varchar(255) default NULL,
  `customer_id` int(10) unsigned default '0',
  `customer_tax_class_id` int(10) unsigned default '0',
  `customer_group_id` int(10) unsigned default '0',
  `customer_email` varchar(255) default NULL,
  `customer_prefix` varchar(40) default NULL,
  `customer_firstname` varchar(255) default NULL,
  `customer_middlename` varchar(40) default NULL,
  `customer_lastname` varchar(255) default NULL,
  `customer_suffix` varchar(40) default NULL,
  `customer_dob` datetime default NULL,
  `customer_note` varchar(255) default NULL,
  `customer_note_notify` tinyint(1) unsigned default '1',
  `customer_is_guest` tinyint(1) unsigned default '0',
  `remote_ip` varchar(32) default NULL,
  `applied_rule_ids` varchar(255) default NULL,
  `reserved_order_id` varchar(64) default NULL,
  `password_hash` varchar(255) default NULL,
  `coupon_code` varchar(255) default NULL,
  `global_currency_code` varchar(255) default NULL,
  `base_to_global_rate` decimal(12,4) default NULL,
  `base_to_quote_rate` decimal(12,4) default NULL,
  `customer_taxvat` varchar(255) default NULL,
  `subtotal` decimal(12,4) default NULL,
  `base_subtotal` decimal(12,4) default NULL,
  `subtotal_with_discount` decimal(12,4) default NULL,
  `base_subtotal_with_discount` decimal(12,4) default NULL,
  `is_changed` int(10) unsigned default NULL,
  `trigger_recollect` tinyint(1) NOT NULL default '0',
  `ext_shipping_info` text,
  `gift_message_id` int(10) unsigned default NULL,
  `customer_balance_amount_used` decimal(12,4) default NULL,
  `base_customer_balance_amount_used` decimal(12,4) default NULL,
  `use_customer_balance` int(10) unsigned default NULL,
  `gift_cards` text,
  `gift_cards_amount` decimal(12,4) default NULL,
  `base_gift_cards_amount` decimal(12,4) default NULL,
  `gift_cards_amount_used` decimal(12,4) default NULL,
  `base_gift_cards_amount_used` decimal(12,4) default NULL,
  `recycle_fee_amount` decimal(12,2) NOT NULL default '0.00',
  PRIMARY KEY  (`entity_id`),
  KEY `FK_SALES_QUOTE_STORE` (`store_id`),
  KEY `IDX_CUSTOMER` (`customer_id`,`store_id`,`is_active`),
  CONSTRAINT `S_FK_SALES_QUOTE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_quote_address`
--

DROP TABLE IF EXISTS `s_sales_flat_quote_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_quote_address` (
  `address_id` int(10) unsigned NOT NULL auto_increment,
  `quote_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `customer_id` int(10) unsigned default NULL,
  `save_in_address_book` tinyint(1) default '0',
  `customer_address_id` int(10) unsigned default NULL,
  `address_type` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `prefix` varchar(40) default NULL,
  `firstname` varchar(255) default NULL,
  `middlename` varchar(40) default NULL,
  `lastname` varchar(255) default NULL,
  `suffix` varchar(40) default NULL,
  `company` varchar(255) default NULL,
  `street` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `region` varchar(255) default NULL,
  `region_id` int(10) unsigned default NULL,
  `postcode` varchar(255) default NULL,
  `country_id` varchar(255) default NULL,
  `telephone` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `same_as_billing` tinyint(1) unsigned NOT NULL default '0',
  `free_shipping` tinyint(1) unsigned NOT NULL default '0',
  `collect_shipping_rates` tinyint(1) unsigned NOT NULL default '0',
  `shipping_method` varchar(255) NOT NULL,
  `shipping_description` varchar(255) NOT NULL,
  `weight` decimal(12,4) NOT NULL default '0.0000',
  `subtotal` decimal(12,4) NOT NULL default '0.0000',
  `base_subtotal` decimal(12,4) NOT NULL default '0.0000',
  `subtotal_with_discount` decimal(12,4) NOT NULL default '0.0000',
  `base_subtotal_with_discount` decimal(12,4) NOT NULL default '0.0000',
  `tax_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_tax_amount` decimal(12,4) NOT NULL default '0.0000',
  `shipping_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_shipping_amount` decimal(12,4) NOT NULL default '0.0000',
  `shipping_tax_amount` decimal(12,4) default NULL,
  `base_shipping_tax_amount` decimal(12,4) default NULL,
  `discount_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL default '0.0000',
  `grand_total` decimal(12,4) NOT NULL default '0.0000',
  `base_grand_total` decimal(12,4) NOT NULL default '0.0000',
  `customer_notes` text,
  `applied_taxes` text,
  `gift_message_id` int(10) unsigned default NULL,
  `base_customer_balance_amount` decimal(12,4) default NULL,
  `customer_balance_amount` decimal(12,4) default NULL,
  `gift_cards_amount` decimal(12,4) default NULL,
  `base_gift_cards_amount` decimal(12,4) default NULL,
  `gift_cards` text,
  `used_gift_cards` text,
  PRIMARY KEY  (`address_id`),
  KEY `FK_SALES_QUOTE_ADDRESS_SALES_QUOTE` (`quote_id`),
  CONSTRAINT `S_FK_SALES_QUOTE_ADDRESS_SALES_QUOTE` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_quote_address_item`
--

DROP TABLE IF EXISTS `s_sales_flat_quote_address_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_quote_address_item` (
  `address_item_id` int(10) unsigned NOT NULL auto_increment,
  `parent_item_id` int(10) unsigned default NULL,
  `quote_address_id` int(10) unsigned NOT NULL default '0',
  `quote_item_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `applied_rule_ids` text,
  `additional_data` text,
  `weight` decimal(12,4) default '0.0000',
  `qty` decimal(12,4) NOT NULL default '0.0000',
  `discount_amount` decimal(12,4) default '0.0000',
  `tax_amount` decimal(12,4) default '0.0000',
  `row_total` decimal(12,4) NOT NULL default '0.0000',
  `base_row_total` decimal(12,4) NOT NULL default '0.0000',
  `row_total_with_discount` decimal(12,4) default '0.0000',
  `base_discount_amount` decimal(12,4) default '0.0000',
  `base_tax_amount` decimal(12,4) default '0.0000',
  `row_weight` decimal(12,4) default '0.0000',
  `product_id` int(10) unsigned default NULL,
  `super_product_id` int(10) unsigned default NULL,
  `parent_product_id` int(10) unsigned default NULL,
  `sku` varchar(255) default NULL,
  `image` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `description` text,
  `free_shipping` int(10) unsigned default NULL,
  `is_qty_decimal` int(10) unsigned default NULL,
  `price` decimal(12,4) default NULL,
  `discount_percent` decimal(12,4) default NULL,
  `no_discount` int(10) unsigned default NULL,
  `tax_percent` decimal(12,4) default NULL,
  `base_price` decimal(12,4) default NULL,
  `gift_message_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`address_item_id`),
  KEY `FK_QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS` (`quote_address_id`),
  KEY `FK_SALES_QUOTE_ADDRESS_ITEM_QUOTE_ITEM` (`quote_item_id`),
  KEY `FK_SALES_FLAT_QUOTE_ADDRESS_ITEM_PARENT` (`parent_item_id`),
  CONSTRAINT `S_FK_QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS` FOREIGN KEY (`quote_address_id`) REFERENCES `sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_FLAT_QUOTE_ADDRESS_ITEM_PARENT` FOREIGN KEY (`parent_item_id`) REFERENCES `sales_flat_quote_address_item` (`address_item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_QUOTE_ADDRESS_ITEM_QUOTE_ITEM` FOREIGN KEY (`quote_item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_quote_item`
--

DROP TABLE IF EXISTS `s_sales_flat_quote_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_quote_item` (
  `item_id` int(10) unsigned NOT NULL auto_increment,
  `quote_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `product_id` int(10) unsigned default NULL,
  `parent_item_id` int(10) unsigned default NULL,
  `is_virtual` tinyint(1) unsigned default NULL,
  `sku` varchar(255) NOT NULL,
  `name` varchar(255) default NULL,
  `description` text,
  `applied_rule_ids` text,
  `additional_data` text,
  `free_shipping` tinyint(1) unsigned NOT NULL default '0',
  `is_qty_decimal` tinyint(1) unsigned default NULL,
  `no_discount` tinyint(1) unsigned default '0',
  `weight` decimal(12,4) default '0.0000',
  `qty` decimal(12,4) NOT NULL default '0.0000',
  `price` decimal(12,4) NOT NULL default '0.0000',
  `base_price` decimal(12,4) NOT NULL default '0.0000',
  `custom_price` decimal(12,4) default NULL,
  `discount_percent` decimal(12,4) default '0.0000',
  `discount_amount` decimal(12,4) default '0.0000',
  `base_discount_amount` decimal(12,4) default '0.0000',
  `tax_percent` decimal(12,4) default '0.0000',
  `tax_amount` decimal(12,4) default '0.0000',
  `base_tax_amount` decimal(12,4) default '0.0000',
  `row_total` decimal(12,4) NOT NULL default '0.0000',
  `base_row_total` decimal(12,4) NOT NULL default '0.0000',
  `row_total_with_discount` decimal(12,4) default '0.0000',
  `row_weight` decimal(12,4) default '0.0000',
  `product_type` varchar(255) default NULL,
  `base_tax_before_discount` decimal(12,4) default NULL,
  `tax_before_discount` decimal(12,4) default NULL,
  `original_custom_price` decimal(12,4) default NULL,
  `gift_message_id` int(10) unsigned default NULL,
  `weee_tax_applied` text,
  `weee_tax_applied_amount` decimal(12,4) default NULL,
  `weee_tax_applied_row_amount` decimal(12,4) default NULL,
  `base_weee_tax_applied_amount` decimal(12,4) default NULL,
  `base_weee_tax_applied_row_amount` decimal(12,4) default NULL,
  `weee_tax_disposition` decimal(12,4) default NULL,
  `weee_tax_row_disposition` decimal(12,4) default NULL,
  `base_weee_tax_disposition` decimal(12,4) default NULL,
  `base_weee_tax_row_disposition` decimal(12,4) default NULL,
  `event_id` int(10) unsigned default NULL,
  `event_name` varchar(255) default NULL,
  PRIMARY KEY  (`item_id`),
  KEY `FK_SALES_QUOTE_ITEM_SALES_QUOTE` (`quote_id`),
  KEY `FK_SALES_FLAT_QUOTE_ITEM_PARENT_ITEM` (`parent_item_id`),
  KEY `FK_SALES_QUOTE_ITEM_CATALOG_PRODUCT_ENTITY` (`product_id`),
  CONSTRAINT `S_FK_SALES_FLAT_QUOTE_ITEM_PARENT_ITEM` FOREIGN KEY (`parent_item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_QUOTE_ITEM_CATALOG_PRODUCT_ENTITY` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_QUOTE_ITEM_SALES_QUOTE` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_quote_item_option`
--

DROP TABLE IF EXISTS `s_sales_flat_quote_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_quote_item_option` (
  `option_id` int(10) unsigned NOT NULL auto_increment,
  `item_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`option_id`),
  KEY `FK_SALES_QUOTE_ITEM_OPTION_ITEM_ID` (`item_id`),
  CONSTRAINT `S_FK_SALES_QUOTE_ITEM_OPTION_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_quote_payment`
--

DROP TABLE IF EXISTS `s_sales_flat_quote_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_quote_payment` (
  `payment_id` int(10) unsigned NOT NULL auto_increment,
  `quote_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `method` varchar(255) default NULL,
  `cc_type` varchar(255) default NULL,
  `cc_number_enc` varchar(255) default NULL,
  `cc_last4` varchar(255) default NULL,
  `cc_cid_enc` varchar(255) default NULL,
  `cc_owner` varchar(255) default NULL,
  `cc_exp_month` tinyint(2) unsigned default '0',
  `cc_exp_year` smallint(4) unsigned default '0',
  `cc_ss_owner` varchar(255) default NULL,
  `cc_ss_start_month` tinyint(2) unsigned default '0',
  `cc_ss_start_year` smallint(4) unsigned default '0',
  `cybersource_token` varchar(255) default NULL,
  `paypal_correlation_id` varchar(255) default NULL,
  `paypal_payer_id` varchar(255) default NULL,
  `paypal_payer_status` varchar(255) default NULL,
  `po_number` varchar(255) default NULL,
  `additional_data` text,
  `cc_ss_issue` varchar(255) default NULL,
  `ideal_issuer_id` varchar(255) default NULL,
  `ideal_issuer_list` text,
  PRIMARY KEY  (`payment_id`),
  KEY `FK_SALES_QUOTE_PAYMENT_SALES_QUOTE` (`quote_id`),
  CONSTRAINT `S_FK_SALES_QUOTE_PAYMENT_SALES_QUOTE` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_quote_shipping_rate`
--

DROP TABLE IF EXISTS `s_sales_flat_quote_shipping_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_quote_shipping_rate` (
  `rate_id` int(10) unsigned NOT NULL auto_increment,
  `address_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `carrier` varchar(255) default NULL,
  `carrier_title` varchar(255) default NULL,
  `code` varchar(255) default NULL,
  `method` varchar(255) default NULL,
  `method_description` text,
  `price` decimal(12,4) NOT NULL default '0.0000',
  `error_message` text,
  `method_title` text,
  PRIMARY KEY  (`rate_id`),
  KEY `FK_SALES_QUOTE_SHIPPING_RATE_ADDRESS` (`address_id`),
  CONSTRAINT `S_FK_SALES_QUOTE_SHIPPING_RATE_ADDRESS` FOREIGN KEY (`address_id`) REFERENCES `sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_shipment`
--

DROP TABLE IF EXISTS `s_sales_flat_shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_shipment` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned default NULL,
  `total_weight` decimal(12,4) default NULL,
  `total_qty` decimal(12,4) default NULL,
  `email_sent` tinyint(1) unsigned default NULL,
  `order_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) default NULL,
  `shipping_address_id` int(10) default NULL,
  `billing_address_id` int(10) default NULL,
  `shipment_status` int(10) default NULL,
  `increment_id` varchar(50) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`entity_id`),
  UNIQUE KEY `UNQ_INCREMENT_ID` (`increment_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_TOTAL_QTY` (`total_qty`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_UPDATED_AT` (`updated_at`),
  CONSTRAINT `S_FK_SALES_FLAT_SHIPMENT_PARENT` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_FLAT_SHIPMENT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_shipment_comment`
--

DROP TABLE IF EXISTS `s_sales_flat_shipment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_shipment_comment` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL,
  `is_customer_notified` int(10) default NULL,
  `is_visible_on_front` tinyint(1) unsigned NOT NULL default '0',
  `comment` text,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `S_FK_SALES_FLAT_SHIPMENT_COMMENT_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_shipment_grid`
--

DROP TABLE IF EXISTS `s_sales_flat_shipment_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_shipment_grid` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned default NULL,
  `total_qty` decimal(12,4) default NULL,
  `order_id` int(10) unsigned NOT NULL,
  `shipment_status` int(10) default NULL,
  `increment_id` varchar(50) default NULL,
  `order_increment_id` varchar(50) default NULL,
  `created_at` datetime default NULL,
  `order_created_at` datetime default NULL,
  `shipping_name` varchar(255) default NULL,
  PRIMARY KEY  (`entity_id`),
  UNIQUE KEY `UNQ_INCREMENT_ID` (`increment_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_TOTAL_QTY` (`total_qty`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_SHIPMENT_STATUS` (`shipment_status`),
  KEY `IDX_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_SHIPPING_NAME` (`shipping_name`),
  CONSTRAINT `S_FK_SALES_FLAT_SHIPMENT_GRID_PARENT` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_FLAT_SHIPMENT_GRID_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_shipment_item`
--

DROP TABLE IF EXISTS `s_sales_flat_shipment_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_shipment_item` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL,
  `row_total` decimal(12,4) default NULL,
  `price` decimal(12,4) default NULL,
  `weight` decimal(12,4) default NULL,
  `qty` decimal(12,4) default NULL,
  `product_id` int(10) default NULL,
  `order_item_id` int(10) default NULL,
  `additional_data` text,
  `description` text,
  `name` varchar(255) default NULL,
  `sku` varchar(255) default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `S_FK_SALES_FLAT_SHIPMENT_ITEM_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_flat_shipment_track`
--

DROP TABLE IF EXISTS `s_sales_flat_shipment_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_flat_shipment_track` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL,
  `weight` decimal(12,4) default NULL,
  `qty` decimal(12,4) default NULL,
  `order_id` int(10) unsigned NOT NULL,
  `number` text,
  `description` text,
  `title` varchar(255) default NULL,
  `carrier_code` varchar(32) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  CONSTRAINT `S_FK_SALES_FLAT_SHIPMENT_TRACK_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_invoiced_aggregated`
--

DROP TABLE IF EXISTS `s_sales_invoiced_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_invoiced_aggregated` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL,
  `orders_count` int(11) NOT NULL default '0',
  `orders_invoiced` decimal(12,4) NOT NULL default '0.0000',
  `invoiced` decimal(12,4) NOT NULL default '0.0000',
  `invoiced_captured` decimal(12,4) NOT NULL default '0.0000',
  `invoiced_not_captured` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `S_FK_SALES_INVOICED_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_invoiced_aggregated_order`
--

DROP TABLE IF EXISTS `s_sales_invoiced_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_invoiced_aggregated_order` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL,
  `orders_count` int(11) NOT NULL default '0',
  `orders_invoiced` decimal(12,4) NOT NULL default '0.0000',
  `invoiced` decimal(12,4) NOT NULL default '0.0000',
  `invoiced_captured` decimal(12,4) NOT NULL default '0.0000',
  `invoiced_not_captured` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `S_FK_SALES_INVOICED_AGGREGATED_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_order`
--

DROP TABLE IF EXISTS `s_sales_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_order` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `increment_id` varchar(50) NOT NULL,
  `parent_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned default NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL default '1',
  `customer_id` int(10) unsigned default NULL,
  `tax_amount` decimal(12,4) NOT NULL default '0.0000',
  `shipping_amount` decimal(12,4) NOT NULL default '0.0000',
  `discount_amount` decimal(12,4) NOT NULL default '0.0000',
  `subtotal` decimal(12,4) NOT NULL default '0.0000',
  `grand_total` decimal(12,4) NOT NULL default '0.0000',
  `total_paid` decimal(12,4) NOT NULL default '0.0000',
  `total_refunded` decimal(12,4) NOT NULL default '0.0000',
  `total_qty_ordered` decimal(12,4) NOT NULL default '0.0000',
  `total_canceled` decimal(12,4) NOT NULL default '0.0000',
  `total_invoiced` decimal(12,4) NOT NULL default '0.0000',
  `total_online_refunded` decimal(12,4) NOT NULL default '0.0000',
  `total_offline_refunded` decimal(12,4) NOT NULL default '0.0000',
  `base_tax_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_shipping_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_subtotal` decimal(12,4) NOT NULL default '0.0000',
  `base_grand_total` decimal(12,4) NOT NULL default '0.0000',
  `base_total_paid` decimal(12,4) NOT NULL default '0.0000',
  `base_total_refunded` decimal(12,4) NOT NULL default '0.0000',
  `base_total_qty_ordered` decimal(12,4) NOT NULL default '0.0000',
  `base_total_canceled` decimal(12,4) NOT NULL default '0.0000',
  `base_total_invoiced` decimal(12,4) NOT NULL default '0.0000',
  `base_total_online_refunded` decimal(12,4) NOT NULL default '0.0000',
  `base_total_offline_refunded` decimal(12,4) NOT NULL default '0.0000',
  `subtotal_refunded` decimal(12,4) default NULL,
  `subtotal_canceled` decimal(12,4) default NULL,
  `discount_refunded` decimal(12,4) default NULL,
  `discount_canceled` decimal(12,4) default NULL,
  `discount_invoiced` decimal(12,4) default NULL,
  `tax_refunded` decimal(12,4) default NULL,
  `tax_canceled` decimal(12,4) default NULL,
  `shipping_refunded` decimal(12,4) default NULL,
  `shipping_canceled` decimal(12,4) default NULL,
  `base_subtotal_refunded` decimal(12,4) default NULL,
  `base_subtotal_canceled` decimal(12,4) default NULL,
  `base_discount_refunded` decimal(12,4) default NULL,
  `base_discount_canceled` decimal(12,4) default NULL,
  `base_discount_invoiced` decimal(12,4) default NULL,
  `base_tax_refunded` decimal(12,4) default NULL,
  `base_tax_canceled` decimal(12,4) default NULL,
  `base_shipping_refunded` decimal(12,4) default NULL,
  `base_shipping_canceled` decimal(12,4) default NULL,
  `subtotal_invoiced` decimal(12,4) default NULL,
  `tax_invoiced` decimal(12,4) default NULL,
  `shipping_invoiced` decimal(12,4) default NULL,
  `base_subtotal_invoiced` decimal(12,4) default NULL,
  `base_tax_invoiced` decimal(12,4) default NULL,
  `base_shipping_invoiced` decimal(12,4) default NULL,
  `shipping_tax_amount` decimal(12,4) default NULL,
  `base_shipping_tax_amount` decimal(12,4) default NULL,
  `shipping_tax_refunded` decimal(12,4) default NULL,
  `base_shipping_tax_refunded` decimal(12,4) default NULL,
  `recycle_fee_amount` decimal(12,2) NOT NULL default '0.00',
  `user_id` varchar(100) default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `FK_SALES_ORDER_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_STORE` (`store_id`),
  KEY `IDX_CUSTOMER` (`customer_id`),
  KEY `IDX_INCREMENT_ID` (`increment_id`),
  CONSTRAINT `S_FK_SALES_ORDER_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALE_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALE_ORDER_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_order_aggregated_created`
--

DROP TABLE IF EXISTS `s_sales_order_aggregated_created`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_order_aggregated_created` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL,
  `orders_count` int(11) NOT NULL default '0',
  `total_qty_ordered` decimal(12,4) NOT NULL default '0.0000',
  `total_qty_invoiced` decimal(12,4) NOT NULL default '0.0000',
  `total_income_amount` decimal(12,4) NOT NULL default '0.0000',
  `total_revenue_amount` decimal(12,4) NOT NULL default '0.0000',
  `total_profit_amount` decimal(12,4) NOT NULL default '0.0000',
  `total_invoiced_amount` decimal(12,4) NOT NULL default '0.0000',
  `total_canceled_amount` decimal(12,4) NOT NULL default '0.0000',
  `total_paid_amount` decimal(12,4) NOT NULL default '0.0000',
  `total_refunded_amount` decimal(12,4) NOT NULL default '0.0000',
  `total_tax_amount` decimal(12,4) NOT NULL default '0.0000',
  `total_tax_amount_actual` decimal(12,4) NOT NULL default '0.0000',
  `total_shipping_amount` decimal(12,4) NOT NULL default '0.0000',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL default '0.0000',
  `total_discount_amount` decimal(12,4) NOT NULL default '0.0000',
  `total_discount_amount_actual` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `S_FK_SALES_ORDER_AGGREGATED_CREATED` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_order_datetime`
--

DROP TABLE IF EXISTS `s_sales_order_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_order_datetime` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_DATETIME` (`entity_id`),
  CONSTRAINT `S_FK_SALES_ORDER_DATETIME` FOREIGN KEY (`entity_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_ORDER_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_ORDER_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_order_decimal`
--

DROP TABLE IF EXISTS `s_sales_order_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_order_decimal` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_DECIMAL` (`entity_id`),
  CONSTRAINT `S_FK_SALES_ORDER_DECIMAL` FOREIGN KEY (`entity_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_ORDER_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_ORDER_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_order_entity`
--

DROP TABLE IF EXISTS `s_sales_order_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_order_entity` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `increment_id` varchar(50) NOT NULL,
  `parent_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned default NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entity_id`),
  KEY `FK_SALES_ORDER_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_STORE` (`store_id`),
  KEY `IDX_SALES_ORDER_ENTITY_PARENT` (`parent_id`),
  CONSTRAINT `S_FK_SALES_ORDER_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALE_ORDER_ENTITY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_order_entity_datetime`
--

DROP TABLE IF EXISTS `s_sales_order_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_order_entity_datetime` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_ENTITY_DATETIME` (`entity_id`),
  CONSTRAINT `S_FK_SALES_ORDER_ENTITY_DATETIME` FOREIGN KEY (`entity_id`) REFERENCES `sales_order_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_ORDER_ENTITY_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_ORDER_ENTITY_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_order_entity_decimal`
--

DROP TABLE IF EXISTS `s_sales_order_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_order_entity_decimal` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_ENTITY_DECIMAL` (`entity_id`),
  CONSTRAINT `S_FK_SALES_ORDER_ENTITY_DECIMAL` FOREIGN KEY (`entity_id`) REFERENCES `sales_order_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_ORDER_ENTITY_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_ORDER_ENTITY_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_order_entity_int`
--

DROP TABLE IF EXISTS `s_sales_order_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_order_entity_int` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_ENTITY_INT` (`entity_id`),
  CONSTRAINT `S_FK_SALES_ORDER_ENTITY_INT` FOREIGN KEY (`entity_id`) REFERENCES `sales_order_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_ORDER_ENTITY_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_ORDER_ENTITY_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_order_entity_text`
--

DROP TABLE IF EXISTS `s_sales_order_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_order_entity_text` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_ENTITY_TEXT` (`entity_id`),
  CONSTRAINT `S_FK_SALES_ORDER_ENTITY_TEXT` FOREIGN KEY (`entity_id`) REFERENCES `sales_order_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_ORDER_ENTITY_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_ORDER_ENTITY_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_order_entity_varchar`
--

DROP TABLE IF EXISTS `s_sales_order_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_order_entity_varchar` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_ENTITY_VARCHAR` (`entity_id`),
  CONSTRAINT `S_FK_SALES_ORDER_ENTITY_VARCHAR` FOREIGN KEY (`entity_id`) REFERENCES `sales_order_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_ORDER_ENTITY_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_ORDER_ENTITY_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_order_int`
--

DROP TABLE IF EXISTS `s_sales_order_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_order_int` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_INT` (`entity_id`),
  CONSTRAINT `S_FK_SALES_ORDER_INT` FOREIGN KEY (`entity_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_ORDER_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_ORDER_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_order_status`
--

DROP TABLE IF EXISTS `s_sales_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_order_status` (
  `status` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  PRIMARY KEY  (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_order_status_label`
--

DROP TABLE IF EXISTS `s_sales_order_status_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_order_status_label` (
  `status` varchar(32) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `label` varchar(128) NOT NULL,
  PRIMARY KEY  (`status`,`store_id`),
  KEY `FK_SALES_ORDER_STATUS_LABEL_STORE` (`store_id`),
  CONSTRAINT `S_FK_SALES_ORDER_STATUS_LABEL_STATUS` FOREIGN KEY (`status`) REFERENCES `sales_order_status` (`status`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_ORDER_STATUS_LABEL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_order_status_state`
--

DROP TABLE IF EXISTS `s_sales_order_status_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_order_status_state` (
  `status` varchar(32) NOT NULL,
  `state` varchar(32) NOT NULL,
  `is_default` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`status`,`state`),
  CONSTRAINT `S_FK_SALES_ORDER_STATUS_STATE_STATUS` FOREIGN KEY (`status`) REFERENCES `sales_order_status` (`status`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_order_tax`
--

DROP TABLE IF EXISTS `s_sales_order_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_order_tax` (
  `tax_id` int(10) unsigned NOT NULL auto_increment,
  `order_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `percent` decimal(12,4) NOT NULL,
  `amount` decimal(12,4) NOT NULL,
  `priority` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `base_amount` decimal(12,4) NOT NULL,
  `process` smallint(6) NOT NULL,
  `base_real_amount` decimal(12,4) NOT NULL,
  `hidden` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tax_id`),
  KEY `IDX_ORDER_TAX` (`order_id`,`priority`,`position`),
  CONSTRAINT `S_FK_SALES_ORDER_TAX_ORDER` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_order_text`
--

DROP TABLE IF EXISTS `s_sales_order_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_order_text` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_TEXT` (`entity_id`),
  CONSTRAINT `S_FK_SALES_ORDER_TEXT` FOREIGN KEY (`entity_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_ORDER_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_ORDER_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_order_varchar`
--

DROP TABLE IF EXISTS `s_sales_order_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_order_varchar` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_VARCHAR` (`entity_id`),
  CONSTRAINT `S_FK_SALES_ORDER_VARCHAR` FOREIGN KEY (`entity_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_ORDER_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_ORDER_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_payment_transaction`
--

DROP TABLE IF EXISTS `s_sales_payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned default NULL,
  `order_id` int(10) unsigned NOT NULL default '0',
  `payment_id` int(10) unsigned NOT NULL default '0',
  `txn_id` varchar(100) NOT NULL,
  `parent_txn_id` varchar(100) default NULL,
  `txn_type` varchar(15) NOT NULL,
  `is_closed` tinyint(1) unsigned NOT NULL default '1',
  `additional_information` blob,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`transaction_id`),
  UNIQUE KEY `UNQ_ORDER_PAYMENT_TXN` (`order_id`,`payment_id`,`txn_id`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  KEY `IDX_PAYMENT_ID` (`payment_id`),
  CONSTRAINT `S_FK_SALES_PAYMENT_TRANSACTION_ORDER` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_PAYMENT_TRANSACTION_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_payment_transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_SALES_PAYMENT_TRANSACTION_PAYMENT` FOREIGN KEY (`payment_id`) REFERENCES `sales_flat_order_payment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_recurring_profile`
--

DROP TABLE IF EXISTS `s_sales_recurring_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_recurring_profile` (
  `profile_id` int(10) unsigned NOT NULL auto_increment,
  `state` varchar(20) NOT NULL,
  `customer_id` int(10) unsigned default NULL,
  `store_id` smallint(5) unsigned default NULL,
  `method_code` varchar(32) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime default NULL,
  `reference_id` varchar(32) default NULL,
  `subscriber_name` varchar(150) default NULL,
  `start_datetime` datetime NOT NULL,
  `internal_reference_id` varchar(42) NOT NULL,
  `schedule_description` varchar(255) NOT NULL,
  `suspension_threshold` smallint(6) unsigned default NULL,
  `bill_failed_later` tinyint(1) unsigned NOT NULL default '0',
  `period_unit` varchar(20) NOT NULL,
  `period_frequency` tinyint(3) unsigned default NULL,
  `period_max_cycles` tinyint(3) unsigned default NULL,
  `billing_amount` double(12,4) unsigned NOT NULL default '0.0000',
  `trial_period_unit` varchar(20) default NULL,
  `trial_period_frequency` tinyint(3) unsigned default NULL,
  `trial_period_max_cycles` tinyint(3) unsigned default NULL,
  `trial_billing_amount` double(12,4) unsigned default NULL,
  `currency_code` char(3) NOT NULL,
  `shipping_amount` decimal(12,4) unsigned default NULL,
  `tax_amount` decimal(12,4) unsigned default NULL,
  `init_amount` decimal(12,4) unsigned default NULL,
  `init_may_fail` tinyint(1) unsigned NOT NULL default '0',
  `order_info` text NOT NULL,
  `order_item_info` text NOT NULL,
  `billing_address_info` text NOT NULL,
  `shipping_address_info` text,
  `profile_vendor_info` text,
  `additional_info` text,
  PRIMARY KEY  (`profile_id`),
  UNIQUE KEY `UNQ_INTERNAL_REF_ID` (`internal_reference_id`),
  KEY `IDX_RECURRING_PROFILE_CUSTOMER` (`customer_id`),
  KEY `IDX_RECURRING_PROFILE_STORE` (`store_id`),
  CONSTRAINT `S_FK_RECURRING_PROFILE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `S_FK_RECURRING_PROFILE_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_recurring_profile_order`
--

DROP TABLE IF EXISTS `s_sales_recurring_profile_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_recurring_profile_order` (
  `link_id` int(10) unsigned NOT NULL auto_increment,
  `profile_id` int(10) unsigned NOT NULL default '0',
  `order_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`link_id`),
  UNIQUE KEY `UNQ_PROFILE_ORDER` (`profile_id`,`order_id`),
  KEY `IDX_ORDER` (`order_id`),
  CONSTRAINT `S_FK_RECURRING_PROFILE_ORDER_ORDER` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_RECURRING_PROFILE_ORDER_PROFILE` FOREIGN KEY (`profile_id`) REFERENCES `sales_recurring_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_refunded_aggregated`
--

DROP TABLE IF EXISTS `s_sales_refunded_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_refunded_aggregated` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL,
  `orders_count` int(11) NOT NULL default '0',
  `refunded` decimal(12,4) NOT NULL default '0.0000',
  `online_refunded` decimal(12,4) NOT NULL default '0.0000',
  `offline_refunded` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `S_FK_SALES_REFUNDED_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_refunded_aggregated_order`
--

DROP TABLE IF EXISTS `s_sales_refunded_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_refunded_aggregated_order` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL,
  `orders_count` int(11) NOT NULL default '0',
  `refunded` decimal(12,4) NOT NULL default '0.0000',
  `online_refunded` decimal(12,4) NOT NULL default '0.0000',
  `offline_refunded` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `S_FK_SALES_REFUNDED_AGGREGATED_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_shipping_aggregated`
--

DROP TABLE IF EXISTS `s_sales_shipping_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_shipping_aggregated` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL,
  `shipping_description` varchar(255) NOT NULL,
  `orders_count` int(11) NOT NULL default '0',
  `total_shipping` decimal(12,4) NOT NULL default '0.0000',
  `total_shipping_actual` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `S_FK_SALES_SHIPPING_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_sales_shipping_aggregated_order`
--

DROP TABLE IF EXISTS `s_sales_shipping_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_sales_shipping_aggregated_order` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL,
  `shipping_description` varchar(255) NOT NULL,
  `orders_count` int(11) NOT NULL default '0',
  `total_shipping` decimal(12,4) NOT NULL default '0.0000',
  `total_shipping_actual` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `S_FK_SALES_SHIPPING_AGGREGATED_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_tag`
--

DROP TABLE IF EXISTS `s_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_tag` (
  `tag_id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_tag_properties`
--

DROP TABLE IF EXISTS `s_tag_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_tag_properties` (
  `tag_id` int(11) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `base_popularity` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tag_id`,`store_id`),
  KEY `FK_TAG_PROPERTIES_STORE` (`store_id`),
  CONSTRAINT `S_FK_TAG_PROPERTIES_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_TAG_PROPERTIES_TAG` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_tag_relation`
--

DROP TABLE IF EXISTS `s_tag_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_tag_relation` (
  `tag_relation_id` int(11) unsigned NOT NULL auto_increment,
  `tag_id` int(11) unsigned NOT NULL default '0',
  `customer_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(11) unsigned NOT NULL default '0',
  `store_id` smallint(6) unsigned NOT NULL default '1',
  `active` tinyint(1) unsigned NOT NULL default '1',
  `created_at` datetime default NULL,
  PRIMARY KEY  (`tag_relation_id`),
  KEY `IDX_PRODUCT` (`product_id`),
  KEY `IDX_TAG` (`tag_id`),
  KEY `IDX_CUSTOMER` (`customer_id`),
  KEY `IDX_STORE` (`store_id`),
  CONSTRAINT `S_FK_TAG_RELATION_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_TAG_RELATION_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_TAG_RELATION_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_TAG_RELATION_TAG` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_tag_summary`
--

DROP TABLE IF EXISTS `s_tag_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_tag_summary` (
  `tag_id` int(11) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `customers` int(11) unsigned NOT NULL default '0',
  `products` int(11) unsigned NOT NULL default '0',
  `uses` int(11) unsigned NOT NULL default '0',
  `historical_uses` int(11) unsigned NOT NULL default '0',
  `popularity` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tag_id`,`store_id`),
  KEY `FK_TAG_SUMMARY_STORE` (`store_id`),
  KEY `IDX_TAG` (`tag_id`),
  CONSTRAINT `S_FK_TAG_SUMMARY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_TAG_SUMMARY_TAG` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_wishlist`
--

DROP TABLE IF EXISTS `s_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_wishlist` (
  `wishlist_id` int(10) unsigned NOT NULL auto_increment,
  `customer_id` int(10) unsigned NOT NULL default '0',
  `shared` tinyint(1) unsigned default '0',
  `sharing_code` varchar(32) NOT NULL,
  PRIMARY KEY  (`wishlist_id`),
  UNIQUE KEY `FK_CUSTOMER` (`customer_id`),
  CONSTRAINT `S_FK_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_wishlist_item`
--

DROP TABLE IF EXISTS `s_wishlist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_wishlist_item` (
  `wishlist_item_id` int(10) unsigned NOT NULL auto_increment,
  `wishlist_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL,
  `added_at` datetime default NULL,
  `description` text,
  PRIMARY KEY  (`wishlist_item_id`),
  KEY `FK_ITEM_WISHLIST` (`wishlist_id`),
  KEY `FK_WISHLIST_PRODUCT` (`product_id`),
  KEY `FK_WISHLIST_STORE` (`store_id`),
  CONSTRAINT `S_FK_ITEM_WISHLIST` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`wishlist_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_WISHLIST_ITEM_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `S_FK_WISHLIST_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_wishlist_item_option`
--

DROP TABLE IF EXISTS `s_wishlist_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_wishlist_item_option` (
  `option_id` int(10) unsigned NOT NULL auto_increment,
  `wishlist_item_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`option_id`),
  KEY `FK_WISHLIST_ITEM_OPTION_ITEM_ID` (`wishlist_item_id`),
  CONSTRAINT `S_FK_WISHLIST_ITEM_OPTION_ITEM_ID` FOREIGN KEY (`wishlist_item_id`) REFERENCES `wishlist_item` (`wishlist_item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_bestsellers_aggregated_daily`
--

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_bestsellers_aggregated_daily` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `product_id` int(10) unsigned default NULL,
  `product_name` varchar(255) NOT NULL default '',
  `product_price` decimal(12,4) NOT NULL default '0.0000',
  `qty_ordered` decimal(12,4) NOT NULL default '0.0000',
  `rating_pos` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_PRODUCT` (`period`,`store_id`,`product_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_PRODUCT_ORDERED_AGGREGATED_DAILY_PRODUCT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ORDERED_AGGREGATED_DAILY_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84493 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_bestsellers_aggregated_monthly`
--

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_bestsellers_aggregated_monthly` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `product_id` int(10) unsigned default NULL,
  `product_name` varchar(255) NOT NULL default '',
  `product_price` decimal(12,4) NOT NULL default '0.0000',
  `qty_ordered` decimal(12,4) NOT NULL default '0.0000',
  `rating_pos` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_PRODUCT` (`period`,`store_id`,`product_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_PRODUCT_ORDERED_AGGREGATED_MONTHLY_PRODUCT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ORDERED_AGGREGATED_MONTHLY_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11869 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_bestsellers_aggregated_yearly`
--

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_yearly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_bestsellers_aggregated_yearly` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `product_id` int(10) unsigned default NULL,
  `product_name` varchar(255) NOT NULL default '',
  `product_price` decimal(12,4) NOT NULL default '0.0000',
  `qty_ordered` decimal(12,4) NOT NULL default '0.0000',
  `rating_pos` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_PRODUCT` (`period`,`store_id`,`product_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_PRODUCT_ORDERED_AGGREGATED_YEARLY_PRODUCT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ORDERED_AGGREGATED_YEARLY_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3099 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_billing_agreement`
--

DROP TABLE IF EXISTS `sales_billing_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_billing_agreement` (
  `agreement_id` int(10) unsigned NOT NULL auto_increment,
  `customer_id` int(10) unsigned NOT NULL,
  `method_code` varchar(32) NOT NULL,
  `reference_id` varchar(32) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime default NULL,
  `store_id` smallint(5) unsigned default NULL,
  `agreement_label` varchar(255) default NULL,
  PRIMARY KEY  (`agreement_id`),
  KEY `IDX_CUSTOMER` (`customer_id`),
  KEY `FK_BILLING_AGREEMENT_STORE` (`store_id`),
  CONSTRAINT `FK_BILLING_AGREEMENT_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_BILLING_AGREEMENT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_billing_agreement_order`
--

DROP TABLE IF EXISTS `sales_billing_agreement_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_billing_agreement_order` (
  `agreement_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `UNQ_BILLING_AGREEMENT_ORDER` (`agreement_id`,`order_id`),
  KEY `FK_BILLING_AGREEMENT_ORDER_ORDER` (`order_id`),
  CONSTRAINT `FK_BILLING_AGREEMENT_ORDER_ORDER` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_BILLING_AGREEMENT_ORDER_AGREEMENT` FOREIGN KEY (`agreement_id`) REFERENCES `sales_billing_agreement` (`agreement_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_creditmemo`
--

DROP TABLE IF EXISTS `sales_flat_creditmemo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_creditmemo` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned default NULL,
  `adjustment_positive` decimal(12,4) default NULL,
  `base_shipping_tax_amount` decimal(12,4) default NULL,
  `store_to_order_rate` decimal(12,4) default NULL,
  `base_discount_amount` decimal(12,4) default NULL,
  `base_to_order_rate` decimal(12,4) default NULL,
  `grand_total` decimal(12,4) default NULL,
  `base_adjustment_negative` decimal(12,4) default NULL,
  `base_subtotal_incl_tax` decimal(12,4) default NULL,
  `shipping_amount` decimal(12,4) default NULL,
  `subtotal_incl_tax` decimal(12,4) default NULL,
  `adjustment_negative` decimal(12,4) default NULL,
  `base_shipping_amount` decimal(12,4) default NULL,
  `store_to_base_rate` decimal(12,4) default NULL,
  `base_to_global_rate` decimal(12,4) default NULL,
  `base_adjustment` decimal(12,4) default NULL,
  `base_subtotal` decimal(12,4) default NULL,
  `discount_amount` decimal(12,4) default NULL,
  `subtotal` decimal(12,4) default NULL,
  `adjustment` decimal(12,4) default NULL,
  `base_grand_total` decimal(12,4) default NULL,
  `base_adjustment_positive` decimal(12,4) default NULL,
  `base_tax_amount` decimal(12,4) default NULL,
  `shipping_tax_amount` decimal(12,4) default NULL,
  `tax_amount` decimal(12,4) default NULL,
  `order_id` int(10) unsigned NOT NULL,
  `email_sent` tinyint(1) unsigned default NULL,
  `creditmemo_status` int(10) default NULL,
  `state` int(10) default NULL,
  `shipping_address_id` int(10) default NULL,
  `billing_address_id` int(10) default NULL,
  `invoice_id` int(10) default NULL,
  `cybersource_token` varchar(255) default NULL,
  `store_currency_code` char(3) default NULL,
  `order_currency_code` char(3) default NULL,
  `base_currency_code` char(3) default NULL,
  `global_currency_code` char(3) default NULL,
  `transaction_id` varchar(255) default NULL,
  `increment_id` varchar(50) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `base_customer_balance_amount` decimal(12,4) default NULL,
  `base_customer_balance_total_refunded` decimal(12,4) default NULL,
  `base_gift_cards_amount` decimal(12,4) default NULL,
  `customer_balance_amount` decimal(12,4) default NULL,
  `customer_balance_total_refunded` decimal(12,4) default NULL,
  `gift_cards_amount` decimal(12,4) default NULL,
  `hidden_tax_amount` decimal(12,4) default NULL,
  `base_hidden_tax_amount` decimal(12,4) default NULL,
  `shipping_hidden_tax_amount` decimal(12,4) default NULL,
  `base_shipping_hidden_tax_amount` decimal(12,4) default NULL,
  `shipping_incl_tax` decimal(12,4) default NULL,
  `base_shipping_incl_tax` decimal(12,4) default NULL,
  `gw_base_price` decimal(12,4) default NULL,
  `gw_price` decimal(12,4) default NULL,
  `gw_items_base_price` decimal(12,4) default NULL,
  `gw_items_price` decimal(12,4) default NULL,
  `gw_printed_card_base_price` decimal(12,4) default NULL,
  `gw_printed_card_price` decimal(12,4) default NULL,
  `gw_base_tax_amount` decimal(12,4) default NULL,
  `gw_tax_amount` decimal(12,4) default NULL,
  `gw_items_base_tax_amount` decimal(12,4) default NULL,
  `gw_items_tax_amount` decimal(12,4) default NULL,
  `gw_printed_card_base_tax_amount` decimal(12,4) default NULL,
  `gw_printed_card_tax_amount` decimal(12,4) default NULL,
  `base_reward_currency_amount` decimal(12,4) default NULL,
  `reward_currency_amount` decimal(12,4) default NULL,
  `reward_points_balance` int(10) unsigned default NULL,
  `reward_points_balance_to_refund` int(10) unsigned default NULL,
  PRIMARY KEY  (`entity_id`),
  UNIQUE KEY `UNQ_INCREMENT_ID` (`increment_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `IDX_STATE` (`state`),
  KEY `IDX_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_PARENT` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_creditmemo_comment`
--

DROP TABLE IF EXISTS `sales_flat_creditmemo_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_creditmemo_comment` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL,
  `is_customer_notified` int(10) default NULL,
  `is_visible_on_front` tinyint(1) unsigned NOT NULL default '0',
  `comment` text,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_COMMENT_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_creditmemo_grid`
--

DROP TABLE IF EXISTS `sales_flat_creditmemo_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_creditmemo_grid` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned default NULL,
  `store_to_order_rate` decimal(12,4) default NULL,
  `base_to_order_rate` decimal(12,4) default NULL,
  `grand_total` decimal(12,4) default NULL,
  `store_to_base_rate` decimal(12,4) default NULL,
  `base_to_global_rate` decimal(12,4) default NULL,
  `base_grand_total` decimal(12,4) default NULL,
  `order_id` int(10) unsigned NOT NULL,
  `creditmemo_status` int(10) default NULL,
  `state` int(10) default NULL,
  `invoice_id` int(10) default NULL,
  `store_currency_code` char(3) default NULL,
  `order_currency_code` char(3) default NULL,
  `base_currency_code` char(3) default NULL,
  `global_currency_code` char(3) default NULL,
  `increment_id` varchar(50) default NULL,
  `order_increment_id` varchar(50) default NULL,
  `created_at` datetime default NULL,
  `order_created_at` datetime default NULL,
  `billing_name` varchar(255) default NULL,
  PRIMARY KEY  (`entity_id`),
  UNIQUE KEY `UNQ_INCREMENT_ID` (`increment_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `IDX_STATE` (`state`),
  KEY `IDX_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_BILLING_NAME` (`billing_name`),
  CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_GRID_PARENT` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_GRID_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_creditmemo_item`
--

DROP TABLE IF EXISTS `sales_flat_creditmemo_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_creditmemo_item` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL,
  `weee_tax_applied_row_amount` decimal(12,4) default NULL,
  `base_price` decimal(12,4) default NULL,
  `base_weee_tax_row_disposition` decimal(12,4) default NULL,
  `tax_amount` decimal(12,4) default NULL,
  `base_weee_tax_applied_amount` decimal(12,4) default NULL,
  `weee_tax_row_disposition` decimal(12,4) default NULL,
  `base_row_total` decimal(12,4) default NULL,
  `discount_amount` decimal(12,4) default NULL,
  `row_total` decimal(12,4) default NULL,
  `weee_tax_applied_amount` decimal(12,4) default NULL,
  `base_discount_amount` decimal(12,4) default NULL,
  `base_weee_tax_disposition` decimal(12,4) default NULL,
  `price_incl_tax` decimal(12,4) default NULL,
  `base_tax_amount` decimal(12,4) default NULL,
  `weee_tax_disposition` decimal(12,4) default NULL,
  `base_price_incl_tax` decimal(12,4) default NULL,
  `qty` decimal(12,4) default NULL,
  `base_cost` decimal(12,4) default NULL,
  `base_weee_tax_applied_row_amount` decimal(12,4) default NULL,
  `price` decimal(12,4) default NULL,
  `base_row_total_incl_tax` decimal(12,4) default NULL,
  `row_total_incl_tax` decimal(12,4) default NULL,
  `product_id` int(10) default NULL,
  `order_item_id` int(10) default NULL,
  `additional_data` text,
  `description` text,
  `weee_tax_applied` text,
  `sku` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `hidden_tax_amount` decimal(12,4) default NULL,
  `base_hidden_tax_amount` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_ITEM_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_invoice`
--

DROP TABLE IF EXISTS `sales_flat_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_invoice` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned default NULL,
  `base_grand_total` decimal(12,4) default NULL,
  `shipping_tax_amount` decimal(12,4) default NULL,
  `tax_amount` decimal(12,4) default NULL,
  `base_tax_amount` decimal(12,4) default NULL,
  `store_to_order_rate` decimal(12,4) default NULL,
  `base_shipping_tax_amount` decimal(12,4) default NULL,
  `base_discount_amount` decimal(12,4) default NULL,
  `base_to_order_rate` decimal(12,4) default NULL,
  `grand_total` decimal(12,4) default NULL,
  `shipping_amount` decimal(12,4) default NULL,
  `subtotal_incl_tax` decimal(12,4) default NULL,
  `base_subtotal_incl_tax` decimal(12,4) default NULL,
  `store_to_base_rate` decimal(12,4) default NULL,
  `base_shipping_amount` decimal(12,4) default NULL,
  `total_qty` decimal(12,4) default NULL,
  `base_to_global_rate` decimal(12,4) default NULL,
  `subtotal` decimal(12,4) default NULL,
  `base_subtotal` decimal(12,4) default NULL,
  `discount_amount` decimal(12,4) default NULL,
  `billing_address_id` int(10) default NULL,
  `is_used_for_refund` tinyint(1) unsigned default NULL,
  `order_id` int(10) unsigned NOT NULL,
  `email_sent` tinyint(1) unsigned default NULL,
  `can_void_flag` tinyint(1) unsigned default NULL,
  `state` int(10) default NULL,
  `shipping_address_id` int(10) default NULL,
  `cybersource_token` varchar(255) default NULL,
  `store_currency_code` char(3) default NULL,
  `transaction_id` varchar(255) default NULL,
  `order_currency_code` char(3) default NULL,
  `base_currency_code` char(3) default NULL,
  `global_currency_code` char(3) default NULL,
  `increment_id` varchar(50) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `base_customer_balance_amount` decimal(12,4) default NULL,
  `base_gift_cards_amount` decimal(12,4) default NULL,
  `customer_balance_amount` decimal(12,4) default NULL,
  `gift_cards_amount` decimal(12,4) default NULL,
  `hidden_tax_amount` decimal(12,4) default NULL,
  `base_hidden_tax_amount` decimal(12,4) default NULL,
  `shipping_hidden_tax_amount` decimal(12,4) default NULL,
  `base_shipping_hidden_tax_amount` decimal(12,4) default NULL,
  `shipping_incl_tax` decimal(12,4) default NULL,
  `base_shipping_incl_tax` decimal(12,4) default NULL,
  `base_total_refunded` decimal(12,4) default NULL,
  `gw_base_price` decimal(12,4) default NULL,
  `gw_price` decimal(12,4) default NULL,
  `gw_items_base_price` decimal(12,4) default NULL,
  `gw_items_price` decimal(12,4) default NULL,
  `gw_printed_card_base_price` decimal(12,4) default NULL,
  `gw_printed_card_price` decimal(12,4) default NULL,
  `gw_base_tax_amount` decimal(12,4) default NULL,
  `gw_tax_amount` decimal(12,4) default NULL,
  `gw_items_base_tax_amount` decimal(12,4) default NULL,
  `gw_items_tax_amount` decimal(12,4) default NULL,
  `gw_printed_card_base_tax_amount` decimal(12,4) default NULL,
  `gw_printed_card_tax_amount` decimal(12,4) default NULL,
  `base_reward_currency_amount` decimal(12,4) default NULL,
  `reward_currency_amount` decimal(12,4) default NULL,
  `reward_points_balance` int(10) unsigned default NULL,
  PRIMARY KEY  (`entity_id`),
  UNIQUE KEY `UNQ_INCREMENT_ID` (`increment_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_STATE` (`state`),
  KEY `IDX_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_SALES_FLAT_INVOICE_PARENT` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_INVOICE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9439 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_invoice_comment`
--

DROP TABLE IF EXISTS `sales_flat_invoice_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_invoice_comment` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL,
  `is_customer_notified` tinyint(1) unsigned default NULL,
  `is_visible_on_front` tinyint(1) unsigned NOT NULL default '0',
  `comment` text,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_INVOICE_COMMENT_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_invoice_grid`
--

DROP TABLE IF EXISTS `sales_flat_invoice_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_invoice_grid` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned default NULL,
  `base_grand_total` decimal(12,4) default NULL,
  `grand_total` decimal(12,4) default NULL,
  `order_id` int(10) unsigned NOT NULL,
  `state` int(10) default NULL,
  `store_currency_code` char(3) default NULL,
  `order_currency_code` char(3) default NULL,
  `base_currency_code` char(3) default NULL,
  `global_currency_code` char(3) default NULL,
  `increment_id` varchar(50) default NULL,
  `order_increment_id` varchar(50) default NULL,
  `created_at` datetime default NULL,
  `order_created_at` datetime default NULL,
  `billing_name` varchar(255) default NULL,
  PRIMARY KEY  (`entity_id`),
  UNIQUE KEY `UNQ_INCREMENT_ID` (`increment_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_STATE` (`state`),
  KEY `IDX_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_BILLING_NAME` (`billing_name`),
  CONSTRAINT `FK_SALES_FLAT_INVOICE_GRID_PARENT` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_INVOICE_GRID_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9439 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_invoice_item`
--

DROP TABLE IF EXISTS `sales_flat_invoice_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_invoice_item` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL,
  `base_price` decimal(12,4) default NULL,
  `base_weee_tax_row_disposition` decimal(12,4) default NULL,
  `weee_tax_applied_row_amount` decimal(12,4) default NULL,
  `base_weee_tax_applied_amount` decimal(12,4) default NULL,
  `tax_amount` decimal(12,4) default NULL,
  `base_row_total` decimal(12,4) default NULL,
  `discount_amount` decimal(12,4) default NULL,
  `row_total` decimal(12,4) default NULL,
  `weee_tax_row_disposition` decimal(12,4) default NULL,
  `base_discount_amount` decimal(12,4) default NULL,
  `base_weee_tax_disposition` decimal(12,4) default NULL,
  `price_incl_tax` decimal(12,4) default NULL,
  `weee_tax_applied_amount` decimal(12,4) default NULL,
  `base_tax_amount` decimal(12,4) default NULL,
  `base_price_incl_tax` decimal(12,4) default NULL,
  `qty` decimal(12,4) default NULL,
  `weee_tax_disposition` decimal(12,4) default NULL,
  `base_cost` decimal(12,4) default NULL,
  `base_weee_tax_applied_row_amount` decimal(12,4) default NULL,
  `price` decimal(12,4) default NULL,
  `base_row_total_incl_tax` decimal(12,4) default NULL,
  `row_total_incl_tax` decimal(12,4) default NULL,
  `product_id` int(10) default NULL,
  `order_item_id` int(10) default NULL,
  `additional_data` text,
  `description` text,
  `weee_tax_applied` text,
  `sku` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `hidden_tax_amount` decimal(12,4) default NULL,
  `base_hidden_tax_amount` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_INVOICE_ITEM_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9440 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_order`
--

DROP TABLE IF EXISTS `sales_flat_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_order` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `state` varchar(32) default NULL,
  `status` varchar(32) default NULL,
  `status_preorder` varchar(50) NOT NULL COMMENT 'Status Preorder',
  `coupon_code` varchar(255) default NULL,
  `protect_code` varchar(255) default NULL,
  `shipping_description` varchar(255) default NULL,
  `is_virtual` tinyint(1) unsigned default NULL,
  `store_id` smallint(5) unsigned default NULL,
  `customer_id` int(10) unsigned default NULL,
  `base_discount_amount` decimal(12,4) default NULL,
  `base_discount_canceled` decimal(12,4) default NULL,
  `base_discount_invoiced` decimal(12,4) default NULL,
  `base_discount_refunded` decimal(12,4) default NULL,
  `base_grand_total` decimal(12,4) default NULL,
  `base_shipping_amount` decimal(12,4) default NULL,
  `base_shipping_canceled` decimal(12,4) default NULL,
  `base_shipping_invoiced` decimal(12,4) default NULL,
  `base_shipping_refunded` decimal(12,4) default NULL,
  `base_shipping_tax_amount` decimal(12,4) default NULL,
  `base_shipping_tax_refunded` decimal(12,4) default NULL,
  `base_subtotal` decimal(12,4) default NULL,
  `base_subtotal_canceled` decimal(12,4) default NULL,
  `base_subtotal_invoiced` decimal(12,4) default NULL,
  `base_subtotal_refunded` decimal(12,4) default NULL,
  `base_tax_amount` decimal(12,4) default NULL,
  `base_tax_canceled` decimal(12,4) default NULL,
  `base_tax_invoiced` decimal(12,4) default NULL,
  `base_tax_refunded` decimal(12,4) default NULL,
  `base_to_global_rate` decimal(12,4) default NULL,
  `base_to_order_rate` decimal(12,4) default NULL,
  `base_total_canceled` decimal(12,4) default NULL,
  `base_total_invoiced` decimal(12,4) default NULL,
  `base_total_invoiced_cost` decimal(12,4) default NULL,
  `base_total_offline_refunded` decimal(12,4) default NULL,
  `base_total_online_refunded` decimal(12,4) default NULL,
  `base_total_paid` decimal(12,4) default NULL,
  `base_total_qty_ordered` decimal(12,4) default NULL,
  `base_total_refunded` decimal(12,4) default NULL,
  `discount_amount` decimal(12,4) default NULL,
  `discount_canceled` decimal(12,4) default NULL,
  `discount_invoiced` decimal(12,4) default NULL,
  `discount_refunded` decimal(12,4) default NULL,
  `grand_total` decimal(12,4) default NULL,
  `shipping_amount` decimal(12,4) default NULL,
  `shipping_canceled` decimal(12,4) default NULL,
  `shipping_invoiced` decimal(12,4) default NULL,
  `shipping_refunded` decimal(12,4) default NULL,
  `shipping_tax_amount` decimal(12,4) default NULL,
  `shipping_tax_refunded` decimal(12,4) default NULL,
  `store_to_base_rate` decimal(12,4) default NULL,
  `store_to_order_rate` decimal(12,4) default NULL,
  `subtotal` decimal(12,4) default NULL,
  `subtotal_canceled` decimal(12,4) default NULL,
  `subtotal_invoiced` decimal(12,4) default NULL,
  `subtotal_refunded` decimal(12,4) default NULL,
  `tax_amount` decimal(12,4) default NULL,
  `tax_canceled` decimal(12,4) default NULL,
  `tax_invoiced` decimal(12,4) default NULL,
  `tax_refunded` decimal(12,4) default NULL,
  `total_canceled` decimal(12,4) default NULL,
  `total_invoiced` decimal(12,4) default NULL,
  `total_offline_refunded` decimal(12,4) default NULL,
  `total_online_refunded` decimal(12,4) default NULL,
  `total_paid` decimal(12,4) default NULL,
  `total_qty_ordered` decimal(12,4) default NULL,
  `total_refunded` decimal(12,4) default NULL,
  `can_ship_partially` tinyint(1) unsigned default NULL,
  `can_ship_partially_item` tinyint(1) unsigned default NULL,
  `customer_is_guest` tinyint(1) unsigned default NULL,
  `customer_note_notify` tinyint(1) unsigned default NULL,
  `billing_address_id` int(10) default NULL,
  `customer_group_id` smallint(5) default NULL,
  `edit_increment` int(10) default NULL,
  `email_sent` tinyint(1) unsigned default NULL,
  `forced_do_shipment_with_invoice` tinyint(1) unsigned default NULL,
  `gift_message_id` int(10) default NULL,
  `payment_authorization_expiration` int(10) default NULL,
  `paypal_ipn_customer_notified` int(10) default NULL,
  `quote_address_id` int(10) default NULL,
  `quote_id` int(10) default NULL,
  `shipping_address_id` int(10) default NULL,
  `adjustment_negative` decimal(12,4) default NULL,
  `adjustment_positive` decimal(12,4) default NULL,
  `base_adjustment_negative` decimal(12,4) default NULL,
  `base_adjustment_positive` decimal(12,4) default NULL,
  `base_shipping_discount_amount` decimal(12,4) default NULL,
  `base_subtotal_incl_tax` decimal(12,4) default NULL,
  `base_total_due` decimal(12,4) default NULL,
  `payment_authorization_amount` decimal(12,4) default NULL,
  `shipping_discount_amount` decimal(12,4) default NULL,
  `subtotal_incl_tax` decimal(12,4) default NULL,
  `total_due` decimal(12,4) default NULL,
  `weight` decimal(12,4) default NULL,
  `customer_dob` datetime default NULL,
  `increment_id` varchar(50) default NULL,
  `applied_rule_ids` varchar(255) default NULL,
  `base_currency_code` char(3) default NULL,
  `customer_email` varchar(255) default NULL,
  `customer_firstname` varchar(255) default NULL,
  `customer_lastname` varchar(255) default NULL,
  `customer_middlename` varchar(255) default NULL,
  `customer_prefix` varchar(255) default NULL,
  `customer_suffix` varchar(255) default NULL,
  `customer_taxvat` varchar(255) default NULL,
  `discount_description` varchar(255) default NULL,
  `ext_customer_id` varchar(255) default NULL,
  `ext_order_id` varchar(255) default NULL,
  `global_currency_code` char(3) default NULL,
  `hold_before_state` varchar(255) default NULL,
  `hold_before_status` varchar(255) default NULL,
  `order_currency_code` varchar(255) default NULL,
  `original_increment_id` varchar(50) default NULL,
  `relation_child_id` varchar(32) default NULL,
  `relation_child_real_id` varchar(32) default NULL,
  `relation_parent_id` varchar(32) default NULL,
  `relation_parent_real_id` varchar(32) default NULL,
  `remote_ip` varchar(255) default NULL,
  `shipping_method` varchar(255) default NULL,
  `store_currency_code` char(3) default NULL,
  `store_name` varchar(255) default NULL,
  `x_forwarded_for` varchar(255) default NULL,
  `customer_note` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `total_item_count` smallint(5) unsigned default '0',
  `customer_gender` int(11) default NULL,
  `recycle_fee_amount` decimal(12,4) default NULL,
  `user_id` varchar(100) default NULL,
  `freight_tax` decimal(12,4) default NULL,
  `base_customer_balance_amount` decimal(12,4) default NULL,
  `base_customer_balance_invoiced` decimal(12,4) default NULL,
  `base_customer_balance_refunded` decimal(12,4) default NULL,
  `base_customer_balance_total_refunded` decimal(12,4) default NULL,
  `base_gift_cards_amount` decimal(12,4) default NULL,
  `base_gift_cards_invoiced` decimal(12,4) default NULL,
  `base_gift_cards_refunded` decimal(12,4) default NULL,
  `ccnumber` text,
  `cc_exp_month` text,
  `cc_exp_year` text,
  `customer_balance_amount` decimal(12,4) default NULL,
  `customer_balance_invoiced` decimal(12,4) default NULL,
  `customer_balance_refunded` decimal(12,4) default NULL,
  `customer_balance_total_refunded` decimal(12,4) default NULL,
  `cvv` text,
  `fraud_score` int(11) default NULL,
  `gift_cards` text,
  `gift_cards_amount` decimal(12,4) default NULL,
  `gift_cards_invoiced` decimal(12,4) default NULL,
  `gift_cards_refunded` decimal(12,4) default NULL,
  `paypal_auth_code` text,
  `paypal_reference_number` text,
  `shipping_signature` text,
  `hidden_tax_amount` decimal(12,4) default NULL,
  `base_hidden_tax_amount` decimal(12,4) default NULL,
  `shipping_hidden_tax_amount` decimal(12,4) default NULL,
  `base_shipping_hidden_tax_amount` decimal(12,4) default NULL,
  `hidden_tax_invoiced` decimal(12,4) default NULL,
  `base_hidden_tax_invoiced` decimal(12,4) default NULL,
  `hidden_tax_refunded` decimal(12,4) default NULL,
  `base_hidden_tax_refunded` decimal(12,4) default NULL,
  `shipping_incl_tax` decimal(12,4) default NULL,
  `base_shipping_incl_tax` decimal(12,4) default NULL,
  `gw_id` int(10) unsigned default NULL,
  `gw_allow_gift_receipt` int(10) unsigned default NULL,
  `gw_add_printed_card` int(10) unsigned default NULL,
  `gw_base_price` decimal(12,4) default NULL,
  `gw_price` decimal(12,4) default NULL,
  `gw_items_base_price` decimal(12,4) default NULL,
  `gw_items_price` decimal(12,4) default NULL,
  `gw_printed_card_base_price` decimal(12,4) default NULL,
  `gw_printed_card_price` decimal(12,4) default NULL,
  `gw_base_tax_amount` decimal(12,4) default NULL,
  `gw_tax_amount` decimal(12,4) default NULL,
  `gw_items_base_tax_amount` decimal(12,4) default NULL,
  `gw_items_tax_amount` decimal(12,4) default NULL,
  `gw_printed_card_base_tax_amount` decimal(12,4) default NULL,
  `gw_printed_card_tax_amount` decimal(12,4) default NULL,
  `gw_base_price_invoiced` decimal(12,4) default NULL,
  `gw_price_invoiced` decimal(12,4) default NULL,
  `gw_items_base_price_invoiced` decimal(12,4) default NULL,
  `gw_items_price_invoiced` decimal(12,4) default NULL,
  `gw_printed_card_base_price_invoiced` decimal(12,4) default NULL,
  `gw_printed_card_price_invoiced` decimal(12,4) default NULL,
  `gw_base_tax_amount_invoiced` decimal(12,4) default NULL,
  `gw_tax_amount_invoiced` decimal(12,4) default NULL,
  `gw_items_base_tax_amount_invoiced` decimal(12,4) default NULL,
  `gw_items_tax_amount_invoiced` decimal(12,4) default NULL,
  `gw_printed_card_base_tax_amount_invoiced` decimal(12,4) default NULL,
  `gw_printed_card_tax_amount_invoiced` decimal(12,4) default NULL,
  `gw_base_price_refunded` decimal(12,4) default NULL,
  `gw_price_refunded` decimal(12,4) default NULL,
  `gw_items_base_price_refunded` decimal(12,4) default NULL,
  `gw_items_price_refunded` decimal(12,4) default NULL,
  `gw_printed_card_base_price_refunded` decimal(12,4) default NULL,
  `gw_printed_card_price_refunded` decimal(12,4) default NULL,
  `gw_base_tax_amount_refunded` decimal(12,4) default NULL,
  `gw_tax_amount_refunded` decimal(12,4) default NULL,
  `gw_items_base_tax_amount_refunded` decimal(12,4) default NULL,
  `gw_items_tax_amount_refunded` decimal(12,4) default NULL,
  `gw_printed_card_base_tax_amount_refunded` decimal(12,4) default NULL,
  `gw_printed_card_tax_amount_refunded` decimal(12,4) default NULL,
  `reward_points_balance` int(10) unsigned default NULL,
  `base_reward_currency_amount` decimal(12,4) default NULL,
  `reward_currency_amount` decimal(12,4) default NULL,
  `base_reward_currency_amount_invoiced` decimal(12,4) default NULL,
  `reward_currency_amount_invoiced` decimal(12,4) default NULL,
  `base_reward_currency_amount_refunded` decimal(12,4) default NULL,
  `reward_currency_amount_refunded` decimal(12,4) default NULL,
  `reward_points_balance_refunded` int(10) unsigned default NULL,
  `reward_points_balance_to_refund` int(10) unsigned default NULL,
  `reward_salesrule_points` int(10) unsigned default NULL,
  `estimated_ship_date` datetime default NULL,
  `onestepcheckout_customercomment` text,
  `onestepcheckout_customerfeedback` text,
  PRIMARY KEY  (`entity_id`),
  UNIQUE KEY `UNQ_INCREMENT_ID` (`increment_id`),
  KEY `IDX_STATUS` (`status`),
  KEY `IDX_STATE` (`state`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_EXT_ORDER_ID` (`ext_order_id`),
  KEY `IDX_UPDATED_AT` (`updated_at`),
  KEY `IDX_QUOTE_ID` (`quote_id`),
  CONSTRAINT `FK_SALES_FLAT_ORDER_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=116895 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_order_address`
--

DROP TABLE IF EXISTS `sales_flat_order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_order_address` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned default NULL,
  `customer_address_id` int(10) default NULL,
  `quote_address_id` int(10) default NULL,
  `region_id` int(10) default NULL,
  `customer_id` int(10) default NULL,
  `fax` varchar(255) default NULL,
  `region` varchar(255) default NULL,
  `postcode` varchar(255) default NULL,
  `lastname` varchar(255) default NULL,
  `street` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `telephone` varchar(255) default NULL,
  `country_id` char(2) default NULL,
  `firstname` varchar(255) default NULL,
  `address_type` varchar(255) default NULL,
  `prefix` varchar(255) default NULL,
  `middlename` varchar(255) default NULL,
  `suffix` varchar(255) default NULL,
  `company` varchar(255) default NULL,
  `giftregistry_item_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_ORDER_ADDRESS_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=961061 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_order_grid`
--

DROP TABLE IF EXISTS `sales_flat_order_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_order_grid` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `status` varchar(32) default NULL,
  `status_preorder` varchar(50) NOT NULL COMMENT 'Status Preorder',
  `store_id` smallint(5) unsigned default NULL,
  `store_name` varchar(255) default NULL,
  `customer_id` int(10) unsigned default NULL,
  `base_grand_total` decimal(12,4) default NULL,
  `base_total_paid` decimal(12,4) default NULL,
  `grand_total` decimal(12,4) default NULL,
  `total_paid` decimal(12,4) default NULL,
  `increment_id` varchar(50) default NULL,
  `base_currency_code` char(3) default NULL,
  `order_currency_code` varchar(255) default NULL,
  `shipping_name` varchar(255) default NULL,
  `billing_name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`entity_id`),
  UNIQUE KEY `UNQ_INCREMENT_ID` (`increment_id`),
  KEY `IDX_STATUS` (`status`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `IDX_BASE_TOTAL_PAID` (`base_total_paid`),
  KEY `IDX_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_TOTAL_PAID` (`total_paid`),
  KEY `IDX_SHIPPING_NAME` (`shipping_name`),
  KEY `IDX_BILLING_NAME` (`billing_name`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_UPDATED_AT` (`updated_at`),
  CONSTRAINT `FK_SALES_FLAT_ORDER_GRID_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_ORDER_GRID_PARENT` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_ORDER_GRID_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=116895 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_order_item`
--

DROP TABLE IF EXISTS `sales_flat_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_order_item` (
  `item_id` int(10) unsigned NOT NULL auto_increment,
  `order_id` int(10) unsigned NOT NULL default '0',
  `parent_item_id` int(10) unsigned default NULL,
  `quote_item_id` int(10) unsigned default NULL,
  `store_id` smallint(5) unsigned default NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `product_id` int(10) unsigned default NULL,
  `product_type` varchar(255) default NULL,
  `product_options` text,
  `weight` decimal(12,4) default '0.0000',
  `is_virtual` tinyint(1) unsigned default NULL,
  `sku` varchar(255) NOT NULL default '',
  `name` varchar(255) default NULL,
  `description` text,
  `applied_rule_ids` text,
  `additional_data` text,
  `free_shipping` tinyint(1) unsigned NOT NULL default '0',
  `is_qty_decimal` tinyint(1) unsigned default NULL,
  `no_discount` tinyint(1) unsigned default '0',
  `qty_backordered` decimal(12,4) default '0.0000',
  `qty_canceled` decimal(12,4) default '0.0000',
  `qty_invoiced` decimal(12,4) default '0.0000',
  `qty_ordered` decimal(12,4) default '0.0000',
  `qty_refunded` decimal(12,4) default '0.0000',
  `qty_shipped` decimal(12,4) default '0.0000',
  `base_cost` decimal(12,4) default '0.0000',
  `price` decimal(12,4) NOT NULL default '0.0000',
  `base_price` decimal(12,4) NOT NULL default '0.0000',
  `original_price` decimal(12,4) default NULL,
  `base_original_price` decimal(12,4) default NULL,
  `tax_percent` decimal(12,4) default '0.0000',
  `tax_amount` decimal(12,4) default '0.0000',
  `base_tax_amount` decimal(12,4) default '0.0000',
  `tax_invoiced` decimal(12,4) default '0.0000',
  `base_tax_invoiced` decimal(12,4) default '0.0000',
  `discount_percent` decimal(12,4) default '0.0000',
  `discount_amount` decimal(12,4) default '0.0000',
  `base_discount_amount` decimal(12,4) default '0.0000',
  `discount_invoiced` decimal(12,4) default '0.0000',
  `base_discount_invoiced` decimal(12,4) default '0.0000',
  `amount_refunded` decimal(12,4) default '0.0000',
  `base_amount_refunded` decimal(12,4) default '0.0000',
  `row_total` decimal(12,4) NOT NULL default '0.0000',
  `base_row_total` decimal(12,4) NOT NULL default '0.0000',
  `row_invoiced` decimal(12,4) NOT NULL default '0.0000',
  `base_row_invoiced` decimal(12,4) NOT NULL default '0.0000',
  `row_weight` decimal(12,4) default '0.0000',
  `gift_message_id` int(10) default NULL,
  `gift_message_available` int(10) default NULL,
  `base_tax_before_discount` decimal(12,4) default NULL,
  `tax_before_discount` decimal(12,4) default NULL,
  `ext_order_item_id` varchar(255) default NULL,
  `locked_do_invoice` int(10) unsigned default NULL,
  `locked_do_ship` int(10) unsigned default NULL,
  `weee_tax_applied` text,
  `weee_tax_applied_amount` decimal(12,4) default NULL,
  `weee_tax_applied_row_amount` decimal(12,4) default NULL,
  `base_weee_tax_applied_amount` decimal(12,4) default NULL,
  `base_weee_tax_applied_row_amount` decimal(12,4) default NULL,
  `weee_tax_disposition` decimal(12,4) default NULL,
  `weee_tax_row_disposition` decimal(12,4) default NULL,
  `base_weee_tax_disposition` decimal(12,4) default NULL,
  `base_weee_tax_row_disposition` decimal(12,4) default NULL,
  `event_id` int(10) unsigned default NULL,
  `pre_order` tinyint(1) unsigned default '0',
  `hidden_tax_amount` decimal(12,4) default NULL,
  `base_hidden_tax_amount` decimal(12,4) default NULL,
  `hidden_tax_invoiced` decimal(12,4) default NULL,
  `base_hidden_tax_invoiced` decimal(12,4) default NULL,
  `hidden_tax_refunded` decimal(12,4) default NULL,
  `base_hidden_tax_refunded` decimal(12,4) default NULL,
  `is_nominal` int(11) NOT NULL default '0',
  `tax_canceled` decimal(12,4) default NULL,
  `hidden_tax_canceled` decimal(12,4) default NULL,
  `tax_refunded` decimal(12,4) default NULL,
  `price_incl_tax` decimal(12,4) default NULL,
  `base_price_incl_tax` decimal(12,4) default NULL,
  `row_total_incl_tax` decimal(12,4) default NULL,
  `base_row_total_incl_tax` decimal(12,4) default NULL,
  `giftregistry_item_id` int(10) unsigned default NULL,
  `gw_id` int(10) unsigned default NULL,
  `gw_base_price` decimal(12,4) default NULL,
  `gw_price` decimal(12,4) default NULL,
  `gw_base_tax_amount` decimal(12,4) default NULL,
  `gw_tax_amount` decimal(12,4) default NULL,
  `gw_base_price_invoiced` decimal(12,4) default NULL,
  `gw_price_invoiced` decimal(12,4) default NULL,
  `gw_base_tax_amount_invoiced` decimal(12,4) default NULL,
  `gw_tax_amount_invoiced` decimal(12,4) default NULL,
  `gw_base_price_refunded` decimal(12,4) default NULL,
  `gw_price_refunded` decimal(12,4) default NULL,
  `gw_base_tax_amount_refunded` decimal(12,4) default NULL,
  `gw_tax_amount_refunded` decimal(12,4) default NULL,
  PRIMARY KEY  (`item_id`),
  KEY `IDX_ORDER` (`order_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_SALES_FLAT_ORDER_ITEM_PARENT` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_ORDER_ITEM_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121647 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_order_payment`
--

DROP TABLE IF EXISTS `sales_flat_order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_order_payment` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL,
  `base_shipping_captured` decimal(12,4) default NULL,
  `shipping_captured` decimal(12,4) default NULL,
  `amount_refunded` decimal(12,4) default NULL,
  `base_amount_paid` decimal(12,4) default NULL,
  `amount_canceled` decimal(12,4) default NULL,
  `base_amount_authorized` decimal(12,4) default NULL,
  `base_amount_paid_online` decimal(12,4) default NULL,
  `base_amount_refunded_online` decimal(12,4) default NULL,
  `base_shipping_amount` decimal(12,4) default NULL,
  `shipping_amount` decimal(12,4) default NULL,
  `amount_paid` decimal(12,4) default NULL,
  `amount_authorized` decimal(12,4) default NULL,
  `base_amount_ordered` decimal(12,4) default NULL,
  `base_shipping_refunded` decimal(12,4) default NULL,
  `shipping_refunded` decimal(12,4) default NULL,
  `base_amount_refunded` decimal(12,4) default NULL,
  `amount_ordered` decimal(12,4) default NULL,
  `base_amount_canceled` decimal(12,4) default NULL,
  `ideal_transaction_checked` tinyint(1) unsigned default NULL,
  `quote_payment_id` int(10) default NULL,
  `additional_data` text,
  `cc_exp_month` varchar(255) default NULL,
  `cc_ss_start_year` varchar(255) default NULL,
  `echeck_bank_name` varchar(255) default NULL,
  `method` varchar(255) default NULL,
  `cc_debug_request_body` varchar(255) default NULL,
  `cc_secure_verify` varchar(255) default NULL,
  `cybersource_token` varchar(255) default NULL,
  `ideal_issuer_title` varchar(255) default NULL,
  `protection_eligibility` varchar(255) default NULL,
  `cc_approval` varchar(255) default NULL,
  `cc_last4` varchar(255) default NULL,
  `cc_status_description` varchar(255) default NULL,
  `echeck_type` varchar(255) default NULL,
  `paybox_question_number` varchar(255) default NULL,
  `cc_debug_response_serialized` varchar(255) default NULL,
  `cc_ss_start_month` varchar(255) default NULL,
  `echeck_account_type` varchar(255) default NULL,
  `last_trans_id` varchar(255) default NULL,
  `cc_cid_status` varchar(255) default NULL,
  `cc_owner` varchar(255) default NULL,
  `cc_type` varchar(255) default NULL,
  `ideal_issuer_id` varchar(255) default NULL,
  `po_number` varchar(255) default NULL,
  `cc_exp_year` varchar(255) default NULL,
  `cc_status` varchar(255) default NULL,
  `echeck_routing_number` varchar(255) default NULL,
  `account_status` varchar(255) default NULL,
  `anet_trans_method` varchar(255) default NULL,
  `cc_debug_response_body` varchar(255) default NULL,
  `cc_ss_issue` varchar(255) default NULL,
  `echeck_account_name` varchar(255) default NULL,
  `cc_avs_status` varchar(255) default NULL,
  `cc_number_enc` varchar(255) default NULL,
  `cc_trans_id` varchar(255) default NULL,
  `flo2cash_account_id` varchar(255) default NULL,
  `paybox_request_number` varchar(255) default NULL,
  `address_status` varchar(255) default NULL,
  `additional_information` text,
  `maxmind_response` text,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_ORDER_PAYMENT_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=940177 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_order_status_history`
--

DROP TABLE IF EXISTS `sales_flat_order_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_order_status_history` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL,
  `is_customer_notified` int(10) default NULL,
  `is_visible_on_front` tinyint(1) unsigned NOT NULL default '0',
  `comment` text,
  `status` varchar(32) default NULL,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_SALES_FLAT_ORDER_STATUS_HISTORY_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=960299 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_quote`
--

DROP TABLE IF EXISTS `sales_flat_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `converted_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned default '1',
  `is_virtual` tinyint(1) unsigned default '0',
  `is_multi_shipping` tinyint(1) unsigned default '0',
  `items_count` int(10) unsigned default '0',
  `items_qty` decimal(12,4) default '0.0000',
  `orig_order_id` int(10) unsigned default '0',
  `store_to_base_rate` decimal(12,4) default '0.0000',
  `store_to_quote_rate` decimal(12,4) default '0.0000',
  `base_currency_code` varchar(255) default NULL,
  `store_currency_code` varchar(255) default NULL,
  `quote_currency_code` varchar(255) default NULL,
  `grand_total` decimal(12,4) default '0.0000',
  `base_grand_total` decimal(12,4) default '0.0000',
  `checkout_method` varchar(255) default NULL,
  `customer_id` int(10) unsigned default '0',
  `customer_tax_class_id` int(10) unsigned default '0',
  `customer_group_id` int(10) unsigned default '0',
  `customer_email` varchar(255) default NULL,
  `customer_prefix` varchar(40) default NULL,
  `customer_firstname` varchar(255) default NULL,
  `customer_middlename` varchar(40) default NULL,
  `customer_lastname` varchar(255) default NULL,
  `customer_suffix` varchar(40) default NULL,
  `customer_dob` datetime default NULL,
  `customer_note` varchar(255) default NULL,
  `customer_note_notify` tinyint(1) unsigned default '1',
  `customer_is_guest` tinyint(1) unsigned default '0',
  `remote_ip` varchar(32) default NULL,
  `applied_rule_ids` varchar(255) default NULL,
  `reserved_order_id` varchar(64) default '',
  `password_hash` varchar(255) default NULL,
  `coupon_code` varchar(255) default NULL,
  `global_currency_code` varchar(255) default NULL,
  `base_to_global_rate` decimal(12,4) default NULL,
  `base_to_quote_rate` decimal(12,4) default NULL,
  `customer_taxvat` varchar(255) default NULL,
  `subtotal` decimal(12,4) default NULL,
  `base_subtotal` decimal(12,4) default NULL,
  `subtotal_with_discount` decimal(12,4) default NULL,
  `base_subtotal_with_discount` decimal(12,4) default NULL,
  `is_changed` int(10) unsigned default NULL,
  `trigger_recollect` tinyint(1) NOT NULL default '0',
  `ext_shipping_info` text,
  `gift_message_id` int(10) unsigned default NULL,
  `customer_balance_amount_used` decimal(12,4) default NULL,
  `base_customer_balance_amount_used` decimal(12,4) default NULL,
  `use_customer_balance` int(10) unsigned default NULL,
  `gift_cards` text,
  `gift_cards_amount` decimal(12,4) default NULL,
  `base_gift_cards_amount` decimal(12,4) default NULL,
  `gift_cards_amount_used` decimal(12,4) default NULL,
  `base_gift_cards_amount_used` decimal(12,4) default NULL,
  `recycle_fee_amount` decimal(12,2) NOT NULL default '0.00',
  `customer_gender` int(10) unsigned default NULL,
  `gw_id` int(10) unsigned default NULL,
  `gw_allow_gift_receipt` int(10) unsigned default NULL,
  `gw_add_printed_card` int(10) unsigned default NULL,
  `gw_base_price` decimal(12,4) default NULL,
  `gw_price` decimal(12,4) default NULL,
  `gw_items_base_price` decimal(12,4) default NULL,
  `gw_items_price` decimal(12,4) default NULL,
  `gw_printed_card_base_price` decimal(12,4) default NULL,
  `gw_printed_card_price` decimal(12,4) default NULL,
  `gw_base_tax_amount` decimal(12,4) default NULL,
  `gw_tax_amount` decimal(12,4) default NULL,
  `gw_items_base_tax_amount` decimal(12,4) default NULL,
  `gw_items_tax_amount` decimal(12,4) default NULL,
  `gw_printed_card_base_tax_amount` decimal(12,4) default NULL,
  `gw_printed_card_tax_amount` decimal(12,4) default NULL,
  `use_reward_points` int(10) unsigned default NULL,
  `reward_points_balance` int(10) unsigned default NULL,
  `base_reward_currency_amount` decimal(12,4) default NULL,
  `reward_currency_amount` decimal(12,4) default NULL,
  `shipping_signature` varchar(15) default NULL,
  `estimated_ship_date` datetime default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `FK_SALES_QUOTE_STORE` (`store_id`),
  KEY `IDX_CUSTOMER` (`customer_id`,`store_id`,`is_active`),
  KEY `IDX_IS_ACTIVE` (`is_active`),
  CONSTRAINT `FK_SALES_QUOTE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=724751 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_quote_address`
--

DROP TABLE IF EXISTS `sales_flat_quote_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote_address` (
  `address_id` int(10) unsigned NOT NULL auto_increment,
  `quote_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `customer_id` int(10) unsigned default NULL,
  `save_in_address_book` tinyint(1) default '0',
  `customer_address_id` int(10) unsigned default NULL,
  `address_type` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `prefix` varchar(40) default NULL,
  `firstname` varchar(255) default NULL,
  `middlename` varchar(40) default NULL,
  `lastname` varchar(255) default NULL,
  `suffix` varchar(40) default NULL,
  `company` varchar(255) default NULL,
  `street` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `region` varchar(255) default NULL,
  `region_id` int(10) unsigned default NULL,
  `postcode` varchar(255) default NULL,
  `country_id` varchar(255) default NULL,
  `telephone` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `same_as_billing` tinyint(1) unsigned NOT NULL default '0',
  `free_shipping` tinyint(1) unsigned NOT NULL default '0',
  `collect_shipping_rates` tinyint(1) unsigned NOT NULL default '0',
  `shipping_method` varchar(255) NOT NULL default '',
  `shipping_description` varchar(255) NOT NULL default '',
  `weight` decimal(12,4) NOT NULL default '0.0000',
  `subtotal` decimal(12,4) NOT NULL default '0.0000',
  `base_subtotal` decimal(12,4) NOT NULL default '0.0000',
  `subtotal_with_discount` decimal(12,4) NOT NULL default '0.0000',
  `base_subtotal_with_discount` decimal(12,4) NOT NULL default '0.0000',
  `tax_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_tax_amount` decimal(12,4) NOT NULL default '0.0000',
  `shipping_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_shipping_amount` decimal(12,4) NOT NULL default '0.0000',
  `shipping_tax_amount` decimal(12,4) default NULL,
  `base_shipping_tax_amount` decimal(12,4) default NULL,
  `discount_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL default '0.0000',
  `grand_total` decimal(12,4) NOT NULL default '0.0000',
  `base_grand_total` decimal(12,4) NOT NULL default '0.0000',
  `customer_notes` text,
  `applied_taxes` text,
  `gift_message_id` int(10) unsigned default NULL,
  `base_customer_balance_amount` decimal(12,4) default NULL,
  `customer_balance_amount` decimal(12,4) default NULL,
  `gift_cards_amount` decimal(12,4) default NULL,
  `base_gift_cards_amount` decimal(12,4) default NULL,
  `gift_cards` text,
  `used_gift_cards` text,
  `hidden_tax_amount` decimal(12,4) default NULL,
  `base_hidden_tax_amount` decimal(12,4) default NULL,
  `shipping_hidden_tax_amount` decimal(12,4) default NULL,
  `base_shipping_hidden_tax_amount` decimal(12,4) default NULL,
  `shipping_incl_tax` decimal(12,4) default NULL,
  `base_shipping_incl_tax` decimal(12,4) default NULL,
  `discount_description` varchar(255) default NULL,
  `shipping_discount_amount` decimal(12,4) default NULL,
  `base_shipping_discount_amount` decimal(12,4) default NULL,
  `subtotal_incl_tax` decimal(12,4) default NULL,
  `base_subtotal_total_incl_tax` decimal(12,4) default NULL,
  `giftregistry_item_id` int(10) unsigned default NULL,
  `gw_id` int(10) unsigned default NULL,
  `gw_allow_gift_receipt` int(10) unsigned default NULL,
  `gw_add_printed_card` int(10) unsigned default NULL,
  `gw_base_price` decimal(12,4) default NULL,
  `gw_price` decimal(12,4) default NULL,
  `gw_items_base_price` decimal(12,4) default NULL,
  `gw_items_price` decimal(12,4) default NULL,
  `gw_printed_card_base_price` decimal(12,4) default NULL,
  `gw_printed_card_price` decimal(12,4) default NULL,
  `gw_base_tax_amount` decimal(12,4) default NULL,
  `gw_tax_amount` decimal(12,4) default NULL,
  `gw_items_base_tax_amount` decimal(12,4) default NULL,
  `gw_items_tax_amount` decimal(12,4) default NULL,
  `gw_printed_card_base_tax_amount` decimal(12,4) default NULL,
  `gw_printed_card_tax_amount` decimal(12,4) default NULL,
  `reward_points_balance` int(10) unsigned default NULL,
  `base_reward_currency_amount` decimal(12,4) default NULL,
  `reward_currency_amount` decimal(12,4) default NULL,
  PRIMARY KEY  (`address_id`),
  KEY `FK_SALES_QUOTE_ADDRESS_SALES_QUOTE` (`quote_id`),
  CONSTRAINT `FK_SALES_QUOTE_ADDRESS_SALES_QUOTE` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2325651 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_quote_address_item`
--

DROP TABLE IF EXISTS `sales_flat_quote_address_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote_address_item` (
  `address_item_id` int(10) unsigned NOT NULL auto_increment,
  `parent_item_id` int(10) unsigned default NULL,
  `quote_address_id` int(10) unsigned NOT NULL default '0',
  `quote_item_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `applied_rule_ids` text,
  `additional_data` text,
  `weight` decimal(12,4) default '0.0000',
  `qty` decimal(12,4) NOT NULL default '0.0000',
  `discount_amount` decimal(12,4) default '0.0000',
  `tax_amount` decimal(12,4) default '0.0000',
  `row_total` decimal(12,4) NOT NULL default '0.0000',
  `base_row_total` decimal(12,4) NOT NULL default '0.0000',
  `row_total_with_discount` decimal(12,4) default '0.0000',
  `base_discount_amount` decimal(12,4) default '0.0000',
  `base_tax_amount` decimal(12,4) default '0.0000',
  `row_weight` decimal(12,4) default '0.0000',
  `product_id` int(10) unsigned default NULL,
  `super_product_id` int(10) unsigned default NULL,
  `parent_product_id` int(10) unsigned default NULL,
  `sku` varchar(255) default NULL,
  `image` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `description` text,
  `free_shipping` int(10) unsigned default NULL,
  `is_qty_decimal` int(10) unsigned default NULL,
  `price` decimal(12,4) default NULL,
  `discount_percent` decimal(12,4) default NULL,
  `no_discount` int(10) unsigned default NULL,
  `tax_percent` decimal(12,4) default NULL,
  `base_price` decimal(12,4) default NULL,
  `gift_message_id` int(10) unsigned default NULL,
  `base_cost` decimal(12,4) default NULL,
  `hidden_tax_amount` decimal(12,4) default NULL,
  `base_hidden_tax_amount` decimal(12,4) default NULL,
  `price_incl_tax` decimal(12,4) default NULL,
  `base_price_incl_tax` decimal(12,4) default NULL,
  `row_total_incl_tax` decimal(12,4) default NULL,
  `base_row_total_incl_tax` decimal(12,4) default NULL,
  `gw_id` int(10) unsigned default NULL,
  `gw_base_price` decimal(12,4) default NULL,
  `gw_price` decimal(12,4) default NULL,
  `gw_base_tax_amount` decimal(12,4) default NULL,
  `gw_tax_amount` decimal(12,4) default NULL,
  PRIMARY KEY  (`address_item_id`),
  KEY `FK_QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS` (`quote_address_id`),
  KEY `FK_SALES_QUOTE_ADDRESS_ITEM_QUOTE_ITEM` (`quote_item_id`),
  KEY `FK_SALES_FLAT_QUOTE_ADDRESS_ITEM_PARENT` (`parent_item_id`),
  CONSTRAINT `FK_QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS` FOREIGN KEY (`quote_address_id`) REFERENCES `sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_QUOTE_ADDRESS_ITEM_PARENT` FOREIGN KEY (`parent_item_id`) REFERENCES `sales_flat_quote_address_item` (`address_item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_QUOTE_ADDRESS_ITEM_QUOTE_ITEM` FOREIGN KEY (`quote_item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_quote_item`
--

DROP TABLE IF EXISTS `sales_flat_quote_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote_item` (
  `item_id` int(10) unsigned NOT NULL auto_increment,
  `quote_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `product_id` int(10) unsigned default NULL,
  `store_id` smallint(5) unsigned default NULL,
  `parent_item_id` int(10) unsigned default NULL,
  `is_virtual` tinyint(1) unsigned default NULL,
  `sku` varchar(255) NOT NULL default '',
  `name` varchar(255) default NULL,
  `description` text,
  `applied_rule_ids` text,
  `additional_data` text,
  `free_shipping` tinyint(1) unsigned NOT NULL default '0',
  `is_qty_decimal` tinyint(1) unsigned default NULL,
  `no_discount` tinyint(1) unsigned default '0',
  `weight` decimal(12,4) default '0.0000',
  `qty` decimal(12,4) NOT NULL default '0.0000',
  `price` decimal(12,4) NOT NULL default '0.0000',
  `base_price` decimal(12,4) NOT NULL default '0.0000',
  `custom_price` decimal(12,4) default NULL,
  `discount_percent` decimal(12,4) default '0.0000',
  `discount_amount` decimal(12,4) default '0.0000',
  `base_discount_amount` decimal(12,4) default '0.0000',
  `tax_percent` decimal(12,4) default '0.0000',
  `tax_amount` decimal(12,4) default '0.0000',
  `base_tax_amount` decimal(12,4) default '0.0000',
  `row_total` decimal(12,4) NOT NULL default '0.0000',
  `base_row_total` decimal(12,4) NOT NULL default '0.0000',
  `row_total_with_discount` decimal(12,4) default '0.0000',
  `row_weight` decimal(12,4) default '0.0000',
  `product_type` varchar(255) default NULL,
  `base_tax_before_discount` decimal(12,4) default NULL,
  `tax_before_discount` decimal(12,4) default NULL,
  `original_custom_price` decimal(12,4) default NULL,
  `gift_message_id` int(10) unsigned default NULL,
  `weee_tax_applied` text,
  `weee_tax_applied_amount` decimal(12,4) default NULL,
  `weee_tax_applied_row_amount` decimal(12,4) default NULL,
  `base_weee_tax_applied_amount` decimal(12,4) default NULL,
  `base_weee_tax_applied_row_amount` decimal(12,4) default NULL,
  `weee_tax_disposition` decimal(12,4) default NULL,
  `weee_tax_row_disposition` decimal(12,4) default NULL,
  `base_weee_tax_disposition` decimal(12,4) default NULL,
  `base_weee_tax_row_disposition` decimal(12,4) default NULL,
  `event_id` int(10) unsigned default NULL,
  `pre_order` tinyint(1) unsigned default '0',
  `redirect_url` varchar(255) default NULL,
  `base_cost` decimal(12,4) default NULL,
  `hidden_tax_amount` decimal(12,4) default NULL,
  `base_hidden_tax_amount` decimal(12,4) default NULL,
  `price_incl_tax` decimal(12,4) default NULL,
  `base_price_incl_tax` decimal(12,4) default NULL,
  `row_total_incl_tax` decimal(12,4) default NULL,
  `base_row_total_incl_tax` decimal(12,4) default NULL,
  `giftregistry_item_id` int(10) unsigned default NULL,
  `gw_id` int(10) unsigned default NULL,
  `gw_base_price` decimal(12,4) default NULL,
  `gw_price` decimal(12,4) default NULL,
  `gw_base_tax_amount` decimal(12,4) default NULL,
  `gw_tax_amount` decimal(12,4) default NULL,
  PRIMARY KEY  (`item_id`),
  KEY `FK_SALES_QUOTE_ITEM_SALES_QUOTE` (`quote_id`),
  KEY `FK_SALES_FLAT_QUOTE_ITEM_PARENT_ITEM` (`parent_item_id`),
  KEY `FK_SALES_QUOTE_ITEM_CATALOG_PRODUCT_ENTITY` (`product_id`),
  KEY `FK_SALES_QUOTE_ITEM_STORE` (`store_id`),
  CONSTRAINT `FK_SALES_FLAT_QUOTE_ITEM_PARENT_ITEM` FOREIGN KEY (`parent_item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_QUOTE_ITEM_CATALOG_PRODUCT_ENTITY` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_QUOTE_ITEM_SALES_QUOTE` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_QUOTE_ITEM_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=674599 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_quote_item_option`
--

DROP TABLE IF EXISTS `sales_flat_quote_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote_item_option` (
  `option_id` int(10) unsigned NOT NULL auto_increment,
  `item_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`option_id`),
  KEY `FK_SALES_QUOTE_ITEM_OPTION_ITEM_ID` (`item_id`),
  CONSTRAINT `FK_SALES_QUOTE_ITEM_OPTION_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=675355 DEFAULT CHARSET=utf8 COMMENT='Additional options for quote item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_quote_payment`
--

DROP TABLE IF EXISTS `sales_flat_quote_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote_payment` (
  `payment_id` int(10) unsigned NOT NULL auto_increment,
  `quote_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `method` varchar(255) default '',
  `cc_type` varchar(255) default '',
  `cc_number_enc` varchar(255) default '',
  `cc_last4` varchar(255) default '',
  `cc_cid_enc` varchar(255) default '',
  `cc_owner` varchar(255) default '',
  `cc_exp_month` tinyint(2) unsigned default '0',
  `cc_exp_year` smallint(4) unsigned default '0',
  `cc_ss_owner` varchar(255) default '',
  `cc_ss_start_month` tinyint(2) unsigned default '0',
  `cc_ss_start_year` smallint(4) unsigned default '0',
  `cybersource_token` varchar(255) default '',
  `paypal_correlation_id` varchar(255) default '',
  `paypal_payer_id` varchar(255) default '',
  `paypal_payer_status` varchar(255) default '',
  `po_number` varchar(255) default '',
  `additional_data` text,
  `cc_ss_issue` varchar(255) default NULL,
  `ideal_issuer_id` varchar(255) default NULL,
  `ideal_issuer_list` text,
  `additional_information` text,
  PRIMARY KEY  (`payment_id`),
  KEY `FK_SALES_QUOTE_PAYMENT_SALES_QUOTE` (`quote_id`),
  CONSTRAINT `FK_SALES_QUOTE_PAYMENT_SALES_QUOTE` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=343435 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_quote_shipping_rate`
--

DROP TABLE IF EXISTS `sales_flat_quote_shipping_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote_shipping_rate` (
  `rate_id` int(10) unsigned NOT NULL auto_increment,
  `address_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `carrier` varchar(255) default NULL,
  `carrier_title` varchar(255) default NULL,
  `code` varchar(255) default NULL,
  `method` varchar(255) default NULL,
  `method_description` text,
  `price` decimal(12,4) NOT NULL default '0.0000',
  `error_message` text,
  `method_title` text,
  PRIMARY KEY  (`rate_id`),
  KEY `FK_SALES_QUOTE_SHIPPING_RATE_ADDRESS` (`address_id`),
  CONSTRAINT `FK_SALES_QUOTE_SHIPPING_RATE_ADDRESS` FOREIGN KEY (`address_id`) REFERENCES `sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=736817 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_shipment`
--

DROP TABLE IF EXISTS `sales_flat_shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_shipment` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned default NULL,
  `total_weight` decimal(12,4) default NULL,
  `total_qty` decimal(12,4) default NULL,
  `email_sent` tinyint(1) unsigned default NULL,
  `order_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) default NULL,
  `shipping_address_id` int(10) default NULL,
  `billing_address_id` int(10) default NULL,
  `shipment_status` int(10) default NULL,
  `increment_id` varchar(50) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`entity_id`),
  UNIQUE KEY `UNQ_INCREMENT_ID` (`increment_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_TOTAL_QTY` (`total_qty`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_UPDATED_AT` (`updated_at`),
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_PARENT` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=936375 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_shipment_comment`
--

DROP TABLE IF EXISTS `sales_flat_shipment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_shipment_comment` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL,
  `is_customer_notified` int(10) default NULL,
  `is_visible_on_front` tinyint(1) unsigned NOT NULL default '0',
  `comment` text,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_COMMENT_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=936381 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_shipment_grid`
--

DROP TABLE IF EXISTS `sales_flat_shipment_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_shipment_grid` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned default NULL,
  `total_qty` decimal(12,4) default NULL,
  `order_id` int(10) unsigned NOT NULL,
  `shipment_status` int(10) default NULL,
  `increment_id` varchar(50) default NULL,
  `order_increment_id` varchar(50) default NULL,
  `created_at` datetime default NULL,
  `order_created_at` datetime default NULL,
  `shipping_name` varchar(255) default NULL,
  PRIMARY KEY  (`entity_id`),
  UNIQUE KEY `UNQ_INCREMENT_ID` (`increment_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_TOTAL_QTY` (`total_qty`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_SHIPMENT_STATUS` (`shipment_status`),
  KEY `IDX_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_SHIPPING_NAME` (`shipping_name`),
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_GRID_PARENT` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_GRID_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=936375 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_shipment_item`
--

DROP TABLE IF EXISTS `sales_flat_shipment_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_shipment_item` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL,
  `row_total` decimal(12,4) default NULL,
  `price` decimal(12,4) default NULL,
  `weight` decimal(12,4) default NULL,
  `qty` decimal(12,4) default NULL,
  `product_id` int(10) default NULL,
  `order_item_id` int(10) default NULL,
  `additional_data` text,
  `description` text,
  `name` varchar(255) default NULL,
  `sku` varchar(255) default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_ITEM_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=936663 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_flat_shipment_track`
--

DROP TABLE IF EXISTS `sales_flat_shipment_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_shipment_track` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL,
  `weight` decimal(12,4) default NULL,
  `qty` decimal(12,4) default NULL,
  `order_id` int(10) unsigned NOT NULL,
  `number` text,
  `description` text,
  `title` varchar(255) default NULL,
  `carrier_code` varchar(32) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_TRACK_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=933945 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_invoiced_aggregated`
--

DROP TABLE IF EXISTS `sales_invoiced_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_invoiced_aggregated` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL default '',
  `orders_count` int(11) NOT NULL default '0',
  `orders_invoiced` decimal(12,4) NOT NULL default '0.0000',
  `invoiced` decimal(12,4) NOT NULL default '0.0000',
  `invoiced_captured` decimal(12,4) NOT NULL default '0.0000',
  `invoiced_not_captured` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_INVOICED_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_invoiced_aggregated_order`
--

DROP TABLE IF EXISTS `sales_invoiced_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_invoiced_aggregated_order` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL default '',
  `orders_count` int(11) NOT NULL default '0',
  `orders_invoiced` decimal(12,4) NOT NULL default '0.0000',
  `invoiced` decimal(12,4) NOT NULL default '0.0000',
  `invoiced_captured` decimal(12,4) NOT NULL default '0.0000',
  `invoiced_not_captured` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_INVOICED_AGGREGATED_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4843 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_order_aggregated_created`
--

DROP TABLE IF EXISTS `sales_order_aggregated_created`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_aggregated_created` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL default '',
  `orders_count` int(11) NOT NULL default '0',
  `total_qty_ordered` decimal(12,4) NOT NULL default '0.0000',
  `total_qty_invoiced` decimal(12,4) NOT NULL default '0.0000',
  `total_income_amount` decimal(12,4) NOT NULL default '0.0000',
  `total_revenue_amount` decimal(12,4) NOT NULL default '0.0000',
  `total_profit_amount` decimal(12,4) NOT NULL default '0.0000',
  `total_invoiced_amount` decimal(12,4) NOT NULL default '0.0000',
  `total_canceled_amount` decimal(12,4) NOT NULL default '0.0000',
  `total_paid_amount` decimal(12,4) NOT NULL default '0.0000',
  `total_refunded_amount` decimal(12,4) NOT NULL default '0.0000',
  `total_tax_amount` decimal(12,4) NOT NULL default '0.0000',
  `total_tax_amount_actual` decimal(12,4) NOT NULL default '0.0000',
  `total_shipping_amount` decimal(12,4) NOT NULL default '0.0000',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL default '0.0000',
  `total_discount_amount` decimal(12,4) NOT NULL default '0.0000',
  `total_discount_amount_actual` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_ORDER_AGGREGATED_CREATED` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11537 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_order_status`
--

DROP TABLE IF EXISTS `sales_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_status` (
  `status` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  PRIMARY KEY  (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_order_status_label`
--

DROP TABLE IF EXISTS `sales_order_status_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_status_label` (
  `status` varchar(32) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `label` varchar(128) NOT NULL,
  PRIMARY KEY  (`status`,`store_id`),
  KEY `FK_SALES_ORDER_STATUS_LABEL_STORE` (`store_id`),
  CONSTRAINT `FK_SALES_ORDER_STATUS_LABEL_STATUS` FOREIGN KEY (`status`) REFERENCES `sales_order_status` (`status`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_ORDER_STATUS_LABEL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_order_status_state`
--

DROP TABLE IF EXISTS `sales_order_status_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_status_state` (
  `status` varchar(32) NOT NULL,
  `state` varchar(32) NOT NULL,
  `is_default` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`status`,`state`),
  CONSTRAINT `FK_SALES_ORDER_STATUS_STATE_STATUS` FOREIGN KEY (`status`) REFERENCES `sales_order_status` (`status`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_order_tax`
--

DROP TABLE IF EXISTS `sales_order_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_tax` (
  `tax_id` int(10) unsigned NOT NULL auto_increment,
  `order_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `percent` decimal(12,4) NOT NULL,
  `amount` decimal(12,4) NOT NULL,
  `priority` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `base_amount` decimal(12,4) NOT NULL,
  `process` smallint(6) NOT NULL,
  `base_real_amount` decimal(12,4) NOT NULL,
  `hidden` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tax_id`),
  KEY `IDX_ORDER_TAX` (`order_id`,`priority`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=62623 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_payment_transaction`
--

DROP TABLE IF EXISTS `sales_payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned default NULL,
  `order_id` int(10) unsigned NOT NULL default '0',
  `payment_id` int(10) unsigned NOT NULL default '0',
  `txn_id` varchar(100) NOT NULL default '',
  `parent_txn_id` varchar(100) default NULL,
  `txn_type` varchar(15) NOT NULL default '',
  `is_closed` tinyint(1) unsigned NOT NULL default '1',
  `additional_information` blob,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`transaction_id`),
  UNIQUE KEY `UNQ_ORDER_PAYMENT_TXN` (`order_id`,`payment_id`,`txn_id`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  KEY `IDX_PAYMENT_ID` (`payment_id`),
  CONSTRAINT `FK_SALES_PAYMENT_TRANSACTION_ORDER` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_PAYMENT_TRANSACTION_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_payment_transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_PAYMENT_TRANSACTION_PAYMENT` FOREIGN KEY (`payment_id`) REFERENCES `sales_flat_order_payment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17969 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_recurring_profile`
--

DROP TABLE IF EXISTS `sales_recurring_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_recurring_profile` (
  `profile_id` int(10) unsigned NOT NULL auto_increment,
  `state` varchar(20) NOT NULL,
  `customer_id` int(10) unsigned default NULL,
  `store_id` smallint(5) unsigned default NULL,
  `method_code` varchar(32) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime default NULL,
  `reference_id` varchar(32) default NULL,
  `subscriber_name` varchar(150) default NULL,
  `start_datetime` datetime NOT NULL,
  `internal_reference_id` varchar(42) NOT NULL,
  `schedule_description` varchar(255) NOT NULL,
  `suspension_threshold` smallint(6) unsigned default NULL,
  `bill_failed_later` tinyint(1) unsigned NOT NULL default '0',
  `period_unit` varchar(20) NOT NULL,
  `period_frequency` tinyint(3) unsigned default NULL,
  `period_max_cycles` tinyint(3) unsigned default NULL,
  `billing_amount` double(12,4) unsigned NOT NULL default '0.0000',
  `trial_period_unit` varchar(20) default NULL,
  `trial_period_frequency` tinyint(3) unsigned default NULL,
  `trial_period_max_cycles` tinyint(3) unsigned default NULL,
  `trial_billing_amount` double(12,4) unsigned default NULL,
  `currency_code` char(3) NOT NULL,
  `shipping_amount` decimal(12,4) unsigned default NULL,
  `tax_amount` decimal(12,4) unsigned default NULL,
  `init_amount` decimal(12,4) unsigned default NULL,
  `init_may_fail` tinyint(1) unsigned NOT NULL default '0',
  `order_info` text NOT NULL,
  `order_item_info` text NOT NULL,
  `billing_address_info` text NOT NULL,
  `shipping_address_info` text,
  `profile_vendor_info` text,
  `additional_info` text,
  PRIMARY KEY  (`profile_id`),
  UNIQUE KEY `UNQ_INTERNAL_REF_ID` (`internal_reference_id`),
  KEY `IDX_RECURRING_PROFILE_CUSTOMER` (`customer_id`),
  KEY `IDX_RECURRING_PROFILE_STORE` (`store_id`),
  CONSTRAINT `FK_RECURRING_PROFILE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_RECURRING_PROFILE_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_recurring_profile_order`
--

DROP TABLE IF EXISTS `sales_recurring_profile_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_recurring_profile_order` (
  `link_id` int(10) unsigned NOT NULL auto_increment,
  `profile_id` int(10) unsigned NOT NULL default '0',
  `order_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`link_id`),
  UNIQUE KEY `UNQ_PROFILE_ORDER` (`profile_id`,`order_id`),
  KEY `IDX_ORDER` (`order_id`),
  CONSTRAINT `FK_RECURRING_PROFILE_ORDER_ORDER` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RECURRING_PROFILE_ORDER_PROFILE` FOREIGN KEY (`profile_id`) REFERENCES `sales_recurring_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_refunded_aggregated`
--

DROP TABLE IF EXISTS `sales_refunded_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_refunded_aggregated` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL default '',
  `orders_count` int(11) NOT NULL default '0',
  `refunded` decimal(12,4) NOT NULL default '0.0000',
  `online_refunded` decimal(12,4) NOT NULL default '0.0000',
  `offline_refunded` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_REFUNDED_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_refunded_aggregated_order`
--

DROP TABLE IF EXISTS `sales_refunded_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_refunded_aggregated_order` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL default '',
  `orders_count` int(11) NOT NULL default '0',
  `refunded` decimal(12,4) NOT NULL default '0.0000',
  `online_refunded` decimal(12,4) NOT NULL default '0.0000',
  `offline_refunded` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_REFUNDED_AGGREGATED_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_shipping_aggregated`
--

DROP TABLE IF EXISTS `sales_shipping_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_shipping_aggregated` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL default '',
  `shipping_description` varchar(255) NOT NULL default '',
  `orders_count` int(11) NOT NULL default '0',
  `total_shipping` decimal(12,4) NOT NULL default '0.0000',
  `total_shipping_actual` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_SHIPPING_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_shipping_aggregated_order`
--

DROP TABLE IF EXISTS `sales_shipping_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_shipping_aggregated_order` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `order_status` varchar(50) NOT NULL default '',
  `shipping_description` varchar(255) NOT NULL default '',
  `orders_count` int(11) NOT NULL default '0',
  `total_shipping` decimal(12,4) NOT NULL default '0.0000',
  `total_shipping_actual` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_SHIPPING_AGGREGATED_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9161 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salesrule`
--

DROP TABLE IF EXISTS `salesrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule` (
  `rule_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `from_date` date default '0000-00-00',
  `to_date` date default '0000-00-00',
  `uses_per_customer` int(11) NOT NULL default '0',
  `customer_group_ids` text,
  `is_active` tinyint(1) NOT NULL default '0',
  `conditions_serialized` mediumtext NOT NULL,
  `actions_serialized` mediumtext NOT NULL,
  `stop_rules_processing` tinyint(1) NOT NULL default '1',
  `is_advanced` tinyint(3) unsigned NOT NULL default '1',
  `product_ids` text,
  `sort_order` int(10) unsigned NOT NULL default '0',
  `simple_action` varchar(32) NOT NULL default '',
  `discount_amount` decimal(12,4) NOT NULL default '0.0000',
  `discount_qty` decimal(12,4) unsigned default NULL,
  `discount_step` int(10) unsigned NOT NULL,
  `simple_free_shipping` tinyint(1) unsigned NOT NULL default '0',
  `apply_to_shipping` tinyint(1) unsigned NOT NULL default '0',
  `times_used` int(11) unsigned NOT NULL default '0',
  `is_rss` tinyint(4) NOT NULL default '0',
  `website_ids` text,
  `coupon_type` smallint(5) unsigned NOT NULL default '1',
  PRIMARY KEY  (`rule_id`),
  KEY `sort_order` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1949 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salesrule_coupon`
--

DROP TABLE IF EXISTS `salesrule_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_coupon` (
  `coupon_id` int(10) unsigned NOT NULL auto_increment,
  `rule_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `usage_limit` int(10) unsigned default NULL,
  `usage_per_customer` int(10) unsigned default NULL,
  `times_used` int(10) unsigned NOT NULL default '0',
  `expiration_date` datetime default NULL,
  `is_primary` tinyint(1) unsigned default NULL,
  PRIMARY KEY  (`coupon_id`),
  UNIQUE KEY `UNQ_COUPON_CODE` (`code`),
  UNIQUE KEY `UNQ_RULE_MAIN_COUPON` (`rule_id`,`is_primary`),
  KEY `FK_SALESRULE_COUPON_RULE_ID_SALESRULE` (`rule_id`),
  CONSTRAINT `FK_SALESRULE_COUPON_RULE_ID_SALESRULE` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2997 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salesrule_coupon_usage`
--

DROP TABLE IF EXISTS `salesrule_coupon_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_coupon_usage` (
  `coupon_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `times_used` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`coupon_id`,`customer_id`),
  KEY `FK_SALESRULE_COUPON_CUSTOMER_COUPON_ID_CUSTOMER_ENTITY` (`coupon_id`),
  KEY `FK_SALESRULE_COUPON_CUSTOMER_CUSTOMER_ID_CUSTOMER_ENTITY` (`customer_id`),
  CONSTRAINT `FK_SALESRULE_CPN_CUST_CUST_ID_CUST_ENTITY` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALESRULE_CPN_CUST_CPN_ID_CUST_ENTITY` FOREIGN KEY (`coupon_id`) REFERENCES `salesrule_coupon` (`coupon_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salesrule_customer`
--

DROP TABLE IF EXISTS `salesrule_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_customer` (
  `rule_customer_id` int(10) unsigned NOT NULL auto_increment,
  `rule_id` int(10) unsigned NOT NULL default '0',
  `customer_id` int(10) unsigned NOT NULL default '0',
  `times_used` smallint(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`rule_customer_id`),
  KEY `rule_id` (`rule_id`,`customer_id`),
  KEY `customer_id` (`customer_id`,`rule_id`),
  CONSTRAINT `FK_salesrule_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_salesrule_customer_rule` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3747 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salesrule_label`
--

DROP TABLE IF EXISTS `salesrule_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_label` (
  `label_id` int(10) unsigned NOT NULL auto_increment,
  `rule_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `label` varchar(255) default NULL,
  PRIMARY KEY  (`label_id`),
  UNIQUE KEY `UNQ_RULE_STORE` (`rule_id`,`store_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_RULE_ID` (`rule_id`),
  CONSTRAINT `FK_SALESRULE_LABEL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALESRULE_LABEL_RULE` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salesrule_product_attribute`
--

DROP TABLE IF EXISTS `salesrule_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_product_attribute` (
  `rule_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`rule_id`,`website_id`,`customer_group_id`,`attribute_id`),
  KEY `IDX_WEBSITE` (`website_id`),
  KEY `IDX_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  CONSTRAINT `FK_SALESRULE_PRODUCT_ATTRIBUTE_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_SALESRULE_PRODUCT_ATTRIBUTE_CUSTOMER_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_SALESRULE_PRODUCT_ATTRIBUTE_RULE` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sendfriend_log`
--

DROP TABLE IF EXISTS `sendfriend_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sendfriend_log` (
  `log_id` int(10) unsigned NOT NULL auto_increment,
  `ip` bigint(20) NOT NULL default '0',
  `time` int(10) unsigned NOT NULL,
  `website_id` smallint(5) NOT NULL,
  PRIMARY KEY  (`log_id`),
  KEY `IDX_REMOTE_ADDR` (`ip`),
  KEY `IDX_LOG_TIME` (`time`)
) ENGINE=MyISAM AUTO_INCREMENT=25545 DEFAULT CHARSET=utf8 COMMENT='Send to friend function log storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shipping_tablerate`
--

DROP TABLE IF EXISTS `shipping_tablerate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_tablerate` (
  `pk` int(10) unsigned NOT NULL auto_increment,
  `website_id` int(11) NOT NULL default '0',
  `dest_country_id` varchar(4) NOT NULL default '0',
  `dest_region_id` int(10) NOT NULL default '0',
  `dest_zip` varchar(10) NOT NULL default '',
  `condition_name` varchar(20) NOT NULL default '',
  `condition_value` decimal(12,4) NOT NULL default '0.0000',
  `price` decimal(12,4) NOT NULL default '0.0000',
  `cost` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`pk`),
  UNIQUE KEY `dest_country` (`website_id`,`dest_country_id`,`dest_region_id`,`dest_zip`,`condition_name`,`condition_value`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitemap`
--

DROP TABLE IF EXISTS `sitemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitemap` (
  `sitemap_id` int(11) NOT NULL auto_increment,
  `sitemap_type` varchar(32) default NULL,
  `sitemap_filename` varchar(32) default NULL,
  `sitemap_path` tinytext,
  `sitemap_time` timestamp NULL default NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`sitemap_id`),
  KEY `FK_SITEMAP_STORE` (`store_id`),
  CONSTRAINT `FK_SITEMAP_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `strikeiron_tax_rate`
--

DROP TABLE IF EXISTS `strikeiron_tax_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strikeiron_tax_rate` (
  `tax_rate_id` tinyint(4) NOT NULL auto_increment,
  `tax_country_id` varchar(6) default NULL,
  `tax_region_id` mediumint(9) unsigned default NULL,
  `tax_postcode` varchar(12) default NULL,
  `rate_value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`tax_rate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Strikeiron tax rates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tag_id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `status` smallint(6) NOT NULL default '0',
  `first_customer_id` int(10) unsigned NOT NULL default '0',
  `first_store_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tag_properties`
--

DROP TABLE IF EXISTS `tag_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_properties` (
  `tag_id` int(11) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `base_popularity` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tag_id`,`store_id`),
  KEY `FK_TAG_PROPERTIES_STORE` (`store_id`),
  CONSTRAINT `FK_TAG_PROPERTIES_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAG_PROPERTIES_TAG` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tag_relation`
--

DROP TABLE IF EXISTS `tag_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_relation` (
  `tag_relation_id` int(11) unsigned NOT NULL auto_increment,
  `tag_id` int(11) unsigned NOT NULL default '0',
  `customer_id` int(10) unsigned default NULL,
  `product_id` int(11) unsigned NOT NULL default '0',
  `store_id` smallint(6) unsigned NOT NULL default '1',
  `active` tinyint(1) unsigned NOT NULL default '1',
  `created_at` datetime default NULL,
  PRIMARY KEY  (`tag_relation_id`),
  UNIQUE KEY `UNQ_TAG_CUSTOMER_PRODUCT_STORE` (`tag_id`,`customer_id`,`product_id`,`store_id`),
  KEY `IDX_PRODUCT` (`product_id`),
  KEY `IDX_TAG` (`tag_id`),
  KEY `IDX_CUSTOMER` (`customer_id`),
  KEY `IDX_STORE` (`store_id`),
  CONSTRAINT `FK_TAG_RELATION_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAG_RELATION_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAG_RELATION_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAG_RELATION_TAG` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tag_summary`
--

DROP TABLE IF EXISTS `tag_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_summary` (
  `tag_id` int(11) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `customers` int(11) unsigned NOT NULL default '0',
  `products` int(11) unsigned NOT NULL default '0',
  `uses` int(11) unsigned NOT NULL default '0' COMMENT 'deprecated since 1.4.0.1',
  `historical_uses` int(11) unsigned NOT NULL default '0' COMMENT 'deprecated since 1.4.0.1',
  `popularity` int(11) unsigned NOT NULL default '0',
  `base_popularity` int(11) unsigned NOT NULL default '0' COMMENT 'deprecated since 1.4.0.1',
  PRIMARY KEY  (`tag_id`,`store_id`),
  KEY `FK_TAG_SUMMARY_STORE` (`store_id`),
  KEY `IDX_TAG` (`tag_id`),
  CONSTRAINT `FK_TAG_SUMMARY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAG_SUMMARY_TAG` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tax_calculation`
--

DROP TABLE IF EXISTS `tax_calculation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_calculation` (
  `tax_calculation_rate_id` int(11) NOT NULL,
  `tax_calculation_rule_id` int(11) NOT NULL,
  `customer_tax_class_id` smallint(6) NOT NULL,
  `product_tax_class_id` smallint(6) NOT NULL,
  KEY `FK_TAX_CALCULATION_RULE` (`tax_calculation_rule_id`),
  KEY `FK_TAX_CALCULATION_RATE` (`tax_calculation_rate_id`),
  KEY `FK_TAX_CALCULATION_CTC` (`customer_tax_class_id`),
  KEY `FK_TAX_CALCULATION_PTC` (`product_tax_class_id`),
  KEY `IDX_TAX_CALCULATION` (`tax_calculation_rate_id`,`customer_tax_class_id`,`product_tax_class_id`),
  CONSTRAINT `FK_TAX_CALCULATION_CTC` FOREIGN KEY (`customer_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAX_CALCULATION_PTC` FOREIGN KEY (`product_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAX_CALCULATION_RATE` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAX_CALCULATION_RULE` FOREIGN KEY (`tax_calculation_rule_id`) REFERENCES `tax_calculation_rule` (`tax_calculation_rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tax_calculation_rate`
--

DROP TABLE IF EXISTS `tax_calculation_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_calculation_rate` (
  `tax_calculation_rate_id` int(11) NOT NULL auto_increment,
  `tax_country_id` char(2) NOT NULL,
  `tax_region_id` mediumint(9) NOT NULL,
  `tax_postcode` varchar(21) NOT NULL,
  `code` varchar(255) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `zip_is_range` tinyint(1) default NULL,
  `zip_from` int(11) unsigned default NULL,
  `zip_to` int(11) unsigned default NULL,
  PRIMARY KEY  (`tax_calculation_rate_id`),
  KEY `IDX_TAX_CALCULATION_RATE` (`tax_country_id`,`tax_region_id`,`tax_postcode`),
  KEY `IDX_TAX_CALCULATION_RATE_CODE` (`code`),
  KEY `IDX_TAX_CALCULATION_RATE_RANGE` (`tax_calculation_rate_id`,`tax_country_id`,`tax_region_id`,`zip_is_range`,`tax_postcode`)
) ENGINE=InnoDB AUTO_INCREMENT=38166 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tax_calculation_rate_title`
--

DROP TABLE IF EXISTS `tax_calculation_rate_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_calculation_rate_title` (
  `tax_calculation_rate_title_id` int(11) NOT NULL auto_increment,
  `tax_calculation_rate_id` int(11) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`tax_calculation_rate_title_id`),
  KEY `IDX_TAX_CALCULATION_RATE_TITLE` (`tax_calculation_rate_id`,`store_id`),
  KEY `FK_TAX_CALCULATION_RATE_TITLE_RATE` (`tax_calculation_rate_id`),
  KEY `FK_TAX_CALCULATION_RATE_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_TAX_CALCULATION_RATE_TITLE_RATE` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAX_CALCULATION_RATE_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tax_calculation_rule`
--

DROP TABLE IF EXISTS `tax_calculation_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_calculation_rule` (
  `tax_calculation_rule_id` int(11) NOT NULL auto_increment,
  `code` varchar(255) NOT NULL,
  `priority` mediumint(9) NOT NULL,
  `position` mediumint(9) NOT NULL,
  PRIMARY KEY  (`tax_calculation_rule_id`),
  KEY `IDX_TAX_CALCULATION_RULE` (`priority`,`position`,`tax_calculation_rule_id`),
  KEY `IDX_TAX_CALCULATION_RULE_CODE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tax_class`
--

DROP TABLE IF EXISTS `tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_class` (
  `class_id` smallint(6) NOT NULL auto_increment,
  `class_name` varchar(255) NOT NULL default '',
  `class_type` enum('CUSTOMER','PRODUCT') NOT NULL default 'CUSTOMER',
  PRIMARY KEY  (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tax_order_aggregated_created`
--

DROP TABLE IF EXISTS `tax_order_aggregated_created`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_order_aggregated_created` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `period` date NOT NULL default '0000-00-00',
  `store_id` smallint(5) unsigned default NULL,
  `code` varchar(255) NOT NULL default '',
  `order_status` varchar(50) NOT NULL default '',
  `percent` float(12,4) NOT NULL default '0.0000',
  `orders_count` int(11) unsigned NOT NULL default '0',
  `tax_base_amount_sum` float(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_CODE_ORDER_STATUS` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_TAX_ORDER_AGGREGATED_CREATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103009 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vizio`
--

DROP TABLE IF EXISTS `vizio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vizio` (
  `vizio_id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `amount` decimal(12,2) NOT NULL default '0.00',
  `status` smallint(6) NOT NULL default '0',
  `created_at` datetime default NULL,
  `update_at` datetime default NULL,
  PRIMARY KEY  (`vizio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vizio_review`
--

DROP TABLE IF EXISTS `vizio_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vizio_review` (
  `review_id` bigint(20) unsigned NOT NULL auto_increment,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `entity_id` smallint(5) unsigned NOT NULL default '0',
  `entity_pk_value` int(10) unsigned NOT NULL default '0',
  `status_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`review_id`),
  KEY `FK_REVIEW_ENTITY` (`entity_id`),
  KEY `FK_REVIEW_STATUS` (`status_id`),
  KEY `FK_REVIEW_PARENT_PRODUCT` (`entity_pk_value`)
) ENGINE=InnoDB AUTO_INCREMENT=22683 DEFAULT CHARSET=utf8 COMMENT='Review base information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vizio_review_detail`
--

DROP TABLE IF EXISTS `vizio_review_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vizio_review_detail` (
  `detail_id` bigint(20) unsigned NOT NULL auto_increment,
  `review_id` bigint(20) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned default '0',
  `title` varchar(255) NOT NULL default '',
  `detail` text NOT NULL,
  `nickname` varchar(128) NOT NULL default '',
  `first_name` varchar(50) NOT NULL default '',
  `last_name` varchar(50) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `customer_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`detail_id`),
  KEY `FK_REVIEW_DETAIL_REVIEW` (`review_id`),
  KEY `FK_REVIEW_DETAIL_STORE` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22683 DEFAULT CHARSET=utf8 COMMENT='Review detail information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vizio_review_entity`
--

DROP TABLE IF EXISTS `vizio_review_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vizio_review_entity` (
  `entity_id` smallint(5) unsigned NOT NULL auto_increment,
  `entity_code` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vizio_review_entity_summary`
--

DROP TABLE IF EXISTS `vizio_review_entity_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vizio_review_entity_summary` (
  `primary_id` bigint(20) NOT NULL auto_increment,
  `entity_pk_value` bigint(20) NOT NULL default '0',
  `entity_type` tinyint(4) NOT NULL default '0',
  `reviews_count` smallint(6) NOT NULL default '0',
  `rating_summary` tinyint(4) NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`primary_id`),
  KEY `FK_REVIEW_ENTITY_SUMMARY_STORE` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3443 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vizio_review_status`
--

DROP TABLE IF EXISTS `vizio_review_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vizio_review_status` (
  `status_id` tinyint(3) unsigned NOT NULL auto_increment,
  `status_code` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review statuses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vizio_review_store`
--

DROP TABLE IF EXISTS `vizio_review_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vizio_review_store` (
  `review_id` bigint(20) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`review_id`,`store_id`),
  KEY `FK_REVIEW_STORE_STORE` (`store_id`),
  KEY `FK_REVIEW_STORE_REVIEW` (`review_id`),
  CONSTRAINT `vizio_review_store_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `vizio_review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weee_discount`
--

DROP TABLE IF EXISTS `weee_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weee_discount` (
  `entity_id` int(10) unsigned NOT NULL default '0',
  `website_id` smallint(5) unsigned NOT NULL default '0',
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `value` decimal(12,4) NOT NULL default '0.0000',
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_WEBSITE` (`website_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_GROUP` (`customer_group_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weee_tax`
--

DROP TABLE IF EXISTS `weee_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weee_tax` (
  `value_id` int(11) NOT NULL auto_increment,
  `website_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `country` varchar(2) NOT NULL default '',
  `value` decimal(12,4) NOT NULL default '0.0000',
  `state` varchar(255) NOT NULL default '*',
  `attribute_id` smallint(5) unsigned NOT NULL,
  `entity_type_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`value_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_WEBSITE` (`website_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_COUNTRY` (`country`),
  KEY `FK_WEEE_TAX_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_COUNTRY` FOREIGN KEY (`country`) REFERENCES `directory_country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_WEEE_TAX_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget`
--

DROP TABLE IF EXISTS `widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget` (
  `widget_id` int(10) unsigned NOT NULL auto_increment,
  `code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `parameters` text,
  PRIMARY KEY  (`widget_id`),
  KEY `IDX_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Preconfigured Widgets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget_instance`
--

DROP TABLE IF EXISTS `widget_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_instance` (
  `instance_id` int(11) unsigned NOT NULL auto_increment,
  `type` varchar(255) NOT NULL default '',
  `package_theme` varchar(255) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `store_ids` varchar(255) NOT NULL default '0',
  `widget_parameters` text,
  `sort_order` smallint(5) NOT NULL default '0',
  PRIMARY KEY  (`instance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget_instance_page`
--

DROP TABLE IF EXISTS `widget_instance_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_instance_page` (
  `page_id` int(11) unsigned NOT NULL auto_increment,
  `instance_id` int(11) unsigned NOT NULL default '0',
  `group` varchar(25) NOT NULL default '',
  `layout_handle` varchar(255) NOT NULL default '',
  `block_reference` varchar(255) NOT NULL default '',
  `for` varchar(25) NOT NULL default '',
  `entities` text,
  `template` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`page_id`),
  KEY `IDX_WIDGET_WIDGET_INSTANCE_ID` (`instance_id`),
  CONSTRAINT `FK_WIDGET_WIDGET_INSTANCE_ID` FOREIGN KEY (`instance_id`) REFERENCES `widget_instance` (`instance_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget_instance_page_layout`
--

DROP TABLE IF EXISTS `widget_instance_page_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_instance_page_layout` (
  `page_id` int(11) unsigned NOT NULL default '0',
  `layout_update_id` int(10) unsigned NOT NULL default '0',
  UNIQUE KEY `page_id` (`page_id`,`layout_update_id`),
  KEY `IDX_WIDGET_WIDGET_INSTANCE_PAGE_ID` (`page_id`),
  KEY `IDX_WIDGET_WIDGET_INSTANCE_LAYOUT_UPDATE_ID` (`layout_update_id`),
  CONSTRAINT `FK_WIDGET_WIDGET_INSTANCE_LAYOUT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `core_layout_update` (`layout_update_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_WIDGET_WIDGET_INSTANCE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `widget_instance_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist` (
  `wishlist_id` int(10) unsigned NOT NULL auto_increment,
  `customer_id` int(10) unsigned NOT NULL default '0',
  `shared` tinyint(1) unsigned default '0',
  `sharing_code` varchar(32) character set latin1 collate latin1_general_ci NOT NULL default '',
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`wishlist_id`),
  UNIQUE KEY `UNQ_CUSTOMER` (`customer_id`),
  KEY `IDX_IS_SHARED` (`shared`),
  CONSTRAINT `FK_WISHLIST_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10723 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Wishlist main';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wishlist_item`
--

DROP TABLE IF EXISTS `wishlist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist_item` (
  `wishlist_item_id` int(10) unsigned NOT NULL auto_increment,
  `wishlist_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned default NULL,
  `added_at` datetime default NULL,
  `description` text,
  `qty` decimal(12,4) NOT NULL,
  PRIMARY KEY  (`wishlist_item_id`),
  KEY `IDX_WISHLIST` (`wishlist_id`),
  KEY `IDX_PRODUCT` (`product_id`),
  KEY `IDX_STORE` (`store_id`),
  CONSTRAINT `FK_WISHLIST_ITEM_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_WISHLIST_ITEM_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_WISHLIST_ITEM_WISHLIST` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`wishlist_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wishlist_item_option`
--

DROP TABLE IF EXISTS `wishlist_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist_item_option` (
  `option_id` int(10) unsigned NOT NULL auto_increment,
  `wishlist_item_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`option_id`),
  KEY `FK_WISHLIST_ITEM_OPTION_ITEM_ID` (`wishlist_item_id`),
  CONSTRAINT `FK_WISHLIST_ITEM_OPTION_ITEM_ID` FOREIGN KEY (`wishlist_item_id`) REFERENCES `wishlist_item` (`wishlist_item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Additional options for wishlist item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xmlconnect_application`
--

DROP TABLE IF EXISTS `xmlconnect_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xmlconnect_application` (
  `application_id` smallint(5) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `code` varchar(32) NOT NULL,
  `type` varchar(32) NOT NULL,
  `store_id` smallint(5) unsigned default NULL,
  `active_from` date default NULL,
  `active_to` date default NULL,
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `configuration` blob,
  `status` tinyint(1) NOT NULL default '0',
  `browsing_mode` tinyint(1) default '0',
  PRIMARY KEY  (`application_id`),
  UNIQUE KEY `UNQ_XMLCONNECT_APPLICATION_CODE` (`code`),
  KEY `FK_XMLCONNECT_APPLICAION_STORE` (`store_id`),
  CONSTRAINT `FK_XMLCONNECT_APPLICAION_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xmlconnect_history`
--

DROP TABLE IF EXISTS `xmlconnect_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xmlconnect_history` (
  `history_id` int(11) NOT NULL auto_increment,
  `application_id` smallint(5) unsigned NOT NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `store_id` smallint(5) unsigned default NULL,
  `params` blob,
  `title` varchar(200) NOT NULL,
  `activation_key` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY  (`history_id`),
  KEY `FK_XMLCONNECT_HISTORY_APPLICATION` (`application_id`),
  CONSTRAINT `FK_XMLCONNECT_HISTORY_APPLICATION` FOREIGN KEY (`application_id`) REFERENCES `xmlconnect_application` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xmlconnect_notification_template`
--

DROP TABLE IF EXISTS `xmlconnect_notification_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xmlconnect_notification_template` (
  `id` int(11) NOT NULL auto_increment,
  `app_code` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `push_title` varchar(141) NOT NULL,
  `message_title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  KEY `FK_APP_CODE` (`app_code`),
  CONSTRAINT `FK_APP_CODE` FOREIGN KEY (`app_code`) REFERENCES `xmlconnect_application` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xmlconnect_queue`
--

DROP TABLE IF EXISTS `xmlconnect_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xmlconnect_queue` (
  `id` int(11) NOT NULL auto_increment,
  `create_time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `exec_time` timestamp NULL default NULL,
  `template_id` int(11) NOT NULL,
  `push_title` varchar(140) NOT NULL,
  `message_title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(4) NOT NULL default '0',
  `type` varchar(12) NOT NULL,
  `app_code` varchar(32) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_TEMPLATE_ID` (`template_id`),
  CONSTRAINT `FK_TEMPLATE_ID` FOREIGN KEY (`template_id`) REFERENCES `xmlconnect_notification_template` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-07-12 20:52:08
