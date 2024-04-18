/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:3306
 Source Schema         : message-board

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 27/04/2022 10:10:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(20) NOT NULL,
  `SCHED_TIME` bigint(20) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL COMMENT '任务名称',
  `JOB_GROUP` varchar(200) NOT NULL COMMENT '任务分组',
  `DESCRIPTION` varchar(250) DEFAULT NULL COMMENT '任务描述',
  `JOB_CLASS_NAME` varchar(250) NOT NULL COMMENT '执行类',
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(20) NOT NULL,
  `CHECKIN_INTERVAL` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(20) NOT NULL,
  `REPEAT_INTERVAL` bigint(20) NOT NULL,
  `TIMES_TRIGGERED` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(20) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(20) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(20) NOT NULL,
  `END_TIME` bigint(20) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(6) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_generator
-- ----------------------------
DROP TABLE IF EXISTS `sys_generator`;
CREATE TABLE `sys_generator` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(80) DEFAULT NULL COMMENT '模块名称',
  `table_name` varchar(80) DEFAULT NULL COMMENT '表名称',
  `ignore_flag` int(11) DEFAULT NULL COMMENT '是否忽略前缀1：是',
  `ignore_prefix` varchar(20) DEFAULT NULL COMMENT '前缀',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_generator
-- ----------------------------
BEGIN;
INSERT INTO `sys_generator` VALUES (22, 'test', 't_test', 1, 't_', '2021-01-27 22:37:22', '2021-01-21 15:17:39');
INSERT INTO `sys_generator` VALUES (25, 'operlog', 'sys_oper_log', 0, '', '2021-01-29 20:42:49', '2021-01-29 20:42:49');
INSERT INTO `sys_generator` VALUES (27, 'testQuestions', 't_test_questions', 1, 't_', '2022-04-14 09:19:36', '2022-04-14 09:19:36');
INSERT INTO `sys_generator` VALUES (28, 'userScore', 't_user_score', 1, 't_', '2022-04-14 09:19:56', '2022-04-14 09:19:56');
INSERT INTO `sys_generator` VALUES (29, 'userQuestionsLog', 't_user_questions_log', 1, 't_', '2022-04-14 16:05:28', '2022-04-14 16:05:28');
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `operation` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '操作',
  `business_type` varchar(20) DEFAULT '0' COMMENT '业务类型',
  `method` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '方法名称',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  `oper_name` varchar(80) DEFAULT '' COMMENT '操作用户',
  `params` text COMMENT '参数',
  `ip` varchar(80) DEFAULT '' COMMENT '请求的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 CHECKSUM=1 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` VALUES (1, '查询列表', 'LIST', 'tech.niua.auth.controller.RoleController.index', '2022-04-27 10:01:22', 'admin', '[{\"id\":null,\"available\":null,\"description\":null,\"name\":\"\",\"resources\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (2, '添加或编辑操作', 'INSERTORUPDATE', 'tech.niua.auth.controller.RoleController.saveOrUpdate', '2022-04-27 10:01:29', 'admin', '[{\"id\":0,\"available\":true,\"description\":\"\",\"name\":\"超级管理员\",\"resources\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (3, '查询列表', 'LIST', 'tech.niua.auth.controller.RoleController.index', '2022-04-27 10:01:30', 'admin', '[{\"id\":null,\"available\":null,\"description\":null,\"name\":\"\",\"resources\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (4, '更新角色权限', 'UPDATE', 'tech.niua.auth.controller.RoleController.updateRoleResources', '2022-04-27 10:01:35', 'admin', '[2,[275,1,276,277,278,279,285,286,287,288,289,290,291,292,298,299,300,301,302,303,304,305,306,307,308,2,293,294,295,296,297,5,8,11,14,150,3,6,9,10,13,4,7,12,16]]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (5, '查询列表', 'LIST', 'tech.niua.auth.controller.RoleController.index', '2022-04-27 10:01:35', 'admin', '[{\"id\":null,\"available\":null,\"description\":null,\"name\":\"\",\"resources\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (6, '查询列表', 'LIST', 'tech.niua.auth.controller.ResourceController.listResources', '2022-04-27 10:01:55', 'admin', '[{\"id\":null,\"name\":\"\",\"orderNum\":null,\"permission\":null,\"type\":null,\"url\":null,\"parentId\":1,\"available\":null,\"childResources\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (7, '删除操作', 'DELETE', 'tech.niua.auth.controller.ResourceController.delete', '2022-04-27 10:02:05', 'admin', '[[276]]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (8, '更新角色权限', 'UPDATE', 'tech.niua.auth.controller.RoleController.updateRoleResources', '2022-04-27 10:02:13', 'admin', '[1,[285,1,286,287,288,289,290,291,292,298,299,300,301,302,303,304,305,306,307,308,2,293,294,295,296,297,5,8,11,14,150,3,6,9,10,13,4,7,12,16]]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (9, '查询列表', 'LIST', 'tech.niua.auth.controller.RoleController.index', '2022-04-27 10:02:13', 'admin', '[{\"id\":null,\"available\":null,\"description\":null,\"name\":\"\",\"resources\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (10, '更新角色权限', 'UPDATE', 'tech.niua.auth.controller.RoleController.updateRoleResources', '2022-04-27 10:02:17', 'admin', '[2,[285,1,286,287,288,289,290,291,292,298,299,300,301,302,303,304,305,306,307,308,2,293,294,295,296,297,5,8,11,14,150,3,6,9,10,13,4,7,12,16]]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (11, '查询列表', 'LIST', 'tech.niua.auth.controller.RoleController.index', '2022-04-27 10:02:17', 'admin', '[{\"id\":null,\"available\":null,\"description\":null,\"name\":\"\",\"resources\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (12, '删除操作', 'DELETE', 'tech.niua.auth.controller.ResourceController.delete', '2022-04-27 10:02:22', 'admin', '[[276]]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (13, '查询列表', 'LIST', 'tech.niua.auth.controller.ResourceController.listResources', '2022-04-27 10:02:23', 'admin', '[{\"id\":null,\"name\":\"\",\"orderNum\":null,\"permission\":null,\"type\":null,\"url\":null,\"parentId\":1,\"available\":null,\"childResources\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (14, '删除操作', 'DELETE', 'tech.niua.auth.controller.ResourceController.delete', '2022-04-27 10:02:24', 'admin', '[[277]]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (15, '查询列表', 'LIST', 'tech.niua.auth.controller.ResourceController.listResources', '2022-04-27 10:02:25', 'admin', '[{\"id\":null,\"name\":\"\",\"orderNum\":null,\"permission\":null,\"type\":null,\"url\":null,\"parentId\":1,\"available\":null,\"childResources\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (16, '删除操作', 'DELETE', 'tech.niua.auth.controller.ResourceController.delete', '2022-04-27 10:02:26', 'admin', '[[278]]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (17, '查询列表', 'LIST', 'tech.niua.auth.controller.ResourceController.listResources', '2022-04-27 10:02:26', 'admin', '[{\"id\":null,\"name\":\"\",\"orderNum\":null,\"permission\":null,\"type\":null,\"url\":null,\"parentId\":1,\"available\":null,\"childResources\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (18, '删除操作', 'DELETE', 'tech.niua.auth.controller.ResourceController.delete', '2022-04-27 10:02:27', 'admin', '[[279]]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (19, '查询列表', 'LIST', 'tech.niua.auth.controller.ResourceController.listResources', '2022-04-27 10:02:27', 'admin', '[{\"id\":null,\"name\":\"\",\"orderNum\":null,\"permission\":null,\"type\":null,\"url\":null,\"parentId\":1,\"available\":null,\"childResources\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (20, '删除操作', 'DELETE', 'tech.niua.auth.controller.ResourceController.delete', '2022-04-27 10:02:29', 'admin', '[[275]]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (21, '查询列表', 'LIST', 'tech.niua.auth.controller.ResourceController.listResources', '2022-04-27 10:02:29', 'admin', '[{\"id\":null,\"name\":\"\",\"orderNum\":null,\"permission\":null,\"type\":null,\"url\":null,\"parentId\":1,\"available\":null,\"childResources\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (22, '更新角色权限', 'UPDATE', 'tech.niua.auth.controller.RoleController.updateRoleResources', '2022-04-27 10:02:43', 'admin', '[1,[285,1,286,287,288,289,290,291,292,298,299,300,301,302,303,2,293,294,295,296,297,5,8,11,14,150,3,6,9,10,13,4,7,12,16]]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (23, '查询列表', 'LIST', 'tech.niua.auth.controller.RoleController.index', '2022-04-27 10:02:43', 'admin', '[{\"id\":null,\"available\":null,\"description\":null,\"name\":\"\",\"resources\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (24, '更新角色权限', 'UPDATE', 'tech.niua.auth.controller.RoleController.updateRoleResources', '2022-04-27 10:02:51', 'admin', '[2,[285,1,286,287,288,289,290,291,292,298,299,300,301,302,303,2,293,294,295,296,297,5,8,11,14,150,3,6,9,10,13,4,7,12,16]]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (25, '查询列表', 'LIST', 'tech.niua.auth.controller.RoleController.index', '2022-04-27 10:02:51', 'admin', '[{\"id\":null,\"available\":null,\"description\":null,\"name\":\"\",\"resources\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (26, '删除操作', 'DELETE', 'tech.niua.auth.controller.ResourceController.delete', '2022-04-27 10:02:58', 'admin', '[[305]]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (27, '查询列表', 'LIST', 'tech.niua.auth.controller.ResourceController.listResources', '2022-04-27 10:02:58', 'admin', '[{\"id\":null,\"name\":\"\",\"orderNum\":null,\"permission\":null,\"type\":null,\"url\":null,\"parentId\":1,\"available\":null,\"childResources\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (28, '删除操作', 'DELETE', 'tech.niua.auth.controller.ResourceController.delete', '2022-04-27 10:02:59', 'admin', '[[306]]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (29, '查询列表', 'LIST', 'tech.niua.auth.controller.ResourceController.listResources', '2022-04-27 10:02:59', 'admin', '[{\"id\":null,\"name\":\"\",\"orderNum\":null,\"permission\":null,\"type\":null,\"url\":null,\"parentId\":1,\"available\":null,\"childResources\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (30, '删除操作', 'DELETE', 'tech.niua.auth.controller.ResourceController.delete', '2022-04-27 10:03:00', 'admin', '[[307]]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (31, '查询列表', 'LIST', 'tech.niua.auth.controller.ResourceController.listResources', '2022-04-27 10:03:00', 'admin', '[{\"id\":null,\"name\":\"\",\"orderNum\":null,\"permission\":null,\"type\":null,\"url\":null,\"parentId\":1,\"available\":null,\"childResources\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (32, '删除操作', 'DELETE', 'tech.niua.auth.controller.ResourceController.delete', '2022-04-27 10:03:01', 'admin', '[[308]]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (33, '查询列表', 'LIST', 'tech.niua.auth.controller.ResourceController.listResources', '2022-04-27 10:03:01', 'admin', '[{\"id\":null,\"name\":\"\",\"orderNum\":null,\"permission\":null,\"type\":null,\"url\":null,\"parentId\":1,\"available\":null,\"childResources\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (34, '删除操作', 'DELETE', 'tech.niua.auth.controller.ResourceController.delete', '2022-04-27 10:03:03', 'admin', '[[304]]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (35, '查询列表', 'LIST', 'tech.niua.auth.controller.ResourceController.listResources', '2022-04-27 10:03:03', 'admin', '[{\"id\":null,\"name\":\"\",\"orderNum\":null,\"permission\":null,\"type\":null,\"url\":null,\"parentId\":1,\"available\":null,\"childResources\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (36, '添加或者编辑操作', 'INSERTORUPDATE', 'tech.niua.auth.controller.ResourceController.saveOrUpdate', '2022-04-27 10:03:28', 'admin', '[{\"id\":2,\"name\":\"权限配置\",\"orderNum\":8,\"permission\":\"/permissions\",\"type\":0,\"url\":\"\",\"parentId\":1,\"available\":true,\"childResources\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (37, '查询列表', 'LIST', 'tech.niua.auth.controller.ResourceController.listResources', '2022-04-27 10:03:28', 'admin', '[{\"id\":null,\"name\":\"\",\"orderNum\":null,\"permission\":null,\"type\":null,\"url\":null,\"parentId\":1,\"available\":null,\"childResources\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (38, '查询列表', 'LIST', 'tech.niua.auth.controller.ResourceController.listResources', '2022-04-27 10:03:47', 'admin', '[{\"id\":null,\"name\":\"\",\"orderNum\":null,\"permission\":null,\"type\":null,\"url\":null,\"parentId\":1,\"available\":null,\"childResources\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (39, '查询列表', 'LIST', 'tech.niua.auth.controller.ResourceController.listResources', '2022-04-27 10:03:49', 'admin', '[{\"id\":null,\"name\":\"\",\"orderNum\":null,\"permission\":null,\"type\":null,\"url\":null,\"parentId\":1,\"available\":null,\"childResources\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (40, '查询列表', 'LIST', 'tech.niua.auth.controller.RoleController.index', '2022-04-27 10:08:51', 'admin', '[{\"id\":null,\"available\":null,\"description\":null,\"name\":\"\",\"resources\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (41, '查询列表', 'LIST', 'tech.niua.auth.controller.ResourceController.listResources', '2022-04-27 10:09:00', 'admin', '[{\"id\":null,\"name\":\"\",\"orderNum\":null,\"permission\":null,\"type\":null,\"url\":null,\"parentId\":1,\"available\":null,\"childResources\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (42, '列表查询', 'LIST', 'tech.niua.auth.controller.UserController.index', '2022-04-27 10:09:02', 'admin', '[{\"id\":null,\"username\":\"\",\"password\":null,\"available\":null,\"sexType\":0,\"email\":null,\"tel\":null,\"createTime\":null,\"updateTime\":null,\"roles\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (43, '代码生成列表', 'LIST', 'tech.niua.gen.controller.GeneratorController.pageListQuery', '2022-04-27 10:09:06', 'admin', '[{\"id\":null,\"moduleName\":null,\"tableName\":\"\",\"ignoreFlag\":0,\"ignorePrefix\":null,\"createTime\":null,\"updateTime\":null},1,10]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (44, '添加或编辑操作', 'INSERTORUPDATE', 'tech.niua.auth.controller.RoleController.saveOrUpdate', '2022-04-27 10:09:39', 'admin', '[{\"id\":0,\"available\":true,\"description\":\"\",\"name\":\"单位管理员\",\"resources\":null}]', '127.0.0.1');
INSERT INTO `sys_oper_log` VALUES (45, '查询列表', 'LIST', 'tech.niua.auth.controller.RoleController.index', '2022-04-27 10:09:39', 'admin', '[{\"id\":null,\"available\":null,\"description\":null,\"name\":\"\",\"resources\":null},1,10]', '127.0.0.1');
COMMIT;

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `available` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmeds2u6ae5usj0ko0bqj3k0eo` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `available` bit(1) DEFAULT b'1',
  `name` varchar(255) DEFAULT NULL,
  `order_num` int(11) NOT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3fekum3ead5klp7y4lckn5ohi` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
BEGIN;
INSERT INTO `sys_resource` VALUES (1, b'1', '顶级栏目', 100, '/', 0, NULL, 0);
INSERT INTO `sys_resource` VALUES (2, b'1', '权限配置', 8, '/permissions', 0, '', 1);
INSERT INTO `sys_resource` VALUES (3, b'1', '角色管理', 102, '/role', 0, '/role', 2);
INSERT INTO `sys_resource` VALUES (4, b'1', '权限管理', 103, '/resource', 0, '/resource', 2);
INSERT INTO `sys_resource` VALUES (5, b'1', '用户管理', 101, '/user', 0, '/user', 2);
INSERT INTO `sys_resource` VALUES (6, b'1', '编辑', 100, '/role/editor-role', 1, '/role/editor-role', 3);
INSERT INTO `sys_resource` VALUES (7, b'1', '添加权限节点', 100, '/resource/add-permission', 1, '/resource/add-permission', 4);
INSERT INTO `sys_resource` VALUES (8, b'1', '添加管理员', 100, '/user/saveOrUpdate', 1, '/user/saveOrUpdate', 5);
INSERT INTO `sys_resource` VALUES (9, b'1', '添加角色', 100, '/role/add-role', 1, '/role/add-role', 3);
INSERT INTO `sys_resource` VALUES (10, b'1', '删除角色', 100, '/role/delete', 1, '/role/delete', 3);
INSERT INTO `sys_resource` VALUES (11, b'1', '删除用户', 100, '/user/delete', 1, '', 5);
INSERT INTO `sys_resource` VALUES (12, b'1', '删除权限', 100, '/resource/delete', 1, '/resource/delete', 4);
INSERT INTO `sys_resource` VALUES (13, b'1', '启用', 100, '/user/available-user', 1, '/user/available-user', 3);
INSERT INTO `sys_resource` VALUES (14, b'1', '修改管理员密码', 100, '/user/modify-password', 1, '/user/modify-password', 5);
INSERT INTO `sys_resource` VALUES (16, b'1', '权限编辑', 100, '/resource/saveOrUpdate', 1, '/resource/saveOrUpdate', 4);
INSERT INTO `sys_resource` VALUES (150, b'1', '编辑管理员信息', 100, '/user/edit-user', 1, '/user/edit-user', 5);
INSERT INTO `sys_resource` VALUES (285, b'1', '定时任务管理', 1, '/quartz', 0, '', 1);
INSERT INTO `sys_resource` VALUES (286, b'1', '查看', 1, '/quartz', 1, '', 285);
INSERT INTO `sys_resource` VALUES (287, b'1', '保存', 1, '/quartz/add', 1, '', 285);
INSERT INTO `sys_resource` VALUES (288, b'1', '删除权限', 1, '/quartz/delete', 1, '', 285);
INSERT INTO `sys_resource` VALUES (289, b'1', '导出权限', 1, '/quartz/export', 1, '', 285);
INSERT INTO `sys_resource` VALUES (290, b'1', '暂停', 1, '/quartz/pause', 1, '', 285);
INSERT INTO `sys_resource` VALUES (291, b'1', '恢复任务', 1, '/quartz/resume', 1, '', 285);
INSERT INTO `sys_resource` VALUES (292, b'1', '执行任务', 1, '/quartz/trigger', 1, '', 285);
INSERT INTO `sys_resource` VALUES (293, b'1', '操作日志', 1, '/sysOperLog', 0, '', 2);
INSERT INTO `sys_resource` VALUES (294, b'1', '查看', 1, '/sysOperLog', 1, '', 293);
INSERT INTO `sys_resource` VALUES (295, b'1', '保存和编辑权限', 1, '/sysOperLog/saveOrUpdate', 1, '', 293);
INSERT INTO `sys_resource` VALUES (296, b'1', '删除权限', 1, '/sysOperLog/delete', 1, '', 293);
INSERT INTO `sys_resource` VALUES (297, b'1', '导出权限', 1, '/sysOperLog/export', 1, '', 293);
INSERT INTO `sys_resource` VALUES (298, b'1', '代码生成', 1, '/generator', 0, '', 1);
INSERT INTO `sys_resource` VALUES (299, b'1', '查看', 1, '/generator', 1, '', 298);
INSERT INTO `sys_resource` VALUES (300, b'1', '保存和编辑权限', 1, '/generator/saveOrUpdate', 1, '', 298);
INSERT INTO `sys_resource` VALUES (301, b'1', '删除权限', 1, '/generator/delete', 1, '', 298);
INSERT INTO `sys_resource` VALUES (302, b'1', '导出权限', 1, '/generator/export', 1, '', 298);
INSERT INTO `sys_resource` VALUES (303, b'1', '生成代码', 1, '/generator/autoGenerator', 1, '', 298);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `available` bit(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, b'1', '', '管理员');
INSERT INTO `sys_role` VALUES (2, b'1', '', '超级管理员');
INSERT INTO `sys_role` VALUES (3, b'1', '', '单位管理员');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resources`;
CREATE TABLE `sys_role_resources` (
  `sys_role_id` bigint(20) NOT NULL,
  `resources_id` bigint(20) NOT NULL,
  KEY `FKog6jj4v6yh9e1ilxk2mwuk75a` (`resources_id`),
  KEY `FKsqkqfd2hpr5cc2kbrtgoced2w` (`sys_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_resources
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_resources` VALUES (1, 285);
INSERT INTO `sys_role_resources` VALUES (1, 1);
INSERT INTO `sys_role_resources` VALUES (1, 286);
INSERT INTO `sys_role_resources` VALUES (1, 287);
INSERT INTO `sys_role_resources` VALUES (1, 288);
INSERT INTO `sys_role_resources` VALUES (1, 289);
INSERT INTO `sys_role_resources` VALUES (1, 290);
INSERT INTO `sys_role_resources` VALUES (1, 291);
INSERT INTO `sys_role_resources` VALUES (1, 292);
INSERT INTO `sys_role_resources` VALUES (1, 298);
INSERT INTO `sys_role_resources` VALUES (1, 299);
INSERT INTO `sys_role_resources` VALUES (1, 300);
INSERT INTO `sys_role_resources` VALUES (1, 301);
INSERT INTO `sys_role_resources` VALUES (1, 302);
INSERT INTO `sys_role_resources` VALUES (1, 303);
INSERT INTO `sys_role_resources` VALUES (1, 2);
INSERT INTO `sys_role_resources` VALUES (1, 293);
INSERT INTO `sys_role_resources` VALUES (1, 294);
INSERT INTO `sys_role_resources` VALUES (1, 295);
INSERT INTO `sys_role_resources` VALUES (1, 296);
INSERT INTO `sys_role_resources` VALUES (1, 297);
INSERT INTO `sys_role_resources` VALUES (1, 5);
INSERT INTO `sys_role_resources` VALUES (1, 8);
INSERT INTO `sys_role_resources` VALUES (1, 11);
INSERT INTO `sys_role_resources` VALUES (1, 14);
INSERT INTO `sys_role_resources` VALUES (1, 150);
INSERT INTO `sys_role_resources` VALUES (1, 3);
INSERT INTO `sys_role_resources` VALUES (1, 6);
INSERT INTO `sys_role_resources` VALUES (1, 9);
INSERT INTO `sys_role_resources` VALUES (1, 10);
INSERT INTO `sys_role_resources` VALUES (1, 13);
INSERT INTO `sys_role_resources` VALUES (1, 4);
INSERT INTO `sys_role_resources` VALUES (1, 7);
INSERT INTO `sys_role_resources` VALUES (1, 12);
INSERT INTO `sys_role_resources` VALUES (1, 16);
INSERT INTO `sys_role_resources` VALUES (2, 285);
INSERT INTO `sys_role_resources` VALUES (2, 1);
INSERT INTO `sys_role_resources` VALUES (2, 286);
INSERT INTO `sys_role_resources` VALUES (2, 287);
INSERT INTO `sys_role_resources` VALUES (2, 288);
INSERT INTO `sys_role_resources` VALUES (2, 289);
INSERT INTO `sys_role_resources` VALUES (2, 290);
INSERT INTO `sys_role_resources` VALUES (2, 291);
INSERT INTO `sys_role_resources` VALUES (2, 292);
INSERT INTO `sys_role_resources` VALUES (2, 298);
INSERT INTO `sys_role_resources` VALUES (2, 299);
INSERT INTO `sys_role_resources` VALUES (2, 300);
INSERT INTO `sys_role_resources` VALUES (2, 301);
INSERT INTO `sys_role_resources` VALUES (2, 302);
INSERT INTO `sys_role_resources` VALUES (2, 303);
INSERT INTO `sys_role_resources` VALUES (2, 2);
INSERT INTO `sys_role_resources` VALUES (2, 293);
INSERT INTO `sys_role_resources` VALUES (2, 294);
INSERT INTO `sys_role_resources` VALUES (2, 295);
INSERT INTO `sys_role_resources` VALUES (2, 296);
INSERT INTO `sys_role_resources` VALUES (2, 297);
INSERT INTO `sys_role_resources` VALUES (2, 5);
INSERT INTO `sys_role_resources` VALUES (2, 8);
INSERT INTO `sys_role_resources` VALUES (2, 11);
INSERT INTO `sys_role_resources` VALUES (2, 14);
INSERT INTO `sys_role_resources` VALUES (2, 150);
INSERT INTO `sys_role_resources` VALUES (2, 3);
INSERT INTO `sys_role_resources` VALUES (2, 6);
INSERT INTO `sys_role_resources` VALUES (2, 9);
INSERT INTO `sys_role_resources` VALUES (2, 10);
INSERT INTO `sys_role_resources` VALUES (2, 13);
INSERT INTO `sys_role_resources` VALUES (2, 4);
INSERT INTO `sys_role_resources` VALUES (2, 7);
INSERT INTO `sys_role_resources` VALUES (2, 12);
INSERT INTO `sys_role_resources` VALUES (2, 16);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `available` bit(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `sex_type` int(11) DEFAULT NULL COMMENT '性别(0.男,1.女)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, '2017-07-11 17:42:18', '$2a$10$SIU57gfkh/TsIVYALXBNAeDnQzkm652FT9cg4h8wtEfC306uliyYa', '2020-12-11 17:03:20', 'admin', b'1', '1191134106@qq.com', '15030103078', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_roles`;
CREATE TABLE `sys_user_roles` (
  `sys_user_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  KEY `FKdpvc6d7xqpqr43dfuk1s27cqh` (`roles_id`),
  KEY `FKd0ut7sloes191bygyf7a3pk52` (`sys_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_roles
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_roles` VALUES (1, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
