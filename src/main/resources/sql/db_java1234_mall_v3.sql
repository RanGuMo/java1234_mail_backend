/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : db_java1234_mall_v3

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 14/09/2024 16:48:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `id` int(11) NULL DEFAULT NULL,
  `userName` varchar(66) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(66) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, 'java1234', '123456');

-- ----------------------------
-- Table structure for t_bigtype
-- ----------------------------
DROP TABLE IF EXISTS `t_bigtype`;
CREATE TABLE `t_bigtype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_bigtype
-- ----------------------------
INSERT INTO `t_bigtype` VALUES (1, '手机', '手机描述', '1.jpg');
INSERT INTO `t_bigtype` VALUES (2, '电脑平板', '电脑平板描述', '2.jpg');
INSERT INTO `t_bigtype` VALUES (3, '智能穿戴', '智能穿戴描述', '3.jpg');
INSERT INTO `t_bigtype` VALUES (4, '电视', '电视描述', '4.jpg');
INSERT INTO `t_bigtype` VALUES (5, '大家电', '大家电描述', '5.jpg');
INSERT INTO `t_bigtype` VALUES (6, '小家电', '小家电描述', '6.jpg');
INSERT INTO `t_bigtype` VALUES (7, '智能家居', '智能家居描述', '7.jpg');
INSERT INTO `t_bigtype` VALUES (8, '户外出行', '户外出行描述', '8.jpg');
INSERT INTO `t_bigtype` VALUES (9, '日用百货', '日用百货描述', '9.jpg');
INSERT INTO `t_bigtype` VALUES (10, '儿童用品', '儿童用品描述', '10.jpg');
INSERT INTO `t_bigtype` VALUES (11, '红烧豆腐', '发是否束带结发发发生的', '20230716110119000000279.jpg');
INSERT INTO `t_bigtype` VALUES (12, '的健身房私发', '方式发是否', '20230716111435000000175.jpg');
INSERT INTO `t_bigtype` VALUES (13, '卡莉法就是连接发', '水电费安抚地方水电费如果', 'default.jpg');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userId` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `totalPrice` decimal(8, 2) NULL DEFAULT NULL,
  `address` varchar(900) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `consignee` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telNumber` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `payDate` datetime(0) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (83, 'JAVA20220129103913000000494', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 5198.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-01-29 10:39:13', '2022-01-27 15:29:06', 1);
INSERT INTO `t_order` VALUES (84, 'JAVA20220129103913000001494', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 5198.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-01-29 10:39:13', '2022-01-27 15:29:06', 1);
INSERT INTO `t_order` VALUES (85, 'JAVA20220129103913000002494', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 5198.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-01-29 10:39:13', '2022-01-27 15:29:06', 1);
INSERT INTO `t_order` VALUES (86, 'JAVA20220129103913000003494', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 5198.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-01-29 10:39:13', '2022-01-27 15:29:06', 1);
INSERT INTO `t_order` VALUES (87, 'JAVA20220129103913000004494', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 5198.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-01-29 10:39:13', '2022-01-27 15:29:06', 1);
INSERT INTO `t_order` VALUES (88, 'JAVA20220129103913000005494', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 5198.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-01-29 10:39:13', '2022-01-27 15:29:06', 2);
INSERT INTO `t_order` VALUES (89, 'JAVA20220129103913000006494', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 5198.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-01-29 10:39:13', '2022-01-27 15:29:06', 2);
INSERT INTO `t_order` VALUES (90, 'JAVA20220129103913000007494', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 5198.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-01-29 10:39:13', '2022-01-27 15:29:06', 2);
INSERT INTO `t_order` VALUES (91, 'JAVA20220129103913000008494', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 5198.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-01-29 10:39:13', '2022-01-27 15:29:06', 2);
INSERT INTO `t_order` VALUES (92, 'JAVA20220129103913000009494', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 5198.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-01-29 10:39:13', '2022-01-27 15:29:06', 2);
INSERT INTO `t_order` VALUES (93, 'JAVA20220129103913000010494', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 5198.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-01-29 10:39:13', '2022-01-27 15:29:06', 2);
INSERT INTO `t_order` VALUES (94, 'JAVA20220129103913000011494', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 5198.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-01-29 10:39:13', '2022-01-27 15:29:06', 2);
INSERT INTO `t_order` VALUES (95, 'JAVA20220129103913000012494', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 5198.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-01-29 10:39:13', '2022-01-27 15:29:06', 2);
INSERT INTO `t_order` VALUES (96, 'JAVA20220129103913000013494', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 5198.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-01-29 10:39:13', '2022-01-27 15:29:06', 3);
INSERT INTO `t_order` VALUES (97, 'JAVA20220129035805000000052', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 2599.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-01-29 15:58:05', '2022-01-29 16:12:26', 2);
INSERT INTO `t_order` VALUES (98, 'JAVA20220129035946000000595', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 5198.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-01-29 15:59:47', '2022-01-29 16:14:07', 2);
INSERT INTO `t_order` VALUES (99, 'JAVA20220129040547000000824', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 3799.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-01-29 16:05:48', '2022-01-29 16:20:08', 2);
INSERT INTO `t_order` VALUES (100, 'JAVA20220129040836000000654', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 2599.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-01-29 16:08:37', '2022-01-29 16:12:52', 3);
INSERT INTO `t_order` VALUES (101, 'JAVA20220129041124000000758', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 2599.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-01-29 16:11:25', '2022-01-29 16:11:36', 2);
INSERT INTO `t_order` VALUES (102, 'JAVA20220129043412000000133', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 3799.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-01-29 16:34:12', '2022-01-29 16:34:26', 2);
INSERT INTO `t_order` VALUES (103, 'JAVA20220217071851000000421', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 2599.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-02-17 19:18:51', NULL, 1);
INSERT INTO `t_order` VALUES (104, 'JAVA20220217072440000000734', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 2599.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-02-17 19:24:41', NULL, 4);
INSERT INTO `t_order` VALUES (105, 'JAVA20220217072709000000080', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 17494.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-02-17 19:27:09', NULL, 3);
INSERT INTO `t_order` VALUES (106, 'JAVA20220221080859000000097', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 7497.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-02-21 08:08:59', '2022-02-21 08:09:24', 2);
INSERT INTO `t_order` VALUES (107, 'JAVA20220221082558000000449', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 31794.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-02-21 08:25:58', '2022-02-21 08:26:15', 3);
INSERT INTO `t_order` VALUES (108, 'JAVA20220226112352000000844', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 9696.00, '北京市北京市西城区新街口街道楼', '咯', '458698866', '2022-02-26 11:23:53', '2022-02-26 11:24:03', 2);
INSERT INTO `t_order` VALUES (109, 'JAVA20220226113103000000063', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 2599.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-02-26 11:31:03', NULL, 1);
INSERT INTO `t_order` VALUES (110, 'JAVA20220226114127000000088', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 2599.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-02-26 11:41:27', '2022-02-26 11:41:43', 2);
INSERT INTO `t_order` VALUES (111, 'JAVA20220226120649000000157', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 2599.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-02-26 12:06:49', '2022-02-26 12:07:03', 2);
INSERT INTO `t_order` VALUES (112, 'JAVA20220226121701000000063', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 2599.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-02-26 12:17:01', NULL, 1);
INSERT INTO `t_order` VALUES (113, 'JAVA20220226121703000000888', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 2599.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2022-02-26 12:17:04', '2022-02-26 12:17:18', 2);
INSERT INTO `t_order` VALUES (114, 'JAVA20220226124930000000901', 'o30ur5JpAsAUyGBkR0uW4IxvahR8', 13795.00, '江苏省南通市通州区万科大都会11栋11-11室', '小锋', '18862857105', '2022-02-26 12:49:31', '2022-02-26 12:49:43', 2);
INSERT INTO `t_order` VALUES (115, 'java20230611082701000000435', 'oGJfu5Ja1cS9p17DZkLzE84EdZbg', 2499.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2023-06-11 20:27:01', NULL, 1);
INSERT INTO `t_order` VALUES (116, 'java20230611100547000000351', 'oGJfu5Ja1cS9p17DZkLzE84EdZbg', 2499.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2023-06-11 22:05:47', NULL, 1);
INSERT INTO `t_order` VALUES (117, 'java20230611104847000000657', 'oGJfu5Ja1cS9p17DZkLzE84EdZbg', 2499.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2023-06-11 22:48:48', NULL, 1);
INSERT INTO `t_order` VALUES (118, 'java20230612063546000000658', 'oGJfu5Ja1cS9p17DZkLzE84EdZbg', 2599.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2023-06-12 18:35:47', NULL, 3);

-- ----------------------------
-- Table structure for t_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_order_detail`;
CREATE TABLE `t_order_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mId` int(11) NULL DEFAULT NULL,
  `goodsId` int(11) NULL DEFAULT NULL,
  `goodsNumber` int(11) NULL DEFAULT NULL,
  `goodsPrice` decimal(10, 0) NULL DEFAULT NULL,
  `goodsName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goodsPic` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 153 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order_detail
-- ----------------------------
INSERT INTO `t_order_detail` VALUES (122, 83, 14, 2, 2599, 'Xiaomi Civi', '9.png');
INSERT INTO `t_order_detail` VALUES (123, 97, 14, 1, 2599, 'Xiaomi Civi', '9.png');
INSERT INTO `t_order_detail` VALUES (124, 98, 14, 2, 2599, 'Xiaomi Civi', '9.png');
INSERT INTO `t_order_detail` VALUES (125, 99, 4, 1, 3799, 'Xiaomi 11', '6.png');
INSERT INTO `t_order_detail` VALUES (126, 100, 14, 1, 2599, 'Xiaomi Civi', '9.png');
INSERT INTO `t_order_detail` VALUES (127, 101, 14, 1, 2599, 'Xiaomi Civi', '9.png');
INSERT INTO `t_order_detail` VALUES (128, 102, 4, 1, 3799, 'Xiaomi 11', '6.png');
INSERT INTO `t_order_detail` VALUES (129, 103, 14, 1, 2599, 'Xiaomi Civi', '9.png');
INSERT INTO `t_order_detail` VALUES (130, 104, 14, 1, 2599, 'Xiaomi Civi', '9.png');
INSERT INTO `t_order_detail` VALUES (131, 105, 14, 2, 2599, 'Xiaomi Civi', '9.png');
INSERT INTO `t_order_detail` VALUES (132, 105, 4, 1, 3799, 'Xiaomi 11', '6.png');
INSERT INTO `t_order_detail` VALUES (133, 105, 16, 2, 1999, '小米平板5', '13.png');
INSERT INTO `t_order_detail` VALUES (134, 105, 6, 1, 4499, 'Xiaomi 11 Pro', '1.png');
INSERT INTO `t_order_detail` VALUES (135, 106, 5, 1, 2299, 'Redmi K40 游戏增强版', '11.png');
INSERT INTO `t_order_detail` VALUES (136, 106, 14, 2, 2599, 'Xiaomi Civi', '9.png');
INSERT INTO `t_order_detail` VALUES (137, 107, 14, 3, 2599, 'Xiaomi Civi', '9.png');
INSERT INTO `t_order_detail` VALUES (138, 107, 1, 2, 10999, '小米电视大师 82英寸', '21.png');
INSERT INTO `t_order_detail` VALUES (139, 107, 16, 1, 1999, '小米平板5', '13.png');
INSERT INTO `t_order_detail` VALUES (140, 108, 14, 2, 2599, 'Xiaomi Civi', '9.png');
INSERT INTO `t_order_detail` VALUES (141, 108, 16, 1, 1999, '小米平板5', '13.png');
INSERT INTO `t_order_detail` VALUES (142, 108, 11, 1, 2499, '黑鲨4', '7.png');
INSERT INTO `t_order_detail` VALUES (143, 109, 14, 1, 2599, 'Xiaomi Civi', '9.png');
INSERT INTO `t_order_detail` VALUES (144, 110, 14, 1, 2599, 'Xiaomi Civi', '9.png');
INSERT INTO `t_order_detail` VALUES (145, 111, 14, 1, 2599, 'Xiaomi Civi', '9.png');
INSERT INTO `t_order_detail` VALUES (146, 112, 14, 1, 2599, 'Xiaomi Civi', '9.png');
INSERT INTO `t_order_detail` VALUES (147, 113, 14, 1, 2599, 'Xiaomi Civi', '9.png');
INSERT INTO `t_order_detail` VALUES (148, 114, 14, 3, 2599, 'Xiaomi Civi', '9.png');
INSERT INTO `t_order_detail` VALUES (149, 114, 9, 2, 2999, 'Xiaomi 10S', '4.png');
INSERT INTO `t_order_detail` VALUES (150, 115, 11, 1, 2499, '黑鲨4', '7.png');
INSERT INTO `t_order_detail` VALUES (151, 116, 11, 1, 2499, '黑鲨4', '7.png');
INSERT INTO `t_order_detail` VALUES (152, 117, 11, 1, 2499, '黑鲨4', '7.png');
INSERT INTO `t_order_detail` VALUES (153, 118, 14, 1, 2599, 'Xiaomi Civi', '9.png');

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 0) NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT NULL,
  `proPic` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isHot` bit(1) NULL DEFAULT NULL,
  `isSwiper` bit(1) NULL DEFAULT NULL,
  `swiperPic` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `swiperSort` int(11) NULL DEFAULT NULL,
  `typeId` int(11) NULL DEFAULT NULL,
  `hotDateTime` datetime(0) NULL DEFAULT NULL,
  `productIntroImgs` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productParaImgs` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES (1, '小米电视大师 82英寸', 10999, 3451, '21.png', b'1', b'0', '2.jpg', 3, 14, '2023-07-29 14:26:11', '\"\"', '\"\"', '\"\"');
INSERT INTO `t_product` VALUES (4, 'Xiaomi 11', 3799, 3232, '6.png', b'1', b'0', 'default.jpg', 0, 2, '2021-07-28 21:36:34', '<img width=\'100%\' src=\'http://localhost:8080/image/productIntroImgs/11.jpg\'></img>', '<img width=\'100%\' src=\'http://localhost:8080/image/productParaImgs/11.jpg\'></img>', '「全版本领券立减200元，券后价3299元起；享至高24期免息；赠手机保护壳*1;【全款支付套装】赠果冻包」');
INSERT INTO `t_product` VALUES (5, 'Redmi K40 游戏增强版', 2299, 2005, '11.png', b'0', b'1', '1.jpg', 1, 39, NULL, '\"\"', '\"\"', '\"\"');
INSERT INTO `t_product` VALUES (6, 'Xiaomi 11 Pro', 4499, 2343, '1.png', b'1', b'0', 'default.jpg', 0, 2, '2021-09-28 21:36:34', '\"\"', NULL, NULL);
INSERT INTO `t_product` VALUES (7, 'Xiaomi MIX FOLD折叠屏手机', 7999, 2222, '2.png', b'1', b'0', 'default.jpg', 0, 3, '2021-10-28 21:36:34', '\"\"', NULL, NULL);
INSERT INTO `t_product` VALUES (8, 'Note 9 5G', 1199, 1111, '3.png', b'1', b'0', 'default.jpg', 0, 40, '2021-09-28 21:36:34', '\"\"', NULL, NULL);
INSERT INTO `t_product` VALUES (9, 'Xiaomi 10S', 2999, 1111, '4.png', b'1', b'0', 'default.jpg', 0, 2, '2021-12-28 21:36:34', '\"\"', NULL, NULL);
INSERT INTO `t_product` VALUES (10, 'Note 9 Pro 5G', 1399, 2222, '5.png', b'1', b'0', 'default.jpg', 0, 40, '2021-11-28 21:36:34', '\"\"', NULL, NULL);
INSERT INTO `t_product` VALUES (11, '黑鲨4', 2499, 3322, '7.png', b'1', b'0', 'default.jpg', 0, 41, '2021-11-28 21:36:34', '\"\"', NULL, NULL);
INSERT INTO `t_product` VALUES (12, 'Redmi  K40 Pro 系列', 2499, 3244, '8.png', b'1', b'0', 'default.jpg', 0, 39, '2021-11-28 21:36:34', NULL, NULL, NULL);
INSERT INTO `t_product` VALUES (14, 'Xiaomi Civi', 2599, 4444, '9.png', b'0', b'0', 'default.jpg', 0, 1, NULL, '<img width=\'100%\' src=\'http://localhost:8080/image/productIntroImgs/1.jpg\'></img><img width=\'100%\' src=\'http://localhost:8080/image/productIntroImgs/2.jpg\'></img><img width=\'100%\' src=\'http://localhost:8080/image/productIntroImgs/3.jpg\'></img>', '<img width=\'100%\' src=\'http://localhost:8080/image/productParaImgs/1.jpg\'></img><img width=\'100%\' src=\'http://localhost:8080/image/productParaImgs/2.jpg\'></img>', '「购机至高享24期免息；赠Redmi AirDots 2真无线蓝牙耳机；赠Keep会员7天体验卡；+110元得Air2 SE蓝牙耳机」');
INSERT INTO `t_product` VALUES (15, 'Xiaomi 11 Ultra', 5499, 4444, '10.png', b'0', b'0', 'default.jpg', 0, 2, NULL, NULL, NULL, NULL);
INSERT INTO `t_product` VALUES (16, '小米平板5', 1999, 444, '13.png', b'0', b'0', 'default.jpg', 0, 5, NULL, '<img src=\'http://localhost:8080/image/productIntroImgs/111.jpg\'></img><img width=\'100%\' src=\'http://localhost:8080/image/productIntroImgs/222.jpg\'></img><img width=\'100%\' src=\'http://localhost:8080/image/productIntroImgs/333.jpg\'></img>', '<img width=\'100%\' src=\'http://localhost:8080/image/productParaImgs/111.jpg\'></img>', '11英寸大屏 2.5K超清显示 120Hz高刷新率');
INSERT INTO `t_product` VALUES (17, '小米平板5 Pro', 2499, 444, '14.png', b'0', b'0', 'default.jpg', 0, 5, NULL, NULL, NULL, NULL);
INSERT INTO `t_product` VALUES (19, 'RedmiBook Pro 15 增强版', 5299, 444, '15.png', b'0', b'0', 'default.jpg', 0, 6, NULL, NULL, NULL, NULL);
INSERT INTO `t_product` VALUES (20, 'Redmi G 2021', 6499, 1999, '16.png', b'0', b'1', '3.jpg', 2, 6, NULL, NULL, NULL, NULL);
INSERT INTO `t_product` VALUES (21, 'Redmi G 2021 锐龙版', 7499, 2000, '17.png', b'0', b'0', 'default.jpg', 0, 6, NULL, NULL, NULL, NULL);
INSERT INTO `t_product` VALUES (22, 'RedmiBook Pro 14 增强版', 4999, 777, '18.png', b'0', b'0', 'default.jpg', 0, 6, NULL, NULL, NULL, NULL);
INSERT INTO `t_product` VALUES (23, '小米笔记本 Pro 14 锐龙版', 5499, 666, '19.png', b'0', b'0', 'default.jpg', 0, 7, NULL, NULL, NULL, NULL);
INSERT INTO `t_product` VALUES (24, '小米笔记本 Pro 14 增强版', 5499, 666, '20.png', b'1', b'0', 'default.jpg', 0, 7, NULL, NULL, NULL, NULL);
INSERT INTO `t_product` VALUES (26, '1', 1, 1, 'default.jpg', b'0', b'0', 'default.jpg', 0, 6, NULL, '1', '1', NULL);
INSERT INTO `t_product` VALUES (27, '1', 2, 3, 'default.jpg', b'0', b'0', 'default.jpg', 0, 6, NULL, '5', '6', '4');
INSERT INTO `t_product` VALUES (28, '2', 3, 4, 'default.jpg', b'0', b'0', 'default.jpg', 0, 6, NULL, '6', '7', '5');
INSERT INTO `t_product` VALUES (29, '1', 1, 1, '20230729031445000000781.jpg', b'0', b'1', '20230730051849000000507.jpg', 5, 11, NULL, '1', '1', '1');

-- ----------------------------
-- Table structure for t_product_swiper_image
-- ----------------------------
DROP TABLE IF EXISTS `t_product_swiper_image`;
CREATE TABLE `t_product_swiper_image`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `productId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_product_swiper_image
-- ----------------------------
INSERT INTO `t_product_swiper_image` VALUES (1, '1.jpg', 1, 14);
INSERT INTO `t_product_swiper_image` VALUES (2, '2.jpg', 2, 14);
INSERT INTO `t_product_swiper_image` VALUES (3, '3.jpg', 3, 14);
INSERT INTO `t_product_swiper_image` VALUES (4, '4.jpg', 4, 14);
INSERT INTO `t_product_swiper_image` VALUES (5, '5.jpg', 5, 14);
INSERT INTO `t_product_swiper_image` VALUES (6, '6.jpg', 6, 14);
INSERT INTO `t_product_swiper_image` VALUES (7, '7.jpg', 7, 14);
INSERT INTO `t_product_swiper_image` VALUES (8, '11.jpg', 1, 4);
INSERT INTO `t_product_swiper_image` VALUES (9, '22.jpg', 2, 4);
INSERT INTO `t_product_swiper_image` VALUES (10, '33.jpg', 3, 4);
INSERT INTO `t_product_swiper_image` VALUES (11, '44.jpg', 4, 4);
INSERT INTO `t_product_swiper_image` VALUES (12, '111.jpg', 1, 16);
INSERT INTO `t_product_swiper_image` VALUES (13, '222.jpg', 2, 16);
INSERT INTO `t_product_swiper_image` VALUES (14, '333.jpg', 3, 16);
INSERT INTO `t_product_swiper_image` VALUES (15, '20230730104534000000246.jpg', 0, 1);

-- ----------------------------
-- Table structure for t_smalltype
-- ----------------------------
DROP TABLE IF EXISTS `t_smalltype`;
CREATE TABLE `t_smalltype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bigTypeId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_smalltype
-- ----------------------------
INSERT INTO `t_smalltype` VALUES (1, 'Xiaomi Civi', 'Xiaomi Civi', 1);
INSERT INTO `t_smalltype` VALUES (2, 'Xiaomi 数字系列', 'Xiaomi 数字系列', 1);
INSERT INTO `t_smalltype` VALUES (3, 'Xiaomi MIX系列', 'Xiaomi MIX系列', 1);
INSERT INTO `t_smalltype` VALUES (4, '手机安环部', '水电费是否撒', 5);
INSERT INTO `t_smalltype` VALUES (5, '小米平板', '小米平板', 2);
INSERT INTO `t_smalltype` VALUES (6, 'RedmiBook', 'RedmiBook', 2);
INSERT INTO `t_smalltype` VALUES (7, '小米笔记本', '小米笔记本', 2);
INSERT INTO `t_smalltype` VALUES (8, '是的副驾驶顶顶顶顶顶顶顶顶顶', '是对方是否水电费是发顶顶顶顶顶顶顶顶顶顶的点点滴滴多多多多多多多多多打发是否        的点点滴滴的点点滴滴多多多多多多多多多顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶', 7);
INSERT INTO `t_smalltype` VALUES (10, '耳机', '耳机', 3);
INSERT INTO `t_smalltype` VALUES (11, '手表', '手表', 3);
INSERT INTO `t_smalltype` VALUES (12, '手环', '手环', 3);
INSERT INTO `t_smalltype` VALUES (13, '电视', '电视', 4);
INSERT INTO `t_smalltype` VALUES (14, '小米电视大师', '小米电视大师', 4);
INSERT INTO `t_smalltype` VALUES (15, '电视配件', '电视配件', 4);
INSERT INTO `t_smalltype` VALUES (16, '空调', '空调', 5);
INSERT INTO `t_smalltype` VALUES (17, '洗衣机', '洗衣机', 5);
INSERT INTO `t_smalltype` VALUES (18, '冰箱', '冰箱', 5);
INSERT INTO `t_smalltype` VALUES (19, '厨房大电', '厨房大电', 5);
INSERT INTO `t_smalltype` VALUES (20, '厨房小电', '厨房小电', 6);
INSERT INTO `t_smalltype` VALUES (21, '清洁电器', '清洁电器', 6);
INSERT INTO `t_smalltype` VALUES (22, '环境电器', '环境电器', 6);
INSERT INTO `t_smalltype` VALUES (23, '生活电器', '生活电器', 6);
INSERT INTO `t_smalltype` VALUES (24, '小爱音箱', '小爱音箱', 7);
INSERT INTO `t_smalltype` VALUES (25, '路由器', '路由器', 7);
INSERT INTO `t_smalltype` VALUES (26, '智能安防', '智能安防', 7);
INSERT INTO `t_smalltype` VALUES (27, '智能控制', '智能控制', 7);
INSERT INTO `t_smalltype` VALUES (28, '户外出行', '户外出行', 8);
INSERT INTO `t_smalltype` VALUES (29, '箱包', '箱包', 8);
INSERT INTO `t_smalltype` VALUES (30, '家具日用', '家具日用', 9);
INSERT INTO `t_smalltype` VALUES (31, '防护清洁', '防护清洁', 9);
INSERT INTO `t_smalltype` VALUES (32, '会员定制', '会员定制', 9);
INSERT INTO `t_smalltype` VALUES (33, '个人护理', '个人护理', 9);
INSERT INTO `t_smalltype` VALUES (34, '健康', '健康', 9);
INSERT INTO `t_smalltype` VALUES (35, '鞋服配饰', '鞋服配饰', 9);
INSERT INTO `t_smalltype` VALUES (36, '床品家居', '床品家居', 9);
INSERT INTO `t_smalltype` VALUES (37, '礼品周边', '礼品周边', 9);
INSERT INTO `t_smalltype` VALUES (38, '儿童用品', '儿童用品', 10);
INSERT INTO `t_smalltype` VALUES (39, 'Redmi K系列', 'K系列', 1);
INSERT INTO `t_smalltype` VALUES (40, 'Redmi Note系列', 'Note系列', 1);
INSERT INTO `t_smalltype` VALUES (41, '游戏手机', '游戏手机', 1);
INSERT INTO `t_smalltype` VALUES (44, '22', '22', 3);
INSERT INTO `t_smalltype` VALUES (45, '是', '3 是', 2);
INSERT INTO `t_smalltype` VALUES (46, 'ewew', 'ew', 3);
INSERT INTO `t_smalltype` VALUES (47, 'rrr', 'rrr', 2);
INSERT INTO `t_smalltype` VALUES (48, '43', '4343', 2);
INSERT INTO `t_smalltype` VALUES (49, '5', '55', 4);

-- ----------------------------
-- Table structure for t_wxuserinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_wxuserinfo`;
CREATE TABLE `t_wxuserinfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickName` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatarUrl` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `registerDate` datetime(0) NULL DEFAULT NULL,
  `lastLoginDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_wxuserinfo
-- ----------------------------
INSERT INTO `t_wxuserinfo` VALUES (5, 'o30ur5JpAsAUyGBkR0uW4IxvahR8', '小锋一号@java1234', 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', '2022-01-08 22:19:11', '2022-03-11 08:30:55');
INSERT INTO `t_wxuserinfo` VALUES (6, 'oGJfu5Ja1cS9p17DZkLzE84EdZbg', '微信用户', 'https://thirdwx.qlogo.cn/mmopen/vi_32/POgEwh4mIHO4nibH0KlMECNjjGxQUq24ZEaGT4poC6icRiccVGKSyXwibcPq4BWmiaIGuG1icwxaQX6grC9VemZoJ8rg/132', '2023-06-11 15:08:25', '2024-09-14 16:45:08');
INSERT INTO `t_wxuserinfo` VALUES (7, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (8, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (9, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (10, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (11, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (12, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (13, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (14, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (15, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (16, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (17, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (18, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (19, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (20, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (21, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (22, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (23, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (24, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (25, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (26, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (27, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (28, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (29, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (30, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/GJeHhQSiczuph0tg4JyleLeDUnIghqXlQBiaUAJMvia8GRSjibYdPmFQrvPic6sAhyTz4C8Ivu1aWah3KpFMBdsPibEw/132', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
