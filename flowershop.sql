/*
Navicat MySQL Data Transfer

Source Server         : flowershop
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : flowershop

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2018-07-20 13:19:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bargainflower
-- ----------------------------
DROP TABLE IF EXISTS `bargainflower`;
CREATE TABLE `bargainflower` (
  `BargainId` int(11) NOT NULL,
  `FlowerId` int(11) default NULL,
  `Discount` float default NULL,
  `BargainPrice` float default NULL,
  `Note` varchar(50) default NULL,
  PRIMARY KEY  (`BargainId`),
  KEY `FK_Reference_2` (`FlowerId`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`FlowerId`) REFERENCES `flower` (`FlowerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bargainflower
-- ----------------------------
INSERT INTO `bargainflower` VALUES ('1', '6', '0.5', '55', '大促销');

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `CompanyId` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `PicPath` varchar(50) NOT NULL,
  `Description` varchar(20) NOT NULL,
  PRIMARY KEY  (`CompanyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', '中方瑞通', '北京昌平', 'images/companypic.jpg', '我爱海贼王');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `UId` int(10) NOT NULL auto_increment,
  `Name` varchar(20) character set utf8 collate utf8_bin NOT NULL,
  `Email` varchar(20) character set utf8 collate utf8_bin NOT NULL,
  `Password` varchar(20) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `UserType` int(10) NOT NULL,
  `RegisterDate` date NOT NULL,
  PRIMARY KEY  (`UId`),
  UNIQUE KEY `NameIndex` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', 'luffy', '2567933223@qq.com', 'wang123456', '18811150611', '1', '2018-07-09');
INSERT INTO `customer` VALUES ('2', 'just', '2567933224@qq.com', 'wang123456', '18811150711', '2', '2018-07-08');

-- ----------------------------
-- Table structure for flower
-- ----------------------------
DROP TABLE IF EXISTS `flower`;
CREATE TABLE `flower` (
  `FlowerId` int(11) NOT NULL auto_increment,
  `Name` varchar(20) default NULL,
  `Price` float default NULL,
  `PicPath` varchar(50) default NULL,
  `Description` varchar(50) default NULL,
  `KindId` int(11) default NULL,
  `AvailabilityNum` int(11) default NULL,
  `BargainFlag` int(1) default NULL,
  `StockStatus` int(1) default '0',
  `FlowerStatus` int(1) default '0',
  PRIMARY KEY  (`FlowerId`),
  KEY `FK_Reference_1` (`KindId`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`KindId`) REFERENCES `flowerkind` (`KindId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flower
-- ----------------------------
INSERT INTO `flower` VALUES ('1', 'Ut eu feugiat', '40', 'images/product/01.jpg', 'the Ut eu feugiat', '1', '6', '0', '1', '1');
INSERT INTO `flower` VALUES ('2', 'Donec Est Nisi', '60', 'images/product/02.jpg', 'the Donec Est Nis', '2', '0', '0', '1', '1');
INSERT INTO `flower` VALUES ('3', 'Tristique Vitae', '140', 'images/product/03.jpg', 'the Tristique Vitae', '3', '5', '0', '1', '1');
INSERT INTO `flower` VALUES ('4', 'Hendrerit Eu', '320', 'images/product/04.jpg', 'the Hendrerit Eu', '4', '0', '0', '1', '1');
INSERT INTO `flower` VALUES ('5', 'Tincidunt Nisi', '150', 'images/product/05.jpg', 'the Tincidunt Nisi', '5', '0', '0', '1', '1');
INSERT INTO `flower` VALUES ('6', 'Curabitur et turpis', '110', 'images/product/06.jpg', 'the Curabitur et turpis', '6', '150', '1', '1', '1');
INSERT INTO `flower` VALUES ('7', 'Mauris consectetur', '130', 'images/product/07.jpg', 'the Mauris consectetur', '7', '0', '0', '1', '1');
INSERT INTO `flower` VALUES ('8', 'Proin volutpat', '170', 'images/product/08.jpg', 'the Proin volutpat', '8', '3', '0', '1', '1');

-- ----------------------------
-- Table structure for flowerkind
-- ----------------------------
DROP TABLE IF EXISTS `flowerkind`;
CREATE TABLE `flowerkind` (
  `KindId` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Note` varchar(50) NOT NULL,
  PRIMARY KEY  (`KindId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flowerkind
-- ----------------------------
INSERT INTO `flowerkind` VALUES ('1', '玫瑰', '红，白');
INSERT INTO `flowerkind` VALUES ('2', '康乃馨', '各种品种');
INSERT INTO `flowerkind` VALUES ('3', '百合', '各种品种');
INSERT INTO `flowerkind` VALUES ('4', '满天星', '各种品种');
INSERT INTO `flowerkind` VALUES ('5', '茉莉花', '各种品种');
INSERT INTO `flowerkind` VALUES ('6', '薰衣草', '各种品种');
INSERT INTO `flowerkind` VALUES ('7', '海棠', '各种品种');
INSERT INTO `flowerkind` VALUES ('8', '月季', '各种品种');
INSERT INTO `flowerkind` VALUES ('9', '花篮装饰', '各种品种');

-- ----------------------------
-- Table structure for officeinfo
-- ----------------------------
DROP TABLE IF EXISTS `officeinfo`;
CREATE TABLE `officeinfo` (
  `OfficeId` int(11) NOT NULL auto_increment,
  `Name` varchar(20) NOT NULL,
  `RoomNumber` varchar(10) NOT NULL,
  `ZipCode` varchar(10) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `CompanyId` int(11) NOT NULL,
  PRIMARY KEY  (`OfficeId`),
  KEY `FK_Reference_5` (`CompanyId`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`CompanyId`) REFERENCES `company` (`CompanyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of officeinfo
-- ----------------------------
INSERT INTO `officeinfo` VALUES ('1', '石油大学办公室', '100-451', '402289', '18811150611', '2567933223@qq.com', '1');
INSERT INTO `officeinfo` VALUES ('2', '政法大学办公室', '100-452', '402234', '18811150711', '2567933221@qq.com', '1');

-- ----------------------------
-- Table structure for orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE `orderinfo` (
  `InfoId` int(11) NOT NULL auto_increment,
  `FlowerId` int(11) default NULL,
  `Quantity` int(11) default NULL,
  `FlowerPrice` float default NULL,
  `Total` float default NULL,
  `PayMethod` varchar(10) default NULL,
  `OrderId` int(11) default NULL,
  `FlowerName` varchar(20) default NULL,
  PRIMARY KEY  (`InfoId`),
  KEY `FK_Reference_10` (`FlowerId`),
  KEY `FK_Reference_9` (`OrderId`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`FlowerId`) REFERENCES `flower` (`FlowerId`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`OrderId`) REFERENCES `ordersum` (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderinfo
-- ----------------------------

-- ----------------------------
-- Table structure for ordersum
-- ----------------------------
DROP TABLE IF EXISTS `ordersum`;
CREATE TABLE `ordersum` (
  `OrderId` int(11) NOT NULL auto_increment,
  `UId` int(11) default NULL,
  `Name` varchar(20) default NULL,
  `Address` varchar(20) default NULL,
  `City` varchar(10) default NULL,
  `Country` varchar(10) default NULL,
  `Email` varchar(20) default NULL,
  `PhoneNumber` varchar(20) default NULL,
  `TotalPrice` float default NULL,
  `PayMethodId` int(11) default NULL,
  `DateTime` date default NULL,
  `Timestamp` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`OrderId`),
  KEY `fk1` (`UId`),
  KEY `fk2` (`PayMethodId`),
  CONSTRAINT `fk1` FOREIGN KEY (`UId`) REFERENCES `customer` (`UId`),
  CONSTRAINT `fk2` FOREIGN KEY (`PayMethodId`) REFERENCES `payment` (`PayMethodId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ordersum
-- ----------------------------

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `PayMethodId` int(11) NOT NULL,
  `Name` varchar(20) default NULL,
  `Note` varchar(50) default NULL,
  PRIMARY KEY  (`PayMethodId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES ('1', '支付宝', '支付宝支付');
INSERT INTO `payment` VALUES ('2', '微信', '微信支付');
INSERT INTO `payment` VALUES ('3', '银联', '银联支付');

-- ----------------------------
-- Table structure for qanswer
-- ----------------------------
DROP TABLE IF EXISTS `qanswer`;
CREATE TABLE `qanswer` (
  `QId` int(11) NOT NULL auto_increment,
  `QInfo` varchar(20) NOT NULL,
  `QAnswer` varchar(100) NOT NULL,
  `Note` varchar(50) NOT NULL,
  PRIMARY KEY  (`QId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qanswer
-- ----------------------------
INSERT INTO `qanswer` VALUES ('1', '我怎么知道我的订单是否已经下了？', '我也不知道。', '怎么知道订单已经下了。');
INSERT INTO `qanswer` VALUES ('2', '我的订单什么时候发货？', '我也想知道。', '怎么知道订单什么时候发货。');
INSERT INTO `qanswer` VALUES ('3', '你们接受什么付款方式？', '都可以吧。', '付款方式。');
INSERT INTO `qanswer` VALUES ('4', '如果我不喜欢，可以退货或换货吗？', '原则上不可以。', '退货或换货。');
INSERT INTO `qanswer` VALUES ('5', '我如何知道网上订购是否安全？', '是安全的。', '网上订购是否安全。');
INSERT INTO `qanswer` VALUES ('6', '你的隐私政策是什么？', '尽量保护。', '隐私政策');

-- ----------------------------
-- Table structure for shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart` (
  `ItemId` int(11) NOT NULL auto_increment,
  `FlowerId` int(11) default NULL,
  `Quantity` int(11) default NULL,
  `FlowerPrice` float default NULL,
  `Total` float default NULL,
  `UId` int(11) default NULL,
  PRIMARY KEY  (`ItemId`),
  KEY `FK_Reference_3` (`UId`),
  KEY `FK_Reference_6` (`FlowerId`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`UId`) REFERENCES `customer` (`UId`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`FlowerId`) REFERENCES `flower` (`FlowerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------

-- ----------------------------
-- Table structure for useraccount
-- ----------------------------
DROP TABLE IF EXISTS `useraccount`;
CREATE TABLE `useraccount` (
  `aid` int(11) NOT NULL auto_increment,
  `account` float default NULL,
  `uid` int(11) default NULL,
  PRIMARY KEY  (`aid`),
  KEY `fk` (`uid`),
  CONSTRAINT `fk` FOREIGN KEY (`uid`) REFERENCES `customer` (`UId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of useraccount
-- ----------------------------
INSERT INTO `useraccount` VALUES ('1', '200', '1');
INSERT INTO `useraccount` VALUES ('2', '3050', '2');
DROP TRIGGER IF EXISTS `AutoChangeQuantity-Insert`;
DELIMITER ;;
CREATE TRIGGER `AutoChangeQuantity-Insert` AFTER INSERT ON `shoppingcart` FOR EACH ROW begin
update flower set AvailabilityNum = AvailabilityNum - new.quantity where FlowerId = new.FlowerId; -- 监视更新，既不漏掉旧的，也不漏掉新的，计算差额
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `AutoChangeQuantity-Update`;
DELIMITER ;;
CREATE TRIGGER `AutoChangeQuantity-Update` AFTER UPDATE ON `shoppingcart` FOR EACH ROW begin
update flower set AvailabilityNum = AvailabilityNum + old.quantity - new.quantity where FlowerId = new.FlowerId; -- 监视更新，既不漏掉旧的，也不漏掉新的，计算差额
end
;;
DELIMITER ;
