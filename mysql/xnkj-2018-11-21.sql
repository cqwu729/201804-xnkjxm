/*
Navicat MySQL Data Transfer

Source Server         : xnkj
Source Server Version : 50553
Source Host           : 39.98.58.74:3306
Source Database       : xnkj

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-11-21 21:35:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `hibernate_sequence`
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES ('144661');

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `random` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', '8C4977D37CBF69DC9AFDA28D660B8971', '8769', 'admin');
INSERT INTO `t_admin` VALUES ('4028887066d4e4db0166d4e5bb6d0001', 'EF81E830C08B73AB8D68DF265B896C15', '6074', 'cdgly');
INSERT INTO `t_admin` VALUES ('2c9a2193670d25430167128510d50008', '5351B4BA7E648D2F0535A2C392DAB9E4', '9715', 'gxkc001');
INSERT INTO `t_admin` VALUES ('2c9a2193672c53f201672c92e4ff0002', 'A54A9E69287C185B22A7AB899E034CAB', '2980', 'gxkc01');
INSERT INTO `t_admin` VALUES ('2c9a219367312c6e016734135cb50000', 'ABCDB0A5AEEAD5ECD66C9F3244BF2F25', '8170', 'test3');

-- ----------------------------
-- Table structure for `t_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_role`;
CREATE TABLE `t_admin_role` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admin_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKo3402higugj7os2awjwmm3qwr` (`admin_id`),
  KEY `FKaoi3te4qg9ghbkyp74no195n8` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_admin_role
-- ----------------------------
INSERT INTO `t_admin_role` VALUES ('4028887066d4ec3c0166d4ecc7070000', '4028887066d4e4db0166d4e5bb6d0001', '4028887066d4e2450166d4e2c0890000');
INSERT INTO `t_admin_role` VALUES ('2c9a2193672c53f201672c8ed0fe0001', '2c9a2193670d25430167128510d50008', '4028887066d4e2450166d4e2c0890000');
INSERT INTO `t_admin_role` VALUES ('2c9a2193672c53f201672c92e4ff0003', '2c9a2193672c53f201672c92e4ff0002', '4028887066d4e2450166d4e2c0890000');
INSERT INTO `t_admin_role` VALUES ('2c9a2193672c53f2016730a2a4a8001c', '2c9a2193672c53f2016730a2a4a8001b', '4028887066d4e2450166d4e2c0890000');
INSERT INTO `t_admin_role` VALUES ('2c9a2193672c53f20167311c5acd0023', '2c9a2193672c53f20167311c5acd0022', '4028887066d4e2450166d4e2c0890000');
INSERT INTO `t_admin_role` VALUES ('40288085673122bd0167312347b40001', '40288085673122bd0167312329d60000', '4028887066d4e2450166d4e2c0890000');

-- ----------------------------
-- Table structure for `t_advertisement`
-- ----------------------------
DROP TABLE IF EXISTS `t_advertisement`;
CREATE TABLE `t_advertisement` (
  `id` int(11) NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_advertisement
-- ----------------------------
INSERT INTO `t_advertisement` VALUES ('24378', 'INDEX', 'http://39.98.58.74:8081/upload/2018-11-13/1542122740156.png', '3', '首页顶部轮播3');
INSERT INTO `t_advertisement` VALUES ('30220', 'INDEX', 'http://39.98.58.74:8081/upload/2018-11-13/1542122754000.jpg', '2', '2');
INSERT INTO `t_advertisement` VALUES ('30221', 'INDEX', 'http://39.98.58.74:8081/upload/2018-11-13/1542122772765.jpg', '3', '3');

-- ----------------------------
-- Table structure for `t_authentication`
-- ----------------------------
DROP TABLE IF EXISTS `t_authentication`;
CREATE TABLE `t_authentication` (
  `id` int(11) NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `authentication_status` int(11) DEFAULT NULL,
  `opposite` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `positive` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_card_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe9k04rjqmcuwex1n3lifik0xy` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_authentication
-- ----------------------------
INSERT INTO `t_authentication` VALUES ('144378', '2018-11-19 08:17:16', '1', 'assets/img/sf2.png', 'assets/img/sf1.png', '2c9a21936727600a016727aa9d000008', '445122198404282216', '王健全');
INSERT INTO `t_authentication` VALUES ('144380', '2018-11-19 13:30:17', '1', 'http://39.98.58.74:8080/upload/2018-11-19/1542634212765.null', 'http://39.98.58.74:8080/upload/2018-11-19/1542634202530.null', '2c9a21936727600a01672763c3db0001', '500233198809175678', '张三丰');
INSERT INTO `t_authentication` VALUES ('144383', '2018-11-19 14:03:25', '1', 'http://39.98.58.74:8080/upload/2018-11-19/1542636189319.null', 'http://39.98.58.74:8080/upload/2018-11-19/1542636182741.null', '2c9a21936727600a01672b033b5f004e', '445222198303102939', '林乐锋');
INSERT INTO `t_authentication` VALUES ('144384', '2018-11-19 15:41:37', '1', 'assets/img/sf2.png', 'http://39.98.58.74:8080/upload/2018-11-19/1542642090663.null', '2c9a21936727600a01672af89339003e', '513521197910300015', '马俊');
INSERT INTO `t_authentication` VALUES ('144387', '2018-11-19 15:51:27', '1', 'http://39.98.58.74:8080/upload/2018-11-19/1542642687366.null', 'http://39.98.58.74:8080/upload/2018-11-19/1542642682241.null', '2c9a21936727600a01672af982aa0040', '513521197910300015', '马俊');
INSERT INTO `t_authentication` VALUES ('144389', '2018-11-19 15:58:43', '1', 'assets/img/sf2.png', 'http://39.98.58.74:8080/upload/2018-11-19/1542643118413.null', '2c9a21936727600a01672afada7a0042', '513521197910300015', '马俊');
INSERT INTO `t_authentication` VALUES ('144453', '2018-11-19 16:10:06', '1', 'http://39.98.58.74:8080/upload/2018-11-20/1542643783694.null', 'http://39.98.58.74:8080/upload/2018-11-20/1542643771350.null', '2c9a21936727600a0167279fccef0004', '220122198908166520', '李丹');
INSERT INTO `t_authentication` VALUES ('144458', '2018-11-20 08:41:41', '1', 'http://39.98.58.74:8080/upload/2018-11-20/1542703298257.null', 'http://39.98.58.74:8080/upload/2018-11-20/1542703285710.null', '2c9a21936727600a016727b5d7e10016', '430481199008120906', '曹交兰');
INSERT INTO `t_authentication` VALUES ('144461', '2018-11-20 10:15:19', '1', 'assets/img/sf2.png', 'http://39.98.58.74:8080/upload/2018-11-20/1542708910679.null', '2c9a21936727600a016727b211920010', '220181198308250032', '钱雷');
INSERT INTO `t_authentication` VALUES ('144466', '2018-11-20 11:18:47', '1', 'http://39.98.58.74:8080/upload/2018-11-20/1542712726116.null', 'http://39.98.58.74:8080/upload/2018-11-20/1542712705804.null', '2c9a2193672c4d9b0167309494fd0019', '430525198910140514', '肖宝');
INSERT INTO `t_authentication` VALUES ('144468', '2018-11-20 11:20:54', '1', 'http://39.98.58.74:8080/upload/2018-11-20/1542712852491.null', 'http://39.98.58.74:8080/upload/2018-11-20/1542712841647.null', '2c9a21936727600a01672b0106dc004a', '430525199801257419', '杨期来');
INSERT INTO `t_authentication` VALUES ('144470', '2018-11-20 11:34:04', '1', 'http://39.98.58.74:8080/upload/2018-11-20/1542713643632.null', 'http://39.98.58.74:8080/upload/2018-11-20/1542713631444.null', '2c9a21936727600a01672afe0eba0046', '430525199801257419', '杨期来');
INSERT INTO `t_authentication` VALUES ('144471', '2018-11-20 11:30:24', '1', 'http://39.98.58.74:8080/upload/2018-11-20/1542713422804.null', 'http://39.98.58.74:8080/upload/2018-11-20/1542713412757.null', '2c9a21936727600a01672aff2e340048', '430525199801257419', '杨期来');
INSERT INTO `t_authentication` VALUES ('144476', '2018-11-20 12:03:33', '1', 'http://39.98.58.74:8080/upload/2018-11-20/1542715412209.null', 'http://39.98.58.74:8080/upload/2018-11-20/1542715394053.null', '2c9a21936727600a01672b0235b7004c', '441323199306294334', '方华贵');
INSERT INTO `t_authentication` VALUES ('144538', '2018-11-20 16:00:37', '1', 'http://39.98.58.74:8080/upload/2018-11-21/1542729636913.null', 'http://39.98.58.74:8080/upload/2018-11-21/1542729628335.null', '2c9a21936727600a016727f1c00f0026', '210802197512022017', '代权');
INSERT INTO `t_authentication` VALUES ('144540', '2018-11-20 16:07:52', '1', 'http://39.98.58.74:8080/upload/2018-11-21/1542730072007.null', 'http://39.98.58.74:8080/upload/2018-11-21/1542730066507.null', '2c9a21936727600a016727fbf538002e', '430702197605105052', '戴德常');
INSERT INTO `t_authentication` VALUES ('144541', '2018-11-20 16:11:27', '1', 'http://39.98.58.74:8080/upload/2018-11-21/1542730285975.null', 'http://39.98.58.74:8080/upload/2018-11-21/1542730275975.null', '2c9a21936727600a01672afcb0140044', '445121197712147314', '尤振鹏');
INSERT INTO `t_authentication` VALUES ('144553', '2018-11-20 17:08:56', '1', 'http://39.98.58.74:8080/upload/2018-11-21/1542733734944.null', 'http://39.98.58.74:8080/upload/2018-11-21/1542733716460.null', '2c9a21936727600a016727bbe793001c', '445221199006151257', '洪百威');
INSERT INTO `t_authentication` VALUES ('144582', '2018-11-21 03:27:07', '1', 'http://39.98.58.74:8080/upload/2018-11-21/1542770822772.null', 'http://39.98.58.74:8080/upload/2018-11-21/1542770772351.null', '2c9a219367316ef401673177f57c0001', '500233198809175255', '张三');
INSERT INTO `t_authentication` VALUES ('144584', '2018-11-21 03:33:15', '1', 'http://39.98.58.74:8080/upload/2018-11-21/1542771193257.null', 'http://39.98.58.74:8080/upload/2018-11-21/1542771186976.null', '2c9a2193672c4d9b0167315f9714003a', '500233198809175434', '张三');
INSERT INTO `t_authentication` VALUES ('144591', '2018-11-21 07:04:03', '1', 'http://39.98.58.74:8080/upload/2018-11-21/1542783826413.null', 'http://39.98.58.74:8080/upload/2018-11-21/1542783812178.null', '2c9a21936727600a016727b32c970012', '330702198303106413', '梁光');
INSERT INTO `t_authentication` VALUES ('144592', '2018-11-21 07:04:36', '1', 'http://39.98.58.74:8080/upload/2018-11-21/1542783875507.null', 'http://39.98.58.74:8080/upload/2018-11-21/1542783863897.null', '2c9a21936727600a016727b460440014', '330326197511054931', '李开镜');
INSERT INTO `t_authentication` VALUES ('144597', '2018-11-21 07:08:08', '1', 'http://39.98.58.74:8080/upload/2018-11-21/1542784063382.null', 'http://39.98.58.74:8080/upload/2018-11-21/1542784048741.null', '2c9a21936727600a016727af77eb000c', '430481199008120906', '曹交兰');
INSERT INTO `t_authentication` VALUES ('144615', '2018-11-21 09:01:25', '1', 'http://39.98.58.74:8080/upload/2018-11-21/1542790882257.null', 'http://39.98.58.74:8080/upload/2018-11-21/1542790876429.null', '2c9a2193672c4d9b0167314facbd0036', '445121198007237511', '林卫华');
INSERT INTO `t_authentication` VALUES ('144644', '2018-11-21 13:10:58', '0', 'http://39.98.58.74:8080/upload/2018-11-21/1542805858460.null', 'http://39.98.58.74:8080/upload/2018-11-21/1542805834366.null', '2c9a2193673654610167365d81420003', '430524198107271180', '郑瑜华');
INSERT INTO `t_authentication` VALUES ('144660', '2018-11-21 13:21:50', '0', 'http://39.98.58.74:8080/upload/2018-11-21/1542806505460.null', 'http://39.98.58.74:8080/upload/2018-11-21/1542806436132.null', '2c9a21936727600a016727a896810006', '445221197910126851', '杨晓丹');

-- ----------------------------
-- Table structure for `t_bank_card`
-- ----------------------------
DROP TABLE IF EXISTS `t_bank_card`;
CREATE TABLE `t_bank_card` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_bank_card
-- ----------------------------
INSERT INTO `t_bank_card` VALUES ('2c9a2193672663ee0167273bf9940000', '1234567811111111111111111', null, '2c9a219366ee5f480166eeb8180c0006', null, null);
INSERT INTO `t_bank_card` VALUES ('2c9a21936727600a01672b0df568004f', '0x990EF5Ab4c420A457e552d12a34390125790986C', null, '2c9a21936727600a016727aa9d000008', null, null);
INSERT INTO `t_bank_card` VALUES ('2c9a2193672c41d201672c4950250000', null, '6228481134785620911', '2c9a21936727600a01672b033b5f004e', '林乐锋', '农业银行');
INSERT INTO `t_bank_card` VALUES ('2c9a2193672c4d9b01672ca8eb9c0001', null, '6217007200056856506', '2c9a21936727600a01672af89339003e', '马俊', '深圳建设银行莲花支行');
INSERT INTO `t_bank_card` VALUES ('2c9a2193672c4d9b01672ca969760002', '0xD96F24260629F3574b26E696b51F848Ad12D7eEe', null, '2c9a21936727600a01672af89339003e', null, null);
INSERT INTO `t_bank_card` VALUES ('2c9a2193672c4d9b01672cc03a960003', '0x2A0c51b51f30af437acfEB083c48693b29782D58', null, '2c9a21936727600a0167279fccef0004', null, null);
INSERT INTO `t_bank_card` VALUES ('2c9a2193672c4d9b01672ccdfa0f0007', null, '6217007200056856506', '2c9a21936727600a01672af982aa0040', '马俊', '深圳建设银行莲花支行');
INSERT INTO `t_bank_card` VALUES ('2c9a2193672c4d9b01672cce4d200008', '0xD96F24260629F3574b26E696b51F848Ad12D7eEe', null, '2c9a21936727600a01672af982aa0040', null, null);
INSERT INTO `t_bank_card` VALUES ('2c9a2193672c4d9b01672cd1bf350009', null, '6217007200056856506', '2c9a21936727600a01672afada7a0042', '马骏', '深圳建设银行莲花支行');
INSERT INTO `t_bank_card` VALUES ('2c9a2193672c4d9b01672cd1fe9f000a', '0xD96F24260629F3574b26E696b51F848Ad12D7eEe', null, '2c9a21936727600a01672afada7a0042', null, null);
INSERT INTO `t_bank_card` VALUES ('2c9a2193672c4d9b01672d5f88b0000c', '0xd55b1e1633B98c40821F10b1b530dea202FC82eE', null, '2c9a21936727600a01672b033b5f004e', null, null);
INSERT INTO `t_bank_card` VALUES ('2c9a2193672c4d9b0167309fb60c001a', '0x0298ed2bb74e4dd0E9d1975265EeE20D0734f691', null, '2c9a21936727600a016727b211920010', null, null);
INSERT INTO `t_bank_card` VALUES ('2c9a2193672c4d9b016730ed06e5002b', null, '6217280832903120161', '2c9a2193672c4d9b0167309494fd0019', '周枚', '农商银行');
INSERT INTO `t_bank_card` VALUES ('2c9a2193672c4d9b016730fffa64002c', '0x7Cd471b1aBa3A7A46c1E0859a69Dc519b47A16F7', null, '2c9a21936727600a01672afe0eba0046', null, null);
INSERT INTO `t_bank_card` VALUES ('2c9a2193672c4d9b01673106a1c3002e', '0x7Cd471b1aBa3A7A46c1E0859a69Dc519b47A16F7', null, '2c9a21936727600a01672aff2e340048', null, null);
INSERT INTO `t_bank_card` VALUES ('2c9a2193672c4d9b01673108ca300030', '0x7Cd471b1aBa3A7A46c1E0859a69Dc519b47A16F7', null, '2c9a21936727600a01672b0106dc004a', null, null);
INSERT INTO `t_bank_card` VALUES ('2c9a2193672c4d9b0167310c501b0032', '0x90a24c30f6af81393731e1C20A2C64D61F934B2a', null, '2c9a21936727600a01672b0235b7004c', null, null);
INSERT INTO `t_bank_card` VALUES ('2c9a219367316ef4016731e6b3560004', '0xc3AAe5136d94c99b7256BFAE906C6a15eB4367ef', null, '2c9a21936727600a016727f1c00f0026', null, null);
INSERT INTO `t_bank_card` VALUES ('2c9a219367316ef4016732ca0b78000d', null, '6212263602014088439', '2c9a21936727600a01672afcb0140044', '尤振鹏', '工商银行');
INSERT INTO `t_bank_card` VALUES ('2c9a219367316ef4016732cabab4000e', '0x781EB7d7B4A45C75944Fe75fCF09A4a972C701C3', null, '2c9a21936727600a01672afcb0140044', null, null);
INSERT INTO `t_bank_card` VALUES ('2c9a219367316ef4016734504cce0012', null, '6214651037245710', '2c9a219367316ef401673177f57c0001', '张三', '重庆农商行');
INSERT INTO `t_bank_card` VALUES ('2c9a219367316ef401673456ba500014', 'dksjdjdnnrndndndnnd233', null, '2c9a2193672c4d9b0167315f9714003a', null, null);
INSERT INTO `t_bank_card` VALUES ('2c9a219367316ef4016734598caa0017', null, '6214651037245718', '2c9a2193672c4d9b0167315f9714003a', '张三', '华夏');
INSERT INTO `t_bank_card` VALUES ('2c9a219367316ef401673514688a001c', '0x6A2FCBdEc5Ac357809c370C93f0ceDdb8c1D1451', null, '2c9a21936727600a016727b5d7e10016', null, null);
INSERT INTO `t_bank_card` VALUES ('2c9a219367316ef401673516a8d5001d', null, '6212263602045260924', '2c9a21936727600a016727b5d7e10016', '曹交兰', '工商银行广州市白云区嘉禾支行');
INSERT INTO `t_bank_card` VALUES ('2c9a219367316ef4016735180614001e', '0x6718A104885717a2140d75ddd8DE0A43739056c2', null, '2c9a21936727600a016727b32c970012', null, null);
INSERT INTO `t_bank_card` VALUES ('2c9a219367316ef4016735195a3a001f', '0xd3694331b9ea19d52bb1e103dc101a1d8f0fb87f', null, '2c9a21936727600a016727b460440014', null, null);
INSERT INTO `t_bank_card` VALUES ('2c9a219367316ef40167358330e40027', '0x969099Abf3095d10FDd39bF00f61BEB3F5A0f5eE', null, '2c9a2193672c4d9b0167314facbd0036', null, null);
INSERT INTO `t_bank_card` VALUES ('2c9a219367316ef40167359e0fdc002a', 'hggffjfgngdfhhtfhj', null, '2c9a21936727600a016727bbe793001c', null, null);

-- ----------------------------
-- Table structure for `t_calculation_force`
-- ----------------------------
DROP TABLE IF EXISTS `t_calculation_force`;
CREATE TABLE `t_calculation_force` (
  `id` int(11) NOT NULL,
  `money` float NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkgj263wrjak4y1017s6saas12` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_calculation_force
-- ----------------------------
INSERT INTO `t_calculation_force` VALUES ('144301', '1188', '2c9a219366ee5f480166eeb8180c0006');
INSERT INTO `t_calculation_force` VALUES ('144302', '0', '2c9a21936727600a01672763c3db0001');
INSERT INTO `t_calculation_force` VALUES ('144417', '1188', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_calculation_force` VALUES ('144418', '0', '2c9a21936727600a016727a896810006');
INSERT INTO `t_calculation_force` VALUES ('144419', '0', '2c9a21936727600a016727aa9d000008');
INSERT INTO `t_calculation_force` VALUES ('144420', '0', '2c9a21936727600a016727ad1f94000a');
INSERT INTO `t_calculation_force` VALUES ('144421', '0', '2c9a21936727600a016727af77eb000c');
INSERT INTO `t_calculation_force` VALUES ('144422', '0', '2c9a21936727600a016727b0a89b000e');
INSERT INTO `t_calculation_force` VALUES ('144423', '0', '2c9a21936727600a016727b211920010');
INSERT INTO `t_calculation_force` VALUES ('144424', '0', '2c9a21936727600a016727b32c970012');
INSERT INTO `t_calculation_force` VALUES ('144425', '0', '2c9a21936727600a016727b460440014');
INSERT INTO `t_calculation_force` VALUES ('144426', '0', '2c9a21936727600a016727b5d7e10016');
INSERT INTO `t_calculation_force` VALUES ('144427', '0', '2c9a21936727600a016727b885da0018');
INSERT INTO `t_calculation_force` VALUES ('144428', '0', '2c9a21936727600a016727ba812d001a');
INSERT INTO `t_calculation_force` VALUES ('144429', '0', '2c9a21936727600a016727bbe793001c');
INSERT INTO `t_calculation_force` VALUES ('144430', '0', '2c9a21936727600a016727bcf5f6001e');
INSERT INTO `t_calculation_force` VALUES ('144431', '0', '2c9a21936727600a016727be323f0020');
INSERT INTO `t_calculation_force` VALUES ('144432', '0', '2c9a21936727600a016727cce2ae0022');
INSERT INTO `t_calculation_force` VALUES ('144433', '0', '2c9a21936727600a016727db1da00024');
INSERT INTO `t_calculation_force` VALUES ('144434', '0', '2c9a21936727600a016727f1c00f0026');
INSERT INTO `t_calculation_force` VALUES ('144435', '0', '2c9a21936727600a016727f7d5110028');
INSERT INTO `t_calculation_force` VALUES ('144436', '0', '2c9a21936727600a016727f87f89002a');
INSERT INTO `t_calculation_force` VALUES ('144437', '0', '2c9a21936727600a016727f9578b002c');
INSERT INTO `t_calculation_force` VALUES ('144438', '0', '2c9a21936727600a016727fbf538002e');
INSERT INTO `t_calculation_force` VALUES ('144439', '0', '2c9a21936727600a016727fea2660032');
INSERT INTO `t_calculation_force` VALUES ('144440', '0', '2c9a21936727600a016728006fb40034');
INSERT INTO `t_calculation_force` VALUES ('144441', '0', '2c9a21936727600a01672a6424df003a');
INSERT INTO `t_calculation_force` VALUES ('144442', '0', '2c9a21936727600a01672af2999f003c');
INSERT INTO `t_calculation_force` VALUES ('144443', '0', '2c9a21936727600a01672af89339003e');
INSERT INTO `t_calculation_force` VALUES ('144444', '0', '2c9a21936727600a01672af982aa0040');
INSERT INTO `t_calculation_force` VALUES ('144445', '0', '2c9a21936727600a01672afada7a0042');
INSERT INTO `t_calculation_force` VALUES ('144446', '0', '2c9a21936727600a01672afcb0140044');
INSERT INTO `t_calculation_force` VALUES ('144447', '0', '2c9a21936727600a01672afe0eba0046');
INSERT INTO `t_calculation_force` VALUES ('144448', '0', '2c9a21936727600a01672aff2e340048');
INSERT INTO `t_calculation_force` VALUES ('144449', '0', '2c9a21936727600a01672b0106dc004a');
INSERT INTO `t_calculation_force` VALUES ('144450', '0', '2c9a21936727600a01672b0235b7004c');
INSERT INTO `t_calculation_force` VALUES ('144451', '0', '2c9a21936727600a01672b033b5f004e');
INSERT INTO `t_calculation_force` VALUES ('144525', '0', '2c9a2193672c4d9b01672f883abf000f');
INSERT INTO `t_calculation_force` VALUES ('144526', '0', '2c9a2193672c4d9b0167309494fd0019');
INSERT INTO `t_calculation_force` VALUES ('144527', '0', '2c9a2193672c4d9b016730bdadcd0021');
INSERT INTO `t_calculation_force` VALUES ('144528', '0', '2c9a2193672c4d9b016730c54c7c0023');
INSERT INTO `t_calculation_force` VALUES ('144529', '0', '2c9a2193672c4d9b016730e9861b0029');
INSERT INTO `t_calculation_force` VALUES ('144530', '0', '2c9a2193672c4d9b0167314a1bef0034');
INSERT INTO `t_calculation_force` VALUES ('144531', '0', '2c9a2193672c4d9b0167314facbd0036');
INSERT INTO `t_calculation_force` VALUES ('144532', '0', '2c9a2193672c4d9b01673154aed80038');
INSERT INTO `t_calculation_force` VALUES ('144533', '0', '2c9a2193672c4d9b0167315f9714003a');
INSERT INTO `t_calculation_force` VALUES ('144534', '0', '2c9a2193672c4d9b01673169ad1c003c');
INSERT INTO `t_calculation_force` VALUES ('144535', '0', '2c9a219367316ef401673177f57c0001');

-- ----------------------------
-- Table structure for `t_column`
-- ----------------------------
DROP TABLE IF EXISTS `t_column`;
CREATE TABLE `t_column` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_column
-- ----------------------------
INSERT INTO `t_column` VALUES ('1', '资讯');
INSERT INTO `t_column` VALUES ('2', '公告');

-- ----------------------------
-- Table structure for `t_extension_record`
-- ----------------------------
DROP TABLE IF EXISTS `t_extension_record`;
CREATE TABLE `t_extension_record` (
  `id` int(11) NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `recommend_user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK574ra839nxww2ulnp8x4etu0t` (`recommend_user_id`),
  KEY `FKhtwqs4m2bxrnwt248rjq22qc4` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_extension_record
-- ----------------------------
INSERT INTO `t_extension_record` VALUES ('144298', '2018-11-18 15:15:08', '2c9a21936727600a01672763c3db0001', '2c9a219366ee5f480166eeb8180c0006');
INSERT INTO `t_extension_record` VALUES ('144303', '2018-11-18 16:20:43', '2c9a21936727600a0167279fccef0004', '2c9a219366ee5f480166eeb8180c0006');
INSERT INTO `t_extension_record` VALUES ('144305', '2018-11-18 16:30:19', '2c9a21936727600a016727a896810006', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_extension_record` VALUES ('144307', '2018-11-18 16:32:32', '2c9a21936727600a016727aa9d000008', '2c9a21936727600a016727a896810006');
INSERT INTO `t_extension_record` VALUES ('144309', '2018-11-18 16:35:16', '2c9a21936727600a016727ad1f94000a', '2c9a21936727600a016727aa9d000008');
INSERT INTO `t_extension_record` VALUES ('144311', '2018-11-18 16:37:50', '2c9a21936727600a016727af77eb000c', '2c9a21936727600a016727ad1f94000a');
INSERT INTO `t_extension_record` VALUES ('144313', '2018-11-18 16:39:08', '2c9a21936727600a016727b0a89b000e', '2c9a21936727600a016727af77eb000c');
INSERT INTO `t_extension_record` VALUES ('144315', '2018-11-18 16:40:40', '2c9a21936727600a016727b211920010', '2c9a21936727600a016727b0a89b000e');
INSERT INTO `t_extension_record` VALUES ('144317', '2018-11-18 16:41:53', '2c9a21936727600a016727b32c970012', '2c9a21936727600a016727b211920010');
INSERT INTO `t_extension_record` VALUES ('144319', '2018-11-18 16:43:11', '2c9a21936727600a016727b460440014', '2c9a21936727600a016727b32c970012');
INSERT INTO `t_extension_record` VALUES ('144321', '2018-11-18 16:44:47', '2c9a21936727600a016727b5d7e10016', '2c9a21936727600a016727b460440014');
INSERT INTO `t_extension_record` VALUES ('144323', '2018-11-18 16:47:43', '2c9a21936727600a016727b885da0018', '2c9a21936727600a016727b5d7e10016');
INSERT INTO `t_extension_record` VALUES ('144325', '2018-11-18 16:49:53', '2c9a21936727600a016727ba812d001a', '2c9a21936727600a016727aa9d000008');
INSERT INTO `t_extension_record` VALUES ('144327', '2018-11-18 16:51:25', '2c9a21936727600a016727bbe793001c', '2c9a21936727600a016727ba812d001a');
INSERT INTO `t_extension_record` VALUES ('144329', '2018-11-18 16:52:34', '2c9a21936727600a016727bcf5f6001e', '2c9a21936727600a016727bbe793001c');
INSERT INTO `t_extension_record` VALUES ('144331', '2018-11-18 16:53:55', '2c9a21936727600a016727be323f0020', '2c9a21936727600a016727bcf5f6001e');
INSERT INTO `t_extension_record` VALUES ('144334', '2018-11-18 17:09:58', '2c9a21936727600a016727cce2ae0022', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_extension_record` VALUES ('144336', '2018-11-18 17:25:30', '2c9a21936727600a016727db1da00024', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_extension_record` VALUES ('144339', '2018-11-18 17:50:14', '2c9a21936727600a016727f1c00f0026', '2c9a21936727600a016727db1da00024');
INSERT INTO `t_extension_record` VALUES ('144341', '2018-11-18 17:56:52', '2c9a21936727600a016727f7d5110028', '2c9a21936727600a016727db1da00024');
INSERT INTO `t_extension_record` VALUES ('144343', '2018-11-18 17:57:36', '2c9a21936727600a016727f87f89002a', '2c9a21936727600a016727db1da00024');
INSERT INTO `t_extension_record` VALUES ('144345', '2018-11-18 17:58:31', '2c9a21936727600a016727f9578b002c', '2c9a21936727600a016727db1da00024');
INSERT INTO `t_extension_record` VALUES ('144347', '2018-11-18 18:01:23', '2c9a21936727600a016727fbf538002e', '2c9a21936727600a016727db1da00024');
INSERT INTO `t_extension_record` VALUES ('144351', '2018-11-18 18:04:18', '2c9a21936727600a016727fea2660032', '2c9a21936727600a016727db1da00024');
INSERT INTO `t_extension_record` VALUES ('144353', '2018-11-18 18:06:16', '2c9a21936727600a016728006fb40034', '2c9a21936727600a016727fbf538002e');
INSERT INTO `t_extension_record` VALUES ('144356', '2018-11-19 05:14:25', '2c9a21936727600a01672a6424df003a', '2c9a219366ee5f480166eeb8180c0006');
INSERT INTO `t_extension_record` VALUES ('144358', '2018-11-19 07:50:01', '2c9a21936727600a01672af2999f003c', '2c9a21936727600a016727db1da00024');
INSERT INTO `t_extension_record` VALUES ('144360', '2018-11-19 07:56:32', '2c9a21936727600a01672af89339003e', '2c9a21936727600a016727aa9d000008');
INSERT INTO `t_extension_record` VALUES ('144362', '2018-11-19 07:57:34', '2c9a21936727600a01672af982aa0040', '2c9a21936727600a01672af89339003e');
INSERT INTO `t_extension_record` VALUES ('144364', '2018-11-19 07:59:02', '2c9a21936727600a01672afada7a0042', '2c9a21936727600a01672af982aa0040');
INSERT INTO `t_extension_record` VALUES ('144366', '2018-11-19 08:01:02', '2c9a21936727600a01672afcb0140044', '2c9a21936727600a01672afada7a0042');
INSERT INTO `t_extension_record` VALUES ('144368', '2018-11-19 08:02:32', '2c9a21936727600a01672afe0eba0046', '2c9a21936727600a01672afcb0140044');
INSERT INTO `t_extension_record` VALUES ('144370', '2018-11-19 08:03:45', '2c9a21936727600a01672aff2e340048', '2c9a21936727600a01672afe0eba0046');
INSERT INTO `t_extension_record` VALUES ('144372', '2018-11-19 08:05:46', '2c9a21936727600a01672b0106dc004a', '2c9a21936727600a01672aff2e340048');
INSERT INTO `t_extension_record` VALUES ('144374', '2018-11-19 08:07:04', '2c9a21936727600a01672b0235b7004c', '2c9a21936727600a01672b0106dc004a');
INSERT INTO `t_extension_record` VALUES ('144376', '2018-11-19 08:08:11', '2c9a21936727600a01672b033b5f004e', '2c9a21936727600a01672b0235b7004c');
INSERT INTO `t_extension_record` VALUES ('144456', '2018-11-20 05:11:56', '2c9a2193672c4d9b01672f883abf000f', '2c9a21936727600a01672b0106dc004a');
INSERT INTO `t_extension_record` VALUES ('144459', '2018-11-20 10:05:03', '2c9a2193672c4d9b0167309494fd0019', '2c9a21936727600a01672b0106dc004a');
INSERT INTO `t_extension_record` VALUES ('144462', '2018-11-20 10:49:56', '2c9a2193672c4d9b016730bdadcd0021', '2c9a2193672c4d9b01672f883abf000f');
INSERT INTO `t_extension_record` VALUES ('144464', '2018-11-20 10:58:15', '2c9a2193672c4d9b016730c54c7c0023', '2c9a2193672c4d9b01672f883abf000f');
INSERT INTO `t_extension_record` VALUES ('144472', '2018-11-20 11:37:49', '2c9a2193672c4d9b016730e9861b0029', '2c9a2193672c4d9b016730bdadcd0021');
INSERT INTO `t_extension_record` VALUES ('144477', '2018-11-20 13:23:19', '2c9a2193672c4d9b0167314a1bef0034', '2c9a21936727600a01672afcb0140044');
INSERT INTO `t_extension_record` VALUES ('144479', '2018-11-20 13:29:24', '2c9a2193672c4d9b0167314facbd0036', '2c9a2193672c4d9b0167314a1bef0034');
INSERT INTO `t_extension_record` VALUES ('144481', '2018-11-20 13:34:52', '2c9a2193672c4d9b01673154aed80038', '2c9a21936727600a016727fbf538002e');
INSERT INTO `t_extension_record` VALUES ('144483', '2018-11-20 13:46:47', '2c9a2193672c4d9b0167315f9714003a', '2c9a21936727600a01672763c3db0001');
INSERT INTO `t_extension_record` VALUES ('144485', '2018-11-20 13:57:48', '2c9a2193672c4d9b01673169ad1c003c', '2c9a21936727600a016727be323f0020');
INSERT INTO `t_extension_record` VALUES ('144487', '2018-11-20 14:13:24', '2c9a219367316ef401673177f57c0001', '2c9a21936727600a01672763c3db0001');
INSERT INTO `t_extension_record` VALUES ('144634', '2018-11-21 13:02:36', '2c9a2193673654610167365d81420003', '2c9a21936727600a016727b5d7e10016');

-- ----------------------------
-- Table structure for `t_income_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_income_detail`;
CREATE TABLE `t_income_detail` (
  `id` int(11) NOT NULL,
  `balance` float NOT NULL,
  `date` datetime DEFAULT NULL,
  `money` float NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5ym4k8byha2a6mrw2e03o6qnh` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_income_detail
-- ----------------------------
INSERT INTO `t_income_detail` VALUES ('144300', '50', '2018-11-18 15:15:31', '50', '注册赠送收益', '2c9a21936727600a01672763c3db0001');
INSERT INTO `t_income_detail` VALUES ('144333', '50', '2018-11-18 17:08:06', '50', '注册赠送收益', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_income_detail` VALUES ('144338', '50', '2018-11-18 17:26:07', '50', '注册赠送收益', '2c9a21936727600a016727db1da00024');
INSERT INTO `t_income_detail` VALUES ('144355', '50', '2018-11-19 02:11:55', '50', '注册赠送收益', '2c9a21936727600a016727b211920010');
INSERT INTO `t_income_detail` VALUES ('144379', '50', '2018-11-19 08:45:10', '50', '注册赠送收益', '2c9a21936727600a016727aa9d000008');
INSERT INTO `t_income_detail` VALUES ('144381', '50', '2018-11-19 13:59:28', '50', '注册赠送收益', '2c9a21936727600a01672b033b5f004e');
INSERT INTO `t_income_detail` VALUES ('144382', '50', '2018-11-19 14:00:59', '50', '注册赠送收益', '2c9a21936727600a01672b0235b7004c');
INSERT INTO `t_income_detail` VALUES ('144385', '50', '2018-11-19 15:45:15', '50', '注册赠送收益', '2c9a21936727600a01672af89339003e');
INSERT INTO `t_income_detail` VALUES ('144386', '50', '2018-11-19 15:50:56', '50', '注册赠送收益', '2c9a21936727600a01672af982aa0040');
INSERT INTO `t_income_detail` VALUES ('144388', '50', '2018-11-19 15:58:21', '50', '注册赠送收益', '2c9a21936727600a01672afada7a0042');
INSERT INTO `t_income_detail` VALUES ('144390', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a016727a896810006');
INSERT INTO `t_income_detail` VALUES ('144391', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a016727ad1f94000a');
INSERT INTO `t_income_detail` VALUES ('144392', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a016727af77eb000c');
INSERT INTO `t_income_detail` VALUES ('144393', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a016727b0a89b000e');
INSERT INTO `t_income_detail` VALUES ('144394', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a016727b32c970012');
INSERT INTO `t_income_detail` VALUES ('144395', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a016727b460440014');
INSERT INTO `t_income_detail` VALUES ('144396', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a016727b5d7e10016');
INSERT INTO `t_income_detail` VALUES ('144397', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a016727b885da0018');
INSERT INTO `t_income_detail` VALUES ('144398', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a016727ba812d001a');
INSERT INTO `t_income_detail` VALUES ('144399', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a016727bbe793001c');
INSERT INTO `t_income_detail` VALUES ('144400', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a016727bcf5f6001e');
INSERT INTO `t_income_detail` VALUES ('144401', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a016727be323f0020');
INSERT INTO `t_income_detail` VALUES ('144402', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a016727cce2ae0022');
INSERT INTO `t_income_detail` VALUES ('144403', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a016727f1c00f0026');
INSERT INTO `t_income_detail` VALUES ('144404', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a016727f7d5110028');
INSERT INTO `t_income_detail` VALUES ('144405', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a016727f87f89002a');
INSERT INTO `t_income_detail` VALUES ('144406', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a016727f9578b002c');
INSERT INTO `t_income_detail` VALUES ('144407', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a016727fbf538002e');
INSERT INTO `t_income_detail` VALUES ('144408', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a016727fea2660032');
INSERT INTO `t_income_detail` VALUES ('144409', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a016728006fb40034');
INSERT INTO `t_income_detail` VALUES ('144410', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a01672a6424df003a');
INSERT INTO `t_income_detail` VALUES ('144411', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a01672af2999f003c');
INSERT INTO `t_income_detail` VALUES ('144412', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a01672afcb0140044');
INSERT INTO `t_income_detail` VALUES ('144413', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a01672afe0eba0046');
INSERT INTO `t_income_detail` VALUES ('144414', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a01672aff2e340048');
INSERT INTO `t_income_detail` VALUES ('144415', '50', '2018-11-19 16:00:00', '50', '注册赠送收益', '2c9a21936727600a01672b0106dc004a');
INSERT INTO `t_income_detail` VALUES ('144452', '50', '2018-11-19 16:00:56', '0', '固定收益', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_income_detail` VALUES ('144454', '250', '2018-11-19 16:16:20', '200', '后台系统增加余额', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_income_detail` VALUES ('144455', '50', '2018-11-19 16:16:56', '-200', '提现', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_income_detail` VALUES ('144467', '50', '2018-11-20 11:20:15', '50', '注册赠送收益', '2c9a2193672c4d9b0167309494fd0019');
INSERT INTO `t_income_detail` VALUES ('144469', '50', '2018-11-20 11:23:16', '50', '注册赠送收益', '2c9a2193672c4d9b016730c54c7c0023');
INSERT INTO `t_income_detail` VALUES ('144474', '50', '2018-11-20 11:39:30', '50', '注册赠送收益', '2c9a2193672c4d9b016730e9861b0029');
INSERT INTO `t_income_detail` VALUES ('144475', '50', '2018-11-20 11:39:41', '50', '注册赠送收益', '2c9a2193672c4d9b016730bdadcd0021');
INSERT INTO `t_income_detail` VALUES ('144489', '6850', '2018-11-20 14:20:26', '6800', '后台系统增加余额', '2c9a21936727600a016727a896810006');
INSERT INTO `t_income_detail` VALUES ('144490', '13850', '2018-11-20 14:21:44', '13800', '后台系统增加余额', '2c9a21936727600a016727aa9d000008');
INSERT INTO `t_income_detail` VALUES ('144491', '26850', '2018-11-20 14:23:26', '26800', '后台系统增加余额', '2c9a21936727600a016727ad1f94000a');
INSERT INTO `t_income_detail` VALUES ('144492', '13850', '2018-11-20 14:24:06', '13800', '后台系统增加余额', '2c9a21936727600a016727af77eb000c');
INSERT INTO `t_income_detail` VALUES ('144493', '13850', '2018-11-20 14:24:42', '13800', '后台系统增加余额', '2c9a21936727600a016727b0a89b000e');
INSERT INTO `t_income_detail` VALUES ('144494', '6850', '2018-11-20 14:26:06', '6800', '后台系统增加余额', '2c9a21936727600a016727b211920010');
INSERT INTO `t_income_detail` VALUES ('144495', '13850', '2018-11-20 14:27:17', '13800', '后台系统增加余额', '2c9a21936727600a016727b32c970012');
INSERT INTO `t_income_detail` VALUES ('144496', '118850', '2018-11-20 14:28:37', '118800', '后台系统增加余额', '2c9a21936727600a016727b460440014');
INSERT INTO `t_income_detail` VALUES ('144497', '59850', '2018-11-20 14:29:28', '59800', '后台系统增加余额', '2c9a21936727600a016727b5d7e10016');
INSERT INTO `t_income_detail` VALUES ('144498', '13850', '2018-11-20 14:30:24', '13800', '后台系统增加余额', '2c9a21936727600a016727b885da0018');
INSERT INTO `t_income_detail` VALUES ('144499', '59850', '2018-11-20 14:33:50', '59800', '后台系统增加余额', '2c9a21936727600a016727ba812d001a');
INSERT INTO `t_income_detail` VALUES ('144500', '26850', '2018-11-20 14:35:03', '26800', '后台系统增加余额', '2c9a21936727600a016727bbe793001c');
INSERT INTO `t_income_detail` VALUES ('144501', '13850', '2018-11-20 14:35:44', '13800', '后台系统增加余额', '2c9a21936727600a016727bcf5f6001e');
INSERT INTO `t_income_detail` VALUES ('144502', '13850', '2018-11-20 14:36:43', '13800', '后台系统增加余额', '2c9a21936727600a016727be323f0020');
INSERT INTO `t_income_detail` VALUES ('144503', '59800', '2018-11-20 14:38:00', '59800', '后台系统增加余额', '2c9a2193672c4d9b01673169ad1c003c');
INSERT INTO `t_income_detail` VALUES ('144505', '0', '2018-11-20 15:04:36', '-59800', '小矿主(5台)', '2c9a2193672c4d9b01673169ad1c003c');
INSERT INTO `t_income_detail` VALUES ('144506', '50', '2018-11-20 15:04:58', '50', '注册赠送收益', '2c9a2193672c4d9b01673169ad1c003c');
INSERT INTO `t_income_detail` VALUES ('144507', '59850', '2018-11-20 15:31:52', '59800', '后台系统增加余额', '2c9a21936727600a01672afcb0140044');
INSERT INTO `t_income_detail` VALUES ('144508', '13850', '2018-11-20 15:33:20', '13800', '后台系统增加余额', '2c9a21936727600a01672afe0eba0046');
INSERT INTO `t_income_detail` VALUES ('144509', '13850', '2018-11-20 15:33:46', '13800', '后台系统增加余额', '2c9a21936727600a01672aff2e340048');
INSERT INTO `t_income_detail` VALUES ('144510', '13850', '2018-11-20 15:34:17', '13800', '后台系统增加余额', '2c9a21936727600a01672b0106dc004a');
INSERT INTO `t_income_detail` VALUES ('144511', '59850', '2018-11-20 15:34:47', '59800', '后台系统增加余额', '2c9a21936727600a01672b0235b7004c');
INSERT INTO `t_income_detail` VALUES ('144512', '59850', '2018-11-20 15:35:24', '59800', '后台系统增加余额', '2c9a21936727600a01672b033b5f004e');
INSERT INTO `t_income_detail` VALUES ('144513', '59850', '2018-11-20 15:37:25', '59800', '后台系统增加余额', '2c9a21936727600a01672afada7a0042');
INSERT INTO `t_income_detail` VALUES ('144514', '59850', '2018-11-20 15:37:58', '59800', '后台系统增加余额', '2c9a21936727600a01672af982aa0040');
INSERT INTO `t_income_detail` VALUES ('144515', '118850', '2018-11-20 15:38:34', '118800', '后台系统增加余额', '2c9a21936727600a01672af89339003e');
INSERT INTO `t_income_detail` VALUES ('144517', '50', '2018-11-20 15:56:53', '-13800', '算力T2矿机(1台)', '2c9a21936727600a016727aa9d000008');
INSERT INTO `t_income_detail` VALUES ('144518', '50', '2018-11-20 16:00:00', '50', '注册赠送收益', '2c9a2193672c4d9b01672f883abf000f');
INSERT INTO `t_income_detail` VALUES ('144519', '50', '2018-11-20 16:00:00', '50', '注册赠送收益', '2c9a2193672c4d9b0167314a1bef0034');
INSERT INTO `t_income_detail` VALUES ('144520', '50', '2018-11-20 16:00:00', '50', '注册赠送收益', '2c9a2193672c4d9b0167314facbd0036');
INSERT INTO `t_income_detail` VALUES ('144521', '50', '2018-11-20 16:00:00', '50', '注册赠送收益', '2c9a2193672c4d9b01673154aed80038');
INSERT INTO `t_income_detail` VALUES ('144522', '50', '2018-11-20 16:00:00', '50', '注册赠送收益', '2c9a2193672c4d9b0167315f9714003a');
INSERT INTO `t_income_detail` VALUES ('144523', '50', '2018-11-20 16:00:00', '50', '注册赠送收益', '2c9a219367316ef401673177f57c0001');
INSERT INTO `t_income_detail` VALUES ('144537', '50', '2018-11-20 16:00:27', '-59800', '小矿主(5台)', '2c9a21936727600a01672b0235b7004c');
INSERT INTO `t_income_detail` VALUES ('144539', '0', '2018-11-20 16:01:28', '-59850', '提现', '2c9a21936727600a01672b033b5f004e');
INSERT INTO `t_income_detail` VALUES ('144543', '50', '2018-11-20 16:11:29', '-59800', '小矿主(5台)', '2c9a21936727600a016727ba812d001a');
INSERT INTO `t_income_detail` VALUES ('144545', '50', '2018-11-20 16:19:18', '-118800', '大矿主(10台)', '2c9a21936727600a016727b460440014');
INSERT INTO `t_income_detail` VALUES ('144546', '59800', '2018-11-20 16:39:26', '59800', '后台系统增加余额', '2c9a21936727600a01672b033b5f004e');
INSERT INTO `t_income_detail` VALUES ('144548', '0', '2018-11-20 16:40:50', '-59800', '小矿主(5台)', '2c9a21936727600a01672b033b5f004e');
INSERT INTO `t_income_detail` VALUES ('144549', '50', '2018-11-20 16:57:11', '0', '固定收益', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_income_detail` VALUES ('144550', '200', '2018-11-20 17:04:58', '150', '后台系统增加余额', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_income_detail` VALUES ('144551', '0', '2018-11-20 17:05:24', '-200', '提现', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_income_detail` VALUES ('144552', '200', '2018-11-20 17:06:10', '200', '提现退款', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_income_detail` VALUES ('144554', '400', '2018-11-20 19:39:07', '200', '提现退款', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_income_detail` VALUES ('144555', '0', '2018-11-20 19:40:22', '-400', '提现', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_income_detail` VALUES ('144556', '400', '2018-11-20 19:40:29', '400', '提现退款', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_income_detail` VALUES ('144557', '800', '2018-11-20 19:40:57', '400', '提现退款', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_income_detail` VALUES ('144558', '0', '2018-11-20 19:43:53', '-800', '提现', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_income_detail` VALUES ('144559', '800', '2018-11-20 19:44:23', '800', '提现退款', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_income_detail` VALUES ('144560', '1200', '2018-11-20 19:44:38', '400', '提现退款', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_income_detail` VALUES ('144561', '1600', '2018-11-20 19:44:42', '400', '提现退款', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_income_detail` VALUES ('144562', '6850', '2018-11-20 19:55:18', '6800', '后台系统增加余额', '2c9a2193672c4d9b0167314a1bef0034');
INSERT INTO `t_income_detail` VALUES ('144563', '59850', '2018-11-20 19:56:53', '59800', '后台系统增加余额', '2c9a2193672c4d9b0167314facbd0036');
INSERT INTO `t_income_detail` VALUES ('144564', '6850', '2018-11-20 19:58:20', '6800', '后台系统增加余额', '2c9a21936727600a016727fbf538002e');
INSERT INTO `t_income_detail` VALUES ('144566', '6850', '2018-11-20 19:59:58', '6800', '后台系统增加余额', '2c9a21936727600a016727f1c00f0026');
INSERT INTO `t_income_detail` VALUES ('144569', '6850', '2018-11-20 20:01:30', '6800', '后台系统增加余额', '2c9a21936727600a016727f9578b002c');
INSERT INTO `t_income_detail` VALUES ('144570', '59850', '2018-11-20 20:02:15', '59800', '后台系统增加余额', '2c9a21936727600a016728006fb40034');
INSERT INTO `t_income_detail` VALUES ('144571', '118850', '2018-11-20 20:03:39', '118800', '后台系统增加余额', '2c9a2193672c4d9b01673154aed80038');
INSERT INTO `t_income_detail` VALUES ('144572', '6850', '2018-11-20 20:04:15', '6800', '后台系统增加余额', '2c9a21936727600a016727f7d5110028');
INSERT INTO `t_income_detail` VALUES ('144574', '13850', '2018-11-20 20:05:28', '13800', '后台系统增加余额', '2c9a21936727600a016727f87f89002a');
INSERT INTO `t_income_detail` VALUES ('144576', '6850', '2018-11-20 20:07:23', '6800', '后台系统增加余额', '2c9a21936727600a016727fea2660032');
INSERT INTO `t_income_detail` VALUES ('144579', '0', '2018-11-20 20:24:09', '-59850', '提现', '2c9a21936727600a01672afcb0140044');
INSERT INTO `t_income_detail` VALUES ('144580', '59850', '2018-11-21 01:06:38', '59850', '提现退款', '2c9a21936727600a01672afcb0140044');
INSERT INTO `t_income_detail` VALUES ('144581', '350', '2018-11-21 03:25:19', '300', '后台系统增加余额', '2c9a219367316ef401673177f57c0001');
INSERT INTO `t_income_detail` VALUES ('144583', '250', '2018-11-21 03:32:30', '200', '后台系统增加余额', '2c9a2193672c4d9b0167315f9714003a');
INSERT INTO `t_income_detail` VALUES ('144585', '50', '2018-11-21 03:36:26', '-200', '提现', '2c9a2193672c4d9b0167315f9714003a');
INSERT INTO `t_income_detail` VALUES ('144586', '250', '2018-11-21 03:36:50', '200', '提现退款', '2c9a2193672c4d9b0167315f9714003a');
INSERT INTO `t_income_detail` VALUES ('144587', '40', '2018-11-21 03:39:29', '-210', '提现', '2c9a2193672c4d9b0167315f9714003a');
INSERT INTO `t_income_detail` VALUES ('144588', '0', '2018-11-21 04:22:37', '-59850', '提现', '2c9a21936727600a01672afcb0140044');
INSERT INTO `t_income_detail` VALUES ('144590', '50', '2018-11-21 07:00:44', '-59800', '小矿主(5台)', '2c9a21936727600a016727b5d7e10016');
INSERT INTO `t_income_detail` VALUES ('144594', '50', '2018-11-21 07:06:35', '-13800', '算力T2矿机(1台)', '2c9a21936727600a016727af77eb000c');
INSERT INTO `t_income_detail` VALUES ('144596', '50', '2018-11-21 07:07:50', '-13800', '算力T2矿机(1台)', '2c9a21936727600a016727b32c970012');
INSERT INTO `t_income_detail` VALUES ('144599', '50', '2018-11-21 07:10:19', '-13800', '算力T2矿机(1台)', '2c9a21936727600a01672b0106dc004a');
INSERT INTO `t_income_detail` VALUES ('144601', '50', '2018-11-21 07:11:28', '-6800', '算力T1矿机', '2c9a21936727600a016727b211920010');
INSERT INTO `t_income_detail` VALUES ('144602', '0', '2018-11-21 07:13:40', '-1600', '提现', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_income_detail` VALUES ('144603', '1600', '2018-11-21 07:13:59', '1600', '提现退款', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_income_detail` VALUES ('144604', '1600', '2018-11-21 07:16:05', '0', '推荐收益', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_income_detail` VALUES ('144605', '1600', '2018-11-21 07:16:05', '0', '推荐收益', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_income_detail` VALUES ('144606', '1600', '2018-11-21 07:16:05', '0', '推荐收益', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_income_detail` VALUES ('144607', '1600', '2018-11-21 07:16:06', '0', '推荐收益', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_income_detail` VALUES ('144608', '1600', '2018-11-21 07:16:06', '0', '推荐收益', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_income_detail` VALUES ('144609', '1600', '2018-11-21 07:16:06', '0', '推荐收益', '2c9a21936727600a0167279fccef0004');
INSERT INTO `t_income_detail` VALUES ('144610', '59850', '2018-11-21 07:16:54', '59850', '提现退款', '2c9a21936727600a01672afcb0140044');
INSERT INTO `t_income_detail` VALUES ('144612', '50', '2018-11-21 07:37:18', '-13800', '算力T2矿机(1台)', '2c9a21936727600a016727bcf5f6001e');
INSERT INTO `t_income_detail` VALUES ('144614', '50', '2018-11-21 07:50:24', '-59800', '小矿主(5台)', '2c9a21936727600a01672afcb0140044');
INSERT INTO `t_income_detail` VALUES ('144617', '50', '2018-11-21 09:04:28', '-59800', '小矿主(5台)', '2c9a2193672c4d9b0167314facbd0036');
INSERT INTO `t_income_detail` VALUES ('144618', '50', '2018-11-21 09:20:08', '-13800', '提现', '2c9a21936727600a01672afe0eba0046');
INSERT INTO `t_income_detail` VALUES ('144620', '6850', '2018-11-21 09:27:12', '-20000', '算力T3矿机(1台)', '2c9a21936727600a016727bbe793001c');
INSERT INTO `t_income_detail` VALUES ('144621', '50', '2018-11-21 09:39:53', '-6800', '提现', '2c9a21936727600a016727bbe793001c');
INSERT INTO `t_income_detail` VALUES ('144622', '13850', '2018-11-21 09:42:58', '13800', '提现退款', '2c9a21936727600a01672afe0eba0046');
INSERT INTO `t_income_detail` VALUES ('144624', '50', '2018-11-21 09:48:41', '-13800', '算力T2矿机(1台)', '2c9a21936727600a01672aff2e340048');
INSERT INTO `t_income_detail` VALUES ('144626', '6850', '2018-11-21 09:51:09', '-7000', '算力T2矿机(1台)', '2c9a21936727600a01672afe0eba0046');
INSERT INTO `t_income_detail` VALUES ('144627', '50', '2018-11-21 09:51:50', '-6800', '提现', '2c9a21936727600a01672afe0eba0046');
INSERT INTO `t_income_detail` VALUES ('144629', '50', '2018-11-21 12:21:36', '-13800', '算力T2矿机(1台)', '2c9a21936727600a016727b885da0018');
INSERT INTO `t_income_detail` VALUES ('144631', '50', '2018-11-21 12:22:24', '-13800', '算力T2矿机(1台)', '2c9a21936727600a016727b0a89b000e');
INSERT INTO `t_income_detail` VALUES ('144633', '50', '2018-11-21 12:59:28', '-6800', '算力T1矿机', '2c9a2193672c4d9b0167314a1bef0034');
INSERT INTO `t_income_detail` VALUES ('144636', '50', '2018-11-21 13:03:13', '50', '注册赠送收益', '2c9a2193673654610167365d81420003');
INSERT INTO `t_income_detail` VALUES ('144637', '6850', '2018-11-21 13:07:47', '0', '推荐收益', '2c9a21936727600a016727a896810006');
INSERT INTO `t_income_detail` VALUES ('144639', '50', '2018-11-21 13:07:59', '-6800', '算力T1矿机', '2c9a21936727600a016727a896810006');
INSERT INTO `t_income_detail` VALUES ('144642', '50', '2018-11-21 13:09:51', '-26800', '算力T3矿机(1台)', '2c9a21936727600a016727ad1f94000a');
INSERT INTO `t_income_detail` VALUES ('144646', '50', '2018-11-21 13:13:16', '-6800', '算力T1矿机', '2c9a21936727600a016727fbf538002e');
INSERT INTO `t_income_detail` VALUES ('144649', '50', '2018-11-21 13:14:58', '-6800', '算力T1矿机', '2c9a21936727600a016727f1c00f0026');
INSERT INTO `t_income_detail` VALUES ('144652', '50', '2018-11-21 13:16:46', '-6800', '算力T1矿机', '2c9a21936727600a016727f9578b002c');
INSERT INTO `t_income_detail` VALUES ('144655', '50', '2018-11-21 13:18:47', '-6800', '算力T1矿机', '2c9a21936727600a016727f7d5110028');
INSERT INTO `t_income_detail` VALUES ('144658', '50', '2018-11-21 13:20:42', '-13800', '算力T2矿机(1台)', '2c9a21936727600a016727f87f89002a');

-- ----------------------------
-- Table structure for `t_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `listorder` int(11) NOT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('402880a166cf23120166cf2377ab0000', 'index', 'BackStage', 'list', '0', 'Menu', '菜单管理', '', '0', '', '0');
INSERT INTO `t_menu` VALUES ('4028887066d4d6c30166d4dac1570000', 'default', 'BackStage', 'list', '0', 'User', '用户管理', '', '0', '', '0');
INSERT INTO `t_menu` VALUES ('4028887066d4d6c30166d4db02840001', 'index', 'BackStage', '', '0', 'Role', '角色管理', '', '4028887066d4d6c30166d4dac1570000', '', '0');
INSERT INTO `t_menu` VALUES ('4028887066d4e4db0166d4e573dc0000', 'index', 'BackStage', 'list', '0', 'Admin', '管理员管理', '', '4028887066d4d6c30166d4dac1570000', '', '0');
INSERT INTO `t_menu` VALUES ('4028887066d4ec3c0166d4ee21ef0001', 'default', 'BackStage', 'list', '0', 'Content', '内容管理', '', '0', '', '0');
INSERT INTO `t_menu` VALUES ('4028887066d4ec3c0166d4ee633a0002', 'index', 'BackStage', '', '0', 'Miner', '矿机管理', '', '4028887066d4ec3c0166d4ee21ef0001', '', '0');
INSERT INTO `t_menu` VALUES ('4028887066d4ec3c0166d4ee9c290003', 'index', 'BackStage', '', '0', 'Order', '订单管理', '', '4028887066d4ec3c0166d4ee21ef0001', '', '0');
INSERT INTO `t_menu` VALUES ('4028887066d4ec3c0166d4ef24c80004', 'index', 'BackStage', 'list', '0', 'Withdraw', '提现申请', '', '0', '', '0');
INSERT INTO `t_menu` VALUES ('4028887066d4ec3c0166d4efa9bd0005', 'index', 'BackStage', '', '0', 'User', '用户管理', '', '4028887066d4d6c30166d4dac1570000', '', '0');
INSERT INTO `t_menu` VALUES ('402880a166de0c500166de0ec4940000', 'index', 'BackStage', '', '0', 'Advertisement', '轮播管理', '', '4028887066d4ec3c0166d4ee21ef0001', '', '0');
INSERT INTO `t_menu` VALUES ('402880a166de8e470166de8ed6c40000', 'index', 'BackStage', '', '0', 'ExtensionRecord', '用户推广', '', '4028887066d4d6c30166d4dac1570000', '', '0');
INSERT INTO `t_menu` VALUES ('402880a16702625301670263d66e0000', 'index', 'BackStage', '', '0', 'Notice', '公告咨询管理', '', '4028887066d4ec3c0166d4ee21ef0001', '', '0');
INSERT INTO `t_menu` VALUES ('402880a16712dade016712dd5cf00000', 'index', 'BackStage', '', '0', 'Authentication', '认证审核', '', '4028887066d4ec3c0166d4ee21ef0001', '', '0');

-- ----------------------------
-- Table structure for `t_message`
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verify` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727632c2e0000', '2018-11-18 15:14:30', '尊敬的用户，您好，您此次的验证码是3117；此验证码半个小时内有效；', '15320575162', '3117');
INSERT INTO `t_message` VALUES ('2c9a21936727600a0167279dca1a0002', '2018-11-18 16:18:31', '尊敬的用户，您好，您此次的验证码是5528；此验证码半个小时内有效；', '18775797932', '5528');
INSERT INTO `t_message` VALUES ('2c9a21936727600a0167279f92a50003', '2018-11-18 16:20:28', '尊敬的用户，您好，您此次的验证码是3874；此验证码半个小时内有效；', '18775797932', '3874');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727a825970005', '2018-11-18 16:29:50', '尊敬的用户，您好，您此次的验证码是1607；此验证码半个小时内有效；', '15768884994', '1607');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727aa6c6a0007', '2018-11-18 16:32:19', '尊敬的用户，您好，您此次的验证码是1788；此验证码半个小时内有效；', '17875674513', '1788');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727acd59a0009', '2018-11-18 16:34:57', '尊敬的用户，您好，您此次的验证码是3680；此验证码半个小时内有效；', '13724830166', '3680');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727ae95c9000b', '2018-11-18 16:36:52', '尊敬的用户，您好，您此次的验证码是7288；此验证码半个小时内有效；', '13760758293', '7288');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727b0793e000d', '2018-11-18 16:38:56', '尊敬的用户，您好，您此次的验证码是7379；此验证码半个小时内有效；', '13535042833', '7379');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727b1cb42000f', '2018-11-18 16:40:22', '尊敬的用户，您好，您此次的验证码是9903；此验证码半个小时内有效；', '19875499386', '9903');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727b2dadd0011', '2018-11-18 16:41:32', '尊敬的用户，您好，您此次的验证码是3496；此验证码半个小时内有效；', '13302259943', '3496');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727b3ec5c0013', '2018-11-18 16:42:42', '尊敬的用户，您好，您此次的验证码是8353；此验证码半个小时内有效；', '13570558868', '8353');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727b565700015', '2018-11-18 16:44:18', '尊敬的用户，您好，您此次的验证码是7535；此验证码半个小时内有效；', '13928947945', '7535');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727b85bec0017', '2018-11-18 16:47:32', '尊敬的用户，您好，您此次的验证码是9060；此验证码半个小时内有效；', '13247397888', '9060');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727ba5bd20019', '2018-11-18 16:49:43', '尊敬的用户，您好，您此次的验证码是7701；此验证码半个小时内有效；', '18928938363', '7701');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727bbb8d2001b', '2018-11-18 16:51:13', '尊敬的用户，您好，您此次的验证码是2594；此验证码半个小时内有效；', '18819133131', '2594');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727bcb15b001d', '2018-11-18 16:52:16', '尊敬的用户，您好，您此次的验证码是4426；此验证码半个小时内有效；', '13539888831', '4426');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727bdfcb7001f', '2018-11-18 16:53:41', '尊敬的用户，您好，您此次的验证码是7182；此验证码半个小时内有效；', '18819314941', '7182');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727cc7a400021', '2018-11-18 17:09:31', '尊敬的用户，您好，您此次的验证码是8896；此验证码半个小时内有效；', '15373685861', '8896');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727da7ab90023', '2018-11-18 17:24:48', '尊敬的用户，您好，您此次的验证码是7075；此验证码半个小时内有效；', '18529282687', '7075');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727f14a140025', '2018-11-18 17:49:43', '尊敬的用户，您好，您此次的验证码是6085；此验证码半个小时内有效；', '18941727888', '6085');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727f761480027', '2018-11-18 17:56:22', '尊敬的用户，您好，您此次的验证码是4814；此验证码半个小时内有效；', '13247541345', '4814');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727f864be0029', '2018-11-18 17:57:29', '尊敬的用户，您好，您此次的验证码是8422；此验证码半个小时内有效；', '18665748768', '8422');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727f932cc002b', '2018-11-18 17:58:22', '尊敬的用户，您好，您此次的验证码是4037；此验证码半个小时内有效；', '13560488849', '4037');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727fbc6e5002d', '2018-11-18 18:01:11', '尊敬的用户，您好，您此次的验证码是1167；此验证码半个小时内有效；', '15361683115', '1167');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727fc6f5a002f', '2018-11-18 18:01:54', '尊敬的用户，您好，您此次的验证码是2953；此验证码半个小时内有效；', '13352978178', '2953');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727fe63d70031', '2018-11-18 18:04:02', '尊敬的用户，您好，您此次的验证码是1834；此验证码半个小时内有效；', '13168375693', '1834');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016727ff819b0033', '2018-11-18 18:05:15', '尊敬的用户，您好，您此次的验证码是5768；此验证码半个小时内有效；', '13711156286', '5768');
INSERT INTO `t_message` VALUES ('2c9a21936727600a0167280645c90035', '2018-11-18 18:12:38', '尊敬的用户，您好，您此次的验证码是9766；此验证码半个小时内有效；', '18775797932', '9766');
INSERT INTO `t_message` VALUES ('2c9a21936727600a01672806b6f10036', '2018-11-18 18:13:07', '尊敬的用户，您好，您此次的验证码是2975；此验证码半个小时内有效；', '13302259943', '2975');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016728dc34910037', '2018-11-18 22:06:19', '尊敬的用户，您好，您此次的验证码是2365；此验证码半个小时内有效；', '18523565027', '2365');
INSERT INTO `t_message` VALUES ('2c9a21936727600a016729bc99640038', '2018-11-19 02:11:25', '尊敬的用户，您好，您此次的验证码是4714；此验证码半个小时内有效；', '19875499386', '4714');
INSERT INTO `t_message` VALUES ('2c9a21936727600a01672a6390110039', '2018-11-19 05:13:47', '尊敬的用户，您好，您此次的验证码是2279；此验证码半个小时内有效；', '18325042854', '2279');
INSERT INTO `t_message` VALUES ('2c9a21936727600a01672af2589e003b', '2018-11-19 07:49:44', '尊敬的用户，您好，您此次的验证码是4939；此验证码半个小时内有效；', '13825083199', '4939');
INSERT INTO `t_message` VALUES ('2c9a21936727600a01672af803ea003d', '2018-11-19 07:55:56', '尊敬的用户，您好，您此次的验证码是2223；此验证码半个小时内有效；', '13410395528', '2223');
INSERT INTO `t_message` VALUES ('2c9a21936727600a01672af9370b003f', '2018-11-19 07:57:14', '尊敬的用户，您好，您此次的验证码是5853；此验证码半个小时内有效；', '13802259396', '5853');
INSERT INTO `t_message` VALUES ('2c9a21936727600a01672afa488a0041', '2018-11-19 07:58:24', '尊敬的用户，您好，您此次的验证码是9100；此验证码半个小时内有效；', '15818538765', '9100');
INSERT INTO `t_message` VALUES ('2c9a21936727600a01672afbda270043', '2018-11-19 08:00:07', '尊敬的用户，您好，您此次的验证码是6568；此验证码半个小时内有效；', '13710582395', '6568');
INSERT INTO `t_message` VALUES ('2c9a21936727600a01672afdf3430045', '2018-11-19 08:02:25', '尊敬的用户，您好，您此次的验证码是8707；此验证码半个小时内有效；', '18823810301', '8707');
INSERT INTO `t_message` VALUES ('2c9a21936727600a01672afeffd10047', '2018-11-19 08:03:33', '尊敬的用户，您好，您此次的验证码是4374；此验证码半个小时内有效；', '18948788147', '4374');
INSERT INTO `t_message` VALUES ('2c9a21936727600a01672b00bc840049', '2018-11-19 08:05:27', '尊敬的用户，您好，您此次的验证码是6465；此验证码半个小时内有效；', '15012906768', '6465');
INSERT INTO `t_message` VALUES ('2c9a21936727600a01672b01e13e004b', '2018-11-19 08:06:42', '尊敬的用户，您好，您此次的验证码是3226；此验证码半个小时内有效；', '13509088060', '3226');
INSERT INTO `t_message` VALUES ('2c9a21936727600a01672b030711004d', '2018-11-19 08:07:57', '尊敬的用户，您好，您此次的验证码是5121；此验证码半个小时内有效；', '15916370555', '5121');
INSERT INTO `t_message` VALUES ('2c9a21936727600a01672b299dc90050', '2018-11-19 08:50:06', '尊敬的用户，您好，您此次的验证码是7741；此验证码半个小时内有效；', '17875674513', '7741');
INSERT INTO `t_message` VALUES ('2c9a2193672c41d201672c498a9d0001', '2018-11-19 14:04:36', '尊敬的用户，您好，您此次的验证码是2176；此验证码半个小时内有效；', '13710582395', '2176');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b01672c4e96bb0000', '2018-11-19 14:10:07', '尊敬的用户，您好，您此次的验证码是1542；此验证码半个小时内有效；', '13710582395', '1542');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b01672cc113140004', '2018-11-19 16:15:10', '尊敬的用户，您好，您此次的验证码是7506；此验证码半个小时内有效；', '18775797932', '7506');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b01672cc2815a0005', '2018-11-19 16:16:43', '尊敬的用户，您好，您此次的验证码是6346；此验证码半个小时内有效；', '18775797932', '6346');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b01672ce93407000b', '2018-11-19 16:58:59', '尊敬的用户，您好，您此次的验证码是7644；此验证码半个小时内有效；', '18565811206', '7644');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b01672da75f32000d', '2018-11-19 20:26:42', '尊敬的用户，您好，您此次的验证码是8466；此验证码半个小时内有效；', '13500276875', '8466');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b01672f877a5d000e', '2018-11-20 05:11:07', '尊敬的用户，您好，您此次的验证码是5356；此验证码半个小时内有效；', '17689785574', '5356');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b01672f8b9d620010', '2018-11-20 05:15:38', '尊敬的用户，您好，您此次的验证码是6018；此验证码半个小时内有效；', '17689785574', '6018');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b01672ff1aaef0011', '2018-11-20 07:07:06', '尊敬的用户，您好，您此次的验证码是7337；此验证码半个小时内有效；', '15258261888', '7337');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b0167305af1bd0012', '2018-11-20 09:02:05', '尊敬的用户，您好，您此次的验证码是6252；此验证码半个小时内有效；', '15258261888', '6252');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b0167307cf4860013', '2018-11-20 09:39:14', '尊敬的用户，您好，您此次的验证码是2564；此验证码半个小时内有效；', '13509088060', '2564');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b0167307da72d0014', '2018-11-20 09:40:00', '尊敬的用户，您好，您此次的验证码是8752；此验证码半个小时内有效；', '13509088060', '8752');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b0167307e3b9d0015', '2018-11-20 09:40:38', '尊敬的用户，您好，您此次的验证码是8335；此验证码半个小时内有效；', '15916370555', '8335');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b01673091e4d10016', '2018-11-20 10:02:06', '尊敬的用户，您好，您此次的验证码是4244；此验证码半个小时内有效；', '13352691035', '4244');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b01673093281e0017', '2018-11-20 10:03:29', '尊敬的用户，您好，您此次的验证码是2939；此验证码半个小时内有效；', '13352691035', '2939');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b01673094131b0018', '2018-11-20 10:04:29', '尊敬的用户，您好，您此次的验证码是8564；此验证码半个小时内有效；', '13352691035', '8564');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b016730a2f633001b', '2018-11-20 10:20:45', '尊敬的用户，您好，您此次的验证码是9908；此验证码半个小时内有效；', '13392563832', '9908');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b016730ab51ba001c', '2018-11-20 10:29:53', '尊敬的用户，您好，您此次的验证码是5950；此验证码半个小时内有效；', '18523565027', '5950');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b016730b12d1e001d', '2018-11-20 10:36:17', '尊敬的用户，您好，您此次的验证码是5725；此验证码半个小时内有效；', '13352691035', '5725');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b016730b8857d001e', '2018-11-20 10:44:18', '尊敬的用户，您好，您此次的验证码是9655；此验证码半个小时内有效；', '15258261888', '9655');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b016730ba4d5c001f', '2018-11-20 10:46:15', '尊敬的用户，您好，您此次的验证码是9710；此验证码半个小时内有效；', '15258261888', '9710');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b016730bd06230020', '2018-11-20 10:49:13', '尊敬的用户，您好，您此次的验证码是4671；此验证码半个小时内有效；', '15258261888', '4671');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b016730c1a4050022', '2018-11-20 10:54:16', '尊敬的用户，您好，您此次的验证码是1548；此验证码半个小时内有效；', '13318780792', '1548');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b016730cdac480024', '2018-11-20 11:07:24', '尊敬的用户，您好，您此次的验证码是4052；此验证码半个小时内有效；', '13392563238', '4052');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b016730ce65480025', '2018-11-20 11:08:11', '尊敬的用户，您好，您此次的验证码是1730；此验证码半个小时内有效；', '13392563832', '1730');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b016730cf8ed30026', '2018-11-20 11:09:28', '尊敬的用户，您好，您此次的验证码是3648；此验证码半个小时内有效；', '13392563832', '3648');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b016730e5e2480027', '2018-11-20 11:33:51', '尊敬的用户，您好，您此次的验证码是2824；此验证码半个小时内有效；', '18270664855', '2824');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b016730e859910028', '2018-11-20 11:36:32', '尊敬的用户，您好，您此次的验证码是6279；此验证码半个小时内有效；', '18270664855', '6279');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b016730ea4d33002a', '2018-11-20 11:38:40', '尊敬的用户，您好，您此次的验证码是2179；此验证码半个小时内有效；', '13352691035', '2179');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b016731017ced002d', '2018-11-20 12:04:00', '尊敬的用户，您好，您此次的验证码是9567；此验证码半个小时内有效；', '18823810301', '9567');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b01673107465f002f', '2018-11-20 12:10:19', '尊敬的用户，您好，您此次的验证码是3773；此验证码半个小时内有效；', '18948788147', '3773');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b016731095f8b0031', '2018-11-20 12:12:37', '尊敬的用户，您好，您此次的验证码是3698；此验证码半个小时内有效；', '15012906768', '3698');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b01673146a22a0033', '2018-11-20 13:19:31', '尊敬的用户，您好，您此次的验证码是9267；此验证码半个小时内有效；', '15113996956', '9267');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b0167314f358a0035', '2018-11-20 13:28:53', '尊敬的用户，您好，您此次的验证码是2842；此验证码半个小时内有效；', '13420633006', '2842');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b01673154912e0037', '2018-11-20 13:34:45', '尊敬的用户，您好，您此次的验证码是4342；此验证码半个小时内有效；', '13352978178', '4342');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b0167315f3c130039', '2018-11-20 13:46:24', '尊敬的用户，您好，您此次的验证码是8817；此验证码半个小时内有效；', '17830981062', '8817');
INSERT INTO `t_message` VALUES ('2c9a2193672c4d9b016731690ca6003b', '2018-11-20 13:57:07', '尊敬的用户，您好，您此次的验证码是8770；此验证码半个小时内有效；', '13760338866', '8770');
INSERT INTO `t_message` VALUES ('2c9a219367316ef4016731773b630000', '2018-11-20 14:12:36', '尊敬的用户，您好，您此次的验证码是2495；此验证码半个小时内有效；', '13368222914', '2495');
INSERT INTO `t_message` VALUES ('2c9a219367316ef4016731daaefb0002', '2018-11-20 16:01:14', '尊敬的用户，您好，您此次的验证码是8426；此验证码半个小时内有效；', '15916370555', '8426');
INSERT INTO `t_message` VALUES ('2c9a219367316ef40167321542e40005', '2018-11-20 17:05:13', '尊敬的用户，您好，您此次的验证码是3691；此验证码半个小时内有效；', '18775797932', '3691');
INSERT INTO `t_message` VALUES ('2c9a219367316ef401673216993d0007', '2018-11-20 17:06:41', '尊敬的用户，您好，您此次的验证码是3789；此验证码半个小时内有效；', '18819133131', '3789');
INSERT INTO `t_message` VALUES ('2c9a219367316ef4016732a2f9e20008', '2018-11-20 19:40:00', '尊敬的用户，您好，您此次的验证码是3549；此验证码半个小时内有效；', '18775797932', '3549');
INSERT INTO `t_message` VALUES ('2c9a219367316ef4016732a65988000a', '2018-11-20 19:43:41', '尊敬的用户，您好，您此次的验证码是1141；此验证码半个小时内有效；', '18775797932', '1141');
INSERT INTO `t_message` VALUES ('2c9a219367316ef4016732c8a07f000c', '2018-11-20 20:21:08', '尊敬的用户，您好，您此次的验证码是6854；此验证码半个小时内有效；', '13710582395', '6854');
INSERT INTO `t_message` VALUES ('2c9a219367316ef4016732cb2b50000f', '2018-11-20 20:23:54', '尊敬的用户，您好，您此次的验证码是4832；此验证码半个小时内有效；', '13710582395', '4832');
INSERT INTO `t_message` VALUES ('2c9a219367316ef401673427ff6c0011', '2018-11-21 02:44:55', '尊敬的用户，您好，您此次的验证码是1966；此验证码半个小时内有效；', '15857724055', '1966');
INSERT INTO `t_message` VALUES ('2c9a219367316ef40167345075450013', '2018-11-21 03:29:07', '尊敬的用户，您好，您此次的验证码是6658；此验证码半个小时内有效；', '13368222914', '6658');
INSERT INTO `t_message` VALUES ('2c9a219367316ef401673456dccc0015', '2018-11-21 03:36:07', '尊敬的用户，您好，您此次的验证码是7413；此验证码半个小时内有效；', '17830981062', '7413');
INSERT INTO `t_message` VALUES ('2c9a219367316ef401673459b4270018', '2018-11-21 03:39:13', '尊敬的用户，您好，您此次的验证码是1119；此验证码半个小时内有效；', '17830981062', '1119');
INSERT INTO `t_message` VALUES ('2c9a219367316ef401673480ffc8001a', '2018-11-21 04:22:08', '尊敬的用户，您好，您此次的验证码是6740；此验证码半个小时内有效；', '13710582395', '6740');
INSERT INTO `t_message` VALUES ('2c9a219367316ef40167351de07d0020', '2018-11-21 07:13:29', '尊敬的用户，您好，您此次的验证码是6205；此验证码半个小时内有效；', '18775797932', '6205');
INSERT INTO `t_message` VALUES ('2c9a219367316ef40167352c37920022', '2018-11-21 07:29:09', '尊敬的用户，您好，您此次的验证码是9716；此验证码半个小时内有效；', '13539888831', '9716');
INSERT INTO `t_message` VALUES ('2c9a219367316ef40167352d2eb40023', '2018-11-21 07:30:12', '尊敬的用户，您好，您此次的验证码是3450；此验证码半个小时内有效；', '13539888831', '3450');
INSERT INTO `t_message` VALUES ('2c9a219367316ef40167353ca7460024', '2018-11-21 07:47:06', '尊敬的用户，您好，您此次的验证码是2981；此验证码半个小时内有效；', '13760758293', '2981');
INSERT INTO `t_message` VALUES ('2c9a219367316ef40167353ed2060025', '2018-11-21 07:49:28', '尊敬的用户，您好，您此次的验证码是5981；此验证码半个小时内有效；', '13928947945', '5981');
INSERT INTO `t_message` VALUES ('2c9a219367316ef40167354032900026', '2018-11-21 07:50:58', '尊敬的用户，您好，您此次的验证码是7498；此验证码半个小时内有效；', '13729845705', '7498');
INSERT INTO `t_message` VALUES ('2c9a219367316ef40167359197f70028', '2018-11-21 09:19:53', '尊敬的用户，您好，您此次的验证码是7065；此验证码半个小时内有效；', '18823810301', '7065');
INSERT INTO `t_message` VALUES ('2c9a219367316ef4016735a1fd89002b', '2018-11-21 09:37:47', '尊敬的用户，您好，您此次的验证码是6217；此验证码半个小时内有效；', '18819133131', '6217');
INSERT INTO `t_message` VALUES ('2c9a219367316ef4016735ae87be002d', '2018-11-21 09:51:29', '尊敬的用户，您好，您此次的验证码是3548；此验证码半个小时内有效；', '18823810301', '3548');
INSERT INTO `t_message` VALUES ('2c9a21936736546101673657bfa00000', '2018-11-21 12:56:19', '尊敬的用户，您好，您此次的验证码是1540；此验证码半个小时内有效；', '18819449983', '1540');
INSERT INTO `t_message` VALUES ('2c9a21936736546101673657c1d30001', '2018-11-21 12:56:20', '尊敬的用户，您好，您此次的验证码是2631；此验证码半个小时内有效；', '18819449983', '2631');
INSERT INTO `t_message` VALUES ('2c9a2193673654610167365c7dfb0002', '2018-11-21 13:01:30', '尊敬的用户，您好，您此次的验证码是5783；此验证码半个小时内有效；', '18819449983', '5783');
INSERT INTO `t_message` VALUES ('2c9a219367365461016736789a930004', '2018-11-21 13:32:12', '尊敬的用户，您好，您此次的验证码是9302；此验证码半个小时内有效；', '15768884994', '9302');

-- ----------------------------
-- Table structure for `t_miner`
-- ----------------------------
DROP TABLE IF EXISTS `t_miner`;
CREATE TABLE `t_miner` (
  `id` int(11) NOT NULL,
  `price` float NOT NULL,
  `profit` float NOT NULL,
  `remark` longtext COLLATE utf8_unicode_ci,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `monthly_income` float NOT NULL,
  `return_time` int(11) NOT NULL,
  `generation` float NOT NULL,
  `infinite_generation` float NOT NULL,
  `two_generation` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_miner
-- ----------------------------
INSERT INTO `t_miner` VALUES ('1', '13800', '100', '矿机规格参数：</br>\n1.适用算法：Ethash</br>\n2.额定算力：190 MH/s±5%</br>\n3.墙上功耗：760 W +10%（APW3++电源，AC / DC 93％的效率，25℃环境温度）</br>\n4.电源效率：4J/MH +10%（APW3++电源，AC / DC 93％的效率，25℃环境温度）</br>\n5.额定电压：11.6~13.0V</br>\n6.整机重量（含包装）：11 kg</br>\n7.工作温度：0-40 ℃。</br>\n8.冷却：2×12038风扇</br>\n9.工作湿度：5%RH-95%RH，非凝露</br>\n10.噪音：76 dB</br>\n11.网络连接：以太网</br>', '算力T2矿机(1台)', 'http://39.98.58.74:8081/upload/2018-11-07/1541562624719.jpg', '3000', '138', '0', '0', '0');
INSERT INTO `t_miner` VALUES ('2', '26800', '210', '矿机规格参数：</br>\n额定算力	ETH 230MH/s ±5％</br>\n墙上功耗	ETH 1300瓦 ±10%</br>\n电源效率	2000瓦电源， 效率约93％，25℃环境温度</br>\n显卡数量	RX 570*8</br>\n外形尺寸	620mm(L) * 360mm(W) * 180mm(H)</br>\n工作温度	0℃至40℃</br>\n工作湿度	5%RH-95%RH，非凝露</br>\n网络连接	以太网</br>\nCPU	Intel(R) Celeron(R) CPU 3865U @ 1.80GHz, 1800 MHz</br>\n安装内存	4GB</br>\n系统类型	64位操作系统，基于x64的处理器</br>\n系统	Windows 10</br>', '算力T3矿机(1台)', 'http://39.98.58.74:8081/upload/2018-11-07/1541562609984.jpg', '6300', '126', '0', '0', '0');
INSERT INTO `t_miner` VALUES ('3', '59800', '500', '矿机规格参数：</br>\n额定算力	ETH 230MH/s ±5％ ZEC 2050H/s XMR 5520H/S</br>\n墙上功耗	ETH 1250瓦+10% ZEC 1025瓦+10% XMR 980瓦+10%</br>\n电源效率	1600瓦电源， 效率约93％，25℃环境温度</br>\n额定电压	220 V</br>\n显卡数量	 AMD RX 474*8张</br>\n显存	4 G</br>\n外形尺寸	490毫米（L）*280毫米（W）*170毫米（H）</br>\n毛重	14.7 KG</br>\n净重	13 KG</br>\n冷却	3*2风扇</br>\n噪音	80 dB</br>\n工作温度	0℃至40℃</br>\n工作湿度	5%RH-95%RH，非凝露</br>\n网络连接	以太网</br>\n电源连接方式	每台显卡矿机7个6pin口都需要连接，推荐使用独立电源给整机供电</br>\nCPU	Inter(R) Celeron(R) CPU 3215U @1.70 GHZ</br>\n内存	4GB</br>\n系统类型	64位操作系统，基于x64的处理器</br>\n系统	Windows 10</br>', '小矿主(5台)', 'http://39.98.58.74:8081/upload/2018-11-07/1541562595937.jpg', '15000', '120', '0', '0.08', '0');
INSERT INTO `t_miner` VALUES ('4', '118800', '1000', '矿机规格参数：</br>\n额定算力	ETH 230MH/s ±5％ ZEC 2050H/s XMR 5520H/S</br>\n墙上功耗	ETH 1250瓦+10% ZEC 1025瓦+10% XMR 980瓦+10%</br>\n电源效率	1600瓦电源， 效率约93％，25℃环境温度</br>\n额定电压	220 V</br>\n显卡数量	 AMD RX 474*8张</br>\n显存	4 G</br>\n外形尺寸	490毫米（L）*280毫米（W）*170毫米（H）</br>\n毛重	14.7 KG</br>\n净重	13 KG</br>\n冷却	3*2风扇</br>\n噪音	80 dB</br>\n工作温度	0℃至40℃</br>\n工作湿度	5%RH-95%RH，非凝露</br>\n网络连接	以太网</br>\n电源连接方式	每台显卡矿机7个6pin口都需要连接，推荐使用独立电源给整机供电</br>\nCPU	Inter(R) Celeron(R) CPU 3215U @1.70 GHZ</br>\n内存	4GB</br>\n系统类型	64位操作系统，基于x64的处理器</br>\n系统	Windows 10</br>', '大矿主(10台)', 'http://39.98.58.74:8081/upload/2018-11-07/1541562583219.jpg', '30000', '118', '0', '0.1', '0');
INSERT INTO `t_miner` VALUES ('207', '6800', '50', '1.额定算力：14.5TH/s±5％</br>\n2.墙上功耗：1365W+10%（墙上，AC/DC 93％的效率，25°C的环境温度）</br>\n3.电源效率：94.14J/TH+10%（墙上，AC/DC 93％的效率，25°C的环境温度）</br>\n4.额定电压：11.6~13.0V</br>\n5.外箱尺寸：445毫米（L）*215毫米（W）*255毫米（H）</br>\n6.冷却：2×12038风扇</br>\n7.工作温度：0℃至40℃</br>\n8.工作湿度：5%RH-95%RH，非凝露</br>\n9.网络连接：以太网</br>\n10.噪音：76dB</br>\n11.整机重量：矿机5.5kg+电源2.5kg</br>', '算力T1矿机', 'http://39.98.58.74:8081/upload/2018-11-07/1541562561734.jpg', '1500', '142', '0', '0', '0');

-- ----------------------------
-- Table structure for `t_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `id` int(11) NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `column_id` int(11) DEFAULT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqh519pgk6i9vll1looqadjvby` (`column_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('30192', '2018-11-15 18:41:00', '<p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">双十一的神话再次刷屏，但今年破纪录的数据背后又隐藏着另外一些新生力量的萌芽，未来的双十一会是什么样子呢？</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: unset; line-height: 30px; margin-bottom: 30px;\">全球独一档的中国电商</strong></p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">昨天，朋友圈里多了这两拨人，一边大喊“断网保平安”，另一边高呼“剁手大法好”，当然，价格敏感型消费者（穷人）的数量取得了压倒胜利，嘴上说不要，双手还是很实诚，从早到晚，土豪们根本没停止过晒单行为。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">截止至11月12日零点，双十一的开创者天猫当日的销售额揭晓：好家伙，2135亿！整整比一年前增长了四百多亿。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">就这还消费降级呢？说好的一起到白头，你却偷偷焗了油。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\"><img src=\"https://img.jinse.com/1316390_image3.png\" alt=\"jwcIuZ8qeESwE2AOVLkTZMIiAVk0VBrkAokrXD1T.jpeg\"/></p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">乍一看，数据很爆炸，形势也很喜人，然而，不得不提的是，今年不光是天猫第十个的双十一，也是马爸爸卸任阿里董事长前的最后一个双十一。没有了马云的阿里会否像后乔布斯时代的苹果一样，迎来阵痛期吗？关于这个问题，现在恐怕还没有人敢一口咬定。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">但可以肯定，在搞电商促销方面，能够打败天猫的人还没有出现。不光是国内“猫狗狮”的其余两家，就算放眼全球，2135亿这个数字，也已经变成了一个不可跨越的鸿沟。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">天猫说，你们一起上吧，我赶时间。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">举一个例子，零点过后的短短10分钟内，天猫成交额就已经超过了美国最成功的购物节——由亚马逊在今年山寨双十一而来的Prime Day，它在36个小时的销售总和是42亿美元。没错，这根本不是一个量级的比拼。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">事实上，不光是亚马逊，即使是整个北美的黑五，在双十一面前，也只不过是一个“弟弟”。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">这是所有人都无法预料的，在2009年，饱受假货风波下成立的淘宝商城，步步为营，发展缓慢，在那场中国电商的大乱斗中，双十一的初衷很单纯，就是为了让淘宝活下去。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">甚至于有这样的一个小插曲：第一个双十一GMV达到5000万元，打算拍照留念的淘宝员工，发现少了一张“0”，便一把将墙上的挂钟拿下来凑够数。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: unset; line-height: 30px; margin-bottom: 30px;\">双十一改变中国</strong></p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">无论多么困难，多么地有戏剧性，它确实做到了，双十一改变了中国的方方面面，我们不妨简单盘点下有哪些领域受到影响。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: unset; line-height: 30px; margin-bottom: 30px;\">互联网</strong></p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">首先是互联网的基础设施建设。如果你是网购老司机，早早就加入双十一剁手大军，那你一定对前几年的惨痛经历记忆犹新。当时，瞬间涌入的海量流量一下子就把淘宝的网站冲垮了，不仅页面无法打开、在线支付也遭遇到严重拥堵。后果很直接，一秒钟的故障发生在关键时刻，很可能就意味着千万级的损失。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">不过，有需求，就有往前走的动力。如今，“土豆服务器”进了历史书，取而代之的是一连串惊人的数据：2018年双十一期间，阿里云上新增调用的弹性计算能力累计超过1000万核，相当于10座大型数据中心，创造了“脉冲计算”的新纪录。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">同时，除了天猫、淘宝之外，阿里云还服务了中国邮政、茅台等众多客户，为物流、支付、新零售等各行业提供强有力的计算服务。从线上到线下，从生产制造到物流配送，从国内到海外，也多亏双十一的磨练，让阿里云的计算能力延伸到各行各业，极大地降低了社会的计算成本。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: unset; line-height: 30px; margin-bottom: 30px;\">物流</strong></p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">然后是物流。随着交易额的不断攀升，2018年天猫双十一的物流订单也在飞速增长，16小时48分钟，2018年天猫双十一物流订单达8.12亿，超过2017年双十一全天订单量，相当于十年前天猫双十一全天物流订单量的3100余倍。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\"><img src=\"https://img.jinse.com/1316391_image3.png\" alt=\"2bM5TRYYkytccXeb78LDqZ0Od9qopbcL2voVsPXP.jpeg\"/></p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">快递爆仓的情景还历历在目，在今年，我狠心拍下的iPhone XS还要等到天荒地老才能拆包吗？</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">时过境迁，在超级机器人分拨中心里，机器人昼夜作业，每天可分拣超50万只包裹，据统计，一个分拨中心的机器人三天的行驶里程就足以绕地球一圈，这是十年前还很难想象的场景。那个时候，不管是分拨中心还是中转仓库，基本还是以手工操作为主，“暴力分拣”屡被诟病。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">毫无疑问，双十一的十年，中国快递物流行业完成了从拼人力、粗放经营，到数字化、智能化应用的转变。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: unset; line-height: 30px; margin-bottom: 30px;\">消费习惯</strong></p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">再者就是消费习惯。事实上，中国最早的电子商务网站可以追溯至1999年的8848网站，但这终究只是铺垫。网民基础薄弱，缺乏支付途径等，这些因素都注定让电商行业成功起飞。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">但现在不一样了，网购不在是年轻人的专利，智能手机普及后，大爷大妈都学会网购了。根据中国电子商务研究中心此前发布的《2018年（上）中国网络零售市场数据监测报告》，2018年上半年国内网络零售市场交易规模达40810亿元，同比增长30.1%。中国社会消费品零售总额180018亿元，同比增长9.4%。 也就是说，上半年国内网络零售市场交易规模已占据社会消费品零售总额的22.7%。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">当外国人还习惯到沃尔玛购物的时候，中国的网购大妈已经领先全球。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: unset; line-height: 30px; margin-bottom: 30px;\">区块链上车了</strong></p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">除此之外，包括移动支付在内，还有无数行业因为双十一的诞生、发展，坐上了快速列车。在今年，更有一个新乘客格外引人注目，它就是区块链。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">蚂蚁区块链技术首次全面参与了今年的“天猫双十一”活动。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">其中，天猫和比利时安特卫普钻石交易所正式达成合作，双十一期间“比利时钻石馆”里的每一颗钻石都会附上唯一的区块链“身份证”，用支付宝、天猫、淘宝扫一扫，就能看到它从海外采购到国内配送等重要环节的全链路信息。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\"><img src=\"https://img.jinse.com/1316396_image3.png\" alt=\"WYUZHMCKtIVcDdLGadSwvFg7wkCNsVH5AdG7pDaA.jpeg\"/></p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">不只是昂贵的钻石，蚂蚁区块链商品溯源技术还应用到了另一些商品中，如广泛进口的国外奶粉、美妆、保健品，中国的茅台等高端酒、以及五常大米、平武蜂蜜等地方特产。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">有别于商家自主录入商品信息，天猫平台建立的这套智能追溯体系，通过蚂蚁区块链技术将钻石商品溯源系统数据以联盟链形式上链，实现数据的透明、不可篡改、充分共享等功能。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">其实早在今年1月，区块链就在支付宝中得以应用。蚂蚁金服则是在2016年就接入蚂蚁区块链了。这表明，阿里巴巴在区块链出现早期就已开始了布局。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">目前，蚂蚁区块链技术有许多场景已经落地。根据官方公布的资料显示，截至目前，蚂蚁金服区块链技术已经进入公益溯源、商品溯源、城市服务、跨境支付、司法维权和供应链金融等六大领域。例如，在浙江上线全国首个区块链医疗电子票据、和海南省政府合作推出全国首个区块链公积金存证、和杭州互联网法院共同上线全球首个司法链、在香港和菲律宾推出全球首个区块链跨境汇款等。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: unset; line-height: 30px; margin-bottom: 30px;\">INE——全新的共享网络时代</strong></p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">不难看出，近年来，区块链技术以其开放性、透明性、不可篡改、匿名性和去中心化等特点被业界广泛关注，个中不乏具有前瞻性的技术项目，INE智联生态是其中之一。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">IntelliShare（INE）由深圳、硅谷、上海三支团队组成，由旅美18年、早期在硅谷从事数据处理与研究的熊羽睿领军，多个国内外技术人员参与，顾问方面则由从事互联网近20年工作后，与万向区块链实验室的肖风博士一起捐助了早期以太坊中国社区的符德坤先生、原上海浦东软件园总工程师Eric Zhu博士、纽约州立大学布法罗分校的ThinkLab区块链实验室负责人的Bina Ramamurthy博士领衔，阵容堪称豪华。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\"><img src=\"https://img.jinse.com/891007_image3.png\" alt=\"tUrcYLtyI1s5IcRrI4qVhMkVI0o7wryR9ABCF9SD.jpeg\"/></p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">IBM预测2020年万物互联的设备将超过250亿个，将有巨大的通讯需求，依靠传统网络技术传输数据会产生极其高昂的网络运营成本。为此，INE构建了一个具有分布式传输功能，能够优化Lora、NB-lot的INE Mesh网络，不仅能保障数据的安全，还让物联网企业避免耗巨资建设自己的专网，节约物联网企业80%的成本。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">广阔的应用场景</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">在未来，INE可保证多种智能设备方便快捷地完成点对点数据低成本传输，为互联网领域的多种应用场景提供数据传输底层网络环境。 既然谈到双十一，我们可以假设一个这样的场景，11月10日23时59分，当你聚精会神，正准备秒杀降价商品时，画面却突然静止，只剩下屏幕中央的不断旋转的图标——网络拥堵又一次让你与神价格擦肩而过。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">传统移动运营商采取的NB-IoT、LTE中心化模式，让所有信号都通过基站传导到中心的服务器集群，但当使用量大时，就很容易出现网络拥堵的问题。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">而IntelliShare Mesh通过其特有的网池技术突破设备数量的限制，即相互连接的节点不随着其数量的快速增加而产生相应的拥堵问题，随时保持网络通畅与多跳特性。日后，随着INE项目的应用场景的落地，越来越多人将真正享受到双十一秒杀的乐趣。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\"><img src=\"https://img.jinse.com/1316397_image3.png\" alt=\"prraesmVzSQeuBrjRrdg5Iu5nIlAvyNFwOALBoJK.jpeg\"/></p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">另外，也许你无法想象，目前，世界仍然有很多地区比较贫穷落后，大约有40亿人口从未接入互联网。由于财力不足和地理位置过偏、人口密度过于稀疏等问题，不可能在这些地区进行大量的电信基础建设，那里的人们完全处于“无网”的状态。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">相对于造价高昂的传统通讯模式，IntelliShare依靠区块链+Mesh网络的技术特点，只需要低廉的成本既可以让用户在无网环境下相互通讯，也可以通过节点跳跃进入广域互联网与世界同步。不久之后的某一天，那些住在地球另一端的人们很可能会受惠于INE，成为网购消费者的员，从此，天涯还是海角，想购就购。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: unset; line-height: 30px; margin-bottom: 30px;\"><br/></strong></p><p><br/></p><br/>', '双十一改变中国 区块链改变未来', 'http://crawl.nosdn.127.net/992534f6714a1cf96fbc03ab2811e8f1.jpg', '1', '21');
INSERT INTO `t_notice` VALUES ('30204', '2018-11-13 03:29:00', '<p><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 亲爱的共享矿场家人们，为了更好地为您服务，提醒您在转账时务必认真审核项目方收币地址，并上传真实的转账截图凭证。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 近期公司将在您的专属矿机上贴上您的名字，提醒您记得在APP内修改您的昵称哦！感谢您一直以来对我们的支持与陪伴，谢谢！<br/>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 共享矿场市场运营部</p>', '会员手册', '', '2', '7');
INSERT INTO `t_notice` VALUES ('30205', '2018-11-13 03:31:00', '<p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">如果将区块链技术运用在现实生活中，我们的生活将会被大大改变。类似于互联网商用化以后，带来的变化。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">从前，信息都是中央集中管理，但是在区块链的世界中信息是复制保存在许多电脑中的。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">每个人都能接收并且传送信息，任何人都可以查到，所以账本的交易内容都是透明的。因为有多人检查信息，所以透明性和安全性都很高。区块链如果运用到我们的生活当中，我们将更加便利。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">假设有一个人每天早上7点都会去咖啡店买一杯咖啡，这是需要本人亲自去买的。但是如果在运用区块链技术，就可以记录下每个人的要求，结合IoT与AI，每天把咖啡配送到家中。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">饭店使用的肉·菜·海鲜的生产地，一般都是会贴在店里的墙上，但是这些的真实性我们是没有办法进行确认的。我们只能相信老板的一面之词。但是有了区块链技术就不一样了，我们可以随时通过手机查询信息。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">离职时总是要与前公司申请经历证明，这是很麻烦的。但是如果有区块链技术的话只要同意提供信息，你的信息马上就可以被新的公司查询。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">“区块链技术就是以记录·传达·信任形成的，传达是P2P，效率是人工智能，连接是loT。各种的ICBM技术相结合，将出现一个新的世界。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">相关人士说到“个人对个人的交易，可以提高信任度，但是这一技术我们只是弄懂了它的原理，并没有完美的实现”“区块链技术可以提高数据流量的透明度，但是只需技术相关人员就可以轻易的控制它”</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">所以也有人，对区块链抱有警戒的心理。区块链是要颠覆我们信任已久的东西，让我们信任其他技术与系统。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">而且如果导入区块链技术的话，我们可能会失去“忘记”的权利。有些想永远忘记的事情，可能会通过区块链技术，永久留存下来。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: center; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\"><img src=\"https://img.jinse.com/1277413_image3.png\" alt=\"区块链技术将如何改变世界\"/></p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\"></p><p><br/></p>', '区块链技术将如何改变世界', 'http://img.sccnn.com/bimg/341/03454.jpg', '1', '14');
INSERT INTO `t_notice` VALUES ('30206', '2018-11-13 03:32:00', '<p>尊敬的用户您好！为响应国家互联网全面实名制的号召，从即日起，“共享矿场”平台的所有用户均需完成用户实名验证，否则无法正常使用矿机产品和imToken钱包提现功能！</p><p>（最终解释权归共享矿场平台所有）</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;共享矿场运营中心 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2018年11月16日官宣</p><p><br/></p>', '关于平台账号实名制的公告', '', '2', '4');
INSERT INTO `t_notice` VALUES ('30207', '2018-11-15 16:33:00', '<p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">区块链在实体行业中的应用一直难以落地，原因众多，对几十家区块链创业团队进行采访之后，发现了以下三点主要原因：</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">&nbsp;</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">1.&nbsp;技术门槛高</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">不仅区块链对大众理解的门槛太高，同时水平参差不齐的开发者们所编写的智能合约总有这样或者那样的漏洞，严重影响用户体验。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">2.&nbsp;隔行如隔山</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">每个行业都有各自的运行规则与生产逻辑，无视现实的理想化设计在理论上看似美好，但终究都招架不住现实的考验。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">3.&nbsp;体系不完备</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">在互联网时代，发现市场的痛点并不难，可是想要客观解析痛点，还必须要在行业中经历大量的实践并且不断反思才行。而在区块链产业需要的市场体系还不完备的情况下，要从具体的场景应用上解决问题，往往超出了单一项目和团队的能力。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">&nbsp;</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">显然，一个区块链项目想要落地，只懂区块链技术是远远不够的，还要清楚产业逻辑，要懂得行业规则，更得有深度的调研积累，能够深刻分析市场痛点。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">&nbsp;</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">这不仅对开发者提出了超高的要求，并且需要大量的时间成本和资源成本的支持。这很像是一场越野马拉松，要翻的山、要过的坑实在是太多了，要到达终点，开发者必须要能沉住气，一步一个脚印的前行。但现实是开发者往往既没有人力，又没有时间，更没有资源，大家能做的只能是冲刺。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">于是大量的开发者将自己累死在了赛道的开始阶段，好一些的摔死在了半路的暗坑中，只有极个别幸运的，猝死在了离终点两公里的地方。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">&nbsp;</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">这说明，区块链产业的发展不但需要项目开发者的逐渐成熟，也需要第三方服务的逐步支持。正如做电商不仅需要开网店，更需要支付宝、物流体系等业务的落地和支撑。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">区块链创业项目的繁荣与第三方服务体系的繁荣相辅相成。当前，区块链业界已经涌现出了专业法律服务、上链上币服务、智能合约服务、社群运营服务、媒体推广服务、技术测评服务等众多第三方服务内容，但他们和区块链项目方一样，依然面临着标准化、规范化的问题，和公信力、专业性的考验。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">&nbsp;</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">充分认识到了第三方服务体系的重要作用，我们将用自己的力量，为项目方提供诉求发布的视频形态和媒体平台，为第三方服务对接市场资源和客户需求，为区块链信息的价值呈现，探索业内与业外交互融合的服务模式，实现存量市场和增量用户间的有效协同。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">&nbsp;</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">将通过视频表达诉求的发布和对接，推动高价值信息上链经营，推动 “区块链+” 项目以智能合约的形态达成合作。</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">&nbsp;</p><p style=\"margin: 32px 0px; padding: 0px; font-size: 18px; line-height: 36px; word-wrap: break-word; word-break: normal; color: rgb(41, 41, 59); text-align: justify; font-family: &#39;PingFang SC&#39;, &#39;Lantinghei SC&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, &#39;\\\\微软雅黑&#39;, STHeitiSC-Light, simsun, &#39;\\\\宋体&#39;, &#39;WenQuanYi Zen Hei&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">欢迎更多想要抓住区块链风口，实现 “区块链+” 转型的传统企业与我们联系，共同探索 “区块链+” 的策略和方案，并在《共享矿场》上进行信息对接与价值整合，共同实现业务的区块链化，让更直观的第三方信息服务体系为区块链项目的经营插上翅膀</p><p><br/></p>', '区块链的发展不能只看链与币更需要繁荣的第三方服务体系', 'http://wx3.sinaimg.cn/crop.0.0.889.499.1000/006W9mQogy1fo5qizqj2qj30p00dwaum.jpg', '1', '10');
INSERT INTO `t_notice` VALUES ('30208', '2018-11-13 03:34:00', '', '      ', '', '2', '0');

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `order_status` int(11) DEFAULT NULL,
  `pay_type` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `miner_id` int(11) DEFAULT NULL,
  `price` float NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7vl2uexq9qn4leiik629dox5x` (`miner_id`),
  KEY `FKho2r4qgj3txpy8964fnla95ub` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('144504', '2018-11-20 15:04:36', '0', '0', '2018-11-20 15:04:36', '2c9a2193672c4d9b01673169ad1c003c', '3', '59800', '1');
INSERT INTO `t_order` VALUES ('144516', '2018-11-20 15:56:53', '0', '0', '2018-11-20 15:56:53', '2c9a21936727600a016727aa9d000008', '1', '13800', '1');
INSERT INTO `t_order` VALUES ('144536', '2018-11-20 16:00:27', '0', '0', '2018-11-20 16:00:27', '2c9a21936727600a01672b0235b7004c', '3', '59800', '1');
INSERT INTO `t_order` VALUES ('144542', '2018-11-20 16:11:29', '0', '0', '2018-11-20 16:11:29', '2c9a21936727600a016727ba812d001a', '3', '59800', '1');
INSERT INTO `t_order` VALUES ('144544', '2018-11-20 16:19:18', '0', '0', '2018-11-20 16:19:18', '2c9a21936727600a016727b460440014', '4', '118800', '1');
INSERT INTO `t_order` VALUES ('144547', '2018-11-20 16:40:50', '0', '0', '2018-11-20 16:40:50', '2c9a21936727600a01672b033b5f004e', '3', '59800', '1');
INSERT INTO `t_order` VALUES ('144589', '2018-11-21 07:00:44', '0', '0', '2018-11-21 07:00:44', '2c9a21936727600a016727b5d7e10016', '3', '59800', '1');
INSERT INTO `t_order` VALUES ('144593', '2018-11-21 07:06:35', '0', '0', '2018-11-21 07:06:35', '2c9a21936727600a016727af77eb000c', '1', '13800', '1');
INSERT INTO `t_order` VALUES ('144595', '2018-11-21 07:07:50', '0', '0', '2018-11-21 07:07:50', '2c9a21936727600a016727b32c970012', '1', '13800', '1');
INSERT INTO `t_order` VALUES ('144598', '2018-11-21 07:10:19', '0', '0', '2018-11-21 07:10:19', '2c9a21936727600a01672b0106dc004a', '1', '13800', '1');
INSERT INTO `t_order` VALUES ('144600', '2018-11-21 07:11:28', '0', '0', '2018-11-21 07:11:28', '2c9a21936727600a016727b211920010', '207', '6800', '1');
INSERT INTO `t_order` VALUES ('144611', '2018-11-21 07:37:18', '0', '0', '2018-11-21 07:37:18', '2c9a21936727600a016727bcf5f6001e', '1', '13800', '1');
INSERT INTO `t_order` VALUES ('144613', '2018-11-21 07:50:24', '0', '0', '2018-11-21 07:50:24', '2c9a21936727600a01672afcb0140044', '3', '59800', '1');
INSERT INTO `t_order` VALUES ('144616', '2018-11-21 09:04:28', '0', '0', '2018-11-21 09:04:28', '2c9a2193672c4d9b0167314facbd0036', '3', '59800', '1');
INSERT INTO `t_order` VALUES ('144619', '2018-11-21 09:27:12', '0', '0', '2018-11-21 09:27:12', '2c9a21936727600a016727bbe793001c', '2', '20000', '1');
INSERT INTO `t_order` VALUES ('144623', '2018-11-21 09:48:41', '0', '0', '2018-11-21 09:48:41', '2c9a21936727600a01672aff2e340048', '1', '13800', '1');
INSERT INTO `t_order` VALUES ('144625', '2018-11-21 09:51:09', '0', '0', '2018-11-21 09:51:09', '2c9a21936727600a01672afe0eba0046', '1', '7000', '1');
INSERT INTO `t_order` VALUES ('144628', '2018-11-21 12:21:36', '0', '0', '2018-11-21 12:21:36', '2c9a21936727600a016727b885da0018', '1', '13800', '1');
INSERT INTO `t_order` VALUES ('144630', '2018-11-21 12:22:24', '0', '0', '2018-11-21 12:22:24', '2c9a21936727600a016727b0a89b000e', '1', '13800', '1');
INSERT INTO `t_order` VALUES ('144632', '2018-11-21 12:59:28', '0', '0', '2018-11-21 12:59:28', '2c9a2193672c4d9b0167314a1bef0034', '207', '6800', '1');
INSERT INTO `t_order` VALUES ('144638', '2018-11-21 13:07:59', '0', '0', '2018-11-21 13:07:59', '2c9a21936727600a016727a896810006', '207', '6800', '1');
INSERT INTO `t_order` VALUES ('144641', '2018-11-21 13:09:51', '0', '0', '2018-11-21 13:09:51', '2c9a21936727600a016727ad1f94000a', '2', '26800', '1');
INSERT INTO `t_order` VALUES ('144645', '2018-11-21 13:13:16', '0', '0', '2018-11-21 13:13:16', '2c9a21936727600a016727fbf538002e', '207', '6800', '1');
INSERT INTO `t_order` VALUES ('144648', '2018-11-21 13:14:58', '0', '0', '2018-11-21 13:14:58', '2c9a21936727600a016727f1c00f0026', '207', '6800', '1');
INSERT INTO `t_order` VALUES ('144651', '2018-11-21 13:16:46', '0', '0', '2018-11-21 13:16:46', '2c9a21936727600a016727f9578b002c', '207', '6800', '1');
INSERT INTO `t_order` VALUES ('144654', '2018-11-21 13:18:47', '0', '0', '2018-11-21 13:18:47', '2c9a21936727600a016727f7d5110028', '207', '6800', '1');
INSERT INTO `t_order` VALUES ('144657', '2018-11-21 13:20:42', '0', '0', '2018-11-21 13:20:42', '2c9a21936727600a016727f87f89002a', '1', '13800', '1');

-- ----------------------------
-- Table structure for `t_revenue_record`
-- ----------------------------
DROP TABLE IF EXISTS `t_revenue_record`;
CREATE TABLE `t_revenue_record` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `money` float NOT NULL,
  `miner_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `revenue_status` int(11) DEFAULT NULL,
  `revenue_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKiqxap05vd6vqhmkwmq3j5ofdh` (`miner_id`),
  KEY `FKmfex09p2vk6felr68afc7452j` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_revenue_record
-- ----------------------------
INSERT INTO `t_revenue_record` VALUES ('144299', '2018-11-18 15:15:08', '50', null, '2c9a21936727600a01672763c3db0001', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144304', '2018-11-18 16:20:43', '50', null, '2c9a21936727600a0167279fccef0004', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144306', '2018-11-18 16:30:19', '50', null, '2c9a21936727600a016727a896810006', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144308', '2018-11-18 16:32:32', '50', null, '2c9a21936727600a016727aa9d000008', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144310', '2018-11-18 16:35:16', '50', null, '2c9a21936727600a016727ad1f94000a', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144312', '2018-11-18 16:37:50', '50', null, '2c9a21936727600a016727af77eb000c', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144314', '2018-11-18 16:39:08', '50', null, '2c9a21936727600a016727b0a89b000e', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144316', '2018-11-18 16:40:40', '50', null, '2c9a21936727600a016727b211920010', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144318', '2018-11-18 16:41:53', '50', null, '2c9a21936727600a016727b32c970012', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144320', '2018-11-18 16:43:11', '50', null, '2c9a21936727600a016727b460440014', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144322', '2018-11-18 16:44:47', '50', null, '2c9a21936727600a016727b5d7e10016', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144324', '2018-11-18 16:47:43', '50', null, '2c9a21936727600a016727b885da0018', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144326', '2018-11-18 16:49:53', '50', null, '2c9a21936727600a016727ba812d001a', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144328', '2018-11-18 16:51:25', '50', null, '2c9a21936727600a016727bbe793001c', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144330', '2018-11-18 16:52:34', '50', null, '2c9a21936727600a016727bcf5f6001e', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144332', '2018-11-18 16:53:55', '50', null, '2c9a21936727600a016727be323f0020', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144335', '2018-11-18 17:09:58', '50', null, '2c9a21936727600a016727cce2ae0022', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144337', '2018-11-18 17:25:30', '50', null, '2c9a21936727600a016727db1da00024', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144340', '2018-11-18 17:50:14', '50', null, '2c9a21936727600a016727f1c00f0026', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144342', '2018-11-18 17:56:52', '50', null, '2c9a21936727600a016727f7d5110028', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144344', '2018-11-18 17:57:36', '50', null, '2c9a21936727600a016727f87f89002a', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144346', '2018-11-18 17:58:31', '50', null, '2c9a21936727600a016727f9578b002c', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144348', '2018-11-18 18:01:23', '50', null, '2c9a21936727600a016727fbf538002e', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144352', '2018-11-18 18:04:18', '50', null, '2c9a21936727600a016727fea2660032', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144354', '2018-11-18 18:06:16', '50', null, '2c9a21936727600a016728006fb40034', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144357', '2018-11-19 05:14:25', '50', null, '2c9a21936727600a01672a6424df003a', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144359', '2018-11-19 07:50:01', '50', null, '2c9a21936727600a01672af2999f003c', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144361', '2018-11-19 07:56:32', '50', null, '2c9a21936727600a01672af89339003e', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144363', '2018-11-19 07:57:34', '50', null, '2c9a21936727600a01672af982aa0040', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144365', '2018-11-19 07:59:02', '50', null, '2c9a21936727600a01672afada7a0042', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144367', '2018-11-19 08:01:02', '50', null, '2c9a21936727600a01672afcb0140044', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144369', '2018-11-19 08:02:32', '50', null, '2c9a21936727600a01672afe0eba0046', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144371', '2018-11-19 08:03:45', '50', null, '2c9a21936727600a01672aff2e340048', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144373', '2018-11-19 08:05:46', '50', null, '2c9a21936727600a01672b0106dc004a', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144375', '2018-11-19 08:07:04', '50', null, '2c9a21936727600a01672b0235b7004c', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144377', '2018-11-19 08:08:11', '50', null, '2c9a21936727600a01672b033b5f004e', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144416', '2018-11-19 16:00:00', '0', '4', '2c9a21936727600a0167279fccef0004', '0', '0');
INSERT INTO `t_revenue_record` VALUES ('144457', '2018-11-20 05:11:56', '50', null, '2c9a2193672c4d9b01672f883abf000f', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144460', '2018-11-20 10:05:03', '50', null, '2c9a2193672c4d9b0167309494fd0019', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144463', '2018-11-20 10:49:56', '50', null, '2c9a2193672c4d9b016730bdadcd0021', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144465', '2018-11-20 10:58:15', '50', null, '2c9a2193672c4d9b016730c54c7c0023', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144473', '2018-11-20 11:37:49', '50', null, '2c9a2193672c4d9b016730e9861b0029', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144478', '2018-11-20 13:23:19', '50', null, '2c9a2193672c4d9b0167314a1bef0034', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144480', '2018-11-20 13:29:24', '50', null, '2c9a2193672c4d9b0167314facbd0036', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144482', '2018-11-20 13:34:52', '50', null, '2c9a2193672c4d9b01673154aed80038', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144484', '2018-11-20 13:46:47', '50', null, '2c9a2193672c4d9b0167315f9714003a', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144486', '2018-11-20 13:57:48', '50', null, '2c9a2193672c4d9b01673169ad1c003c', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144488', '2018-11-20 14:13:24', '50', null, '2c9a219367316ef401673177f57c0001', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144524', '2018-11-20 16:00:00', '0', '4', '2c9a21936727600a0167279fccef0004', '0', '0');
INSERT INTO `t_revenue_record` VALUES ('144565', '2018-11-20 19:59:12', '0', '4', '2c9a21936727600a0167279fccef0004', '0', '1');
INSERT INTO `t_revenue_record` VALUES ('144567', '2018-11-20 20:00:26', '0', '4', '2c9a21936727600a0167279fccef0004', '0', '1');
INSERT INTO `t_revenue_record` VALUES ('144568', '2018-11-20 20:01:09', '0', '4', '2c9a21936727600a0167279fccef0004', '0', '1');
INSERT INTO `t_revenue_record` VALUES ('144573', '2018-11-20 20:04:45', '0', '4', '2c9a21936727600a0167279fccef0004', '0', '1');
INSERT INTO `t_revenue_record` VALUES ('144575', '2018-11-20 20:06:16', '0', '4', '2c9a21936727600a0167279fccef0004', '0', '1');
INSERT INTO `t_revenue_record` VALUES ('144577', '2018-11-20 20:09:23', '0', '4', '2c9a21936727600a0167279fccef0004', '0', '1');
INSERT INTO `t_revenue_record` VALUES ('144578', '2018-11-20 20:09:57', '0', '4', '2c9a21936727600a016727a896810006', '0', '1');
INSERT INTO `t_revenue_record` VALUES ('144635', '2018-11-21 13:02:36', '50', null, '2c9a2193673654610167365d81420003', '0', '3');
INSERT INTO `t_revenue_record` VALUES ('144640', '2018-11-21 13:08:17', '0', '4', '2c9a21936727600a0167279fccef0004', '1', '1');
INSERT INTO `t_revenue_record` VALUES ('144643', '2018-11-21 13:10:28', '0', '4', '2c9a21936727600a016727a896810006', '1', '1');
INSERT INTO `t_revenue_record` VALUES ('144647', '2018-11-21 13:13:29', '0', '4', '2c9a21936727600a0167279fccef0004', '1', '1');
INSERT INTO `t_revenue_record` VALUES ('144650', '2018-11-21 13:15:10', '0', '4', '2c9a21936727600a0167279fccef0004', '1', '1');
INSERT INTO `t_revenue_record` VALUES ('144653', '2018-11-21 13:17:16', '0', '4', '2c9a21936727600a0167279fccef0004', '1', '1');
INSERT INTO `t_revenue_record` VALUES ('144656', '2018-11-21 13:19:17', '0', '4', '2c9a21936727600a0167279fccef0004', '1', '1');
INSERT INTO `t_revenue_record` VALUES ('144659', '2018-11-21 13:21:10', '0', '4', '2c9a21936727600a0167279fccef0004', '1', '1');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `introduce` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('4028887066d4e2450166d4e2c0890000', '', '菜单管理员', '0');

-- ----------------------------
-- Table structure for `t_role_power`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_power`;
CREATE TABLE `t_role_power` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `menu_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_role_power
-- ----------------------------
INSERT INTO `t_role_power` VALUES ('2c9a2193672c53f201672c9f62530011', '402880a166de0c500166de0ec4940000', '4028887066d4e2450166d4e2c0890000');
INSERT INTO `t_role_power` VALUES ('2c9a2193672c53f201672c9f62430010', '4028887066d4ec3c0166d4ee21ef0001', '4028887066d4e2450166d4e2c0890000');
INSERT INTO `t_role_power` VALUES ('2c9a2193672c53f201672c9f62820019', '4028887066d4ec3c0166d4ef24c80004', '4028887066d4e2450166d4e2c0890000');
INSERT INTO `t_role_power` VALUES ('2c9a2193672c53f201672c9f62820018', '402880a16712dade016712dd5cf00000', '4028887066d4e2450166d4e2c0890000');
INSERT INTO `t_role_power` VALUES ('2c9a2193672c53f201672c9f62820017', '402880a16702625301670263d66e0000', '4028887066d4e2450166d4e2c0890000');
INSERT INTO `t_role_power` VALUES ('2c9a2193672c53f201672c9f62820016', '402880a166de0c500166de0ec4940000', '4028887066d4e2450166d4e2c0890000');
INSERT INTO `t_role_power` VALUES ('2c9a2193672c53f201672c9f62820015', '4028887066d4ec3c0166d4ee21ef0001', '4028887066d4e2450166d4e2c0890000');
INSERT INTO `t_role_power` VALUES ('2c9a2193672c53f201672c9f62530012', '402880a16702625301670263d66e0000', '4028887066d4e2450166d4e2c0890000');
INSERT INTO `t_role_power` VALUES ('2c9a2193672c53f201672c9f62630013', '402880a16712dade016712dd5cf00000', '4028887066d4e2450166d4e2c0890000');
INSERT INTO `t_role_power` VALUES ('2c9a2193672c53f201672c9f62630014', '4028887066d4ec3c0166d4ef24c80004', '4028887066d4e2450166d4e2c0890000');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `random` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recommend_code` int(11) DEFAULT NULL,
  `register_time` datetime DEFAULT NULL,
  `balance` float NOT NULL,
  `miner_id` int(11) DEFAULT NULL,
  `id_card_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_income` float NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `yesterday_income` float NOT NULL,
  `code` int(11) NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profit` float NOT NULL,
  `today_income` float NOT NULL,
  `total_calculation_force` float NOT NULL,
  `hide` int(11) NOT NULL,
  `role_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK163ktdgsul2pxbb3j79kdjurd` (`miner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('2c9a219366ee5f480166eeb8180c0006', 'EE1AB37F52B1367E0F9C903E930F6041', '18523565027', '4757', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY2ZWU1ZjQ4MDE2NmVlYjgxODBjMDAwNiIsInVzZXJJZCI6IjJjOWEyMTkzNjZlZTVmNDgwMTY2ZWViODE4MGMwMDA2IiwiZXhwIjoxNTQyOTc3MTU3fQ.XL9kUVkpmZgUmelKpk6RRh9ow1SASWcghbpeqMF-f19G7bolzZOBLs_jC965MedoXvumDJlv5uiPqnpf80mavA', '190290', '2018-11-07 15:08:54', '0', null, '500233198809175345', '0', '王老五', '0', '0', 'http://39.98.58.74:8080/upload/2018-11-14/1542164164015.null', '0', '0', '118800', '1', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a01672763c3db0001', '544D11792D49EA26C3054383CFDF115C', '15320575162', '7019', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzI3NjNjM2RiMDAwMSIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3Mjc2M2MzZGIwMDAxIiwiZXhwIjoxNTQyOTYwNTEwfQ.fkaZloP9tXZ0Kqtn7GHfUoTjC4nK65ziKN8K_YqfcEVliEhRXsNZQbGoQJsPgbPYCx746NeteSUzuOBVihcSlw', '415725', '2018-11-18 15:15:08', '50', null, '500233198809175678', '50', '张三丰', '0', '190290', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a0167279fccef0004', 'CAC18398BB5D627AF2B7B48F8634FA48', '18775797932', '2366', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzI3OWZjY2VmMDAwNCIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3Mjc5ZmNjZWYwMDA0IiwiZXhwIjoxNTQyOTc5MDI1fQ.eW77e93gZcOOjeDVMqOPqLOcbyxLDBJ3Q8glyvPsnVMKm9a1e3Zr7a7k-AP2xFGCAInyVbrR8QbpyRGiiI9Iwg', '912448', '2018-11-18 16:20:43', '1600', '4', '220122198908166520', '50', '李丹', '0', '190290', 'http://39.98.58.74:8080/upload/2018-11-20/1542643239522.null', '0', '0', '118800', '1', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a016727a896810006', 'D95301CBEF7203069D1FFBE3B6120F01', '15768884994', '4344', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzI3YTg5NjgxMDAwNiIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MjdhODk2ODEwMDA2IiwiZXhwIjoxNTQyOTc5OTgxfQ.IdL34KIwZGiMeij6HU2lMbd3oBrXivGjzsSU-RUzSrnwoJZOB1eEydzsZ5dkv9SdgtPikYfYmWliO0wAaSobuw', '965918', '2018-11-18 16:30:19', '50', '4', '445221197910126851', '50', '杨晓丹', '0', '912448', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a016727aa9d000008', '6E0A2A9000624BD6D0A5EF62CBEAA894', '17875674513', '2588', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzI3YWE5ZDAwMDAwOCIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MjdhYTlkMDAwMDA4IiwiZXhwIjoxNTQyOTgwMDQ0fQ.gxJknr9Qz1oZ5MRjapn2sxoVYQDvATaSQ2NjjE77ycx3uUyvUAFVbzq3h-zBbJY_2xydQe2OlQXyoSbDR3gvpA', '788920', '2018-11-18 16:32:32', '50', null, '445122198404282216', '50', '王健全', '0', '965918', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a016727ad1f94000a', '93E1E36307A3319E10111A69EA970F20', '13724830166', '9896', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzI3YWQxZjk0MDAwYSIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MjdhZDFmOTQwMDBhIiwiZXhwIjoxNTQyOTc4NjY1fQ.M6PSat-p7injB111O-ROiSt9TjKPDeeL-iyrTltCnKi3sFk6K6V_nvXxFmQnNcZPXuCHOwCCdGJiIq5fun2Y1g', '827568', '2018-11-18 16:35:16', '50', '3', null, '50', null, '0', '788920', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a016727af77eb000c', 'F648E76C6217FA4579D39A6DDC378B6A', '13760758293', '4754', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzI3YWY3N2ViMDAwYyIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MjdhZjc3ZWIwMDBjIiwiZXhwIjoxNTQyOTc1NTg1fQ.DSQRYWT8vmdiVtYXH2PqXLQe_wNJBIMeDczVOWSTlt5TpAqea3kZ3iANz09UNhsgLoern6BO7_RX-xaEot6lEg', '386691', '2018-11-18 16:37:50', '50', null, '430481199008120906', '50', '曹交兰', '0', '827568', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a016727b0a89b000e', '69DCCD04AEC40EFC11CBBCB817F435D1', '13535042833', '2746', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzI3YjBhODliMDAwZSIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MjdiMGE4OWIwMDBlIiwiZXhwIjoxNTQyOTc1NzMyfQ.IKjo0w-WmoNj3lTfCZxOLyKdNvf8Md9vePProRdtgrxRjyhTV4VwVRbtkKDEyvulTmnfWUk9_g6PVTUX_r3Q7g', '115229', '2018-11-18 16:39:08', '50', null, null, '50', null, '0', '386691', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a016727b211920010', 'EE654B593A42A9FD50DFCA6E575F03C1', '19875499386', '1447', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzI3YjIxMTkyMDAxMCIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MjdiMjExOTIwMDEwIiwiZXhwIjoxNTQyOTU5MzA4fQ.SBJ8hDmACpKtU98tKH2HOJeE9TiYBrC962pAQUIIqnuqrdJPImO880KVrrpCXT5B74W7S3h-OxL21ksciotJeg', '586851', '2018-11-18 16:40:40', '50', null, '220181198308250032', '50', '钱雷', '0', '115229', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a016727b32c970012', '122FDF3C1AF969DDDE0926CBD20ED879', '13302259943', '3198', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzI3YjMyYzk3MDAxMiIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MjdiMzJjOTcwMDEyIiwiZXhwIjoxNTQyOTU2NzEyfQ.8Mp6ku-PJVeZreCMcQKL1BODpVUXCFgL5Q3uVMfSYukHwBX9MaGBhbhWWvCwGW299cQmvffcBZ_qGdIrYZXvYw', '506218', '2018-11-18 16:41:53', '50', null, '330702198303106413', '50', '梁光', '0', '586851', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a016727b460440014', '621930F41A8075443D1E2B7698918882', '13570558868', '5858', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzI3YjQ2MDQ0MDAxNCIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MjdiNDYwNDQwMDE0IiwiZXhwIjoxNTQyOTU2NDk3fQ.91niCzkQvzWChAvy3YGolcruV-IyUFOBvwyUWnvfJeEg2DROVahyGNVSO1bw5FRlPn0bnLf8zAUWDCfFvuyP-g', '861426', '2018-11-18 16:43:11', '50', null, '330326197511054931', '50', '李开镜', '0', '506218', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a016727b5d7e10016', 'D4712B7BF42C5D2E5DC442E5E6487C12', '13928947945', '6529', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzI3YjVkN2UxMDAxNiIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MjdiNWQ3ZTEwMDE2IiwiZXhwIjoxNTQyOTc4MDExfQ.Pi-Q2Z1C6lOBKaR7O6Dqu9LLnD2qJk1knCRrqAwy04kfl3VLSKWn-mvIt2wJf04mS1ej7BWnQhZv0nV2n-LxtA', '916646', '2018-11-18 16:44:47', '50', null, '430481199008120906', '50', '曹交兰', '0', '861426', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a016727b885da0018', '34686046DFD24B7CF2C0D1B393CFD81E', '13247397888', '6734', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzI3Yjg4NWRhMDAxOCIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MjdiODg1ZGEwMDE4IiwiZXhwIjoxNTQyOTc1Njg5fQ.swZg_i5kMvsBVBjmjiwRlyDurMSMI8TbNevbPog3yewiEZol21h-s3N4ApRO79FqmkNDx35bQ5sg7qiMnU_JZQ', '770396', '2018-11-18 16:47:43', '50', null, null, '50', null, '0', '916646', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a016727ba812d001a', 'C4575DF80ABB12A840AC41F77C1BF765', '18928938363', '7853', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzI3YmE4MTJkMDAxYSIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MjdiYTgxMmQwMDFhIiwiZXhwIjoxNTQyOTAzMTI4fQ.Y7uU7DY_m786QZSoUYRCKNNeuFElbo1BM9T0jSdQOR9awFVSsFj_XgEcXkRmW1JMI11k47p1T43YzXQ5VudAKA', '230777', '2018-11-18 16:49:53', '50', null, null, '50', null, '0', '788920', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a016727bbe793001c', '4B14A171789293C9E9547145B13B3466', '18819133131', '4112', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzI3YmJlNzkzMDAxYyIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MjdiYmU3OTMwMDFjIiwiZXhwIjoxNTQyOTc4MTM4fQ.bvubSOoAq3kq5z1A6HUNN4C-ZSPuVm5nKx4567EZGXIZeVovUsSYJ_4UDDCMnhxTy644FEl2KdmXELn1vt65Vg', '887991', '2018-11-18 16:51:25', '50', '3', '445221199006151257', '50', '洪百威', '0', '230777', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a016727bcf5f6001e', 'D8DF847FEC0D47D5010448E371E32A22', '13539888831', '3441', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzI3YmNmNWY2MDAxZSIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MjdiY2Y1ZjYwMDFlIiwiZXhwIjoxNTQyOTY2MTA2fQ.MaUQLELtYDdmEHkgjadSLZeaB7hgwoBIRIQv0_ATfBFFaPfaxNOQosga_aPwrlC-xIBjO0N7JAwPI5N-e_9dyg', '996589', '2018-11-18 16:52:34', '50', null, null, '50', null, '0', '887991', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a016727be323f0020', '6637EAF95B6C5A5ED312D2D5BF3499EA', '18819314941', '8504', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzI3YmUzMjNmMDAyMCIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MjdiZTMyM2YwMDIwIiwiZXhwIjoxNTQyOTUwMzI1fQ.U-MtQ9DtOHfMz4msYv4q5jVf1t5g5OYwBMUPR0A5grLEkzxMAeO3m3SE7XrwIB5Ewn-p7xss8MGeWY8M1T5kyQ', '315180', '2018-11-18 16:53:55', '13850', null, null, '50', null, '0', '996589', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a016727cce2ae0022', 'E47619EED95DF84C7B90F84B11F0AC8C', '15373685861', '4780', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzI3Y2NlMmFlMDAyMiIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MjdjY2UyYWUwMDIyIiwiZXhwIjoxNTQyOTYzMjY1fQ.7V3xjj5RZ3uYMX15M-FW4R1lOya4Ro3qQ_vvyTf4LRt6LcNDIAClLEz0Wx7QrZnRcZqWFfY2IB2I-SDoorg6Jg', '143520', '2018-11-18 17:09:58', '50', null, null, '50', null, '0', '912448', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a016727db1da00024', '26915FC4CC8948E8179DE99C8FF2F9BB', '18529282687', '9357', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzI3ZGIxZGEwMDAyNCIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MjdkYjFkYTAwMDI0IiwiZXhwIjoxNTQyOTcwNDU2fQ.4Csj-vS0xgPk_DrYdMKf10n4Vt4yG5nkFFx0b0nnSZs4scUAfoaQzt8A8O09k4fn3ETO8_F1a13azvLQ9bgetw', '103351', '2018-11-18 17:25:30', '50', null, null, '50', null, '0', '912448', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a016727f1c00f0026', 'E8CED9124C757585682D7758ED641663', '18941727888', '9592', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzI3ZjFjMDBmMDAyNiIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MjdmMWMwMGYwMDI2IiwiZXhwIjoxNTQyOTc4ODkwfQ.ObjF1AmThbYdzenLaY8RcTirmsO7N8G67wVuOQ8q9Dpj60HSkhl7mn1sYSe29DJXtYAz8NF3jfx9eI_3ppANAA', '541088', '2018-11-18 17:50:14', '50', '4', '210802197512022017', '50', '代权', '0', '103351', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a016727f7d5110028', '219E0C05A65C4B0ECEF15DDB23AD7CBD', '13247541345', '6057', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzI3ZjdkNTExMDAyOCIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MjdmN2Q1MTEwMDI4IiwiZXhwIjoxNTQyOTc5MTE1fQ.cJhTnAHyEHB59UqVhXJb5BZbDfQEqvOc62XWxlc0Vc4AvNh9tTAlV9dGIC4HJLrAQqVDdL5AveOSXfQykZ3WMA', '655837', '2018-11-18 17:56:52', '50', '4', null, '50', null, '0', '103351', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a016727f87f89002a', '75EC4759AA15EEE7A2378867A6286BBA', '18665748768', '8242', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzI3Zjg3Zjg5MDAyYSIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MjdmODdmODkwMDJhIiwiZXhwIjoxNTQyOTc5Mjc4fQ.9tYBnTXjv09EV106Pgs_EggLQRBhF11MCZ-m8E_PfXtYg2IP5Xbmw59Ldtwn2-rI8Re1Rt8ipRFi-x8dhmUhhA', '484205', '2018-11-18 17:57:36', '50', '4', null, '50', null, '0', '103351', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a016727f9578b002c', '935CC3F56AFD24D4F2805965D25917CE', '13560488849', '9324', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzI3Zjk1NzhiMDAyYyIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MjdmOTU3OGIwMDJjIiwiZXhwIjoxNTQyOTc5MDQ3fQ.iFGT-xsZsM9MTEu1WHDfSJldLh2tfF7fxHX53o88DI0cMI0JecQJV91zPN5DDcjLud_vAmfFP79ZhCZgUXuQow', '886185', '2018-11-18 17:58:31', '50', '4', null, '50', null, '0', '103351', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a016727fbf538002e', 'A8BDE14DE29C904DC44D4B50CF0CF6D7', '15361683115', '8779', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzI3ZmJmNTM4MDAyZSIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MjdmYmY1MzgwMDJlIiwiZXhwIjoxNTQyOTc4ODIzfQ.mjmAv1crIrSfFagntMwzcVNABPyhlBM6-RvaDm3bG6kFTbX47vrNwq9oZcioUy9fWY7BU1ywZ3SY1tYCJJ3Y8w', '405684', '2018-11-18 18:01:23', '50', '4', '430702197605105052', '50', '戴德常', '0', '103351', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a016727fea2660032', 'C4FBA9E21776E816AFCBDA751AC02761', '13168375693', '8557', null, '535732', '2018-11-18 18:04:18', '6850', null, null, '50', null, '0', '103351', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a016728006fb40034', '9DC70E51FDF053C1D2ADFCA7A634EBFB', '13711156286', '7992', null, '332585', '2018-11-18 18:06:16', '59850', null, null, '50', null, '0', '405684', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a01672a6424df003a', '0043DDB2DF1C492606D5EA1E0E914D8D', '18325042854', '1014', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzJhNjQyNGRmMDAzYSIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MmE2NDI0ZGYwMDNhIiwiZXhwIjoxNTQyNzc3MjgwfQ.wqPsetcOGqRqkSHWIspStmnxSKPGmvExaMC6si773_xh0hhJ1fos5adYBnA64SjZT0KLOermhIfI-ROVowEOIw', '353500', '2018-11-19 05:14:25', '50', null, null, '50', null, '0', '190290', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a01672af2999f003c', 'D9167F477189CCAD34B7FBC829C802CE', '13825083199', '5140', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzJhZjI5OTlmMDAzYyIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MmFmMjk5OWYwMDNjIiwiZXhwIjoxNTQyNzk0NDk2fQ.Hfx6Mg-nXaLMxPgdDqNnd8k8rlRUDmE9IDbUFa3mA1l_shGb_Ug1nMJBnba_ge1AlwdiToqemAaVi2GBYuHqAQ', '791405', '2018-11-19 07:50:01', '50', null, null, '50', null, '0', '103351', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a01672af89339003e', '5E7F249C2F8548615C40ED1E64964651', '13410395528', '4156', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzJhZjg5MzM5MDAzZSIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MmFmODkzMzkwMDNlIiwiZXhwIjoxNTQyOTA1NjY4fQ.GNwPrGo5bRSSQiPnoaPbuNQcSUUtEwA1yyCvHn-9BwRbSxteGPJ8q--1RG1cu9ROm-13mTD0PJvkVUdHfQQWdA', '243452', '2018-11-19 07:56:32', '118850', null, '513521197910300015', '50', '马俊', '0', '788920', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a01672af982aa0040', '129442AB29ED5C9820B0471BD21C653F', '13802259396', '7192', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzJhZjk4MmFhMDA0MCIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MmFmOTgyYWEwMDQwIiwiZXhwIjoxNTQyOTc4MzgxfQ.6IWVjQ4kJ6VcRgY7AbGRJqzIJZa4qtppyIu-eLg1SxVnNT7kNHkpb9hHIHnwjsAPFXj2yo36rqjtz3zzAdRGpw', '416436', '2018-11-19 07:57:34', '59850', null, '513521197910300015', '50', '马俊', '0', '243452', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a01672afada7a0042', '228B7DCE6D29FDE8A33287DA9AE970C9', '15818538765', '7215', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzJhZmFkYTdhMDA0MiIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MmFmYWRhN2EwMDQyIiwiZXhwIjoxNTQyOTA1NTAwfQ.xg64i5mgFcleQ2oHcgpf5yUg6x_lo7d6wZ7wOysyBPesPTJz467FfIAksYa3c-CNujlOKMtyKhEdmKcwtIRzJw', '519854', '2018-11-19 07:59:02', '59850', null, '513521197910300015', '50', '马俊', '0', '416436', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a01672afcb0140044', '3C0A9F0A8E76E176993EFF74301A020C', '13710582395', '2943', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzJhZmNiMDE0MDA0NCIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MmFmY2IwMTQwMDQ0IiwiZXhwIjoxNTQyOTczODgyfQ.necZH3goiFqHIncj0-D-Ekx31ie1akeJBkbJGdKp9fysreuTkXb5S-yKLGY-WzW0kiDfOOgwtwB2mLczYup8tA', '514116', '2018-11-19 08:01:02', '50', null, '445121197712147314', '50', '尤振鹏', '0', '519854', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a01672afe0eba0046', '9479A996FB18C99DE41000C85F89433B', '18823810301', '8232', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzJhZmUwZWJhMDA0NiIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MmFmZTBlYmEwMDQ2IiwiZXhwIjoxNTQyOTc5MTEzfQ.ioGRqK1HLeNSC5LNvULqOusng2akHEfO5YBjDfXmNRlMT3h93Xu_HASrkfN6ykL2nJLIUohKNLOva69MklRGMQ', '497070', '2018-11-19 08:02:32', '50', '4', '430525199801257419', '50', '杨期来', '0', '514116', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a01672aff2e340048', '5258332F88996D7107D43901D8D378AF', '18948788147', '9274', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzJhZmYyZTM0MDA0OCIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MmFmZjJlMzQwMDQ4IiwiZXhwIjoxNTQyOTc5NTA4fQ.Mh3-5KSdCU_BgVGUVFKqHW3k-5WYTYACjy3_AdczvSQ6XoqBED7C_kbImzeqvbXXhckkcLuvYO0UDZzlfsxxgg', '542672', '2018-11-19 08:03:45', '50', null, '430525199801257419', '50', '杨期来', '0', '497070', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a01672b0106dc004a', 'C51C9D6F42FF8C9B7A9A62BB459E1851', '15012906768', '2877', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzJiMDEwNmRjMDA0YSIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MmIwMTA2ZGMwMDRhIiwiZXhwIjoxNTQyOTY2NjEyfQ.DMu4BeSesODntmrDrX39UwNLyctazB_hqjoJS_O8FebTss2s5zeoevw0gZTggSLMe6EJT38AGdJeaMrXZboLMg', '390146', '2018-11-19 08:05:46', '50', null, '430525199801257419', '50', '杨期来', '0', '542672', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a01672b0235b7004c', '6DDDDDC65C61D6E0D7FE394BFB913C6F', '13509088060', '9427', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzJiMDIzNWI3MDA0YyIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MmIwMjM1YjcwMDRjIiwiZXhwIjoxNTQyOTU0NTExfQ.HshSsDyfqo-MbJrKrrbLkjoBw6utyAG1AFHzCq3tolH4g2Kj_8n5oJCo_TSUalDZBzaH9thqX2cXL-mDH4AOIw', '416984', '2018-11-19 08:07:04', '50', null, '441323199306294334', '50', '方华贵', '0', '390146', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a21936727600a01672b033b5f004e', '5DAE9156A44735D6C7C883AD5098966E', '15916370555', '5593', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3Mjc2MDBhMDE2NzJiMDMzYjVmMDA0ZSIsInVzZXJJZCI6IjJjOWEyMTkzNjcyNzYwMGEwMTY3MmIwMzNiNWYwMDRlIiwiZXhwIjoxNTQyOTc3OTk0fQ.e1dWrR0lrVno7_SR8Yzh3GHhOlbkZjnveAsc3v3zP9vdIW0rvxABHY-BjFUOGz7t9xsUnAylmDBrBWY6vXBUvQ', '221748', '2018-11-19 08:08:11', '0', null, '445222198303102939', '50', '林乐锋', '0', '416984', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a2193672c4d9b01672f883abf000f', 'BA750CD238E40E3585BCCA81D96DCC9F', '17689785574', '5254', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3MmM0ZDliMDE2NzJmODgzYWJmMDAwZiIsInVzZXJJZCI6IjJjOWEyMTkzNjcyYzRkOWIwMTY3MmY4ODNhYmYwMDBmIiwiZXhwIjoxNTQyODg1Nzk2fQ.-4he0e_fW6L1DrTjCUF-3JQ4KHgL8nhYqvP6D05wtgF9nrvorTqbhyu-ROYTSgCKEZLZd1L37RyGmT3DaK6X-A', '352517', '2018-11-20 05:11:56', '50', null, null, '50', null, '50', '390146', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a2193672c4d9b0167309494fd0019', '1929759D28B5762AAB1EA33777D77D95', '13352691035', '1406', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3MmM0ZDliMDE2NzMwOTQ5NGZkMDAxOSIsInVzZXJJZCI6IjJjOWEyMTkzNjcyYzRkOWIwMTY3MzA5NDk0ZmQwMDE5IiwiZXhwIjoxNTQyOTY2NDA1fQ.XcCejz0C-JOKc2gOi53ImCmG6v2Ma2b5qn5rV4FV5y6NSJFUoPeK7197fEj4HJ9N_qypJs3p_ZPe11TULxWFaA', '711261', '2018-11-20 10:05:03', '50', null, '430525198910140514', '50', '肖宝', '50', '390146', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a2193672c4d9b016730bdadcd0021', '59194A496315FF969FA9B05BA22DB00C', '15258261888', '5757', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3MmM0ZDliMDE2NzMwYmRhZGNkMDAyMSIsInVzZXJJZCI6IjJjOWEyMTkzNjcyYzRkOWIwMTY3MzBiZGFkY2QwMDIxIiwiZXhwIjoxNTQyOTA4NzA3fQ.8aOvk7voRxoL9fhg0YnWbIoZRzbhbc-DLJct1F1lM9JEdPdV2RcCntWYQe0H6QgTGJ_uxdo8Nw1MyJJepW5lCw', '422934', '2018-11-20 10:49:56', '50', null, null, '50', null, '50', '352517', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a2193672c4d9b016730c54c7c0023', '3AA0A0667E12E28EA56F7236E93CAA26', '13318780792', '6976', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3MmM0ZDliMDE2NzMwYzU0YzdjMDAyMyIsInVzZXJJZCI6IjJjOWEyMTkzNjcyYzRkOWIwMTY3MzBjNTRjN2MwMDIzIiwiZXhwIjoxNTQyODg1NzUyfQ.eX6KlhG3m4vKjyPZd4_-ZxFW1Dap77aQEXa8z5NTrjQqIFXimb9YO3KwY1gp0cWN6rJQK-N4wqmhmNO_eLxd3Q', '486911', '2018-11-20 10:58:15', '50', null, null, '50', null, '50', '352517', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a2193672c4d9b016730e9861b0029', 'B5C946F29BABCC527349AEFA7C42F4F6', '18270664855', '4851', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3MmM0ZDliMDE2NzMwZTk4NjFiMDAyOSIsInVzZXJJZCI6IjJjOWEyMTkzNjcyYzRkOWIwMTY3MzBlOTg2MWIwMDI5IiwiZXhwIjoxNTQyODg2NzYwfQ.FzJxrr00y-mwfoT2ojh_ihbff1zVf6KtSzXMas6hVKb9yL-SY0_EhLZbOaF6iS6YBQbYlB4Bm6ZfHRadtcG5bg', '680166', '2018-11-20 11:37:49', '50', null, null, '50', null, '50', '422934', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a2193672c4d9b0167314a1bef0034', '88A53F25D7A74EBF8069C6E2B5D12FD5', '15113996956', '9805', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3MmM0ZDliMDE2NzMxNGExYmVmMDAzNCIsInVzZXJJZCI6IjJjOWEyMTkzNjcyYzRkOWIwMTY3MzE0YTFiZWYwMDM0IiwiZXhwIjoxNTQyOTc5Mzc1fQ.TjxjPVLf4wHAZZaG8LmPxXBi-nMzgRY1-fmDXsx-XvYdBn0Dqb5M434wAyqfT8VQV-FiZLCNTAz0RKjDj_Wkmg', '142099', '2018-11-20 13:23:19', '50', '3', null, '50', null, '50', '514116', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a2193672c4d9b0167314facbd0036', '6CC750FE14C1E5971669FABB90BF41EB', '13420633006', '5503', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3MmM0ZDliMDE2NzMxNGZhY2JkMDAzNiIsInVzZXJJZCI6IjJjOWEyMTkzNjcyYzRkOWIwMTY3MzE0ZmFjYmQwMDM2IiwiZXhwIjoxNTQyOTc5OTMzfQ.aIFs5ry2B7546ArJVO9qfkzex-Lu987gqr6FxskBXBo_6VqnparrQkAufQaBSZhtvMh4oOXRgLrc5--EWQToDg', '864650', '2018-11-20 13:29:24', '50', null, '445121198007237511', '50', '林卫华', '50', '142099', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a2193672c4d9b01673154aed80038', '374795212D75D6813F23392386C9AAD1', '13352978178', '7625', null, '509815', '2018-11-20 13:34:52', '118850', null, null, '50', null, '50', '405684', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a2193672c4d9b0167315f9714003a', '127218352921AE826E6CEC65C497B0BD', '17830981062', '6301', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3MmM0ZDliMDE2NzMxNWY5NzE0MDAzYSIsInVzZXJJZCI6IjJjOWEyMTkzNjcyYzRkOWIwMTY3MzE1Zjk3MTQwMDNhIiwiZXhwIjoxNTQyOTc3NjQ2fQ.vmoC0S-lNfCISEQcUQQtxidyJ5q-Im4fluMs-Q3K5uOX_QlNAK9iSmE6Rl6OdO5XFBZe5rF9vW9zCV3Rhj6Wug', '458963', '2018-11-20 13:46:47', '40', null, '500233198809175434', '50', '张三', '50', '415725', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a2193672c4d9b01673169ad1c003c', '4C4943017154AE2D3EFAACB38FD667F7', '13760338866', '4270', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3MmM0ZDliMDE2NzMxNjlhZDFjMDAzYyIsInVzZXJJZCI6IjJjOWEyMTkzNjcyYzRkOWIwMTY3MzE2OWFkMWMwMDNjIiwiZXhwIjoxNTQyOTAzMzY2fQ.L-vIgMb5JY5TqBqiwo1TO2xsNPiKpDV4ea_gxZTOB_sPTg0_TIAR9T385t2j92MeODsASMNz0f2vFnpq3CFQ4Q', '633169', '2018-11-20 13:57:48', '50', null, null, '50', null, '50', '315180', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a219367316ef401673177f57c0001', '8B4BEE765CC52261503CBA972C6D9B63', '13368222914', '7788', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3MzE2ZWY0MDE2NzMxNzdmNTdjMDAwMSIsInVzZXJJZCI6IjJjOWEyMTkzNjczMTZlZjQwMTY3MzE3N2Y1N2MwMDAxIiwiZXhwIjoxNTQyOTQzNjgxfQ.1M2EcrkULICSddS07lGqtHWwRNfahRKzNlP9NvGEc7rWSUfvket-DbE7CawYio7zT6kfRGBRh9RYeToT-h8XVw', '364449', '2018-11-20 14:13:24', '350', null, '500233198809175255', '50', '张三', '50', '415725', null, '0', '0', '0', '0', '0');
INSERT INTO `t_user` VALUES ('2c9a2193673654610167365d81420003', '6AD9E220E9991E11D22D9B26BE0DD989', '18819449983', '6145', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyYzlhMjE5MzY3MzY1NDYxMDE2NzM2NWQ4MTQyMDAwMyIsInVzZXJJZCI6IjJjOWEyMTkzNjczNjU0NjEwMTY3MzY1ZDgxNDIwMDAzIiwiZXhwIjoxNTQyOTc4NDk5fQ.R6tWQoI2YUkHkfvp_r_jVJDa8xLuWc4CbvbZPn3zmDLp6s3tpfJkgME-eAjVGDS0D61ZmrqfYQCwtu0qoqu6ig', '830226', '2018-11-21 13:02:36', '50', null, '430524198107271180', '50', '郑瑜华', '0', '916646', null, '0', '50', '0', '0', '0');

-- ----------------------------
-- Table structure for `t_withdraw`
-- ----------------------------
DROP TABLE IF EXISTS `t_withdraw`;
CREATE TABLE `t_withdraw` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `money` float NOT NULL,
  `order_status` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_card_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK20go8pkmdm2dope02cfpqqfpu` (`bank_card_id`),
  KEY `FKkwiumpeku1p9bm7ri2hxcq5oj` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_withdraw
-- ----------------------------
INSERT INTO `t_withdraw` VALUES ('2c9a2193672c4d9b01672cc2b49f0006', '2018-11-19 16:16:56', '200', '1', '2018-11-19 16:21:58', '2c9a21936727600a0167279fccef0004', '2c9a2193672c4d9b01672cc03a960003');
INSERT INTO `t_withdraw` VALUES ('2c9a219367316ef4016731dae55d0003', '2018-11-20 16:01:28', '59850', '1', '2018-11-20 16:32:53', '2c9a21936727600a01672b033b5f004e', '2c9a2193672c4d9b01672d5f88b0000c');
INSERT INTO `t_withdraw` VALUES ('2c9a219367316ef4016732156ddc0006', '2018-11-20 17:05:24', '200', '1', '2018-11-20 19:39:17', '2c9a21936727600a0167279fccef0004', '2c9a2193672c4d9b01672cc03a960003');
INSERT INTO `t_withdraw` VALUES ('2c9a219367316ef4016732a34d900009', '2018-11-20 19:40:22', '400', '1', '2018-11-20 19:44:59', '2c9a21936727600a0167279fccef0004', '2c9a2193672c4d9b01672cc03a960003');
INSERT INTO `t_withdraw` VALUES ('2c9a219367316ef4016732a684dd000b', '2018-11-20 19:43:53', '800', '1', '2018-11-20 19:44:48', '2c9a21936727600a0167279fccef0004', '2c9a2193672c4d9b01672cc03a960003');
INSERT INTO `t_withdraw` VALUES ('2c9a219367316ef4016732cb63c50010', '2018-11-20 20:24:09', '59850', '2', '2018-11-21 01:06:38', '2c9a21936727600a01672afcb0140044', '2c9a219367316ef4016732cabab4000e');
INSERT INTO `t_withdraw` VALUES ('2c9a219367316ef4016734572a400016', '2018-11-21 03:36:26', '200', '2', '2018-11-21 03:36:50', '2c9a2193672c4d9b0167315f9714003a', '2c9a219367316ef401673456ba500014');
INSERT INTO `t_withdraw` VALUES ('2c9a219367316ef401673459f49b0019', '2018-11-21 03:39:29', '210', '1', '2018-11-21 03:39:47', '2c9a2193672c4d9b0167315f9714003a', '2c9a219367316ef4016734598caa0017');
INSERT INTO `t_withdraw` VALUES ('2c9a219367316ef401673481715e001b', '2018-11-21 04:22:37', '59850', '2', '2018-11-21 07:16:53', '2c9a21936727600a01672afcb0140044', '2c9a219367316ef4016732ca0b78000d');
INSERT INTO `t_withdraw` VALUES ('2c9a219367316ef40167351e0b950021', '2018-11-21 07:13:40', '1600', '2', '2018-11-21 07:13:59', '2c9a21936727600a0167279fccef0004', '2c9a2193672c4d9b01672cc03a960003');
INSERT INTO `t_withdraw` VALUES ('2c9a219367316ef401673591d3980029', '2018-11-21 09:20:08', '13800', '2', '2018-11-21 09:42:58', '2c9a21936727600a01672afe0eba0046', '2c9a2193672c4d9b016730fffa64002c');
INSERT INTO `t_withdraw` VALUES ('2c9a219367316ef4016735a3e7a6002c', '2018-11-21 09:39:53', '6800', '1', '2018-11-21 09:42:27', '2c9a21936727600a016727bbe793001c', '2c9a219367316ef40167359e0fdc002a');
INSERT INTO `t_withdraw` VALUES ('2c9a219367316ef4016735aed755002e', '2018-11-21 09:51:50', '6800', '1', '2018-11-21 10:07:16', '2c9a21936727600a01672afe0eba0046', '2c9a2193672c4d9b016730fffa64002c');

-- ----------------------------
-- Table structure for `uuid`
-- ----------------------------
DROP TABLE IF EXISTS `uuid`;
CREATE TABLE `uuid` (
  `sequence_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next_val` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`sequence_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of uuid
-- ----------------------------
INSERT INTO `uuid` VALUES ('t_menu', '0');
