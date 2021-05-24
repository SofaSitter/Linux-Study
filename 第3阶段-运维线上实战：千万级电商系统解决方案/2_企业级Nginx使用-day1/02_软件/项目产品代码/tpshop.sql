/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : tpshop666

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-04-12 11:08:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tpshop_address
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_address`;
CREATE TABLE `tpshop_address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `consignee` varchar(64) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '收货地址',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '收货人手机号',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL COMMENT '软删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_address
-- ----------------------------
INSERT INTO `tpshop_address` VALUES ('29', '1', '司马懿', '北京市朝阳区崔各庄', '13102460166', '1523501542', '1523501542', null);
INSERT INTO `tpshop_address` VALUES ('30', '2', '张晓', '北京市昌平区吗啡家', '13102460166', '1523502219', '1523502219', null);

-- ----------------------------
-- Table structure for tpshop_attribute
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_attribute`;
CREATE TABLE `tpshop_attribute` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `attr_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性名称',
  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT '类型id',
  `attr_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '属性类型 0唯一属性 1单选属性 2复选属性',
  `attr_input_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '录入方式: 0输入框 1下拉列表 2多选框',
  `attr_values` varchar(255) NOT NULL DEFAULT '' COMMENT '供选择的属性值',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_attribute
-- ----------------------------
INSERT INTO `tpshop_attribute` VALUES ('5', '口味', '1', '1', '2', '原味,奶油,草莓,五香,麻辣', '1521363238', '1521363238', null);
INSERT INTO `tpshop_attribute` VALUES ('7', '产地', '1', '0', '0', '', '1521363346', '1521363346', null);
INSERT INTO `tpshop_attribute` VALUES ('8', '包装', '1', '1', '2', '袋装,盒装', '1521364941', '1521364941', null);
INSERT INTO `tpshop_attribute` VALUES ('9', '产品规格', '1', '0', '1', '200g,300g,500g', '1521365005', '1521365005', null);
INSERT INTO `tpshop_attribute` VALUES ('10', '颜色', '2', '1', '2', '金色,白色,黑色,粉色,红色', '1522821302', '1522821302', null);
INSERT INTO `tpshop_attribute` VALUES ('11', '内存', '2', '1', '2', '64G,128G,256G', '1522821328', '1522821328', null);
INSERT INTO `tpshop_attribute` VALUES ('12', '产地', '2', '0', '0', '', '1522821418', '1522821418', null);
INSERT INTO `tpshop_attribute` VALUES ('13', '系统', '2', '0', '1', 'IOS,Android', '1522821482', '1522821482', null);

-- ----------------------------
-- Table structure for tpshop_auth
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_auth`;
CREATE TABLE `tpshop_auth` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `auth_name` varchar(20) NOT NULL COMMENT '权限名称',
  `pid` smallint(6) unsigned NOT NULL COMMENT '父id',
  `auth_c` varchar(32) NOT NULL DEFAULT '' COMMENT '控制器',
  `auth_a` varchar(32) NOT NULL DEFAULT '' COMMENT '操作方法',
  `is_nav` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否作为菜单显示 1是 0否',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_auth
-- ----------------------------
INSERT INTO `tpshop_auth` VALUES ('1', '权限管理', '0', '', '', '1', '1520408547', null, null);
INSERT INTO `tpshop_auth` VALUES ('2', '商品管理', '0', '', '', '1', '1520408547', null, null);
INSERT INTO `tpshop_auth` VALUES ('3', '订单管理', '0', '', '', '1', '1520408547', null, null);
INSERT INTO `tpshop_auth` VALUES ('4', '管理员列表', '1', 'Manager', 'index', '1', '1520408547', null, null);
INSERT INTO `tpshop_auth` VALUES ('5', '管理员新增', '1', 'Manager', 'create', '1', '1520408547', null, null);
INSERT INTO `tpshop_auth` VALUES ('6', '角色管理', '1', 'Role', 'index', '1', '1520408547', null, null);
INSERT INTO `tpshop_auth` VALUES ('7', '权限管理', '1', 'Auth', 'index', '1', '1520408547', null, null);
INSERT INTO `tpshop_auth` VALUES ('8', '商品列表', '2', 'Goods', 'index', '1', '1520408547', null, null);
INSERT INTO `tpshop_auth` VALUES ('9', '商品新增', '2', 'Goods', 'create', '1', '1520408547', null, null);
INSERT INTO `tpshop_auth` VALUES ('10', '商品类型', '2', 'Type', 'index', '1', '1520408547', null, null);
INSERT INTO `tpshop_auth` VALUES ('11', '订单列表', '3', 'Order', 'index', '1', '1520408547', null, null);
INSERT INTO `tpshop_auth` VALUES ('12', '添加订单', '3', 'Order', 'create', '1', '1520408547', null, null);
INSERT INTO `tpshop_auth` VALUES ('13', '商品删除', '2', 'Goods', 'delete', '0', '1521272189', '1521272189', null);
INSERT INTO `tpshop_auth` VALUES ('14', '商品属性', '2', 'Attribute', 'index', '1', '1521507069', '1521507069', null);

-- ----------------------------
-- Table structure for tpshop_cart
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_cart`;
CREATE TABLE `tpshop_cart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_attr_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '商品属性ids（多个id用,分隔）',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_cart
-- ----------------------------
INSERT INTO `tpshop_cart` VALUES ('9', '1', '34', '75,78', '4', '1522900466', '1522900466', null);
INSERT INTO `tpshop_cart` VALUES ('10', '1', '35', '82,85', '2', '1522900466', '1522900466', null);
INSERT INTO `tpshop_cart` VALUES ('11', '1', '35', 'undefined,85', '3', '1522900466', '1522900466', null);
INSERT INTO `tpshop_cart` VALUES ('12', '2', '33', '67,71', '1', '1523502201', '1523502201', null);

-- ----------------------------
-- Table structure for tpshop_category
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_category`;
CREATE TABLE `tpshop_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(255) NOT NULL DEFAULT '' COMMENT '分类名称',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级分类',
  `is_show` tinyint(3) NOT NULL DEFAULT '1' COMMENT '是否显示 0不显示 1显示',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1038 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_category
-- ----------------------------
INSERT INTO `tpshop_category` VALUES ('1', '家用电器', '0', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('2', '电视', '1', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('3', '空调', '1', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('4', '洗衣机', '1', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('5', '冰箱', '1', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('6', '厨卫大电', '1', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('7', '厨房小电', '1', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('8', '生活电器', '1', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('9', '手机/运营商/数码', '0', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('10', '手机通讯', '9', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('11', '运营商', '9', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('12', '手机配件', '9', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('13', '摄影摄像', '9', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('14', '数码配件', '9', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('15', '影音娱乐', '9', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('16', '智能设备', '9', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('17', '电脑/办公', '0', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('18', '电脑整机', '17', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('19', '电脑配件', '17', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('20', '外设产品', '17', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('21', '游戏设备', '17', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('22', '网络产品', '17', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('23', '办公设备', '17', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('24', '文具耗材', '17', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('25', '家居/家具/家装/厨具', '0', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('26', '厨具', '25', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('27', '家纺', '25', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('28', '生活日用', '25', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('29', '家装软饰', '25', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('30', '灯具', '25', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('31', '家具', '25', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('32', '家装主材', '25', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('33', '男装/女装/童装/内衣', '0', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('34', '女装', '33', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('35', '男装', '33', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('36', '内衣', '33', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('37', '配饰', '33', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('38', '童装', '33', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('39', '童鞋', '33', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('40', '美妆个护/宠物', '0', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('41', '面部护肤', '40', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('42', '洗发护发', '40', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('43', '身体护理', '40', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('44', '口腔护理', '40', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('45', '女性护理', '40', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('46', '香水彩妆', '40', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('47', '清洁用品', '40', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('48', '女鞋/箱包/钟表/珠宝', '0', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('49', '时尚女鞋', '48', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('50', '潮流女包', '48', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('51', '精品男包', '48', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('52', '功能箱包', '48', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('53', '奢侈品', '48', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('54', '精选大牌', '48', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('55', '钟表', '48', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('56', '男鞋/运动/户外', '0', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('57', '流行男鞋', '56', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('58', '运动鞋包', '56', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('59', '运动服饰', '56', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('60', '健身训练', '56', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('61', '骑行运动', '56', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('62', '体育用品', '56', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('63', '户外鞋服', '56', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('64', '房产/汽车/汽车用品', '0', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('65', '房产', '64', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('66', '汽车车型', '64', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('67', '汽车价格', '64', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('68', '汽车品牌', '64', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('69', '维修保养', '64', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('70', '汽车装饰', '64', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('71', '车载电器', '64', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('72', '母婴/玩具乐器', '0', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('73', '奶粉', '72', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('74', '营养辅食', '72', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('75', '尿裤湿巾', '72', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('76', '喂养用品', '72', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('77', '洗护用品', '72', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('78', '寝居服饰', '72', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('79', '妈妈专区', '72', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('80', '食品/酒类/生鲜/特产', '0', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('81', '新鲜水果', '80', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('82', '蔬菜蛋品', '80', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('83', '精选肉类', '80', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('84', '海鲜水产', '80', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('85', '冷饮冻食', '80', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('86', '中外名酒', '80', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('87', '进口食品', '80', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('88', '艺术/礼品鲜花/农资绿植', '0', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('89', '艺术品', '88', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('90', '火机烟具', '88', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('91', '礼品', '88', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('92', '鲜花速递', '88', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('93', '绿植园艺', '88', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('94', '种子', '88', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('95', '农药', '88', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('96', '医药保健/计生情趣', '0', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('97', '中西药品', '96', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('98', '营养健康', '96', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('99', '营养成分', '96', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('100', '滋补养生', '96', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('101', '计生情趣', '96', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('102', '保健器械', '96', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('103', '护理护具', '96', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('104', '图书/音像/电子书', '0', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('105', '邮币', '104', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('106', '少儿', '104', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('107', '教育', '104', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('108', '文艺', '104', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('109', '经管励志', '104', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('110', '人文社科', '104', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('111', '生活', '104', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('112', '机票/酒店/旅游/生活', '0', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('113', '交通出行', '112', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('114', '酒店预订', '112', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('115', '旅游度假', '112', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('116', '商旅服务', '112', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('117', '演出票务', '112', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('118', '生活缴费', '112', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('119', '生活服务', '112', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('120', '理财/众筹/白条/保险', '0', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('121', '理财', '120', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('122', '众筹', '120', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('123', '东家', '120', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('124', '白条', '120', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('125', '支付', '120', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('126', '保险', '120', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('127', '股票', '120', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('128', '曲面电视', '2', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('129', '超薄电视', '2', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('130', 'HDR电视', '2', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('131', 'OLED电视', '2', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('132', '4K超清电视', '2', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('133', '人工智能电视', '2', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('134', '55英寸', '2', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('135', '65英寸', '2', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('136', '电视配件', '2', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('137', '壁挂式空调', '3', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('138', '柜式空调', '3', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('139', '中央空调', '3', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('140', '节能空调', '3', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('141', '智能空调', '3', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('142', '变频空调', '3', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('143', '以旧换新', '3', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('144', '空调配件', '3', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('145', '滚筒洗衣机', '4', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('146', '洗烘一体机', '4', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('147', '波轮洗衣机', '4', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('148', '迷你洗衣机', '4', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('149', '烘干机', '4', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('150', '洗衣机配件', '4', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('151', '多门', '5', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('152', '对开门', '5', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('153', '三门', '5', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('154', '双门', '5', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('155', '冷柜/冰吧', '5', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('156', '酒柜', '5', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('157', '冰箱配件', '5', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('158', '油烟机', '6', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('159', '燃气灶', '6', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('160', '烟灶套装', '6', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('161', '消毒柜', '6', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('162', '洗碗机', '6', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('163', '电热水器', '6', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('164', '燃气热水器', '6', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('165', '嵌入式厨电', '6', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('166', '商用厨房电器', '6', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('167', '破壁机', '7', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('168', '电烤箱', '7', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('169', '电饭煲', '7', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('170', '电压力锅', '7', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('171', '咖啡机', '7', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('172', '豆浆机', '7', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('173', '料理机', '7', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('174', '电炖锅', '7', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('175', '电饼铛', '7', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('176', '多用途锅', '7', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('177', '吸尘器/除螨仪', '8', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('178', '空气净化器', '8', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('179', '电风扇', '8', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('180', '扫地机器人', '8', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('181', '蒸汽拖把/拖地机', '8', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('182', '干衣机', '8', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('183', '电话机', '8', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('184', '饮水机', '8', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('185', '净水器', '8', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('186', '除湿机', '8', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('187', '手机', '10', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('188', '游戏手机', '10', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('189', '老人机', '10', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('190', '对讲机', '10', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('191', '以旧换新', '10', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('192', '手机维修', '10', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('193', '合约机', '11', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('194', '选号码', '11', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('195', '固话宽带', '11', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('196', '办套餐', '11', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('197', '充话费/流量', '11', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('198', '中国电信', '11', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('199', '中国移动', '11', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('200', '中国联通', '11', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('201', '京东通信', '11', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('202', '170选号', '11', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('203', '手机壳', '12', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('204', '贴膜', '12', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('205', '手机存储卡', '12', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('206', '数据线', '12', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('207', '充电器', '12', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('208', '无线充电器', '12', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('209', '手机耳机', '12', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('210', '创意配件', '12', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('211', '手机饰品', '12', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('212', '手机电池', '12', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('213', '数码相机', '13', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('214', '单电/微单相机', '13', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('215', '单反相机', '13', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('216', '拍立得', '13', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('217', '运动相机', '13', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('218', '摄像机', '13', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('219', '镜头', '13', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('220', '户外器材', '13', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('221', '影棚器材', '13', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('222', '冲印服务', '13', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('223', '存储卡', '14', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('224', '三脚架/云台', '14', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('225', '相机包', '14', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('226', '滤镜', '14', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('227', '闪光灯/手柄', '14', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('228', '相机清洁/贴膜', '14', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('229', '机身附件', '14', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('230', '镜头附件', '14', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('231', '读卡器', '14', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('232', '支架', '14', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('233', '耳机/耳麦', '15', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('234', '音箱/音响', '15', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('235', '智能音箱', '15', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('236', '便携/无线音箱', '15', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('237', '收音机', '15', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('238', '麦克风', '15', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('239', 'MP3/MP4', '15', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('240', '专业音频', '15', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('241', '智能手环', '16', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('242', '智能手表', '16', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('243', '智能眼镜', '16', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('244', '智能机器人', '16', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('245', '运动跟踪器', '16', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('246', '健康监测', '16', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('247', '智能配饰', '16', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('248', '智能家居', '16', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('249', '体感车', '16', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('250', '无人机', '16', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('251', '笔记本', '18', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('252', '游戏本', '18', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('253', '平板电脑', '18', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('254', '平板电脑配件', '18', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('255', '台式机', '18', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('256', '一体机', '18', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('257', '服务器/工作站', '18', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('258', '笔记本配件', '18', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('259', '显示器', '19', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('260', 'CPU', '19', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('261', '主板', '19', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('262', '显卡', '19', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('263', '硬盘', '19', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('264', '内存', '19', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('265', '机箱', '19', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('266', '电源', '19', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('267', '散热器', '19', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('268', '刻录机/光驱', '19', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('269', '鼠标', '20', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('270', '键盘', '20', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('271', '键鼠套装', '20', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('272', '网络仪表仪器', '20', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('273', 'U盘', '20', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('274', '移动硬盘', '20', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('275', '鼠标垫', '20', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('276', '摄像头', '20', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('277', '线缆', '20', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('278', '手写板', '20', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('279', '游戏机', '21', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('280', '游戏耳机', '21', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('281', '手柄/方向盘', '21', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('282', '游戏软件', '21', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('283', '游戏周边', '21', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('284', '路由器', '22', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('285', '网络机顶盒', '22', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('286', '交换机', '22', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('287', '网络存储', '22', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('288', '网卡', '22', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('289', '4G/3G上网', '22', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('290', '网络配件', '22', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('291', '投影机', '23', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('292', '投影配件', '23', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('293', '多功能一体机', '23', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('294', '打印机', '23', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('295', '传真设备', '23', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('296', '验钞/点钞机', '23', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('297', '扫描设备', '23', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('298', '复合机', '23', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('299', '碎纸机', '23', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('300', '考勤门禁', '23', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('301', '硒鼓/墨粉', '24', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('302', '墨盒', '24', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('303', '色带', '24', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('304', '纸类', '24', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('305', '办公文具', '24', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('306', '学生文具', '24', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('307', '文件收纳', '24', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('308', '本册/便签', '24', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('309', '计算器', '24', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('310', '笔类', '24', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('311', '水具酒具', '26', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('312', '烹饪锅具', '26', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('313', '餐具', '26', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('314', '厨房配件', '26', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('315', '刀剪菜板', '26', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('316', '锅具套装', '26', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('317', '茶具/咖啡具', '26', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('318', '保温杯', '26', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('319', '保鲜盒', '26', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('320', '床品套件', '27', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('321', '被子', '27', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('322', '枕芯', '27', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('323', '蚊帐', '27', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('324', '凉席', '27', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('325', '毛巾浴巾', '27', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('326', '地毯地垫', '27', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('327', '床垫/床褥', '27', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('328', '毯子', '27', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('329', '抱枕靠垫', '27', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('330', '收纳用品', '28', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('331', '雨伞雨具', '28', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('332', '净化除味', '28', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('333', '浴室用品', '28', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('334', '洗晒/熨烫', '28', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('335', '缝纫/针织用品', '28', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('336', '清洁工具', '28', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('337', '装饰字画', '29', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('338', '装饰摆件', '29', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('339', '手工/十字绣', '29', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('340', '相框/照片墙', '29', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('341', '墙贴/装饰贴', '29', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('342', '花瓶花艺', '29', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('343', '香薰蜡烛', '29', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('344', '节庆饰品', '29', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('345', '钟饰', '29', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('346', '帘艺隔断', '29', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('347', '吸顶灯', '30', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('348', '吊灯', '30', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('349', '台灯', '30', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('350', '筒灯射灯', '30', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('351', '装饰灯', '30', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('352', 'LED灯', '30', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('353', '氛围照明', '30', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('354', '落地灯', '30', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('355', '庭院灯', '30', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('356', '应急灯/手电', '30', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('357', '卧室家具', '31', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('358', '客厅家具', '31', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('359', '餐厅家具', '31', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('360', '书房家具', '31', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('361', '儿童家具', '31', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('362', '储物家具', '31', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('363', '阳台/户外', '31', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('364', '办公家具', '31', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('365', '床', '31', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('366', '床垫', '31', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('367', '瓷砖', '32', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('368', '地板', '32', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('369', '油漆涂料', '32', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('370', '壁纸', '32', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('371', '涂刷辅料', '32', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('372', '新品推荐', '34', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('373', '连衣裙', '34', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('374', 'T恤', '34', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('375', '衬衫', '34', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('376', '雪纺衫', '34', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('377', '短外套', '34', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('378', '卫衣', '34', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('379', '针织衫', '34', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('380', '风衣', '34', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('381', '半身裙', '34', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('382', '当季热卖', '35', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('383', '新品推荐', '35', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('384', 'T恤', '35', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('385', '牛仔裤', '35', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('386', '休闲裤', '35', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('387', '衬衫', '35', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('388', '短裤', '35', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('389', 'POLO衫', '35', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('390', '羽绒服', '35', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('391', '棉服', '35', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('392', '文胸', '36', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('393', '睡衣/家居服', '36', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('394', '男士内裤', '36', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('395', '女士内裤', '36', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('396', '吊带/背心', '36', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('397', '文胸套装', '36', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('398', '情侣睡衣', '36', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('399', '塑身美体', '36', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('400', '少女文胸', '36', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('401', '休闲棉袜', '36', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('402', '女士围巾/披肩', '37', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('403', '男士丝巾/围巾', '37', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('404', '光学镜架/镜片', '37', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('405', '太阳镜', '37', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('406', '防辐射眼镜', '37', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('407', '老花镜', '37', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('408', '游泳镜', '37', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('409', '领带/领结/领带夹', '37', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('410', '毛线帽', '37', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('411', '棒球帽', '37', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('412', '套装', '38', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('413', '卫衣', '38', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('414', '裤子', '38', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('415', '外套/大衣', '38', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('416', '毛衣/针织衫', '38', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('417', '衬衫', '38', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('418', '户外/运动服', '38', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('419', 'T恤', '38', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('420', '裙子', '38', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('421', '亲子装', '38', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('422', '运动鞋', '39', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('423', '靴子', '39', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('424', '帆布鞋', '39', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('425', '皮鞋', '39', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('426', '棉鞋', '39', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('427', '凉鞋', '39', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('428', '拖鞋', '39', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('429', '补水保湿', '41', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('430', '卸妆', '41', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('431', '洁面', '41', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('432', '爽肤水', '41', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('433', '乳液面霜', '41', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('434', '精华', '41', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('435', '眼霜', '41', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('436', '防晒', '41', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('437', '面膜', '41', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('438', '剃须', '41', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('439', '洗发', '42', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('440', '护发', '42', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('441', '染发', '42', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('442', '造型', '42', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('443', '假发', '42', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('444', '美发工具', '42', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('445', '套装', '42', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('446', '补水保湿', '43', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('447', '沐浴', '43', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('448', '润肤', '43', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('449', '精油', '43', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('450', '颈部', '43', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('451', '手足', '43', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('452', '纤体塑形', '43', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('453', '美胸', '43', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('454', '套装', '43', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('455', '牙膏/牙粉', '44', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('456', '牙刷/牙线', '44', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('457', '漱口水', '44', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('458', '套装', '44', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('459', '卫生巾', '45', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('460', '卫生护垫', '45', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('461', '私密护理', '45', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('462', '脱毛膏', '45', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('463', 'BB霜', '46', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('464', '化妆棉', '46', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('465', '香水', '46', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('466', '底妆', '46', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('467', '眉笔', '46', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('468', '睫毛膏', '46', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('469', '眼线', '46', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('470', '眼影', '46', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('471', '唇膏/彩', '46', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('472', '腮红', '46', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('473', '纸品湿巾', '47', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('474', '衣物清洁', '47', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('475', '清洁工具', '47', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('476', '家庭清洁', '47', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('477', '一次性用品', '47', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('478', '驱虫用品', '47', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('479', '皮具护理', '47', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('480', '新品推荐', '49', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('481', '单鞋', '49', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('482', '休闲鞋', '49', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('483', '帆布鞋', '49', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('484', '妈妈鞋', '49', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('485', '布鞋/绣花鞋', '49', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('486', '女靴', '49', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('487', '踝靴', '49', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('488', '马丁靴', '49', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('489', '雪地靴', '49', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('490', '真皮包', '50', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('491', '单肩包', '50', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('492', '手提包', '50', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('493', '斜挎包', '50', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('494', '双肩包', '50', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('495', '钱包', '50', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('496', '手拿包', '50', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('497', '卡包/零钱包', '50', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('498', '钥匙包', '50', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('499', '男士钱包', '51', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('500', '双肩包', '51', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('501', '单肩/斜挎包', '51', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('502', '商务公文包', '51', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('503', '男士手包', '51', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('504', '卡包名片夹', '51', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('505', '钥匙包', '51', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('506', '女士拉杆箱', '52', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('507', '拉杆箱', '52', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('508', '拉杆包', '52', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('509', '旅行包', '52', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('510', '电脑包', '52', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('511', '休闲运动包', '52', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('512', '书包', '52', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('513', '登山包', '52', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('514', '腰包/胸包', '52', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('515', '旅行配件', '52', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('516', '箱包', '53', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('517', '钱包', '53', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('518', '服饰', '53', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('519', '腰带', '53', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('520', '鞋靴', '53', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('521', '太阳镜/眼镜框', '53', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('522', '饰品', '53', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('523', '配件', '53', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('524', 'GUCCI', '54', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('525', 'COACH', '54', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('526', '雷朋', '54', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('527', '施华洛世奇', '54', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('528', 'MK', '54', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('529', '阿玛尼', '54', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('530', '菲拉格慕', '54', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('531', 'VERSACE', '54', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('532', '普拉达', '54', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('533', '巴宝莉', '54', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('534', '天梭', '55', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('535', '浪琴', '55', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('536', '欧米茄', '55', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('537', '泰格豪雅', '55', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('538', 'DW', '55', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('539', '卡西欧', '55', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('540', '西铁城', '55', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('541', '天王', '55', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('542', '瑞表', '55', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('543', '国表', '55', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('544', '新品推荐', '57', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('545', '休闲鞋', '57', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('546', '商务休闲鞋', '57', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('547', '正装鞋', '57', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('548', '帆布鞋', '57', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('549', '凉鞋', '57', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('550', '拖鞋', '57', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('551', '功能鞋', '57', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('552', '增高鞋', '57', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('553', '工装鞋', '57', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('554', '跑步鞋', '58', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('555', '休闲鞋', '58', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('556', '篮球鞋', '58', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('557', '帆布鞋', '58', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('558', '板鞋', '58', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('559', '拖鞋', '58', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('560', '运动包', '58', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('561', '足球鞋', '58', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('562', '乒羽网鞋', '58', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('563', '训练鞋', '58', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('564', 'T恤', '59', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('565', '运动套装', '59', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('566', '运动裤', '59', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('567', '卫衣/套头衫', '59', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('568', '夹克/风衣', '59', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('569', '羽绒服', '59', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('570', '运动配饰', '59', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('571', '棉服', '59', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('572', '紧身衣', '59', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('573', '运动背心', '59', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('574', '跑步机', '60', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('575', '动感单车', '60', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('576', '健身车', '60', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('577', '椭圆机', '60', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('578', '综合训练器', '60', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('579', '划船机', '60', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('580', '甩脂机', '60', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('581', '倒立机', '60', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('582', '武术搏击', '60', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('583', '踏步机', '60', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('584', '山地车', '61', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('585', '公路车', '61', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('586', '折叠车', '61', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('587', '骑行服', '61', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('588', '电动车', '61', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('589', '电动滑板车', '61', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('590', '城市自行车', '61', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('591', '平衡车', '61', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('592', '穿戴装备', '61', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('593', '自行车配件', '61', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('594', '乒乓球', '62', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('595', '羽毛球', '62', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('596', '篮球', '62', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('597', '足球', '62', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('598', '轮滑滑板', '62', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('599', '网球', '62', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('600', '高尔夫', '62', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('601', '台球', '62', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('602', '排球', '62', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('603', '棋牌麻将', '62', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('604', '户外风衣', '63', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('605', '徒步鞋', '63', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('606', 'T恤', '63', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('607', '冲锋衣裤', '63', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('608', '速干衣裤', '63', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('609', '越野跑鞋', '63', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('610', '滑雪服', '63', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('611', '羽绒服/棉服', '63', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('612', '休闲衣裤', '63', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('613', '抓绒衣裤', '63', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('614', '最新开盘', '65', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('615', '普通住宅', '65', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('616', '别墅', '65', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('617', '商业办公', '65', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('618', '海外房产', '65', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('619', '文旅地产', '65', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('620', '微型车', '66', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('621', '小型车', '66', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('622', '紧凑型车', '66', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('623', '中型车', '66', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('624', '中大型车', '66', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('625', '豪华车', '66', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('626', 'MPV', '66', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('627', 'SUV', '66', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('628', '跑车', '66', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('629', '5万以下', '67', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('630', '5-8万', '67', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('631', '8-10万', '67', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('632', '10-15万', '67', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('633', '15-25万', '67', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('634', '25-40万', '67', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('635', '40万以上', '67', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('636', '宝马', '68', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('637', '五菱宝骏', '68', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('638', '上汽大众', '68', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('639', '比亚迪', '68', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('640', '东风启辰', '68', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('641', '陆风', '68', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('642', '吉利', '68', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('643', '机油', '69', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('644', '轮胎', '69', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('645', '添加剂', '69', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('646', '防冻液', '69', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('647', '滤清器', '69', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('648', '蓄电池', '69', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('649', '雨刷', '69', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('650', '刹车片/盘', '69', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('651', '火花塞', '69', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('652', '车灯', '69', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('653', '座垫座套', '70', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('654', '脚垫', '70', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('655', '头枕腰靠', '70', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('656', '方向盘套', '70', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('657', '后备箱垫', '70', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('658', '车载支架', '70', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('659', '车钥匙扣', '70', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('660', '香水', '70', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('661', '炭包/净化剂', '70', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('662', '扶手箱', '70', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('663', '行车记录仪', '71', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('664', '车载充电器', '71', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('665', '车机导航', '71', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('666', '车载蓝牙', '71', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('667', '智能驾驶', '71', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('668', '对讲电台', '71', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('669', '倒车雷达', '71', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('670', '导航仪', '71', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('671', '安全预警仪', '71', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('672', '车载净化器', '71', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('673', '1段', '73', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('674', '2段', '73', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('675', '3段', '73', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('676', '4段', '73', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('677', '孕妈奶粉', '73', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('678', '特殊配方奶粉', '73', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('679', '有机奶粉', '73', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('680', '米粉/菜粉', '74', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('681', '面条/粥', '74', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('682', '果泥/果汁', '74', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('683', '益生菌/初乳', '74', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('684', 'DHA', '74', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('685', '钙铁锌/维生素', '74', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('686', '清火/开胃', '74', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('687', '宝宝零食', '74', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('688', 'NB', '75', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('689', 'S', '75', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('690', 'M', '75', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('691', 'L', '75', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('692', 'XL', '75', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('693', 'XXL', '75', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('694', '拉拉裤', '75', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('695', '成人尿裤', '75', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('696', '婴儿湿巾', '75', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('697', '奶瓶奶嘴', '76', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('698', '吸奶器', '76', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('699', '暖奶消毒', '76', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('700', '辅食料理机', '76', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('701', '牙胶安抚', '76', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('702', '食物存储', '76', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('703', '儿童餐具', '76', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('704', '水壶/水杯', '76', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('705', '围兜/防溅衣', '76', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('706', '宝宝护肤', '77', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('707', '日常护理', '77', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('708', '洗发沐浴', '77', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('709', '洗澡用具', '77', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('710', '洗衣液/皂', '77', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('711', '理发器', '77', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('712', '婴儿口腔清洁', '77', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('713', '座便器', '77', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('714', '驱蚊防晒', '77', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('715', '睡袋/抱被', '78', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('716', '婴儿枕', '78', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('717', '毛毯/棉被', '78', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('718', '婴童床品', '78', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('719', '浴巾/浴衣', '78', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('720', '毛巾/口水巾', '78', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('721', '婴儿礼盒', '78', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('722', '婴儿内衣', '78', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('723', '婴儿外出服', '78', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('724', '隔尿垫巾', '78', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('725', '防辐射服', '79', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('726', '孕妈装', '79', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('727', '孕妇护肤', '79', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('728', '妈咪包/背婴带', '79', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('729', '待产护理', '79', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('730', '产后塑身', '79', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('731', '文胸/内裤', '79', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('732', '防溢乳垫', '79', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('733', '孕期营养', '79', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('734', '苹果', '81', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('735', '香蕉', '81', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('736', '梨', '81', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('737', '橙子', '81', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('738', '奇异果/猕猴桃', '81', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('739', '火龙果', '81', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('740', '榴莲', '81', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('741', '车厘子', '81', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('742', '百香果', '81', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('743', '草莓', '81', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('744', '蛋品', '82', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('745', '叶菜类', '82', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('746', '根茎类', '82', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('747', '葱姜蒜椒', '82', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('748', '鲜菌菇', '82', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('749', '茄果瓜类', '82', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('750', '半加工蔬菜', '82', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('751', '半加工豆制品', '82', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('752', '玉米', '82', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('753', '山药', '82', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('754', '猪肉', '83', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('755', '牛肉', '83', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('756', '羊肉', '83', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('757', '鸡肉', '83', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('758', '鸭肉', '83', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('759', '冷鲜肉', '83', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('760', '特色肉类', '83', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('761', '内脏类', '83', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('762', '冷藏熟食', '83', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('763', '牛排', '83', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('764', '鱼类', '84', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('765', '虾类', '84', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('766', '蟹类', '84', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('767', '贝类', '84', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('768', '海参', '84', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('769', '鱿鱼/章鱼', '84', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('770', '活鲜', '84', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('771', '三文鱼', '84', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('772', '鳕鱼', '84', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('773', '海鲜礼盒', '84', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('774', '水饺/馄饨', '85', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('775', '汤圆/元宵', '85', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('776', '面点', '85', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('777', '烘焙半成品', '85', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('778', '奶酪/黄油', '85', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('779', '方便速食', '85', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('780', '火锅丸串', '85', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('781', '冰淇淋', '85', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('782', '冷藏饮料', '85', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('783', '低温奶', '85', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('784', '白酒', '86', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('785', '葡萄酒', '86', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('786', '洋酒', '86', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('787', '啤酒', '86', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('788', '黄酒/养生酒', '86', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('789', '收藏酒/陈年老酒', '86', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('790', '牛奶', '87', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('791', '饼干蛋糕', '87', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('792', '糖/巧克力', '87', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('793', '零食', '87', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('794', '水', '87', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('795', '饮料', '87', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('796', '咖啡粉', '87', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('797', '冲调品', '87', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('798', '油', '87', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('799', '方便食品', '87', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('800', '油画', '89', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('801', '版画', '89', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('802', '水墨画', '89', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('803', '书法', '89', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('804', '雕塑', '89', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('805', '艺术画册', '89', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('806', '艺术衍生品', '89', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('807', '电子烟', '90', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('808', '烟油', '90', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('809', '打火机', '90', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('810', '烟嘴', '90', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('811', '烟盒', '90', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('812', '烟斗', '90', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('813', '创意礼品', '91', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('814', '电子礼品', '91', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('815', '工艺礼品', '91', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('816', '美妆礼品', '91', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('817', '婚庆节庆', '91', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('818', '礼盒礼券', '91', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('819', '礼品定制', '91', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('820', '军刀军具', '91', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('821', '古董文玩', '91', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('822', '收藏品', '91', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('823', '鲜花', '92', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('824', '每周一花', '92', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('825', '永生花', '92', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('826', '香皂花', '92', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('827', '卡通花束', '92', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('828', '干花', '92', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('829', '桌面绿植', '93', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('830', '苗木', '93', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('831', '绿植盆栽', '93', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('832', '多肉植物', '93', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('833', '花卉', '93', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('834', '种子种球', '93', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('835', '花盆花器', '93', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('836', '园艺土肥', '93', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('837', '园艺工具', '93', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('838', '园林机械', '93', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('839', '花草林木类', '94', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('840', '蔬菜/菌类', '94', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('841', '瓜果类', '94', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('842', '大田作物类', '94', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('843', '杀虫剂', '95', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('844', '杀菌剂', '95', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('845', '除草剂', '95', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('846', '植物生长调节剂', '95', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('847', '感冒咳嗽', '97', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('848', '补肾壮阳', '97', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('849', '补气养血', '97', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('850', '止痛镇痛', '97', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('851', '耳鼻喉用药', '97', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('852', '眼科用药', '97', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('853', '口腔用药', '97', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('854', '皮肤用药', '97', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('855', '肠胃消化', '97', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('856', '风湿骨外伤', '97', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('857', '调节免疫', '98', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('858', '调节三高', '98', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('859', '缓解疲劳', '98', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('860', '美体塑身', '98', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('861', '美容养颜', '98', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('862', '肝肾养护', '98', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('863', '肠胃养护', '98', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('864', '明目益智', '98', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('865', '骨骼健康', '98', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('866', '改善睡眠', '98', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('867', '维生素/矿物质', '99', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('868', '蛋白质', '99', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('869', '鱼油/磷脂', '99', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('870', '螺旋藻', '99', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('871', '番茄红素', '99', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('872', '叶酸', '99', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('873', '葡萄籽', '99', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('874', '左旋肉碱', '99', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('875', '辅酶Q10', '99', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('876', '益生菌', '99', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('877', '阿胶', '100', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('878', '蜂蜜/蜂产品', '100', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('879', '枸杞', '100', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('880', '燕窝', '100', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('881', '冬虫夏草', '100', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('882', '人参/西洋参', '100', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('883', '三七', '100', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('884', '鹿茸', '100', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('885', '雪蛤', '100', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('886', '青钱柳', '100', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('887', '避孕套', '101', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('888', '排卵验孕', '101', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('889', '润滑液', '101', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('890', '男用延时', '101', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('891', '飞机杯', '101', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('892', '倒模', '101', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('893', '仿真娃娃', '101', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('894', '震动棒', '101', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('895', '跳蛋', '101', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('896', '仿真阳具', '101', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('897', '血压计', '102', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('898', '血糖仪', '102', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('899', '血氧仪', '102', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('900', '体温计', '102', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('901', '体重秤', '102', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('902', '胎心仪', '102', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('903', '制氧机', '102', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('904', '呼吸机', '102', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('905', '雾化器', '102', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('906', '助听器', '102', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('907', '口罩', '103', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('908', '眼罩/耳塞', '103', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('909', '跌打损伤', '103', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('910', '暖贴', '103', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('911', '鼻喉护理', '103', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('912', '眼部保健', '103', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('913', '美体护理', '103', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('914', '邮票', '105', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('915', '钱币', '105', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('916', '邮资封片', '105', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('917', '磁卡', '105', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('918', '票证', '105', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('919', '礼品册', '105', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('920', '0-2岁', '106', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('921', '3-6岁', '106', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('922', '7-10岁', '106', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('923', '11-14岁', '106', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('924', '儿童文学', '106', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('925', '绘本', '106', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('926', '科普', '106', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('927', '幼儿启蒙', '106', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('928', '手工游戏', '106', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('929', '智力开发', '106', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('930', '教材', '107', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('931', '中小学教辅', '107', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('932', '考试', '107', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('933', '外语学习', '107', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('934', '字典词典', '107', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('935', '课外读物', '107', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('936', '英语四六级', '107', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('937', '会计类考试', '107', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('938', '国家公务员', '107', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('939', '小说', '108', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('940', '文学', '108', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('941', '青春文学', '108', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('942', '传记', '108', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('943', '动漫', '108', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('944', '艺术', '108', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('945', '摄影', '108', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('946', '书法', '108', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('947', '音乐', '108', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('948', '绘画', '108', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('949', '管理', '109', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('950', '金融与投资', '109', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('951', '经济', '109', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('952', '励志与成功', '109', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('953', '市场营销', '109', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('954', '股票', '109', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('955', '智能经济', '109', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('956', '历史', '110', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('957', '心理学', '110', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('958', '政治/军事', '110', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('959', '国学/古籍', '110', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('960', '哲学/宗教', '110', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('961', '社会科学', '110', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('962', '法律', '110', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('963', '文化', '110', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('964', '育儿/家教', '111', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('965', '孕产/胎教', '111', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('966', '健身保健', '111', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('967', '旅游/地图', '111', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('968', '美食', '111', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('969', '时尚美妆', '111', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('970', '家居', '111', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('971', '手工DIY', '111', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('972', '两性', '111', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('973', '体育', '111', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('974', '国内机票', '113', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('975', '国际机票', '113', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('976', '火车票', '113', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('977', '机场服务', '113', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('978', '机票套餐', '113', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('979', '国内酒店', '114', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('980', '国际酒店', '114', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('981', '超值精选酒店', '114', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('982', '国内旅游', '115', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('983', '出境旅游', '115', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('984', '全球签证', '115', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('985', '景点门票', '115', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('986', '邮轮', '115', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('987', '旅行保险', '115', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('988', '企业差旅', '116', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('989', '团队建设', '116', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('990', '奖励旅游', '116', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('991', '会议周边', '116', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('992', '会议展览', '116', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('993', '电影选座', '117', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('994', '演唱会', '117', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('995', '音乐会', '117', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('996', '话剧歌剧', '117', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('997', '体育赛事', '117', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('998', '舞蹈芭蕾', '117', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('999', '戏曲综艺', '117', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1000', '水费', '118', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1001', '电费', '118', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1002', '煤气费', '118', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1003', '城市通', '118', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1004', '油卡充值', '118', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1005', '加油卡', '118', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1006', '家政保洁', '119', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1007', '摄影写真', '119', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1008', '丽人/养生', '119', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1009', '代理代办', '119', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1010', '京东小金库', '121', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1011', '基金理财', '121', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1012', '定期理财', '121', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1013', '智能硬件', '122', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1014', '流行文化', '122', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1015', '生活美学', '122', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1016', '公益', '122', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1017', '其他权益众筹', '122', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1018', '类固收', '123', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1019', '私募股权', '123', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1020', '阳光私募', '123', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1021', '投资策略', '123', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1022', '京东白条', '124', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1023', '白条联名卡', '124', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1024', '京东钢镚', '124', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1025', '旅游白条', '124', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1026', '安居白条', '124', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1027', '校园金融', '124', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1028', '京东金采', '124', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1029', '京东支付', '125', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1030', '车险', '126', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1031', '健康险', '126', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1032', '意外险', '126', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1033', '旅行险', '126', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1034', '实时资讯', '127', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1035', '市场行情', '127', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1036', '投资达人', '127', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1037', '量化平台', '127', '1', '1522819518', '1522819518', null);

-- ----------------------------
-- Table structure for tpshop_goods
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_goods`;
CREATE TABLE `tpshop_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `goods_number` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '商品数量',
  `goods_introduce` text COMMENT '详细介绍',
  `goods_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '商品logo图',
  `create_time` int(11) unsigned DEFAULT NULL COMMENT '添加时间',
  `update_time` int(11) unsigned DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) unsigned DEFAULT NULL COMMENT '软删除时间',
  `type_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品类型id',
  `cate_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_goods
-- ----------------------------
INSERT INTO `tpshop_goods` VALUES ('32', 'Apple iPhone 7 Plus', '5799.00', '10000', '<p><img src=\"/ueditor/php/upload/image/20180404/1522821194971442.png\" alt=\"b1.png\" /><img src=\"/ueditor/php/upload/image/20180404/1522821200955649.png\" alt=\"b2.png\" /><img src=\"/ueditor/php/upload/image/20180404/1522821203285257.png\" alt=\"b3.png\" /></p>', '\\uploads\\20180404\\52439c7352d25903bb58af73738529f0.png', '1522821538', '1522823812', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('33', 'Apple iPhone X', '10000.00', '10000', '<p><img src=\"/ueditor/php/upload/image/20180404/1522823892749269.png\" alt=\"1522823892749269.png\" /></p><p><img src=\"/ueditor/php/upload/image/20180404/1522823892946053.png\" alt=\"1522823892946053.png\" /></p><p><img src=\"/ueditor/php/upload/image/20180404/1522823892372354.png\" alt=\"1522823892372354.png\" /></p><p><img src=\"/ueditor/php/upload/image/20180404/1522823893109601.png\" alt=\"1522823893109601.png\" /></p><p><img src=\"/ueditor/php/upload/image/20180404/1522823893349848.png\" alt=\"1522823893349848.png\" /></p><p><br /></p>', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522823921', '1522823921', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('34', 'Apple iphone 2', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824822', '1522824822', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('35', 'Apple iphone 4', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824822', '1522824822', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('36', 'Apple iphone 2', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824822', '1522824822', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('37', 'Apple iphone 2', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824822', '1522824822', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('38', 'Apple iphone 8', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824822', '1522824822', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('39', 'Apple iphone 4', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824822', '1522824822', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('40', 'Apple iphone 3', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824823', '1522824823', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('41', 'Apple iphone 5', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824823', '1522824823', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('42', 'Apple iphone 1', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824823', '1522824823', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('43', 'Apple iphone 6', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824823', '1522824823', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('44', 'Apple iphone 1', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824823', '1522824823', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('45', 'Apple iphone 9', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824823', '1522824823', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('46', 'Apple iphone 3', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824823', '1522824823', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('47', 'Apple iphone 8', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824824', '1522824824', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('48', 'Apple iphone 2', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824824', '1522824824', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('49', 'Apple iphone 2', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824824', '1522824824', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('50', 'Apple iphone 7', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824824', '1522824824', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('51', 'Apple iphone 8', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824824', '1522824824', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('52', 'Apple iphone 7', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824824', '1522824824', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('53', 'Apple iphone 3', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824824', '1522824824', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('54', 'Apple iphone 4', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824824', '1522824824', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('55', 'Apple iphone 7', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824824', '1522824824', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('56', 'Apple iphone 3', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824824', '1522824824', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('57', 'Apple iphone 1', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824825', '1522824825', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('58', 'Apple iphone 6', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824825', '1522824825', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('59', 'Apple iphone 8', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824825', '1522824825', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('60', 'Apple iphone 6', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824825', '1522824825', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('61', 'Apple iphone 4', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824825', '1522824825', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('62', 'Apple iphone 5', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824825', '1522824825', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('63', 'Apple iphone 2', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824825', '1522824825', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('64', 'Apple iphone 7', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824825', '1522824825', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('65', 'Apple iphone 3', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824825', '1522824825', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('66', 'Apple iphone 8', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824826', '1522824826', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('67', 'Apple iphone 5', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824826', '1522824826', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('68', 'Apple iphone 4', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824826', '1522824826', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('69', 'Apple iphone 4', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824826', '1522824826', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('70', 'Apple iphone 3', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824826', '1522824826', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('71', 'Apple iphone 2', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824826', '1522824826', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('72', 'Apple iphone 2', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824826', '1522824826', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('73', 'Apple iphone 2', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824827', '1522824827', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('74', 'Apple iphone 7', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824827', '1522824827', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('75', 'Apple iphone 8', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824827', '1522824827', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('76', 'Apple iphone 9', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824827', '1522824827', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('77', 'Apple iphone 4', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824827', '1522824827', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('78', 'Apple iphone 4', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824827', '1522824827', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('79', 'Apple iphone 5', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824827', '1522824827', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('80', 'Apple iphone 7', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824827', '1522824827', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('81', 'Apple iphone 3', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824827', '1522824827', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('82', 'Apple iphone 5', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824828', '1522824828', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('83', 'Apple iphone 2', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824828', '1522824828', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('84', 'Apple iphone 7', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824828', '1522824828', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('85', 'Apple iphone 5', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824828', '1522824828', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('86', 'Apple iphone 3', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824828', '1522824828', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('87', 'Apple iphone 7', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824828', '1522824828', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('88', 'Apple iphone 6', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824828', '1522824828', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('89', 'Apple iphone 1', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824828', '1522824828', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('90', 'Apple iphone 3', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824828', '1522824828', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('91', 'Apple iphone 2', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824829', '1522824829', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('92', 'Apple iphone 5', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824829', '1522824829', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('93', 'Apple iphone 3', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824829', '1522824829', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('94', 'Apple iphone 2', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824829', '1522824829', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('95', 'Apple iphone 5', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824829', '1522824829', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('96', 'Apple iphone 2', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824829', '1522824829', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('97', 'Apple iphone 3', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824829', '1522824829', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('98', 'Apple iphone 9', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824829', '1522824829', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('99', 'Apple iphone 1', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824829', '1522824829', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('100', 'Apple iphone 6', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824830', '1522824830', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('101', 'Apple iphone 7', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824830', '1522824830', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('102', 'Apple iphone 2', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824830', '1522824830', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('103', 'Apple iphone 1', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824830', '1522824830', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('104', 'Apple iphone 6', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824830', '1522824830', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('105', 'Apple iphone 5', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824830', '1522824830', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('106', 'Apple iphone 5', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824830', '1522824830', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('107', 'Apple iphone 3', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824830', '1522824830', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('108', 'Apple iphone 1', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824831', '1522824831', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('109', 'Apple iphone 9', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824831', '1522824831', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('110', 'Apple iphone 9', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824831', '1522824831', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('111', 'Apple iphone 7', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824831', '1522824831', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('112', 'Apple iphone 9', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824831', '1522824831', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('113', 'Apple iphone 1', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824831', '1522824831', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('114', 'Apple iphone 2', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824831', '1522824831', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('115', 'Apple iphone 9', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824831', '1522824831', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('116', 'Apple iphone 1', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824831', '1522824831', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('117', 'Apple iphone 5', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824831', '1522824831', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('118', 'Apple iphone 6', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824832', '1522824832', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('119', 'Apple iphone 5', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824832', '1522824832', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('120', 'Apple iphone 5', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824832', '1522824832', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('121', 'Apple iphone 5', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824832', '1522824832', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('122', 'Apple iphone 1', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824833', '1522824833', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('123', 'Apple iphone 6', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824833', '1522824833', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('124', 'Apple iphone 3', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824833', '1522824833', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('125', 'Apple iphone 6', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824833', '1522824833', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('126', 'Apple iphone 4', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824833', '1522824833', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('127', 'Apple iphone 7', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824833', '1522824833', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('128', 'Apple iphone 9', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824833', '1522824833', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('129', 'Apple iphone 7', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824834', '1522824834', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('130', 'Apple iphone 1', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824834', '1522824834', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('131', 'Apple iphone 4', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824834', '1522824834', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('132', 'Apple iphone 6', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824834', '1522824834', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('133', 'Apple iphone 5', '0.01', '1000', 'test', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '1522824834', '1522824834', null, '2', '187');
INSERT INTO `tpshop_goods` VALUES ('134', '', '0.00', '100', null, '', null, null, null, '0', '0');

-- ----------------------------
-- Table structure for tpshop_goods_attr
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_goods_attr`;
CREATE TABLE `tpshop_goods_attr` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `attr_id` int(11) NOT NULL COMMENT '属性id',
  `attr_value` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=775 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_goods_attr
-- ----------------------------
INSERT INTO `tpshop_goods_attr` VALUES ('58', '32', '10', '金色', '1522823812', '1522823812', null);
INSERT INTO `tpshop_goods_attr` VALUES ('59', '32', '10', '白色', '1522823812', '1522823812', null);
INSERT INTO `tpshop_goods_attr` VALUES ('60', '32', '10', '黑色', '1522823812', '1522823812', null);
INSERT INTO `tpshop_goods_attr` VALUES ('61', '32', '10', '粉色', '1522823812', '1522823812', null);
INSERT INTO `tpshop_goods_attr` VALUES ('62', '32', '11', '64G', '1522823812', '1522823812', null);
INSERT INTO `tpshop_goods_attr` VALUES ('63', '32', '11', '128G', '1522823812', '1522823812', null);
INSERT INTO `tpshop_goods_attr` VALUES ('64', '32', '11', '256G', '1522823812', '1522823812', null);
INSERT INTO `tpshop_goods_attr` VALUES ('65', '32', '12', '中国大陆', '1522823812', '1522823812', null);
INSERT INTO `tpshop_goods_attr` VALUES ('66', '32', '13', 'IOS', '1522823812', '1522823812', null);
INSERT INTO `tpshop_goods_attr` VALUES ('67', '33', '10', '金色', '1522823923', '1522823923', null);
INSERT INTO `tpshop_goods_attr` VALUES ('68', '33', '10', '白色', '1522823923', '1522823923', null);
INSERT INTO `tpshop_goods_attr` VALUES ('69', '33', '10', '黑色', '1522823923', '1522823923', null);
INSERT INTO `tpshop_goods_attr` VALUES ('70', '33', '10', '红色', '1522823923', '1522823923', null);
INSERT INTO `tpshop_goods_attr` VALUES ('71', '33', '11', '128G', '1522823923', '1522823923', null);
INSERT INTO `tpshop_goods_attr` VALUES ('72', '33', '11', '256G', '1522823923', '1522823923', null);
INSERT INTO `tpshop_goods_attr` VALUES ('73', '33', '12', '中国大陆', '1522823923', '1522823923', null);
INSERT INTO `tpshop_goods_attr` VALUES ('74', '33', '13', 'IOS', '1522823923', '1522823923', null);
INSERT INTO `tpshop_goods_attr` VALUES ('75', '34', '10', '金色', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('76', '34', '10', '白色', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('77', '34', '10', '黑色', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('78', '34', '11', '128G', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('79', '34', '11', '256G', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('80', '34', '12', '中国大陆', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('81', '34', '13', 'IOS', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('82', '35', '10', '金色', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('83', '35', '10', '白色', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('84', '35', '10', '黑色', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('85', '35', '11', '128G', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('86', '35', '11', '256G', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('87', '35', '12', '中国大陆', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('88', '35', '13', 'IOS', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('89', '36', '10', '金色', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('90', '36', '10', '白色', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('91', '36', '10', '黑色', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('92', '36', '11', '128G', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('93', '36', '11', '256G', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('94', '36', '12', '中国大陆', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('95', '36', '13', 'IOS', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('96', '37', '10', '金色', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('97', '37', '10', '白色', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('98', '37', '10', '黑色', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('99', '37', '11', '128G', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('100', '37', '11', '256G', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('101', '37', '12', '中国大陆', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('102', '37', '13', 'IOS', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('103', '38', '10', '金色', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('104', '38', '10', '白色', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('105', '38', '10', '黑色', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('106', '38', '11', '128G', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('107', '38', '11', '256G', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('108', '38', '12', '中国大陆', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('109', '38', '13', 'IOS', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goods_attr` VALUES ('110', '39', '10', '金色', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('111', '39', '10', '白色', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('112', '39', '10', '黑色', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('113', '39', '11', '128G', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('114', '39', '11', '256G', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('115', '39', '12', '中国大陆', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('116', '39', '13', 'IOS', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('117', '40', '10', '金色', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('118', '40', '10', '白色', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('119', '40', '10', '黑色', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('120', '40', '11', '128G', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('121', '40', '11', '256G', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('122', '40', '12', '中国大陆', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('123', '40', '13', 'IOS', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('124', '41', '10', '金色', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('125', '41', '10', '白色', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('126', '41', '10', '黑色', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('127', '41', '11', '128G', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('128', '41', '11', '256G', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('129', '41', '12', '中国大陆', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('130', '41', '13', 'IOS', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('131', '42', '10', '金色', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('132', '42', '10', '白色', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('133', '42', '10', '黑色', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('134', '42', '11', '128G', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('135', '42', '11', '256G', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('136', '42', '12', '中国大陆', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('137', '42', '13', 'IOS', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('138', '43', '10', '金色', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('139', '43', '10', '白色', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('140', '43', '10', '黑色', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('141', '43', '11', '128G', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('142', '43', '11', '256G', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('143', '43', '12', '中国大陆', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('144', '43', '13', 'IOS', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('145', '44', '10', '金色', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('146', '44', '10', '白色', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('147', '44', '10', '黑色', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('148', '44', '11', '128G', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('149', '44', '11', '256G', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('150', '44', '12', '中国大陆', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('151', '44', '13', 'IOS', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('152', '45', '10', '金色', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('153', '45', '10', '白色', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('154', '45', '10', '黑色', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('155', '45', '11', '128G', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('156', '45', '11', '256G', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('157', '45', '12', '中国大陆', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('158', '45', '13', 'IOS', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('159', '46', '10', '金色', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('160', '46', '10', '白色', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('161', '46', '10', '黑色', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('162', '46', '11', '128G', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('163', '46', '11', '256G', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('164', '46', '12', '中国大陆', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('165', '46', '13', 'IOS', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goods_attr` VALUES ('166', '47', '10', '金色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('167', '47', '10', '白色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('168', '47', '10', '黑色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('169', '47', '11', '128G', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('170', '47', '11', '256G', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('171', '47', '12', '中国大陆', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('172', '47', '13', 'IOS', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('173', '48', '10', '金色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('174', '48', '10', '白色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('175', '48', '10', '黑色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('176', '48', '11', '128G', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('177', '48', '11', '256G', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('178', '48', '12', '中国大陆', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('179', '48', '13', 'IOS', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('180', '49', '10', '金色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('181', '49', '10', '白色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('182', '49', '10', '黑色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('183', '49', '11', '128G', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('184', '49', '11', '256G', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('185', '49', '12', '中国大陆', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('186', '49', '13', 'IOS', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('187', '50', '10', '金色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('188', '50', '10', '白色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('189', '50', '10', '黑色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('190', '50', '11', '128G', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('191', '50', '11', '256G', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('192', '50', '12', '中国大陆', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('193', '50', '13', 'IOS', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('194', '51', '10', '金色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('195', '51', '10', '白色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('196', '51', '10', '黑色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('197', '51', '11', '128G', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('198', '51', '11', '256G', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('199', '51', '12', '中国大陆', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('200', '51', '13', 'IOS', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('201', '52', '10', '金色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('202', '52', '10', '白色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('203', '52', '10', '黑色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('204', '52', '11', '128G', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('205', '52', '11', '256G', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('206', '52', '12', '中国大陆', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('207', '52', '13', 'IOS', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('208', '53', '10', '金色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('209', '53', '10', '白色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('210', '53', '10', '黑色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('211', '53', '11', '128G', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('212', '53', '11', '256G', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('213', '53', '12', '中国大陆', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('214', '53', '13', 'IOS', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('215', '54', '10', '金色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('216', '54', '10', '白色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('217', '54', '10', '黑色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('218', '54', '11', '128G', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('219', '54', '11', '256G', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('220', '54', '12', '中国大陆', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('221', '54', '13', 'IOS', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('222', '55', '10', '金色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('223', '55', '10', '白色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('224', '55', '10', '黑色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('225', '55', '11', '128G', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('226', '55', '11', '256G', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('227', '55', '12', '中国大陆', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('228', '55', '13', 'IOS', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('229', '56', '10', '金色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('230', '56', '10', '白色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('231', '56', '10', '黑色', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('232', '56', '11', '128G', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('233', '56', '11', '256G', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('234', '56', '12', '中国大陆', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('235', '56', '13', 'IOS', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goods_attr` VALUES ('236', '57', '10', '金色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('237', '57', '10', '白色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('238', '57', '10', '黑色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('239', '57', '11', '128G', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('240', '57', '11', '256G', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('241', '57', '12', '中国大陆', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('242', '57', '13', 'IOS', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('243', '58', '10', '金色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('244', '58', '10', '白色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('245', '58', '10', '黑色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('246', '58', '11', '128G', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('247', '58', '11', '256G', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('248', '58', '12', '中国大陆', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('249', '58', '13', 'IOS', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('250', '59', '10', '金色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('251', '59', '10', '白色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('252', '59', '10', '黑色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('253', '59', '11', '128G', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('254', '59', '11', '256G', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('255', '59', '12', '中国大陆', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('256', '59', '13', 'IOS', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('257', '60', '10', '金色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('258', '60', '10', '白色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('259', '60', '10', '黑色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('260', '60', '11', '128G', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('261', '60', '11', '256G', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('262', '60', '12', '中国大陆', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('263', '60', '13', 'IOS', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('264', '61', '10', '金色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('265', '61', '10', '白色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('266', '61', '10', '黑色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('267', '61', '11', '128G', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('268', '61', '11', '256G', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('269', '61', '12', '中国大陆', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('270', '61', '13', 'IOS', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('271', '62', '10', '金色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('272', '62', '10', '白色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('273', '62', '10', '黑色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('274', '62', '11', '128G', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('275', '62', '11', '256G', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('276', '62', '12', '中国大陆', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('277', '62', '13', 'IOS', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('278', '63', '10', '金色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('279', '63', '10', '白色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('280', '63', '10', '黑色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('281', '63', '11', '128G', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('282', '63', '11', '256G', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('283', '63', '12', '中国大陆', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('284', '63', '13', 'IOS', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('285', '64', '10', '金色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('286', '64', '10', '白色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('287', '64', '10', '黑色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('288', '64', '11', '128G', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('289', '64', '11', '256G', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('290', '64', '12', '中国大陆', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('291', '64', '13', 'IOS', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('292', '65', '10', '金色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('293', '65', '10', '白色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('294', '65', '10', '黑色', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('295', '65', '11', '128G', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('296', '65', '11', '256G', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('297', '65', '12', '中国大陆', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('298', '65', '13', 'IOS', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goods_attr` VALUES ('299', '66', '10', '金色', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('300', '66', '10', '白色', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('301', '66', '10', '黑色', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('302', '66', '11', '128G', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('303', '66', '11', '256G', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('304', '66', '12', '中国大陆', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('305', '66', '13', 'IOS', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('306', '67', '10', '金色', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('307', '67', '10', '白色', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('308', '67', '10', '黑色', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('309', '67', '11', '128G', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('310', '67', '11', '256G', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('311', '67', '12', '中国大陆', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('312', '67', '13', 'IOS', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('313', '68', '10', '金色', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('314', '68', '10', '白色', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('315', '68', '10', '黑色', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('316', '68', '11', '128G', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('317', '68', '11', '256G', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('318', '68', '12', '中国大陆', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('319', '68', '13', 'IOS', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('320', '69', '10', '金色', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('321', '69', '10', '白色', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('322', '69', '10', '黑色', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('323', '69', '11', '128G', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('324', '69', '11', '256G', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('325', '69', '12', '中国大陆', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('326', '69', '13', 'IOS', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('327', '70', '10', '金色', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('328', '70', '10', '白色', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('329', '70', '10', '黑色', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('330', '70', '11', '128G', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('331', '70', '11', '256G', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('332', '70', '12', '中国大陆', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('333', '70', '13', 'IOS', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('334', '71', '10', '金色', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('335', '71', '10', '白色', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('336', '71', '10', '黑色', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('337', '71', '11', '128G', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('338', '71', '11', '256G', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('339', '71', '12', '中国大陆', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('340', '71', '13', 'IOS', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goods_attr` VALUES ('341', '72', '10', '金色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('342', '72', '10', '白色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('343', '72', '10', '黑色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('344', '72', '11', '128G', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('345', '72', '11', '256G', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('346', '72', '12', '中国大陆', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('347', '72', '13', 'IOS', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('348', '73', '10', '金色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('349', '73', '10', '白色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('350', '73', '10', '黑色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('351', '73', '11', '128G', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('352', '73', '11', '256G', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('353', '73', '12', '中国大陆', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('354', '73', '13', 'IOS', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('355', '74', '10', '金色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('356', '74', '10', '白色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('357', '74', '10', '黑色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('358', '74', '11', '128G', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('359', '74', '11', '256G', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('360', '74', '12', '中国大陆', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('361', '74', '13', 'IOS', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('362', '75', '10', '金色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('363', '75', '10', '白色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('364', '75', '10', '黑色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('365', '75', '11', '128G', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('366', '75', '11', '256G', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('367', '75', '12', '中国大陆', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('368', '75', '13', 'IOS', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('369', '76', '10', '金色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('370', '76', '10', '白色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('371', '76', '10', '黑色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('372', '76', '11', '128G', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('373', '76', '11', '256G', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('374', '76', '12', '中国大陆', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('375', '76', '13', 'IOS', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('376', '77', '10', '金色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('377', '77', '10', '白色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('378', '77', '10', '黑色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('379', '77', '11', '128G', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('380', '77', '11', '256G', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('381', '77', '12', '中国大陆', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('382', '77', '13', 'IOS', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('383', '78', '10', '金色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('384', '78', '10', '白色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('385', '78', '10', '黑色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('386', '78', '11', '128G', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('387', '78', '11', '256G', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('388', '78', '12', '中国大陆', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('389', '78', '13', 'IOS', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('390', '79', '10', '金色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('391', '79', '10', '白色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('392', '79', '10', '黑色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('393', '79', '11', '128G', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('394', '79', '11', '256G', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('395', '79', '12', '中国大陆', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('396', '79', '13', 'IOS', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('397', '80', '10', '金色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('398', '80', '10', '白色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('399', '80', '10', '黑色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('400', '80', '11', '128G', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('401', '80', '11', '256G', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('402', '80', '12', '中国大陆', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('403', '80', '13', 'IOS', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('404', '81', '10', '金色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('405', '81', '10', '白色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('406', '81', '10', '黑色', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('407', '81', '11', '128G', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('408', '81', '11', '256G', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('409', '81', '12', '中国大陆', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('410', '81', '13', 'IOS', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goods_attr` VALUES ('411', '82', '10', '金色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('412', '82', '10', '白色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('413', '82', '10', '黑色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('414', '82', '11', '128G', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('415', '82', '11', '256G', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('416', '82', '12', '中国大陆', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('417', '82', '13', 'IOS', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('418', '83', '10', '金色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('419', '83', '10', '白色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('420', '83', '10', '黑色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('421', '83', '11', '128G', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('422', '83', '11', '256G', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('423', '83', '12', '中国大陆', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('424', '83', '13', 'IOS', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('425', '84', '10', '金色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('426', '84', '10', '白色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('427', '84', '10', '黑色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('428', '84', '11', '128G', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('429', '84', '11', '256G', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('430', '84', '12', '中国大陆', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('431', '84', '13', 'IOS', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('432', '85', '10', '金色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('433', '85', '10', '白色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('434', '85', '10', '黑色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('435', '85', '11', '128G', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('436', '85', '11', '256G', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('437', '85', '12', '中国大陆', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('438', '85', '13', 'IOS', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('439', '86', '10', '金色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('440', '86', '10', '白色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('441', '86', '10', '黑色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('442', '86', '11', '128G', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('443', '86', '11', '256G', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('444', '86', '12', '中国大陆', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('445', '86', '13', 'IOS', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('446', '87', '10', '金色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('447', '87', '10', '白色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('448', '87', '10', '黑色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('449', '87', '11', '128G', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('450', '87', '11', '256G', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('451', '87', '12', '中国大陆', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('452', '87', '13', 'IOS', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('453', '88', '10', '金色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('454', '88', '10', '白色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('455', '88', '10', '黑色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('456', '88', '11', '128G', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('457', '88', '11', '256G', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('458', '88', '12', '中国大陆', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('459', '88', '13', 'IOS', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('460', '89', '10', '金色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('461', '89', '10', '白色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('462', '89', '10', '黑色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('463', '89', '11', '128G', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('464', '89', '11', '256G', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('465', '89', '12', '中国大陆', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('466', '89', '13', 'IOS', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('467', '90', '10', '金色', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goods_attr` VALUES ('468', '90', '10', '白色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('469', '90', '10', '黑色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('470', '90', '11', '128G', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('471', '90', '11', '256G', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('472', '90', '12', '中国大陆', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('473', '90', '13', 'IOS', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('474', '91', '10', '金色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('475', '91', '10', '白色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('476', '91', '10', '黑色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('477', '91', '11', '128G', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('478', '91', '11', '256G', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('479', '91', '12', '中国大陆', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('480', '91', '13', 'IOS', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('481', '92', '10', '金色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('482', '92', '10', '白色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('483', '92', '10', '黑色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('484', '92', '11', '128G', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('485', '92', '11', '256G', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('486', '92', '12', '中国大陆', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('487', '92', '13', 'IOS', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('488', '93', '10', '金色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('489', '93', '10', '白色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('490', '93', '10', '黑色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('491', '93', '11', '128G', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('492', '93', '11', '256G', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('493', '93', '12', '中国大陆', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('494', '93', '13', 'IOS', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('495', '94', '10', '金色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('496', '94', '10', '白色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('497', '94', '10', '黑色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('498', '94', '11', '128G', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('499', '94', '11', '256G', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('500', '94', '12', '中国大陆', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('501', '94', '13', 'IOS', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('502', '95', '10', '金色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('503', '95', '10', '白色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('504', '95', '10', '黑色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('505', '95', '11', '128G', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('506', '95', '11', '256G', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('507', '95', '12', '中国大陆', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('508', '95', '13', 'IOS', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('509', '96', '10', '金色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('510', '96', '10', '白色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('511', '96', '10', '黑色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('512', '96', '11', '128G', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('513', '96', '11', '256G', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('514', '96', '12', '中国大陆', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('515', '96', '13', 'IOS', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('516', '97', '10', '金色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('517', '97', '10', '白色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('518', '97', '10', '黑色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('519', '97', '11', '128G', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('520', '97', '11', '256G', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('521', '97', '12', '中国大陆', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('522', '97', '13', 'IOS', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('523', '98', '10', '金色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('524', '98', '10', '白色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('525', '98', '10', '黑色', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('526', '98', '11', '128G', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('527', '98', '11', '256G', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('528', '98', '12', '中国大陆', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('529', '98', '13', 'IOS', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goods_attr` VALUES ('530', '99', '10', '金色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('531', '99', '10', '白色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('532', '99', '10', '黑色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('533', '99', '11', '128G', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('534', '99', '11', '256G', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('535', '99', '12', '中国大陆', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('536', '99', '13', 'IOS', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('537', '100', '10', '金色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('538', '100', '10', '白色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('539', '100', '10', '黑色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('540', '100', '11', '128G', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('541', '100', '11', '256G', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('542', '100', '12', '中国大陆', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('543', '100', '13', 'IOS', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('544', '101', '10', '金色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('545', '101', '10', '白色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('546', '101', '10', '黑色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('547', '101', '11', '128G', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('548', '101', '11', '256G', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('549', '101', '12', '中国大陆', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('550', '101', '13', 'IOS', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('551', '102', '10', '金色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('552', '102', '10', '白色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('553', '102', '10', '黑色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('554', '102', '11', '128G', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('555', '102', '11', '256G', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('556', '102', '12', '中国大陆', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('557', '102', '13', 'IOS', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('558', '103', '10', '金色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('559', '103', '10', '白色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('560', '103', '10', '黑色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('561', '103', '11', '128G', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('562', '103', '11', '256G', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('563', '103', '12', '中国大陆', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('564', '103', '13', 'IOS', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('565', '104', '10', '金色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('566', '104', '10', '白色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('567', '104', '10', '黑色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('568', '104', '11', '128G', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('569', '104', '11', '256G', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('570', '104', '12', '中国大陆', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('571', '104', '13', 'IOS', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('572', '105', '10', '金色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('573', '105', '10', '白色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('574', '105', '10', '黑色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('575', '105', '11', '128G', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('576', '105', '11', '256G', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('577', '105', '12', '中国大陆', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('578', '105', '13', 'IOS', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('579', '106', '10', '金色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('580', '106', '10', '白色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('581', '106', '10', '黑色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('582', '106', '11', '128G', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('583', '106', '11', '256G', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('584', '106', '12', '中国大陆', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('585', '106', '13', 'IOS', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('586', '107', '10', '金色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('587', '107', '10', '白色', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goods_attr` VALUES ('588', '107', '10', '黑色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('589', '107', '11', '128G', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('590', '107', '11', '256G', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('591', '107', '12', '中国大陆', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('592', '107', '13', 'IOS', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('593', '108', '10', '金色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('594', '108', '10', '白色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('595', '108', '10', '黑色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('596', '108', '11', '128G', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('597', '108', '11', '256G', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('598', '108', '12', '中国大陆', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('599', '108', '13', 'IOS', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('600', '109', '10', '金色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('601', '109', '10', '白色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('602', '109', '10', '黑色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('603', '109', '11', '128G', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('604', '109', '11', '256G', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('605', '109', '12', '中国大陆', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('606', '109', '13', 'IOS', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('607', '110', '10', '金色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('608', '110', '10', '白色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('609', '110', '10', '黑色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('610', '110', '11', '128G', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('611', '110', '11', '256G', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('612', '110', '12', '中国大陆', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('613', '110', '13', 'IOS', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('614', '111', '10', '金色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('615', '111', '10', '白色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('616', '111', '10', '黑色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('617', '111', '11', '128G', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('618', '111', '11', '256G', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('619', '111', '12', '中国大陆', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('620', '111', '13', 'IOS', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('621', '112', '10', '金色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('622', '112', '10', '白色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('623', '112', '10', '黑色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('624', '112', '11', '128G', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('625', '112', '11', '256G', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('626', '112', '12', '中国大陆', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('627', '112', '13', 'IOS', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('628', '113', '10', '金色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('629', '113', '10', '白色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('630', '113', '10', '黑色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('631', '113', '11', '128G', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('632', '113', '11', '256G', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('633', '113', '12', '中国大陆', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('634', '113', '13', 'IOS', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('635', '114', '10', '金色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('636', '114', '10', '白色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('637', '114', '10', '黑色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('638', '114', '11', '128G', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('639', '114', '11', '256G', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('640', '114', '12', '中国大陆', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('641', '114', '13', 'IOS', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('642', '115', '10', '金色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('643', '115', '10', '白色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('644', '115', '10', '黑色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('645', '115', '11', '128G', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('646', '115', '11', '256G', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('647', '115', '12', '中国大陆', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('648', '115', '13', 'IOS', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('649', '116', '10', '金色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('650', '116', '10', '白色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('651', '116', '10', '黑色', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('652', '116', '11', '128G', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('653', '116', '11', '256G', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('654', '116', '12', '中国大陆', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('655', '116', '13', 'IOS', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goods_attr` VALUES ('656', '117', '10', '金色', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('657', '117', '10', '白色', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('658', '117', '10', '黑色', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('659', '117', '11', '128G', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('660', '117', '11', '256G', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('661', '117', '12', '中国大陆', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('662', '117', '13', 'IOS', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('663', '118', '10', '金色', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('664', '118', '10', '白色', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('665', '118', '10', '黑色', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('666', '118', '11', '128G', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('667', '118', '11', '256G', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('668', '118', '12', '中国大陆', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('669', '118', '13', 'IOS', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('670', '119', '10', '金色', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('671', '119', '10', '白色', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('672', '119', '10', '黑色', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('673', '119', '11', '128G', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('674', '119', '11', '256G', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('675', '119', '12', '中国大陆', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('676', '119', '13', 'IOS', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('677', '120', '10', '金色', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('678', '120', '10', '白色', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('679', '120', '10', '黑色', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('680', '120', '11', '128G', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('681', '120', '11', '256G', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('682', '120', '12', '中国大陆', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('683', '120', '13', 'IOS', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('684', '121', '10', '金色', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('685', '121', '10', '白色', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('686', '121', '10', '黑色', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('687', '121', '11', '128G', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('688', '121', '11', '256G', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('689', '121', '12', '中国大陆', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('690', '121', '13', 'IOS', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goods_attr` VALUES ('691', '122', '10', '金色', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('692', '122', '10', '白色', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('693', '122', '10', '黑色', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('694', '122', '11', '128G', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('695', '122', '11', '256G', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('696', '122', '12', '中国大陆', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('697', '122', '13', 'IOS', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('698', '123', '10', '金色', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('699', '123', '10', '白色', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('700', '123', '10', '黑色', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('701', '123', '11', '128G', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('702', '123', '11', '256G', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('703', '123', '12', '中国大陆', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('704', '123', '13', 'IOS', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('705', '124', '10', '金色', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('706', '124', '10', '白色', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('707', '124', '10', '黑色', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('708', '124', '11', '128G', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('709', '124', '11', '256G', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('710', '124', '12', '中国大陆', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('711', '124', '13', 'IOS', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('712', '125', '10', '金色', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('713', '125', '10', '白色', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('714', '125', '10', '黑色', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('715', '125', '11', '128G', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('716', '125', '11', '256G', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('717', '125', '12', '中国大陆', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('718', '125', '13', 'IOS', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('719', '126', '10', '金色', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('720', '126', '10', '白色', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('721', '126', '10', '黑色', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('722', '126', '11', '128G', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('723', '126', '11', '256G', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('724', '126', '12', '中国大陆', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('725', '126', '13', 'IOS', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('726', '127', '10', '金色', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('727', '127', '10', '白色', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('728', '127', '10', '黑色', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('729', '127', '11', '128G', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('730', '127', '11', '256G', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('731', '127', '12', '中国大陆', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('732', '127', '13', 'IOS', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goods_attr` VALUES ('733', '128', '10', '金色', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('734', '128', '10', '白色', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('735', '128', '10', '黑色', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('736', '128', '11', '128G', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('737', '128', '11', '256G', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('738', '128', '12', '中国大陆', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('739', '128', '13', 'IOS', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('740', '129', '10', '金色', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('741', '129', '10', '白色', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('742', '129', '10', '黑色', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('743', '129', '11', '128G', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('744', '129', '11', '256G', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('745', '129', '12', '中国大陆', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('746', '129', '13', 'IOS', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('747', '130', '10', '金色', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('748', '130', '10', '白色', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('749', '130', '10', '黑色', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('750', '130', '11', '128G', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('751', '130', '11', '256G', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('752', '130', '12', '中国大陆', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('753', '130', '13', 'IOS', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('754', '131', '10', '金色', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('755', '131', '10', '白色', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('756', '131', '10', '黑色', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('757', '131', '11', '128G', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('758', '131', '11', '256G', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('759', '131', '12', '中国大陆', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('760', '131', '13', 'IOS', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('761', '132', '10', '金色', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('762', '132', '10', '白色', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('763', '132', '10', '黑色', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('764', '132', '11', '128G', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('765', '132', '11', '256G', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('766', '132', '12', '中国大陆', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('767', '132', '13', 'IOS', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('768', '133', '10', '金色', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('769', '133', '10', '白色', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('770', '133', '10', '黑色', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('771', '133', '11', '128G', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('772', '133', '11', '256G', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('773', '133', '12', '中国大陆', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goods_attr` VALUES ('774', '133', '13', 'IOS', '1522824834', '1522824834', null);

-- ----------------------------
-- Table structure for tpshop_goodspics
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_goodspics`;
CREATE TABLE `tpshop_goodspics` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `pics_big` varchar(255) NOT NULL DEFAULT '' COMMENT '相册大图地址 800*800',
  `pics_mid` varchar(255) NOT NULL DEFAULT '' COMMENT '相册中图地址 350*350',
  `pics_sma` varchar(255) NOT NULL DEFAULT '' COMMENT '相册小图地址 50*50',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=330 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_goodspics
-- ----------------------------
INSERT INTO `tpshop_goodspics` VALUES ('18', '32', '\\uploads\\20180404\\thumb_big_be9f2896644caf50c87931d23a631946.png', '\\uploads\\20180404\\thumb_mid_be9f2896644caf50c87931d23a631946.png', '\\uploads\\20180404\\thumb_sma_be9f2896644caf50c87931d23a631946.png', '1522821539', '1522821539', null);
INSERT INTO `tpshop_goodspics` VALUES ('19', '32', '\\uploads\\20180404\\thumb_big_5626a82fd7cb28ed00f1469521a51ad9.png', '\\uploads\\20180404\\thumb_mid_5626a82fd7cb28ed00f1469521a51ad9.png', '\\uploads\\20180404\\thumb_sma_5626a82fd7cb28ed00f1469521a51ad9.png', '1522821539', '1522821539', null);
INSERT INTO `tpshop_goodspics` VALUES ('20', '32', '\\uploads\\20180404\\thumb_big_6b8eb94b0d5cc3a798a96b91f6b0e41a.png', '\\uploads\\20180404\\thumb_mid_6b8eb94b0d5cc3a798a96b91f6b0e41a.png', '\\uploads\\20180404\\thumb_sma_6b8eb94b0d5cc3a798a96b91f6b0e41a.png', '1522821539', '1522821539', null);
INSERT INTO `tpshop_goodspics` VALUES ('21', '32', '\\uploads\\20180404\\thumb_big_f4429ed495d9f945e47a80d775fcc90e.png', '\\uploads\\20180404\\thumb_mid_f4429ed495d9f945e47a80d775fcc90e.png', '\\uploads\\20180404\\thumb_sma_f4429ed495d9f945e47a80d775fcc90e.png', '1522821539', '1522821539', null);
INSERT INTO `tpshop_goodspics` VALUES ('22', '32', '\\uploads\\20180404\\thumb_big_86116d1bc5baa684c21563f76526aef0.png', '\\uploads\\20180404\\thumb_mid_86116d1bc5baa684c21563f76526aef0.png', '\\uploads\\20180404\\thumb_sma_86116d1bc5baa684c21563f76526aef0.png', '1522821539', '1522821539', null);
INSERT INTO `tpshop_goodspics` VALUES ('23', '32', '\\uploads\\20180404\\thumb_big_bcedfb40fe74f452a2a6529be79b4b59.png', '\\uploads\\20180404\\thumb_mid_bcedfb40fe74f452a2a6529be79b4b59.png', '\\uploads\\20180404\\thumb_sma_bcedfb40fe74f452a2a6529be79b4b59.png', '1522821539', '1522821539', null);
INSERT INTO `tpshop_goodspics` VALUES ('24', '32', '\\uploads\\20180404\\thumb_big_20c9d1e941efed476d3af7d96ca57f80.jpg', '\\uploads\\20180404\\thumb_mid_20c9d1e941efed476d3af7d96ca57f80.jpg', '\\uploads\\20180404\\thumb_sma_20c9d1e941efed476d3af7d96ca57f80.jpg', '1522821539', '1522821539', null);
INSERT INTO `tpshop_goodspics` VALUES ('25', '33', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522823923', '1522823923', null);
INSERT INTO `tpshop_goodspics` VALUES ('26', '33', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522823923', '1522823923', null);
INSERT INTO `tpshop_goodspics` VALUES ('27', '33', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522823923', '1522823923', null);
INSERT INTO `tpshop_goodspics` VALUES ('28', '33', '\\uploads\\20180404\\thumb_big_527396b5599e0a24862056c80f3eba9f.png', '\\uploads\\20180404\\thumb_mid_527396b5599e0a24862056c80f3eba9f.png', '\\uploads\\20180404\\thumb_sma_527396b5599e0a24862056c80f3eba9f.png', '1522823923', '1522823923', null);
INSERT INTO `tpshop_goodspics` VALUES ('29', '33', '\\uploads\\20180404\\thumb_big_66a7894dba2c79a9f3beab2179a3c28f.png', '\\uploads\\20180404\\thumb_mid_66a7894dba2c79a9f3beab2179a3c28f.png', '\\uploads\\20180404\\thumb_sma_66a7894dba2c79a9f3beab2179a3c28f.png', '1522823923', '1522823923', null);
INSERT INTO `tpshop_goodspics` VALUES ('30', '34', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goodspics` VALUES ('31', '34', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goodspics` VALUES ('32', '34', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goodspics` VALUES ('33', '35', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goodspics` VALUES ('34', '35', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goodspics` VALUES ('35', '35', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goodspics` VALUES ('36', '36', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goodspics` VALUES ('37', '36', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goodspics` VALUES ('38', '36', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goodspics` VALUES ('39', '37', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goodspics` VALUES ('40', '37', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goodspics` VALUES ('41', '37', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goodspics` VALUES ('42', '38', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goodspics` VALUES ('43', '38', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goodspics` VALUES ('44', '38', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824822', '1522824822', null);
INSERT INTO `tpshop_goodspics` VALUES ('45', '39', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goodspics` VALUES ('46', '39', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goodspics` VALUES ('47', '39', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goodspics` VALUES ('48', '40', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goodspics` VALUES ('49', '40', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goodspics` VALUES ('50', '40', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goodspics` VALUES ('51', '41', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goodspics` VALUES ('52', '41', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goodspics` VALUES ('53', '41', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goodspics` VALUES ('54', '42', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goodspics` VALUES ('55', '42', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goodspics` VALUES ('56', '42', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goodspics` VALUES ('57', '43', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goodspics` VALUES ('58', '43', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goodspics` VALUES ('59', '43', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goodspics` VALUES ('60', '44', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goodspics` VALUES ('61', '44', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goodspics` VALUES ('62', '44', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goodspics` VALUES ('63', '45', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goodspics` VALUES ('64', '45', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goodspics` VALUES ('65', '45', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goodspics` VALUES ('66', '46', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goodspics` VALUES ('67', '46', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goodspics` VALUES ('68', '46', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824823', '1522824823', null);
INSERT INTO `tpshop_goodspics` VALUES ('69', '47', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('70', '47', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('71', '47', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('72', '48', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('73', '48', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('74', '48', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('75', '49', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('76', '49', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('77', '49', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('78', '50', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('79', '50', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('80', '50', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('81', '51', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('82', '51', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('83', '51', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('84', '52', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('85', '52', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('86', '52', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('87', '53', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('88', '53', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('89', '53', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('90', '54', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('91', '54', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('92', '54', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('93', '55', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('94', '55', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('95', '55', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('96', '56', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('97', '56', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('98', '56', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824824', '1522824824', null);
INSERT INTO `tpshop_goodspics` VALUES ('99', '57', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('100', '57', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('101', '57', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('102', '58', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('103', '58', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('104', '58', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('105', '59', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('106', '59', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('107', '59', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('108', '60', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('109', '60', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('110', '60', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('111', '61', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('112', '61', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('113', '61', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('114', '62', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('115', '62', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('116', '62', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('117', '63', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('118', '63', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('119', '63', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('120', '64', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('121', '64', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('122', '64', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('123', '65', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('124', '65', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('125', '65', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824825', '1522824825', null);
INSERT INTO `tpshop_goodspics` VALUES ('126', '66', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goodspics` VALUES ('127', '66', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goodspics` VALUES ('128', '66', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goodspics` VALUES ('129', '67', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goodspics` VALUES ('130', '67', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goodspics` VALUES ('131', '67', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goodspics` VALUES ('132', '68', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goodspics` VALUES ('133', '68', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goodspics` VALUES ('134', '68', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goodspics` VALUES ('135', '69', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goodspics` VALUES ('136', '69', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goodspics` VALUES ('137', '69', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goodspics` VALUES ('138', '70', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goodspics` VALUES ('139', '70', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goodspics` VALUES ('140', '70', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goodspics` VALUES ('141', '71', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goodspics` VALUES ('142', '71', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goodspics` VALUES ('143', '71', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824826', '1522824826', null);
INSERT INTO `tpshop_goodspics` VALUES ('144', '72', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('145', '72', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('146', '72', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('147', '73', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('148', '73', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('149', '73', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('150', '74', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('151', '74', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('152', '74', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('153', '75', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('154', '75', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('155', '75', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('156', '76', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('157', '76', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('158', '76', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('159', '77', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('160', '77', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('161', '77', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('162', '78', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('163', '78', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('164', '78', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('165', '79', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('166', '79', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('167', '79', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('168', '80', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('169', '80', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('170', '80', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('171', '81', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('172', '81', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('173', '81', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824827', '1522824827', null);
INSERT INTO `tpshop_goodspics` VALUES ('174', '82', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('175', '82', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('176', '82', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('177', '83', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('178', '83', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('179', '83', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('180', '84', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('181', '84', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('182', '84', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('183', '85', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('184', '85', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('185', '85', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('186', '86', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('187', '86', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('188', '86', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('189', '87', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('190', '87', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('191', '87', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('192', '88', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('193', '88', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('194', '88', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('195', '89', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('196', '89', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('197', '89', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('198', '90', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('199', '90', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('200', '90', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824828', '1522824828', null);
INSERT INTO `tpshop_goodspics` VALUES ('201', '91', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goodspics` VALUES ('202', '91', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goodspics` VALUES ('203', '91', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goodspics` VALUES ('204', '92', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goodspics` VALUES ('205', '92', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goodspics` VALUES ('206', '92', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goodspics` VALUES ('207', '93', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goodspics` VALUES ('208', '93', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goodspics` VALUES ('209', '93', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goodspics` VALUES ('210', '94', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goodspics` VALUES ('211', '94', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goodspics` VALUES ('212', '94', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goodspics` VALUES ('213', '95', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goodspics` VALUES ('214', '95', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goodspics` VALUES ('215', '95', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goodspics` VALUES ('216', '96', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goodspics` VALUES ('217', '96', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goodspics` VALUES ('218', '96', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goodspics` VALUES ('219', '97', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goodspics` VALUES ('220', '97', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goodspics` VALUES ('221', '97', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goodspics` VALUES ('222', '98', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goodspics` VALUES ('223', '98', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goodspics` VALUES ('224', '98', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824829', '1522824829', null);
INSERT INTO `tpshop_goodspics` VALUES ('225', '99', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('226', '99', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('227', '99', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('228', '100', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('229', '100', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('230', '100', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('231', '101', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('232', '101', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('233', '101', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('234', '102', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('235', '102', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('236', '102', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('237', '103', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('238', '103', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('239', '103', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('240', '104', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('241', '104', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('242', '104', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('243', '105', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('244', '105', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('245', '105', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('246', '106', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('247', '106', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('248', '106', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('249', '107', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('250', '107', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('251', '107', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824830', '1522824830', null);
INSERT INTO `tpshop_goodspics` VALUES ('252', '108', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('253', '108', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('254', '108', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('255', '109', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('256', '109', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('257', '109', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('258', '110', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('259', '110', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('260', '110', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('261', '111', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('262', '111', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('263', '111', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('264', '112', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('265', '112', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('266', '112', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('267', '113', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('268', '113', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('269', '113', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('270', '114', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('271', '114', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('272', '114', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('273', '115', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('274', '115', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('275', '115', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('276', '116', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('277', '116', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('278', '116', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('279', '117', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('280', '117', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('281', '117', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824831', '1522824831', null);
INSERT INTO `tpshop_goodspics` VALUES ('282', '118', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goodspics` VALUES ('283', '118', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goodspics` VALUES ('284', '118', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goodspics` VALUES ('285', '119', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goodspics` VALUES ('286', '119', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goodspics` VALUES ('287', '119', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goodspics` VALUES ('288', '120', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goodspics` VALUES ('289', '120', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goodspics` VALUES ('290', '120', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goodspics` VALUES ('291', '121', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goodspics` VALUES ('292', '121', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goodspics` VALUES ('293', '121', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824832', '1522824832', null);
INSERT INTO `tpshop_goodspics` VALUES ('294', '122', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goodspics` VALUES ('295', '122', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goodspics` VALUES ('296', '122', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goodspics` VALUES ('297', '123', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goodspics` VALUES ('298', '123', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goodspics` VALUES ('299', '123', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goodspics` VALUES ('300', '124', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goodspics` VALUES ('301', '124', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goodspics` VALUES ('302', '124', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goodspics` VALUES ('303', '125', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goodspics` VALUES ('304', '125', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goodspics` VALUES ('305', '125', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goodspics` VALUES ('306', '126', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goodspics` VALUES ('307', '126', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goodspics` VALUES ('308', '126', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goodspics` VALUES ('309', '127', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goodspics` VALUES ('310', '127', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goodspics` VALUES ('311', '127', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goodspics` VALUES ('312', '128', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goodspics` VALUES ('313', '128', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goodspics` VALUES ('314', '128', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824833', '1522824833', null);
INSERT INTO `tpshop_goodspics` VALUES ('315', '129', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goodspics` VALUES ('316', '129', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goodspics` VALUES ('317', '129', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goodspics` VALUES ('318', '130', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goodspics` VALUES ('319', '130', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goodspics` VALUES ('320', '130', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goodspics` VALUES ('321', '131', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goodspics` VALUES ('322', '131', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goodspics` VALUES ('323', '131', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goodspics` VALUES ('324', '132', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goodspics` VALUES ('325', '132', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goodspics` VALUES ('326', '132', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goodspics` VALUES ('327', '133', '\\uploads\\20180404\\thumb_big_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_mid_6dd50e7a726f222941f81a551cc3af72.png', '\\uploads\\20180404\\thumb_sma_6dd50e7a726f222941f81a551cc3af72.png', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goodspics` VALUES ('328', '133', '\\uploads\\20180404\\thumb_big_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_mid_dfafa7b34a41917332ac2c4c41cc81dd.png', '\\uploads\\20180404\\thumb_sma_dfafa7b34a41917332ac2c4c41cc81dd.png', '1522824834', '1522824834', null);
INSERT INTO `tpshop_goodspics` VALUES ('329', '133', '\\uploads\\20180404\\thumb_big_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_mid_938fc4a5b57fee49ab76892763542188.png', '\\uploads\\20180404\\thumb_sma_938fc4a5b57fee49ab76892763542188.png', '1522824834', '1522824834', null);

-- ----------------------------
-- Table structure for tpshop_manager
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_manager`;
CREATE TABLE `tpshop_manager` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `nickname` varchar(255) NOT NULL DEFAULT '' COMMENT '昵称',
  `last_login_time` int(11) unsigned DEFAULT NULL COMMENT '上次登录时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1可用 2禁用',
  `role_id` tinyint(3) NOT NULL DEFAULT '0' COMMENT '角色id',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_manager
-- ----------------------------
INSERT INTO `tpshop_manager` VALUES ('1', 'admin', '8ea6eaee0c5819e756b604c998639b13', 'admin@itcast.cn', 'admin', '1520408547', '1', '1', '1520408547', '1522654098', null);
INSERT INTO `tpshop_manager` VALUES ('2', 'sunquan', '8ea6eaee0c5819e756b604c998639b13', 'sunquan@itcast.cn', '骑鱼的猫', '0', '1', '2', '1520408547', null, null);
INSERT INTO `tpshop_manager` VALUES ('3', 'liubei', '8ea6eaee0c5819e756b604c998639b13', 'liubei@itcast.cn', '地球是我搓圆的', '0', '1', '2', '1520408547', null, null);
INSERT INTO `tpshop_manager` VALUES ('4', 'caocao', '8ea6eaee0c5819e756b604c998639b13', 'caocao@itcast.cn', '除了帅我一无所有', '0', '1', '2', '1520408547', null, null);
INSERT INTO `tpshop_manager` VALUES ('5', 'dongzhuo', '8ea6eaee0c5819e756b604c998639b13', 'dongzhuo@itcast.cn', '朕好萌', '0', '2', '3', '1520408547', null, null);
INSERT INTO `tpshop_manager` VALUES ('6', 'yuanshao', '8ea6eaee0c5819e756b604c998639b13', 'yuanshao@itcast.cn', '骑着蜗牛周游世界', '0', '2', '3', '1520408547', null, null);
INSERT INTO `tpshop_manager` VALUES ('7', 'diaochan', '8ea6eaee0c5819e756b604c998639b13', 'diaochan@itcast.cn', '住我心，免房租', '0', '1', '3', '1520408547', null, null);

-- ----------------------------
-- Table structure for tpshop_order
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_order`;
CREATE TABLE `tpshop_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '下单用户id',
  `consignee_name` varchar(255) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `consignee_phone` varchar(255) NOT NULL DEFAULT '' COMMENT '收货人手机号',
  `consignee_address` varchar(255) NOT NULL DEFAULT '' COMMENT '收货人地址',
  `shipping_type` varchar(64) NOT NULL DEFAULT '' COMMENT '配送方式 yuantong圆通 shentong申通 yunda韵达 zhongtong中通 shunfeng顺丰',
  `pay_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '支付状态 0未付款 1已付款',
  `pay_type` varchar(64) NOT NULL DEFAULT '' COMMENT '支付方式 card银联 wechat微信 alipay支付宝',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_order
-- ----------------------------
INSERT INTO `tpshop_order` VALUES ('12', '1522904492178521', '0.05', '1', '曹操', '15312345678', '北京市顺义区黑马程序员', 'yunda', '0', 'alipay', '1522904493', '1522904493', null);
INSERT INTO `tpshop_order` VALUES ('13', '1523501550173352', '0.04', '1', '曹操', '15312345678', '北京市顺义区黑马程序员', '', '0', 'alipay', '1523501550', '1523501550', null);

-- ----------------------------
-- Table structure for tpshop_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_order_goods`;
CREATE TABLE `tpshop_order_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品单价',
  `goods_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '商品logo图',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `goods_attr_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '商品属性ids',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_order_goods
-- ----------------------------
INSERT INTO `tpshop_order_goods` VALUES ('13', '12', '35', 'Apple iphone 4', '0.01', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '2', '82,85', '1522904493', '1522904493', null);
INSERT INTO `tpshop_order_goods` VALUES ('14', '12', '35', 'Apple iphone 4', '0.01', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '3', 'undefined,85', '1522904493', '1522904493', null);
INSERT INTO `tpshop_order_goods` VALUES ('15', '13', '34', 'Apple iphone 2', '0.01', '\\uploads\\20180404\\8649191819f7b4bed7fc8f17ed712a66.png', '4', '75,78', '1523501550', '1523501550', null);

-- ----------------------------
-- Table structure for tpshop_role
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_role`;
CREATE TABLE `tpshop_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色/用户组名称',
  `role_auth_ids` varchar(128) NOT NULL DEFAULT '' COMMENT '权限ids,1,2,5，权限表中的主键集合',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_role
-- ----------------------------
INSERT INTO `tpshop_role` VALUES ('2', '主管', '1,4,5,2,8', '1520408547', '1521337606', null);
INSERT INTO `tpshop_role` VALUES ('3', '经理', '2,8,9,10,3,11,12', '1520408547', '1521259768', null);

-- ----------------------------
-- Table structure for tpshop_type
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_type`;
CREATE TABLE `tpshop_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '类型名称',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_type
-- ----------------------------
INSERT INTO `tpshop_type` VALUES ('1', '坚果', '1521291541', '1521291541', null);
INSERT INTO `tpshop_type` VALUES ('2', '手机', '1521359334', '1521359334', null);

-- ----------------------------
-- Table structure for tpshop_user
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_user`;
CREATE TABLE `tpshop_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '手机号码',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上次登录时间',
  `is_check` tinyint(2) NOT NULL DEFAULT '0' COMMENT '激活状态 0未激活 1已激活',
  `email_code` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱激活验证码',
  `openid` varchar(255) NOT NULL DEFAULT '' COMMENT '第三方帐号openid',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_user
-- ----------------------------
INSERT INTO `tpshop_user` VALUES ('1', '', '15313131313', 'ff2acf370341a01c9712d3bdae961f45', '123456@qq.com', '0', '1', '5442', '', '1521765529', '1521765529', null);
