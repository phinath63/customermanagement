/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : customer

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2017-02-08 09:44:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for td_customer
-- ----------------------------
DROP TABLE IF EXISTS `td_customer`;
CREATE TABLE `td_customer` (
  `cus_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cus_first_name` varchar(255) DEFAULT NULL,
  `cus_last_name` varchar(255) DEFAULT NULL,
  `cus_gender` varchar(255) DEFAULT NULL,
  `cus_email_address` varchar(255) DEFAULT NULL,
  `cus_dob` date DEFAULT NULL,
  `cus_address` varchar(255) DEFAULT NULL,
  `cus_phone_number` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of td_customer
-- ----------------------------
INSERT INTO `td_customer` VALUES ('4', 'SOkeaj', 'Heng', 'Male', 'phinath63@gmail.com', '1991-08-01', 'Phnom Penh', '070361121', '2017-02-07 17:58:07', '2017-02-07 17:58:07');
INSERT INTO `td_customer` VALUES ('5', 'Thay', 'Mardy', 'Female', 'mardy@gmail.com', '1991-08-01', 'Phnom Penh', '012730816', null, null);
INSERT INTO `td_customer` VALUES ('11', 'Chandara', 'Chhun', 'Male', 'chandara@gmail.com', '1991-08-01', 'Phnom Penh', '098262716', null, null);
INSERT INTO `td_customer` VALUES ('12', 'Phinath', 'Heng', 'Male', 'phinath@gmail.com', '1991-08-01', 'Phnom Penh', '098262716', null, null);
INSERT INTO `td_customer` VALUES ('13', 'Phinath', 'Heng', 'Male', 'phinath@gmail.com', '1991-08-01', 'Phnom Penh', '098262716', null, null);
INSERT INTO `td_customer` VALUES ('15', 'Phinath', 'Heng', 'Male', 'phinath@gmail.com', '1991-08-01', 'Phnom Penh', '098262716', null, null);
INSERT INTO `td_customer` VALUES ('16', 'Phinath', 'Heng', 'Male', 'phinath@gmail.com', '1991-08-01', 'Phnom Penh', '098262716', null, null);
INSERT INTO `td_customer` VALUES ('17', 'Phinath', 'Heng', 'Male', 'phinath@gmail.com', '1991-08-01', 'Phnom Penh', '098262716', null, null);
INSERT INTO `td_customer` VALUES ('19', 'Auth', 'Phnath', 'Male', 'da@gmail.com', '2016-11-15', 'Svay Reing', '089362637', '2017-02-06 10:31:24', '2017-02-06 10:31:24');
INSERT INTO `td_customer` VALUES ('20', 'Phearom', 'Phann', 'Male', 'phearom@gmail.com', '1991-02-27', 'Soung', '012987523', null, null);
INSERT INTO `td_customer` VALUES ('21', 'Dara', 'Heng', 'Male', 'phia@mg.com', '2017-02-24', 'Phnom Penh', '09737838377', null, null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin', 'adminPassword');
INSERT INTO `user` VALUES ('user-test', 'userPassword');
SET FOREIGN_KEY_CHECKS=1;
