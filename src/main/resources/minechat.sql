
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) DEFAULT NULL COMMENT '发送人id',
  `to_id` int(11) DEFAULT NULL COMMENT '接收人id',
  `msg` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '消息内容',
  `time` datetime DEFAULT NULL COMMENT '发送时间',
  `type` int(11) DEFAULT NULL COMMENT '消息类型',
  `online` int(11) DEFAULT NULL COMMENT '1在线 	0离线',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('7', '3', '2', '哈哈', '2019-05-13 21:20:17', '1', null);
INSERT INTO `message` VALUES ('8', '2', '7', '哈哈', '2019-05-13 21:55:01', '1', null);
INSERT INTO `message` VALUES ('9', '2', '3', '哈哈', '2019-05-14 08:49:49', '1', null);
INSERT INTO `message` VALUES ('10', '3', '2', '666', '2019-05-14 08:53:39', '1', null);
INSERT INTO `message` VALUES ('11', '3', '2', '李四，今晚一起打王者', '2019-05-14 09:04:22', '1', null);
INSERT INTO `message` VALUES ('12', '2', '3', '好呀', '2019-05-14 09:04:44', '1', null);
INSERT INTO `message` VALUES ('13', '3', '2', '今晚八点不见不散', '2019-05-14 10:48:33', '1', null);
INSERT INTO `message` VALUES ('14', '2', '3', '吃饭洗澡就上线', '2019-05-14 10:48:55', '1', null);
INSERT INTO `message` VALUES ('15', '2', '3', '吃饭洗澡就上线', '2019-05-14 10:48:57', '1', null);
INSERT INTO `message` VALUES ('16', '2', '3', '吃饭洗澡就上线', '2019-05-14 10:48:58', '1', null);
INSERT INTO `message` VALUES ('17', '2', '3', '吃饭洗澡就上线', '2019-05-14 10:48:59', '1', null);
INSERT INTO `message` VALUES ('18', '2', '3', '吃饭洗澡就上线', '2019-05-14 10:49:00', '1', null);
INSERT INTO `message` VALUES ('19', '2', '3', '吃饭洗澡就上线', '2019-05-14 10:49:01', '1', null);
INSERT INTO `message` VALUES ('20', '2', '3', '吃饭洗澡就上线', '2019-05-14 10:49:02', '1', null);
INSERT INTO `message` VALUES ('21', '2', '3', '吃饭洗澡就上线', '2019-05-14 10:49:03', '1', null);
INSERT INTO `message` VALUES ('22', '2', '3', '吃饭洗澡就上线', '2019-05-14 10:49:04', '1', null);
INSERT INTO `message` VALUES ('23', '2', '3', '吃饭洗澡就上线', '2019-05-14 10:49:05', '1', null);
INSERT INTO `message` VALUES ('24', '2', '3', 'hah', '2019-05-14 11:14:44', '1', null);
INSERT INTO `message` VALUES ('25', '2', '3', '666666', '2019-05-14 11:41:46', '1', null);
INSERT INTO `message` VALUES ('26', '3', '2', '无耻之徒', '2019-05-14 11:43:42', '1', null);
INSERT INTO `message` VALUES ('27', '3', '2', '哈哈', '2019-05-14 11:44:13', '1', null);
INSERT INTO `message` VALUES ('28', '3', '2', '你好', '2019-05-14 11:46:00', '1', null);
INSERT INTO `message` VALUES ('29', '3', '2', '吃饱了没事干', '2019-05-14 11:47:15', '1', null);
INSERT INTO `message` VALUES ('30', '2', '3', 'hh', '2019-05-14 11:48:22', '1', null);
INSERT INTO `message` VALUES ('31', '3', '2', '555', '2019-05-14 11:48:33', '1', null);
INSERT INTO `message` VALUES ('32', '3', '2', '哈哈', '2019-05-14 11:49:32', '1', null);
INSERT INTO `message` VALUES ('33', '2', '3', 'haojiubujian ', '2019-05-14 11:49:39', '1', null);
INSERT INTO `message` VALUES ('34', '3', '7', '哈哈', '2019-05-14 11:51:13', '1', null);
INSERT INTO `message` VALUES ('35', '3', '2', '666', '2019-05-14 14:08:27', '1', null);
INSERT INTO `message` VALUES ('36', '3', '2', '哈哈', '2019-05-14 14:09:29', '1', null);
INSERT INTO `message` VALUES ('37', '3', '2', '好玩', '2019-05-14 14:10:42', '1', null);
INSERT INTO `message` VALUES ('38', '2', '3', '真是不错', '2019-05-14 14:10:55', '1', null);
INSERT INTO `message` VALUES ('39', '3', '2', '嗯', '2019-05-14 14:12:58', '1', null);
INSERT INTO `message` VALUES ('40', '2', '7', '李四邀请今晚玩游戏', '2019-05-14 16:00:55', '1', null);
INSERT INTO `message` VALUES ('41', '7', '2', '知道了', '2019-05-14 16:01:22', '1', null);
INSERT INTO `message` VALUES ('42', '7', '2', '666', '2019-05-14 16:02:12', '1', null);
INSERT INTO `message` VALUES ('43', '7', '2', '哈哈', '2019-05-14 16:24:04', '1', null);
INSERT INTO `message` VALUES ('44', '2', '7', '今晚不见不散', '2019-05-14 16:24:22', '1', null);
INSERT INTO `message` VALUES ('45', '2', '3', '嘻嘻', '2019-05-14 16:25:21', '1', null);
INSERT INTO `message` VALUES ('46', '3', '2', '666', '2019-05-14 16:25:26', '1', null);
INSERT INTO `message` VALUES ('47', '2', '3', '嗯', '2019-05-14 16:26:22', '1', null);
INSERT INTO `message` VALUES ('48', '3', '7', '666', '2019-05-14 16:28:13', '1', null);
INSERT INTO `message` VALUES ('49', '7', '3', '嗯', '2019-05-14 16:28:17', '1', null);
INSERT INTO `message` VALUES ('50', '7', '3', '嘻嘻', '2019-05-14 16:28:23', '1', null);
INSERT INTO `message` VALUES ('51', '3', '7', '666', '2019-05-14 16:28:45', '1', null);
INSERT INTO `message` VALUES ('52', '7', '3', '哈哈', '2019-05-14 16:28:48', '1', null);
INSERT INTO `message` VALUES ('53', '3', '7', '777', '2019-05-14 16:29:40', '1', null);
INSERT INTO `message` VALUES ('54', '2', '7', '嘻嘻', '2019-05-14 16:30:27', '1', null);
INSERT INTO `message` VALUES ('55', '2', '7', '88888', '2019-05-14 16:30:40', '1', null);
INSERT INTO `message` VALUES ('56', '2', '7', '999', '2019-05-14 16:31:01', '1', null);
INSERT INTO `message` VALUES ('57', '2', '7', '999', '2019-05-14 16:31:27', '1', null);
INSERT INTO `message` VALUES ('58', '2', '7', '222222', '2019-05-14 16:31:55', '1', null);
INSERT INTO `message` VALUES ('59', '2', '7', '666', '2019-05-14 16:43:37', '1', null);
INSERT INTO `message` VALUES ('60', '7', '2', '1111', '2019-05-14 16:44:24', '1', null);
INSERT INTO `message` VALUES ('61', '2', '7', '哈哈', '2019-05-14 16:44:32', '1', null);
INSERT INTO `message` VALUES ('62', '7', '2', '嘻嘻', '2019-05-14 16:46:27', '1', null);
INSERT INTO `message` VALUES ('63', '2', '7', '666', '2019-05-14 16:46:40', '1', null);
INSERT INTO `message` VALUES ('64', '2', '7', '大吉大利，今晚吃鸡', '2019-05-14 16:47:06', '1', null);
INSERT INTO `message` VALUES ('65', '7', '2', '嗯哼', '2019-05-14 16:47:37', '1', null);
INSERT INTO `message` VALUES ('66', '2', '3', '嘻嘻', '2019-05-15 19:37:35', '1', null);
INSERT INTO `message` VALUES ('67', '3', '2', '哈哈', '2019-05-15 19:37:44', '1', null);
INSERT INTO `message` VALUES ('82', '2', '12', '哈喽，管理员', '2019-05-16 18:09:39', '1', null);
INSERT INTO `message` VALUES ('83', null, null, '这是系统消息！', '2019-05-16 20:46:44', '2', null);
INSERT INTO `message` VALUES ('84', '2', '12', '哈哈', '2019-05-16 21:35:59', '1', null);
INSERT INTO `message` VALUES ('85', '12', '2', '666', '2019-05-16 21:37:25', '1', null);
INSERT INTO `message` VALUES ('86', '2', '12', '66', '2019-05-16 21:39:18', '1', null);
INSERT INTO `message` VALUES ('87', '2', '12', '哈哈', '2019-05-16 21:40:19', '1', null);
INSERT INTO `message` VALUES ('88', '2', '12', '666', '2019-05-16 21:41:04', '1', null);
INSERT INTO `message` VALUES ('89', '2', '12', '哈哈', '2019-05-16 21:41:37', '1', null);
INSERT INTO `message` VALUES ('90', '2', '12', '牛逼', '2019-05-16 21:41:58', '1', null);
INSERT INTO `message` VALUES ('91', '2', '12', '嗯哼', '2019-05-16 21:43:47', '1', null);
INSERT INTO `message` VALUES ('92', '2', '12', '哈哈', '2019-05-16 21:44:59', '1', null);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', '系统管理员');
INSERT INTO `roles` VALUES ('2', '普通用户');

-- ----------------------------
-- Table structure for roles_user
-- ----------------------------
DROP TABLE IF EXISTS `roles_user`;
CREATE TABLE `roles_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT '2',
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `roles_user_ibfk_2` (`uid`),
  CONSTRAINT `roles_user_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `roles` (`id`),
  CONSTRAINT `roles_user_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles_user
-- ----------------------------
INSERT INTO `roles_user` VALUES ('1', '1', '12');
INSERT INTO `roles_user` VALUES ('2', '2', '2');
INSERT INTO `roles_user` VALUES ('3', '2', '3');
INSERT INTO `roles_user` VALUES ('5', '2', '17');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `nickname` varchar(64) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `email` varchar(64) DEFAULT NULL,
  `userface` varchar(255) DEFAULT NULL,
  `regTime` datetime DEFAULT NULL,
  `online` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', '13222222222', '张三', 'c73fe4bf4f71d6c53f58b8483b8d8eda841e23d095c3dba7456c5c055e8f01e0f5be28bc650c74625a752ee478f78a8e0f4b2e233e70a26f3f00786ae1f1f58a', '1', null, null, '2019-05-10 10:56:11', '0');
INSERT INTO `user` VALUES ('3', '18888888888', '李四', '0aa40593e996db4fa5635833fb764fb6bf1c60b5029f8d9487962633b02b56b4bb6ae23dee925089cb423a1448b1c22dfbce9e199adc8a2cccebdf31df05a846', '1', null, null, '2019-05-10 14:10:01', '0');
INSERT INTO `user` VALUES ('12', 'admin', '管理员', '78f993c60a6126c528888696e787ecfb8fb554df37379163538d654e61e2dc9f89e2ab8bdf1ebc21df93e17307b05a76a8ba6a9f214ded51c6bf408e6b68c167', '1', null, null, '2019-05-15 19:57:46', '0');
INSERT INTO `user` VALUES ('17', '13333333333', '13333333333', '48dbe988558b746aa3ea47324c6c01059acb1c54cac5eb34b48e76767a1626b183aeb63e32b3de5448db65f3b05991c5d62c5b230256934a15f2d7545706715c', '1', null, null, '2019-05-15 21:00:54', '0');
SET FOREIGN_KEY_CHECKS=1;
