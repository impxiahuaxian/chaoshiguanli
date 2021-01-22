/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50527
 Source Host           : localhost:3306
 Source Schema         : mystock

 Target Server Type    : MySQL
 Target Server Version : 50527
 File Encoding         : 65001

 Date: 05/04/2020 18:35:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bsd
-- ----------------------------
DROP TABLE IF EXISTS `bsd`;
CREATE TABLE `bsd`  (
  `djid` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `riqi` date NOT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bz` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`djid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  CONSTRAINT `bsd_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报损单' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bsdsp
-- ----------------------------
DROP TABLE IF EXISTS `bsdsp`;
CREATE TABLE `bsdsp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `djid` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `spid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id',
  `spname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `spdw` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品单位',
  `spxinghao` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格型号',
  `dj` double NULL DEFAULT NULL COMMENT '单价',
  `sl` int(11) NULL DEFAULT NULL COMMENT '数量',
  `zj` double NULL DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `F_Bsdsp_Bsd`(`djid`) USING BTREE,
  INDEX `spid`(`spid`) USING BTREE,
  CONSTRAINT `bsdsp_ibfk_1` FOREIGN KEY (`spid`) REFERENCES `spxx` (`spid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `F_Bsdsp_Bsd` FOREIGN KEY (`djid`) REFERENCES `bsd` (`djid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报损单商品' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for byd
-- ----------------------------
DROP TABLE IF EXISTS `byd`;
CREATE TABLE `byd`  (
  `djid` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `riqi` date NOT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bz` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`djid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  CONSTRAINT `byd_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报溢单' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bydsp
-- ----------------------------
DROP TABLE IF EXISTS `bydsp`;
CREATE TABLE `bydsp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `djid` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `spid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id',
  `spname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `spdw` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品单位',
  `spxinghao` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格型号',
  `dj` double NULL DEFAULT NULL COMMENT '单价',
  `sl` int(11) NULL DEFAULT NULL COMMENT '数量',
  `zj` double NULL DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Bydsp_Byd`(`djid`) USING BTREE,
  INDEX `spid`(`spid`) USING BTREE,
  CONSTRAINT `bydsp_ibfk_1` FOREIGN KEY (`spid`) REFERENCES `spxx` (`spid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Bydsp_Byd` FOREIGN KEY (`djid`) REFERENCES `byd` (`djid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报溢单商品' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ckd
-- ----------------------------
DROP TABLE IF EXISTS `ckd`;
CREATE TABLE `ckd`  (
  `djid` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `khid` int(11) NULL DEFAULT NULL COMMENT '供应商id',
  `khname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `riqi` date NOT NULL,
  `yfje` double NULL DEFAULT NULL,
  `sfje` double NULL DEFAULT NULL,
  `cbje` double NULL DEFAULT NULL,
  `jystate` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bz` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`djid`) USING BTREE,
  INDEX `FK_Ckd_Kh`(`khid`) USING BTREE,
  INDEX `FK_Ckd_Users`(`userid`) USING BTREE,
  CONSTRAINT `FK_Ckd_Kh` FOREIGN KEY (`khid`) REFERENCES `kh` (`khid`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `FK_Ckd_Users` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售出库' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ckdsp
-- ----------------------------
DROP TABLE IF EXISTS `ckdsp`;
CREATE TABLE `ckdsp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `djid` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `spid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id',
  `spname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `spdw` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品单位',
  `spxinghao` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格型号',
  `lbid` int(11) NULL DEFAULT NULL,
  `lbname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dj` double NULL DEFAULT NULL COMMENT '单价',
  `sl` int(11) NULL DEFAULT NULL COMMENT '数量',
  `zj` double NULL DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Ckdsp_Ckd`(`djid`) USING BTREE,
  INDEX `spid`(`spid`) USING BTREE,
  CONSTRAINT `ckdsp_ibfk_1` FOREIGN KEY (`spid`) REFERENCES `spxx` (`spid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Ckdsp_Ckd` FOREIGN KEY (`djid`) REFERENCES `ckd` (`djid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售单商品' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for gys
-- ----------------------------
DROP TABLE IF EXISTS `gys`;
CREATE TABLE `gys`  (
  `gysid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lxren` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `lxtel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `bz` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`gysid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '供应商' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jhd
-- ----------------------------
DROP TABLE IF EXISTS `jhd`;
CREATE TABLE `jhd`  (
  `djid` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gysid` int(11) NULL DEFAULT NULL,
  `gysname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `riqi` date NOT NULL,
  `yfje` double NULL DEFAULT NULL,
  `sfje` double NULL DEFAULT NULL,
  `jystate` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bz` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`djid`) USING BTREE,
  INDEX `FK_Jhd_Gys`(`gysid`) USING BTREE,
  INDEX `FK_Jhd_Users`(`userid`) USING BTREE,
  CONSTRAINT `FK_Jhd_Gys` FOREIGN KEY (`gysid`) REFERENCES `gys` (`gysid`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `FK_Jhd_Users` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '进货单' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jhdsp
-- ----------------------------
DROP TABLE IF EXISTS `jhdsp`;
CREATE TABLE `jhdsp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `djid` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `spid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id',
  `spname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `spdw` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品单位',
  `spxinghao` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格型号',
  `lbid` int(11) NULL DEFAULT NULL,
  `lbname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dj` double NULL DEFAULT NULL COMMENT '单价',
  `sl` int(11) NULL DEFAULT NULL COMMENT '数量',
  `zj` double NULL DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Fk_JhdSp_Jhd`(`djid`) USING BTREE,
  INDEX `spid`(`spid`) USING BTREE,
  CONSTRAINT `jhdsp_ibfk_1` FOREIGN KEY (`spid`) REFERENCES `spxx` (`spid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Fk_JhdSp_Jhd` FOREIGN KEY (`djid`) REFERENCES `jhd` (`djid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '进货单商品' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kh
-- ----------------------------
DROP TABLE IF EXISTS `kh`;
CREATE TABLE `kh`  (
  `khid` int(11) NOT NULL AUTO_INCREMENT,
  `khname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lxren` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `lxtel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `bz` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`khid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `menuid` int(11) NOT NULL,
  `menuname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` int(11) NULL DEFAULT NULL,
  `menuurl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menutype` int(11) NOT NULL,
  `ordernum` int(11) NULL DEFAULT NULL,
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`menuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单目录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (0, '系统菜单', -1, NULL, 1, 0, 'menu-plugin');
INSERT INTO `menu` VALUES (10, '进货管理', 0, NULL, 1, 1, 'menu-1');
INSERT INTO `menu` VALUES (20, '销售管理', 0, NULL, 1, 2, 'menu-2');
INSERT INTO `menu` VALUES (30, '库存管理', 0, NULL, 1, 3, 'menu-3');
INSERT INTO `menu` VALUES (40, '统计报表', 0, NULL, 1, 4, 'menu-4');
INSERT INTO `menu` VALUES (50, '基础资料', 0, NULL, 1, 5, 'menu-5');
INSERT INTO `menu` VALUES (60, '系统管理', 0, NULL, 1, 6, 'menu-6');
INSERT INTO `menu` VALUES (1010, '进货入库', 10, '../jinhuo/jinhuo.jsp', 0, 1, 'menu-11');
INSERT INTO `menu` VALUES (1020, '退货出库', 10, '../jinhuo/tuihuo.jsp', 0, 2, 'menu-12');
INSERT INTO `menu` VALUES (1030, '进货单据查询', 10, '../jinhuo/jinsearch.jsp', 0, 3, 'menu-13');
INSERT INTO `menu` VALUES (1040, '退货单据查询', 10, '../jinhuo/mingxi.jsp', 0, 4, 'menu-14');
INSERT INTO `menu` VALUES (1050, '当前库存查询', 10, '../kucun/kcsearch.jsp', 0, 5, 'menu-15');
INSERT INTO `menu` VALUES (2010, '销售出库', 20, '../chushou/chuku.jsp', 0, 1, 'menu-21');
INSERT INTO `menu` VALUES (2020, '客户退货', 20, '../chushou/tuiku.jsp', 0, 2, 'menu-22');
INSERT INTO `menu` VALUES (2030, '销售单据查询', 20, '../chushou/chusearch.jsp', 0, 3, 'menu-23');
INSERT INTO `menu` VALUES (2040, '客户退货查询', 20, '../chushou/mingxi.jsp', 0, 4, 'menu-24');
INSERT INTO `menu` VALUES (2050, '当前库存查询', 20, '../kucun/kcsearch.jsp', 0, 5, 'menu-25');
INSERT INTO `menu` VALUES (3010, '商品报损', 30, '../kucun/baosun.jsp', 0, 1, 'menu-31');
INSERT INTO `menu` VALUES (3020, '商品报溢', 30, '../kucun/baoyi.jsp', 0, 2, 'menu-32');
INSERT INTO `menu` VALUES (3030, '库存报警', 30, '../kucun/baojing.jsp', 0, 3, 'menu-33');
INSERT INTO `menu` VALUES (3040, '报损报溢查询', 30, '../kucun/biansearch.jsp', 0, 4, 'menu-34');
INSERT INTO `menu` VALUES (3050, '当前库存查询', 30, '../kucun/kcsearch.jsp', 0, 5, 'menu-35');
INSERT INTO `menu` VALUES (4010, '供应商统计', 40, '../tongji/gystj.jsp', 0, 1, 'menu-41');
INSERT INTO `menu` VALUES (4020, '客户统计', 40, '../tongji/khtj.jsp', 0, 2, 'menu-42');
INSERT INTO `menu` VALUES (4030, '商品采购统计', 40, '../tongji/spcgtj.jsp', 0, 3, 'menu-43');
INSERT INTO `menu` VALUES (4040, '商品销售统计', 40, '../tongji/spxstj.jsp', 0, 4, 'menu-44');
INSERT INTO `menu` VALUES (4050, '按日统计分析', 40, '../tongji/tjfxri.jsp', 0, 5, 'menu-45');
INSERT INTO `menu` VALUES (4060, '按月统计分析', 40, '../tongji/tjfxyue.jsp', 0, 6, 'menu-46');
INSERT INTO `menu` VALUES (5010, '供应商管理', 50, '../ziliao/gys.jsp', 0, 1, 'menu-51');
INSERT INTO `menu` VALUES (5020, '客户管理', 50, '../ziliao/kh.jsp', 0, 2, 'menu-52');
INSERT INTO `menu` VALUES (5030, '商品管理', 50, '../ziliao/spxx.jsp', 0, 3, 'menu-53');
INSERT INTO `menu` VALUES (5040, '期初库存', 50, '../ziliao/kc.jsp', 0, 4, 'menu-54');
INSERT INTO `menu` VALUES (6010, '角色管理', 60, '../power/role.jsp', 0, 1, 'menu-61');
INSERT INTO `menu` VALUES (6020, '用户管理', 60, '../power/user.jsp', 0, 2, 'menu-62');
INSERT INTO `menu` VALUES (6030, '数据库管理', 60, '../power/beifen.jsp', 3, 3, 'menu-63');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bz` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '管理员', '系统管理');

-- ----------------------------
-- Table structure for rolemenu
-- ----------------------------
DROP TABLE IF EXISTS `rolemenu`;
CREATE TABLE `rolemenu`  (
  `roleid` int(11) NOT NULL,
  `menuid` int(11) NOT NULL,
  PRIMARY KEY (`roleid`, `menuid`) USING BTREE,
  INDEX `menuid`(`menuid`) USING BTREE,
  CONSTRAINT `rolemenu_ibfk_3` FOREIGN KEY (`menuid`) REFERENCES `menu` (`menuid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `rolemenu_ibfk_4` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rolemenu
-- ----------------------------
INSERT INTO `rolemenu` VALUES (1, 10);
INSERT INTO `rolemenu` VALUES (1, 20);
INSERT INTO `rolemenu` VALUES (1, 30);
INSERT INTO `rolemenu` VALUES (1, 40);
INSERT INTO `rolemenu` VALUES (1, 50);
INSERT INTO `rolemenu` VALUES (1, 60);
INSERT INTO `rolemenu` VALUES (1, 1010);
INSERT INTO `rolemenu` VALUES (1, 1020);
INSERT INTO `rolemenu` VALUES (1, 1030);
INSERT INTO `rolemenu` VALUES (1, 1040);
INSERT INTO `rolemenu` VALUES (1, 1050);
INSERT INTO `rolemenu` VALUES (1, 2010);
INSERT INTO `rolemenu` VALUES (1, 2020);
INSERT INTO `rolemenu` VALUES (1, 2030);
INSERT INTO `rolemenu` VALUES (1, 2040);
INSERT INTO `rolemenu` VALUES (1, 2050);
INSERT INTO `rolemenu` VALUES (1, 3010);
INSERT INTO `rolemenu` VALUES (1, 3020);
INSERT INTO `rolemenu` VALUES (1, 3030);
INSERT INTO `rolemenu` VALUES (1, 3040);
INSERT INTO `rolemenu` VALUES (1, 3050);
INSERT INTO `rolemenu` VALUES (1, 4010);
INSERT INTO `rolemenu` VALUES (1, 4020);
INSERT INTO `rolemenu` VALUES (1, 4030);
INSERT INTO `rolemenu` VALUES (1, 4040);
INSERT INTO `rolemenu` VALUES (1, 4050);
INSERT INTO `rolemenu` VALUES (1, 4060);
INSERT INTO `rolemenu` VALUES (1, 5010);
INSERT INTO `rolemenu` VALUES (1, 5020);
INSERT INTO `rolemenu` VALUES (1, 5030);
INSERT INTO `rolemenu` VALUES (1, 5040);
INSERT INTO `rolemenu` VALUES (1, 6010);
INSERT INTO `rolemenu` VALUES (1, 6020);
INSERT INTO `rolemenu` VALUES (1, 6030);

-- ----------------------------
-- Table structure for spdw
-- ----------------------------
DROP TABLE IF EXISTS `spdw`;
CREATE TABLE `spdw`  (
  `dwid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dwname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`dwid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '货物单位' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of spdw
-- ----------------------------
INSERT INTO `spdw` VALUES (1, '个');
INSERT INTO `spdw` VALUES (2, '袋');
INSERT INTO `spdw` VALUES (3, '盒');
INSERT INTO `spdw` VALUES (4, '相');

-- ----------------------------
-- Table structure for splb
-- ----------------------------
DROP TABLE IF EXISTS `splb`;
CREATE TABLE `splb`  (
  `lbid` int(11) NOT NULL AUTO_INCREMENT,
  `lbname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别名称',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父类别id',
  PRIMARY KEY (`lbid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品类别' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for spxx
-- ----------------------------
DROP TABLE IF EXISTS `spxx`;
CREATE TABLE `spxx`  (
  `spid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id',
  `spname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货物名称',
  `xinghao` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '型号',
  `lbid` int(11) NOT NULL COMMENT '类别id',
  `lbname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dw` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `jhprice` double NULL DEFAULT 0,
  `chprice` double NULL DEFAULT 0,
  `scjj` double NULL DEFAULT 0,
  `kcsl` int(11) NULL DEFAULT 0,
  `kczj` double NULL DEFAULT 0,
  `minnum` int(11) NULL DEFAULT 0,
  `csname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `bz` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`spid`) USING BTREE,
  INDEX `FK_Spxx_Splb`(`lbid`) USING BTREE,
  CONSTRAINT `FK_Spxx_Splb` FOREIGN KEY (`lbid`) REFERENCES `splb` (`lbid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for thd
-- ----------------------------
DROP TABLE IF EXISTS `thd`;
CREATE TABLE `thd`  (
  `djid` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gysid` int(11) NULL DEFAULT NULL,
  `gysname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `riqi` date NOT NULL,
  `yfje` double NULL DEFAULT NULL COMMENT '应付金额',
  `sfje` double NULL DEFAULT NULL COMMENT '实付金额',
  `jystate` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bz` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`djid`) USING BTREE,
  INDEX `FK_Thd_Gys`(`gysid`) USING BTREE,
  INDEX `FK_Thd_Users`(`userid`) USING BTREE,
  CONSTRAINT `FK_Thd_Gys` FOREIGN KEY (`gysid`) REFERENCES `gys` (`gysid`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `FK_Thd_Users` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品退库' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for thdsp
-- ----------------------------
DROP TABLE IF EXISTS `thdsp`;
CREATE TABLE `thdsp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `djid` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `spid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id',
  `spname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `spdw` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品单位',
  `spxinghao` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格型号',
  `lbid` int(11) NULL DEFAULT NULL,
  `lbname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dj` double NULL DEFAULT NULL COMMENT '单价',
  `sl` int(11) NULL DEFAULT NULL COMMENT '数量',
  `zj` double NULL DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Thdsp_Thd`(`djid`) USING BTREE,
  INDEX `spid`(`spid`) USING BTREE,
  CONSTRAINT `thdsp_ibfk_1` FOREIGN KEY (`spid`) REFERENCES `spxx` (`spid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Thdsp_Thd` FOREIGN KEY (`djid`) REFERENCES `thd` (`djid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退货单商品' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tkd
-- ----------------------------
DROP TABLE IF EXISTS `tkd`;
CREATE TABLE `tkd`  (
  `djid` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `khid` int(11) NULL DEFAULT NULL COMMENT '供应商id',
  `khname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `riqi` date NOT NULL,
  `yfje` double NULL DEFAULT NULL,
  `sfje` double NULL DEFAULT NULL,
  `cbje` double NULL DEFAULT NULL,
  `jystate` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bz` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`djid`) USING BTREE,
  INDEX `FK_Tkd_Kh`(`khid`) USING BTREE,
  INDEX `FK_Tkd_Users`(`userid`) USING BTREE,
  CONSTRAINT `FK_Tkd_Kh` FOREIGN KEY (`khid`) REFERENCES `kh` (`khid`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `FK_Tkd_Users` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户退货' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tkdsp
-- ----------------------------
DROP TABLE IF EXISTS `tkdsp`;
CREATE TABLE `tkdsp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `djid` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `spid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id',
  `spname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `spdw` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品单位',
  `spxinghao` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格型号',
  `lbid` int(11) NULL DEFAULT NULL,
  `lbname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dj` double NULL DEFAULT NULL COMMENT '单价',
  `sl` int(11) NULL DEFAULT NULL COMMENT '数量',
  `zj` double NULL DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `djid`(`djid`) USING BTREE,
  INDEX `spid`(`spid`) USING BTREE,
  CONSTRAINT `tkdsp_ibfk_5` FOREIGN KEY (`spid`) REFERENCES `spxx` (`spid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tkdsp_ibfk_4` FOREIGN KEY (`djid`) REFERENCES `tkd` (`djid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户退货商品' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `logincode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleid` int(11) NULL DEFAULT NULL,
  `state` int(11) NOT NULL,
  `bz` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE,
  INDEX `roleid`(`roleid`) USING BTREE,
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'admin', '管理员', 1, 0, '系统管理员');

-- ----------------------------
-- View structure for vusermenu
-- ----------------------------
DROP VIEW IF EXISTS `vusermenu`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vusermenu` AS select distinct sql_no_cache `a`.`userid` AS `userid`,`a`.`logincode` AS `logincode`,`a`.`username` AS `username`,`d`.`menuid` AS `menuid`,`d`.`menuname` AS `menuname`,`d`.`pid` AS `pid`,`d`.`menuurl` AS `menuurl`,`d`.`menutype` AS `menutype`,`d`.`ordernum` AS `ordernum`,`d`.`icon` AS `icon` from ((`users` `a` join `rolemenu` `c`) join `menu` `d`) where ((`a`.`roleid` = `c`.`roleid`) and (`c`.`menuid` = `d`.`menuid`)) order by `d`.`ordernum` ;

-- ----------------------------
-- Triggers structure for table ckdsp
-- ----------------------------
DROP TRIGGER IF EXISTS `ckdsp_setspxx`;
delimiter ;;
CREATE TRIGGER `ckdsp_setspxx` BEFORE DELETE ON `ckdsp` FOR EACH ROW BEGIN
    update spxx set kcsl=kcsl+old.sl,kczj=kcsl*jhprice where spid=old.spid;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table jhdsp
-- ----------------------------
DROP TRIGGER IF EXISTS `jhdsp_setspxx`;
delimiter ;;
CREATE TRIGGER `jhdsp_setspxx` BEFORE DELETE ON `jhdsp` FOR EACH ROW BEGIN
    update spxx set kcsl=kcsl-old.sl,kczj=kcsl*jhprice where spid=old.spid;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table thdsp
-- ----------------------------
DROP TRIGGER IF EXISTS `thdsp_setspxx`;
delimiter ;;
CREATE TRIGGER `thdsp_setspxx` BEFORE DELETE ON `thdsp` FOR EACH ROW BEGIN
    update spxx set kcsl=kcsl+old.sl,kczj=kcsl*jhprice where spid=old.spid;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table tkdsp
-- ----------------------------
DROP TRIGGER IF EXISTS `tkdsp_setspxx`;
delimiter ;;
CREATE TRIGGER `tkdsp_setspxx` BEFORE DELETE ON `tkdsp` FOR EACH ROW BEGIN
    update spxx set kcsl=kcsl-old.sl,kczj=kcsl*jhprice where spid=old.spid;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
