/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : tap

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-07-03 15:53:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ly_buttom
-- ----------------------------
DROP TABLE IF EXISTS `ly_buttom`;
CREATE TABLE `ly_buttom` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) DEFAULT NULL COMMENT '名称',
  `buttom` varchar(200) DEFAULT NULL COMMENT '样式',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_buttom
-- ----------------------------
INSERT INTO `ly_buttom` VALUES ('1', '新增', '<button type=\"button\" id=\"addFun\" class=\"btn btn-primary marR10\">新增</button>', '');
INSERT INTO `ly_buttom` VALUES ('2', '编辑', '<button type=\"button\" id=\"editFun\" class=\"btn btn-info marR10\">编辑</button>', null);
INSERT INTO `ly_buttom` VALUES ('3', '删除', '<button type=\"button\" id=\"delFun\" class=\"btn btn-danger marR10\">删除</button>', null);
INSERT INTO `ly_buttom` VALUES ('4', '上传', '<button type=\"button\" id=\"upLoad\" class=\"btn btn-primary marR10\">上传</button>', null);
INSERT INTO `ly_buttom` VALUES ('5', '下载', '<button type=\"button\" id=\"downLoad\" class=\"btn btn-primary marR10\">下载</button>', null);
INSERT INTO `ly_buttom` VALUES ('6', '上移', '<button type=\"button\" id=\"lyGridUp\" class=\"btn btn-success marR10\">上移</button>', null);
INSERT INTO `ly_buttom` VALUES ('7', '下移', '<button type=\"button\" id=\"lyGridDown\" class=\"btn btn btn-grey marR10\">下移</button>', null);
INSERT INTO `ly_buttom` VALUES ('8', '分配权限', '<button type=\"button\" id=\"permissions\" class=\"btn btn btn-grey marR10\">分配权限</button>', null);
INSERT INTO `ly_buttom` VALUES ('9', '重置密码', '<button type=\"button\" id=\"reset\" class=\"btn btn btn-grey marR10\">重置密码</button>', null);
INSERT INTO `ly_buttom` VALUES ('10', '新增订单详情', '<button type=\"button\" id=\"addDetail\" class=\"btn btn-primary marR10\">新增订单详情</button>', null);
INSERT INTO `ly_buttom` VALUES ('11', '新增订单详情状态', '<button type=\"button\" id=\"addDetailStatus\" class=\"btn btn-primary marR10\">新增订单详情状态</button>', null);
INSERT INTO `ly_buttom` VALUES ('13', '新增生产详情状态', '<button type=\"button\" id=\"addProduceDetailStatus\" class=\"btn btn-primary marR10\">新增生产详情状态</button>', null);

-- ----------------------------
-- Table structure for ly_resources
-- ----------------------------
DROP TABLE IF EXISTS `ly_resources`;
CREATE TABLE `ly_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `parentId` int(11) DEFAULT NULL COMMENT '上级主键',
  `resKey` varchar(50) DEFAULT NULL COMMENT '关键字',
  `type` varchar(40) DEFAULT NULL COMMENT '菜单类型',
  `resUrl` varchar(200) DEFAULT NULL COMMENT '地址',
  `level` int(4) DEFAULT NULL COMMENT '等级',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `ishide` int(3) DEFAULT '0' COMMENT '是否隐藏',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_resources
-- ----------------------------
INSERT INTO `ly_resources` VALUES ('1', '系统基础管理', '0', 'system', '0', 'system', '1', '', '0', '系统基础管理');
INSERT INTO `ly_resources` VALUES ('2', '用户管理', '1', 'account', '1', '/user/list.shtml', '2', null, '0', null);
INSERT INTO `ly_resources` VALUES ('3', '角色管理', '1', 'role', '1', '/role/list.shtml', '8', '', '0', '组管理');
INSERT INTO `ly_resources` VALUES ('4', '菜单管理', '1', 'ly_resources', '1', '/resources/list.shtml', '13', '', '0', '菜单管理');
INSERT INTO `ly_resources` VALUES ('5', '新增用户', '2', 'account_add', '2', '/user/addUI.shtml', '3', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addAccount&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('6', '修改用户', '2', 'account_edit', '2', '/user/editUI.shtml', '4', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editAccount&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('7', '删除用户', '2', 'account_delete', '2', '/user/deleteById.shtml', '5', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delAccount&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('8', '新增角色', '3', 'role_add', '2', '/role/addUI.shtml', '9', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addRole&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('9', '修改角色', '3', 'role_edit', '2', '/role/editUI.shtml', '10', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editRole&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('10', '删除角色', '3', 'role_delete', '2', '/role/delete.shtml', '11', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delRole&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('11', '角色分配权限', '3', 'role_perss', '2', '/resources/permissions.shtml', '12', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;permissions&quot;&nbsp;class=&quot;btn&nbsp;btn&nbsp;btn-grey&nbsp;marR10&quot;&gt;分配权限&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('25', '登陆信息管理', '0', 'ly_login', '0', 'ly_login', '19', '', '0', '登陆信息管理');
INSERT INTO `ly_resources` VALUES ('26', '用户登录记录', '25', 'ly_log_list', '1', '/userlogin/listUI.shtml', '20', null, '0', '用户登录记录');
INSERT INTO `ly_resources` VALUES ('29', '新增菜单资源', '4', 'ly_resources_add', '2', '/resources/addUI.shtml', '14', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addFun&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('30', '修改菜单资源', '4', 'ly_resources_edit', '2', '/resources/editUI.shtml', '15', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('31', '删除菜单资源', '4', 'ly_resources_delete', '2', '/resources/delete.shtml', '16', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('32', '系统监控管理', '0', 'monitor', '0', 'monitor', '17', '', '0', '系统监控管理');
INSERT INTO `ly_resources` VALUES ('33', '实时监控', '32', 'sysmonitor', '1', '/monitor/monitor.shtml', '18', null, '0', '实时监控');
INSERT INTO `ly_resources` VALUES ('34', '用户分配权限', '2', 'permissions', '2', '/resources/permissions.shtml', '6', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;permissions&quot;&nbsp;class=&quot;btn&nbsp;btn&nbsp;btn-grey&nbsp;marR10&quot;&gt;分配权限&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('35', '用户重置密码', '2', 'account_reset', '2', '/user/resetPassword.shtml', '7', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;reset&quot;&nbsp;class=&quot;btn&nbsp;btn&nbsp;btn-grey&nbsp;marR10&quot;&gt;重置密码&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('36', '订单高级管理', '0', 'company', '0', 'company', '47', '', '0', '订单高级管理');
INSERT INTO `ly_resources` VALUES ('37', '客户管理', '48', 'customer', '1', '/customer/list.shtml', '22', null, '0', '客户管理');
INSERT INTO `ly_resources` VALUES ('38', '新增客户', '37', 'customer_add', '2', '/customer/addUI.shtml', '23', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addFun&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('39', '修改客户', '37', 'customer_edit', '2', '/customer/editUI.shtml', '24', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('40', '删除客户', '37', 'customer_delete', '2', '/customer/deleteById.shtml', '25', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('41', '订单管理', '36', 'order', '1', '/order/list.shtml', '48', null, '0', '订单管理');
INSERT INTO `ly_resources` VALUES ('42', '新增订单', '41', 'order_add', '2', '/order/addUI.shtml', '49', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addFun&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('43', '修改订单', '41', 'order_edit', '2', '/order/editUI.shtml', '50', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('44', '订单性质管理', '48', 'order_nature', '1', '/order/nature/list.shtml', '30', null, '0', '订单性质管理');
INSERT INTO `ly_resources` VALUES ('45', '新增订单性质', '44', 'nature_add', '2', '/order/nature/addUI.shtml', '31', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addFun&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('46', '修改订单性质', '44', 'nature_edit', '2', '/order/nature/editUI.shtml', '32', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('47', '删除订单性质', '44', 'nature_delete', '2', '/order/nature/deleteById.shtml', '33', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('48', '配置管理', '0', 'product', '0', 'product', '21', '', '0', '配置管理');
INSERT INTO `ly_resources` VALUES ('49', '产品管理', '48', 'pro', '1', '/product/list.shtml', '29', null, '0', '产品管理');
INSERT INTO `ly_resources` VALUES ('50', '新增产品', '49', 'pro_add', '2', '/product/addUI.shtml', '30', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addFun&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('51', '修改产品', '49', 'pro_edit', '2', '/product/editUI.shtml', '31', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('52', '删除产品', '49', 'pro_delete', '2', '/product/deleteById.shtml', '32', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('53', '订单详情管理', '36', 'detail', '1', '/order/detail/list.shtml', '53', null, '0', '订单详情管理');
INSERT INTO `ly_resources` VALUES ('54', '新增订单详情', '41', 'detail_add', '2', '/order/detail/addUI.shtml', '52', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addDetail&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增订单详情&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('55', '修改订单详情', '53', 'detail_edit', '2', '/order/detail/editUI.shtml', '54', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('57', '新增订单详情状态', '53', 'detail_status_add', '2', '/order/detail/status/addUI.shtml', '56', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addDetailStatus&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增订单详情状态&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('58', '订单详情状态管理', '36', 'detail_status', '1', '/order/detail/status/list.shtml', '57', null, '0', '订单详情状态管理');
INSERT INTO `ly_resources` VALUES ('61', '统计分析', '0', 'analyse', '0', 'analyse', '60', '', '0', '统计分析');
INSERT INTO `ly_resources` VALUES ('62', '订单产品汇总', '61', 'order_product', '1', '/analyse/list.shtml', '61', null, '0', '订单产品汇总');
INSERT INTO `ly_resources` VALUES ('63', '订单管理', '0', 'company1', '0', 'company1', '34', '', '0', '订单管理');
INSERT INTO `ly_resources` VALUES ('64', '订单管理', '63', 'order1', '1', '/orderlow/list.shtml', '35', '', '0', '订单管理');
INSERT INTO `ly_resources` VALUES ('65', '新增订单', '64', 'order_add1', '2', '/orderlow/addUI.shtml', '36', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addFun&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('66', '修改订单', '64', 'order_edit1', '2', '/orderlow/editUI.shtml', '37', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('67', '订单详情管理', '63', 'detail1', '1', '/orderlow/detail/list.shtml', '40', '', '0', '订单详情管理');
INSERT INTO `ly_resources` VALUES ('68', '新增订单详情', '64', 'detail_add1', '2', '/orderlow/detail/addUI.shtml', '39', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addDetail&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增订单详情&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('69', '修改订单详情', '67', 'detail_edit1', '2', '/orderlow/detail/editUI.shtml', '41', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('71', '新增订单详情状态', '67', 'detail_status_add1', '2', '/orderlow/detail/status/addUI.shtml', '43', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addDetailStatus&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增订单详情状态&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('72', '订单详情状态管理', '63', 'detail_status1', '1', '/orderlow/detail/status/list.shtml', '44', '', '0', '订单详情状态管理');
INSERT INTO `ly_resources` VALUES ('77', '采购管理', '0', 'buycon', '0', '采购管理', '80', null, '0', '采购管理');
INSERT INTO `ly_resources` VALUES ('78', '采购管理', '77', 'buy', '1', '/buy/list.shtml', '83', '', '0', '采购管理');
INSERT INTO `ly_resources` VALUES ('79', '生产管理', '0', 'producecon', '0', '生产管理', '86', null, '0', '生产管理');
INSERT INTO `ly_resources` VALUES ('80', '生产计划管理', '79', 'produce_plan', '1', '/produce/list.shtml', '88', '', '0', '生产计划管理');
INSERT INTO `ly_resources` VALUES ('81', '库存管理', '0', 'stock1', '0', 'stock', '75', '', '0', '库存管理');
INSERT INTO `ly_resources` VALUES ('82', '库存管理', '81', 'stock', '1', '/stock/list.shtml', '81', '', '0', '库存管理');
INSERT INTO `ly_resources` VALUES ('83', '新增库存', '82', 'stock_add', '2', '/stock/addUI.shtml', '76', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addFun&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('84', '修改库存', '82', 'stock_edit', '2', '/stock/editUI.shtml', '77', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('85', '删除库存', '82', 'stock_delete', '2', '/stock/deleteById.shtml', '78', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('86', '删除订单', '64', 'order_delete1', '2', '/orderlow/deleteById.shtml', '38', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('87', '删除订单详情', '67', 'detail_delete1', '2', '/orderlow/detail/deleteById.shtml', '42', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('88', '修改订单详情状态', '72', 'detail_status_edit1', '2', '/orderlow/detail/status/editUI.shtml', '45', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('89', '删除订单详情状态', '72', 'detail_status_delete1', '2', '/orderlow/detail/status/deleteById.shtml', '46', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('90', '删除订单', '41', 'order_delete', '2', '/order/deleteById.shtml', '51', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('91', '删除订单详情', '53', 'detail_delete', '2', '/order/detail/deleteById.shtml', '55', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('92', '修改订单详情状态', '58', 'detail_status_edit', '2', '/order/detail/status/editUI.shtml', '58', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('93', '删除订单详情状态', '58', 'detail_status_delete', '2', '/order/detail/status/deleteById.shtml', '59', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('94', '供应商管理', '48', 'supplier', '1', '/supplier/list.shtml', '26', '', '0', '供应商管理');
INSERT INTO `ly_resources` VALUES ('95', '新增供应商', '94', 'supplier_add', '2', '/supplier/addUI.shtml', '27', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addFun&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('96', '修改供应商', '94', 'supplier_edit', '2', '/supplier/editUI.shtml', '28', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('97', '删除供应商', '94', 'supplier_delete', '2', '/supplier/deleteById.shtml', '29', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('98', '原材料库存管理', '81', 'raw_stock', '1', '/raw/list.shtml', '164', '', '0', '原材料库存管理');
INSERT INTO `ly_resources` VALUES ('99', '新增库存', '98', 'raw_stock_add', '2', '/raw/addUI.shtml', '167', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addFun&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('100', '修改库存', '98', 'raw_stock_edit', '2', '/raw/editUI.shtml', '172', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('101', '删除库存', '98', 'raw_stock_delete', '2', '/raw/deleteById.shtml', '177', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('102', '模具库存管理', '81', 'model_stock', '1', '/model/list.shtml', '265', '', '0', '模具库存管理');
INSERT INTO `ly_resources` VALUES ('103', '新增库存', '102', 'model_stock_add', '2', '/model/addUI.shtml', '268', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addFun&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('104', '修改库存', '102', 'model_stock_edit', '2', '/model/editUI.shtml', '273', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('105', '删除库存', '102', 'model_stock_delete', '2', '/model/deleteById.shtml', '278', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('106', '新增采购', '78', 'buy_add', '2', '/buy/addUI.shtml', '69', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addFun&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('107', '修改采购', '78', 'buy_edit', '2', '/buy/editUI.shtml', '74', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('108', '删除采购', '78', 'buy_delete', '2', '/buy/deleteById.shtml', '79', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('109', '材料领用', '79', 'use', '1', '/use/list.shtml', '82', null, '0', '材料领用');
INSERT INTO `ly_resources` VALUES ('110', '新增材料领用', '109', 'use_add', '2', '/use/addUI.shtml', '85', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addFun&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('112', '新增生产计划', '80', 'produce_add', '2', '/produce/addUI.shtml', '87', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addFun&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('114', '新增生产详情状态', '80', 'produce_status_add', '2', '/produce/addStatusUI.shtml', '94', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addProduceDetailStatus&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增生产详情状态&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('115', '生产详情状态管理', '79', 'produce_status', '1', '/produce/status/list.shtml', '90', null, '0', '生产详情状态管理');
INSERT INTO `ly_resources` VALUES ('118', '编辑生产计划', '80', 'produce_edit', '2', '/produce/editUI.shtml', '89', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('119', '删除生产计划', '80', 'produce_delete', '2', '/produce/deleteById.shtml', '93', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('120', '熔炼管理', '79', 'fusion', '1', '/fusion/list.shtml', '95', '', '0', '熔炼管理');
INSERT INTO `ly_resources` VALUES ('121', '新增熔炼记录', '120', 'fusion_add', '2', '/fusion/addUI.shtml', '96', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addFun&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');

-- ----------------------------
-- Table structure for ly_res_user
-- ----------------------------
DROP TABLE IF EXISTS `ly_res_user`;
CREATE TABLE `ly_res_user` (
  `resId` int(11) NOT NULL COMMENT '菜单主键',
  `userId` int(11) NOT NULL COMMENT '用户主键',
  PRIMARY KEY (`userId`,`resId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_res_user
-- ----------------------------
INSERT INTO `ly_res_user` VALUES ('1', '1');
INSERT INTO `ly_res_user` VALUES ('2', '1');
INSERT INTO `ly_res_user` VALUES ('3', '1');
INSERT INTO `ly_res_user` VALUES ('4', '1');
INSERT INTO `ly_res_user` VALUES ('5', '1');
INSERT INTO `ly_res_user` VALUES ('6', '1');
INSERT INTO `ly_res_user` VALUES ('7', '1');
INSERT INTO `ly_res_user` VALUES ('8', '1');
INSERT INTO `ly_res_user` VALUES ('9', '1');
INSERT INTO `ly_res_user` VALUES ('10', '1');
INSERT INTO `ly_res_user` VALUES ('11', '1');
INSERT INTO `ly_res_user` VALUES ('25', '1');
INSERT INTO `ly_res_user` VALUES ('26', '1');
INSERT INTO `ly_res_user` VALUES ('29', '1');
INSERT INTO `ly_res_user` VALUES ('30', '1');
INSERT INTO `ly_res_user` VALUES ('31', '1');
INSERT INTO `ly_res_user` VALUES ('32', '1');
INSERT INTO `ly_res_user` VALUES ('33', '1');
INSERT INTO `ly_res_user` VALUES ('34', '1');
INSERT INTO `ly_res_user` VALUES ('35', '1');
INSERT INTO `ly_res_user` VALUES ('36', '1');
INSERT INTO `ly_res_user` VALUES ('37', '1');
INSERT INTO `ly_res_user` VALUES ('38', '1');
INSERT INTO `ly_res_user` VALUES ('39', '1');
INSERT INTO `ly_res_user` VALUES ('40', '1');
INSERT INTO `ly_res_user` VALUES ('41', '1');
INSERT INTO `ly_res_user` VALUES ('42', '1');
INSERT INTO `ly_res_user` VALUES ('43', '1');
INSERT INTO `ly_res_user` VALUES ('44', '1');
INSERT INTO `ly_res_user` VALUES ('45', '1');
INSERT INTO `ly_res_user` VALUES ('46', '1');
INSERT INTO `ly_res_user` VALUES ('47', '1');
INSERT INTO `ly_res_user` VALUES ('48', '1');
INSERT INTO `ly_res_user` VALUES ('49', '1');
INSERT INTO `ly_res_user` VALUES ('50', '1');
INSERT INTO `ly_res_user` VALUES ('51', '1');
INSERT INTO `ly_res_user` VALUES ('52', '1');
INSERT INTO `ly_res_user` VALUES ('53', '1');
INSERT INTO `ly_res_user` VALUES ('54', '1');
INSERT INTO `ly_res_user` VALUES ('55', '1');
INSERT INTO `ly_res_user` VALUES ('57', '1');
INSERT INTO `ly_res_user` VALUES ('58', '1');
INSERT INTO `ly_res_user` VALUES ('61', '1');
INSERT INTO `ly_res_user` VALUES ('62', '1');
INSERT INTO `ly_res_user` VALUES ('63', '1');
INSERT INTO `ly_res_user` VALUES ('64', '1');
INSERT INTO `ly_res_user` VALUES ('65', '1');
INSERT INTO `ly_res_user` VALUES ('66', '1');
INSERT INTO `ly_res_user` VALUES ('67', '1');
INSERT INTO `ly_res_user` VALUES ('68', '1');
INSERT INTO `ly_res_user` VALUES ('69', '1');
INSERT INTO `ly_res_user` VALUES ('71', '1');
INSERT INTO `ly_res_user` VALUES ('72', '1');
INSERT INTO `ly_res_user` VALUES ('77', '1');
INSERT INTO `ly_res_user` VALUES ('78', '1');
INSERT INTO `ly_res_user` VALUES ('79', '1');
INSERT INTO `ly_res_user` VALUES ('80', '1');
INSERT INTO `ly_res_user` VALUES ('81', '1');
INSERT INTO `ly_res_user` VALUES ('82', '1');
INSERT INTO `ly_res_user` VALUES ('83', '1');
INSERT INTO `ly_res_user` VALUES ('84', '1');
INSERT INTO `ly_res_user` VALUES ('85', '1');
INSERT INTO `ly_res_user` VALUES ('86', '1');
INSERT INTO `ly_res_user` VALUES ('87', '1');
INSERT INTO `ly_res_user` VALUES ('88', '1');
INSERT INTO `ly_res_user` VALUES ('89', '1');
INSERT INTO `ly_res_user` VALUES ('90', '1');
INSERT INTO `ly_res_user` VALUES ('91', '1');
INSERT INTO `ly_res_user` VALUES ('92', '1');
INSERT INTO `ly_res_user` VALUES ('93', '1');
INSERT INTO `ly_res_user` VALUES ('94', '1');
INSERT INTO `ly_res_user` VALUES ('95', '1');
INSERT INTO `ly_res_user` VALUES ('96', '1');
INSERT INTO `ly_res_user` VALUES ('97', '1');
INSERT INTO `ly_res_user` VALUES ('98', '1');
INSERT INTO `ly_res_user` VALUES ('99', '1');
INSERT INTO `ly_res_user` VALUES ('100', '1');
INSERT INTO `ly_res_user` VALUES ('101', '1');
INSERT INTO `ly_res_user` VALUES ('102', '1');
INSERT INTO `ly_res_user` VALUES ('103', '1');
INSERT INTO `ly_res_user` VALUES ('104', '1');
INSERT INTO `ly_res_user` VALUES ('105', '1');
INSERT INTO `ly_res_user` VALUES ('106', '1');
INSERT INTO `ly_res_user` VALUES ('107', '1');
INSERT INTO `ly_res_user` VALUES ('108', '1');
INSERT INTO `ly_res_user` VALUES ('109', '1');
INSERT INTO `ly_res_user` VALUES ('110', '1');
INSERT INTO `ly_res_user` VALUES ('112', '1');
INSERT INTO `ly_res_user` VALUES ('114', '1');
INSERT INTO `ly_res_user` VALUES ('115', '1');
INSERT INTO `ly_res_user` VALUES ('118', '1');
INSERT INTO `ly_res_user` VALUES ('119', '1');
INSERT INTO `ly_res_user` VALUES ('120', '1');
INSERT INTO `ly_res_user` VALUES ('121', '1');

-- ----------------------------
-- Table structure for ly_role
-- ----------------------------
DROP TABLE IF EXISTS `ly_role`;
CREATE TABLE `ly_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `state` varchar(3) DEFAULT NULL COMMENT '是否禁用0:禁用1:正常',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `roleKey` varchar(50) DEFAULT NULL COMMENT '关键字',
  `description` varchar(50) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_role
-- ----------------------------
INSERT INTO `ly_role` VALUES ('1', '1', '管理员', 'admin', '管理员');

-- ----------------------------
-- Table structure for ly_user
-- ----------------------------
DROP TABLE IF EXISTS `ly_user`;
CREATE TABLE `ly_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userName` varchar(20) DEFAULT NULL COMMENT '中文名称',
  `accountName` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `credentialsSalt` varchar(100) DEFAULT NULL COMMENT '关键字',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `locked` varchar(3) DEFAULT '1' COMMENT '是否禁用0:禁用1:正常',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `deletestatus` int(1) DEFAULT '0' COMMENT '逻辑删除状态0:存在1:删除',
  `headPic` varchar(100) DEFAULT NULL COMMENT '头像路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_user
-- ----------------------------
INSERT INTO `ly_user` VALUES ('1', '管理员', 'admin', '1130b91144fef6f80f5d338701f473a7', '66e6dc5bb11d4c31e826a46603f0f774', '3434', '1', '2017-04-24 09:01:09', '0', '1.jpg');

-- ----------------------------
-- Table structure for ly_userlogin
-- ----------------------------
DROP TABLE IF EXISTS `ly_userlogin`;
CREATE TABLE `ly_userlogin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` int(11) DEFAULT NULL COMMENT '用户主键',
  `accountName` varchar(20) DEFAULT NULL COMMENT '用户名',
  `loginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登陆时间',
  `loginIP` varchar(40) DEFAULT NULL COMMENT '登录地址',
  PRIMARY KEY (`id`),
  KEY `ly_user_loginlist` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=511 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_userlogin
-- ----------------------------
INSERT INTO `ly_userlogin` VALUES ('415', '1', 'admin', '2017-04-24 09:00:56', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('416', '1', 'admin', '2017-04-24 09:01:16', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('417', '1', 'admin', '2017-04-25 09:13:04', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('418', '1', 'admin', '2017-04-25 13:41:52', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('419', '1', 'admin', '2017-04-25 13:51:37', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('420', '1', 'admin', '2017-04-25 13:59:35', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('421', '1', 'admin', '2017-04-25 16:44:56', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('422', '1', 'admin', '2017-04-25 16:49:21', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('423', '1', 'admin', '2017-04-25 16:53:30', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('424', '1', 'admin', '2017-04-26 08:54:25', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('425', '1', 'admin', '2017-04-26 09:01:30', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('426', '1', 'admin', '2017-04-26 09:08:53', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('427', '1', 'admin', '2017-04-26 09:13:51', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('428', '1', 'admin', '2017-04-26 09:23:52', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('429', '1', 'admin', '2017-04-26 09:48:13', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('430', '1', 'admin', '2017-04-26 09:52:54', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('431', '1', 'admin', '2017-04-26 10:48:50', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('432', '1', 'admin', '2017-04-26 13:35:02', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('433', '1', 'admin', '2017-04-26 13:39:05', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('434', '1', 'admin', '2017-04-26 13:44:09', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('435', '1', 'admin', '2017-04-26 13:54:21', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('436', '1', 'admin', '2017-04-26 14:00:00', '192.168.1.98');
INSERT INTO `ly_userlogin` VALUES ('437', '1', 'admin', '2017-04-26 15:07:40', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('438', '1', 'admin', '2017-04-26 16:27:19', '192.168.1.98');
INSERT INTO `ly_userlogin` VALUES ('439', '1', 'admin', '2017-04-26 16:28:41', '192.168.1.98');
INSERT INTO `ly_userlogin` VALUES ('440', '1', 'admin', '2017-04-26 16:29:29', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('441', '1', 'admin', '2017-04-26 20:36:07', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('442', '1', 'admin', '2017-04-26 21:10:42', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('443', '1', 'admin', '2017-04-26 21:13:55', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('444', '1', 'admin', '2017-04-26 21:31:56', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('445', '1', 'admin', '2017-04-27 20:51:32', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('446', '1', 'admin', '2017-04-27 20:55:43', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('447', '1', 'admin', '2017-04-27 20:57:44', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('448', '1', 'admin', '2017-04-27 21:15:57', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('449', '1', 'admin', '2017-04-27 21:19:44', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('450', '1', 'admin', '2017-04-27 21:31:23', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('451', '1', 'admin', '2017-04-27 21:36:52', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('452', '1', 'admin', '2017-04-27 21:41:36', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('453', '1', 'admin', '2017-04-27 21:47:10', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('454', '1', 'admin', '2017-04-27 21:50:24', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('455', '1', 'admin', '2017-04-27 21:53:57', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('456', '1', 'admin', '2017-04-27 22:07:08', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('457', '1', 'admin', '2017-04-27 22:23:19', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('458', '1', 'admin', '2017-04-28 10:49:12', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('459', '1', 'admin', '2017-04-28 10:54:58', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('460', '1', 'admin', '2017-04-28 11:00:33', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('461', '1', 'admin', '2017-04-28 11:03:32', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('462', '1', 'admin', '2017-04-28 11:09:24', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('463', '1', 'admin', '2017-05-02 14:28:41', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('464', '1', 'admin', '2017-05-02 14:29:23', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('465', '1', 'admin', '2017-05-02 15:55:48', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('466', '1', 'admin', '2017-05-02 15:59:41', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('467', '1', 'admin', '2017-05-02 16:01:46', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('468', '1', 'admin', '2017-05-02 16:05:05', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('469', '1', 'admin', '2017-05-02 16:08:30', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('470', '1', 'admin', '2017-05-02 16:19:51', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('471', '1', 'admin', '2017-05-02 16:25:21', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('472', '1', 'admin', '2017-05-02 16:29:05', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('473', '1', 'admin', '2017-05-02 16:37:57', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('474', '1', 'admin', '2017-05-02 16:46:00', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('475', '1', 'admin', '2017-05-02 16:47:39', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('476', '1', 'admin', '2017-05-02 16:50:40', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('477', '1', 'admin', '2017-05-03 14:09:18', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('478', '1', 'admin', '2017-05-03 14:39:58', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('479', '1', 'admin', '2017-05-03 15:27:46', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('480', '1', 'admin', '2017-05-03 15:32:14', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('481', '1', 'admin', '2017-05-03 20:33:08', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('482', '1', 'admin', '2017-05-03 20:49:51', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('483', '1', 'admin', '2017-05-03 21:36:48', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('484', '1', 'admin', '2017-05-03 21:43:08', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('485', '1', 'admin', '2017-05-04 19:37:37', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('486', '1', 'admin', '2017-05-04 19:41:11', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('487', '1', 'admin', '2017-05-04 19:49:18', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('488', '1', 'admin', '2017-05-04 19:55:45', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('489', '1', 'admin', '2017-05-04 20:40:41', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('490', '1', 'admin', '2017-05-04 20:44:14', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('491', '1', 'admin', '2017-05-05 19:57:59', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('492', '1', 'admin', '2017-05-05 20:33:52', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('493', '1', 'admin', '2017-05-05 20:38:08', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('494', '1', 'admin', '2017-05-05 20:44:14', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('495', '1', 'admin', '2017-05-05 20:52:32', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('496', '1', 'admin', '2017-05-05 21:08:42', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('497', '1', 'admin', '2017-05-05 21:09:25', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('498', '1', 'admin', '2017-05-05 21:10:51', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('499', '1', 'admin', '2017-05-05 21:28:47', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('500', '1', 'admin', '2017-05-05 21:31:04', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('501', '1', 'admin', '2017-05-05 22:29:20', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('502', '1', 'admin', '2017-05-06 10:48:45', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('503', '1', 'admin', '2017-05-23 14:03:38', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('504', '1', 'admin', '2017-05-23 19:57:26', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('505', '1', 'admin', '2017-05-23 20:21:59', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('506', '1', 'admin', '2017-05-23 20:38:53', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('507', '1', 'admin', '2017-05-23 20:41:52', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('508', '1', 'admin', '2017-05-23 20:46:15', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('509', '1', 'admin', '2017-05-28 13:59:05', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('510', '1', 'admin', '2017-05-28 14:08:08', '127.0.0.1');

-- ----------------------------
-- Table structure for ly_user_role
-- ----------------------------
DROP TABLE IF EXISTS `ly_user_role`;
CREATE TABLE `ly_user_role` (
  `userId` int(11) NOT NULL COMMENT '用户主键',
  `roleId` int(11) NOT NULL COMMENT '角色主键',
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for tap_buy
-- ----------------------------
DROP TABLE IF EXISTS `tap_buy`;
CREATE TABLE `tap_buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `buyNo` varchar(50) DEFAULT NULL COMMENT '采购单号',
  `supplierId` int(11) DEFAULT NULL COMMENT '供应商主键',
  `material` varchar(50) DEFAULT NULL COMMENT '原材料',
  `count` varchar(255) DEFAULT NULL COMMENT '单位',
  `unit` varchar(255) DEFAULT NULL,
  `createDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '下单日期',
  `needDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '需交日期',
  `deliveryDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '交货日期',
  `inspectionDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '检验日期',
  `inStockDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '入库日期',
  `identification` varchar(255) DEFAULT NULL COMMENT '标识号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `person` varchar(255) DEFAULT NULL COMMENT '下单人员',
  `isFinish` varchar(10) DEFAULT '0' COMMENT '是否完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tap_buy
-- ----------------------------
INSERT INTO `tap_buy` VALUES ('5', 'B2017042896045', '2', '铁', '10', 'kg', '2017-04-28 10:52:37', '2017-04-28 00:00:00', '2017-04-28 00:00:00', '2017-04-28 00:00:00', '2017-04-28 00:00:00', '1', null, '我', '1');
INSERT INTO `tap_buy` VALUES ('6', 'B2017050320344016191189', '2', '', '', '', '2017-05-03 00:00:00', null, null, null, null, '', '', '', '0');

-- ----------------------------
-- Table structure for tap_customer
-- ----------------------------
DROP TABLE IF EXISTS `tap_customer`;
CREATE TABLE `tap_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `number` varchar(50) DEFAULT NULL COMMENT '客户编号',
  `name` varchar(20) DEFAULT NULL COMMENT '联系人姓名',
  `sex` varchar(2) DEFAULT NULL COMMENT '联系人性别',
  `telephone` varchar(11) DEFAULT NULL COMMENT '联系人手机号码',
  `email` varchar(50) DEFAULT NULL COMMENT '联系人邮箱',
  `qq` varchar(30) DEFAULT NULL COMMENT '联系人QQ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tap_customer
-- ----------------------------
INSERT INTO `tap_customer` VALUES ('12', '安力', 'ABC1', null, '0', null, null, null);
INSERT INTO `tap_customer` VALUES ('15', '的诗', 'ABC2', null, '0', null, null, null);

-- ----------------------------
-- Table structure for tap_fusion
-- ----------------------------
DROP TABLE IF EXISTS `tap_fusion`;
CREATE TABLE `tap_fusion` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `useId` int(11) DEFAULT NULL COMMENT '材料领用主键',
  `fusionNo` varchar(50) DEFAULT NULL COMMENT '熔炼编号',
  `person` varchar(255) DEFAULT NULL COMMENT '操作员',
  `rawId` varchar(50) DEFAULT NULL COMMENT '标识主键',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '录入日期',
  `result` varchar(10) DEFAULT NULL COMMENT '1铁2钢',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tap_fusion
-- ----------------------------
INSERT INTO `tap_fusion` VALUES ('4', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('5', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('6', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('7', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('8', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('9', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('10', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('11', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('12', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('13', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('14', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('15', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('16', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('17', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('18', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('19', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('20', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('21', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('22', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('23', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('24', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('25', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('26', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('27', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('28', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('29', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('30', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('31', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('32', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('33', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('34', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('35', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('36', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('37', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('38', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('39', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('40', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('41', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('42', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('43', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('44', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('45', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('46', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('47', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('48', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('49', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('50', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('51', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('52', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('53', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('54', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('55', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('56', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('57', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('58', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('59', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('60', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('61', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('62', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('63', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('64', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('65', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('66', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('67', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('68', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('69', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('70', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('71', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('72', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('73', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('74', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('75', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('76', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('77', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('78', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('79', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('80', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('81', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('82', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('83', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('84', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('85', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('86', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('87', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('88', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('89', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('90', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('91', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('92', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('93', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('94', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('95', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('96', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('97', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('98', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('99', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('100', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('101', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('102', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('103', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('104', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('105', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('106', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('107', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('108', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('109', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('110', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('111', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('112', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('113', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('114', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('115', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('116', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('117', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('118', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('119', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('120', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('121', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('122', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('123', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('124', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('125', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');
INSERT INTO `tap_fusion` VALUES ('126', '14', 'A705031', '我', 'da716139-b0ed-447a-aa20-23b09badad41', '2017-05-04 19:46:22', '1');
INSERT INTO `tap_fusion` VALUES ('127', '15', 'A705041', '哈哈', '1b6ce96f-76a2-4d22-b1f5-69b1847b283d', '2017-05-04 20:02:12', '1');

-- ----------------------------
-- Table structure for tap_fusion_material
-- ----------------------------
DROP TABLE IF EXISTS `tap_fusion_material`;
CREATE TABLE `tap_fusion_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rawId` varchar(50) DEFAULT NULL COMMENT '标识主键',
  `rawStockId` int(11) DEFAULT NULL COMMENT '材料主键',
  `count` varchar(255) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tap_fusion_material
-- ----------------------------
INSERT INTO `tap_fusion_material` VALUES ('12', '0c8d59b3-01fe-442a-92ae-9b86affad125', '1', '1');
INSERT INTO `tap_fusion_material` VALUES ('13', '0c8d59b3-01fe-442a-92ae-9b86affad125', '5', '1');
INSERT INTO `tap_fusion_material` VALUES ('14', 'da716139-b0ed-447a-aa20-23b09badad41', '5', '1');

-- ----------------------------
-- Table structure for tap_material
-- ----------------------------
DROP TABLE IF EXISTS `tap_material`;
CREATE TABLE `tap_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rawId` varchar(50) DEFAULT NULL COMMENT '标识主键',
  `rawStockId` int(11) DEFAULT NULL COMMENT '材料主键',
  `count` varchar(255) DEFAULT NULL COMMENT '数量',
  `overplus` varchar(255) DEFAULT NULL COMMENT '剩余数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tap_material
-- ----------------------------
INSERT INTO `tap_material` VALUES ('5', '1328e213-4c32-4f49-a4dc-f322792011f7', '5', '5', '5');
INSERT INTO `tap_material` VALUES ('6', '1328e213-4c32-4f49-a4dc-f322792011f7', '1', '2', '2');
INSERT INTO `tap_material` VALUES ('7', '1328e213-4c32-4f49-a4dc-f322792011f7', '4', '1', '1');
INSERT INTO `tap_material` VALUES ('8', '33a9a4b1-bfbc-489a-a72a-b97a3cf283d9', '1', '2', '2');
INSERT INTO `tap_material` VALUES ('9', '33a9a4b1-bfbc-489a-a72a-b97a3cf283d9', '5', '2', '2');
INSERT INTO `tap_material` VALUES ('10', '33a9a4b1-bfbc-489a-a72a-b97a3cf283d9', '4', '4', '4');
INSERT INTO `tap_material` VALUES ('11', 'ebc2ad21-8309-407a-87ad-d9e1be928a90', '5', '5', '1');
INSERT INTO `tap_material` VALUES ('12', 'ebc2ad21-8309-407a-87ad-d9e1be928a90', '1', '3', '0');

-- ----------------------------
-- Table structure for tap_mould_stock
-- ----------------------------
DROP TABLE IF EXISTS `tap_mould_stock`;
CREATE TABLE `tap_mould_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `productId` int(11) DEFAULT NULL COMMENT '产品主键',
  `stock` int(11) DEFAULT NULL COMMENT '库存数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tap_mould_stock
-- ----------------------------
INSERT INTO `tap_mould_stock` VALUES ('1', '1', '11');
INSERT INTO `tap_mould_stock` VALUES ('2', '2', '2');

-- ----------------------------
-- Table structure for tap_order
-- ----------------------------
DROP TABLE IF EXISTS `tap_order`;
CREATE TABLE `tap_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '订单生成日期',
  `orderNumber` varchar(50) DEFAULT NULL COMMENT '订单单号',
  `customerId` varchar(32) DEFAULT NULL COMMENT '客户主键',
  `orderNatureId` varchar(32) DEFAULT NULL COMMENT '订单性质主键',
  `money` varchar(100) DEFAULT NULL COMMENT '采购金额（元）',
  `currency` varchar(10) DEFAULT NULL COMMENT '币种',
  `tax` varchar(10) DEFAULT NULL COMMENT '税额',
  `cess` varchar(100) DEFAULT NULL COMMENT '税率',
  `way` varchar(50) DEFAULT NULL COMMENT '交易方式',
  `signStatus` varchar(2) DEFAULT NULL COMMENT '回签状态',
  `signDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '回签日期',
  `count` varchar(100) DEFAULT NULL COMMENT '数量合计',
  `single` varchar(100) DEFAULT NULL COMMENT '下单人员',
  `orderNumberIN` varchar(200) DEFAULT NULL COMMENT '内部订单编号',
  `receiveDate` timestamp NULL DEFAULT NULL COMMENT '接单日期',
  `isFinish` varchar(10) DEFAULT '0' COMMENT '是否完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tap_order
-- ----------------------------
INSERT INTO `tap_order` VALUES ('1', '2017-05-23 20:04:04', '1111', '12', null, '', '', '', '', '', '0', '2017-05-23 20:04:04', '', '管理员', 'ABC2017042738460', '2017-04-27 00:00:00', '1');
INSERT INTO `tap_order` VALUES ('2', '2017-05-23 20:52:59', '1111', '12', null, '', '', '', '', '', '0', null, '', '管理员', 'ABC2017052320525852491220', '2017-05-23 00:00:00', '0');

-- ----------------------------
-- Table structure for tap_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `tap_order_detail`;
CREATE TABLE `tap_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderId` int(11) DEFAULT NULL COMMENT '订单主键',
  `productId` int(11) DEFAULT NULL COMMENT '产品主键',
  `total` varchar(50) DEFAULT NULL COMMENT '需求总数',
  `deliveryDate` timestamp NULL DEFAULT NULL COMMENT '交货期',
  `relDeliveryDate` timestamp NULL DEFAULT NULL COMMENT '实际交货期',
  `isBack` varchar(10) DEFAULT NULL COMMENT '是否补退，0补退 1不补退',
  `isFinish` varchar(10) DEFAULT '0' COMMENT '是否完成0未完成1已完成',
  `inspection` int(20) DEFAULT '0' COMMENT '送检总数',
  `accBack` int(20) DEFAULT '0' COMMENT '验退总数',
  `inStock` int(20) DEFAULT '0' COMMENT '入库总数',
  `outStock` int(20) DEFAULT '0' COMMENT '出库总数',
  `owe` int(20) DEFAULT '0' COMMENT '欠货总数',
  `back` int(20) DEFAULT '0' COMMENT '退货总数',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tap_order_detail
-- ----------------------------
INSERT INTO `tap_order_detail` VALUES ('1', '1', '1', '10', '2017-04-27 00:00:00', '2017-04-27 00:00:00', '1', '1', '10', '0', '10', '10', '0', '0', null);
INSERT INTO `tap_order_detail` VALUES ('2', '2', '1', '10', '2017-05-23 00:00:00', '2017-05-23 00:00:00', '1', '0', '0', '0', '0', '0', '0', '0', null);

-- ----------------------------
-- Table structure for tap_order_detail_status
-- ----------------------------
DROP TABLE IF EXISTS `tap_order_detail_status`;
CREATE TABLE `tap_order_detail_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderDetailId` int(11) DEFAULT NULL COMMENT '订单详情主键',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '日期',
  `inspection` varchar(50) DEFAULT NULL COMMENT '送检数量',
  `accBack` varchar(50) DEFAULT NULL COMMENT '验退数量',
  `inStock` varchar(50) DEFAULT NULL COMMENT '入库数量',
  `outStock` varchar(50) DEFAULT NULL COMMENT '出库数量（送货数）',
  `back` varchar(50) DEFAULT NULL COMMENT '退货数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tap_order_detail_status
-- ----------------------------
INSERT INTO `tap_order_detail_status` VALUES ('1', '1', '2017-05-23 00:00:00', '10', '0', '10', '10', '0');

-- ----------------------------
-- Table structure for tap_order_nature
-- ----------------------------
DROP TABLE IF EXISTS `tap_order_nature`;
CREATE TABLE `tap_order_nature` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nature` varchar(100) DEFAULT NULL COMMENT '订单性质',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tap_order_nature
-- ----------------------------

-- ----------------------------
-- Table structure for tap_plan
-- ----------------------------
DROP TABLE IF EXISTS `tap_plan`;
CREATE TABLE `tap_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `planNo` varchar(50) DEFAULT NULL COMMENT '生产计划编号',
  `productId` int(11) DEFAULT NULL COMMENT '产品主键',
  `count` varchar(255) DEFAULT NULL COMMENT '数量',
  `needDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '需交日期',
  `model` int(20) DEFAULT NULL COMMENT '造型',
  `box` int(20) DEFAULT NULL COMMENT '配箱',
  `bell` int(20) DEFAULT NULL COMMENT '浇注',
  `openBox` int(20) DEFAULT NULL COMMENT '开箱',
  `polish` int(20) DEFAULT NULL COMMENT '打磨',
  `hot` int(20) DEFAULT NULL COMMENT '热处理',
  `sand` int(20) DEFAULT NULL COMMENT '抛沙',
  `inspection` int(20) DEFAULT NULL COMMENT '送检',
  `back` int(20) DEFAULT NULL COMMENT '验退',
  `inStock` int(20) DEFAULT NULL COMMENT '入库',
  `reject` int(20) DEFAULT NULL COMMENT '报废',
  `owe` int(20) DEFAULT NULL COMMENT '欠货',
  `isFinish` varchar(255) DEFAULT NULL COMMENT '是否完成0未完成1已完成2超额完成',
  `customerId` int(11) DEFAULT NULL COMMENT '委铸单位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tap_plan
-- ----------------------------
INSERT INTO `tap_plan` VALUES ('12', 'P2017050522293566766124', '1', '10', '2017-05-05 22:44:01', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '7', '8', '0', '12');
INSERT INTO `tap_plan` VALUES ('13', 'P2017050522424718364030', '2', '10', '2017-05-05 22:44:48', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '7', '8', '0', '15');

-- ----------------------------
-- Table structure for tap_plan_detail
-- ----------------------------
DROP TABLE IF EXISTS `tap_plan_detail`;
CREATE TABLE `tap_plan_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `planId` int(11) DEFAULT NULL COMMENT '生产计划主键',
  `startDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '开始日期',
  `endDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '结束日期',
  `count` varchar(255) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tap_plan_detail
-- ----------------------------
INSERT INTO `tap_plan_detail` VALUES ('8', '13', '2017-05-01 00:00:00', '2017-05-02 00:00:00', '3');
INSERT INTO `tap_plan_detail` VALUES ('9', '13', '2017-05-03 00:00:00', '2017-05-05 00:00:00', '2');

-- ----------------------------
-- Table structure for tap_plan_detail_status
-- ----------------------------
DROP TABLE IF EXISTS `tap_plan_detail_status`;
CREATE TABLE `tap_plan_detail_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `planNo` varchar(50) DEFAULT NULL COMMENT '编号',
  `planId` int(11) DEFAULT NULL COMMENT '生产计划主键',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '录入日期',
  `model` int(20) DEFAULT NULL COMMENT '造型',
  `box` int(20) DEFAULT NULL COMMENT '配箱',
  `bell` int(20) DEFAULT NULL COMMENT '浇注',
  `openBox` int(20) DEFAULT NULL COMMENT '开箱',
  `polish` int(20) DEFAULT NULL COMMENT '打磨',
  `hot` int(20) DEFAULT NULL COMMENT '热处理',
  `sand` int(20) DEFAULT NULL COMMENT '抛沙',
  `modelReject` int(20) DEFAULT NULL COMMENT '造型报废',
  `boxReject` int(20) DEFAULT NULL COMMENT '配箱报废',
  `bellReject` int(20) DEFAULT NULL COMMENT '浇注报废',
  `openBoxReject` int(20) DEFAULT NULL COMMENT '开箱报废',
  `polishReject` int(20) DEFAULT NULL COMMENT '打磨报废',
  `hotReject` int(20) DEFAULT NULL COMMENT '热处理报废',
  `sandReject` int(20) DEFAULT NULL COMMENT '抛沙报废',
  `inspection` int(20) DEFAULT NULL COMMENT '送检',
  `back` int(20) DEFAULT NULL COMMENT '验退',
  `inStock` int(20) DEFAULT NULL COMMENT '入库',
  `fusionId` int(11) DEFAULT NULL COMMENT '炉号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tap_plan_detail_status
-- ----------------------------
INSERT INTO `tap_plan_detail_status` VALUES ('5', 'P2017050522293566766124', '12', '2017-05-05 00:00:00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '14');
INSERT INTO `tap_plan_detail_status` VALUES ('6', 'P2017050522424718364030', '13', '2017-05-05 00:00:00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '5');
INSERT INTO `tap_plan_detail_status` VALUES ('7', 'P2017050522293566766124', '12', '2017-05-06 00:00:00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '5');
INSERT INTO `tap_plan_detail_status` VALUES ('8', 'P2017050522424718364030', '13', '2017-05-06 00:00:00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '4');

-- ----------------------------
-- Table structure for tap_product
-- ----------------------------
DROP TABLE IF EXISTS `tap_product`;
CREATE TABLE `tap_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `productPicNo` varchar(20) DEFAULT NULL COMMENT '图号',
  `productName` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `productWeight` varchar(10) DEFAULT NULL COMMENT '产品单重',
  `productMaterial` varchar(50) DEFAULT NULL COMMENT '产品材质',
  `productUnit` varchar(50) DEFAULT 'KG' COMMENT '产品单位',
  `productPrice` varchar(50) DEFAULT NULL COMMENT '产品单价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tap_product
-- ----------------------------
INSERT INTO `tap_product` VALUES ('1', '11111', '阀体1', '1', 'QT450', 'KG', '10');
INSERT INTO `tap_product` VALUES ('2', '22222', '阀盖2', null, 'QT460', 'KG', null);
INSERT INTO `tap_product` VALUES ('3', '33333', '阀体3', '', 'QT450', 'KG', '');
INSERT INTO `tap_product` VALUES ('4', '44444', '阀盖4', '', 'QT460', 'KG', '');
INSERT INTO `tap_product` VALUES ('5', '55555', '阀体5', '', 'QT450', 'KG', '');
INSERT INTO `tap_product` VALUES ('6', '66666', '阀盖6', '', 'QT460', 'KG', '');

-- ----------------------------
-- Table structure for tap_raw_stock
-- ----------------------------
DROP TABLE IF EXISTS `tap_raw_stock`;
CREATE TABLE `tap_raw_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `count` varchar(255) DEFAULT NULL COMMENT '数量',
  `unit` varchar(255) DEFAULT NULL COMMENT '单位',
  `identification` varchar(255) DEFAULT NULL COMMENT '标识号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tap_raw_stock
-- ----------------------------
INSERT INTO `tap_raw_stock` VALUES ('1', '铁', '12', 'kg', '1');
INSERT INTO `tap_raw_stock` VALUES ('4', '铜', '13', 'kg', '2');
INSERT INTO `tap_raw_stock` VALUES ('5', '钢', '3', 'kg', '3');

-- ----------------------------
-- Table structure for tap_stock
-- ----------------------------
DROP TABLE IF EXISTS `tap_stock`;
CREATE TABLE `tap_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `productId` int(11) DEFAULT NULL COMMENT '产品主键',
  `stock` int(11) DEFAULT NULL COMMENT '库存数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tap_stock
-- ----------------------------
INSERT INTO `tap_stock` VALUES ('1', '1', '10');
INSERT INTO `tap_stock` VALUES ('2', '2', '10');

-- ----------------------------
-- Table structure for tap_supplier
-- ----------------------------
DROP TABLE IF EXISTS `tap_supplier`;
CREATE TABLE `tap_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company` varchar(100) DEFAULT NULL COMMENT '供应商名称',
  `number` varchar(50) DEFAULT NULL COMMENT '供应商编号',
  `product` varchar(255) DEFAULT NULL COMMENT '供应产品',
  `name` varchar(20) DEFAULT NULL COMMENT '联系人姓名',
  `sex` varchar(2) DEFAULT NULL COMMENT '联系人性别',
  `telephone` varchar(11) DEFAULT NULL COMMENT '联系人手机号码',
  `email` varchar(50) DEFAULT NULL COMMENT '联系人邮箱',
  `invoice` varchar(50) DEFAULT NULL COMMENT '开票资料',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tap_supplier
-- ----------------------------
INSERT INTO `tap_supplier` VALUES ('1', '哈哈', 'A123', 'A，B', null, '0', null, null, null);
INSERT INTO `tap_supplier` VALUES ('2', '呵呵', 'B123', null, null, '0', null, null, null);

-- ----------------------------
-- Table structure for tap_use
-- ----------------------------
DROP TABLE IF EXISTS `tap_use`;
CREATE TABLE `tap_use` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rawId` varchar(50) DEFAULT NULL COMMENT '标识主键',
  `useNo` varchar(255) DEFAULT NULL COMMENT '领用单号',
  `person` varchar(255) DEFAULT NULL COMMENT '领用人',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '领用日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tap_use
-- ----------------------------
INSERT INTO `tap_use` VALUES ('14', 'ebc2ad21-8309-407a-87ad-d9e1be928a90', 'U2017050320353770227152', 'QQ', '2017-05-03 20:35:38');
INSERT INTO `tap_use` VALUES ('15', '71464ef6-894b-4aa1-8ea0-d25aeed90ca9', 'U2017050419433994835694', '我', '2017-05-04 19:43:40');
