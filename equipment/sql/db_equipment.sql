/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50516
Source Host           : localhost:3306
Source Database       : db_equipment

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2018-08-21 20:21:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deptName` varchar(20) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES ('1', '工程一部2', '工程一部。22');
INSERT INTO `t_department` VALUES ('2', '工程二部', '工程二部。');
INSERT INTO `t_department` VALUES ('3', '工程三部', '工程三部。');
INSERT INTO `t_department` VALUES ('4', '工程四部', '工程四部');
INSERT INTO `t_department` VALUES ('5', '工程五部', '工程五部');
INSERT INTO `t_department` VALUES ('6', '中建六局', '中建六局');
INSERT INTO `t_department` VALUES ('7', '中建八局', '中建八局，是你爸爸');
INSERT INTO `t_department` VALUES ('8', '中铁一局', '中铁一局');

-- ----------------------------
-- Table structure for t_equipment
-- ----------------------------
DROP TABLE IF EXISTS `t_equipment`;
CREATE TABLE `t_equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `no` varchar(20) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_t_equipment` (`typeId`),
  CONSTRAINT `FK_t_equipment` FOREIGN KEY (`typeId`) REFERENCES `t_equipmenttype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_equipment
-- ----------------------------
INSERT INTO `t_equipment` VALUES ('1', '发电机', '001', '1', '1', '发电机。');
INSERT INTO `t_equipment` VALUES ('2', '电路板', '002', '2', '3', '电路板。');

-- ----------------------------
-- Table structure for t_equipmenttype
-- ----------------------------
DROP TABLE IF EXISTS `t_equipmenttype`;
CREATE TABLE `t_equipmenttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(20) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_equipmenttype
-- ----------------------------
INSERT INTO `t_equipmenttype` VALUES ('1', '强电型', '强电型，小心触电哦，哈哈哈');
INSERT INTO `t_equipmenttype` VALUES ('2', '弱电型', '弱电型，你懂的！');

-- ----------------------------
-- Table structure for t_repair
-- ----------------------------
DROP TABLE IF EXISTS `t_repair`;
CREATE TABLE `t_repair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipmentId` int(11) DEFAULT NULL,
  `userman` varchar(20) DEFAULT NULL,
  `repairman` varchar(20) DEFAULT NULL,
  `repairTime` datetime DEFAULT NULL,
  `finishTime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `finishState` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_repair
-- ----------------------------
INSERT INTO `t_repair` VALUES ('24', '1', 'jack', 'marry', '2015-02-02 16:26:50', '2015-02-02 16:26:59', '1', '2');
INSERT INTO `t_repair` VALUES ('25', '1', 'jack', 'marry', '2015-02-02 16:27:11', '2015-02-02 16:27:18', '1', '2');
INSERT INTO `t_repair` VALUES ('26', '1', 'jack', 'marry', '2015-02-02 16:27:31', '2015-02-02 16:27:35', '2', '2');
INSERT INTO `t_repair` VALUES ('27', '2', 'jack', 'marry', '2015-03-25 08:57:19', '2015-03-31 09:01:08', '2', '2');
INSERT INTO `t_repair` VALUES ('28', '1', 'jack', 'marry', '2015-03-31 09:03:03', '2015-03-31 09:03:37', '1', '2');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `trueName` varchar(20) DEFAULT NULL,
  `roleName` varchar(20) DEFAULT NULL,
  `deptId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_t_user` (`deptId`),
  CONSTRAINT `FK_t_user` FOREIGN KEY (`deptId`) REFERENCES `t_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'zhangyan', '123456', '小张', '管理员', '1');
INSERT INTO `t_user` VALUES ('2', 'Tom', '123', '我是tom', '使用者', '2');
INSERT INTO `t_user` VALUES ('3', 'Cat', '123', '我是cat', '维修者', '3');
INSERT INTO `t_user` VALUES ('4', 'json2', '12322', '姐僧2', '维修者', '3');
INSERT INTO `t_user` VALUES ('5', 'zy', 'zy', 'zy', '管理员', '7');
