/*
Navicat MariaDB Data Transfer

Source Server         : MariaDB
Source Server Version : 100210
Source Host           : localhost:3366
Source Database       : blog

Target Server Type    : MariaDB
Target Server Version : 100210
File Encoding         : 65001

Date: 2018-01-29 18:39:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('1', 'ROLE_ADMIN');
INSERT INTO `authority` VALUES ('2', 'ROLE_USER');

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_size` int(11) DEFAULT NULL,
  `content` longtext NOT NULL,
  `create_time` datetime NOT NULL,
  `html_content` longtext NOT NULL,
  `read_size` int(11) DEFAULT NULL,
  `summary` varchar(300) NOT NULL,
  `tags` varchar(100) DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `vote_size` int(11) DEFAULT NULL,
  `catalog_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKefps36p8dyf3t7yjmic1v0jcs` (`catalog_id`),
  KEY `FKpxk2jtysqn41oop7lvxcp6dqq` (`user_id`),
  CONSTRAINT `FKefps36p8dyf3t7yjmic1v0jcs` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`id`),
  CONSTRAINT `FKpxk2jtysqn41oop7lvxcp6dqq` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment` (
  `blog_id` bigint(20) NOT NULL,
  `comment_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_fk711og2oqkoc82slgnfws8t0` (`comment_id`),
  KEY `FKb9cpog8ie2cyapsyyt7gikpbl` (`blog_id`),
  CONSTRAINT `FKb9cpog8ie2cyapsyyt7gikpbl` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`),
  CONSTRAINT `FKc4ysudanwhfrrhytio0272sx9` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------

-- ----------------------------
-- Table structure for blog_vote
-- ----------------------------
DROP TABLE IF EXISTS `blog_vote`;
CREATE TABLE `blog_vote` (
  `blog_id` bigint(20) NOT NULL,
  `vote_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_nmdrm82d80oq7pw0ab20pia23` (`vote_id`),
  KEY `FKaar8kqti49vaol2nw9e42lgxc` (`blog_id`),
  CONSTRAINT `FK4bkj28o189fk8jic0snsjfj2h` FOREIGN KEY (`vote_id`) REFERENCES `vote` (`id`),
  CONSTRAINT `FKaar8kqti49vaol2nw9e42lgxc` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_vote
-- ----------------------------


-- ----------------------------
-- Table structure for catalog
-- ----------------------------
DROP TABLE IF EXISTS `catalog`;
CREATE TABLE `catalog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKk3mprwb52pe5lfv3l2xpmwj8s` (`user_id`),
  CONSTRAINT `FKk3mprwb52pe5lfv3l2xpmwj8s` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catalog
-- ----------------------------


-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) NOT NULL,
  `create_time` datetime NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8kcum44fvpupyw6f5baccx25c` (`user_id`),
  CONSTRAINT `FK8kcum44fvpupyw6f5baccx25c` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(200) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', null, 'b2stry@163.com', '夏浅安', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi', 'admin');
INSERT INTO `user` VALUES ('2', null, 'awesome@shallowan.cn', 'Shallow An', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi', 'shallowan');

-- ----------------------------
-- Table structure for user_authority
-- ----------------------------
DROP TABLE IF EXISTS `user_authority`;
CREATE TABLE `user_authority` (
  `user_id` bigint(20) NOT NULL,
  `authority_id` bigint(20) NOT NULL,
  KEY `FKgvxjs381k6f48d5d2yi11uh89` (`authority_id`),
  KEY `FKpqlsjpkybgos9w2svcri7j8xy` (`user_id`),
  CONSTRAINT `FKgvxjs381k6f48d5d2yi11uh89` FOREIGN KEY (`authority_id`) REFERENCES `authority` (`id`),
  CONSTRAINT `FKpqlsjpkybgos9w2svcri7j8xy` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_authority
-- ----------------------------
INSERT INTO `user_authority` VALUES ('1', '1');
INSERT INTO `user_authority` VALUES ('2', '2');

-- ----------------------------
-- Table structure for vote
-- ----------------------------
DROP TABLE IF EXISTS `vote`;
CREATE TABLE `vote` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcsaksoe2iepaj8birrmithwve` (`user_id`),
  CONSTRAINT `FKcsaksoe2iepaj8birrmithwve` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vote
-- ----------------------------

