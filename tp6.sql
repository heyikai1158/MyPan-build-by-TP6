/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 80028
Source Host           : localhost:3306
Source Database       : tp6

Target Server Type    : MYSQL
Target Server Version : 80028
File Encoding         : 65001

Date: 2022-04-05 12:52:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL COMMENT '用户ID',
  `filename` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名',
  `size` double NOT NULL COMMENT '文件大小',
  `upload_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `link` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '链接',
  `down_count` int DEFAULT NULL COMMENT '下载量',
  PRIMARY KEY (`id`),
  KEY `link_user` (`uid`),
  CONSTRAINT `link_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of file
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `passwd` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '用户类型 0-普通用户/1-管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '1');
INSERT INTO `user` VALUES ('2', 'heyikai', '123456', '0');
