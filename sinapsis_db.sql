/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100121
 Source Schema         : sinapsis_db

 Target Server Type    : MySQL
 Target Server Version : 100121
 File Encoding         : 65001

 Date: 27/02/2021 10:26:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for as_person
-- ----------------------------
DROP TABLE IF EXISTS `as_person`;
CREATE TABLE `as_person`  (
  `pkPerson` int(10) NOT NULL AUTO_INCREMENT,
  `fkTypeDocument` int(10) NOT NULL,
  `fkNationality` int(10) NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `surname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nameComplete` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `document` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `brithDate` date NULL DEFAULT NULL,
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idCulqui` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `statusRegister` tinyint(1) NOT NULL,
  `fkUserRegister` int(10) NOT NULL,
  `dateRegister` datetime(0) NOT NULL,
  `ipRegister` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fkUserUpdate` int(10) NULL DEFAULT NULL,
  `dateUpdate` datetime(0) NULL DEFAULT NULL,
  `ipUpdate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fkUserDelete` int(10) NULL DEFAULT NULL,
  `dateDelete` datetime(0) NULL DEFAULT NULL,
  `ipDelete` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `aboutMe` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pkPerson`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of as_person
-- ----------------------------
INSERT INTO `as_person` VALUES (1, 1, 170, 'WILLIAM', 'CQ', 'CQ, WILLIAM', '48311762', '1993-05-23', 'william.usp@hotmail.com', '951543871', 'M', '3-photo4.png', NULL, NULL, NULL, 1, 0, '2020-05-07 19:12:58', '::ffff:192.168.1.4', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `as_person` VALUES (5, 1, 170, 'HUGO FREDY', 'VIGGIO AVALOS', 'VIGGIO AVALOS, HUGO FREDY', '09354164', NULL, 'hviggioa@gmail.com', '12345678', NULL, NULL, NULL, NULL, NULL, 1, 3, '2020-05-20 16:22:10', '::ffff:192.168.1.40', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `as_person` VALUES (6, 1, 170, 'SANTIAGO LORENZO', 'MUÑOZ COBOS', 'MUÑOZ COBOS, SANTIAGO LORENZO', '08881287', NULL, 'borgonotellezoscar@gmail.com', '995652888', NULL, NULL, NULL, NULL, NULL, 1, 0, '2020-05-22 11:27:04', '::ffff:192.168.1.15', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `as_person` VALUES (7, 1, 170, 'ANGEL DE JESUS', 'RAMOS LEGUA', 'RAMOS LEGUA, ANGEL DE JESUS', '43909894', NULL, 'angelus_rl@hotmail.com', '923018684', NULL, '7-photo.png', NULL, NULL, NULL, 1, 0, '2020-05-22 11:51:20', '::ffff:192.168.1.15', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Procedure structure for as_sp_getPerson
-- ----------------------------
DROP PROCEDURE IF EXISTS `as_sp_getPerson`;
delimiter ;;
CREATE PROCEDURE `as_sp_getPerson`()
BEGIN
	#Routine body goes here...
	
	SELECT pkPerson,
					`name`,
					surname,
					nameComplete,
					document,
					email,
					phone
					
	FROM as_person;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
