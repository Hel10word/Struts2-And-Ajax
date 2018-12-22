/*
 Navicat Premium Data Transfer

 Source Server         : 毕业设计-混合式APP开发
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : server

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 22/12/2018 13:52:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for allinfo
-- ----------------------------
DROP TABLE IF EXISTS `allinfo`;
CREATE TABLE `allinfo`  (
  `SendName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发送者',
  `Content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReceiveName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接收者',
  `IsRead` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否已读(Y\\N)',
  `Time` datetime(0) DEFAULT NULL COMMENT '时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of allinfo
-- ----------------------------
INSERT INTO `allinfo` VALUES ('王五', '你好不好', '威士忌', 'Y', '2018-12-18 15:41:44');
INSERT INTO `allinfo` VALUES ('王五', '😒😉👿👿👿', '威士忌', 'Y', '2018-12-18 15:41:58');
INSERT INTO `allinfo` VALUES ('李四', '哈哈', '李四', 'Y', '2018-12-18 15:41:58');
INSERT INTO `allinfo` VALUES ('喂丝机', '拉了拉 ', '王五', 'Y', '2018-12-18 15:41:58');
INSERT INTO `allinfo` VALUES ('王五', '哈哈哈', '黄樟', 'Y', '2018-12-18 19:44:22');
INSERT INTO `allinfo` VALUES ('王五', '你好啊~  我四级', '喂丝机', 'Y', '2018-12-18 19:46:51');
INSERT INTO `allinfo` VALUES ('喂丝机', '哪啊', '李四', 'Y', '2018-12-19 10:08:29');
INSERT INTO `allinfo` VALUES ('喂丝机', '  ', '张三', 'Y', '2018-12-19 10:08:53');
INSERT INTO `allinfo` VALUES ('喂丝机', '啦啦', '胡二', 'Y', '2018-12-19 10:11:42');
INSERT INTO `allinfo` VALUES ('威士忌', '是大叔', '王五', 'Y', '2018-12-20 18:56:16');
INSERT INTO `allinfo` VALUES ('威士忌', '阿斯达', '王五', 'Y', '2018-12-20 19:30:02');
INSERT INTO `allinfo` VALUES ('威士忌', '啊撒大声地', '王五', 'Y', '2018-12-20 19:30:07');
INSERT INTO `allinfo` VALUES ('威士忌', ' 阿斯顿发', '王五', 'Y', '2018-12-20 19:30:09');
INSERT INTO `allinfo` VALUES ('威士忌', '阿斯顿发', '王五', 'Y', '2018-12-20 19:30:11');
INSERT INTO `allinfo` VALUES ('威士忌', '电饭锅飞', '王五', 'Y', '2018-12-20 19:30:14');
INSERT INTO `allinfo` VALUES ('威士忌', '顶顶顶顶', '王五', 'Y', '2018-12-20 19:30:15');
INSERT INTO `allinfo` VALUES ('威士忌', '的的 ', '王五', 'Y', '2018-12-20 19:30:18');
INSERT INTO `allinfo` VALUES ('王五', '哈哈哈 ', '威士忌', 'Y', '2018-12-22 13:30:14');
INSERT INTO `allinfo` VALUES ('李四', '你好啊<br><br>', '喂丝机', 'Y', '2018-12-22 13:39:46');
INSERT INTO `allinfo` VALUES ('喂丝机', '拉拉阿拉  ~~<br><br>', '小王王 ', 'Y', '2018-12-22 13:40:11');

SET FOREIGN_KEY_CHECKS = 1;
