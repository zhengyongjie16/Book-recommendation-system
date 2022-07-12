/*
 Navicat MySQL Data Transfer

 Source Server         : 47.104.206.142
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : 47.104.206.142:33060
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 04/05/2022 08:34:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-04-04 13:08:50', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-04-04 13:08:50', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-04-04 13:08:50', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'false', 'N', 'admin', '2022-04-04 13:08:50', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2022-04-04 13:08:50', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-04-04 13:08:38', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-04-04 13:08:38', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-04-04 13:08:38', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-04-04 13:08:38', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-04-04 13:08:38', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-04-04 13:08:38', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-04-04 13:08:38', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-04-04 13:08:38', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-04-04 13:08:38', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-04-04 13:08:38', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-04-04 13:08:48', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-04-04 13:08:48', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-04-04 13:08:49', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-04-04 13:08:48', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-04-04 13:08:48', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-04-04 13:08:48', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-04-04 13:08:48', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-04-04 13:08:48', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-04-04 13:08:48', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-04-04 13:08:48', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-04-04 13:08:48', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-04-04 13:08:48', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-04-04 13:08:48', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-04-04 13:08:50', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-04-04 13:08:51', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-04-04 13:08:51', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 284 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-04 15:08:31');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-04 15:14:24');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-05 06:37:29');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-04-05 07:55:55');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-05 08:32:07');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-05 13:56:15');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-05 14:43:25');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-05 14:43:37');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-09 05:29:08');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-09 05:33:18');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-09 06:40:59');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-09 07:43:45');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-09 08:02:24');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-09 09:04:22');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-09 10:11:51');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-09 13:34:57');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-09 14:10:57');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-10 04:11:48');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-10 05:16:07');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-10 06:15:26');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-04-10 06:17:53');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-10 06:17:58');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-10 06:21:50');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-10 06:22:03');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-10 06:34:28');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-10 08:07:57');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-10 10:06:16');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-10 10:06:59');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-11 03:44:05');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-11 04:17:56');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-11 06:24:51');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-11 06:27:24');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-11 06:30:34');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-11 06:44:25');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-11 06:47:05');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-11 06:53:53');
INSERT INTO `sys_logininfor` VALUES (136, 'admin1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-04-11 07:44:50');
INSERT INTO `sys_logininfor` VALUES (137, 'admin2', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-04-11 08:03:05');
INSERT INTO `sys_logininfor` VALUES (138, 'admin2', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-04-11 08:03:10');
INSERT INTO `sys_logininfor` VALUES (139, 'admin2', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-11 08:03:18');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-04-11 08:03:50');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-04-11 08:03:56');
INSERT INTO `sys_logininfor` VALUES (142, 'admin2', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-11 08:04:20');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-11 08:04:24');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-11 08:09:03');
INSERT INTO `sys_logininfor` VALUES (145, 'admin1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-11 08:09:13');
INSERT INTO `sys_logininfor` VALUES (146, '12345689', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-04-11 13:54:50');
INSERT INTO `sys_logininfor` VALUES (147, '123456789', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：123456789 不存在', '2022-04-11 13:55:01');
INSERT INTO `sys_logininfor` VALUES (148, '123456789', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：123456789 不存在', '2022-04-11 13:55:12');
INSERT INTO `sys_logininfor` VALUES (149, '123456789', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-04-11 13:55:29');
INSERT INTO `sys_logininfor` VALUES (150, '123456789', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-11 13:55:38');
INSERT INTO `sys_logininfor` VALUES (151, '123456789', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-11 13:56:28');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-04-11 13:56:35');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-04-11 13:56:43');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-11 13:56:51');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-11 14:18:27');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-11 14:18:38');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-11 14:24:39');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-04-11 14:33:24');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-11 14:33:29');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-11 14:46:36');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-12 03:51:03');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-12 04:27:49');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-12 04:43:35');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2022-04-12 05:02:28');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '192.168.1.11', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-12 05:06:16');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-12 12:40:53');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-12 13:34:20');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2022-04-12 13:34:33');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-12 13:34:38');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-13 14:20:07');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-13 14:27:51');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-04-13 14:58:48');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-13 14:58:51');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-13 15:32:07');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-13 16:39:43');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-14 05:31:06');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-14 05:46:57');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-14 06:27:13');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-14 06:28:20');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-14 06:39:30');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-14 06:50:22');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-14 11:01:42');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-14 12:08:56');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-15 00:57:58');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-15 00:58:34');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-15 01:35:13');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-15 01:37:18');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-15 01:41:33');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-15 03:06:40');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-15 04:23:30');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2022-04-15 04:26:07');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-15 04:26:27');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2022-04-15 04:36:12');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-15 04:36:17');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-15 06:57:04');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2022-04-15 07:16:58');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-15 07:17:09');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-15 08:09:52');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2022-04-15 08:20:02');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-15 08:20:12');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-15 11:10:08');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2022-04-15 11:56:03');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-15 11:56:11');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2022-04-15 11:56:21');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-15 11:56:29');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-15 12:47:57');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-15 13:00:41');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-15 13:49:17');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2022-04-15 14:05:10');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-15 14:05:15');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2022-04-15 14:22:57');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-15 14:23:02');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-17 01:55:51');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-17 01:57:45');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-17 01:59:38');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-17 02:03:03');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-17 02:19:39');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-17 02:33:44');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-17 03:44:33');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-17 04:18:50');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2022-04-17 04:56:32');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-17 04:56:36');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-17 05:02:30');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-17 05:21:44');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-17 05:43:21');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-04-17 08:44:14');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-17 08:44:17');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-17 08:58:53');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-17 09:00:12');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-17 09:09:34');
INSERT INTO `sys_logininfor` VALUES (231, '12345', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-04-17 09:09:49');
INSERT INTO `sys_logininfor` VALUES (232, '12345', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-17 09:09:58');
INSERT INTO `sys_logininfor` VALUES (233, '12345', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-17 09:16:37');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-04-17 09:16:46');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-04-17 09:16:56');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-04-17 09:17:05');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-04-17 09:17:15');
INSERT INTO `sys_logininfor` VALUES (238, '12345', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-17 09:17:39');
INSERT INTO `sys_logininfor` VALUES (239, '12345', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-17 09:18:03');
INSERT INTO `sys_logininfor` VALUES (240, '12345', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-17 09:18:09');
INSERT INTO `sys_logininfor` VALUES (241, '12345', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-17 09:19:00');
INSERT INTO `sys_logininfor` VALUES (242, '12345', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-04-17 09:34:00');
INSERT INTO `sys_logininfor` VALUES (243, '12345', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-17 09:34:04');
INSERT INTO `sys_logininfor` VALUES (244, '555', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '注册成功', '2022-04-17 09:43:55');
INSERT INTO `sys_logininfor` VALUES (245, '555', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-17 09:44:05');
INSERT INTO `sys_logininfor` VALUES (246, '555', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2022-04-17 09:44:17');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2022-04-17 09:44:26');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2022-04-17 09:44:27');
INSERT INTO `sys_logininfor` VALUES (249, '555', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-17 09:45:21');
INSERT INTO `sys_logininfor` VALUES (250, '555', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2022-04-17 09:47:23');
INSERT INTO `sys_logininfor` VALUES (251, '555', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-17 09:47:27');
INSERT INTO `sys_logininfor` VALUES (252, '555', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2022-04-17 09:54:01');
INSERT INTO `sys_logininfor` VALUES (253, '555', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-17 09:54:35');
INSERT INTO `sys_logininfor` VALUES (254, '555', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2022-04-17 09:59:39');
INSERT INTO `sys_logininfor` VALUES (255, '555', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-04-17 09:59:49');
INSERT INTO `sys_logininfor` VALUES (256, '555', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-17 10:06:39');
INSERT INTO `sys_logininfor` VALUES (257, '555', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-17 10:32:01');
INSERT INTO `sys_logininfor` VALUES (258, '555', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-04-17 10:33:22');
INSERT INTO `sys_logininfor` VALUES (259, '111', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-04-17 10:34:50');
INSERT INTO `sys_logininfor` VALUES (260, '111', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-04-17 10:35:09');
INSERT INTO `sys_logininfor` VALUES (261, '111', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-17 10:35:16');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '127.0.0.1', '内网IP', 'Internet Explorer 11', 'Windows 10', '1', '验证码错误', '2022-04-18 13:48:26');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Internet Explorer 11', 'Windows 10', '0', '登录成功', '2022-04-18 13:48:30');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-18 13:59:48');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-18 14:20:50');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-22 01:24:24');
INSERT INTO `sys_logininfor` VALUES (267, 'admin123', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-04-23 14:54:30');
INSERT INTO `sys_logininfor` VALUES (268, 'admin123', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-23 15:00:12');
INSERT INTO `sys_logininfor` VALUES (269, 'admin123', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-23 15:21:20');
INSERT INTO `sys_logininfor` VALUES (270, 'admin123', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-23 15:21:28');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '127.0.0.1', '内网IP', 'Internet Explorer 11', 'Windows 10', '0', '登录成功', '2022-04-23 15:39:49');
INSERT INTO `sys_logininfor` VALUES (272, 'admin123', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-23 15:40:35');
INSERT INTO `sys_logininfor` VALUES (273, 'admin123', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-23 15:40:40');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '127.0.0.1', '内网IP', 'Internet Explorer 11', 'Windows 10', '0', '登录成功', '2022-04-24 04:30:39');
INSERT INTO `sys_logininfor` VALUES (275, 'admin123', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-24 04:33:33');
INSERT INTO `sys_logininfor` VALUES (276, 'admin123', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-24 04:39:13');
INSERT INTO `sys_logininfor` VALUES (277, '王希沃', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-04-24 04:40:19');
INSERT INTO `sys_logininfor` VALUES (278, '王希沃', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-04-24 04:43:25');
INSERT INTO `sys_logininfor` VALUES (279, '王希沃', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-24 04:43:32');
INSERT INTO `sys_logininfor` VALUES (280, '孙屁屁', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-04-24 04:46:32');
INSERT INTO `sys_logininfor` VALUES (281, '王希沃', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-24 04:47:33');
INSERT INTO `sys_logininfor` VALUES (282, '王希沃', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-24 04:47:48');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '127.0.0.1', '内网IP', 'Internet Explorer 11', 'Windows 10', '1', '验证码错误', '2022-04-26 00:10:46');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '127.0.0.1', '内网IP', 'Internet Explorer 11', 'Windows 10', '0', '登录成功', '2022-04-26 00:10:52');
INSERT INTO `sys_logininfor` VALUES (285, 'admin', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 03:32:50');
INSERT INTO `sys_logininfor` VALUES (286, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 04:10:07');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 04:39:02');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 04:41:06');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-03 05:14:27');
INSERT INTO `sys_logininfor` VALUES (290, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-03 05:25:39');
INSERT INTO `sys_logininfor` VALUES (291, '111', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 05:26:58');
INSERT INTO `sys_logininfor` VALUES (292, '111', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-05-03 05:27:05');
INSERT INTO `sys_logininfor` VALUES (293, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-05-03 05:27:14');
INSERT INTO `sys_logininfor` VALUES (294, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-05-03 05:27:22');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-05-03 05:27:39');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-05-03 05:27:43');
INSERT INTO `sys_logininfor` VALUES (297, '123', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-05-03 05:29:06');
INSERT INTO `sys_logininfor` VALUES (298, '123', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 05:29:12');
INSERT INTO `sys_logininfor` VALUES (299, '123', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-05-03 05:30:01');
INSERT INTO `sys_logininfor` VALUES (300, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 05:30:15');
INSERT INTO `sys_logininfor` VALUES (301, '12345', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-05-03 05:31:21');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-05-03 05:33:21');
INSERT INTO `sys_logininfor` VALUES (303, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-05-03 05:33:24');
INSERT INTO `sys_logininfor` VALUES (304, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-03 05:39:13');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-05-03 05:40:09');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 05:40:15');
INSERT INTO `sys_logininfor` VALUES (307, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-05-03 05:44:33');
INSERT INTO `sys_logininfor` VALUES (308, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-05-03 05:45:17');
INSERT INTO `sys_logininfor` VALUES (309, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 05:45:20');
INSERT INTO `sys_logininfor` VALUES (310, 'admin', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 05:46:09');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 05:51:47');
INSERT INTO `sys_logininfor` VALUES (312, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-05-03 06:01:01');
INSERT INTO `sys_logininfor` VALUES (313, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 06:01:14');
INSERT INTO `sys_logininfor` VALUES (314, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-05-03 06:02:44');
INSERT INTO `sys_logininfor` VALUES (315, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 06:02:49');
INSERT INTO `sys_logininfor` VALUES (316, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-05-03 06:03:57');
INSERT INTO `sys_logininfor` VALUES (317, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-05-03 06:04:00');
INSERT INTO `sys_logininfor` VALUES (318, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 06:04:03');
INSERT INTO `sys_logininfor` VALUES (319, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 06:07:12');
INSERT INTO `sys_logininfor` VALUES (320, 'admin', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 06:16:59');
INSERT INTO `sys_logininfor` VALUES (321, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 06:22:00');
INSERT INTO `sys_logininfor` VALUES (322, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-05-03 07:30:20');
INSERT INTO `sys_logininfor` VALUES (323, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-05-03 07:30:24');
INSERT INTO `sys_logininfor` VALUES (324, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 07:30:29');
INSERT INTO `sys_logininfor` VALUES (325, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-05-03 07:33:05');
INSERT INTO `sys_logininfor` VALUES (326, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 07:34:36');
INSERT INTO `sys_logininfor` VALUES (327, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-05-03 07:35:44');
INSERT INTO `sys_logininfor` VALUES (328, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 07:35:50');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-05-03 07:37:12');
INSERT INTO `sys_logininfor` VALUES (330, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 07:37:22');
INSERT INTO `sys_logininfor` VALUES (331, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-03 08:44:11');
INSERT INTO `sys_logininfor` VALUES (332, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 08:44:17');
INSERT INTO `sys_logininfor` VALUES (333, 'admin', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-05-03 08:44:28');
INSERT INTO `sys_logininfor` VALUES (334, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-03 08:44:32');
INSERT INTO `sys_logininfor` VALUES (335, 'admin', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 08:44:32');
INSERT INTO `sys_logininfor` VALUES (336, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 08:44:36');
INSERT INTO `sys_logininfor` VALUES (337, 'admin', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-05-03 08:44:38');
INSERT INTO `sys_logininfor` VALUES (338, 'admin', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 08:44:42');
INSERT INTO `sys_logininfor` VALUES (339, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-03 08:47:32');
INSERT INTO `sys_logininfor` VALUES (340, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 08:47:37');
INSERT INTO `sys_logininfor` VALUES (341, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-03 08:49:35');
INSERT INTO `sys_logininfor` VALUES (342, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 08:49:39');
INSERT INTO `sys_logininfor` VALUES (343, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-03 08:49:47');
INSERT INTO `sys_logininfor` VALUES (344, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 08:49:50');
INSERT INTO `sys_logininfor` VALUES (345, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-03 08:49:58');
INSERT INTO `sys_logininfor` VALUES (346, 'admin', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2022-05-03 08:50:00');
INSERT INTO `sys_logininfor` VALUES (347, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 08:50:02');
INSERT INTO `sys_logininfor` VALUES (348, 'admin', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2022-05-03 08:50:02');
INSERT INTO `sys_logininfor` VALUES (349, 'admin', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-03 08:50:05');
INSERT INTO `sys_logininfor` VALUES (350, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-03 08:50:06');
INSERT INTO `sys_logininfor` VALUES (351, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 08:50:09');
INSERT INTO `sys_logininfor` VALUES (352, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-03 08:50:13');
INSERT INTO `sys_logininfor` VALUES (353, 'admin', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2022-05-03 08:50:13');
INSERT INTO `sys_logininfor` VALUES (354, 'admin', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2022-05-03 08:50:26');
INSERT INTO `sys_logininfor` VALUES (355, 'admin', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2022-05-03 08:50:36');
INSERT INTO `sys_logininfor` VALUES (356, 'admin', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-03 08:50:41');
INSERT INTO `sys_logininfor` VALUES (357, 'admin', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2022-05-03 08:51:34');
INSERT INTO `sys_logininfor` VALUES (358, 'admin', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-03 08:51:40');
INSERT INTO `sys_logininfor` VALUES (359, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-05-03 08:52:53');
INSERT INTO `sys_logininfor` VALUES (360, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 08:52:56');
INSERT INTO `sys_logininfor` VALUES (361, 'admin', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-03 08:53:10');
INSERT INTO `sys_logininfor` VALUES (362, 'admin', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-05-03 09:33:37');
INSERT INTO `sys_logininfor` VALUES (363, 'admin', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 09:33:39');
INSERT INTO `sys_logininfor` VALUES (364, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 10:13:44');
INSERT INTO `sys_logininfor` VALUES (365, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 11:02:54');
INSERT INTO `sys_logininfor` VALUES (366, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-03 11:07:06');
INSERT INTO `sys_logininfor` VALUES (367, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 11:07:13');
INSERT INTO `sys_logininfor` VALUES (368, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 13:36:37');
INSERT INTO `sys_logininfor` VALUES (369, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 13:48:54');
INSERT INTO `sys_logininfor` VALUES (370, 'admin', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 14:46:56');
INSERT INTO `sys_logininfor` VALUES (371, 'admin', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 15:00:32');
INSERT INTO `sys_logininfor` VALUES (372, 'admin', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-05-03 15:01:46');
INSERT INTO `sys_logininfor` VALUES (373, 'admin', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 15:01:55');
INSERT INTO `sys_logininfor` VALUES (374, 'admin', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-05-03 15:08:18');
INSERT INTO `sys_logininfor` VALUES (375, 'admin', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 15:09:28');
INSERT INTO `sys_logininfor` VALUES (376, 'admin', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-05-03 15:20:46');
INSERT INTO `sys_logininfor` VALUES (377, 'a1', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-05-03 15:21:41');
INSERT INTO `sys_logininfor` VALUES (378, 'a1', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 15:22:03');
INSERT INTO `sys_logininfor` VALUES (379, 'a1', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-05-03 15:22:26');
INSERT INTO `sys_logininfor` VALUES (380, 'admin', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 15:26:14');
INSERT INTO `sys_logininfor` VALUES (381, 'admin', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-05-03 15:29:02');
INSERT INTO `sys_logininfor` VALUES (382, 'admin', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 15:29:09');
INSERT INTO `sys_logininfor` VALUES (383, '12345678', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '0', '注册成功', '2022-05-03 15:51:45');
INSERT INTO `sys_logininfor` VALUES (384, '12345678', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-03 15:51:51');
INSERT INTO `sys_logininfor` VALUES (385, '12345678', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2022-05-03 15:52:02');
INSERT INTO `sys_logininfor` VALUES (386, 'admin', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2022-05-03 15:52:08');
INSERT INTO `sys_logininfor` VALUES (387, 'admin', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2022-05-03 15:52:13');
INSERT INTO `sys_logininfor` VALUES (388, 'admin', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2022-05-03 15:52:32');
INSERT INTO `sys_logininfor` VALUES (389, '12345678', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2022-05-03 15:52:50');
INSERT INTO `sys_logininfor` VALUES (390, 'admin', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2022-05-03 15:53:18');
INSERT INTO `sys_logininfor` VALUES (391, 'admin', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-03 15:54:08');
INSERT INTO `sys_logininfor` VALUES (392, 'admin', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2022-05-03 15:54:19');
INSERT INTO `sys_logininfor` VALUES (393, 'admin', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-03 15:54:31');
INSERT INTO `sys_logininfor` VALUES (394, 'admin', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 15:57:48');
INSERT INTO `sys_logininfor` VALUES (395, 'admin', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-05-03 15:58:29');
INSERT INTO `sys_logininfor` VALUES (396, '12345678', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-05-03 15:58:34');
INSERT INTO `sys_logininfor` VALUES (397, '12345678', '192.168.0.104', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-05-03 16:00:30');
INSERT INTO `sys_logininfor` VALUES (398, 'admin', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2022-05-03 16:00:59');
INSERT INTO `sys_logininfor` VALUES (399, '12345678', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-03 16:01:06');
INSERT INTO `sys_logininfor` VALUES (400, '12345678', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2022-05-03 16:01:13');
INSERT INTO `sys_logininfor` VALUES (401, 'admin', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-03 16:01:15');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2003 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '1', '0', '', 'system', 'admin', '2022-04-04 13:08:40', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '1', '0', '', 'monitor', 'admin', '2022-04-04 13:08:40', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '1', '0', '', 'tool', 'admin', '2022-04-04 13:08:40', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '电视剧推荐目录', 0, 4, 'film', NULL, NULL, 1, 0, 'M', '1', '0', NULL, 'film', 'admin', '2022-04-13 14:38:40', '', NULL, '电影推荐目录');
INSERT INTO `sys_menu` VALUES (100, '网站概况', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-04-04 13:08:40', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '实时访客', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-04-04 13:08:40', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '全部来源', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-04-04 13:08:40', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '搜索引擎', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-04-04 13:08:40', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '地域分布', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-04-04 13:08:40', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-04-04 13:08:40', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-04-04 13:08:40', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '1', '0', 'monitor:job:list', 'job', 'admin', '2022-04-04 13:08:40', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2022-04-04 13:08:40', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-04-04 13:08:40', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-04-04 13:08:40', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-04-04 13:08:40', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-04-04 13:08:40', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-04-04 13:08:41', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-04-04 13:08:41', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-04-04 13:08:41', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-04-04 13:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-04-04 13:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-04-04 13:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-04-04 13:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-04-04 13:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-04-04 13:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-04-04 13:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-04-04 13:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-04-04 13:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-04-04 13:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-04-04 13:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-04-04 13:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-04-04 13:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-04-04 13:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-04-04 13:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-04-04 13:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-04-04 13:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-04-04 13:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-04-04 13:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-04-04 13:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-04-04 13:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-04-04 13:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-04-04 13:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-04-04 13:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-04-04 13:08:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-04-04 13:08:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-04-04 13:08:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-04-04 13:08:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-04-04 13:08:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-04-04 13:08:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-04-04 13:08:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-04-04 13:08:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-04-04 13:08:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-04-04 13:08:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '2022年推荐榜单', 0, 1, 'score', 'film/score/index', NULL, 1, 0, 'C', '0', '0', 'film:score:list', '#', 'admin', '2022-04-13 14:38:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '新书上架推荐', 0, 2, 'number', 'film/number/index', NULL, 1, 0, 'C', '0', '0', 'film:number:list', '#', 'admin', '2022-04-13 14:38:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '我的书架', 0, 3, 'hottest', 'film/hottest/index', NULL, 1, 0, 'C', '0', '0', 'film:hottest:list', '#', 'admin', '2022-04-13 14:38:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '添加书籍', 0, 4, 'favorite', 'film/favorite/index', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2022-04-13 14:38:40', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2022-04-04 13:08:51', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2022-04-04 13:08:51', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{},\"userId\":1,\"status\":\"1\"}', NULL, 1, '不允许操作超级管理员用户', '2022-04-09 05:40:15');
INSERT INTO `sys_oper_log` VALUES (101, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":2,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-09 05:40:20');
INSERT INTO `sys_oper_log` VALUES (102, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-09 05:40:24');
INSERT INTO `sys_oper_log` VALUES (103, '字典类型', 5, 'com.ruoyi.web.controller.system.SysDictTypeController.export()', 'POST', 1, 'admin', NULL, '/system/dict/type/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2022-04-14 07:06:45');
INSERT INTO `sys_oper_log` VALUES (104, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1649996610000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1649048919000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-15 04:32:58');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-04-04 13:08:39', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-04-04 13:08:39', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-04-04 13:08:39', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-04-04 13:08:39', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-04-04 13:08:39', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2022-04-04 13:08:39', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '级别ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '192.168.0.104', '2022-05-04 00:01:16', 'admin', '2022-04-04 13:08:39', '', '2022-05-03 16:01:15', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-04-04 13:08:39', 'admin', '2022-04-04 13:08:39', 'admin', '2022-04-09 05:40:24', '测试员');
INSERT INTO `sys_user` VALUES (4, NULL, '12345', '12345', '00', '', '', '0', '', '$2a$10$3ap/yfeIYWHmBk7hpWfo0.udWJlihg8Ts2JXVd3g9FiwWkFtoy4G6', '0', '0', '127.0.0.1', '2022-04-17 17:34:04', '', '2022-04-17 09:09:49', '', '2022-04-17 09:34:04', NULL);
INSERT INTO `sys_user` VALUES (100, NULL, 'admin1', 'admin1', '00', '', '', '0', '', '$2a$10$PkUumBtHaEJAlaIC1NP33.zLyNok9Hh4YDPRTA1PTPa229V5hlYru', '0', '0', '127.0.0.1', '2022-04-11 16:09:14', '', '2022-04-11 07:44:50', '', '2022-04-11 08:09:13', NULL);
INSERT INTO `sys_user` VALUES (101, NULL, 'admin2', 'admin2', '00', '', '', '0', '', '$2a$10$dyyMwk/823kBg75GyyYc/.4i8sQJYMndFND72/6bcQpI1s.oDztam', '0', '0', '127.0.0.1', '2022-04-11 16:03:18', '', '2022-04-11 08:03:05', '', '2022-04-11 08:03:18', NULL);
INSERT INTO `sys_user` VALUES (102, NULL, '12345689', '12345689', '00', '', '', '0', '', '$2a$10$pDuQ04KmLUQzBBMzU/MxEubH0XiQ13sclaFCWpdtPD/xq09YmAsuK', '0', '0', '', NULL, '', '2022-04-11 13:54:50', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (103, NULL, '123456789', '123456789', '00', '', '', '0', '', '$2a$10$0clL1C68.xDIE8sFEh/1d.OdloeDnifVFllAUEsVAlaPd4120NJMO', '0', '0', '127.0.0.1', '2022-04-11 21:55:39', '', '2022-04-11 13:55:29', '', '2022-04-11 13:55:38', NULL);
INSERT INTO `sys_user` VALUES (105, NULL, '555', '555', '00', '', '', '0', '', '$2a$10$Wws3N6KWJXKigFrjKNznCex.6uieUc69Dj2zhWxv53Wl0VpvrRlwC', '0', '0', '127.0.0.1', '2022-04-17 18:32:01', '', '2022-04-17 09:43:55', '', '2022-04-17 10:32:01', NULL);
INSERT INTO `sys_user` VALUES (106, NULL, '111', '111', '00', '', '', '0', '', '$2a$10$FBlSd/mxdqoeBa9XB004PuZAQ7kh5NHlQVhKx8qRlBaRSmqu9qYEW', '0', '0', '127.0.0.1', '2022-05-03 13:26:59', '', '2022-04-17 10:34:50', '', '2022-05-03 05:26:58', NULL);
INSERT INTO `sys_user` VALUES (107, NULL, 'admin123', 'admin123', '00', '', '', '0', '', '$2a$10$m0dGmT9v3f29JuuzpymRx.xKBE3wlelNEc0LcwZh.xHcRXHZSkhk6', '0', '0', '127.0.0.1', '2022-04-24 12:33:35', '', '2022-04-23 14:54:30', '', '2022-04-24 04:33:33', NULL);
INSERT INTO `sys_user` VALUES (108, NULL, '王希沃', '王希沃', '00', '', '', '0', '', '$2a$10$bib5NtM1xJtBaHw3.L5S0eXTIM57hLB5n5c0wewl2jgF./jEkJEVS', '0', '0', '127.0.0.1', '2022-04-24 12:47:51', '', '2022-04-24 04:40:19', '', '2022-04-24 04:47:48', NULL);
INSERT INTO `sys_user` VALUES (109, NULL, '孙屁屁', '孙屁屁', '00', '', '', '0', '', '$2a$10$bv9PERpNK8BuWYrryVdW7u4.vyaWf3arOzkv8GCXjat1r3m7yqHZO', '0', '0', '', NULL, '', '2022-04-24 04:46:32', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (110, NULL, '123', '123', '00', '', '', '0', '', '$2a$10$6GFiUkzaF.Ts.P8khIFgO.0cKnYep.AJxWYUg/JXlpH.Vl53LDPji', '0', '0', '127.0.0.1', '2022-05-03 13:29:13', '', '2022-05-03 05:29:04', '', '2022-05-03 05:29:12', NULL);
INSERT INTO `sys_user` VALUES (111, NULL, 'a1', 'a1', '00', '', '', '0', '', '$2a$10$V8H4g2S2GimM5rz2mSXA3uKqPXgNlVGaeVvZN4DQ4LLN5Wu34JoBa', '0', '0', '192.168.0.104', '2022-05-03 23:22:03', '', '2022-05-03 15:21:41', '', '2022-05-03 15:22:03', NULL);
INSERT INTO `sys_user` VALUES (112, NULL, '12345678', '12345678', '00', '', '', '0', '', '$2a$10$N4KVGSWW52BT4kpZg9C0ruJYL83wlxm0/kHB2mFtbg/njv2DhXq5i', '0', '0', '192.168.0.104', '2022-05-04 00:01:06', '', '2022-05-03 15:51:45', '', '2022-05-03 16:01:06', NULL);

-- ----------------------------
-- Table structure for sys_user_copy1
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_copy1`;
CREATE TABLE `sys_user_copy1`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_copy1
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for tv_series_data
-- ----------------------------
DROP TABLE IF EXISTS `tv_series_data`;
CREATE TABLE `tv_series_data`  (
  `id` bigint NOT NULL COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电视剧名称',
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  `socre` double NULL DEFAULT NULL COMMENT '评分',
  `genre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `favorite` int NULL DEFAULT 0 COMMENT ' 0 未收藏  1 收藏',
  `number` int NULL DEFAULT NULL COMMENT '观看人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tv_series_data
-- ----------------------------
INSERT INTO `tv_series_data` VALUES (1003205379, '纯真的年代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/8/s26689.jpg?1383183078', 'https://tv.2345.com/detail/26689.html', 8.5, '家庭', 0, 3225);
INSERT INTO `tv_series_data` VALUES (1003462754, '温柔陷阱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/799/33356b8dd4f9045b8c95ac6c4225c743.jpg', 'https://tv.2345.com/detail/799.html', 8.1, '家庭', 0, 6576);
INSERT INTO `tv_series_data` VALUES (1009774868, '宋耀如父亲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/17/s53619.jpg', 'https://tv.2345.com/detail/53619.html', 8.9, '家庭', 0, 3907);
INSERT INTO `tv_series_data` VALUES (1011851234, '征服太阳', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/6/s18882.jpg?1410420439', 'https://tv.2345.com/detail/18882.html', 9, '家庭', 0, 6977);
INSERT INTO `tv_series_data` VALUES (1011928817, '河山', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/18/s56799.jpg', 'https://tv.2345.com/detail/56799.html', 9.8, '战争', 0, 5250);
INSERT INTO `tv_series_data` VALUES (1015800108, '爱你千万次', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/888/ab549456bb0d652528d5d1a23a8237f0.jpg', 'https://tv.2345.com/detail/888.html', 9.5, '伦理', 0, 3103);
INSERT INTO `tv_series_data` VALUES (1016023890, '铁甲舰上的男人们', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/11/s33372.jpg', 'https://tv.2345.com/detail/33372.html', 8.5, '战争', 0, 4131);
INSERT INTO `tv_series_data` VALUES (1016561698, '牵手', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/1/5894/4c9f0abd79dbb2c0c912bdc7fc5a0158.jpg', 'https://tv.2345.com/detail/5894.html', 10, '伦理', 0, 4106);
INSERT INTO `tv_series_data` VALUES (1017941652, '聂耳', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/18/s56298.jpg', 'https://tv.2345.com/detail/56298.html', 9.8, '战争', 0, 6135);
INSERT INTO `tv_series_data` VALUES (1018849984, '换世之恋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/20/s60898.jpg', 'https://tv.2345.com/detail/60898.html', 9.8, '家庭', 0, 6739);
INSERT INTO `tv_series_data` VALUES (1019675867, '杨光的快乐生活2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/1403/49f3a583660d8d35790c27639f3083dd.jpg', 'https://tv.2345.com/detail/1403.html', 10, '家庭', 0, 3881);
INSERT INTO `tv_series_data` VALUES (1021828085, '乡里人家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/14/s43946.jpg', 'https://tv.2345.com/detail/43946.html', 7.1, '家庭', 0, 3178);
INSERT INTO `tv_series_data` VALUES (1024069120, '戈壁母亲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/1/3155/d2936d5a2d6f6ccf61403e64b2f9d713.jpg', 'https://tv.2345.com/detail/3155.html', 10, '战争', 0, 5154);
INSERT INTO `tv_series_data` VALUES (1025040044, '新鱼之恋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/20/s61276.jpg', 'https://tv.2345.com/detail/61276.html', 9.7, '家庭', 0, 5840);
INSERT INTO `tv_series_data` VALUES (1029150662, '双城生活', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/1/5681/9bc72d07f9d2865cb4fc09d91f442592.jpg', 'https://tv.2345.com/detail/5681.html', 9.1, '伦理', 0, 6634);
INSERT INTO `tv_series_data` VALUES (1032946780, '扇娘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/3/3.jpg', 'https://tv.2345.com/detail/17537.html', 8.8, '战争', 0, 3115);
INSERT INTO `tv_series_data` VALUES (1036991473, '幸福在路上', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/716/b814e1f7c883aaed415444e323b258bf.jpg', 'https://tv.2345.com/detail/716.html', 8.7, '战争', 0, 7448);
INSERT INTO `tv_series_data` VALUES (1040038475, '母亲的忏悔', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/10/s30745.jpg?1415341610', 'https://tv.2345.com/detail/30745.html', 7.7, '家庭', 0, 3298);
INSERT INTO `tv_series_data` VALUES (1040689726, '哑巴新娘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/1/4619/1aed7a6bb775b16c9bdaddfd3c992969.jpg', 'https://tv.2345.com/detail/4619.html', 9.6, '家庭', 0, 6817);
INSERT INTO `tv_series_data` VALUES (1051102139, '破局1950', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/19/s57102.jpg', 'https://tv.2345.com/detail/57102.html', 8.9, '战争', 0, 5362);
INSERT INTO `tv_series_data` VALUES (1051579761, '特战先锋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/627/8119fe30e95d0b0ad37fadb7ddfde5ff.jpg', 'https://tv.2345.com/detail/627.html', 9.2, '悬疑', 1, 7952);
INSERT INTO `tv_series_data` VALUES (1053655848, '真情无限之养母生母', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/2/8227/5419498505f6cc60a8d5f05f0fa96417.jpg', 'https://tv.2345.com/detail/8227.html', 9.2, '家庭', 0, 6563);
INSERT INTO `tv_series_data` VALUES (1055432930, '盲点第二季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/18/s54364.jpg', 'https://tv.2345.com/detail/54364.html', 8.1, '悬疑', 0, 4015);
INSERT INTO `tv_series_data` VALUES (1055789673, '抹布女也有春天', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/8/s25035.jpg?1378178611', 'https://tv.2345.com/detail/25035.html', 8.7, '家庭', 0, 7095);
INSERT INTO `tv_series_data` VALUES (1056616118, '加油妈妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/450091/1350274206/5a4e307967cd46cbcaf3918cd07b2372.jpg', 'https://tv.2345.com/detail/15803.html', 8.8, '家庭', 0, 3495);
INSERT INTO `tv_series_data` VALUES (1058722394, '妯娌的三国时代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/c/18090.jpg', 'https://tv.2345.com/detail/18090.html', 8.9, '家庭', 0, 3659);
INSERT INTO `tv_series_data` VALUES (1061641498, '阿有正传', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/1/3928/cb876f2b12cca36c4effddbd9eff6142.jpg', 'https://tv.2345.com/detail/3928.html', 8.9, '家庭', 0, 6778);
INSERT INTO `tv_series_data` VALUES (1062182145, '德雷尔一家第四季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/18/s56948.jpg', 'https://tv.2345.com/detail/56948.html', 8, '其他', 0, 6584);
INSERT INTO `tv_series_data` VALUES (1062255927, '孤岛飞鹰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/450569/1351707163/bfd6cb97f3feb1edeb3616a6c854e705.jpg', 'https://tv.2345.com/detail/16371.html', 9, '悬疑', 0, 3817);
INSERT INTO `tv_series_data` VALUES (1063136455, '走西口', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/141/19bd5d9d18a69301e8194d9843f2ee8b.jpg', 'https://tv.2345.com/detail/141.html', 8.9, '家庭', 0, 7500);
INSERT INTO `tv_series_data` VALUES (1063841584, '兄弟兄弟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/14/s42058.jpg?1412729181', 'https://tv.2345.com/detail/42058.html', 8.6, '家庭', 0, 3714);
INSERT INTO `tv_series_data` VALUES (1066245324, '裸嫁时代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/15/s46753.jpg?1438568896', 'https://tv.2345.com/detail/46753.html', 8.5, '家庭', 0, 6743);
INSERT INTO `tv_series_data` VALUES (1066738199, '你真漂亮', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/2499/83741b1870d990fcb592252c59ed0dd6.jpg', 'https://tv.2345.com/detail/2499.html', 6.8, '伦理', 0, 5001);
INSERT INTO `tv_series_data` VALUES (1069363529, '敌营十八年第一部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/1994/s1994.jpg', 'https://tv.2345.com/detail/1994.html', 8.7, '战争', 0, 6106);
INSERT INTO `tv_series_data` VALUES (1071956598, '人是铁饭是钢', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/8/s24000.jpg?1397004577', 'https://tv.2345.com/detail/24000.html', 8.4, '伦理', 0, 4666);
INSERT INTO `tv_series_data` VALUES (1074008329, '红色追剿1949', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/18/s56583.jpg', 'https://tv.2345.com/detail/56583.html', 8.3, '战争', 0, 3828);
INSERT INTO `tv_series_data` VALUES (1074177051, '月嫂先生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/18/s55116.jpg?1534398345', 'https://tv.2345.com/detail/55116.html', 8.8, '家庭', 0, 5208);
INSERT INTO `tv_series_data` VALUES (1076039430, '天之云地之雾', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/795/7df53a4942f36986033ac6ff61d34d1a.jpg', 'https://tv.2345.com/detail/795.html', 9.3, '家庭', 0, 6480);
INSERT INTO `tv_series_data` VALUES (1087098295, '叛逆者', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/19/s59173.jpg', 'https://tv.2345.com/detail/59173.html', 9.8, '悬疑', 0, 6045);
INSERT INTO `tv_series_data` VALUES (1088105984, '黄金背后', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/11/s34636.jpg?1397876538', 'https://tv.2345.com/detail/34636.html', 8.4, '战争', 0, 3105);
INSERT INTO `tv_series_data` VALUES (1090683655, '壮士出川', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/9/s28539.jpg?1388719279', 'https://tv.2345.com/detail/28539.html', 8.5, '军旅', 0, 3782);
INSERT INTO `tv_series_data` VALUES (1090978424, '朝天门', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/20/s61183.jpg', 'https://tv.2345.com/detail/61183.html', 9.8, '家庭', 0, 6876);
INSERT INTO `tv_series_data` VALUES (1093269463, '生死连', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/15/s46027.jpg?1434593305', 'https://tv.2345.com/detail/46027.html', 8.5, '战争', 0, 4315);
INSERT INTO `tv_series_data` VALUES (1095225958, '誓言无声', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/3/s9688.jpg', 'https://tv.2345.com/detail/9688.html', 8.8, '战争', 0, 6290);
INSERT INTO `tv_series_data` VALUES (1096104550, '回家的路有多远', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/18/s54031.jpg?1510552501', 'https://tv.2345.com/detail/54031.html', 8.9, '家庭', 0, 3067);
INSERT INTO `tv_series_data` VALUES (1099063450, '乐活家庭第1部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/4/12110/aa78a61914baf5d58fd6bac6b4fb446c.jpg', 'https://tv.2345.com/detail/12110.html', 9, '家庭', 0, 3713);
INSERT INTO `tv_series_data` VALUES (1102069240, '大舞台', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/0/s726.jpg?1410419374', 'https://tv.2345.com/detail/726.html', 9.4, '战争', 0, 3958);
INSERT INTO `tv_series_data` VALUES (1103116365, '对手冯远征版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/20/s61262.jpg', 'https://tv.2345.com/detail/61262.html', 8.4, '战争', 0, 6783);
INSERT INTO `tv_series_data` VALUES (1103920869, '功勋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/54/dad5fa98514995e32fe961af246cf388.jpg', 'https://tv.2345.com/detail/54.html', 8, '战争', 0, 4633);
INSERT INTO `tv_series_data` VALUES (1104482586, '狙击生死线', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/1082/2597928400437dc616eb5b210b132843.jpg', 'https://tv.2345.com/detail/1082.html', 9, '战争', 0, 5207);
INSERT INTO `tv_series_data` VALUES (1106549065, '一剑横空', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/18/s56067.jpg', 'https://tv.2345.com/detail/56067.html', 8.9, '战争', 0, 5582);
INSERT INTO `tv_series_data` VALUES (1108467704, '深海利剑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/17/s52982.jpg?1501464824', 'https://tv.2345.com/detail/52982.html', 8.9, '战争', 0, 5096);
INSERT INTO `tv_series_data` VALUES (1110800857, '夜幕下的哈尔滨', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/51/6b3616d2cb75fbce0bb336148b4054fe.jpg', 'https://tv.2345.com/detail/51.html', 8.8, '战争', 0, 6015);
INSERT INTO `tv_series_data` VALUES (1114871640, '打狗棍', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/8/s25915.jpg?1381979497', 'https://tv.2345.com/detail/25915.html', 8.3, '战争', 0, 6962);
INSERT INTO `tv_series_data` VALUES (1115559954, '利箭行动', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/8/1.jpg', 'https://tv.2345.com/detail/17799.html', 9.2, '战争', 0, 5120);
INSERT INTO `tv_series_data` VALUES (1115712111, '错伏', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/9/s28202.jpg?1387377701', 'https://tv.2345.com/detail/28202.html', 8.5, '悬疑', 0, 3764);
INSERT INTO `tv_series_data` VALUES (1127139990, '好想回家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/2/6931/0a4489cca482c25e69674878ed30b352.jpg', 'https://tv.2345.com/detail/6931.html', 10, '伦理', 0, 4518);
INSERT INTO `tv_series_data` VALUES (1129626580, '红箭', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/14/s44192.jpg?1423129389', 'https://tv.2345.com/detail/44192.html', 8.3, '战争', 0, 5637);
INSERT INTO `tv_series_data` VALUES (1137151226, '加油妈妈未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/7/s21670.jpg?1408956372', 'https://tv.2345.com/detail/21670.html', 8.6, '家庭', 0, 5760);
INSERT INTO `tv_series_data` VALUES (1137668683, '谁为爱情买单', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/3/9744/dad325270f4f7767e384a92aa854d635.jpg', 'https://tv.2345.com/detail/9744.html', 10, '伦理', 0, 3689);
INSERT INTO `tv_series_data` VALUES (1139645991, '战地黄花分外香', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/10/s30041.jpg?1393989267', 'https://tv.2345.com/detail/30041.html', 8.4, '军旅', 0, 6676);
INSERT INTO `tv_series_data` VALUES (1141787867, '守候幸福', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/3/11498/82967ea09ff55821ed6a2e583e0a59b8.jpg', 'https://tv.2345.com/detail/11498.html', 9.5, '家庭', 0, 6887);
INSERT INTO `tv_series_data` VALUES (1149909985, '我的鄂尔多斯', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/3/10589/b493f6938b66ed16dc46cc32ae6739eb.jpg', 'https://tv.2345.com/detail/10589.html', 9, '战争', 0, 5400);
INSERT INTO `tv_series_data` VALUES (1150115699, '嫂子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/2/7877/07e97abb5cfe2522716f987d5ce06381.jpg', 'https://tv.2345.com/detail/7877.html', 8.7, '家庭', 0, 7929);
INSERT INTO `tv_series_data` VALUES (1153427784, '闯天下', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/9/s27142.jpg?1384568000', 'https://tv.2345.com/detail/27142.html', 8.5, '其他', 0, 5173);
INSERT INTO `tv_series_data` VALUES (1156980174, '漂亮女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/628/63c71dcd99090b3850cf622aa4b48de1.jpg', 'https://tv.2345.com/detail/628.html', 6.2, '伦理', 0, 7033);
INSERT INTO `tv_series_data` VALUES (1157080023, '青青河边草', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/1/3554/bd179967d7e12ba4816cf327679d6546.jpg', 'https://tv.2345.com/detail/3554.html', 9.1, '家庭', 0, 3176);
INSERT INTO `tv_series_data` VALUES (1157281085, '间谍风一号', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/2/8111/8cd525dc2642363a2fb9e141d06717da.jpg', 'https://tv.2345.com/detail/8111.html', 9.8, '战争', 0, 7670);
INSERT INTO `tv_series_data` VALUES (1157537963, '我们都要好好的刘涛逆袭版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/18/s56111.jpg', 'https://tv.2345.com/detail/56111.html', 8.1, '家庭', 0, 4799);
INSERT INTO `tv_series_data` VALUES (1159290288, '麻辣女兵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/5/d.jpg', 'https://tv.2345.com/detail/11837.html', 9.1, '战争', 0, 5485);
INSERT INTO `tv_series_data` VALUES (1159732957, '谎言背后', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/11/s34517.jpg?1398239100', 'https://tv.2345.com/detail/34517.html', 7.8, '伦理', 0, 6192);
INSERT INTO `tv_series_data` VALUES (1160725950, '烽火英雄传未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/17/s52393.jpg', 'https://tv.2345.com/detail/52393.html', 7.3, '战争', 0, 3883);
INSERT INTO `tv_series_data` VALUES (1162551969, '香火', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/3/s9222.jpg?1433821032', 'https://tv.2345.com/detail/9222.html', 8.4, '家庭', 0, 5326);
INSERT INTO `tv_series_data` VALUES (1165857169, '欢喜亲家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/87/f95a0582a5197e0d8b6134cdb8f97b0f.jpg', 'https://tv.2345.com/detail/87.html', 10, '伦理', 0, 7589);
INSERT INTO `tv_series_data` VALUES (1166822917, '破晓', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/17/s52203.jpg?1480904565', 'https://tv.2345.com/detail/52203.html', 8.3, '战争', 0, 5794);
INSERT INTO `tv_series_data` VALUES (1168396014, '大丫鬟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/346/9dc5448471759403c64eaa2ff02b537a.jpg', 'https://tv.2345.com/detail/346.html', 9.1, '家庭', 0, 4506);
INSERT INTO `tv_series_data` VALUES (1169059706, '不离不弃', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/766/dd6ca69dd969ddbc48bc3ebe2e83bfea.jpg', 'https://tv.2345.com/detail/766.html', 8.9, '家庭', 0, 5884);
INSERT INTO `tv_series_data` VALUES (1171187461, '我的抗战之铁血轻奇兵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/15/s46184.jpg', 'https://tv.2345.com/detail/46184.html', 8.4, '战争', 0, 4513);
INSERT INTO `tv_series_data` VALUES (1176529271, '瑞雪飘飘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/1/s5700.jpg', 'https://tv.2345.com/detail/5700.html', 8.7, '伦理', 0, 3055);
INSERT INTO `tv_series_data` VALUES (1177056498, '爱情二十年', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/3/9642/5dc861f3c4cf4a06c2a608a84cd5e424.jpg', 'https://tv.2345.com/detail/9642.html', 9.4, '伦理', 0, 3076);
INSERT INTO `tv_series_data` VALUES (1183879154, '婆家娘家1', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/14/s43539.jpg', 'https://tv.2345.com/detail/43539.html', 8.5, '家庭', 0, 3467);
INSERT INTO `tv_series_data` VALUES (1187280874, '大将军韩信', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/10/s32551.jpg?1415339948', 'https://tv.2345.com/detail/32551.html', 7.6, '战争', 0, 3688);
INSERT INTO `tv_series_data` VALUES (1188762059, '龙城1937', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/18/s54310.jpg', 'https://tv.2345.com/detail/54310.html', 9.4, '战争', 0, 6398);
INSERT INTO `tv_series_data` VALUES (1190453121, '零号特工', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/611/2fd80ca3d96ceeddc4fe66c80a9e16c5.jpg', 'https://tv.2345.com/detail/611.html', 8.9, '悬疑', 0, 4621);
INSERT INTO `tv_series_data` VALUES (1192014255, '生死相随', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/2778/s2778.jpg', 'https://tv.2345.com/detail/2778.html', 8.8, '战争', 0, 6107);
INSERT INTO `tv_series_data` VALUES (1192869053, '绝地反击', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/19/s58460.jpg', 'https://tv.2345.com/detail/58460.html', 9.1, '战争', 0, 5457);
INSERT INTO `tv_series_data` VALUES (1205174529, '小宝和老财', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/11/s34820.jpg?1398563515', 'https://tv.2345.com/detail/34820.html', 8.4, '战争', 0, 4512);
INSERT INTO `tv_series_data` VALUES (1206088276, '暗战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/0/s2304.jpg?1504063488', 'https://tv.2345.com/detail/2304.html', 8.9, '悬疑', 0, 4364);
INSERT INTO `tv_series_data` VALUES (1206368222, '最后的子弹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/2313/a032b0ada3263bfd0fd81a37f3cdd676.jpg', 'https://tv.2345.com/detail/2313.html', 9.2, '伦理', 0, 6880);
INSERT INTO `tv_series_data` VALUES (1211011623, '下海', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/1/5326/1ee76ec556f916d9295ae74c5911a13e.jpg', 'https://tv.2345.com/detail/5326.html', 9.5, '家庭', 0, 6861);
INSERT INTO `tv_series_data` VALUES (1211645677, '二号交通站', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/10/s32602.jpg?1415340646', 'https://tv.2345.com/detail/32602.html', 7.7, '战争', 0, 4053);
INSERT INTO `tv_series_data` VALUES (1224512490, '女人魂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/0/s84.jpg?1398411422', 'https://tv.2345.com/detail/84.html', 8.8, '战争', 0, 7727);
INSERT INTO `tv_series_data` VALUES (1227758655, '乔省长和他的女儿们', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/3/9620/ea63ff0682a3ecc874f88d315d8ba176.jpg', 'https://tv.2345.com/detail/9620.html', 10, '家庭', 0, 3461);
INSERT INTO `tv_series_data` VALUES (1227758809, '大宋北斗司', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/18/s55934.jpg', 'https://tv.2345.com/detail/55934.html', 9.8, '悬疑', 0, 4038);
INSERT INTO `tv_series_data` VALUES (1228459624, '单亲之家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/16/s48869.jpg', 'https://tv.2345.com/detail/48869.html', 9.3, '家庭', 0, 5960);
INSERT INTO `tv_series_data` VALUES (1228555755, '暗香', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/0/s9.jpg?1372921570', 'https://tv.2345.com/detail/9.html', 9.2, '家庭', 0, 7438);
INSERT INTO `tv_series_data` VALUES (1229784238, '晚婚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/830/bc130da9ed0a331b53f48fd1cf28b963.jpg', 'https://tv.2345.com/detail/830.html', 9, '伦理', 0, 7605);
INSERT INTO `tv_series_data` VALUES (1230246712, '代号未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/16/s49295.jpg', 'https://tv.2345.com/detail/49295.html', 8.2, '战争', 0, 7884);
INSERT INTO `tv_series_data` VALUES (1234370395, '波涛汹涌', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/3/10106/422bc95a8118f32476cdd50d9404eec1.jpg', 'https://tv.2345.com/detail/10106.html', 6.4, '军旅', 0, 6784);
INSERT INTO `tv_series_data` VALUES (1235497037, '雪豹坚强岁月', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/13/s41024.jpg?1409551831', 'https://tv.2345.com/detail/41024.html', 8.6, '战争', 0, 5416);
INSERT INTO `tv_series_data` VALUES (1235965491, '玻钻之争', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/1/s3891.jpg', 'https://tv.2345.com/detail/3891.html', 9, '家庭', 0, 6733);
INSERT INTO `tv_series_data` VALUES (1236906022, '毒刺', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/1706/d588484d61784af554bf4cbec60af9eb.jpg', 'https://tv.2345.com/detail/1706.html', 8.8, '军旅', 0, 6817);
INSERT INTO `tv_series_data` VALUES (1238633905, '特战先锋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/627/8119fe30e95d0b0ad37fadb7ddfde5ff.jpg', 'https://tv.2345.com/detail/627.html', 9.2, '战争', 0, 7308);
INSERT INTO `tv_series_data` VALUES (1240487222, '绝地刀锋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/15/s46377.jpg', 'https://tv.2345.com/detail/46377.html', 8.4, '悬疑', 0, 6938);
INSERT INTO `tv_series_data` VALUES (1243894638, '活着乐着', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/2/8640/4ad6164da0bad0c9f194fe03e2583993.jpg', 'https://tv.2345.com/detail/8640.html', 10, '家庭', 0, 6213);
INSERT INTO `tv_series_data` VALUES (1246834837, '爱可以重来', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/9/s28553.jpg?1388990357', 'https://tv.2345.com/detail/28553.html', 8.5, '家庭', 0, 7432);
INSERT INTO `tv_series_data` VALUES (1250647770, '带着爸爸去留学', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/18/s56026.jpg?1555487741', 'https://tv.2345.com/detail/56026.html', 8.6, '家庭', 0, 4630);
INSERT INTO `tv_series_data` VALUES (1256141232, '江塘集中营', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/3/9720/820b3c1bb3af1fbef9ff04ff700c3216.jpg', 'https://tv.2345.com/detail/9720.html', 7.7, '战争', 0, 7299);
INSERT INTO `tv_series_data` VALUES (1256187221, '八角亭谜雾', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/20/s60991.jpg', 'https://tv.2345.com/detail/60991.html', 9.6, '悬疑', 0, 4415);
INSERT INTO `tv_series_data` VALUES (1256565816, '凝香劫', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/2312/3ef64225df1bd7c862aaaef1d9b8057e.jpg', 'https://tv.2345.com/detail/2312.html', 8.8, '家庭', 0, 7688);
INSERT INTO `tv_series_data` VALUES (1259768293, '我的极品老妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/1/a.jpg', 'https://tv.2345.com/detail/18910.html', 9.2, '家庭', 0, 5314);
INSERT INTO `tv_series_data` VALUES (1261536850, '奇迹的女儿', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/18/s56023.jpg', 'https://tv.2345.com/detail/56023.html', 9.8, '家庭', 0, 7325);
INSERT INTO `tv_series_data` VALUES (1265668172, '婚内外', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/2198/fe38fc4304d2d64ec079aee448fd3bd5.jpg', 'https://tv.2345.com/detail/17348.html', 9.2, '家庭', 0, 3489);
INSERT INTO `tv_series_data` VALUES (1265994417, '把日子过好', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/2/s7485.jpg?1410419799', 'https://tv.2345.com/detail/7485.html', 9.2, '家庭', 0, 5542);
INSERT INTO `tv_series_data` VALUES (1271150230, '想见你', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/19/s57046.jpg', 'https://tv.2345.com/detail/57046.html', 9.8, '悬疑', 0, 6916);
INSERT INTO `tv_series_data` VALUES (1271617206, '女人心事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/2/8639/70a989c128f9d477032da5fd249ce3ea.jpg', 'https://tv.2345.com/detail/8639.html', 9.1, '伦理', 0, 5614);
INSERT INTO `tv_series_data` VALUES (1272353118, '家的N次方', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/2/8525/e8ecb24d14544849d9edbff6a3461004.jpg', 'https://tv.2345.com/detail/8525.html', 9.5, '家庭', 0, 7531);
INSERT INTO `tv_series_data` VALUES (1273593198, '要过好日子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/2/7839/01339ef8225c50594cc8c3ec7d094530.jpg', 'https://tv.2345.com/detail/7839.html', 8.6, '伦理', 0, 3835);
INSERT INTO `tv_series_data` VALUES (1277314655, '暖阳之下', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/20/s61059.jpg', 'https://tv.2345.com/detail/61059.html', 7.9, '家庭', 0, 6543);
INSERT INTO `tv_series_data` VALUES (1280146245, '像风一样离去', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/1238/2932bb0f61f8be8bef80c6cd5d72c3ae.jpg', 'https://tv.2345.com/detail/1238.html', 8.8, '家庭', 0, 6661);
INSERT INTO `tv_series_data` VALUES (1281785276, '爸妈都是老党员', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/2/6952/3773e1990f62ac2c9444b6b3d8fd5464.jpg', 'https://tv.2345.com/detail/6952.html', 7.7, '战争', 0, 3419);
INSERT INTO `tv_series_data` VALUES (1292082002, '红妆', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/1/4549/5ca1a49e78c1bdcfb0cb503d078c0175.jpg', 'https://tv.2345.com/detail/4549.html', 9, '悬疑', 0, 6287);
INSERT INTO `tv_series_data` VALUES (1298329661, '裂变', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/5/s15653.jpg?1369187786', 'https://tv.2345.com/detail/15653.html', 8.7, '战争', 0, 7633);
INSERT INTO `tv_series_data` VALUES (1298396512, '生死谍恋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/313/f7ad32ddbab2962b1abbed8f4581a023.jpg', 'https://tv.2345.com/detail/313.html', 9.3, '战争', 0, 6303);
INSERT INTO `tv_series_data` VALUES (1298890393, '记忆之城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/7/7.jpg', 'https://tv.2345.com/detail/17329.html', 9.6, '家庭', 0, 5455);
INSERT INTO `tv_series_data` VALUES (1301938498, '终极使命', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/3/s9052.jpg?1473732071', 'https://tv.2345.com/detail/9052.html', 8.3, '战争', 0, 7194);
INSERT INTO `tv_series_data` VALUES (1302522757, '真相内地版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/15/s45085.jpg', 'https://tv.2345.com/detail/45085.html', 6.5, '家庭', 0, 4639);
INSERT INTO `tv_series_data` VALUES (1303611394, '第十二秒', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/20/s61049.jpg', 'https://tv.2345.com/detail/61049.html', 8.3, '悬疑', 0, 3466);
INSERT INTO `tv_series_data` VALUES (1304529601, '故梦', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/95/6858795962ee9f2e8cc5bb240d235062.jpg', 'https://tv.2345.com/detail/95.html', 9.5, '伦理', 0, 6683);
INSERT INTO `tv_series_data` VALUES (1313069294, '山里红', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/2/7637/6f9058d7e563319a9cfc80e592ade7a4.jpg', 'https://tv.2345.com/detail/7637.html', 9.2, '战争', 0, 6301);
INSERT INTO `tv_series_data` VALUES (1315034936, '大珍珠', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/1374/8f210e3740dad8d37f63322d99bde475.jpg', 'https://tv.2345.com/detail/1374.html', 8.7, '家庭', 0, 3265);
INSERT INTO `tv_series_data` VALUES (1316246716, '家有儿女3', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/e/3.jpg', 'https://tv.2345.com/detail/2030.html', 9.1, '家庭', 0, 6109);
INSERT INTO `tv_series_data` VALUES (1317640961, '祈望', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/1319/d7d66220bc2103f4cf189d614940eafa.jpg', 'https://tv.2345.com/detail/1319.html', 9.4, '伦理', 0, 4069);
INSERT INTO `tv_series_data` VALUES (1319275800, '血雨母子情完整版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/7/s22234.jpg?1410420805', 'https://tv.2345.com/detail/22234.html', 8, '战争', 0, 6924);
INSERT INTO `tv_series_data` VALUES (1322694599, '回家的欲望卫视版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/16/s49121.jpg', 'https://tv.2345.com/detail/49121.html', 7.6, '伦理', 0, 6626);
INSERT INTO `tv_series_data` VALUES (1326563422, '螳螂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/923/2691c1479e27d34716a71d6ce487856f.jpg', 'https://tv.2345.com/detail/923.html', 9, '战争', 0, 4875);
INSERT INTO `tv_series_data` VALUES (1327506410, '遍地英雄DVD', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/18/s54416.jpg', 'https://tv.2345.com/detail/54416.html', 7.3, '战争', 0, 7233);
INSERT INTO `tv_series_data` VALUES (1329526896, '英雄孟良崮', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/18/s55143.jpg', 'https://tv.2345.com/detail/55143.html', 9.2, '战争', 0, 4701);
INSERT INTO `tv_series_data` VALUES (1329726913, '生死桥', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/14/s42000.jpg', 'https://tv.2345.com/detail/42000.html', 8.5, '伦理', 0, 3306);
INSERT INTO `tv_series_data` VALUES (1333437653, '征服太阳普通话版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/19/s58975.jpg', 'https://tv.2345.com/detail/58975.html', 9, '家庭', 0, 3702);
INSERT INTO `tv_series_data` VALUES (1336569230, '铁血军魂2017版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/17/s52863.jpg?1490593914', 'https://tv.2345.com/detail/52863.html', 8.6, '战争', 0, 7156);
INSERT INTO `tv_series_data` VALUES (1338911241, '星火', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/3/10260/2b302ee4df3c3130a9648472aa0fb8a9.jpg', 'https://tv.2345.com/detail/10260.html', 9.8, '战争', 0, 5416);
INSERT INTO `tv_series_data` VALUES (1342046719, '伪装者TV剪辑版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/16/s50093.jpg', 'https://tv.2345.com/detail/50093.html', 9.6, '战争', 0, 3724);
INSERT INTO `tv_series_data` VALUES (1344581936, '神府红军游击队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/2/7352/a74958e187dacc079d3adae7eb96eff7.jpg', 'https://tv.2345.com/detail/7352.html', 8.8, '战争', 0, 5922);
INSERT INTO `tv_series_data` VALUES (1346892473, '边城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/12/s36602.jpg?1403228895', 'https://tv.2345.com/detail/36602.html', 8.5, '战争', 0, 6799);
INSERT INTO `tv_series_data` VALUES (1346942126, '家道颖颖之大考2020', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/19/s59032.jpg', 'https://tv.2345.com/detail/59032.html', 7.8, '其他', 0, 5372);
INSERT INTO `tv_series_data` VALUES (1350119075, '麻雀春天', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/15/s45899.jpg', 'https://tv.2345.com/detail/45899.html', 8.2, '悬疑', 0, 5915);
INSERT INTO `tv_series_data` VALUES (1350381035, '前妻回家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/1689/bf6ce658273f79d296396fcc6cc74eff.jpg', 'https://tv.2345.com/detail/1689.html', 9, '家庭', 0, 3155);
INSERT INTO `tv_series_data` VALUES (1350731754, '电视剧《雄关漫道》', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/18/s56488.jpg', 'https://tv.2345.com/detail/56488.html', 8.2, '战争', 0, 4418);
INSERT INTO `tv_series_data` VALUES (1352054435, '勇者无敌', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/523/fa5480466c37b9655a908bfd1925837b.jpg', 'https://tv.2345.com/detail/523.html', 9.3, '战争', 0, 5215);
INSERT INTO `tv_series_data` VALUES (1362203400, '红毛巾', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/3/10157/8256a50a4c6e0da16b2f6407363dc00e.jpg', 'https://tv.2345.com/detail/10157.html', 8.7, '战争', 0, 4985);
INSERT INTO `tv_series_data` VALUES (1363800458, '胭脂雪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/40/51fb866b4d5e0ba4838314b7ae7453d7.jpg', 'https://tv.2345.com/detail/40.html', 7.5, '家庭', 0, 4789);
INSERT INTO `tv_series_data` VALUES (1370553090, '守望心灵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/15/s47533.jpg', 'https://tv.2345.com/detail/47533.html', 8.7, '家庭', 0, 3725);
INSERT INTO `tv_series_data` VALUES (1370993538, '东方战场未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/16/s48936.jpg', 'https://tv.2345.com/detail/48936.html', 8.6, '战争', 0, 4571);
INSERT INTO `tv_series_data` VALUES (1371483281, '首富', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/2/6898/4962a6cc719559883f6c2308f2db4092.jpg', 'https://tv.2345.com/detail/6898.html', 9.5, '家庭', 0, 3692);
INSERT INTO `tv_series_data` VALUES (1376186886, '青春集结号未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/15/s47176.jpg', 'https://tv.2345.com/detail/47176.html', 8.6, '军旅', 0, 4662);
INSERT INTO `tv_series_data` VALUES (1380253834, '人活一张脸', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/96/7741ecb67852f38fc48ecc1b4b78b5e9.jpg', 'https://tv.2345.com/detail/96.html', 9.6, '伦理', 0, 6327);
INSERT INTO `tv_series_data` VALUES (1384084150, '脱身', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/16/s50464.jpg?1510819009', 'https://tv.2345.com/detail/50464.html', 9.5, '悬疑', 0, 4930);
INSERT INTO `tv_series_data` VALUES (1385999121, '幸福来敲门央视版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/2/s8159.jpg', 'https://tv.2345.com/detail/8159.html', 7.8, '家庭', 0, 3131);
INSERT INTO `tv_series_data` VALUES (1387084118, '钟鼓楼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/1/4487/93f617c58940bd2c5b98ee97b67617ef.jpg', 'https://tv.2345.com/detail/4487.html', 9.4, '家庭', 0, 7352);
INSERT INTO `tv_series_data` VALUES (1394470947, '俺爹是卧底', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/17/s52658.jpg?1487561103', 'https://tv.2345.com/detail/52658.html', 8.2, '战争', 0, 7780);
INSERT INTO `tv_series_data` VALUES (1395597667, '柳树屯', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/2/6398/7951199dcc71635270d8bf96823a2dcd.jpg', 'https://tv.2345.com/detail/6398.html', 8.8, '伦理', 0, 4026);
INSERT INTO `tv_series_data` VALUES (1396026502, '江阴要塞', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/1/4449/f932e57db6e915fdd59dc62aae79a2e4.jpg', 'https://tv.2345.com/detail/4449.html', 9.1, '军旅', 0, 4511);
INSERT INTO `tv_series_data` VALUES (1401551321, '罪恶消亡史', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/18/s56037.jpg', 'https://tv.2345.com/detail/56037.html', 9.8, '悬疑', 0, 7151);
INSERT INTO `tv_series_data` VALUES (1406094412, '我要一个家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/0/s2036.jpg', 'https://tv.2345.com/detail/2036.html', 9.1, '家庭', 0, 4272);
INSERT INTO `tv_series_data` VALUES (1406110118, '垂直打击', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/1/4571/37e514867c8608716c81051ed1dfc8e4.jpg', 'https://tv.2345.com/detail/4571.html', 9.4, '战争', 0, 7067);
INSERT INTO `tv_series_data` VALUES (1409842235, '追击者', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/3/s9601.jpg?1467858963', 'https://tv.2345.com/detail/9601.html', 8.4, '战争', 0, 3735);
INSERT INTO `tv_series_data` VALUES (1410581364, '红楼梦2001版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/2/s6807.jpg', 'https://tv.2345.com/detail/6807.html', 8.2, '家庭', 0, 7567);
INSERT INTO `tv_series_data` VALUES (1411996546, '原乡', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/10/s30221.jpg?1394534357', 'https://tv.2345.com/detail/30221.html', 8.6, '家庭', 0, 3924);
INSERT INTO `tv_series_data` VALUES (1414331327, '郎心如铁', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/1828/2688585141c3546e3cfc0000a5a31b45.jpg', 'https://tv.2345.com/detail/1828.html', 9.6, '伦理', 0, 7529);
INSERT INTO `tv_series_data` VALUES (1417260905, '关中女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/3/9624/17a3ea7079e6caeafa7bdd2b48bb0461.jpg', 'https://tv.2345.com/detail/9624.html', 9.3, '家庭', 0, 3240);
INSERT INTO `tv_series_data` VALUES (1419918400, '火线出击下', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/17/s52872.jpg', 'https://tv.2345.com/detail/52872.html', 8.6, '军旅', 0, 5538);
INSERT INTO `tv_series_data` VALUES (1421282451, '大漠苍狼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/15/s45148.jpg?1419314103', 'https://tv.2345.com/detail/45148.html', 8.4, '战争', 0, 7652);
INSERT INTO `tv_series_data` VALUES (1421707944, '我的特一营', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/13/s41023.jpg?1409551289', 'https://tv.2345.com/detail/41023.html', 8.6, '战争', 0, 5078);
INSERT INTO `tv_series_data` VALUES (1425676692, '依然爱你', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/1/3682/e7af81a0debe2e54149b04b925de173e.jpg', 'https://tv.2345.com/detail/3682.html', 8.5, '家庭', 0, 6851);
INSERT INTO `tv_series_data` VALUES (1426872665, '一双绣花鞋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/1/4289/932847dee069a1d94a4cc48c75623e3d.jpg', 'https://tv.2345.com/detail/4289.html', 9.1, '悬疑', 0, 7337);
INSERT INTO `tv_series_data` VALUES (1428050841, '春暖花开', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/1875/d3b385f67ab78469a9b37cc0175c88af.jpg', 'https://tv.2345.com/detail/1875.html', 9, '伦理', 0, 5493);
INSERT INTO `tv_series_data` VALUES (1434474768, '纯白', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/15/s45430.jpg', 'https://tv.2345.com/detail/45430.html', 7.5, '其他', 0, 4721);
INSERT INTO `tv_series_data` VALUES (1434928189, '嘿你大事很妙', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/20/s60933.jpg', 'https://tv.2345.com/detail/60933.html', 9.7, '家庭', 0, 6630);
INSERT INTO `tv_series_data` VALUES (1435869391, '天目危机', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/20/s60826.jpg', 'https://tv.2345.com/detail/60826.html', 7.4, '悬疑', 0, 3410);
INSERT INTO `tv_series_data` VALUES (1436858456, '铁骨芳心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/1792/8f8d49897167092f0578b03fcc346b3f.jpg', 'https://tv.2345.com/detail/1792.html', 8.2, '悬疑', 0, 7303);
INSERT INTO `tv_series_data` VALUES (1441855848, 'OhMyLady', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/6/c.jpg', 'https://tv.2345.com/detail/9900.html', 8.4, '家庭', 0, 5788);
INSERT INTO `tv_series_data` VALUES (1442233049, '漂亮的事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/1368/cae4029a6bb5572c0dd283b5ee87a47f.jpg', 'https://tv.2345.com/detail/1368.html', 10, '家庭', 0, 4803);
INSERT INTO `tv_series_data` VALUES (1454304186, '桐籽花开', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/4/12373/d58749d72fe83b6cacbebb27e5bbd67e.jpg', 'https://tv.2345.com/detail/12373.html', 8.8, '家庭', 0, 5186);
INSERT INTO `tv_series_data` VALUES (1455700729, '海诗行动', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/18/s56301.jpg', 'https://tv.2345.com/detail/56301.html', 9.8, '战争', 0, 4618);
INSERT INTO `tv_series_data` VALUES (1459024713, '有泪悄悄流', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/410/b1f4f92af1ae1886f835b1f8f06aeef3.jpg', 'https://tv.2345.com/detail/410.html', 8.8, '家庭', 0, 3013);
INSERT INTO `tv_series_data` VALUES (1461061247, '当铺', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/0/s2578.jpg?1366102218', 'https://tv.2345.com/detail/2578.html', 8.5, '悬疑', 0, 3555);
INSERT INTO `tv_series_data` VALUES (1462228900, '情感背后', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/2/s6926.jpg', 'https://tv.2345.com/detail/6926.html', 8.8, '家庭', 0, 7800);
INSERT INTO `tv_series_data` VALUES (1465598437, '心火', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/1/3127/c05c1e3794b125c8ffe184db9c207f0d.jpg', 'https://tv.2345.com/detail/3127.html', 9.4, '伦理', 0, 7550);
INSERT INTO `tv_series_data` VALUES (1465763097, '女子监狱第1季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/11/s35022.jpg?1415183783', 'https://tv.2345.com/detail/35022.html', 8.6, '家庭', 0, 6231);
INSERT INTO `tv_series_data` VALUES (1473699644, '因为爱情有幸福未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/15/s47991.jpg', 'https://tv.2345.com/detail/47991.html', 8.6, '家庭', 0, 7043);
INSERT INTO `tv_series_data` VALUES (1475731503, '电视剧《警察故事》', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/18/s56467.jpg', 'https://tv.2345.com/detail/56467.html', 8.4, '家庭', 0, 5587);
INSERT INTO `tv_series_data` VALUES (1476912280, '武陵山剿匪记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/2/6366/c0df042a0cfe6e7fa70a36226b2aa0e7.jpg', 'https://tv.2345.com/detail/6366.html', 8.8, '战争', 0, 6755);
INSERT INTO `tv_series_data` VALUES (1480735420, '马文的战争', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/573/58a5cb3e819ec850516300b2a671f996.jpg', 'https://tv.2345.com/detail/573.html', 8.8, '家庭', 0, 4068);
INSERT INTO `tv_series_data` VALUES (1483986978, '昙花梦', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/15/s46364.jpg?1464751209', 'https://tv.2345.com/detail/46364.html', 8.5, '战争', 0, 6407);
INSERT INTO `tv_series_data` VALUES (1489104215, '陈云在临江', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/18/s54713.jpg', 'https://tv.2345.com/detail/54713.html', 9.3, '战争', 0, 6933);
INSERT INTO `tv_series_data` VALUES (1489112096, '夫妻密码', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/689/ba0e10dd135f46b19c419e0b329ed910.jpg', 'https://tv.2345.com/detail/689.html', 8.7, '家庭', 0, 4238);
INSERT INTO `tv_series_data` VALUES (1490564400, '星火云雾街', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/18/s55753.jpg', 'https://tv.2345.com/detail/55753.html', 8.8, '战争', 0, 5975);
INSERT INTO `tv_series_data` VALUES (1490606467, '秘密列车', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/1339/ac088592eb13410ae8cee64e80dbc2f9.jpg', 'https://tv.2345.com/detail/1339.html', 9.1, '悬疑', 0, 3952);
INSERT INTO `tv_series_data` VALUES (1494049321, '岁岁轻寒', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/18/s56105.jpg', 'https://tv.2345.com/detail/56105.html', 9.8, '家庭', 0, 5453);
INSERT INTO `tv_series_data` VALUES (1496195612, '同在屋檐下', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/8/s26147.jpg?1381455864', 'https://tv.2345.com/detail/26147.html', 8.4, '家庭', 0, 5398);
INSERT INTO `tv_series_data` VALUES (1497700634, '走出硝烟的女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/449611/1348833815/0d3ebeaf6a6db8a42f0bb29221580e90.jpg', 'https://tv.2345.com/detail/14993.html', 8.8, '战争', 0, 6994);
INSERT INTO `tv_series_data` VALUES (1501691639, '漂亮女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/628/63c71dcd99090b3850cf622aa4b48de1.jpg', 'https://tv.2345.com/detail/628.html', 6.2, '家庭', 0, 5812);
INSERT INTO `tv_series_data` VALUES (1505424486, '好想回家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/2/6931/0a4489cca482c25e69674878ed30b352.jpg', 'https://tv.2345.com/detail/6931.html', 10, '家庭', 0, 6025);
INSERT INTO `tv_series_data` VALUES (1509083765, '红色摇篮', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/3/11529/e37cc47c04bf0936d5b8aeaa0462adc0.jpg', 'https://tv.2345.com/detail/11529.html', 10, '战争', 0, 7044);
INSERT INTO `tv_series_data` VALUES (1510346879, '我的父亲我的兵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/18/s54462.jpg?1517802040', 'https://tv.2345.com/detail/54462.html', 8.7, '战争', 0, 6714);
INSERT INTO `tv_series_data` VALUES (1511080809, '圆圆的故事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/17/s52080.jpg', 'https://tv.2345.com/detail/52080.html', 8.8, '家庭', 0, 6254);
INSERT INTO `tv_series_data` VALUES (1511105993, '母爱如山', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/18/s56347.jpg', 'https://tv.2345.com/detail/56347.html', 8.8, '家庭', 0, 4724);
INSERT INTO `tv_series_data` VALUES (1511783677, '男保姆', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/1/4480/39b7028b770fe58451a9fd896ee4a8a3.jpg', 'https://tv.2345.com/detail/4480.html', 8, '家庭', 0, 3450);
INSERT INTO `tv_series_data` VALUES (1515965935, '密战无声', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/18/s54948.jpg', 'https://tv.2345.com/detail/54948.html', 8.8, '悬疑', 0, 5611);
INSERT INTO `tv_series_data` VALUES (1516519355, '生死与轮回', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/15/s45534.jpg', 'https://tv.2345.com/detail/45534.html', 7.5, '其他', 0, 6667);
INSERT INTO `tv_series_data` VALUES (1518784269, '悍城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/18/s55377.jpg', 'https://tv.2345.com/detail/55377.html', 9.3, '悬疑', 0, 5074);
INSERT INTO `tv_series_data` VALUES (1521770900, '孤胆英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/15/s46201.jpg?1430892886', 'https://tv.2345.com/detail/46201.html', 8.5, '战争', 0, 3954);
INSERT INTO `tv_series_data` VALUES (1522104852, '炊事班的故事第一部短剧版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/19/s57040.jpg', 'https://tv.2345.com/detail/57040.html', 7.4, '军旅', 0, 3509);
INSERT INTO `tv_series_data` VALUES (1522358832, '哭也不流泪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/2181/43784501d93ebfd6d77a5e51a9af7d44.jpg', 'https://tv.2345.com/detail/2181.html', 8.7, '家庭', 0, 5504);
INSERT INTO `tv_series_data` VALUES (1523268492, '群英会', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/2147/5b700c0a01e61c0aa95f1f539b9e77f3.jpg', 'https://tv.2345.com/detail/2147.html', 10, '家庭', 0, 3260);
INSERT INTO `tv_series_data` VALUES (1523857069, '断头谷第2季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/13/s41846.jpg', 'https://tv.2345.com/detail/41846.html', 8.6, '悬疑', 0, 6087);
INSERT INTO `tv_series_data` VALUES (1527719594, '幸福里的故事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/19/s58103.jpg', 'https://tv.2345.com/detail/58103.html', 9.4, '家庭', 0, 5908);
INSERT INTO `tv_series_data` VALUES (1533512566, '绝地枪王2TV剪辑版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/17/s52810.jpg', 'https://tv.2345.com/detail/52810.html', 8.4, '战争', 0, 3792);
INSERT INTO `tv_series_data` VALUES (1534254025, '啼笑因缘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/3/10239/bd4dac4d35f1457ae13208fe7d2024a6.jpg', 'https://tv.2345.com/detail/10239.html', 9, '家庭', 0, 6190);
INSERT INTO `tv_series_data` VALUES (1541863308, '快乐制造第一季之快乐图书馆', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/15/s46119.jpg', 'https://tv.2345.com/detail/46119.html', 8, '其他', 0, 5882);
INSERT INTO `tv_series_data` VALUES (1542363583, '戴着面具跳舞', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/2/s8386.jpg?1362650907', 'https://tv.2345.com/detail/8386.html', 9.1, '家庭', 0, 5212);
INSERT INTO `tv_series_data` VALUES (1542571150, '老兵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/6/s19934.jpg?1393548770', 'https://tv.2345.com/detail/19934.html', 8.7, '战争', 0, 5920);
INSERT INTO `tv_series_data` VALUES (1545215824, '血雨母子情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/7/s21153.jpg?1366683160', 'https://tv.2345.com/detail/21153.html', 8.8, '战争', 0, 6450);
INSERT INTO `tv_series_data` VALUES (1547042193, '兄弟无间', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/2004/430fe0ef01b70b0a47794b8bf28dc951.jpg', 'https://tv.2345.com/detail/2004.html', 8.6, '伦理', 0, 6180);
INSERT INTO `tv_series_data` VALUES (1547701547, '刷新3+7', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/450464/1351393806/ab58c9c8d0eb5a03074bd6c1bc0beb63.jpg', 'https://tv.2345.com/detail/16225.html', 9.2, '伦理', 0, 6135);
INSERT INTO `tv_series_data` VALUES (1552024903, '盘龙卧虎高山顶', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/902/f9a3102a674d27c9f9570296e3186b18.jpg', 'https://tv.2345.com/detail/902.html', 9.3, '战争', 0, 4665);
INSERT INTO `tv_series_data` VALUES (1552155548, '嫂子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/2/7877/07e97abb5cfe2522716f987d5ce06381.jpg', 'https://tv.2345.com/detail/7877.html', 8.7, '伦理', 0, 4212);
INSERT INTO `tv_series_data` VALUES (1553060226, '彭真', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/15/s45294.jpg', 'https://tv.2345.com/detail/45294.html', 7, '其他', 0, 4117);
INSERT INTO `tv_series_data` VALUES (1553185039, '瓷都人之山路弯弯', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/20/s61359.jpg', 'https://tv.2345.com/detail/61359.html', 8.6, '其他', 0, 4658);
INSERT INTO `tv_series_data` VALUES (1557607397, '黄文秀', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/19/s59231.jpg', 'https://tv.2345.com/detail/59231.html', 8.8, '其他', 0, 6497);
INSERT INTO `tv_series_data` VALUES (1561806565, '因为遇见你DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/17/s53124.jpg', 'https://tv.2345.com/detail/53124.html', 8.6, '家庭', 0, 4984);
INSERT INTO `tv_series_data` VALUES (1562268396, '功夫战警', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/19/s58771.jpg', 'https://tv.2345.com/detail/58771.html', 9.8, '悬疑', 0, 5659);
INSERT INTO `tv_series_data` VALUES (1564461496, '皎洁的月亮', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/3/11640/47cba95164fdbe454addb28fe8b70971.jpg', 'https://tv.2345.com/detail/11640.html', 8.7, '战争', 0, 6123);
INSERT INTO `tv_series_data` VALUES (1565292309, '红粉世家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/2/8516/96ad6114093fc1697cc61dc94b47b33f.jpg', 'https://tv.2345.com/detail/8516.html', 9.2, '家庭', 0, 7271);
INSERT INTO `tv_series_data` VALUES (1565940824, '哭也不流泪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/2181/43784501d93ebfd6d77a5e51a9af7d44.jpg', 'https://tv.2345.com/detail/2181.html', 8.7, '伦理', 0, 7798);
INSERT INTO `tv_series_data` VALUES (1567347995, '边关烽火情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/11/s33250.jpg?1428574178', 'https://tv.2345.com/detail/33250.html', 8.4, '战争', 0, 4757);
INSERT INTO `tv_series_data` VALUES (1567856966, '对手', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/82/feed7b09e51ba79ddd8700433226eed9.jpg', 'https://tv.2345.com/detail/82.html', 9.7, '战争', 0, 5416);
INSERT INTO `tv_series_data` VALUES (1573195576, '上海迷雾', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/1/s4420.jpg?1410419598', 'https://tv.2345.com/detail/4420.html', 8.8, '战争', 0, 7132);
INSERT INTO `tv_series_data` VALUES (1574301952, '乱世丽人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/1/s4610.jpg?1374056848', 'https://tv.2345.com/detail/4610.html', 9.2, '家庭', 0, 3116);
INSERT INTO `tv_series_data` VALUES (1575923087, '满堂爹娘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/137/8f5240c6fb2401aedae6685366ea5d61.jpg', 'https://tv.2345.com/detail/137.html', 9.6, '家庭', 0, 4706);
INSERT INTO `tv_series_data` VALUES (1576366197, '唐山大地震2013版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/7/s21445.jpg?1367558973', 'https://tv.2345.com/detail/21445.html', 9.2, '家庭', 0, 7115);
INSERT INTO `tv_series_data` VALUES (1577975963, '秋收起义', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/16/s50280.jpg?1500009258', 'https://tv.2345.com/detail/50280.html', 8.9, '战争', 0, 4230);
INSERT INTO `tv_series_data` VALUES (1585622643, '妈妈像花儿一样', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/15/s47043.jpg?1443597925', 'https://tv.2345.com/detail/47043.html', 8.6, '家庭', 0, 3461);
INSERT INTO `tv_series_data` VALUES (1585903224, '黑冰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/832/f142168b1c87a11fc7d5636b4b31e5d9.jpg', 'https://tv.2345.com/detail/832.html', 9.4, '悬疑', 0, 7452);
INSERT INTO `tv_series_data` VALUES (1588239105, '夜半歌声', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/2/7457/85d62a72b377c1d98a13c8ae338b06ee.png', 'https://tv.2345.com/detail/7457.html', 8.9, '家庭', 0, 4774);
INSERT INTO `tv_series_data` VALUES (1590459546, '我要一个家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/0/s2036.jpg', 'https://tv.2345.com/detail/2036.html', 9.1, '伦理', 0, 7637);
INSERT INTO `tv_series_data` VALUES (1594208900, '剧星来了', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/18/s55971.jpg', 'https://tv.2345.com/detail/55971.html', 7.5, '其他', 0, 3789);
INSERT INTO `tv_series_data` VALUES (1599566502, '烈火', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/1/s5264.jpg', 'https://tv.2345.com/detail/5264.html', 8.8, '战争', 0, 5070);
INSERT INTO `tv_series_data` VALUES (1600114323, '异能家庭', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/16/s50454.jpg?1484285675', 'https://tv.2345.com/detail/50454.html', 8.2, '家庭', 0, 3137);
INSERT INTO `tv_series_data` VALUES (1601549651, '逗吧逗把街精选版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/16/s49189.jpg', 'https://tv.2345.com/detail/49189.html', 8.8, '家庭', 0, 3657);
INSERT INTO `tv_series_data` VALUES (1601660284, '复婚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/391/52088ace8effc4ced453820b3c5942c6.jpg', 'https://tv.2345.com/detail/391.html', 8.7, '伦理', 0, 7544);
INSERT INTO `tv_series_data` VALUES (1607960948, '赶走你的忧郁', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/158/b7c7d7882bac28a13b47cef02a4e0a1f.jpg', 'https://tv.2345.com/detail/158.html', 9.3, '家庭', 0, 5827);
INSERT INTO `tv_series_data` VALUES (1614276612, '守婚如玉', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/15/s47624.jpg?1449125635', 'https://tv.2345.com/detail/47624.html', 8.6, '家庭', 0, 6727);
INSERT INTO `tv_series_data` VALUES (1618583061, '巍巍兴安岭', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/15/s45494.jpg?1422515105', 'https://tv.2345.com/detail/45494.html', 6.1, '战争', 0, 7941);
INSERT INTO `tv_series_data` VALUES (1622305544, '你是我爱人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/2/6724/0fdf04fc7da35686afb99284afdd1d88.jpg', 'https://tv.2345.com/detail/6724.html', 8.9, '伦理', 0, 5672);
INSERT INTO `tv_series_data` VALUES (1624273927, '挚爱奇缘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/1/4359/bd6a00cb4b81501273d0f7ac7291b27b.jpg', 'https://tv.2345.com/detail/4359.html', 8.8, '伦理', 0, 7110);
INSERT INTO `tv_series_data` VALUES (1625343512, '松花江上', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/343/bc24f2d1b60ed63470959ff2d00497d6.jpg', 'https://tv.2345.com/detail/343.html', 8.8, '战争', 0, 7461);
INSERT INTO `tv_series_data` VALUES (1627214360, '战火西北狼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/5/3.jpg', 'https://tv.2345.com/detail/12039.html', 8.8, '战争', 0, 5954);
INSERT INTO `tv_series_data` VALUES (1630773145, '古城谍影', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/869/78496574cef6b0fb494ef363b3c8b730.jpg', 'https://tv.2345.com/detail/869.html', 9.1, '战争', 0, 6784);
INSERT INTO `tv_series_data` VALUES (1631666402, '我们队伍向太阳', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/1/4270/645f52642dbb3e1dce743ff8346b3f65.jpg', 'https://tv.2345.com/detail/4270.html', 9.1, '军旅', 0, 5874);
INSERT INTO `tv_series_data` VALUES (1639774228, '尖刀队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/3/11404/1af0f5a1a9369bba23084c9823288bca.jpg', 'https://tv.2345.com/detail/11404.html', 8.8, '战争', 0, 6854);
INSERT INTO `tv_series_data` VALUES (1641737624, '炮神', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/16/s50919.jpg', 'https://tv.2345.com/detail/50919.html', 8.9, '战争', 0, 7355);
INSERT INTO `tv_series_data` VALUES (1645002708, '了不起的D小姐国际版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/20/s61458.jpg', 'https://tv.2345.com/detail/61458.html', 7.2, '悬疑', 0, 5500);
INSERT INTO `tv_series_data` VALUES (1645598573, '婚姻背后', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/1353/b03eb84a0ce91ff34e90c9055b4a217c.jpg', 'https://tv.2345.com/detail/1353.html', 9.1, '家庭', 0, 4847);
INSERT INTO `tv_series_data` VALUES (1651950345, '绝恋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/834/s834.jpg', 'https://tv.2345.com/detail/834.html', 8.8, '家庭', 0, 4958);
INSERT INTO `tv_series_data` VALUES (1654057282, '火线出击上', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/17/s52671.jpg?1487832590', 'https://tv.2345.com/detail/52671.html', 8.6, '战争', 0, 6944);
INSERT INTO `tv_series_data` VALUES (1654185884, '闯关东前传2013版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/1/s3096.jpg?1369114956', 'https://tv.2345.com/detail/3096.html', 9, '战争', 0, 6131);
INSERT INTO `tv_series_data` VALUES (1655207403, '傻阿甘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/18/s55102.jpg', 'https://tv.2345.com/detail/55102.html', 9.3, '家庭', 0, 7046);
INSERT INTO `tv_series_data` VALUES (1656424320, '当婚姻走到尽头', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/2/6873/a81e5a2037415e3a07f64c33374e0fcc.jpg', 'https://tv.2345.com/detail/6873.html', 8.8, '伦理', 0, 5380);
INSERT INTO `tv_series_data` VALUES (1658404136, '为爱坚守', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/20/s60938.jpg', 'https://tv.2345.com/detail/60938.html', 8.7, '家庭', 0, 6864);
INSERT INTO `tv_series_data` VALUES (1661144262, '澳门人家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/18/s56963.jpg', 'https://tv.2345.com/detail/56963.html', 9.8, '家庭', 0, 5638);
INSERT INTO `tv_series_data` VALUES (1666478641, '双面胶', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/2/8844/8eebc5ac87588ed2bc2f9bad96177a4a.jpg', 'https://tv.2345.com/detail/8844.html', 9.5, '家庭', 0, 4556);
INSERT INTO `tv_series_data` VALUES (1674012355, '家和万事兴未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/15/s47461.jpg?1447306547', 'https://tv.2345.com/detail/47461.html', 8.5, '家庭', 0, 3910);
INSERT INTO `tv_series_data` VALUES (1679538241, '我们的快乐人生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/3/4.jpg', 'https://tv.2345.com/detail/18824.html', 9.2, '伦理', 0, 5519);
INSERT INTO `tv_series_data` VALUES (1680417320, '塔山阻击战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/2/s6454.jpg?1410419729', 'https://tv.2345.com/detail/6454.html', 8.8, '战争', 0, 5996);
INSERT INTO `tv_series_data` VALUES (1683728104, '金丝猴王国历险记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/3/10169/3b45d4070d2b9216f30ea527aa50c396.jpg', 'https://tv.2345.com/detail/10169.html', 7.7, '其他', 0, 7217);
INSERT INTO `tv_series_data` VALUES (1685690265, '血色玫瑰之女子别动队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/2/s8063.jpg', 'https://tv.2345.com/detail/8063.html', 6.7, '军旅', 0, 4093);
INSERT INTO `tv_series_data` VALUES (1686128522, '热血', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/16/s48223.jpg?1457828152', 'https://tv.2345.com/detail/48223.html', 8.4, '战争', 0, 5654);
INSERT INTO `tv_series_data` VALUES (1689400676, '反抗之真心英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/97/s97.jpg', 'https://tv.2345.com/detail/97.html', 8.8, '战争', 0, 7677);
INSERT INTO `tv_series_data` VALUES (1691624518, '给你我的初次心动', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/20/s61407.jpg', 'https://tv.2345.com/detail/61407.html', 8, '悬疑', 0, 4888);
INSERT INTO `tv_series_data` VALUES (1691644954, '宣言', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/1910/a5afada9e41963c69a16f3e25cf5b975.jpg', 'https://tv.2345.com/detail/1910.html', 8.8, '军旅', 0, 4316);
INSERT INTO `tv_series_data` VALUES (1691679154, '双喜盈门', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/17/s52498.jpg?1498034127', 'https://tv.2345.com/detail/52498.html', 8, '家庭', 0, 7957);
INSERT INTO `tv_series_data` VALUES (1692103628, '明星危情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/153/992540fe8468cfb58dc1083958281e3a.jpg', 'https://tv.2345.com/detail/153.html', 8.7, '家庭', 0, 4398);
INSERT INTO `tv_series_data` VALUES (1700205743, '一路风雨一路情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/18/s56925.png', 'https://tv.2345.com/detail/56925.html', 8.7, '家庭', 0, 3162);
INSERT INTO `tv_series_data` VALUES (1702277439, '密令1949', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/1274/4e8df2c109696908d78a848c2f08c39d.jpg', 'https://tv.2345.com/detail/1274.html', 10, '悬疑', 0, 6622);
INSERT INTO `tv_series_data` VALUES (1704252832, '猴票', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/18/s55981.jpg', 'https://tv.2345.com/detail/55981.html', 9.3, '家庭', 0, 3463);
INSERT INTO `tv_series_data` VALUES (1705813681, '亲爱的爸妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/20/s60793.jpg', 'https://tv.2345.com/detail/60793.html', 9.7, '家庭', 0, 6485);
INSERT INTO `tv_series_data` VALUES (1707155622, '弹孔', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/1057/s1057.jpg', 'https://tv.2345.com/detail/1057.html', 9, '战争', 0, 4194);
INSERT INTO `tv_series_data` VALUES (1708014626, '乌龙山剿匪记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/553/807c0bd006103b844162c587cc434585.jpg', 'https://tv.2345.com/detail/553.html', 9.3, '战争', 0, 6332);
INSERT INTO `tv_series_data` VALUES (1708288654, '零下三十八度', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/9/s27958.jpg?1387158216', 'https://tv.2345.com/detail/27958.html', 8.6, '悬疑', 0, 4451);
INSERT INTO `tv_series_data` VALUES (1708660250, '护宝风云', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/18/s56055.jpg', 'https://tv.2345.com/detail/56055.html', 9.4, '战争', 0, 7688);
INSERT INTO `tv_series_data` VALUES (1708820506, '八路军', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/2/s8406.jpg?1501138065', 'https://tv.2345.com/detail/8406.html', 7.6, '战争', 0, 4523);
INSERT INTO `tv_series_data` VALUES (1712090625, '广告狂人第7季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/11/s34478.jpg?1397527749', 'https://tv.2345.com/detail/34478.html', 8.4, '伦理', 0, 6260);
INSERT INTO `tv_series_data` VALUES (1714117295, '父母见上书', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/6/s19566.jpg?1410420485', 'https://tv.2345.com/detail/19566.html', 6.7, '家庭', 0, 4272);
INSERT INTO `tv_series_data` VALUES (1714811951, '最后的目击者', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/15/s45340.jpg', 'https://tv.2345.com/detail/45340.html', 7.5, '其他', 0, 7511);
INSERT INTO `tv_series_data` VALUES (1723030566, '幸存者', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/4/12490/c76b63a0582b5c438fe1888fa906b10d.jpg', 'https://tv.2345.com/detail/12490.html', 8.8, '战争', 0, 6163);
INSERT INTO `tv_series_data` VALUES (1723674236, '桥隆飙', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/2283/f5752c014ed9486e3114e2849e8568fc.jpg', 'https://tv.2345.com/detail/2283.html', 9.2, '战争', 0, 6300);
INSERT INTO `tv_series_data` VALUES (1726493102, '昙花梦', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/15/s46364.jpg?1464751209', 'https://tv.2345.com/detail/46364.html', 8.5, '悬疑', 0, 3145);
INSERT INTO `tv_series_data` VALUES (1727215048, '双探', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/20/s60891.jpg', 'https://tv.2345.com/detail/60891.html', 9.5, '悬疑', 0, 3002);
INSERT INTO `tv_series_data` VALUES (1734525167, '咱爸咱妈六十年', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/0/s528.jpg?1421636433', 'https://tv.2345.com/detail/528.html', 8.5, '家庭', 0, 6267);
INSERT INTO `tv_series_data` VALUES (1735308049, '上海女性', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/16/s48876.jpg', 'https://tv.2345.com/detail/48876.html', 8.7, '伦理', 0, 6512);
INSERT INTO `tv_series_data` VALUES (1736433921, '玫瑰战争', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/1/s3644.jpg', 'https://tv.2345.com/detail/3644.html', 7.6, '伦理', 0, 4005);
INSERT INTO `tv_series_data` VALUES (1740685046, '非自然死亡', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/18/s54750.jpg', 'https://tv.2345.com/detail/54750.html', 9.4, '悬疑', 0, 7203);
INSERT INTO `tv_series_data` VALUES (1741560500, '石破天惊', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/3/9789/2e199994a35aa25073d53b9f943239e3.jpg', 'https://tv.2345.com/detail/9789.html', 10, '战争', 0, 6018);
INSERT INTO `tv_series_data` VALUES (1742788612, '我在1949等你', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/18/s56905.jpg', 'https://tv.2345.com/detail/56905.html', 9.3, '家庭', 0, 6151);
INSERT INTO `tv_series_data` VALUES (1742990166, '中国故事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/3/s9652.jpg?1466488664', 'https://tv.2345.com/detail/9652.html', 9.4, '家庭', 0, 3869);
INSERT INTO `tv_series_data` VALUES (1743454871, '回家的诱惑全集', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/16/s49122.jpg', 'https://tv.2345.com/detail/49122.html', 8.1, '伦理', 0, 5595);
INSERT INTO `tv_series_data` VALUES (1743714871, '绝密押运', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/3/10176/1823823dda015175395ae63ad7962b4f.jpg', 'https://tv.2345.com/detail/10176.html', 9.7, '战争', 0, 5227);
INSERT INTO `tv_series_data` VALUES (1743838787, '底线', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/17/s53021.jpg', 'https://tv.2345.com/detail/53021.html', 8.7, '家庭', 0, 3673);
INSERT INTO `tv_series_data` VALUES (1746301362, '白玉霜', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/14/s44742.jpg?1418284892', 'https://tv.2345.com/detail/44742.html', 8.1, '其他', 0, 3814);
INSERT INTO `tv_series_data` VALUES (1751300523, '惊天动地', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/2/6438/df4e223fb9b2b66158edaca49f48b2e6.jpg', 'https://tv.2345.com/detail/6438.html', 8.8, '悬疑', 0, 5956);
INSERT INTO `tv_series_data` VALUES (1751675321, '风雨龙虎山', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/254/dbc2b925f8a03972069c0b18d8b2a2e7.jpg', 'https://tv.2345.com/detail/254.html', 8.8, '家庭', 0, 6952);
INSERT INTO `tv_series_data` VALUES (1752123636, '燕子李三', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/2/8955/c190a944f76ad6cb7dfd430af5a9ec7b.jpg', 'https://tv.2345.com/detail/8955.html', 9.3, '战争', 0, 3865);
INSERT INTO `tv_series_data` VALUES (1757615893, '电视剧《解放》', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/18/s56483.jpg', 'https://tv.2345.com/detail/56483.html', 7.7, '战争', 0, 7387);
INSERT INTO `tv_series_data` VALUES (1757663656, '玉碎', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/2/8184/0778f276e120a3681a0078b0cab8aeae.png', 'https://tv.2345.com/detail/8184.html', 8.6, '家庭', 0, 4840);
INSERT INTO `tv_series_data` VALUES (1758794295, '哑女', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/3/s11449.jpg?1410420042', 'https://tv.2345.com/detail/11449.html', 8.8, '家庭', 0, 5272);
INSERT INTO `tv_series_data` VALUES (1760768895, '家族的诞生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/d/4.jpg', 'https://tv.2345.com/detail/17376.html', 8.5, '伦理', 0, 6107);
INSERT INTO `tv_series_data` VALUES (1762293877, '无法触碰的她', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/20/s61092.jpg', 'https://tv.2345.com/detail/61092.html', 8.3, '悬疑', 0, 4135);
INSERT INTO `tv_series_data` VALUES (1762451901, '葵花进城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/8/0.jpg', 'https://tv.2345.com/detail/15917.html', 9.2, '家庭', 0, 4409);
INSERT INTO `tv_series_data` VALUES (1764227272, '大浴堂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/721/a35e16fa93a7d633e39b44c9e8bff4ff.png', 'https://tv.2345.com/detail/721.html', 9.2, '战争', 0, 3853);
INSERT INTO `tv_series_data` VALUES (1769551527, '雪花那个飘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/2081/e2c9025bedfbd62d77dea27951677f5b.jpg', 'https://tv.2345.com/detail/2081.html', 10, '家庭', 0, 6659);
INSERT INTO `tv_series_data` VALUES (1773539559, '芸娘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/57/dbf5a61f64dbb7cbbdb3f28f9e82cb24.jpg', 'https://tv.2345.com/detail/57.html', 8.5, '伦理', 0, 3205);
INSERT INTO `tv_series_data` VALUES (1773926879, '神探柯晨', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/18/s56256.jpg', 'https://tv.2345.com/detail/56256.html', 9.8, '悬疑', 0, 7483);
INSERT INTO `tv_series_data` VALUES (1773956987, '雪狼谷', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/2/7752/a3b548dc4c065b935e9cdc090836345b.jpg', 'https://tv.2345.com/detail/7752.html', 8.3, '战争', 0, 4031);
INSERT INTO `tv_series_data` VALUES (1774564763, '野鸭子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/1051/0ea6f1b24e7f851f9c78edd426012e75.jpg', 'https://tv.2345.com/detail/1051.html', 8.8, '家庭', 0, 3906);
INSERT INTO `tv_series_data` VALUES (1775035047, '战寇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/19/s58802.jpg', 'https://tv.2345.com/detail/58802.html', 8.8, '悬疑', 0, 4954);
INSERT INTO `tv_series_data` VALUES (1778097341, '天伦劫', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/560/a849a666ba14c10f914b53e47cc73d61.jpg', 'https://tv.2345.com/detail/560.html', 9, '家庭', 0, 6064);
INSERT INTO `tv_series_data` VALUES (1782300666, '生死线', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/1330/fb1a6e4068f170ac17611adb50904389.jpg', 'https://tv.2345.com/detail/1330.html', 9.7, '战争', 0, 5960);
INSERT INTO `tv_series_data` VALUES (1786610289, '装台顺风夫妇烟火爱情篇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/19/s58740.jpg', 'https://tv.2345.com/detail/58740.html', 7.8, '家庭', 0, 3907);
INSERT INTO `tv_series_data` VALUES (1788733857, '儿女情更长', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/2/8069/0e8aa322fd35673326de7b0f6b93ad09.jpg', 'https://tv.2345.com/detail/8069.html', 9, '家庭', 0, 5471);
INSERT INTO `tv_series_data` VALUES (1792142455, '我爱你2012TV版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/0/s2240.jpg?1415346115', 'https://tv.2345.com/detail/2240.html', 9.4, '伦理', 0, 5075);
INSERT INTO `tv_series_data` VALUES (1805703936, '敢死队电视剧', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/17/s53836.jpg', 'https://tv.2345.com/detail/53836.html', 7.7, '战争', 0, 5291);
INSERT INTO `tv_series_data` VALUES (1808255790, '于无声处', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/15/s46086.jpg?1429511457', 'https://tv.2345.com/detail/46086.html', 8.5, '战争', 0, 5051);
INSERT INTO `tv_series_data` VALUES (1808513934, '守卫者浮出水面', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/15/s46865.jpg?1476261844', 'https://tv.2345.com/detail/46865.html', 8.6, '战争', 0, 4866);
INSERT INTO `tv_series_data` VALUES (1809140849, '新婚公寓', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/15/s47300.jpg?1451879476', 'https://tv.2345.com/detail/47300.html', 8.4, '家庭', 0, 3014);
INSERT INTO `tv_series_data` VALUES (1815808401, '炊事班的故事第一部精编版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/18/s56501.jpg', 'https://tv.2345.com/detail/56501.html', 8, '战争', 0, 5447);
INSERT INTO `tv_series_data` VALUES (1816427066, '留神', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/0/s191.jpg?1363260870', 'https://tv.2345.com/detail/191.html', 8.9, '伦理', 0, 4749);
INSERT INTO `tv_series_data` VALUES (1816890654, '中国式结婚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/17/s53698.jpg', 'https://tv.2345.com/detail/53698.html', 9.1, '家庭', 0, 6209);
INSERT INTO `tv_series_data` VALUES (1818285269, '风暴舞', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/19/s59091.jpg', 'https://tv.2345.com/detail/59091.html', 9.5, '悬疑', 0, 7063);
INSERT INTO `tv_series_data` VALUES (1819330180, '纵横四海', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/2356/2126b1d9e74b231d386ab1a73a8fd7b6.jpg', 'https://tv.2345.com/detail/2356.html', 10, '家庭', 0, 5008);
INSERT INTO `tv_series_data` VALUES (1820781061, '天命因缘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/1/s4419.jpg', 'https://tv.2345.com/detail/4419.html', 8.7, '战争', 0, 5407);
INSERT INTO `tv_series_data` VALUES (1826595557, '陶之恋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/9/s29936.jpg?1393485611', 'https://tv.2345.com/detail/29936.html', 8.6, '家庭', 0, 3491);
INSERT INTO `tv_series_data` VALUES (1827575221, '完美的邻居', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/1/5867/d973402f7b6b014c846c55fdd9e0d50a.jpg', 'https://tv.2345.com/detail/5867.html', 9.6, '家庭', 0, 3106);
INSERT INTO `tv_series_data` VALUES (1832099467, '曹操', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/4/s12621.jpg?1442019377', 'https://tv.2345.com/detail/12621.html', 8.5, '战争', 0, 4315);
INSERT INTO `tv_series_data` VALUES (1832513822, '胭脂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/15/s47161.jpg?1443422860', 'https://tv.2345.com/detail/47161.html', 8.7, '悬疑', 1, 7929);
INSERT INTO `tv_series_data` VALUES (1833663973, '天高地厚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/7/s23503.jpg?1410421137', 'https://tv.2345.com/detail/23503.html', 9.2, '家庭', 0, 3026);
INSERT INTO `tv_series_data` VALUES (1838554470, '我为儿孙当北漂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/15/s46055.jpg', 'https://tv.2345.com/detail/46055.html', 8.4, '伦理', 0, 3557);
INSERT INTO `tv_series_data` VALUES (1839100971, '你是我爱人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/2/6724/0fdf04fc7da35686afb99284afdd1d88.jpg', 'https://tv.2345.com/detail/6724.html', 8.9, '家庭', 0, 7132);
INSERT INTO `tv_series_data` VALUES (1842316451, '无处藏身', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/2416/2666cd1cb42a91e883d4a403de1cb5ff.jpg', 'https://tv.2345.com/detail/2416.html', 9.4, '悬疑', 0, 7428);
INSERT INTO `tv_series_data` VALUES (1842573234, '英魂铸远征', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/18/s54960.jpg', 'https://tv.2345.com/detail/54960.html', 8.8, '战争', 0, 6780);
INSERT INTO `tv_series_data` VALUES (1845549784, '小戏骨之我要当红军', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/17/s53408.jpg', 'https://tv.2345.com/detail/53408.html', 8.1, '战争', 0, 6809);
INSERT INTO `tv_series_data` VALUES (1852537553, '与狼共舞2未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/9/s29601.jpg?1392603602', 'https://tv.2345.com/detail/29601.html', 8.2, '军旅', 0, 3095);
INSERT INTO `tv_series_data` VALUES (1852933886, '拐个大佬做爹地', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/19/s59011.jpg', 'https://tv.2345.com/detail/59011.html', 7.3, '家庭', 0, 3075);
INSERT INTO `tv_series_data` VALUES (1858885663, '迷失的情感', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/9/8322.jpg', 'https://tv.2345.com/detail/8322.html', 8.8, '伦理', 0, 6181);
INSERT INTO `tv_series_data` VALUES (1860002627, '公安局长第三部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/17/s53579.jpg', 'https://tv.2345.com/detail/53579.html', 7.7, '其他', 0, 5322);
INSERT INTO `tv_series_data` VALUES (1862611524, '惠安女', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/16/s49445.jpg', 'https://tv.2345.com/detail/49445.html', 8.7, '其他', 0, 5680);
INSERT INTO `tv_series_data` VALUES (1863043156, '鄂尔多斯风暴', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/15/s47660.jpg?1449639944', 'https://tv.2345.com/detail/47660.html', 8.4, '战争', 0, 3422);
INSERT INTO `tv_series_data` VALUES (1863164527, '情缘遗恨', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/2/s6835.jpg?1410419749', 'https://tv.2345.com/detail/6835.html', 8.7, '战争', 0, 4422);
INSERT INTO `tv_series_data` VALUES (1866394173, '瓷都人之永不褪色的老兵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/20/s61365.jpg', 'https://tv.2345.com/detail/61365.html', 8.5, '其他', 0, 7088);
INSERT INTO `tv_series_data` VALUES (1868960805, '二十四道拐', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/15/s47021.jpg?1441855696', 'https://tv.2345.com/detail/47021.html', 8.4, '战争', 0, 4568);
INSERT INTO `tv_series_data` VALUES (1869235657, '天大地大', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/547/1bbdba15ed31cc0517a54d2b01da040a.jpg', 'https://tv.2345.com/detail/547.html', 9.2, '军旅', 0, 3415);
INSERT INTO `tv_series_data` VALUES (1870798123, '带着婆婆嫁', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/17/s52341.jpg', 'https://tv.2345.com/detail/52341.html', 8.8, '家庭', 0, 5622);
INSERT INTO `tv_series_data` VALUES (1874864790, '大西南剿匪记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/703/d6f3d87159c5e6837b1f7d02d18b5235.jpg', 'https://tv.2345.com/detail/703.html', 9.3, '战争', 0, 6035);
INSERT INTO `tv_series_data` VALUES (1875133204, '密战峨眉', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/4/s14968.jpg?1384417492', 'https://tv.2345.com/detail/14968.html', 8.8, '战争', 0, 5311);
INSERT INTO `tv_series_data` VALUES (1876834250, '完美结局', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/229/dd63eb8234366c96883b1e4b75b7402b.jpg', 'https://tv.2345.com/detail/229.html', 8.9, '伦理', 0, 4905);
INSERT INTO `tv_series_data` VALUES (1877441603, '憨媳当家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/1208/3efced2d0aa1ba2db343c9bc686b0289.jpg', 'https://tv.2345.com/detail/1208.html', 9.2, '家庭', 0, 4688);
INSERT INTO `tv_series_data` VALUES (1877887575, '大国医', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/520/adf475697a80509a7467279f468eb1b2.jpg', 'https://tv.2345.com/detail/520.html', 8.7, '家庭', 0, 5839);
INSERT INTO `tv_series_data` VALUES (1878501204, '心之影', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/15/s45648.jpg', 'https://tv.2345.com/detail/45648.html', 7.6, '家庭', 0, 5790);
INSERT INTO `tv_series_data` VALUES (1881941228, '你真漂亮', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/2499/83741b1870d990fcb592252c59ed0dd6.jpg', 'https://tv.2345.com/detail/2499.html', 6.8, '家庭', 0, 7231);
INSERT INTO `tv_series_data` VALUES (1882669752, '娘心计', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/4/s14823.jpg?1395107114', 'https://tv.2345.com/detail/14823.html', 8.5, '伦理', 0, 7355);
INSERT INTO `tv_series_data` VALUES (1887349205, '百媚千娇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/a/4.jpg', 'https://tv.2345.com/detail/17870.html', 8.9, '伦理', 0, 3967);
INSERT INTO `tv_series_data` VALUES (1889206057, '呼啸山乡', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/0/s381.jpg?1382108183', 'https://tv.2345.com/detail/381.html', 8, '家庭', 0, 6891);
INSERT INTO `tv_series_data` VALUES (1891806832, '九丹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/18/s54179.jpg', 'https://tv.2345.com/detail/54179.html', 9.2, '家庭', 0, 3049);
INSERT INTO `tv_series_data` VALUES (1892822569, '喜临门大陆版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/e/e.jpg', 'https://tv.2345.com/detail/4429.html', 8.5, '伦理', 0, 3685);
INSERT INTO `tv_series_data` VALUES (1893978717, '复活', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/1285/bf861182d0047c47cdbf8bcd268454f4.jpg', 'https://tv.2345.com/detail/1285.html', 10, '悬疑', 0, 5456);
INSERT INTO `tv_series_data` VALUES (1895883171, '武装特警', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/1/3157/56e36a6f9008997b0df33c209bef3d91.jpg', 'https://tv.2345.com/detail/3157.html', 8.5, '战争', 0, 7755);
INSERT INTO `tv_series_data` VALUES (1896541203, '换世之恋普通话版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/20/s60897.jpg', 'https://tv.2345.com/detail/60897.html', 9.8, '家庭', 0, 3964);
INSERT INTO `tv_series_data` VALUES (1898821010, '激战未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/15/s47829.jpg', 'https://tv.2345.com/detail/47829.html', 8.8, '战争', 0, 5973);
INSERT INTO `tv_series_data` VALUES (1904802275, '苍天有眼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/1118/5d21f0beb8da771f0bdcb06632dbc83b.jpg', 'https://tv.2345.com/detail/1118.html', 9.1, '伦理', 0, 6631);
INSERT INTO `tv_series_data` VALUES (1907349429, '神探狄仁杰第1部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/7/s21558.jpg?1406282477', 'https://tv.2345.com/detail/21558.html', 8.8, '悬疑', 0, 5796);
INSERT INTO `tv_series_data` VALUES (1910958909, '一个鬼子都不留', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/6/s19997.jpg?1363455423', 'https://tv.2345.com/detail/19997.html', 8.8, '战争', 0, 3976);
INSERT INTO `tv_series_data` VALUES (1915787001, '小夫妻时代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/2/s8785.jpg', 'https://tv.2345.com/detail/8785.html', 9, '家庭', 0, 5837);
INSERT INTO `tv_series_data` VALUES (1918468827, '人间情缘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/567/d927cef4a22830d49423838964f671f2.jpg', 'https://tv.2345.com/detail/567.html', 10, '家庭', 0, 6232);
INSERT INTO `tv_series_data` VALUES (1924387751, '兄弟门', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/0/s1794.jpg?1489568154', 'https://tv.2345.com/detail/1794.html', 9.3, '战争', 0, 4765);
INSERT INTO `tv_series_data` VALUES (1927909778, '麻雀未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/16/s49613.jpg', 'https://tv.2345.com/detail/49613.html', 9.4, '战争', 0, 7685);
INSERT INTO `tv_series_data` VALUES (1927929355, '只比永远少一天', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/1/4515/d2c138be181e457f1fe1e2dfa89cb30f.jpg', 'https://tv.2345.com/detail/4515.html', 7.6, '伦理', 0, 7415);
INSERT INTO `tv_series_data` VALUES (1932678999, '而立之年', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/4/s14817.jpg?1369795020', 'https://tv.2345.com/detail/14817.html', 8.8, '家庭', 0, 4816);
INSERT INTO `tv_series_data` VALUES (1932751950, '如锦', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/9/s27393.jpg?1385341930', 'https://tv.2345.com/detail/27393.html', 8.5, '家庭', 0, 3683);
INSERT INTO `tv_series_data` VALUES (1933057515, '欲望尤小刚版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/18/s55517.jpg', 'https://tv.2345.com/detail/55517.html', 8.8, '家庭', 0, 6064);
INSERT INTO `tv_series_data` VALUES (1936716052, '非常公民', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/1/4556/6f2c52b94c5203362724f78c8f4fdb8f.jpg', 'https://tv.2345.com/detail/4556.html', 9.5, '其他', 0, 5744);
INSERT INTO `tv_series_data` VALUES (1947627394, '我在你左右', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/0/s2680.jpg?1410419504', 'https://tv.2345.com/detail/2680.html', 6.7, '伦理', 0, 7851);
INSERT INTO `tv_series_data` VALUES (1951290112, '匹夫英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/16/s48583.jpg?1462863065', 'https://tv.2345.com/detail/48583.html', 8.4, '战争', 0, 4043);
INSERT INTO `tv_series_data` VALUES (1951558031, '战火中青春2血染风采', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/0/s1049.jpg?1411381608', 'https://tv.2345.com/detail/1049.html', 9, '战争', 0, 5772);
INSERT INTO `tv_series_data` VALUES (1954312487, '女人的战争', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/400/ca5d0f8a3246aac7220f2fdf6e9268c0.jpg', 'https://tv.2345.com/detail/400.html', 9, '伦理', 0, 4162);
INSERT INTO `tv_series_data` VALUES (1956222638, '宣言', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/1910/a5afada9e41963c69a16f3e25cf5b975.jpg', 'https://tv.2345.com/detail/1910.html', 8.8, '战争', 0, 6367);
INSERT INTO `tv_series_data` VALUES (1959503152, '半路兄弟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/1142/6d9d9722eb2373c367c0578464fc303e.jpg', 'https://tv.2345.com/detail/1142.html', 10, '伦理', 0, 6057);
INSERT INTO `tv_series_data` VALUES (1961957846, '离婚协议', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/11/s33386.jpg', 'https://tv.2345.com/detail/33386.html', 8.4, '家庭', 0, 7812);
INSERT INTO `tv_series_data` VALUES (1968331541, '我的特一营DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/20/s60863.jpg', 'https://tv.2345.com/detail/60863.html', 9, '战争', 0, 5096);
INSERT INTO `tv_series_data` VALUES (1969320547, '军人荣誉', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/0/s2963.jpg', 'https://tv.2345.com/detail/2963.html', 9.2, '战争', 0, 3097);
INSERT INTO `tv_series_data` VALUES (1971622094, '爱情碟中谍', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/15/s47614.jpg', 'https://tv.2345.com/detail/47614.html', 8.5, '家庭', 0, 6728);
INSERT INTO `tv_series_data` VALUES (1972303723, '喋血满洲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/18/s55448.jpg', 'https://tv.2345.com/detail/55448.html', 8.8, '战争', 0, 7944);
INSERT INTO `tv_series_data` VALUES (1977643721, '胜利之路', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/18/s55132.jpg', 'https://tv.2345.com/detail/55132.html', 9.2, '战争', 0, 4340);
INSERT INTO `tv_series_data` VALUES (1981248237, '惊涛', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/7/s21644.jpg?1410420662', 'https://tv.2345.com/detail/21644.html', 9.3, '战争', 0, 3065);
INSERT INTO `tv_series_data` VALUES (1982691627, '贤妻良母', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/0/s192.jpg?1366103574', 'https://tv.2345.com/detail/192.html', 8.5, '家庭', 0, 5997);
INSERT INTO `tv_series_data` VALUES (1983354869, '独立纵队2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/19/s57403.jpg', 'https://tv.2345.com/detail/57403.html', 8.8, '战争', 0, 4274);
INSERT INTO `tv_series_data` VALUES (1987437080, '特殊争夺', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/282/c948ff9f2b6491afdbdd2915a5fd311b.jpg', 'https://tv.2345.com/detail/282.html', 9.3, '战争', 0, 7020);
INSERT INTO `tv_series_data` VALUES (1991897134, '幸福从天而降', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/11/s35706.jpg?1400982784', 'https://tv.2345.com/detail/35706.html', 8.6, '家庭', 0, 6402);
INSERT INTO `tv_series_data` VALUES (1992157564, '决战江桥', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/15/s47299.jpg?1499396080', 'https://tv.2345.com/detail/47299.html', 8.7, '战争', 0, 6377);
INSERT INTO `tv_series_data` VALUES (2000345226, '绝对隐私', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/3/9676/3344fa3a25548c0a94f319e1e4f44b43.jpg', 'https://tv.2345.com/detail/9676.html', 9.5, '伦理', 0, 7876);
INSERT INTO `tv_series_data` VALUES (2003760241, '归鸿', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/18/s56798.jpg', 'https://tv.2345.com/detail/56798.html', 8.5, '战争', 0, 7619);
INSERT INTO `tv_series_data` VALUES (2012610476, '幸福来敲门', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/1/s3674.jpg', 'https://tv.2345.com/detail/3674.html', 9.8, '家庭', 0, 4032);
INSERT INTO `tv_series_data` VALUES (2013217535, '我的妈妈是天使', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/5/s17856.jpg?1367892711', 'https://tv.2345.com/detail/17856.html', 8.6, '家庭', 0, 3295);
INSERT INTO `tv_series_data` VALUES (2015671905, '良家妇女', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/16/s50948.jpg', 'https://tv.2345.com/detail/50948.html', 8.8, '家庭', 0, 7664);
INSERT INTO `tv_series_data` VALUES (2016485038, '家有喜妇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/11/s33359.jpg?1470374342', 'https://tv.2345.com/detail/33359.html', 8.5, '家庭', 0, 6736);
INSERT INTO `tv_series_data` VALUES (2017966971, '泰版回到爱以前', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/19/s59022.jpg', 'https://tv.2345.com/detail/59022.html', 9.3, '家庭', 0, 7695);
INSERT INTO `tv_series_data` VALUES (2020016053, '幸福一家人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/18/s55484.jpg', 'https://tv.2345.com/detail/55484.html', 9.2, '家庭', 0, 5780);
INSERT INTO `tv_series_data` VALUES (2025733832, '壹号皇庭第五部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/18/s54651.jpg', 'https://tv.2345.com/detail/54651.html', 7.3, '家庭', 0, 3649);
INSERT INTO `tv_series_data` VALUES (2026455006, '养父的花样年华', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/14/s42983.jpg?1414398206', 'https://tv.2345.com/detail/42983.html', 8.3, '家庭', 0, 5219);
INSERT INTO `tv_series_data` VALUES (2034658531, '大嫂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/3/9754/8c9c2dc7f1345d31ce8c9a49a82a0394.jpg', 'https://tv.2345.com/detail/9754.html', 8.8, '家庭', 0, 6381);
INSERT INTO `tv_series_data` VALUES (2039134162, '代号叫麻雀', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/19/s59279.jpg', 'https://tv.2345.com/detail/59279.html', 8.7, '战争', 0, 7774);
INSERT INTO `tv_series_data` VALUES (2041733461, '烈日炎炎', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/2196/f627b451d1232ad29a1accf151c42140.jpg', 'https://tv.2345.com/detail/2196.html', 8.8, '战争', 0, 7627);
INSERT INTO `tv_series_data` VALUES (2044798742, '重生门', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/6/19545/d62c788a9b0e8b2b9bbd0050ba09d476.jpg', 'https://tv.2345.com/detail/19545.html', 8.2, '家庭', 0, 4137);
INSERT INTO `tv_series_data` VALUES (2050744874, '战地黄花分外香', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/10/s30041.jpg?1393989267', 'https://tv.2345.com/detail/30041.html', 8.4, '战争', 0, 7405);
INSERT INTO `tv_series_data` VALUES (2052571917, '护国大将军', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/1/s4202.jpg', 'https://tv.2345.com/detail/4202.html', 8.9, '战争', 0, 4846);
INSERT INTO `tv_series_data` VALUES (2062461540, '午子风云', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/19/s58303.jpg', 'https://tv.2345.com/detail/58303.html', 9.8, '战争', 0, 3923);
INSERT INTO `tv_series_data` VALUES (2062698944, '绽放吧百合', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/18/s56045.jpg', 'https://tv.2345.com/detail/56045.html', 8.8, '其他', 0, 5298);
INSERT INTO `tv_series_data` VALUES (2063730943, '莲花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/7/s21914.jpg?1369020953', 'https://tv.2345.com/detail/21914.html', 8.7, '家庭', 0, 4679);
INSERT INTO `tv_series_data` VALUES (2067825737, '隐形将军', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/903/0b2a928ddd10d457a0d05d840ce404b4.jpg', 'https://tv.2345.com/detail/903.html', 9.4, '战争', 0, 6939);
INSERT INTO `tv_series_data` VALUES (2071550369, '挚爱奇缘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/1/4359/bd6a00cb4b81501273d0f7ac7291b27b.jpg', 'https://tv.2345.com/detail/4359.html', 8.8, '家庭', 0, 5333);
INSERT INTO `tv_series_data` VALUES (2072499884, '独生子女的婆婆妈妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/a/19294.jpg', 'https://tv.2345.com/detail/19294.html', 8.9, '家庭', 0, 4454);
INSERT INTO `tv_series_data` VALUES (2073817224, '他来了请闭眼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/15/s47144.jpg?1443085130', 'https://tv.2345.com/detail/47144.html', 8.6, '悬疑', 0, 5591);
INSERT INTO `tv_series_data` VALUES (2079213510, '离婚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/4/a.jpg', 'https://tv.2345.com/detail/1417.html', 9.1, '伦理', 0, 7544);
INSERT INTO `tv_series_data` VALUES (2086580948, '桥隆飙', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/2283/f5752c014ed9486e3114e2849e8568fc.jpg', 'https://tv.2345.com/detail/2283.html', 9.2, '军旅', 0, 5172);
INSERT INTO `tv_series_data` VALUES (2092074293, '为爱而生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/180/5e0d28d1fdb8bf4067c9b1f3f7d333e1.jpg', 'https://tv.2345.com/detail/180.html', 8.7, '伦理', 0, 3666);
INSERT INTO `tv_series_data` VALUES (2097805298, '妈妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/13/s40346.jpg?1407066686', 'https://tv.2345.com/detail/40346.html', 8.4, '家庭', 0, 6585);
INSERT INTO `tv_series_data` VALUES (2100025651, '又见阿郎', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/90/56de63cb786ea4814343b62be495b0d6.jpg', 'https://tv.2345.com/detail/90.html', 8.9, '家庭', 0, 5198);
INSERT INTO `tv_series_data` VALUES (2100309368, '猎手', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/19/s57876.jpg', 'https://tv.2345.com/detail/57876.html', 9.4, '战争', 0, 3848);
INSERT INTO `tv_series_data` VALUES (2102970733, '风声传奇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/1763/bae7503216a18d7a14e49e70c5647f51.jpg', 'https://tv.2345.com/detail/1763.html', 7.5, '战争', 0, 7439);
INSERT INTO `tv_series_data` VALUES (2103849071, '伏击', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/16/s50385.jpg?1477040617', 'https://tv.2345.com/detail/50385.html', 8.2, '战争', 0, 7821);
INSERT INTO `tv_series_data` VALUES (2104485108, '幸福又见彩虹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/16/s48765.jpg?1464851754', 'https://tv.2345.com/detail/48765.html', 8.3, '家庭', 0, 5866);
INSERT INTO `tv_series_data` VALUES (2108043749, '别阻挡我的幸福', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/1/s5898.jpg', 'https://tv.2345.com/detail/5898.html', 8.8, '伦理', 0, 3483);
INSERT INTO `tv_series_data` VALUES (2109097275, '像火花像蝴蝶', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/7/s22568.jpg?1371449582', 'https://tv.2345.com/detail/22568.html', 8.7, '家庭', 0, 4183);
INSERT INTO `tv_series_data` VALUES (2116382150, '我和我的三个姐姐', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/20/s61126.jpg', 'https://tv.2345.com/detail/61126.html', 7.9, '家庭', 0, 7072);
INSERT INTO `tv_series_data` VALUES (2120331833, '莲花岛', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/17/s53310.jpg', 'https://tv.2345.com/detail/53310.html', 8.7, '家庭', 0, 6767);
INSERT INTO `tv_series_data` VALUES (2121868673, '幸福有配方', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/17/s53878.jpg?1508988132', 'https://tv.2345.com/detail/53878.html', 8.6, '家庭', 0, 7947);
INSERT INTO `tv_series_data` VALUES (2123129772, '最后征战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/10/s31190.jpg', 'https://tv.2345.com/detail/31190.html', 8.8, '战争', 0, 7271);
INSERT INTO `tv_series_data` VALUES (2125860339, '满秋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/2/s8912.jpg', 'https://tv.2345.com/detail/8912.html', 8.2, '家庭', 0, 6919);
INSERT INTO `tv_series_data` VALUES (2130146801, '零号国境线', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/1933/cbca4a28a54c9989396078b5ffe15c09.jpg', 'https://tv.2345.com/detail/1933.html', 9.1, '战争', 0, 5843);
INSERT INTO `tv_series_data` VALUES (2131820590, '鹰隼大队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/94/c4d66f7237ae6f2e6939503bce15f697.jpg', 'https://tv.2345.com/detail/94.html', 9, '战争', 0, 5919);
INSERT INTO `tv_series_data` VALUES (2132720818, '风车', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/1/5353/9cfba9fa02f7f40bc544523fd8003552.jpg', 'https://tv.2345.com/detail/5353.html', 9.2, '家庭', 0, 5757);
INSERT INTO `tv_series_data` VALUES (2133191482, '美人如玉剑如虹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/16/s48093.jpg?1478056987', 'https://tv.2345.com/detail/48093.html', 8.9, '战争', 0, 4677);
INSERT INTO `tv_series_data` VALUES (2140510451, '天真派西游记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/18/s56356.jpg', 'https://tv.2345.com/detail/56356.html', 8.9, '其他', 0, 5233);
INSERT INTO `tv_series_data` VALUES (2141713730, '爱的厘米DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/19/s58671.jpg', 'https://tv.2345.com/detail/58671.html', 8.2, '家庭', 0, 4806);
INSERT INTO `tv_series_data` VALUES (2143267671, '空巢', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/102/47179fcdeb63fef17c51a9ab762abca0.jpg', 'https://tv.2345.com/detail/102.html', 10, '家庭', 0, 7806);
INSERT INTO `tv_series_data` VALUES (2150385685, '田教授家的二十八个亲戚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/77/s77.jpg', 'https://tv.2345.com/detail/77.html', 9, '家庭', 0, 7665);
INSERT INTO `tv_series_data` VALUES (2153374853, '兼并', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/2/s7925.jpg?1398418854', 'https://tv.2345.com/detail/7925.html', 9.2, '家庭', 0, 7663);
INSERT INTO `tv_series_data` VALUES (2158302811, '风云年代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/16/s48971.jpg?1467597932', 'https://tv.2345.com/detail/48971.html', 8.4, '战争', 0, 4555);
INSERT INTO `tv_series_data` VALUES (2158309120, '婚姻保卫战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/1/3859/564b543027eb57e433b8019a4809e8df.jpg', 'https://tv.2345.com/detail/3859.html', 8.8, '家庭', 0, 4025);
INSERT INTO `tv_series_data` VALUES (2158458707, '浴血十四年', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/18/s55412.jpg', 'https://tv.2345.com/detail/55412.html', 8.9, '战争', 0, 4170);
INSERT INTO `tv_series_data` VALUES (2158492782, '女王的条件', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/450728/1352185867/33b726a61c30b3214f252bea4a843632.jpg', 'https://tv.2345.com/detail/16482.html', 8, '伦理', 0, 6147);
INSERT INTO `tv_series_data` VALUES (2163076584, '夜半歌声', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/2/7457/85d62a72b377c1d98a13c8ae338b06ee.png', 'https://tv.2345.com/detail/7457.html', 8.9, '伦理', 0, 3799);
INSERT INTO `tv_series_data` VALUES (2163255319, '走过路过莫错过', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/2/6912/ea268258733ac99894ebdf6bf0831ef6.jpg', 'https://tv.2345.com/detail/6912.html', 8.7, '家庭', 0, 6977);
INSERT INTO `tv_series_data` VALUES (2164729167, '《叩响明天》互动影集', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/19/s57870.jpg', 'https://tv.2345.com/detail/57870.html', 7.3, '其他', 0, 5074);
INSERT INTO `tv_series_data` VALUES (2166833378, '断奶', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/3/s9783.jpg?1369792405', 'https://tv.2345.com/detail/9783.html', 8.5, '家庭', 0, 7153);
INSERT INTO `tv_series_data` VALUES (2168878182, '日本人不知道的日语', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/1/3211/s3211.jpg', 'https://tv.2345.com/detail/3211.html', 7, '家庭', 0, 3357);
INSERT INTO `tv_series_data` VALUES (2169519761, '浪子回头', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/19/s57893.jpg', 'https://tv.2345.com/detail/57893.html', 7.9, '战争', 0, 6220);
INSERT INTO `tv_series_data` VALUES (2172363005, '亲人爱人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/217/1e3d03d0eac55f9420bb195af91446f0.jpg', 'https://tv.2345.com/detail/217.html', 8.8, '家庭', 0, 6848);
INSERT INTO `tv_series_data` VALUES (2177429490, '夜操场第一季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/17/s53016.jpg', 'https://tv.2345.com/detail/53016.html', 8.4, '战争', 0, 6840);
INSERT INTO `tv_series_data` VALUES (2180465898, '结婚十年', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/7/8c5951459c73a77dba17499a4efec82d.jpg', 'https://tv.2345.com/detail/7.html', 9.5, '伦理', 0, 3863);
INSERT INTO `tv_series_data` VALUES (2185748724, '心理罪第二季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/16/s49579.jpg?1477982355', 'https://tv.2345.com/detail/49579.html', 8.7, '悬疑', 0, 3521);
INSERT INTO `tv_series_data` VALUES (2191642875, '洪湖赤卫队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/0/s621.jpg?1501134149', 'https://tv.2345.com/detail/621.html', 9.3, '战争', 0, 3740);
INSERT INTO `tv_series_data` VALUES (2192131923, '那些迷人的往事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/3/10200/68da192628a05dbb0eef686158df8621.jpg', 'https://tv.2345.com/detail/10200.html', 8.9, '战争', 0, 3388);
INSERT INTO `tv_series_data` VALUES (2195920251, '党的女儿', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/1895/1c27646f4121150678d89b6e064c81fb.jpg', 'https://tv.2345.com/detail/1895.html', 8.8, '战争', 0, 4870);
INSERT INTO `tv_series_data` VALUES (2200907433, '东山学堂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/9/s28356.jpg?1387949015', 'https://tv.2345.com/detail/28356.html', 8.3, '其他', 0, 6624);
INSERT INTO `tv_series_data` VALUES (2200921941, '湄洲岛奇缘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/2702/82cd7932042ce71ff8de4f4da821401a.png', 'https://tv.2345.com/detail/2702.html', 8.7, '家庭', 0, 7932);
INSERT INTO `tv_series_data` VALUES (2201852819, '守望的天空', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/2/7991/a12db26fe641d058399506ae8b1139c6.jpg', 'https://tv.2345.com/detail/7991.html', 9.4, '家庭', 0, 3269);
INSERT INTO `tv_series_data` VALUES (2205905460, '兵峰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/634/204ac5123e72dd5f5cff58f5fd1240fd.jpg', 'https://tv.2345.com/detail/634.html', 8.5, '战争', 0, 3825);
INSERT INTO `tv_series_data` VALUES (2206471866, '对与决', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/10/s32593.jpg?1471405198', 'https://tv.2345.com/detail/32593.html', 8.3, '战争', 0, 7955);
INSERT INTO `tv_series_data` VALUES (2208180688, '做工的人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/19/s58711.jpg', 'https://tv.2345.com/detail/58711.html', 8.9, '家庭', 0, 5346);
INSERT INTO `tv_series_data` VALUES (2209327509, '徐开骋生日会', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/18/s56448.jpg', 'https://tv.2345.com/detail/56448.html', 8.5, '其他', 0, 5194);
INSERT INTO `tv_series_data` VALUES (2214242501, '生活万岁', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/19/s59004.jpg', 'https://tv.2345.com/detail/59004.html', 9.4, '家庭', 0, 5166);
INSERT INTO `tv_series_data` VALUES (2219662327, '外国小孩中国爸', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/2827/a78d57ad12c7e2c3994cfc8feba187d9.jpg', 'https://tv.2345.com/detail/2827.html', 9.3, '伦理', 0, 7449);
INSERT INTO `tv_series_data` VALUES (2228033685, '特战荣耀', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/18/s56644.jpg?1569312684', 'https://tv.2345.com/detail/56644.html', 8.7, '战争', 0, 7600);
INSERT INTO `tv_series_data` VALUES (2231587904, '大学生士兵的故事1', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/1691/62bb8c42918828458cf83f0f9924ad23.jpg', 'https://tv.2345.com/detail/1691.html', 9.4, '军旅', 0, 6045);
INSERT INTO `tv_series_data` VALUES (2231634385, '剑谍', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/311/2912078671bf8d2ae0a5aecee35c425e.jpg', 'https://tv.2345.com/detail/311.html', 9.3, '悬疑', 0, 3253);
INSERT INTO `tv_series_data` VALUES (2233432240, '雪域天路', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/1266/563b84f22a2bb11c96457a845c0c61e9.jpg', 'https://tv.2345.com/detail/1266.html', 9.1, '家庭', 0, 7914);
INSERT INTO `tv_series_data` VALUES (2234269990, '继父', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/2/7613/77a4159fb361e7ead5997eecaf1275ca.jpg', 'https://tv.2345.com/detail/7613.html', 10, '家庭', 0, 3964);
INSERT INTO `tv_series_data` VALUES (2234601510, '真爱谎言', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/3/s10303.jpg', 'https://tv.2345.com/detail/10303.html', 8, '家庭', 0, 3214);
INSERT INTO `tv_series_data` VALUES (2239125814, '青春无季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/19/s58927.jpg', 'https://tv.2345.com/detail/58927.html', 9, '家庭', 0, 4792);
INSERT INTO `tv_series_data` VALUES (2239142870, '厂花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/2/8509/666d32f72d00c7638c6cdfeaf7ee3e4e.jpg', 'https://tv.2345.com/detail/8509.html', 9.1, '家庭', 0, 6234);
INSERT INTO `tv_series_data` VALUES (2241163738, '家有九凤', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/1141/a9a6a2349f426d496b72c3cd838c88cf.jpg', 'https://tv.2345.com/detail/1141.html', 9.6, '家庭', 0, 6709);
INSERT INTO `tv_series_data` VALUES (2242029397, '牵手', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/1/5894/4c9f0abd79dbb2c0c912bdc7fc5a0158.jpg', 'https://tv.2345.com/detail/5894.html', 10, '家庭', 0, 5807);
INSERT INTO `tv_series_data` VALUES (2244923125, '骡子和金子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/16/s50263.jpg?1476170724', 'https://tv.2345.com/detail/50263.html', 7.9, '战争', 0, 7341);
INSERT INTO `tv_series_data` VALUES (2246706735, '爸爸我怀了你的孩子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/1042/s1042.jpg', 'https://tv.2345.com/detail/1042.html', 6.6, '伦理', 0, 5233);
INSERT INTO `tv_series_data` VALUES (2248474288, '血未冷', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/363/29ed241410f8ab57f9794a54e193c5f6.jpg', 'https://tv.2345.com/detail/363.html', 10, '家庭', 0, 7065);
INSERT INTO `tv_series_data` VALUES (2249339963, '风云传奇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/3/s10715.jpg', 'https://tv.2345.com/detail/10715.html', 8, '战争', 0, 6690);
INSERT INTO `tv_series_data` VALUES (2251099959, '北方汉子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/821/3425fc73104d4930c1745407d86b2af3.jpg', 'https://tv.2345.com/detail/821.html', 10, '战争', 0, 6449);
INSERT INTO `tv_series_data` VALUES (2254996190, '八零九零阳光男友养成记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/19/s59111.jpg', 'https://tv.2345.com/detail/59111.html', 8.1, '家庭', 0, 4418);
INSERT INTO `tv_series_data` VALUES (2255508574, '家族的秘密', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/14/s43062.jpg', 'https://tv.2345.com/detail/43062.html', 8.6, '家庭', 0, 7578);
INSERT INTO `tv_series_data` VALUES (2255895070, '亲兄热弟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/369/bfd37403a246122dda7a69a7c3905e77.jpg', 'https://tv.2345.com/detail/369.html', 10, '家庭', 0, 5679);
INSERT INTO `tv_series_data` VALUES (2260196049, '狼烟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/17/s51695.jpg', 'https://tv.2345.com/detail/51695.html', 8.8, '战争', 0, 4696);
INSERT INTO `tv_series_data` VALUES (2261335058, '中国兄弟连', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/1/3886/9fe49b7cb1577c3cf53831c411a5d190.jpg', 'https://tv.2345.com/detail/3886.html', 9.7, '战争', 0, 6210);
INSERT INTO `tv_series_data` VALUES (2261490577, '幸福的完美', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/50/9d3cb9886d525da537610e37536930dc.jpg', 'https://tv.2345.com/detail/50.html', 9.1, '战争', 0, 4686);
INSERT INTO `tv_series_data` VALUES (2262106387, '生活像阳光一样灿烂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/19/s57826.jpg', 'https://tv.2345.com/detail/57826.html', 9.6, '家庭', 0, 4135);
INSERT INTO `tv_series_data` VALUES (2263712086, '非常出击', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/2/s6436.jpg', 'https://tv.2345.com/detail/6436.html', 8.8, '军旅', 0, 3247);
INSERT INTO `tv_series_data` VALUES (2266840026, '绝杀', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/e/e.jpg', 'https://tv.2345.com/detail/18574.html', 8.8, '战争', 0, 4093);
INSERT INTO `tv_series_data` VALUES (2267263146, '满洲之花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/18/s55170.jpg', 'https://tv.2345.com/detail/55170.html', 9.7, '战争', 0, 3347);
INSERT INTO `tv_series_data` VALUES (2268239180, '毛岸英', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/3/10197/84a6a372f9e0a951a60d7e1dfd4536df.jpg', 'https://tv.2345.com/detail/10197.html', 7.7, '战争', 0, 7898);
INSERT INTO `tv_series_data` VALUES (2270418820, '女人的战争', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/400/ca5d0f8a3246aac7220f2fdf6e9268c0.jpg', 'https://tv.2345.com/detail/400.html', 9, '家庭', 0, 7678);
INSERT INTO `tv_series_data` VALUES (2276108590, '世间路大陆版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/5/9.jpg', 'https://tv.2345.com/detail/17497.html', 8.8, '伦理', 0, 3148);
INSERT INTO `tv_series_data` VALUES (2276145798, '张礼红的现代生活', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/2/8604/de72617bde2dc3a5970c4285915f14fa.jpg', 'https://tv.2345.com/detail/8604.html', 9.2, '伦理', 0, 4685);
INSERT INTO `tv_series_data` VALUES (2277271103, '妻子的秘密未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/9/s29700.jpg?1446702511', 'https://tv.2345.com/detail/29700.html', 8.8, '家庭', 0, 7478);
INSERT INTO `tv_series_data` VALUES (2285406301, '一代洪商', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/20/s61470.jpg', 'https://tv.2345.com/detail/61470.html', 8.5, '战争', 0, 7727);
INSERT INTO `tv_series_data` VALUES (2290536874, '母亲母亲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/8.jpg', 'https://tv.2345.com/detail/12776.html', 9.3, '战争', 0, 5089);
INSERT INTO `tv_series_data` VALUES (2293243716, '悲情母子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/9/s28593.jpg?1388989454', 'https://tv.2345.com/detail/28593.html', 8.4, '伦理', 0, 7908);
INSERT INTO `tv_series_data` VALUES (2297682462, '硬骨头', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/16/s49057.jpg?1468631991', 'https://tv.2345.com/detail/49057.html', 8.4, '战争', 0, 6200);
INSERT INTO `tv_series_data` VALUES (2299807564, '中国骑兵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/6/6.jpg', 'https://tv.2345.com/detail/12726.html', 8.4, '军旅', 0, 6584);
INSERT INTO `tv_series_data` VALUES (2300741317, '在线爱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/2002/cb0ba6f3123dd1b2cabf9d2560cf6d16.jpg', 'https://tv.2345.com/detail/2002.html', 8.8, '家庭', 0, 3650);
INSERT INTO `tv_series_data` VALUES (2301785532, '不再流泪的女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/1/s4594.jpg?1398420530', 'https://tv.2345.com/detail/4594.html', 9.2, '家庭', 0, 6863);
INSERT INTO `tv_series_data` VALUES (2304386506, '武昌首义', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/1/s4032.jpg', 'https://tv.2345.com/detail/4032.html', 8.8, '战争', 0, 3185);
INSERT INTO `tv_series_data` VALUES (2307146563, '激情燃烧的岁月3', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/1608/c75ec07910f2c429b4bd1484b262042a.jpg', 'https://tv.2345.com/detail/1608.html', 8.8, '家庭', 0, 3043);
INSERT INTO `tv_series_data` VALUES (2307158147, '无法沉睡的她', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/20/s61288.jpg', 'https://tv.2345.com/detail/61288.html', 8.1, '悬疑', 0, 7258);
INSERT INTO `tv_series_data` VALUES (2308132218, '让爱化作珍珠雨', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/2/6484/a67731eebaeaf430588e073cd1761518.jpg', 'https://tv.2345.com/detail/6484.html', 8.9, '家庭', 0, 6642);
INSERT INTO `tv_series_data` VALUES (2309733626, '渴望城市1', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/16/s50286.jpg', 'https://tv.2345.com/detail/50286.html', 8, '其他', 0, 5396);
INSERT INTO `tv_series_data` VALUES (2311997430, '人生本色家庭篇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/20/s61340.jpg', 'https://tv.2345.com/detail/61340.html', 8.6, '家庭', 0, 7240);
INSERT INTO `tv_series_data` VALUES (2316260759, '第二次二十岁', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/15/s46945.jpg', 'https://tv.2345.com/detail/46945.html', 8.4, '家庭', 0, 4061);
INSERT INTO `tv_series_data` VALUES (2319894127, '阿霞', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/3/10102/b5f9ccd227639198578cac3496493bad.jpg', 'https://tv.2345.com/detail/10102.html', 8, '家庭', 0, 4279);
INSERT INTO `tv_series_data` VALUES (2319904331, '让爱重来', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/769/ce5e8d53832b792863a1183ca6672445.jpg', 'https://tv.2345.com/detail/769.html', 9.5, '家庭', 0, 4252);
INSERT INTO `tv_series_data` VALUES (2321695663, '东北剿匪记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/15/s45960.jpg', 'https://tv.2345.com/detail/45960.html', 8.4, '战争', 0, 5118);
INSERT INTO `tv_series_data` VALUES (2325246357, '爱情句号', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/1121/55a911c6f08608b396302d2d5646c1a5.jpg', 'https://tv.2345.com/detail/1121.html', 8.9, '家庭', 0, 7276);
INSERT INTO `tv_series_data` VALUES (2326050625, '重生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/1/5697/5748fd373cfd86101c16ed6f05458e50.jpg', 'https://tv.2345.com/detail/5697.html', 10, '悬疑', 0, 5044);
INSERT INTO `tv_series_data` VALUES (2326581723, '房战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/3/s11436.jpg', 'https://tv.2345.com/detail/11436.html', 8.9, '家庭', 0, 4098);
INSERT INTO `tv_series_data` VALUES (2326825053, '热血篮球', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/15/s46559.jpg', 'https://tv.2345.com/detail/46559.html', 8.3, '其他', 0, 7698);
INSERT INTO `tv_series_data` VALUES (2327997151, '复读', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/15/s46889.jpg', 'https://tv.2345.com/detail/46889.html', 8.6, '其他', 0, 4172);
INSERT INTO `tv_series_data` VALUES (2329412778, '突击再突击', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/17/s53355.jpg?1499915095', 'https://tv.2345.com/detail/53355.html', 8.7, '军旅', 0, 6725);
INSERT INTO `tv_series_data` VALUES (2330272272, '神探狄仁杰第4部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/e/c.jpg', 'https://tv.2345.com/detail/6239.html', 8.6, '悬疑', 0, 6899);
INSERT INTO `tv_series_data` VALUES (2330520616, '奇怪的七号病房', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/15/s46886.jpg', 'https://tv.2345.com/detail/46886.html', 8.7, '家庭', 0, 3259);
INSERT INTO `tv_series_data` VALUES (2330590726, 'W两个世界', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/16/s48965.jpg?1474506303', 'https://tv.2345.com/detail/48965.html', 8.5, '悬疑', 0, 5476);
INSERT INTO `tv_series_data` VALUES (2332097386, '杜鹃的女儿', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/1/5923/348536a70689177e884b886fe9f8124f.jpg', 'https://tv.2345.com/detail/5923.html', 8.7, '家庭', 0, 4028);
INSERT INTO `tv_series_data` VALUES (2332640827, '爱国者', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/18/s54824.jpg?1527149646', 'https://tv.2345.com/detail/54824.html', 9.4, '战争', 0, 7442);
INSERT INTO `tv_series_data` VALUES (2335240500, '大瓷商', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/136/4ff130d02d0d0947fef7e08420b8d814.jpg', 'https://tv.2345.com/detail/136.html', 9, '家庭', 0, 6739);
INSERT INTO `tv_series_data` VALUES (2336011146, '沧海横流', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/2/s8730.jpg?1410419867', 'https://tv.2345.com/detail/8730.html', 8, '战争', 0, 7560);
INSERT INTO `tv_series_data` VALUES (2336667976, '理智与情感', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/3/s11632.jpg?1376625987', 'https://tv.2345.com/detail/11632.html', 8, '伦理', 0, 4817);
INSERT INTO `tv_series_data` VALUES (2337734530, '生死搭档', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/2/6822/8cf42776eccfeb5c802dffa03f20a796.jpg', 'https://tv.2345.com/detail/6822.html', 8.7, '战争', 0, 3945);
INSERT INTO `tv_series_data` VALUES (2338528607, '结发夫妻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/2409/s2409.jpg', 'https://tv.2345.com/detail/2409.html', 8.8, '伦理', 0, 5797);
INSERT INTO `tv_series_data` VALUES (2338862143, '狂飙支队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/2/2.jpg', 'https://tv.2345.com/detail/14839.html', 8.9, '战争', 0, 7727);
INSERT INTO `tv_series_data` VALUES (2339911667, '那些年我们正年轻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/17/s53716.jpg?1533087192', 'https://tv.2345.com/detail/53716.html', 8.6, '战争', 0, 3856);
INSERT INTO `tv_series_data` VALUES (2341116618, '你是我的兄弟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/1695/557b3bfb521e8deb21d6ebb4bda5f9d5.jpg', 'https://tv.2345.com/detail/1695.html', 9.2, '家庭', 0, 6934);
INSERT INTO `tv_series_data` VALUES (2342679588, '生死边沿', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/18/s56329.jpg', 'https://tv.2345.com/detail/56329.html', 9.8, '战争', 0, 3778);
INSERT INTO `tv_series_data` VALUES (2343478984, '野鸭子2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/11/s33159.jpg?1419313196', 'https://tv.2345.com/detail/33159.html', 8.6, '家庭', 0, 5761);
INSERT INTO `tv_series_data` VALUES (2343651326, '推拿', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/8/s24603.jpg?1376621141', 'https://tv.2345.com/detail/24603.html', 8.3, '家庭', 0, 6932);
INSERT INTO `tv_series_data` VALUES (2351341195, '背着奶奶进城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/15/s47383.jpg?1446440742', 'https://tv.2345.com/detail/47383.html', 8.5, '家庭', 0, 6565);
INSERT INTO `tv_series_data` VALUES (2351539552, '心火', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/1/3127/c05c1e3794b125c8ffe184db9c207f0d.jpg', 'https://tv.2345.com/detail/3127.html', 9.4, '家庭', 0, 5031);
INSERT INTO `tv_series_data` VALUES (2351593112, '诱爱入局普通话版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/19/s58093.jpg', 'https://tv.2345.com/detail/58093.html', 9.8, '家庭', 0, 6270);
INSERT INTO `tv_series_data` VALUES (2352137299, '军校奏鸣曲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/17/s53891.jpg', 'https://tv.2345.com/detail/53891.html', 8.7, '战争', 0, 7619);
INSERT INTO `tv_series_data` VALUES (2356409441, '风声', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/18/s55009.jpg?1531120774', 'https://tv.2345.com/detail/55009.html', 9.2, '战争', 0, 7845);
INSERT INTO `tv_series_data` VALUES (2357824080, '嬲事儿', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/17/s52734.jpg', 'https://tv.2345.com/detail/52734.html', 8.8, '家庭', 0, 7195);
INSERT INTO `tv_series_data` VALUES (2358382779, '蝴蝶行动', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/5/s15427.jpg?1362964663', 'https://tv.2345.com/detail/15427.html', 8.5, '悬疑', 0, 7987);
INSERT INTO `tv_series_data` VALUES (2358850471, '少年包青天1', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/f/3.jpg', 'https://tv.2345.com/detail/5446.html', 8.2, '悬疑', 0, 6053);
INSERT INTO `tv_series_data` VALUES (2360429673, '国家形象', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/10/s32631.jpg?1410421677', 'https://tv.2345.com/detail/32631.html', 6.1, '其他', 0, 5888);
INSERT INTO `tv_series_data` VALUES (2362448517, '有家好好过', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/18/s55321.jpg', 'https://tv.2345.com/detail/55321.html', 9.8, '家庭', 0, 3617);
INSERT INTO `tv_series_data` VALUES (2363178861, '喜临门大陆版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/e/e.jpg', 'https://tv.2345.com/detail/4429.html', 8.5, '家庭', 0, 6658);
INSERT INTO `tv_series_data` VALUES (2363873360, '妻子的谎言', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/15/s45898.jpg?1427100049', 'https://tv.2345.com/detail/45898.html', 8.7, '家庭', 0, 4072);
INSERT INTO `tv_series_data` VALUES (2364836979, '女人的村庄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/55/54907ea2d77434f4c296853ce4e3e304.jpg', 'https://tv.2345.com/detail/55.html', 9.8, '家庭', 0, 4904);
INSERT INTO `tv_series_data` VALUES (2366193909, '苍天有眼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/1118/5d21f0beb8da771f0bdcb06632dbc83b.jpg', 'https://tv.2345.com/detail/1118.html', 9.1, '家庭', 0, 4096);
INSERT INTO `tv_series_data` VALUES (2366577581, '电视剧《解放》', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/18/s56483.jpg', 'https://tv.2345.com/detail/56483.html', 7.7, '军旅', 0, 7613);
INSERT INTO `tv_series_data` VALUES (2367607792, '海狼行动', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/61/e1c1d415275b628225f59c7c49918d56.jpg', 'https://tv.2345.com/detail/61.html', 9.1, '战争', 0, 3208);
INSERT INTO `tv_series_data` VALUES (2371339726, '上海风云', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/3/10226/eb0d93d4b7e2597bdcaf02f64b53f666.jpg', 'https://tv.2345.com/detail/10226.html', 9.3, '战争', 0, 3695);
INSERT INTO `tv_series_data` VALUES (2371477897, '神枪手', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/259/b0a6d74cc4cb6f43e09fc5484e8c2496.jpg', 'https://tv.2345.com/detail/259.html', 8.9, '战争', 0, 3255);
INSERT INTO `tv_series_data` VALUES (2374311985, '肥猫寻亲记之明天会更好', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/17/s51720.jpg', 'https://tv.2345.com/detail/51720.html', 9.1, '家庭', 0, 4113);
INSERT INTO `tv_series_data` VALUES (2375118908, '单亲妈妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/1362/f62e6f5c174494d77e99dfc895690c2d.jpg', 'https://tv.2345.com/detail/1362.html', 9.3, '伦理', 0, 3866);
INSERT INTO `tv_series_data` VALUES (2375334445, '婚姻诊断', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/328/0b736a98f63a0c4917762c1211893ffe.jpg', 'https://tv.2345.com/detail/328.html', 10, '伦理', 0, 3903);
INSERT INTO `tv_series_data` VALUES (2375443830, '媳妇的眼泪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/156/2780ebecc24148a55cc33f2a6b9cc095.jpg', 'https://tv.2345.com/detail/156.html', 8.8, '家庭', 0, 7454);
INSERT INTO `tv_series_data` VALUES (2376205391, '高校教师', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/1/s3265.jpg?1388282056', 'https://tv.2345.com/detail/3265.html', 8.6, '家庭', 0, 4484);
INSERT INTO `tv_series_data` VALUES (2378132814, '乡村爱情浪漫曲上', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/15/s45646.jpg?1450253598', 'https://tv.2345.com/detail/45646.html', 8.8, '家庭', 0, 3617);
INSERT INTO `tv_series_data` VALUES (2384625939, '营盘镇警事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/f/d.jpg', 'https://tv.2345.com/detail/12178.html', 9.5, '其他', 0, 7862);
INSERT INTO `tv_series_data` VALUES (2385334189, '换个活法', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/2353/0a80857230d8f9d56b0b09aea51ac617.jpg', 'https://tv.2345.com/detail/2353.html', 8.8, '家庭', 0, 4869);
INSERT INTO `tv_series_data` VALUES (2385775229, '023档案', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/18/s54734.jpg', 'https://tv.2345.com/detail/54734.html', 9.2, '战争', 0, 7833);
INSERT INTO `tv_series_data` VALUES (2386516068, '落地请开手机', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/1/s5363.jpg?1364546723', 'https://tv.2345.com/detail/5363.html', 9.7, '家庭', 0, 6738);
INSERT INTO `tv_series_data` VALUES (2389382315, '铁道游击队第一部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/17/s53585.jpg', 'https://tv.2345.com/detail/53585.html', 8.3, '战争', 0, 7623);
INSERT INTO `tv_series_data` VALUES (2391091221, '老屋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/18/s55806.jpg', 'https://tv.2345.com/detail/55806.html', 9.2, '家庭', 0, 6835);
INSERT INTO `tv_series_data` VALUES (2399532699, '渴望城市2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/16/s49484.jpg', 'https://tv.2345.com/detail/49484.html', 8.8, '家庭', 0, 6468);
INSERT INTO `tv_series_data` VALUES (2403895609, '可怜天下父母心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/2916/e24dd886e88ffdb6080d559f069b5055.jpg', 'https://tv.2345.com/detail/2916.html', 10, '伦理', 0, 6467);
INSERT INTO `tv_series_data` VALUES (2409593548, '红官窑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/2382/96f249f13ba187a4ef37845ccf842bcf.jpg', 'https://tv.2345.com/detail/2382.html', 8.8, '家庭', 0, 7550);
INSERT INTO `tv_series_data` VALUES (2410439395, '攻心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/2/s8329.jpg', 'https://tv.2345.com/detail/8329.html', 8.5, '战争', 0, 6582);
INSERT INTO `tv_series_data` VALUES (2414746756, '反贪局长', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/211/c317ede74fff4813c7a04b4095e59b96.jpg', 'https://tv.2345.com/detail/211.html', 8.7, '悬疑', 0, 7028);
INSERT INTO `tv_series_data` VALUES (2418228261, '人生是美丽的上部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/1/s5919.jpg', 'https://tv.2345.com/detail/5919.html', 7.5, '家庭', 0, 6280);
INSERT INTO `tv_series_data` VALUES (2422114322, '上阵父子兵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/7/s21923.jpg?1369964443', 'https://tv.2345.com/detail/21923.html', 8.7, '战争', 0, 3222);
INSERT INTO `tv_series_data` VALUES (2426810273, '冰山上的来客', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/0/s1160.jpg?1484291866', 'https://tv.2345.com/detail/1160.html', 8.1, '战争', 0, 4823);
INSERT INTO `tv_series_data` VALUES (2430714086, '特种部队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/15/s45553.jpg', 'https://tv.2345.com/detail/45553.html', 8.7, '战争', 0, 3485);
INSERT INTO `tv_series_data` VALUES (2431565702, '第三种幸福', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/13/s41993.jpg?1411712280', 'https://tv.2345.com/detail/41993.html', 8.3, '家庭', 0, 6902);
INSERT INTO `tv_series_data` VALUES (2431874050, '花落花开', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/3/s9968.jpg', 'https://tv.2345.com/detail/9968.html', 8.8, '家庭', 0, 4606);
INSERT INTO `tv_series_data` VALUES (2447943636, '冷案', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/18/s55893.jpg', 'https://tv.2345.com/detail/55893.html', 9.4, '悬疑', 0, 5881);
INSERT INTO `tv_series_data` VALUES (2452361533, '爱与恨', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/2305/657e02b094a992579bf939204ea4182c.jpg', 'https://tv.2345.com/detail/2305.html', 6.6, '伦理', 0, 5086);
INSERT INTO `tv_series_data` VALUES (2453838477, '渴望城市', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/14/s44798.jpg', 'https://tv.2345.com/detail/44798.html', 7.3, '伦理', 0, 4880);
INSERT INTO `tv_series_data` VALUES (2454297082, '开门遇见好莱坞', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/9/s29590.jpg?1395639399', 'https://tv.2345.com/detail/29590.html', 7.1, '其他', 0, 5818);
INSERT INTO `tv_series_data` VALUES (2456454731, '夜来香', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/239/1d951a4f5b07fc18db92471859ea8a48.jpg', 'https://tv.2345.com/detail/239.html', 9.2, '战争', 0, 6415);
INSERT INTO `tv_series_data` VALUES (2459428738, '北平和谈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/384/s384.jpg', 'https://tv.2345.com/detail/384.html', 8.7, '战争', 0, 7990);
INSERT INTO `tv_series_data` VALUES (2461781656, '绝地反击', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/19/s58460.jpg', 'https://tv.2345.com/detail/58460.html', 9.1, '军旅', 0, 5171);
INSERT INTO `tv_series_data` VALUES (2461920607, '鬼吹灯之精绝古城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/16/s48483.jpg?1481876084', 'https://tv.2345.com/detail/48483.html', 8.8, '悬疑', 0, 4319);
INSERT INTO `tv_series_data` VALUES (2462399805, '围城内外', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/4/12363/41e00a3cafde50422ff6ac2f6bbf8e58.jpg', 'https://tv.2345.com/detail/12363.html', 8.7, '家庭', 0, 7215);
INSERT INTO `tv_series_data` VALUES (2465473334, '我知道这是真的第一季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/19/s59095.jpg', 'https://tv.2345.com/detail/59095.html', 8.7, '家庭', 1, 7945);
INSERT INTO `tv_series_data` VALUES (2465639190, '爱情最美丽', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/9/s27985.jpg?1387176119', 'https://tv.2345.com/detail/27985.html', 8.5, '家庭', 0, 6169);
INSERT INTO `tv_series_data` VALUES (2466068706, '人生是美丽的', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/1/s3444.jpg', 'https://tv.2345.com/detail/3444.html', 7.5, '家庭', 0, 7848);
INSERT INTO `tv_series_data` VALUES (2472575750, '望海的女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/10/s32205.jpg?1395192480', 'https://tv.2345.com/detail/32205.html', 8.4, '伦理', 0, 7731);
INSERT INTO `tv_series_data` VALUES (2475291672, '爱的复仇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/19/s57662.jpg', 'https://tv.2345.com/detail/57662.html', 8.4, '家庭', 0, 3401);
INSERT INTO `tv_series_data` VALUES (2475432024, '秘密谍报员绘里香', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/1/s5008.jpg', 'https://tv.2345.com/detail/5008.html', 7.6, '家庭', 0, 3982);
INSERT INTO `tv_series_data` VALUES (2480295678, '女高男低', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/2/s6066.jpg', 'https://tv.2345.com/detail/6066.html', 9, '家庭', 0, 7533);
INSERT INTO `tv_series_data` VALUES (2482843142, '天高地厚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/7/s23503.jpg?1410421137', 'https://tv.2345.com/detail/23503.html', 9.2, '伦理', 0, 4766);
INSERT INTO `tv_series_data` VALUES (2483317472, '新乱世佳人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/2148/b7f99ad5bb3ef89fd8eee9cec5792399.jpg', 'https://tv.2345.com/detail/2148.html', 9.5, '伦理', 0, 3572);
INSERT INTO `tv_series_data` VALUES (2483693714, '激战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/15/s46779.jpg?1438844368', 'https://tv.2345.com/detail/46779.html', 8.5, '战争', 0, 7701);
INSERT INTO `tv_series_data` VALUES (2484339620, '绝战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/5/s16363.jpg?1385084624', 'https://tv.2345.com/detail/16363.html', 8.5, '悬疑', 0, 7144);
INSERT INTO `tv_series_data` VALUES (2484380464, '祈望', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/1319/d7d66220bc2103f4cf189d614940eafa.jpg', 'https://tv.2345.com/detail/1319.html', 9.4, '家庭', 0, 7614);
INSERT INTO `tv_series_data` VALUES (2484920063, '终极证据', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/b/3.jpg', 'https://tv.2345.com/detail/18223.html', 8.8, '悬疑', 0, 4091);
INSERT INTO `tv_series_data` VALUES (2487229374, '我是英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/19/s58993.jpg', 'https://tv.2345.com/detail/58993.html', 8.8, '战争', 0, 7858);
INSERT INTO `tv_series_data` VALUES (2492534145, '粟裕大将', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/1/d.jpg', 'https://tv.2345.com/detail/10499.html', 9.8, '战争', 0, 4039);
INSERT INTO `tv_series_data` VALUES (2494157959, '什刹海', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/19/s57750.jpg', 'https://tv.2345.com/detail/57750.html', 9.6, '家庭', 0, 5444);
INSERT INTO `tv_series_data` VALUES (2496430024, '我爱东北话', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/15/s46877.jpg', 'https://tv.2345.com/detail/46877.html', 8.8, '其他', 0, 6778);
INSERT INTO `tv_series_data` VALUES (2499574700, '母亲陈小艺版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/3/s9000.jpg?1417401610', 'https://tv.2345.com/detail/9000.html', 7.2, '家庭', 0, 7228);
INSERT INTO `tv_series_data` VALUES (2500176817, '买房夫妻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/2.jpg', 'https://tv.2345.com/detail/14998.html', 9.2, '家庭', 0, 4336);
INSERT INTO `tv_series_data` VALUES (2506544609, '良心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/14/s43429.jpg', 'https://tv.2345.com/detail/43429.html', 8.1, '家庭', 0, 6498);
INSERT INTO `tv_series_data` VALUES (2511843077, '世纪突击', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/2414/s2414.jpg', 'https://tv.2345.com/detail/2414.html', 8.8, '战争', 0, 3684);
INSERT INTO `tv_series_data` VALUES (2511926446, '婆婆也是妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/2/s8949.jpg', 'https://tv.2345.com/detail/8949.html', 8.8, '家庭', 0, 4984);
INSERT INTO `tv_series_data` VALUES (2511986988, '微晓的祝福', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/15/s46585.jpg', 'https://tv.2345.com/detail/46585.html', 7.3, '其他', 0, 5988);
INSERT INTO `tv_series_data` VALUES (2515942480, '与青春有关的日子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/1/4584/634d3d43bc7105fa696672de3bc437fe.jpg', 'https://tv.2345.com/detail/4584.html', 9.6, '家庭', 0, 3464);
INSERT INTO `tv_series_data` VALUES (2516765710, '密战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/526/79e87dd214c175bee7d696e800a34d7a.jpg', 'https://tv.2345.com/detail/526.html', 10, '战争', 0, 5724);
INSERT INTO `tv_series_data` VALUES (2519436769, '守望', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/6/s19734.jpg?1407404131', 'https://tv.2345.com/detail/19734.html', 7.8, '伦理', 0, 4314);
INSERT INTO `tv_series_data` VALUES (2524986133, '马店', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/1/s5964.jpg', 'https://tv.2345.com/detail/5964.html', 9.2, '战争', 0, 6971);
INSERT INTO `tv_series_data` VALUES (2527746829, '浴血记者', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/3/9649/bda338d8b0e0da7ceed3ec59bf0178bc.jpg', 'https://tv.2345.com/detail/9649.html', 8.9, '战争', 0, 4251);
INSERT INTO `tv_series_data` VALUES (2532357177, '军中红舞鞋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/7/s23550.jpg?1373866415', 'https://tv.2345.com/detail/23550.html', 7.6, '军旅', 0, 5402);
INSERT INTO `tv_series_data` VALUES (2534320009, '因为遇见你DVD版未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/17/s53108.jpg', 'https://tv.2345.com/detail/53108.html', 8.1, '家庭', 0, 6326);
INSERT INTO `tv_series_data` VALUES (2536689095, '迷路', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/2413/s2413.jpg', 'https://tv.2345.com/detail/2413.html', 7.8, '伦理', 0, 5348);
INSERT INTO `tv_series_data` VALUES (2537117857, '王大花的革命生涯', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/15/s45873.jpg?1427697697', 'https://tv.2345.com/detail/45873.html', 8.5, '战争', 0, 5520);
INSERT INTO `tv_series_data` VALUES (2537695726, '钟汉良原声小剧场', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/13/s39223.jpg?1410422055', 'https://tv.2345.com/detail/39223.html', 6.7, '战争', 0, 5209);
INSERT INTO `tv_series_data` VALUES (2545101993, '上海女性', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/16/s48876.jpg', 'https://tv.2345.com/detail/48876.html', 8.7, '家庭', 0, 6132);
INSERT INTO `tv_series_data` VALUES (2547762690, '双枪李向阳之再战松井', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/2/7734/01628f54ade18ee182f5c0098066e4f4.png', 'https://tv.2345.com/detail/7734.html', 9, '战争', 0, 6675);
INSERT INTO `tv_series_data` VALUES (2548612247, '永远的铭记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/1/4505/84937fd2c781b074db920cd13dc79f6b.jpg', 'https://tv.2345.com/detail/4505.html', 8.8, '战争', 0, 6698);
INSERT INTO `tv_series_data` VALUES (2551949457, '猛犸敢死队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/2300/d9b186f4ff60af40835cc29809bd21bb.jpg', 'https://tv.2345.com/detail/2300.html', 8.8, '军旅', 0, 5058);
INSERT INTO `tv_series_data` VALUES (2554863660, '刑警战记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/17/s53227.jpg', 'https://tv.2345.com/detail/53227.html', 8.1, '悬疑', 0, 4400);
INSERT INTO `tv_series_data` VALUES (2555030534, '鬼吹灯之怒晴湘西', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/18/s55305.jpg?1538204175', 'https://tv.2345.com/detail/55305.html', 9.2, '悬疑', 0, 3342);
INSERT INTO `tv_series_data` VALUES (2555629683, '尖刀出鞘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/14/s43615.jpg?1415777330', 'https://tv.2345.com/detail/43615.html', 9.1, '战争', 0, 7679);
INSERT INTO `tv_series_data` VALUES (2558275877, '与青春有关的日子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/1/4584/634d3d43bc7105fa696672de3bc437fe.jpg', 'https://tv.2345.com/detail/4584.html', 9.6, '战争', 0, 6260);
INSERT INTO `tv_series_data` VALUES (2560109980, '天真遇到现实未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/7/s21726.jpg?1410420686', 'https://tv.2345.com/detail/21726.html', 7.8, '家庭', 0, 6452);
INSERT INTO `tv_series_data` VALUES (2562703385, '铁血男儿夏明翰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/4/12769/2717cf8e21890329326518e0ebcec722.jpg', 'https://tv.2345.com/detail/12769.html', 8.8, '战争', 0, 3726);
INSERT INTO `tv_series_data` VALUES (2562923273, '人证', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/10/s32907.jpg', 'https://tv.2345.com/detail/32907.html', 6.5, '家庭', 0, 7060);
INSERT INTO `tv_series_data` VALUES (2563700789, '血沃丰碑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/15/s47493.jpg', 'https://tv.2345.com/detail/47493.html', 8.8, '战争', 0, 3245);
INSERT INTO `tv_series_data` VALUES (2572442358, '掩不住的阳光', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/11/s33379.jpg', 'https://tv.2345.com/detail/33379.html', 9.8, '战争', 0, 7421);
INSERT INTO `tv_series_data` VALUES (2573205649, '蝾螈道士与幕后操纵团', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/2/s7639.jpg', 'https://tv.2345.com/detail/7639.html', 6.7, '家庭', 0, 3935);
INSERT INTO `tv_series_data` VALUES (2582735823, '我和老妈一起嫁', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/3/s10015.jpg', 'https://tv.2345.com/detail/10015.html', 9.2, '家庭', 0, 7239);
INSERT INTO `tv_series_data` VALUES (2582872042, '牵挂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/692/dd73669af5de6f3ea56f7012062bae25.jpg', 'https://tv.2345.com/detail/692.html', 9.4, '家庭', 0, 3240);
INSERT INTO `tv_series_data` VALUES (2583166597, '复仇第1季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/1034/s1034.jpg', 'https://tv.2345.com/detail/1034.html', 7.9, '悬疑', 0, 4493);
INSERT INTO `tv_series_data` VALUES (2583816633, '归还世界给你', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/17/s53755.jpg?1506569085', 'https://tv.2345.com/detail/53755.html', 8.7, '悬疑', 0, 5890);
INSERT INTO `tv_series_data` VALUES (2583863818, '单行线', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/10/s32545.jpg?1415339408', 'https://tv.2345.com/detail/32545.html', 7.5, '伦理', 0, 5556);
INSERT INTO `tv_series_data` VALUES (2583947555, '丁家有女喜洋洋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/536/s536.jpg', 'https://tv.2345.com/detail/536.html', 7.5, '家庭', 0, 3541);
INSERT INTO `tv_series_data` VALUES (2585001289, '千方百计爱上你', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/5/s15959.jpg?1480989230', 'https://tv.2345.com/detail/15959.html', 9.2, '家庭', 0, 4879);
INSERT INTO `tv_series_data` VALUES (2588105299, '黎明决战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/15/s45677.jpg?1488422325', 'https://tv.2345.com/detail/45677.html', 8.2, '战争', 0, 6537);
INSERT INTO `tv_series_data` VALUES (2592187787, '初恋裴勇俊版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/4/c.jpg', 'https://tv.2345.com/detail/5908.html', 6.1, '家庭', 0, 6389);
INSERT INTO `tv_series_data` VALUES (2593394544, '蓝蝶之谜', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/4/s14972.jpg?1484805519', 'https://tv.2345.com/detail/14972.html', 8.5, '战争', 0, 3220);
INSERT INTO `tv_series_data` VALUES (2597460789, '铁血武工队传奇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/14/s42296.jpg', 'https://tv.2345.com/detail/42296.html', 8.4, '战争', 0, 5423);
INSERT INTO `tv_series_data` VALUES (2597612969, '阳光灿烂竖屏更逗趣', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/19/s57833.jpg', 'https://tv.2345.com/detail/57833.html', 8.7, '家庭', 0, 5263);
INSERT INTO `tv_series_data` VALUES (2599596091, '勋章', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/14/c701f837d5c689116b0787e075b320bf.jpg', 'https://tv.2345.com/detail/14.html', 9.3, '战争', 0, 3975);
INSERT INTO `tv_series_data` VALUES (2614698994, '盾神', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/14/s44616.jpg?1418609999', 'https://tv.2345.com/detail/44616.html', 8.7, '悬疑', 0, 4010);
INSERT INTO `tv_series_data` VALUES (2614947890, '十个连长一个班', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/16/s50261.jpg?1476435254', 'https://tv.2345.com/detail/50261.html', 8.2, '战争', 0, 3790);
INSERT INTO `tv_series_data` VALUES (2615621933, '溏心风暴3粤语版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/18/s54115.jpg', 'https://tv.2345.com/detail/54115.html', 9.4, '家庭', 0, 5954);
INSERT INTO `tv_series_data` VALUES (2620315983, '阿郎在北京', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/354/s354.jpg', 'https://tv.2345.com/detail/354.html', 8.6, '伦理', 0, 5978);
INSERT INTO `tv_series_data` VALUES (2620584027, '亲情暖我心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/16/s48636.jpg?1463796415', 'https://tv.2345.com/detail/48636.html', 8.5, '家庭', 0, 6188);
INSERT INTO `tv_series_data` VALUES (2622791752, '来不及说我爱你', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/0/s1476.jpg?1431678617', 'https://tv.2345.com/detail/1476.html', 9.3, '战争', 0, 7527);
INSERT INTO `tv_series_data` VALUES (2626172006, '落泪成金', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/2175/d43d9b0408bf1944b39d4d5237ef2599.jpg', 'https://tv.2345.com/detail/2175.html', 8.9, '家庭', 0, 6487);
INSERT INTO `tv_series_data` VALUES (2626479705, '历史永远铭记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/15/s47102.jpg?1442631408', 'https://tv.2345.com/detail/47102.html', 8.4, '战争', 0, 6995);
INSERT INTO `tv_series_data` VALUES (2626766283, '我的老爸是奇葩', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/17/s53404.jpg?1502846830', 'https://tv.2345.com/detail/53404.html', 8.1, '家庭', 0, 6165);
INSERT INTO `tv_series_data` VALUES (2629133714, '望海的女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/10/s32205.jpg?1395192480', 'https://tv.2345.com/detail/32205.html', 8.4, '家庭', 0, 6647);
INSERT INTO `tv_series_data` VALUES (2633467970, '新三国演义国语版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/0/s1193.jpg?1364977881', 'https://tv.2345.com/detail/1193.html', 9.5, '战争', 0, 5654);
INSERT INTO `tv_series_data` VALUES (2634233187, '烽烟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/18/s54109.jpg', 'https://tv.2345.com/detail/54109.html', 8.8, '战争', 0, 4998);
INSERT INTO `tv_series_data` VALUES (2635424635, '平安是福', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/854/30698c3618ded714cccaa8e1b0ac0e63.jpg', 'https://tv.2345.com/detail/854.html', 8.7, '家庭', 0, 4301);
INSERT INTO `tv_series_data` VALUES (2635511210, '六块六毛六那点事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/5/s15211.jpg?1369795534', 'https://tv.2345.com/detail/15211.html', 8.5, '家庭', 0, 6470);
INSERT INTO `tv_series_data` VALUES (2636499960, '奇妙博物馆第三季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/19/s57730.jpg', 'https://tv.2345.com/detail/57730.html', 8.3, '悬疑', 0, 4769);
INSERT INTO `tv_series_data` VALUES (2638469101, '那样芬芳', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/4/9.jpg', 'https://tv.2345.com/detail/16698.html', 9.2, '家庭', 0, 7665);
INSERT INTO `tv_series_data` VALUES (2648856899, '破晓', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/17/s52203.jpg?1480904565', 'https://tv.2345.com/detail/52203.html', 8.3, '悬疑', 0, 7130);
INSERT INTO `tv_series_data` VALUES (2652570272, '临界婚姻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/1/3338/70c1b6ada16e02428961a570efd95455.jpg', 'https://tv.2345.com/detail/3338.html', 9.1, '家庭', 0, 7861);
INSERT INTO `tv_series_data` VALUES (2653229535, '第九个寡妇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/5/s16359.jpg?1372125162', 'https://tv.2345.com/detail/16359.html', 8.9, '伦理', 0, 3668);
INSERT INTO `tv_series_data` VALUES (2653929956, '心远', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/17/s53848.jpg', 'https://tv.2345.com/detail/53848.html', 9.2, '家庭', 0, 4600);
INSERT INTO `tv_series_data` VALUES (2654990584, '无悔追踪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/373/7f9799f01f6c1c36373634be9c04dce0.jpg', 'https://tv.2345.com/detail/373.html', 9.7, '家庭', 0, 4498);
INSERT INTO `tv_series_data` VALUES (2662738804, '炊事班的故事第一部短剧版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/19/s57040.jpg', 'https://tv.2345.com/detail/57040.html', 7.4, '战争', 0, 4908);
INSERT INTO `tv_series_data` VALUES (2664110192, '守卫者浮出水面DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/17/s53451.jpg', 'https://tv.2345.com/detail/53451.html', 8.6, '战争', 0, 6380);
INSERT INTO `tv_series_data` VALUES (2664516313, '天大地大', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/547/1bbdba15ed31cc0517a54d2b01da040a.jpg', 'https://tv.2345.com/detail/547.html', 9.2, '战争', 0, 7360);
INSERT INTO `tv_series_data` VALUES (2666711824, '二毛驴传奇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/19/s58867.jpg', 'https://tv.2345.com/detail/58867.html', 8.8, '战争', 0, 3206);
INSERT INTO `tv_series_data` VALUES (2666965612, '铁血殊途', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/19/s58938.jpg', 'https://tv.2345.com/detail/58938.html', 9.8, '战争', 0, 5220);
INSERT INTO `tv_series_data` VALUES (2669078558, '落泪成金', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/2175/d43d9b0408bf1944b39d4d5237ef2599.jpg', 'https://tv.2345.com/detail/2175.html', 8.9, '伦理', 0, 7186);
INSERT INTO `tv_series_data` VALUES (2671824449, '我们有点不对劲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/20/s61311.jpg', 'https://tv.2345.com/detail/61311.html', 8.8, '家庭', 0, 6118);
INSERT INTO `tv_series_data` VALUES (2678836410, '灯火黄昏', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/2/8869/9bf8b28578ea5faa36f313151b891b81.jpg', 'https://tv.2345.com/detail/8869.html', 8.7, '家庭', 0, 3266);
INSERT INTO `tv_series_data` VALUES (2679288506, '绝地枪王2松花江上的枪声', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/17/s52454.jpg?1483500796', 'https://tv.2345.com/detail/52454.html', 8.1, '战争', 0, 7142);
INSERT INTO `tv_series_data` VALUES (2682833989, '风月恶之花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/145/s145.jpg', 'https://tv.2345.com/detail/145.html', 9.1, '家庭', 0, 7926);
INSERT INTO `tv_series_data` VALUES (2684889612, '谁知女人心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/957/da0c3bc1f24d4fa56e26f2608f1df394.jpg', 'https://tv.2345.com/detail/957.html', 8.8, '伦理', 0, 5834);
INSERT INTO `tv_series_data` VALUES (2687550559, '兵临城下', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/1/5089/afbf65c47a5000b92fc7fb6914fcb5be.jpg', 'https://tv.2345.com/detail/5089.html', 9.2, '战争', 0, 7163);
INSERT INTO `tv_series_data` VALUES (2687748739, '大汉口', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/1/5905/7be281cd70ab042cf4216da8a34e0766.jpg', 'https://tv.2345.com/detail/5905.html', 8.8, '家庭', 0, 5433);
INSERT INTO `tv_series_data` VALUES (2691666579, '家在大巴窑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/3/9834/6c28e38585ba4e68bcfe16db17b3d94d.jpg', 'https://tv.2345.com/detail/9834.html', 8.6, '家庭', 0, 4743);
INSERT INTO `tv_series_data` VALUES (2692754013, '保姆妈妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/280/0baa1ee618efe9c00de513ad047a7b7a.jpg', 'https://tv.2345.com/detail/280.html', 8.8, '家庭', 0, 5083);
INSERT INTO `tv_series_data` VALUES (2695139556, '热血尖兵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/17/s52782.jpg?1488937266', 'https://tv.2345.com/detail/52782.html', 8.7, '战争', 0, 6085);
INSERT INTO `tv_series_data` VALUES (2695784761, '道北人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/2061/36dacbef56955a41526eedafc7c263e4.jpg', 'https://tv.2345.com/detail/2061.html', 10, '军旅', 0, 4680);
INSERT INTO `tv_series_data` VALUES (2695892853, '军人使命', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/18/s54655.jpg', 'https://tv.2345.com/detail/54655.html', 8.8, '战争', 0, 4521);
INSERT INTO `tv_series_data` VALUES (2700930322, '特勤精英DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/17/s53816.jpg', 'https://tv.2345.com/detail/53816.html', 9.6, '战争', 0, 4818);
INSERT INTO `tv_series_data` VALUES (2706150488, '月上昆仑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/18/s56847.jpg', 'https://tv.2345.com/detail/56847.html', 9.8, '战争', 0, 4473);
INSERT INTO `tv_series_data` VALUES (2708591047, '十五的月亮', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/2/7872/8b71eb629d6987b2967a00b208a3544b.jpg', 'https://tv.2345.com/detail/7872.html', 8.9, '战争', 0, 6904);
INSERT INTO `tv_series_data` VALUES (2712960757, '野火春风逗古城TV版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/16/s48622.jpg', 'https://tv.2345.com/detail/48622.html', 7.8, '战争', 0, 6803);
INSERT INTO `tv_series_data` VALUES (2718886122, '秀丽江山之长歌行未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/16/s49085.jpg?1469150011', 'https://tv.2345.com/detail/49085.html', 8.8, '战争', 0, 7038);
INSERT INTO `tv_series_data` VALUES (2720919332, '辘轳女人和井', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/3/10190/7c3d233b49546fa357c4d1a919287749.jpg', 'https://tv.2345.com/detail/10190.html', 7.7, '家庭', 0, 4912);
INSERT INTO `tv_series_data` VALUES (2725176306, '谍影重重之上海', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/1369/s1369.jpg', 'https://tv.2345.com/detail/1369.html', 9.2, '战争', 0, 4528);
INSERT INTO `tv_series_data` VALUES (2730755733, '梨花泪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/593/ab6bdb5f5c3d2ce21bbd30275895e7ff.jpg', 'https://tv.2345.com/detail/593.html', 8.9, '伦理', 0, 3305);
INSERT INTO `tv_series_data` VALUES (2737548885, '良家妇女', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/16/s50948.jpg', 'https://tv.2345.com/detail/50948.html', 8.8, '伦理', 0, 5897);
INSERT INTO `tv_series_data` VALUES (2741847471, '昭雪第2季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/12/s36642.jpg?1403324236', 'https://tv.2345.com/detail/36642.html', 8.2, '伦理', 0, 5669);
INSERT INTO `tv_series_data` VALUES (2742914603, '错恨', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/2/8113/a5023de08625798016a2e6bae3988341.jpg', 'https://tv.2345.com/detail/8113.html', 8.9, '家庭', 0, 3665);
INSERT INTO `tv_series_data` VALUES (2747473951, '那金花和她的女婿', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/6/s20980.jpg?1366167139', 'https://tv.2345.com/detail/20980.html', 8.6, '家庭', 0, 6269);
INSERT INTO `tv_series_data` VALUES (2748681796, '六块六毛六那点事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/5/s15211.jpg?1369795534', 'https://tv.2345.com/detail/15211.html', 8.5, '伦理', 0, 6080);
INSERT INTO `tv_series_data` VALUES (2753158297, '川东游击队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/f/1.jpg', 'https://tv.2345.com/detail/7795.html', 8.8, '战争', 0, 7814);
INSERT INTO `tv_series_data` VALUES (2754631241, '梅花档案', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/1/3031/e5af3f03df36b24e67224f0a3c836bc1.jpg', 'https://tv.2345.com/detail/3031.html', 9.5, '悬疑', 0, 6792);
INSERT INTO `tv_series_data` VALUES (2756082684, '战斗的青春', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/30/07bee85639c54ce632d4d13dcda77c9f.jpg', 'https://tv.2345.com/detail/30.html', 9.2, '军旅', 0, 7946);
INSERT INTO `tv_series_data` VALUES (2758265082, '保密局1949', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/16/s50950.jpg', 'https://tv.2345.com/detail/50950.html', 7.1, '战争', 0, 3741);
INSERT INTO `tv_series_data` VALUES (2758443616, '战地迷情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/18/s56509.jpg', 'https://tv.2345.com/detail/56509.html', 8.8, '战争', 0, 5874);
INSERT INTO `tv_series_data` VALUES (2761365521, '亲子鉴定师手记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/20/s61468.jpg', 'https://tv.2345.com/detail/61468.html', 9.7, '家庭', 0, 4791);
INSERT INTO `tv_series_data` VALUES (2764273778, '一路格桑花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/725/e7ec5cf1157986062fca6d21df1f132b.jpg', 'https://tv.2345.com/detail/725.html', 9.3, '家庭', 0, 6491);
INSERT INTO `tv_series_data` VALUES (2765450977, '新京华烟云', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/11/s33377.jpg?1399516853', 'https://tv.2345.com/detail/33377.html', 8.6, '战争', 0, 6219);
INSERT INTO `tv_series_data` VALUES (2765671295, '我的危险妻子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/17/s52972.jpg', 'https://tv.2345.com/detail/52972.html', 9.1, '家庭', 0, 5996);
INSERT INTO `tv_series_data` VALUES (2768527580, '遥远的距离', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/16/s49071.jpg?1473839434', 'https://tv.2345.com/detail/49071.html', 8.5, '家庭', 0, 7837);
INSERT INTO `tv_series_data` VALUES (2770631857, '从爱情开始', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/2379/76830388b9c1c6e910ffdb299f008013.jpg', 'https://tv.2345.com/detail/2379.html', 8.8, '伦理', 0, 3937);
INSERT INTO `tv_series_data` VALUES (2770905991, '传奇之王', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/2/6730/ecbfb35ad37f4ab1bf88acd1fdfb6d06.jpg', 'https://tv.2345.com/detail/6730.html', 9.4, '悬疑', 0, 3831);
INSERT INTO `tv_series_data` VALUES (2771669002, '待嫁老爸', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/15/s46283.jpg?1432535447', 'https://tv.2345.com/detail/46283.html', 8.5, '家庭', 0, 7356);
INSERT INTO `tv_series_data` VALUES (2775058471, '汪洋中的一条船', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/2/8495/49093c5bf56bd75de196722c033a9f05.jpg', 'https://tv.2345.com/detail/8495.html', 9.6, '伦理', 0, 7824);
INSERT INTO `tv_series_data` VALUES (2775568922, '《黄金密码》', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/17/s52117.jpg', 'https://tv.2345.com/detail/52117.html', 8.1, '其他', 0, 3442);
INSERT INTO `tv_series_data` VALUES (2776022159, '商道天问', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/14/s42861.jpg', 'https://tv.2345.com/detail/42861.html', 7.7, '战争', 0, 3321);
INSERT INTO `tv_series_data` VALUES (2776561743, '你永远不会独行', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/3/11478/b087c9168c267b4415a85494949b14d0.jpg', 'https://tv.2345.com/detail/11478.html', 9, '家庭', 0, 5660);
INSERT INTO `tv_series_data` VALUES (2778754937, '假如明天来临', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/1/5256/16356de7bf5a0bb094717d04e12ea067.jpg', 'https://tv.2345.com/detail/5256.html', 8, '家庭', 0, 7212);
INSERT INTO `tv_series_data` VALUES (2781116458, '7喜莫7托2021遇见心醉', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/19/s59208.jpg', 'https://tv.2345.com/detail/59208.html', 8.9, '其他', 0, 5659);
INSERT INTO `tv_series_data` VALUES (2785089496, '英雄无名', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/1/3771/02f226fc930b5e801f9dfbc2754a768a.jpg', 'https://tv.2345.com/detail/3771.html', 9.3, '战争', 0, 5122);
INSERT INTO `tv_series_data` VALUES (2786412605, '幸福满屋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/11/s33083.jpg?1468905408', 'https://tv.2345.com/detail/33083.html', 8.4, '家庭', 0, 4940);
INSERT INTO `tv_series_data` VALUES (2788341186, '黎明之前', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/0/s718.jpg?1363252031', 'https://tv.2345.com/detail/718.html', 9.6, '悬疑', 0, 3982);
INSERT INTO `tv_series_data` VALUES (2789543761, '阿郎在北京', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/354/s354.jpg', 'https://tv.2345.com/detail/354.html', 8.6, '家庭', 0, 4195);
INSERT INTO `tv_series_data` VALUES (2789806476, '良心无悔', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/1190/6c89c4c53d38fbdde8fed68ba975cfa5.jpg', 'https://tv.2345.com/detail/1190.html', 9.5, '家庭', 0, 5004);
INSERT INTO `tv_series_data` VALUES (2792985457, '不完美的丈夫', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/15/s45429.jpg', 'https://tv.2345.com/detail/45429.html', 8.2, '其他', 0, 4005);
INSERT INTO `tv_series_data` VALUES (2796300590, '最后征战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/10/s31190.jpg', 'https://tv.2345.com/detail/31190.html', 8.8, '悬疑', 0, 3445);
INSERT INTO `tv_series_data` VALUES (2796338288, '秘密列车', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/1339/ac088592eb13410ae8cee64e80dbc2f9.jpg', 'https://tv.2345.com/detail/1339.html', 9.1, '战争', 0, 5803);
INSERT INTO `tv_series_data` VALUES (2799625459, '马上天下', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/15/s46581.jpg?1436074138', 'https://tv.2345.com/detail/46581.html', 8.7, '战争', 0, 4952);
INSERT INTO `tv_series_data` VALUES (2800808903, 'SCI谜案集', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/18/s54945.jpg', 'https://tv.2345.com/detail/54945.html', 7.8, '悬疑', 0, 7646);
INSERT INTO `tv_series_data` VALUES (2801860699, '大屋的丫鬟们', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/15/s47019.jpg', 'https://tv.2345.com/detail/47019.html', 8.5, '家庭', 0, 7829);
INSERT INTO `tv_series_data` VALUES (2802128807, '血色玫瑰之女子别动队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/2/s8063.jpg', 'https://tv.2345.com/detail/8063.html', 6.7, '战争', 0, 5658);
INSERT INTO `tv_series_data` VALUES (2802144471, '不能说的秘密', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/18/s54665.jpg', 'https://tv.2345.com/detail/54665.html', 9.6, '家庭', 0, 3021);
INSERT INTO `tv_series_data` VALUES (2805671699, '恋爱机会百分之一', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/1461/ff06ddec3495ef3a48e177d2fff01fba.jpg', 'https://tv.2345.com/detail/1461.html', 9.2, '家庭', 0, 6906);
INSERT INTO `tv_series_data` VALUES (2806257363, '诺桑觉寺', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/3/s11509.jpg?1378863937', 'https://tv.2345.com/detail/11509.html', 8.4, '家庭', 0, 3981);
INSERT INTO `tv_series_data` VALUES (2809020118, '野火春风斗古城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/1/4281/0e8fd827e00d2d7ed7e31b38f7fba5c1.jpg', 'https://tv.2345.com/detail/4281.html', 9, '战争', 0, 7118);
INSERT INTO `tv_series_data` VALUES (2809148363, '刀影', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/10/s32594.jpg?1401939591', 'https://tv.2345.com/detail/32594.html', 8.3, '战争', 0, 4419);
INSERT INTO `tv_series_data` VALUES (2809775050, '刘老根1', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/1/3175/d12a4845909ce0989118f7d8195d1a9c.jpg', 'https://tv.2345.com/detail/3175.html', 9.2, '家庭', 0, 6510);
INSERT INTO `tv_series_data` VALUES (2815794015, '劫中劫', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/15/s46441.jpg', 'https://tv.2345.com/detail/46441.html', 8.3, '战争', 0, 5761);
INSERT INTO `tv_series_data` VALUES (2815822094, '朋友一场', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/1/s5260.jpg', 'https://tv.2345.com/detail/5260.html', 8.8, '伦理', 0, 3380);
INSERT INTO `tv_series_data` VALUES (2819382401, '谎言的诱惑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/18/s54322.jpg', 'https://tv.2345.com/detail/54322.html', 9.2, '家庭', 0, 4472);
INSERT INTO `tv_series_data` VALUES (2826816631, '原谅', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/1/4511/acbc559d9cbf451c7b423f38247cd38d.jpg', 'https://tv.2345.com/detail/4511.html', 8.7, '军旅', 0, 4572);
INSERT INTO `tv_series_data` VALUES (2829213854, '我的男月嫂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/19/s57781.jpg', 'https://tv.2345.com/detail/57781.html', 9.1, '家庭', 0, 4163);
INSERT INTO `tv_series_data` VALUES (2836747696, '与君歌', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/19/s59380.jpeg?1628476353', 'https://tv.2345.com/detail/59380.html', 6, '悬疑', 0, 7268);
INSERT INTO `tv_series_data` VALUES (2837727470, '第一目标', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/17/s53738.jpg', 'https://tv.2345.com/detail/53738.html', 9.2, '悬疑', 0, 5233);
INSERT INTO `tv_series_data` VALUES (2841276954, '别和陌生人跳舞', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/0/s2871.jpg?1470362704', 'https://tv.2345.com/detail/2871.html', 9, '家庭', 0, 5812);
INSERT INTO `tv_series_data` VALUES (2841764090, '无名高地', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/5/s17596.jpg?1410420354', 'https://tv.2345.com/detail/17596.html', 6.6, '战争', 0, 5713);
INSERT INTO `tv_series_data` VALUES (2842725035, '生死劫', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/1785/552a6611ca0df4dcb937ed768478b77c.jpg', 'https://tv.2345.com/detail/1785.html', 9.1, '悬疑', 0, 7799);
INSERT INTO `tv_series_data` VALUES (2844821841, '老爸的筒子楼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/3/s9914.jpg', 'https://tv.2345.com/detail/9914.html', 8.8, '家庭', 0, 5541);
INSERT INTO `tv_series_data` VALUES (2846504992, '与君歌', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/19/s59380.jpeg?1628476353', 'https://tv.2345.com/detail/59380.html', 6.3, '悬疑', 0, 7942);
INSERT INTO `tv_series_data` VALUES (2850650830, '派克式左轮', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/393/fba64fcad7494ad6fa00a83398112a1b.jpg', 'https://tv.2345.com/detail/393.html', 9.1, '家庭', 0, 3685);
INSERT INTO `tv_series_data` VALUES (2850666562, '还看今朝', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/3/10147/f23f755b921853010d5912c30715ff7a.jpg', 'https://tv.2345.com/detail/10147.html', 8.7, '战争', 0, 3306);
INSERT INTO `tv_series_data` VALUES (2851205358, '江湖绝恋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/594/f757acca80df3872c5b545e1525f78e7.jpg', 'https://tv.2345.com/detail/594.html', 10, '战争', 0, 5205);
INSERT INTO `tv_series_data` VALUES (2851513707, '爱情跳棋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/2/s6598.jpg', 'https://tv.2345.com/detail/6598.html', 9.2, '伦理', 0, 3957);
INSERT INTO `tv_series_data` VALUES (2854068365, '靠近你温暖我', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/1/3522/4eecbacbbfd51bae387333304b8ea3c2.jpg', 'https://tv.2345.com/detail/3522.html', 9.3, '家庭', 0, 4814);
INSERT INTO `tv_series_data` VALUES (2861306141, '兴国兴国', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/1793/s1793.jpg', 'https://tv.2345.com/detail/1793.html', 9.2, '军旅', 0, 5286);
INSERT INTO `tv_series_data` VALUES (2863424162, '相爱的人啊', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/1/s3673.jpg', 'https://tv.2345.com/detail/3673.html', 6.8, '伦理', 0, 7085);
INSERT INTO `tv_series_data` VALUES (2865797591, '猫来了喵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/12/s36180.jpg?1402362855', 'https://tv.2345.com/detail/36180.html', 8.5, '家庭', 0, 4276);
INSERT INTO `tv_series_data` VALUES (2870685756, '安居', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/16/s50184.jpg?1474422141', 'https://tv.2345.com/detail/50184.html', 8.3, '家庭', 0, 7340);
INSERT INTO `tv_series_data` VALUES (2872589621, '人是铁饭是钢', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/8/s24000.jpg?1397004577', 'https://tv.2345.com/detail/24000.html', 8.4, '家庭', 0, 7087);
INSERT INTO `tv_series_data` VALUES (2874502035, '山野', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/4/12476/0fe259d51f0d7357a651301528c7cb6d.jpg', 'https://tv.2345.com/detail/12476.html', 10, '家庭', 0, 5376);
INSERT INTO `tv_series_data` VALUES (2878372280, '毕有财', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/6/20130/730157cdb61309bd0700b6c9cefa4357.jpg', 'https://tv.2345.com/detail/20130.html', 8.5, '家庭', 0, 5572);
INSERT INTO `tv_series_data` VALUES (2878664198, '烟雨濛濛', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/1/3141/99ffaa651ab778ca0518bb8ac24772fa.jpg', 'https://tv.2345.com/detail/3141.html', 8.6, '家庭', 0, 6469);
INSERT INTO `tv_series_data` VALUES (2886187026, '结婚契约', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/16/s48016.jpg?1458279382', 'https://tv.2345.com/detail/48016.html', 8.4, '家庭', 0, 5022);
INSERT INTO `tv_series_data` VALUES (2894341480, '西伯利亚流亡记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/16/s50201.jpg', 'https://tv.2345.com/detail/50201.html', 8.8, '战争', 0, 5951);
INSERT INTO `tv_series_data` VALUES (2896112481, '百花深处', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/2/s7776.jpg?1524117506', 'https://tv.2345.com/detail/7776.html', 10, '悬疑', 0, 5461);
INSERT INTO `tv_series_data` VALUES (2897091489, '谁懂女儿心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/1192/d581108bc2b191c01aaef0e7a322f9a0.jpg', 'https://tv.2345.com/detail/1192.html', 9.1, '家庭', 0, 5821);
INSERT INTO `tv_series_data` VALUES (2897940372, '和平的全盛时代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/14/s43113.jpg?1415589014', 'https://tv.2345.com/detail/43113.html', 8.4, '家庭', 0, 7718);
INSERT INTO `tv_series_data` VALUES (2899949750, '秘密谍报员绘里香', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/1/s5008.jpg', 'https://tv.2345.com/detail/5008.html', 7.6, '伦理', 0, 7399);
INSERT INTO `tv_series_data` VALUES (2903010411, '红灯记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/68/s68.jpg', 'https://tv.2345.com/detail/68.html', 8.8, '战争', 0, 7747);
INSERT INTO `tv_series_data` VALUES (2916451820, '绿野', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/2229/41cffbfbfd82ebde4ccba5e657ea6807.jpg', 'https://tv.2345.com/detail/2229.html', 8.8, '家庭', 0, 5311);
INSERT INTO `tv_series_data` VALUES (2917826854, '厂花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/2/8509/666d32f72d00c7638c6cdfeaf7ee3e4e.jpg', 'https://tv.2345.com/detail/8509.html', 9.1, '伦理', 0, 4863);
INSERT INTO `tv_series_data` VALUES (2918964151, '战火熔炉', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/19/s58374.jpg', 'https://tv.2345.com/detail/58374.html', 7.2, '战争', 0, 3643);
INSERT INTO `tv_series_data` VALUES (2919605193, '乡村名流', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/1/4466/c42728cad1280e0d6de9cdeb5376c6c3.jpg', 'https://tv.2345.com/detail/4466.html', 7.6, '家庭', 0, 4374);
INSERT INTO `tv_series_data` VALUES (2920082589, '东方母亲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/1/4574/7c924dd052b796ff29511d8aa63d4c1f.jpg', 'https://tv.2345.com/detail/4574.html', 10, '家庭', 0, 4485);
INSERT INTO `tv_series_data` VALUES (2920236423, '邓小平在重庆', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/3/10116/16ef1aac92c3967bf60f792f30def7f6.jpg', 'https://tv.2345.com/detail/10116.html', 7.9, '战争', 0, 6402);
INSERT INTO `tv_series_data` VALUES (2921984895, '裴家大院', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/169/s169.jpg', 'https://tv.2345.com/detail/169.html', 9.8, '伦理', 0, 4802);
INSERT INTO `tv_series_data` VALUES (2922890262, '看不见的爸妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/20/s60951.png', 'https://tv.2345.com/detail/60951.html', 8.6, '家庭', 0, 6527);
INSERT INTO `tv_series_data` VALUES (2932438100, '芸娘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/57/dbf5a61f64dbb7cbbdb3f28f9e82cb24.jpg', 'https://tv.2345.com/detail/57.html', 8.5, '家庭', 0, 7731);
INSERT INTO `tv_series_data` VALUES (2933447324, '爱有多远', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/241/s241.jpg', 'https://tv.2345.com/detail/241.html', 9, '家庭', 0, 6609);
INSERT INTO `tv_series_data` VALUES (2941768559, '你的女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/6/s19496.jpg?1410420479', 'https://tv.2345.com/detail/19496.html', 7.6, '家庭', 0, 6872);
INSERT INTO `tv_series_data` VALUES (2944919391, '洪湖赤卫队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/0/s621.jpg?1501134149', 'https://tv.2345.com/detail/621.html', 9.3, '军旅', 0, 5825);
INSERT INTO `tv_series_data` VALUES (2945823257, '远远的爱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/2/7597/557c96e5dce4edbb264d3405edb31b74.jpg', 'https://tv.2345.com/detail/7597.html', 8.4, '伦理', 0, 4393);
INSERT INTO `tv_series_data` VALUES (2947619021, '要过好日子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/2/7839/01339ef8225c50594cc8c3ec7d094530.jpg', 'https://tv.2345.com/detail/7839.html', 8.6, '家庭', 0, 5914);
INSERT INTO `tv_series_data` VALUES (2948568488, '戈壁母亲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/1/3155/d2936d5a2d6f6ccf61403e64b2f9d713.jpg', 'https://tv.2345.com/detail/3155.html', 10, '伦理', 0, 5396);
INSERT INTO `tv_series_data` VALUES (2951447913, '母子情仇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/2/s8764.jpg', 'https://tv.2345.com/detail/8764.html', 9, '军旅', 0, 7769);
INSERT INTO `tv_series_data` VALUES (2951533632, '为食神探', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/18/s55952.jpg', 'https://tv.2345.com/detail/55952.html', 8.5, '悬疑', 0, 6192);
INSERT INTO `tv_series_data` VALUES (2955763036, '恩情无限', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/18/s55873.jpg?1551061498', 'https://tv.2345.com/detail/55873.html', 9.2, '家庭', 0, 7316);
INSERT INTO `tv_series_data` VALUES (2962127818, '杜鹃的女儿', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/1/5923/348536a70689177e884b886fe9f8124f.jpg', 'https://tv.2345.com/detail/5923.html', 8.7, '伦理', 0, 7496);
INSERT INTO `tv_series_data` VALUES (2962331170, '盛夏晚晴天', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/6/s19717.jpg?1364265530', 'https://tv.2345.com/detail/19717.html', 9.2, '家庭', 0, 6764);
INSERT INTO `tv_series_data` VALUES (2964471817, '古船女人和网', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/3/10143/c8e8b95d1ba060d1ab554c345db6fe62.jpg', 'https://tv.2345.com/detail/10143.html', 9.1, '家庭', 0, 3693);
INSERT INTO `tv_series_data` VALUES (2964646434, '不良丈夫驯服记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/1/s3210.jpg?1396432909', 'https://tv.2345.com/detail/3210.html', 7.8, '伦理', 0, 6013);
INSERT INTO `tv_series_data` VALUES (2964672079, '火线', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/661/9c999ead1dba74fb6a406745cba5a4b7.jpg', 'https://tv.2345.com/detail/661.html', 7.6, '军旅', 0, 7086);
INSERT INTO `tv_series_data` VALUES (2967231586, '家仇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/1423/c9723e62e5c0fbaaaea2dfe8d49813c7.jpg', 'https://tv.2345.com/detail/1423.html', 10, '战争', 0, 4794);
INSERT INTO `tv_series_data` VALUES (2970402791, '江湖往事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/674/af296966c4da446c50fa6eae1ba0e4df.jpg', 'https://tv.2345.com/detail/674.html', 9, '战争', 0, 6829);
INSERT INTO `tv_series_data` VALUES (2972954903, '火线出击下', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/17/s52872.jpg', 'https://tv.2345.com/detail/52872.html', 8.6, '战争', 0, 3229);
INSERT INTO `tv_series_data` VALUES (2973086894, '我被你迷住了', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/1/5146/792e5132cd1589d547e12f39b18d7b7b.jpg', 'https://tv.2345.com/detail/5146.html', 10, '伦理', 0, 3353);
INSERT INTO `tv_series_data` VALUES (2974371703, '终极对决', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/15/s46072.jpg?1441681054', 'https://tv.2345.com/detail/46072.html', 8.4, '战争', 0, 7543);
INSERT INTO `tv_series_data` VALUES (2975620669, '开端', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/20/s61309.jpg', 'https://tv.2345.com/detail/61309.html', 9.3, '悬疑', 0, 7466);
INSERT INTO `tv_series_data` VALUES (2978329231, '荡寇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/18/s55733.jpg', 'https://tv.2345.com/detail/55733.html', 8.6, '战争', 0, 7786);
INSERT INTO `tv_series_data` VALUES (2988417566, '遍地狼烟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/2/s8842.jpg', 'https://tv.2345.com/detail/8842.html', 8.8, '战争', 0, 5462);
INSERT INTO `tv_series_data` VALUES (2989807313, '好好过日子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/240/de0e48d2befb3e62fa0faced545bdab7.jpg', 'https://tv.2345.com/detail/240.html', 10, '伦理', 0, 3489);
INSERT INTO `tv_series_data` VALUES (2991220052, '夫妻的春天', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/17/s52170.jpg', 'https://tv.2345.com/detail/52170.html', 8.9, '家庭', 0, 3804);
INSERT INTO `tv_series_data` VALUES (2991434222, '乡村爱情9下', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/17/s52726.jpg?1488334623', 'https://tv.2345.com/detail/52726.html', 8.6, '家庭', 0, 5235);
INSERT INTO `tv_series_data` VALUES (2991931360, '向阳而生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/19/s58110.jpg', 'https://tv.2345.com/detail/58110.html', 7.2, '其他', 0, 4558);
INSERT INTO `tv_series_data` VALUES (2994944234, '断喉弩', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/2/6582/938b6f111c5abc19c63230e0404691ba.jpg', 'https://tv.2345.com/detail/6582.html', 8.8, '战争', 0, 6459);
INSERT INTO `tv_series_data` VALUES (2996225196, '大江东去', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/15/s46237.jpg?1431395032', 'https://tv.2345.com/detail/46237.html', 8.4, '战争', 0, 7696);
INSERT INTO `tv_series_data` VALUES (2996392352, '母子情仇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/2/s8764.jpg', 'https://tv.2345.com/detail/8764.html', 9, '战争', 0, 6313);
INSERT INTO `tv_series_data` VALUES (2998900917, '记忆的证明', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/565/275f01e44df97cb0a65035368a9d2744.jpg', 'https://tv.2345.com/detail/565.html', 9.6, '战争', 0, 4561);
INSERT INTO `tv_series_data` VALUES (3001483747, '秦香莲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/1/5741/263f50fdd87dc0ca3022f9937d44d153.jpg', 'https://tv.2345.com/detail/5741.html', 8.8, '伦理', 0, 4041);
INSERT INTO `tv_series_data` VALUES (3003240239, '轰炸天团', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/20/s61370.jpg', 'https://tv.2345.com/detail/61370.html', 7.4, '战争', 0, 5776);
INSERT INTO `tv_series_data` VALUES (3011023128, '石光荣的战火青春TV版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/9/s27826.jpg?1387353602', 'https://tv.2345.com/detail/27826.html', 8.5, '战争', 0, 7656);
INSERT INTO `tv_series_data` VALUES (3011112890, '船娘雯蔚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/2383/88ed8f26c440e1b718d44e3d6176773e.jpg', 'https://tv.2345.com/detail/2383.html', 8.8, '伦理', 0, 3730);
INSERT INTO `tv_series_data` VALUES (3011296560, '幸福密码', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/1845/83be8b2bfb917394160ce3aba05f1db0.jpg', 'https://tv.2345.com/detail/1845.html', 9.5, '家庭', 0, 6549);
INSERT INTO `tv_series_data` VALUES (3011950354, '大将军韩信', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/10/s32551.jpg?1415339948', 'https://tv.2345.com/detail/32551.html', 7.6, '其他', 0, 4237);
INSERT INTO `tv_series_data` VALUES (3012171354, '周末父母', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/16/s48807.jpg', 'https://tv.2345.com/detail/48807.html', 8.7, '家庭', 0, 5659);
INSERT INTO `tv_series_data` VALUES (3012551503, '归途', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/18/s56761.jpg', 'https://tv.2345.com/detail/56761.html', 8.9, '战争', 0, 7580);
INSERT INTO `tv_series_data` VALUES (3013833258, '虎山行', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/768/820b6cdbb92f06cb51416e056cdd7213.jpg', 'https://tv.2345.com/detail/768.html', 6.7, '战争', 0, 4824);
INSERT INTO `tv_series_data` VALUES (3015166994, '旗袍美探', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/19/s57887.png', 'https://tv.2345.com/detail/57887.html', 9, '悬疑', 0, 7920);
INSERT INTO `tv_series_data` VALUES (3015318484, '家里家外', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/1/5702/6a9f4870649eadd2c865f5fb4d64a92a.jpg', 'https://tv.2345.com/detail/5702.html', 8.8, '伦理', 0, 5445);
INSERT INTO `tv_series_data` VALUES (3017029197, '皮影', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/19/s58796.png', 'https://tv.2345.com/detail/58796.html', 8.8, '战争', 0, 3489);
INSERT INTO `tv_series_data` VALUES (3017093531, '阳光之下', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/19/s58834.jpg', 'https://tv.2345.com/detail/58834.html', 8.1, '悬疑', 0, 6057);
INSERT INTO `tv_series_data` VALUES (3019887930, '和平饭店', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/18/s54361.jpg?1516932990', 'https://tv.2345.com/detail/54361.html', 8.7, '悬疑', 0, 3219);
INSERT INTO `tv_series_data` VALUES (3021217498, '埃博拉前线', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/20/s61221.jpg', 'https://tv.2345.com/detail/61221.html', 9.8, '战争', 0, 7483);
INSERT INTO `tv_series_data` VALUES (3021625286, '憨妻的都市日记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/13/s41711.jpg?1411451767', 'https://tv.2345.com/detail/41711.html', 8.5, '家庭', 0, 6363);
INSERT INTO `tv_series_data` VALUES (3025174952, '咱们结婚吧未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/9/s27669.jpg?1411381189', 'https://tv.2345.com/detail/27669.html', 8.7, '家庭', 0, 3873);
INSERT INTO `tv_series_data` VALUES (3026343454, '保姆与保安', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/344/d22b40b5eb9fb3e02c34c0ed6d504742.jpg', 'https://tv.2345.com/detail/344.html', 8.9, '家庭', 0, 3150);
INSERT INTO `tv_series_data` VALUES (3029175535, '黑洞', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/0/s2207.jpg', 'https://tv.2345.com/detail/2207.html', 9.5, '悬疑', 0, 5688);
INSERT INTO `tv_series_data` VALUES (3030044063, '我们都要好好的精华版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/18/s56182.jpg', 'https://tv.2345.com/detail/56182.html', 7.8, '家庭', 0, 3879);
INSERT INTO `tv_series_data` VALUES (3033409601, '二妮的山村梦', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/18/s54500.jpg', 'https://tv.2345.com/detail/54500.html', 8.8, '家庭', 0, 6653);
INSERT INTO `tv_series_data` VALUES (3036038260, '沉默与谎言', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/1/4254/d98697acbf6b81c0da7e2826f7288ed2.jpg', 'https://tv.2345.com/detail/4254.html', 9.1, '家庭', 0, 5428);
INSERT INTO `tv_series_data` VALUES (3039532224, '生死绝恋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/165/b37959ae8448460be4a1b5aa084af9bf.png', 'https://tv.2345.com/detail/165.html', 8.7, '家庭', 0, 4814);
INSERT INTO `tv_series_data` VALUES (3041420586, '继母后妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/2/6607/da1e521789aae0a93337ced8c4734137.jpg', 'https://tv.2345.com/detail/6607.html', 9.2, '伦理', 0, 6424);
INSERT INTO `tv_series_data` VALUES (3044570146, '利剑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/334/a1381599abc59feb021a7859355e9da4.jpg', 'https://tv.2345.com/detail/334.html', 9, '战争', 0, 4202);
INSERT INTO `tv_series_data` VALUES (3046224669, '我们都要好好的', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/18/s56097.jpg', 'https://tv.2345.com/detail/56097.html', 9.4, '家庭', 0, 6684);
INSERT INTO `tv_series_data` VALUES (3047299794, '乱世丽人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/1/s4610.jpg?1374056848', 'https://tv.2345.com/detail/4610.html', 9.2, '伦理', 0, 6111);
INSERT INTO `tv_series_data` VALUES (3048750635, '车间主任', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/3/10114/36b3a817134d60af70938104c63d519d.jpg', 'https://tv.2345.com/detail/10114.html', 6.6, '其他', 0, 4675);
INSERT INTO `tv_series_data` VALUES (3049529046, '非正片频道以及封面图', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/19/s57754.jpg', 'https://tv.2345.com/detail/57754.html', 9.8, '战争', 0, 3154);
INSERT INTO `tv_series_data` VALUES (3058581895, '待到山花烂漫时', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/10/s32586.jpg', 'https://tv.2345.com/detail/32586.html', 8.4, '战争', 0, 6157);
INSERT INTO `tv_series_data` VALUES (3061040279, '下辈子还嫁给你', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/5/s17848.jpg?1364863635', 'https://tv.2345.com/detail/17848.html', 8.8, '家庭', 0, 4793);
INSERT INTO `tv_series_data` VALUES (3062173002, '到爱的距离', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/8/s26058.jpg?1381242073', 'https://tv.2345.com/detail/26058.html', 8.5, '伦理', 0, 5721);
INSERT INTO `tv_series_data` VALUES (3062355481, '偏不离婚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/2400/s2400.jpg', 'https://tv.2345.com/detail/2400.html', 8.9, '伦理', 0, 3600);
INSERT INTO `tv_series_data` VALUES (3064545969, '战长沙', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/9/s27995.jpg?1405388823', 'https://tv.2345.com/detail/27995.html', 8.5, '战争', 0, 6918);
INSERT INTO `tv_series_data` VALUES (3064682429, '红妆', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/1/4549/5ca1a49e78c1bdcfb0cb503d078c0175.jpg', 'https://tv.2345.com/detail/4549.html', 9, '战争', 0, 5710);
INSERT INTO `tv_series_data` VALUES (3066422109, '一言为定', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/2792/4d6036096ec67e2a9afc611619e37d5b.jpg', 'https://tv.2345.com/detail/2792.html', 10, '家庭', 0, 7980);
INSERT INTO `tv_series_data` VALUES (3073950161, '桐柏英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/7/s21243.jpg?1366857634', 'https://tv.2345.com/detail/21243.html', 8.5, '战争', 0, 5673);
INSERT INTO `tv_series_data` VALUES (3074653092, '九死一生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/10/s32742.jpg?1403921089', 'https://tv.2345.com/detail/32742.html', 8.5, '悬疑', 0, 5879);
INSERT INTO `tv_series_data` VALUES (3077829111, '野战师', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/19/s58307.jpg', 'https://tv.2345.com/detail/58307.html', 8.8, '战争', 0, 5613);
INSERT INTO `tv_series_data` VALUES (3078353963, '婆婆的镯子高质量婆媳相处之道', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/20/s60882.jpg', 'https://tv.2345.com/detail/60882.html', 8.3, '家庭', 0, 6552);
INSERT INTO `tv_series_data` VALUES (3083690463, '侠探高飞', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/19/s59238.jpg', 'https://tv.2345.com/detail/59238.html', 8.8, '战争', 0, 3651);
INSERT INTO `tv_series_data` VALUES (3089809025, '红槐花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/1029/eba0b3e8407caa3de9d366c9ccce8486.jpg', 'https://tv.2345.com/detail/1029.html', 8.9, '战争', 0, 3968);
INSERT INTO `tv_series_data` VALUES (3090112477, '溏心风暴2之家好月圆', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/1540/s1540.jpg', 'https://tv.2345.com/detail/1540.html', 7, '家庭', 0, 7299);
INSERT INTO `tv_series_data` VALUES (3091726752, '红色记忆2006', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/18/s55724.jpg', 'https://tv.2345.com/detail/55724.html', 8.3, '战争', 0, 6436);
INSERT INTO `tv_series_data` VALUES (3094085745, '可怜天下父母心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/2916/e24dd886e88ffdb6080d559f069b5055.jpg', 'https://tv.2345.com/detail/2916.html', 10, '家庭', 0, 7710);
INSERT INTO `tv_series_data` VALUES (3099358682, '逃难集中营', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/17/s53368.jpg', 'https://tv.2345.com/detail/53368.html', 8.8, '战争', 0, 7552);
INSERT INTO `tv_series_data` VALUES (3100463942, '惊天阴谋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/287/10f3e398aef3abcd9dd81c680956678a.jpg', 'https://tv.2345.com/detail/287.html', 9.1, '战争', 0, 3917);
INSERT INTO `tv_series_data` VALUES (3100530584, '兵临城下', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/1/5089/afbf65c47a5000b92fc7fb6914fcb5be.jpg', 'https://tv.2345.com/detail/5089.html', 9.2, '军旅', 0, 7229);
INSERT INTO `tv_series_data` VALUES (3103639938, '我的绝密生涯', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/15/s46780.jpg?1438844983', 'https://tv.2345.com/detail/46780.html', 8.4, '战争', 0, 5841);
INSERT INTO `tv_series_data` VALUES (3105710059, '我是赵传奇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/15/s47659.jpg?1450069377', 'https://tv.2345.com/detail/47659.html', 8.4, '战争', 0, 4308);
INSERT INTO `tv_series_data` VALUES (3110792089, '历史的天空', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/1/3076/1578b3862d6cf797af5be58d14b04bd7.jpg', 'https://tv.2345.com/detail/3076.html', 8.4, '战争', 0, 5023);
INSERT INTO `tv_series_data` VALUES (3112502025, '保卫孙子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/11/s33324.jpg?1405132582', 'https://tv.2345.com/detail/33324.html', 8.5, '家庭', 0, 7297);
INSERT INTO `tv_series_data` VALUES (3114407446, '谁是凶手', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/20/s60567.jpg', 'https://tv.2345.com/detail/60567.html', 9.7, '悬疑', 0, 6003);
INSERT INTO `tv_series_data` VALUES (3117000093, '独狼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/9/s27231.jpg?1387462869', 'https://tv.2345.com/detail/27231.html', 8.6, '战争', 0, 4186);
INSERT INTO `tv_series_data` VALUES (3122095155, '大明湖畔有人家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/18/s55040.jpg', 'https://tv.2345.com/detail/55040.html', 8.7, '家庭', 0, 3177);
INSERT INTO `tv_series_data` VALUES (3123184022, '破阵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/15/s47403.jpg?1446779199', 'https://tv.2345.com/detail/47403.html', 8.4, '战争', 0, 3217);
INSERT INTO `tv_series_data` VALUES (3124262604, '战火中青春', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/331/f50e95b733498d2025906f86d1dcc2c1.jpg', 'https://tv.2345.com/detail/331.html', 10, '军旅', 0, 3802);
INSERT INTO `tv_series_data` VALUES (3136743546, '婚姻诉讼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/10/s32685.jpg', 'https://tv.2345.com/detail/32685.html', 7.1, '伦理', 0, 7120);
INSERT INTO `tv_series_data` VALUES (3139419427, '秋蝉任嘉伦篇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/19/s57626.jpg', 'https://tv.2345.com/detail/57626.html', 7, '悬疑', 0, 4287);
INSERT INTO `tv_series_data` VALUES (3141148441, '新兵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/18/s54566.jpg', 'https://tv.2345.com/detail/54566.html', 8.9, '战争', 0, 6704);
INSERT INTO `tv_series_data` VALUES (3143810407, '热血商人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/1/s5154.jpg', 'https://tv.2345.com/detail/5154.html', 8, '伦理', 0, 6900);
INSERT INTO `tv_series_data` VALUES (3144249381, '日出日落', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/15/s47031.jpg', 'https://tv.2345.com/detail/47031.html', 8.7, '家庭', 0, 3894);
INSERT INTO `tv_series_data` VALUES (3144976956, '冬天不冷', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/761/208b5ed2a90ceef9668e78ed7bc1f3d9.jpg', 'https://tv.2345.com/detail/761.html', 9.2, '家庭', 0, 7040);
INSERT INTO `tv_series_data` VALUES (3147596541, '血有多浓', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/2/6907/6c517fd853ff1d3712953884d70ef292.jpg', 'https://tv.2345.com/detail/6907.html', 8.7, '家庭', 0, 7446);
INSERT INTO `tv_series_data` VALUES (3148356839, '摘下你的面具', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/18/s56323.jpg', 'https://tv.2345.com/detail/56323.html', 9.8, '悬疑', 0, 7352);
INSERT INTO `tv_series_data` VALUES (3149513323, '新闺蜜时代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/9/s29371.jpg?1390879836', 'https://tv.2345.com/detail/29371.html', 8.6, '家庭', 0, 3534);
INSERT INTO `tv_series_data` VALUES (3152840230, '博弈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/450350/1351051825/8be4c65e183729009d4fed7ce6c89ab7.jpg', 'https://tv.2345.com/detail/16104.html', 9, '战争', 0, 6785);
INSERT INTO `tv_series_data` VALUES (3153258282, '罪之缘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/2843/d2cb217813a541d4c6d6764ec585f3bf.jpg', 'https://tv.2345.com/detail/2843.html', 9.2, '伦理', 0, 5236);
INSERT INTO `tv_series_data` VALUES (3157093103, '刀光枪影', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/15/s46876.jpg', 'https://tv.2345.com/detail/46876.html', 8.4, '战争', 0, 6667);
INSERT INTO `tv_series_data` VALUES (3160403965, '追杀横路靖六', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/2361/c7218b13590dd0126441440ae75f445c.jpg', 'https://tv.2345.com/detail/2361.html', 9.1, '战争', 0, 7581);
INSERT INTO `tv_series_data` VALUES (3160505977, '新敌后武工队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/19/s58444.jpg', 'https://tv.2345.com/detail/58444.html', 9.6, '战争', 0, 5431);
INSERT INTO `tv_series_data` VALUES (3160966795, '铁血红安', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/14/s43528.jpg?1415760051', 'https://tv.2345.com/detail/43528.html', 8.5, '战争', 0, 7336);
INSERT INTO `tv_series_data` VALUES (3163226205, '血雨母子情未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/15/s47819.jpg', 'https://tv.2345.com/detail/47819.html', 7.9, '战争', 0, 7900);
INSERT INTO `tv_series_data` VALUES (3163868528, '反击TV版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/14/s43302.jpg', 'https://tv.2345.com/detail/43302.html', 8.5, '战争', 0, 4430);
INSERT INTO `tv_series_data` VALUES (3165489808, '永远的战友', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/18/s56034.jpg', 'https://tv.2345.com/detail/56034.html', 9.8, '其他', 0, 5999);
INSERT INTO `tv_series_data` VALUES (3166404264, '一半天堂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/7/s21867.jpg?1410420711', 'https://tv.2345.com/detail/21867.html', 8.7, '伦理', 0, 3688);
INSERT INTO `tv_series_data` VALUES (3173002264, '陈云在一九四九', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/0/s383.jpg?1421375249', 'https://tv.2345.com/detail/383.html', 6.8, '军旅', 0, 5561);
INSERT INTO `tv_series_data` VALUES (3174456612, '我在1949等你', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/2/s8243.jpg', 'https://tv.2345.com/detail/8243.html', 8.9, '战争', 0, 3880);
INSERT INTO `tv_series_data` VALUES (3174495622, '刘伯承元帅', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/8/2.jpg', 'https://tv.2345.com/detail/17962.html', 9.2, '战争', 0, 7878);
INSERT INTO `tv_series_data` VALUES (3175167528, '浮华世家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/8/s26437.jpg?1382757912', 'https://tv.2345.com/detail/26437.html', 8.3, '家庭', 0, 7450);
INSERT INTO `tv_series_data` VALUES (3178809687, '乐俊凯', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/8/s24465.jpg?1376358957', 'https://tv.2345.com/detail/24465.html', 8.5, '家庭', 0, 3297);
INSERT INTO `tv_series_data` VALUES (3181026897, '生死血符', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/15/s47114.jpg?1442632094', 'https://tv.2345.com/detail/47114.html', 8.4, '战争', 0, 3201);
INSERT INTO `tv_series_data` VALUES (3186803453, '盘龙卧虎高山顶', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/902/f9a3102a674d27c9f9570296e3186b18.jpg', 'https://tv.2345.com/detail/902.html', 9.3, '军旅', 0, 6010);
INSERT INTO `tv_series_data` VALUES (3187395060, '记忆的力量抗美援朝', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/19/s58282.png', 'https://tv.2345.com/detail/58282.html', 8.9, '战争', 0, 5242);
INSERT INTO `tv_series_data` VALUES (3188398113, '没有国籍的女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/1239/67b17485ffabee541bef937a41fe9edc.jpg', 'https://tv.2345.com/detail/1239.html', 10, '伦理', 0, 4959);
INSERT INTO `tv_series_data` VALUES (3193483459, '裸婚之后未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/11/s35333.jpg?1405676990', 'https://tv.2345.com/detail/35333.html', 8.5, '家庭', 0, 6868);
INSERT INTO `tv_series_data` VALUES (3193542410, '革命人永远是年轻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/1/4485/e9a55bfb4a8aee1bbb9bb1442c8e92dd.jpg', 'https://tv.2345.com/detail/4485.html', 10, '战争', 0, 4989);
INSERT INTO `tv_series_data` VALUES (3196422303, '人到四十', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/1/5984/dceaea62cafdbc991ec0d2656f8cf4b6.jpg', 'https://tv.2345.com/detail/5984.html', 9.2, '家庭', 0, 4398);
INSERT INTO `tv_series_data` VALUES (3199661045, '最后的格格', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/300/49eaef5839b47f48a0dcba01df02c278.jpg', 'https://tv.2345.com/detail/300.html', 9.3, '伦理', 0, 3800);
INSERT INTO `tv_series_data` VALUES (3200186643, '家有爹娘第1部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/4/14022/2731d5368f17fa17eeec4d9d6a9229ae.jpg', 'https://tv.2345.com/detail/14022.html', 8.7, '家庭', 0, 3456);
INSERT INTO `tv_series_data` VALUES (3203270846, '星际精灵蓝多多', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/16/s50855.jpg', 'https://tv.2345.com/detail/50855.html', 9.2, '家庭', 0, 4737);
INSERT INTO `tv_series_data` VALUES (3204330743, '家有公婆', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/170/dc0e4ca5044ffc1be11efb0b61f43563.jpg', 'https://tv.2345.com/detail/170.html', 8.9, '伦理', 0, 7267);
INSERT INTO `tv_series_data` VALUES (3209407623, '媳妇儿和少奶奶', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/2/6618/f62f88cccfde0a9e84c1c2eb5586bd6a.jpg', 'https://tv.2345.com/detail/6618.html', 7.6, '伦理', 0, 3568);
INSERT INTO `tv_series_data` VALUES (3212136254, '敌后武工队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/5/15938/a8aed27b162999c0c5e2312cca6e16fa.jpg', 'https://tv.2345.com/detail/15938.html', 10, '战争', 0, 5417);
INSERT INTO `tv_series_data` VALUES (3213093173, '远远的爱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/2/7597/557c96e5dce4edbb264d3405edb31b74.jpg', 'https://tv.2345.com/detail/7597.html', 8.4, '军旅', 0, 3668);
INSERT INTO `tv_series_data` VALUES (3214902930, '天涯赤子心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/817/88d6c75c111fe488e3106892511f6708.jpg', 'https://tv.2345.com/detail/817.html', 9.7, '家庭', 0, 6348);
INSERT INTO `tv_series_data` VALUES (3217951783, '我爱男闺蜜', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/10/s32169.jpg?1395207691', 'https://tv.2345.com/detail/32169.html', 8.7, '家庭', 0, 7908);
INSERT INTO `tv_series_data` VALUES (3218138285, '剧说2019', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/18/s56068.jpg', 'https://tv.2345.com/detail/56068.html', 8.2, '其他', 0, 3813);
INSERT INTO `tv_series_data` VALUES (3219170151, '谁怜天下慈母心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/205/0193b65b05b9608e57a203cb4be23693.jpg', 'https://tv.2345.com/detail/205.html', 9.3, '伦理', 0, 5028);
INSERT INTO `tv_series_data` VALUES (3226964448, '女高男低', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/2/s6066.jpg', 'https://tv.2345.com/detail/6066.html', 9, '伦理', 0, 4155);
INSERT INTO `tv_series_data` VALUES (3228666034, '金枝玉叶未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/1936/2363044678e5706947e21f2214d30ed9.jpg', 'https://tv.2345.com/detail/1936.html', 8.9, '家庭', 0, 7752);
INSERT INTO `tv_series_data` VALUES (3231457612, '离婚女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/2/6483/db05db86a4dec4297adb7ce34f1ac638.jpg', 'https://tv.2345.com/detail/6483.html', 9.2, '伦理', 0, 4234);
INSERT INTO `tv_series_data` VALUES (3236607219, '铁甲舰上的男人们未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/15/s46583.jpg', 'https://tv.2345.com/detail/46583.html', 8.8, '战争', 0, 4837);
INSERT INTO `tv_series_data` VALUES (3236796644, '生活家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/19/s59132.jpg', 'https://tv.2345.com/detail/59132.html', 9.7, '家庭', 0, 5008);
INSERT INTO `tv_series_data` VALUES (3242974795, '爱无尽头', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/210/e85dda4bbed4c768bb8048ff1538816c.jpg', 'https://tv.2345.com/detail/210.html', 8.7, '家庭', 0, 7472);
INSERT INTO `tv_series_data` VALUES (3244960849, '古董局中局', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/18/s55714.jpg', 'https://tv.2345.com/detail/55714.html', 9.5, '悬疑', 0, 3394);
INSERT INTO `tv_series_data` VALUES (3246637867, '漂亮主妇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/4/3.jpg', 'https://tv.2345.com/detail/18433.html', 9.2, '家庭', 0, 4840);
INSERT INTO `tv_series_data` VALUES (3249198020, '反抗之真心英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/97/s97.jpg', 'https://tv.2345.com/detail/97.html', 8.8, '军旅', 0, 7053);
INSERT INTO `tv_series_data` VALUES (3251726967, '绿野', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/2229/41cffbfbfd82ebde4ccba5e657ea6807.jpg', 'https://tv.2345.com/detail/2229.html', 8.8, '伦理', 0, 7694);
INSERT INTO `tv_series_data` VALUES (3251863013, '锦衣之下', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/18/s56788.jpg?1572586249', 'https://tv.2345.com/detail/56788.html', 8.7, '悬疑', 0, 7733);
INSERT INTO `tv_series_data` VALUES (3261127493, '铁血尖刀', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/11/s33006.jpg?1409539089', 'https://tv.2345.com/detail/33006.html', 8.8, '战争', 0, 5923);
INSERT INTO `tv_series_data` VALUES (3266115902, '花飞尽归不归', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/17/s52182.jpg', 'https://tv.2345.com/detail/52182.html', 7.9, '家庭', 0, 6975);
INSERT INTO `tv_series_data` VALUES (3267454216, '勇士之城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/11/s35529.jpg?1401355358', 'https://tv.2345.com/detail/35529.html', 8.8, '战争', 0, 3623);
INSERT INTO `tv_series_data` VALUES (3268766428, '关中枪声', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/401/d75cb445f7690ee7073d931f4f827778.jpg', 'https://tv.2345.com/detail/401.html', 9.4, '战争', 0, 7757);
INSERT INTO `tv_series_data` VALUES (3272496898, '离婚官司', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/1/4624/a62b870599f79fed6c606789d921ef62.jpg', 'https://tv.2345.com/detail/4624.html', 8.9, '伦理', 0, 6326);
INSERT INTO `tv_series_data` VALUES (3275250856, '家家有本难念的经', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/385/s385.jpg', 'https://tv.2345.com/detail/385.html', 8.8, '家庭', 0, 3405);
INSERT INTO `tv_series_data` VALUES (3275371350, '青鸟的天空', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/2284/978a61b8bde820a3adb7e97e4c5c7539.jpg', 'https://tv.2345.com/detail/2284.html', 10, '家庭', 0, 4158);
INSERT INTO `tv_series_data` VALUES (3280415085, '花篮的花儿香', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/3/11496/caac5b6dcf7f3aef8a447eb6a287671d.jpg', 'https://tv.2345.com/detail/11496.html', 8.5, '战争', 0, 7386);
INSERT INTO `tv_series_data` VALUES (3280756729, '梅艳芳菲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/34/00b31c461e970d9ccdbf9de2d65d30be.jpg', 'https://tv.2345.com/detail/34.html', 8.9, '家庭', 0, 6523);
INSERT INTO `tv_series_data` VALUES (3281145943, '五台山抗日传奇之女兵排', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/19/s58839.png', 'https://tv.2345.com/detail/58839.html', 8.2, '战争', 0, 6958);
INSERT INTO `tv_series_data` VALUES (3281244470, '扫黑重案组', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/15/s47426.jpg', 'https://tv.2345.com/detail/47426.html', 8.8, '悬疑', 0, 5426);
INSERT INTO `tv_series_data` VALUES (3281277474, '毛泽东三兄弟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/16/s48906.jpg?1466481078', 'https://tv.2345.com/detail/48906.html', 8.5, '其他', 0, 3272);
INSERT INTO `tv_series_data` VALUES (3282716430, '海棠依旧李幼斌版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/16/s48999.jpg?1467697561', 'https://tv.2345.com/detail/48999.html', 8.4, '家庭', 0, 4202);
INSERT INTO `tv_series_data` VALUES (3284170339, '黑狐之风影', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/17/s52366.jpg', 'https://tv.2345.com/detail/52366.html', 8.5, '战争', 0, 3325);
INSERT INTO `tv_series_data` VALUES (3291346084, '大路朝天', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/775/s775.jpg', 'https://tv.2345.com/detail/775.html', 8.8, '军旅', 0, 6595);
INSERT INTO `tv_series_data` VALUES (3292030185, '红色', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/13/s41545.jpg?1412560614', 'https://tv.2345.com/detail/41545.html', 8.4, '战争', 0, 7807);
INSERT INTO `tv_series_data` VALUES (3299439551, '穿越烽火线', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/8/s24266.jpg?1376877308', 'https://tv.2345.com/detail/24266.html', 8.5, '战争', 0, 3813);
INSERT INTO `tv_series_data` VALUES (3299687724, '花与罪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/20/s61180.jpg', 'https://tv.2345.com/detail/61180.html', 9.8, '悬疑', 0, 6877);
INSERT INTO `tv_series_data` VALUES (3303398306, '软弱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/2231/s2231.jpg', 'https://tv.2345.com/detail/2231.html', 9.6, '伦理', 0, 3978);
INSERT INTO `tv_series_data` VALUES (3304131523, '父爱如山', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/1284/bdeb464468952542c4773c183cadb53d.jpg', 'https://tv.2345.com/detail/1284.html', 9.3, '家庭', 0, 7950);
INSERT INTO `tv_series_data` VALUES (3305967797, '老爸驾到', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/2/8328/c71f551b703aec099a9c3a143624b7dc.jpg', 'https://tv.2345.com/detail/8328.html', 9.8, '家庭', 0, 4646);
INSERT INTO `tv_series_data` VALUES (3312068510, '老公们的私房钱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/16/s48341.jpg?1478074877', 'https://tv.2345.com/detail/48341.html', 7.9, '家庭', 0, 3501);
INSERT INTO `tv_series_data` VALUES (3314811768, '四保临江', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/19/s58313.jpg', 'https://tv.2345.com/detail/58313.html', 8.8, '战争', 0, 3977);
INSERT INTO `tv_series_data` VALUES (3321988675, '乱世佳人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/d/5.jpg', 'https://tv.2345.com/detail/10985.html', 9.2, '家庭', 0, 5543);
INSERT INTO `tv_series_data` VALUES (3322211159, '瑞雪丰年', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/2/s6896.jpg', 'https://tv.2345.com/detail/17353.html', 8.8, '伦理', 0, 4330);
INSERT INTO `tv_series_data` VALUES (3325264741, '狙击手', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/514/5a50f976d5f8f610c66df3625114aadc.jpg', 'https://tv.2345.com/detail/514.html', 7.8, '战争', 0, 3341);
INSERT INTO `tv_series_data` VALUES (3326192185, '誓言永恒电视剧', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/18/s56469.jpg', 'https://tv.2345.com/detail/56469.html', 8.1, '战争', 0, 7892);
INSERT INTO `tv_series_data` VALUES (3328291772, '不能没有你', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/1/3301/4bb64cd333ca3393a58c39e5355d8ce1.jpg', 'https://tv.2345.com/detail/3301.html', 9, '伦理', 0, 4696);
INSERT INTO `tv_series_data` VALUES (3328651160, '与狼共舞2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/9/s28369.jpg?1387948654', 'https://tv.2345.com/detail/28369.html', 8.6, '战争', 0, 5600);
INSERT INTO `tv_series_data` VALUES (3332345767, '烽火侨女', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/18/s56849.jpg', 'https://tv.2345.com/detail/56849.html', 9.8, '战争', 0, 7430);
INSERT INTO `tv_series_data` VALUES (3333466874, '如歌的岁月', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/2/8346/d2e070aa367b257114455e41f3f3245d.jpg', 'https://tv.2345.com/detail/8346.html', 9.2, '家庭', 0, 4617);
INSERT INTO `tv_series_data` VALUES (3336136857, '枪声背后', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/653/03aca547d530e2dd3944928935f82ae0.jpg', 'https://tv.2345.com/detail/653.html', 8.8, '军旅', 0, 3067);
INSERT INTO `tv_series_data` VALUES (3340675441, '你的传奇之危机四伏', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/17/s52930.jpg', 'https://tv.2345.com/detail/52930.html', 8.5, '战争', 0, 3753);
INSERT INTO `tv_series_data` VALUES (3341877652, '父亲的身份未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/16/s48951.jpg', 'https://tv.2345.com/detail/48951.html', 7.6, '战争', 0, 4192);
INSERT INTO `tv_series_data` VALUES (3346129021, '家有儿女2电视剧', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/19/s57565.jpg', 'https://tv.2345.com/detail/57565.html', 7.9, '家庭', 0, 3633);
INSERT INTO `tv_series_data` VALUES (3346505945, '谁是真英雄TV剪辑版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/16/s50066.jpg', 'https://tv.2345.com/detail/50066.html', 9, '战争', 0, 5441);
INSERT INTO `tv_series_data` VALUES (3347689548, '一号机密', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/17/s52371.jpg', 'https://tv.2345.com/detail/52371.html', 8.7, '战争', 0, 7381);
INSERT INTO `tv_series_data` VALUES (3349075492, '幸福美丽绽放', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/12/s36479.jpg?1403399139', 'https://tv.2345.com/detail/36479.html', 8.5, '家庭', 0, 6786);
INSERT INTO `tv_series_data` VALUES (3351677102, '女人当官2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/18/s56017.jpg', 'https://tv.2345.com/detail/56017.html', 8.2, '家庭', 0, 5989);
INSERT INTO `tv_series_data` VALUES (3352881266, '民国恩仇录', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/449611/1348833348/6dad5e8dfa5c62fe74b43d0ed5584d9d.jpg', 'https://tv.2345.com/detail/14813.html', 8.2, '家庭', 0, 5082);
INSERT INTO `tv_series_data` VALUES (3352955788, '战火中青春', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/331/f50e95b733498d2025906f86d1dcc2c1.jpg', 'https://tv.2345.com/detail/331.html', 10, '战争', 0, 7246);
INSERT INTO `tv_series_data` VALUES (3360496245, '不良家族', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/1778/72e6dcc902562e798db4c890433abfcb.jpg', 'https://tv.2345.com/detail/1778.html', 8.6, '家庭', 0, 6675);
INSERT INTO `tv_series_data` VALUES (3362148266, '浮沉', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/3/s10399.jpg', 'https://tv.2345.com/detail/10399.html', 9.3, '家庭', 0, 6634);
INSERT INTO `tv_series_data` VALUES (3362213829, '孽债', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/1/3863/1129998a076400300c2aceae616282dd.jpg', 'https://tv.2345.com/detail/3863.html', 10, '家庭', 0, 4407);
INSERT INTO `tv_series_data` VALUES (3372634526, '茶色飘香', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/10/s30372.jpg', 'https://tv.2345.com/detail/30372.html', 8.2, '家庭', 0, 4706);
INSERT INTO `tv_series_data` VALUES (3372885833, '天啸', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/1/3182/ea4ab57c9d6baca997148cf8b6a953b3.jpg', 'https://tv.2345.com/detail/3182.html', 8.2, '战争', 0, 7026);
INSERT INTO `tv_series_data` VALUES (3374491067, '相爱不易', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/2/8749/9caffb2874aa2c81087548abca7d9b60.jpg', 'https://tv.2345.com/detail/8749.html', 10, '家庭', 0, 3473);
INSERT INTO `tv_series_data` VALUES (3374941176, '东方红1949', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/1922/a8c55f0c89cb6a376916bd9b54f3443e.jpg', 'https://tv.2345.com/detail/1922.html', 10, '战争', 0, 6204);
INSERT INTO `tv_series_data` VALUES (3376596511, '今天不上班', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/15/s45217.jpg', 'https://tv.2345.com/detail/45217.html', 9.3, '其他', 0, 7321);
INSERT INTO `tv_series_data` VALUES (3378311878, '前妻回家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/1689/bf6ce658273f79d296396fcc6cc74eff.jpg', 'https://tv.2345.com/detail/1689.html', 9, '伦理', 0, 3060);
INSERT INTO `tv_series_data` VALUES (3378721443, '双刺未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/16/s50247.jpg', 'https://tv.2345.com/detail/50247.html', 8.7, '战争', 0, 5413);
INSERT INTO `tv_series_data` VALUES (3378784454, '继父回家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/15/s47663.jpg?1449643420', 'https://tv.2345.com/detail/47663.html', 8.6, '家庭', 0, 7608);
INSERT INTO `tv_series_data` VALUES (3380325638, '广告狂人第7季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/11/s34478.jpg?1397527749', 'https://tv.2345.com/detail/34478.html', 8.4, '家庭', 0, 6824);
INSERT INTO `tv_series_data` VALUES (3384005515, '家有仙妻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/1/4815/98c6204a38d73a57d19763a6ba670745.jpg', 'https://tv.2345.com/detail/4815.html', 9, '家庭', 0, 6091);
INSERT INTO `tv_series_data` VALUES (3386468230, '养女', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/5/s16353.jpg?1396941551', 'https://tv.2345.com/detail/16353.html', 8.3, '家庭', 0, 3005);
INSERT INTO `tv_series_data` VALUES (3387523196, '幸福归来', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/15/s47357.jpg?1445915941', 'https://tv.2345.com/detail/47357.html', 8.5, '家庭', 0, 4837);
INSERT INTO `tv_series_data` VALUES (3387897421, '儿女冤家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/672/312f7fcea4f9663e940d5460ceba4b38.jpg', 'https://tv.2345.com/detail/672.html', 9.1, '家庭', 0, 4907);
INSERT INTO `tv_series_data` VALUES (3391482824, '寻路', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/7/s22921.jpg?1371699897', 'https://tv.2345.com/detail/22921.html', 8.2, '战争', 0, 4383);
INSERT INTO `tv_series_data` VALUES (3391924402, '生死翻盘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/15/s47910.jpg?1454292941', 'https://tv.2345.com/detail/47910.html', 8.4, '战争', 0, 7457);
INSERT INTO `tv_series_data` VALUES (3392934591, '绝命后卫师', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/16/s48060.jpg?1476165595', 'https://tv.2345.com/detail/48060.html', 7.9, '战争', 0, 3213);
INSERT INTO `tv_series_data` VALUES (3396043734, '小别离', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/15/s47151.jpg?1470884040', 'https://tv.2345.com/detail/47151.html', 8.6, '家庭', 0, 6579);
INSERT INTO `tv_series_data` VALUES (3396721098, '谍战狂花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/1144/s1144.jpg', 'https://tv.2345.com/detail/1144.html', 8.8, '战争', 0, 3960);
INSERT INTO `tv_series_data` VALUES (3398145952, '家和万事兴之兄弟姐妹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/16/s50986.jpg', 'https://tv.2345.com/detail/50986.html', 7.7, '其他', 0, 7694);
INSERT INTO `tv_series_data` VALUES (3402978976, '假如幸福来临', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/13/s40385.jpg?1407302194', 'https://tv.2345.com/detail/40385.html', 8.8, '伦理', 0, 7094);
INSERT INTO `tv_series_data` VALUES (3403944651, '幸福二重奏TV版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/20/s61295.jpg', 'https://tv.2345.com/detail/61295.html', 7.1, '家庭', 0, 7028);
INSERT INTO `tv_series_data` VALUES (3407378705, '离婚再婚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/4/12368/84d9c5c580ecfec49d09a8d4573913f4.jpg', 'https://tv.2345.com/detail/12368.html', 8.9, '家庭', 0, 7177);
INSERT INTO `tv_series_data` VALUES (3408345229, '学校2015', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/16/s48257.jpg', 'https://tv.2345.com/detail/48257.html', 8.1, '悬疑', 0, 5582);
INSERT INTO `tv_series_data` VALUES (3413670703, '平凡的谎言', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/16/s48479.jpg', 'https://tv.2345.com/detail/48479.html', 7.1, '其他', 0, 5986);
INSERT INTO `tv_series_data` VALUES (3414825790, '上将许世友', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/1/3144/0333d4e17b546e18a83fd8be651a3e32.jpg', 'https://tv.2345.com/detail/3144.html', 10, '战争', 0, 6604);
INSERT INTO `tv_series_data` VALUES (3416517438, '沉默与谎言', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/1/4254/d98697acbf6b81c0da7e2826f7288ed2.jpg', 'https://tv.2345.com/detail/4254.html', 9.1, '伦理', 0, 7912);
INSERT INTO `tv_series_data` VALUES (3416628962, '春暖花开', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/1875/d3b385f67ab78469a9b37cc0175c88af.jpg', 'https://tv.2345.com/detail/1875.html', 9, '家庭', 0, 3381);
INSERT INTO `tv_series_data` VALUES (3437833213, '和平年代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/2/8218/bca65736e622b70bb83e7c91a0dec19f.jpg', 'https://tv.2345.com/detail/8218.html', 10, '战争', 0, 3021);
INSERT INTO `tv_series_data` VALUES (3441652047, '陪你一起长大乘风破浪的家长', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/19/s59049.jpg', 'https://tv.2345.com/detail/59049.html', 7.9, '家庭', 0, 7421);
INSERT INTO `tv_series_data` VALUES (3442890338, '甜蜜的烦恼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/17/s53316.jpg', 'https://tv.2345.com/detail/53316.html', 8.7, '家庭', 0, 7190);
INSERT INTO `tv_series_data` VALUES (3447143450, '我的故乡晋察冀', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/7/s22375.jpg?1370483841', 'https://tv.2345.com/detail/22375.html', 8.5, '战争', 0, 4268);
INSERT INTO `tv_series_data` VALUES (3448959099, '世间路大陆版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/5/9.jpg', 'https://tv.2345.com/detail/17497.html', 8.8, '家庭', 0, 5848);
INSERT INTO `tv_series_data` VALUES (3450982898, '父亲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/2/6388/8bc82b5a411da43ee66fc137dc9d8462.jpg', 'https://tv.2345.com/detail/6388.html', 8, '家庭', 0, 3030);
INSERT INTO `tv_series_data` VALUES (3451044882, '纸婚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/11/s33203.jpg?1400982272', 'https://tv.2345.com/detail/33203.html', 8.4, '家庭', 0, 7614);
INSERT INTO `tv_series_data` VALUES (3451129515, '毕业歌', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/15/s46777.jpg?1438843353', 'https://tv.2345.com/detail/46777.html', 8.5, '战争', 0, 5939);
INSERT INTO `tv_series_data` VALUES (3452240662, '郎本无情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/15/s45476.jpg', 'https://tv.2345.com/detail/45476.html', 7.3, '家庭', 0, 7985);
INSERT INTO `tv_series_data` VALUES (3452899179, '爱的多米诺', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/13/s39069.jpg?1404012928', 'https://tv.2345.com/detail/39069.html', 8.5, '家庭', 0, 7449);
INSERT INTO `tv_series_data` VALUES (3453055127, '卧底第1季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/17/s52871.jpg?1490688666', 'https://tv.2345.com/detail/52871.html', 8.6, '悬疑', 0, 5045);
INSERT INTO `tv_series_data` VALUES (3454055855, '谁来伺候妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/2/8320/e33c31e8ea04a12f3552e354d9f2ce91.jpg', 'https://tv.2345.com/detail/8320.html', 8.5, '家庭', 0, 4892);
INSERT INTO `tv_series_data` VALUES (3455038468, '谁是真英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/8/s25154.jpg?1379292998', 'https://tv.2345.com/detail/25154.html', 8.6, '战争', 0, 3583);
INSERT INTO `tv_series_data` VALUES (3455979725, '我家有喜', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/4/s12149.jpg?1423195050', 'https://tv.2345.com/detail/12149.html', 8.9, '家庭', 0, 7843);
INSERT INTO `tv_series_data` VALUES (3459996884, '假如幸福来临', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/13/s40385.jpg?1407302194', 'https://tv.2345.com/detail/40385.html', 8.8, '家庭', 0, 4298);
INSERT INTO `tv_series_data` VALUES (3460004148, '黑土热血', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/17/s53409.jpg', 'https://tv.2345.com/detail/53409.html', 8.5, '战争', 0, 5454);
INSERT INTO `tv_series_data` VALUES (3466020277, '狭路', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/16/s48772.jpg?1465184344', 'https://tv.2345.com/detail/48772.html', 8.6, '战争', 0, 5920);
INSERT INTO `tv_series_data` VALUES (3471234608, '《江湖正道》', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/16/s50304.jpg', 'https://tv.2345.com/detail/50304.html', 7.1, '战争', 0, 6465);
INSERT INTO `tv_series_data` VALUES (3472835397, '女子戏班', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/20/s60849.jpg', 'https://tv.2345.com/detail/60849.html', 9.2, '战争', 0, 4015);
INSERT INTO `tv_series_data` VALUES (3475051110, '远去的飞鹰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/0/s1954.jpg?1364977684', 'https://tv.2345.com/detail/1954.html', 8.5, '战争', 0, 5578);
INSERT INTO `tv_series_data` VALUES (3475709649, '终极悬案', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/2/6114/9d8d0ef5ada53744163bcddc5025afd3.jpg', 'https://tv.2345.com/detail/6114.html', 9.8, '悬疑', 0, 4010);
INSERT INTO `tv_series_data` VALUES (3476698764, '反击美版第1季限时免费', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/15/s46432.jpg', 'https://tv.2345.com/detail/46432.html', 7, '战争', 0, 4644);
INSERT INTO `tv_series_data` VALUES (3480549699, '第二次人生未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/15/s45214.jpg', 'https://tv.2345.com/detail/45214.html', 8.1, '家庭', 0, 4312);
INSERT INTO `tv_series_data` VALUES (3481090102, '开天辟地', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/1883/71829f5d7ac27a1e70cb9ff5e1f3a094.jpg', 'https://tv.2345.com/detail/1883.html', 8.3, '战争', 0, 4362);
INSERT INTO `tv_series_data` VALUES (3484278999, '家和万事兴之花好月圆未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/15/s47633.jpg', 'https://tv.2345.com/detail/47633.html', 8.5, '伦理', 0, 7215);
INSERT INTO `tv_series_data` VALUES (3489530845, '东城梦魇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/19/s59395.jpg', 'https://tv.2345.com/detail/59395.html', 9.7, '悬疑', 0, 4206);
INSERT INTO `tv_series_data` VALUES (3490781362, '母爱无悔', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/16/s49589.jpg', 'https://tv.2345.com/detail/49589.html', 8.7, '伦理', 0, 7320);
INSERT INTO `tv_series_data` VALUES (3490973897, '游戏规则', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/16/s50362.jpg', 'https://tv.2345.com/detail/50362.html', 8.7, '其他', 0, 6836);
INSERT INTO `tv_series_data` VALUES (3491243104, '地火', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/5/s15129.jpg?1404527533', 'https://tv.2345.com/detail/15129.html', 8.4, '战争', 0, 5858);
INSERT INTO `tv_series_data` VALUES (3492523183, '落地请开手机', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/1/s5363.jpg?1364546723', 'https://tv.2345.com/detail/5363.html', 9.7, '悬疑', 0, 7936);
INSERT INTO `tv_series_data` VALUES (3494560671, '国宝奇旅', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/18/s55524.jpg?1548211716', 'https://tv.2345.com/detail/55524.html', 8.8, '战争', 0, 4774);
INSERT INTO `tv_series_data` VALUES (3495854213, '说好不分手', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/1814/bc1c6e3c74efeb39a295ecbfd732fbd0.jpg', 'https://tv.2345.com/detail/1814.html', 9, '伦理', 0, 7485);
INSERT INTO `tv_series_data` VALUES (3496015753, '小小飞虎队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/2022/5b73fbdc31e14d284137c65b51094866.jpg', 'https://tv.2345.com/detail/2022.html', 9.5, '家庭', 0, 5022);
INSERT INTO `tv_series_data` VALUES (3501261767, '国产大英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/15/s46348.jpg', 'https://tv.2345.com/detail/46348.html', 8.3, '其他', 0, 7438);
INSERT INTO `tv_series_data` VALUES (3502432698, '红娘子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/2/7823/572dcae409b8f35be558704455f2b358.jpg', 'https://tv.2345.com/detail/7823.html', 9.3, '战争', 0, 6966);
INSERT INTO `tv_series_data` VALUES (3503505365, '锄奸', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/1710/16bd4a5599cb813bc69ebfefe66b87ad.jpg', 'https://tv.2345.com/detail/1710.html', 8.9, '军旅', 0, 6332);
INSERT INTO `tv_series_data` VALUES (3504690970, '重返单身', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/1/3197/6f8694cdb4390311968e04490067700c.jpg', 'https://tv.2345.com/detail/3197.html', 7.6, '伦理', 0, 6950);
INSERT INTO `tv_series_data` VALUES (3505441957, '海魂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/1/5953/1de26141b1c67d832e74b049bfb1c8b5.jpg', 'https://tv.2345.com/detail/5953.html', 9.1, '战争', 0, 3715);
INSERT INTO `tv_series_data` VALUES (3505880121, '隐形将军', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/903/0b2a928ddd10d457a0d05d840ce404b4.jpg', 'https://tv.2345.com/detail/903.html', 9.4, '军旅', 0, 3708);
INSERT INTO `tv_series_data` VALUES (3510514587, '家国恩仇记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/18/s56609.jpg', 'https://tv.2345.com/detail/56609.html', 8.8, '战争', 0, 3737);
INSERT INTO `tv_series_data` VALUES (3510848612, '我们复婚吧', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/17/s53221.jpg', 'https://tv.2345.com/detail/53221.html', 9.2, '家庭', 0, 5697);
INSERT INTO `tv_series_data` VALUES (3516709515, '我的抗战之猎豹突击', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/14/s43248.jpg?1415080112', 'https://tv.2345.com/detail/43248.html', 8.1, '战争', 0, 7215);
INSERT INTO `tv_series_data` VALUES (3522777981, '与狼共舞未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/5/s17393.jpg?1410148702', 'https://tv.2345.com/detail/17393.html', 8.8, '战争', 0, 5061);
INSERT INTO `tv_series_data` VALUES (3523025828, '风起洛阳', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/20/s61200.jpg', 'https://tv.2345.com/detail/61200.html', 9.8, '悬疑', 0, 6939);
INSERT INTO `tv_series_data` VALUES (3525442174, '我哥我嫂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/19/s57384.jpg', 'https://tv.2345.com/detail/57384.html', 8.9, '家庭', 0, 5244);
INSERT INTO `tv_series_data` VALUES (3527161445, '樱桃红之袖珍妈妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/16/s48345.jpg', 'https://tv.2345.com/detail/48345.html', 8.7, '家庭', 0, 5528);
INSERT INTO `tv_series_data` VALUES (3528384438, '零号特工', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/611/2fd80ca3d96ceeddc4fe66c80a9e16c5.jpg', 'https://tv.2345.com/detail/611.html', 8.9, '战争', 0, 4254);
INSERT INTO `tv_series_data` VALUES (3532372570, '爱情有点蓝', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/1050/9b52d84d30ace951c835a16f20744019.jpg', 'https://tv.2345.com/detail/1050.html', 7, '伦理', 0, 5871);
INSERT INTO `tv_series_data` VALUES (3532416531, '家有公婆', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/170/dc0e4ca5044ffc1be11efb0b61f43563.jpg', 'https://tv.2345.com/detail/170.html', 8.9, '家庭', 0, 4706);
INSERT INTO `tv_series_data` VALUES (3534554432, '肥猫寻亲记之明天会更好', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/17/s51720.jpg', 'https://tv.2345.com/detail/51720.html', 9.1, '伦理', 0, 5941);
INSERT INTO `tv_series_data` VALUES (3539705432, '都挺好', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/18/s55889.jpg', 'https://tv.2345.com/detail/55889.html', 9.7, '家庭', 0, 3451);
INSERT INTO `tv_series_data` VALUES (3547895672, '宽恕', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/1356/84feb6c8248be98a5fdd5128fe837dee.jpg', 'https://tv.2345.com/detail/1356.html', 10, '悬疑', 0, 7843);
INSERT INTO `tv_series_data` VALUES (3550099872, '我的铁血金戈梦', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/15/s47796.jpg?1451528622', 'https://tv.2345.com/detail/47796.html', 8.4, '战争', 0, 5705);
INSERT INTO `tv_series_data` VALUES (3552315876, '玫瑰园里的老少爷们儿', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/860/s860.jpg', 'https://tv.2345.com/detail/860.html', 8.1, '家庭', 0, 7429);
INSERT INTO `tv_series_data` VALUES (3553634449, '特殊争夺', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/282/c948ff9f2b6491afdbdd2915a5fd311b.jpg', 'https://tv.2345.com/detail/282.html', 9.3, '悬疑', 0, 4916);
INSERT INTO `tv_series_data` VALUES (3553763427, '特种兵之霹雳火', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/15/s47534.jpg?1451978444', 'https://tv.2345.com/detail/47534.html', 8.6, '战争', 0, 6984);
INSERT INTO `tv_series_data` VALUES (3554067091, '相思树', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/1324/24c316d1cda47637449f525419e3719f.jpg', 'https://tv.2345.com/detail/1324.html', 9.5, '伦理', 0, 5721);
INSERT INTO `tv_series_data` VALUES (3554344910, '与狼共舞2DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/18/s55796.jpg', 'https://tv.2345.com/detail/55796.html', 8.8, '战争', 0, 5781);
INSERT INTO `tv_series_data` VALUES (3556600930, '谍变1939', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/2522/d2219bee49717dac104bfb7caa3c0a45.jpg', 'https://tv.2345.com/detail/2522.html', 8.7, '战争', 0, 3676);
INSERT INTO `tv_series_data` VALUES (3556842435, '小麦进城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/3/s10369.jpg?1376033588', 'https://tv.2345.com/detail/10369.html', 9.7, '家庭', 0, 7136);
INSERT INTO `tv_series_data` VALUES (3557101007, '红粉世家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/2/8516/96ad6114093fc1697cc61dc94b47b33f.jpg', 'https://tv.2345.com/detail/8516.html', 9.2, '伦理', 0, 4244);
INSERT INTO `tv_series_data` VALUES (3560115499, '家和万事兴', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/0/s2648.jpg?1446711749', 'https://tv.2345.com/detail/2648.html', 8.5, '伦理', 0, 6855);
INSERT INTO `tv_series_data` VALUES (3560881444, '四十九日祭未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/14/s44479.jpg', 'https://tv.2345.com/detail/44479.html', 8.6, '战争', 0, 5503);
INSERT INTO `tv_series_data` VALUES (3562397986, '谍战深海', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/1/d.png', 'https://tv.2345.com/detail/12777.html', 9, '悬疑', 0, 7113);
INSERT INTO `tv_series_data` VALUES (3566458362, '下辈子还嫁给你', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/5/s17848.jpg?1364863635', 'https://tv.2345.com/detail/17848.html', 8.8, '伦理', 0, 5480);
INSERT INTO `tv_series_data` VALUES (3571094577, '绅士的品格', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/3/s9216.jpg', 'https://tv.2345.com/detail/9216.html', 9.3, '伦理', 0, 5729);
INSERT INTO `tv_series_data` VALUES (3573725695, '下辈子做你的女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/1404/b43476e12d3c843f469d1205d68ea627.jpg', 'https://tv.2345.com/detail/1404.html', 9.3, '家庭', 0, 6664);
INSERT INTO `tv_series_data` VALUES (3575498081, '暗红1936', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/2/8.jpg', 'https://tv.2345.com/detail/18693.html', 9.2, '战争', 0, 3500);
INSERT INTO `tv_series_data` VALUES (3577179927, '六尺之下第一季限时免费', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/15/s46141.jpg', 'https://tv.2345.com/detail/46141.html', 7.6, '家庭', 0, 6103);
INSERT INTO `tv_series_data` VALUES (3578992925, '百年荣宝斋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/866/d58561c17dc1996ac2c048d9435fde09.jpg', 'https://tv.2345.com/detail/866.html', 9.3, '家庭', 0, 6923);
INSERT INTO `tv_series_data` VALUES (3580262311, '姐妹新娘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/1376/a4d0d0944debba89b0abacfe5aedd9a6.gif', 'https://tv.2345.com/detail/1376.html', 9.2, '家庭', 0, 4848);
INSERT INTO `tv_series_data` VALUES (3582227627, '义海', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/17/s52945.jpg?1492399569', 'https://tv.2345.com/detail/52945.html', 8.4, '战争', 0, 4065);
INSERT INTO `tv_series_data` VALUES (3588644476, '绝地逢生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/762/b040757fef740854fd219b5cda4c43f9.jpg', 'https://tv.2345.com/detail/762.html', 9, '家庭', 0, 4041);
INSERT INTO `tv_series_data` VALUES (3589700686, '婚后五年', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/2200/bd55677ac261fb6a0ae3040ee5614f34.jpg', 'https://tv.2345.com/detail/2200.html', 9.1, '家庭', 0, 7511);
INSERT INTO `tv_series_data` VALUES (3591484895, '虎胆雷霆', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/1/s5831.jpg', 'https://tv.2345.com/detail/5831.html', 9, '战争', 0, 7228);
INSERT INTO `tv_series_data` VALUES (3594562858, '炊事班的故事2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/2/7945/1f073759cf292b24bb82efe4eb7e639f.jpg', 'https://tv.2345.com/detail/7945.html', 9.6, '战争', 0, 3840);
INSERT INTO `tv_series_data` VALUES (3595651752, '神探狄仁杰第3部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/540/0087e2b3d650a5ee0d253c5babb8d0d7.jpg', 'https://tv.2345.com/detail/540.html', 9.4, '悬疑', 0, 3468);
INSERT INTO `tv_series_data` VALUES (3596802974, '姥姥的饺子馆', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/18/s55716.jpg?1545876549', 'https://tv.2345.com/detail/55716.html', 9.2, '家庭', 0, 6335);
INSERT INTO `tv_series_data` VALUES (3605649666, '乐俊凯', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/8/s24465.jpg?1376358957', 'https://tv.2345.com/detail/24465.html', 8.5, '伦理', 0, 5946);
INSERT INTO `tv_series_data` VALUES (3606760968, '黎明前的暗战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/892/cb7c1c277a4f4c671560108252b33b3e.jpg', 'https://tv.2345.com/detail/892.html', 10, '战争', 0, 5249);
INSERT INTO `tv_series_data` VALUES (3610239812, '别阻挡我的幸福', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/1/s5898.jpg', 'https://tv.2345.com/detail/5898.html', 8.8, '家庭', 0, 4283);
INSERT INTO `tv_series_data` VALUES (3610416116, '永远一家人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/18/s55389.jpg', 'https://tv.2345.com/detail/55389.html', 8.6, '家庭', 0, 6950);
INSERT INTO `tv_series_data` VALUES (3611853496, '好运来临', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/16/s48094.jpg?1457661826', 'https://tv.2345.com/detail/48094.html', 8.4, '家庭', 0, 6735);
INSERT INTO `tv_series_data` VALUES (3612004685, '七十七封阵亡通知书', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/2/6946/6544545c6ce684a3e751a8b67d84560b.jpg', 'https://tv.2345.com/detail/6946.html', 8.8, '战争', 0, 7191);
INSERT INTO `tv_series_data` VALUES (3613738901, '你是我的生命', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/4/1.jpg', 'https://tv.2345.com/detail/1496.html', 9.3, '伦理', 0, 7127);
INSERT INTO `tv_series_data` VALUES (3615861187, '螳螂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/923/2691c1479e27d34716a71d6ce487856f.jpg', 'https://tv.2345.com/detail/923.html', 9, '悬疑', 0, 5132);
INSERT INTO `tv_series_data` VALUES (3622026843, '完美伴侣', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/20/s61300.jpg', 'https://tv.2345.com/detail/61300.html', 9, '家庭', 0, 4855);
INSERT INTO `tv_series_data` VALUES (3623554768, '罗武林向前冲韩语版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/2/s8132.jpg?1364268157', 'https://tv.2345.com/detail/8132.html', 8.5, '家庭', 0, 5961);
INSERT INTO `tv_series_data` VALUES (3624157872, '幸福满满', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/6/s18408.jpg?1365314338', 'https://tv.2345.com/detail/18408.html', 8.5, '家庭', 0, 3063);
INSERT INTO `tv_series_data` VALUES (3627964256, '独立纵队未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/17/s52362.jpg', 'https://tv.2345.com/detail/52362.html', 8.3, '战争', 0, 4001);
INSERT INTO `tv_series_data` VALUES (3628997761, '情惑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/2216/s2216.jpg', 'https://tv.2345.com/detail/2216.html', 8.8, '家庭', 0, 7608);
INSERT INTO `tv_series_data` VALUES (3630044615, '兵峰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/634/204ac5123e72dd5f5cff58f5fd1240fd.jpg', 'https://tv.2345.com/detail/634.html', 8.5, '军旅', 0, 3369);
INSERT INTO `tv_series_data` VALUES (3633323821, '北平战与和', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/3/9625/4119af4a98c4fd61246ef725977de699.jpg', 'https://tv.2345.com/detail/9625.html', 9.2, '战争', 0, 7535);
INSERT INTO `tv_series_data` VALUES (3633440164, '母亲母亲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/8.jpg', 'https://tv.2345.com/detail/12776.html', 9.3, '家庭', 0, 4368);
INSERT INTO `tv_series_data` VALUES (3635253440, '无名卫士', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/18/s56161.jpg', 'https://tv.2345.com/detail/56161.html', 8.8, '军旅', 0, 7046);
INSERT INTO `tv_series_data` VALUES (3636191900, '天下无双', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/3/9618/ee152cb44f7de0f4187db450591c86fe.jpg', 'https://tv.2345.com/detail/9618.html', 9.8, '家庭', 0, 5418);
INSERT INTO `tv_series_data` VALUES (3637641264, '铁血刀锋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/11/s33315.jpg?1408930067', 'https://tv.2345.com/detail/33315.html', 8.6, '战争', 0, 7296);
INSERT INTO `tv_series_data` VALUES (3638465118, '危情姐妹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/1/s4525.jpg?1410419603', 'https://tv.2345.com/detail/4525.html', 7.8, '伦理', 0, 4610);
INSERT INTO `tv_series_data` VALUES (3639412838, '本色', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/2/6632/796894b9b7d1aad198bf315da78dc354.jpg', 'https://tv.2345.com/detail/6632.html', 9.8, '悬疑', 0, 7527);
INSERT INTO `tv_series_data` VALUES (3641303734, '风华正茂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/2172/s2172.jpg', 'https://tv.2345.com/detail/2172.html', 6.1, '军旅', 0, 6176);
INSERT INTO `tv_series_data` VALUES (3642281772, '边缘之舞特别篇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/9/s27609.jpg?1410421467', 'https://tv.2345.com/detail/27609.html', 8.6, '其他', 0, 3605);
INSERT INTO `tv_series_data` VALUES (3644321020, '飞虎队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/15/s47032.jpg?1441879111', 'https://tv.2345.com/detail/47032.html', 8.4, '战争', 0, 4084);
INSERT INTO `tv_series_data` VALUES (3646327922, '说好不分家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/2182/s2182.jpg', 'https://tv.2345.com/detail/2182.html', 8.7, '家庭', 0, 7462);
INSERT INTO `tv_series_data` VALUES (3646555141, '枪花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/6/s20977.jpg?1366090756', 'https://tv.2345.com/detail/20977.html', 8.9, '悬疑', 0, 4941);
INSERT INTO `tv_series_data` VALUES (3647304473, '深瞳', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/2779/d47f202a500df527987c25d39b8c900e.jpg', 'https://tv.2345.com/detail/2779.html', 9.3, '悬疑', 0, 4016);
INSERT INTO `tv_series_data` VALUES (3654112331, '真情不眠', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/731/ed80769242d73c757a4033c6dfd867ea.jpg', 'https://tv.2345.com/detail/731.html', 8.7, '家庭', 0, 6235);
INSERT INTO `tv_series_data` VALUES (3654381155, '铁血将军', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/17/s52749.jpg?1493356871', 'https://tv.2345.com/detail/52749.html', 8.2, '战争', 0, 5241);
INSERT INTO `tv_series_data` VALUES (3656604478, '奠基者', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/1314/030a6d5a624e0c56cdeba452b0927785.jpg', 'https://tv.2345.com/detail/1314.html', 6.7, '战争', 0, 4235);
INSERT INTO `tv_series_data` VALUES (3657004713, '正义永恒', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/2/s6007.jpg?1364978261', 'https://tv.2345.com/detail/6007.html', 8.3, '悬疑', 0, 3534);
INSERT INTO `tv_series_data` VALUES (3659394409, '米兰达第2季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/1/s3505.jpg', 'https://tv.2345.com/detail/3505.html', 8, '伦理', 0, 6924);
INSERT INTO `tv_series_data` VALUES (3660198389, '烽火英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/18/s55813.jpg', 'https://tv.2345.com/detail/55813.html', 7.8, '战争', 0, 4191);
INSERT INTO `tv_series_data` VALUES (3662105321, '轶灵101', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/16/s48220.jpg', 'https://tv.2345.com/detail/48220.html', 8.8, '悬疑', 0, 4263);
INSERT INTO `tv_series_data` VALUES (3667851295, '婆婆来了', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/890/3cb5dceac2a43674bb8a8f89e330f8d7.jpg', 'https://tv.2345.com/detail/890.html', 8, '家庭', 0, 7277);
INSERT INTO `tv_series_data` VALUES (3671613533, '好歹一家人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/3/10061/98d7ff2e2865e78c159fe429c0a2fe70.jpg', 'https://tv.2345.com/detail/10061.html', 9, '家庭', 0, 4488);
INSERT INTO `tv_series_data` VALUES (3673736897, '玉海棠', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/16/s48498.jpg?1463213856', 'https://tv.2345.com/detail/48498.html', 8.4, '战争', 0, 5701);
INSERT INTO `tv_series_data` VALUES (3674833268, '西风烈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/2/s6550.jpg', 'https://tv.2345.com/detail/6550.html', 9.1, '战争', 0, 5386);
INSERT INTO `tv_series_data` VALUES (3682377999, '高地', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/195/c273e483b468c516743a828148982d5d.jpg', 'https://tv.2345.com/detail/195.html', 9.3, '战争', 0, 7188);
INSERT INTO `tv_series_data` VALUES (3683302380, '媳妇的美好时代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/3/11514/bf7a79e1188c2b6d5d6d15857507a7dd.jpg', 'https://tv.2345.com/detail/11514.html', 9.7, '家庭', 0, 4765);
INSERT INTO `tv_series_data` VALUES (3687253882, '婚姻诉讼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/10/s32685.jpg', 'https://tv.2345.com/detail/32685.html', 7.1, '家庭', 0, 4991);
INSERT INTO `tv_series_data` VALUES (3690705637, '戒毒风云', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/19/s57288.jpg', 'https://tv.2345.com/detail/57288.html', 9.3, '悬疑', 0, 4016);
INSERT INTO `tv_series_data` VALUES (3691321836, '风雨龙虎山', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/254/dbc2b925f8a03972069c0b18d8b2a2e7.jpg', 'https://tv.2345.com/detail/254.html', 8.8, '伦理', 0, 3448);
INSERT INTO `tv_series_data` VALUES (3695001925, '人间正道是沧桑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/3/fe04322a2aa315a3e5a9b54d4339fb23.jpg', 'https://tv.2345.com/detail/3.html', 9.7, '战争', 0, 6725);
INSERT INTO `tv_series_data` VALUES (3695296158, '金玉满堂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/8/s25833.jpg?1494833115', 'https://tv.2345.com/detail/25833.html', 8.6, '伦理', 0, 4849);
INSERT INTO `tv_series_data` VALUES (3696070285, '名媛望族国语版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/5/s16016.jpg?1377228840', 'https://tv.2345.com/detail/16016.html', 8.5, '家庭', 0, 6953);
INSERT INTO `tv_series_data` VALUES (3696902664, '满仓进城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/14/s43252.jpg?1414996355', 'https://tv.2345.com/detail/43252.html', 8.1, '伦理', 0, 7214);
INSERT INTO `tv_series_data` VALUES (3697007503, '幸福来敲门央视版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/2/s8159.jpg', 'https://tv.2345.com/detail/8159.html', 7.8, '伦理', 0, 4349);
INSERT INTO `tv_series_data` VALUES (3697947609, '密电风云', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/3/s9721.jpg', 'https://tv.2345.com/detail/9721.html', 8.7, '战争', 0, 7316);
INSERT INTO `tv_series_data` VALUES (3698747266, '有情有义', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/1114/6ee32338c87d1c02741da1dbba026d95.jpg', 'https://tv.2345.com/detail/1114.html', 10, '家庭', 0, 5503);
INSERT INTO `tv_series_data` VALUES (3699839412, '擒狼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/17/s53188.jpg', 'https://tv.2345.com/detail/53188.html', 8.6, '战争', 0, 5196);
INSERT INTO `tv_series_data` VALUES (3705299690, '空镜子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/10/s30656.jpg', 'https://tv.2345.com/detail/30656.html', 9.4, '家庭', 0, 6317);
INSERT INTO `tv_series_data` VALUES (3714292382, '向着幸福前进', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/15/s45771.jpg?1481794403', 'https://tv.2345.com/detail/45771.html', 8.5, '伦理', 0, 7337);
INSERT INTO `tv_series_data` VALUES (3716434417, '绝对隐私', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/3/9676/3344fa3a25548c0a94f319e1e4f44b43.jpg', 'https://tv.2345.com/detail/9676.html', 9.5, '家庭', 0, 4955);
INSERT INTO `tv_series_data` VALUES (3717496513, '世纪末的晚钟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/1/s4367.jpg', 'https://tv.2345.com/detail/4367.html', 6.4, '伦理', 0, 3467);
INSERT INTO `tv_series_data` VALUES (3718688840, '幸福的完美', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/50/9d3cb9886d525da537610e37536930dc.jpg', 'https://tv.2345.com/detail/50.html', 9.1, '军旅', 0, 7540);
INSERT INTO `tv_series_data` VALUES (3720016432, '燕子李三传奇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/19/s58291.jpg', 'https://tv.2345.com/detail/58291.html', 9.7, '战争', 0, 7569);
INSERT INTO `tv_series_data` VALUES (3720886596, '大西北剿匪记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/18/s54698.jpg', 'https://tv.2345.com/detail/54698.html', 8.9, '战争', 0, 6436);
INSERT INTO `tv_series_data` VALUES (3721941151, '终极特警第4季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/9/s29493.jpg?1392272957', 'https://tv.2345.com/detail/29493.html', 8.5, '战争', 0, 6127);
INSERT INTO `tv_series_data` VALUES (3724428606, '老爸驾到全集', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/19/s57700.jpg', 'https://tv.2345.com/detail/57700.html', 8, '伦理', 0, 6984);
INSERT INTO `tv_series_data` VALUES (3725778048, '黄金地带', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/1681/83868fbe32db77e1cde45f1597dd5341.jpg', 'https://tv.2345.com/detail/1681.html', 8.9, '伦理', 0, 4478);
INSERT INTO `tv_series_data` VALUES (3726209031, '箭在弦上', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/4/s14803.png?1364782783', 'https://tv.2345.com/detail/14803.html', 9, '战争', 0, 4290);
INSERT INTO `tv_series_data` VALUES (3727782259, '老九门', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/15/s47892.jpg?1467680937', 'https://tv.2345.com/detail/47892.html', 8.7, '悬疑', 0, 5933);
INSERT INTO `tv_series_data` VALUES (3731396417, '大管家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/773/s773.jpg', 'https://tv.2345.com/detail/773.html', 8.8, '家庭', 0, 4908);
INSERT INTO `tv_series_data` VALUES (3731662006, '傻儿传奇之抗战到底', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/15/s47706.jpg?1450243093', 'https://tv.2345.com/detail/47706.html', 8.6, '战争', 0, 5517);
INSERT INTO `tv_series_data` VALUES (3737561500, '婆婆来了', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/890/3cb5dceac2a43674bb8a8f89e330f8d7.jpg', 'https://tv.2345.com/detail/890.html', 8, '伦理', 0, 4370);
INSERT INTO `tv_series_data` VALUES (3741215864, '李卫当官第三部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/2/s6323.jpg', 'https://tv.2345.com/detail/6323.html', 6.7, '家庭', 0, 5810);
INSERT INTO `tv_series_data` VALUES (3741712971, '无法抗拒', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/2741/c76ee2db2ed589981814ec8caec3f900.jpg', 'https://tv.2345.com/detail/2741.html', 9, '伦理', 0, 3034);
INSERT INTO `tv_series_data` VALUES (3742746637, '雾都魅影', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/319/ebc2e5499741303d8a4d179e3bbe82e7.jpg', 'https://tv.2345.com/detail/319.html', 8.8, '悬疑', 0, 7987);
INSERT INTO `tv_series_data` VALUES (3743871796, '汪洋中的一条船', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/2/8495/49093c5bf56bd75de196722c033a9f05.jpg', 'https://tv.2345.com/detail/8495.html', 9.6, '家庭', 0, 7363);
INSERT INTO `tv_series_data` VALUES (3744485357, '关东金王', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/3/10142/3876f20c5b5d009ec5304421d89eddff.jpg', 'https://tv.2345.com/detail/10142.html', 8.5, '战争', 0, 6862);
INSERT INTO `tv_series_data` VALUES (3748021609, '芙蓉锦', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/9/s27641.jpg?1430188731', 'https://tv.2345.com/detail/27641.html', 8.7, '战争', 0, 4329);
INSERT INTO `tv_series_data` VALUES (3748022817, '黑三角08版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/2/s6402.jpg', 'https://tv.2345.com/detail/6402.html', 6.1, '战争', 0, 5148);
INSERT INTO `tv_series_data` VALUES (3749293968, '紧急行动', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/19/s57024.jpg', 'https://tv.2345.com/detail/57024.html', 8.8, '战争', 0, 4611);
INSERT INTO `tv_series_data` VALUES (3749587606, '武间道', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/18/s54854.jpg', 'https://tv.2345.com/detail/54854.html', 8.8, '战争', 0, 4532);
INSERT INTO `tv_series_data` VALUES (3749756302, '纸风筝', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/17/s53961.jpg', 'https://tv.2345.com/detail/53961.html', 9.3, '家庭', 0, 7323);
INSERT INTO `tv_series_data` VALUES (3752334558, '情惑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/2216/s2216.jpg', 'https://tv.2345.com/detail/2216.html', 8.8, '伦理', 0, 6624);
INSERT INTO `tv_series_data` VALUES (3753706694, '共和国荣誉', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/17/s52184.jpg', 'https://tv.2345.com/detail/52184.html', 7.9, '其他', 0, 5846);
INSERT INTO `tv_series_data` VALUES (3756680340, '宫行记宫2独家探班', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/8/s24872.jpg?1410421278', 'https://tv.2345.com/detail/24872.html', 7.7, '其他', 0, 7733);
INSERT INTO `tv_series_data` VALUES (3758597737, '红雪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/5/s17901.jpg?1410420377', 'https://tv.2345.com/detail/17901.html', 8.8, '战争', 0, 5569);
INSERT INTO `tv_series_data` VALUES (3758935536, '内线', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/702/198467d4edca4901fc6b7b9397257253.jpg', 'https://tv.2345.com/detail/702.html', 9.3, '悬疑', 0, 6137);
INSERT INTO `tv_series_data` VALUES (3760101643, '绝恋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/834/s834.jpg', 'https://tv.2345.com/detail/834.html', 8.8, '伦理', 0, 4026);
INSERT INTO `tv_series_data` VALUES (3761692049, '围屋里的桃花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/2/s7885.jpg', 'https://tv.2345.com/detail/7885.html', 9.1, '战争', 0, 6393);
INSERT INTO `tv_series_data` VALUES (3763340035, '五十玫瑰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/1389/a9a1230b04c4c11bd056907135629236.jpg', 'https://tv.2345.com/detail/1389.html', 9.2, '伦理', 0, 7227);
INSERT INTO `tv_series_data` VALUES (3765135178, '麻辣冤家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/17/s53749.jpg', 'https://tv.2345.com/detail/53749.html', 8.7, '家庭', 0, 7138);
INSERT INTO `tv_series_data` VALUES (3770036277, '血色迷雾', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/1336/87165df7bfee39118f53a29592be12ef.jpg', 'https://tv.2345.com/detail/1336.html', 8.7, '战争', 0, 5892);
INSERT INTO `tv_series_data` VALUES (3772203679, '猎魔', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/15/s45454.jpg?1422255078', 'https://tv.2345.com/detail/45454.html', 8.3, '战争', 0, 6497);
INSERT INTO `tv_series_data` VALUES (3772445441, '嘿孩子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/16/s50367.jpg?1476777240', 'https://tv.2345.com/detail/50367.html', 8.6, '家庭', 0, 3580);
INSERT INTO `tv_series_data` VALUES (3772680457, '遇见幸福DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/18/s56551.jpg', 'https://tv.2345.com/detail/56551.html', 9.4, '家庭', 0, 6095);
INSERT INTO `tv_series_data` VALUES (3773257252, '不可能完成的任务', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/16/s50422.jpg?1477534727', 'https://tv.2345.com/detail/50422.html', 8.7, '战争', 0, 4185);
INSERT INTO `tv_series_data` VALUES (3785726540, '我的女儿我的泪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/592/s592.jpg', 'https://tv.2345.com/detail/592.html', 9.2, '家庭', 0, 5959);
INSERT INTO `tv_series_data` VALUES (3791435434, '热血军旗', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/16/s50279.jpg?1501835222', 'https://tv.2345.com/detail/50279.html', 8.9, '战争', 0, 3528);
INSERT INTO `tv_series_data` VALUES (3791610894, '返老还童', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/15/s45459.jpg', 'https://tv.2345.com/detail/45459.html', 7.5, '其他', 0, 3168);
INSERT INTO `tv_series_data` VALUES (3799388902, '我是传奇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/9/e.jpg', 'https://tv.2345.com/detail/10625.html', 8.5, '战争', 0, 5078);
INSERT INTO `tv_series_data` VALUES (3804079910, '女人何苦为难女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/4/s12471.jpg?1504057711', 'https://tv.2345.com/detail/12471.html', 9.1, '伦理', 0, 4084);
INSERT INTO `tv_series_data` VALUES (3811810402, '家和万事兴之花好月圆未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/15/s47633.jpg', 'https://tv.2345.com/detail/47633.html', 8.5, '家庭', 0, 7916);
INSERT INTO `tv_series_data` VALUES (3812555357, '无贼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/9/s28046.jpg?1387591189', 'https://tv.2345.com/detail/28046.html', 8.4, '家庭', 0, 3257);
INSERT INTO `tv_series_data` VALUES (3813167869, '枪神传奇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/449611/1348833707/d590587886d5ad10ab995be3608364e2.jpg', 'https://tv.2345.com/detail/14955.html', 9.8, '战争', 0, 3399);
INSERT INTO `tv_series_data` VALUES (3816199243, '勇者无敌', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/523/fa5480466c37b9655a908bfd1925837b.jpg', 'https://tv.2345.com/detail/523.html', 9.3, '悬疑', 0, 3500);
INSERT INTO `tv_series_data` VALUES (3820794317, '大望', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/1/5564/e2e721d9100977794ffc10f8fcd399c1.jpg', 'https://tv.2345.com/detail/5564.html', 7.8, '家庭', 0, 5746);
INSERT INTO `tv_series_data` VALUES (3821686292, '从爱情开始', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/2379/76830388b9c1c6e910ffdb299f008013.jpg', 'https://tv.2345.com/detail/2379.html', 8.8, '家庭', 0, 3137);
INSERT INTO `tv_series_data` VALUES (3823539465, '千里难寻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/375/5c86f331cef4ed7f0ec0de2f2c809033.jpg', 'https://tv.2345.com/detail/375.html', 9.5, '家庭', 0, 3977);
INSERT INTO `tv_series_data` VALUES (3825262766, '激情燃烧的岁月1', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/1611/658461b8e61e409ba2ce7ec27113d941.jpg', 'https://tv.2345.com/detail/1611.html', 9.4, '战争', 0, 3111);
INSERT INTO `tv_series_data` VALUES (3829842309, '没有国籍的女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/1239/67b17485ffabee541bef937a41fe9edc.jpg', 'https://tv.2345.com/detail/1239.html', 10, '家庭', 0, 3218);
INSERT INTO `tv_series_data` VALUES (3836453229, '你是我兄弟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/2212/s2212.jpg', 'https://tv.2345.com/detail/2212.html', 9.7, '家庭', 0, 4624);
INSERT INTO `tv_series_data` VALUES (3836655530, '血誓', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/8/s25728.jpg?1381022197', 'https://tv.2345.com/detail/25728.html', 8.3, '战争', 0, 3037);
INSERT INTO `tv_series_data` VALUES (3837027162, '小兵张嘎电视剧', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/13/s39343.jpg?1410422062', 'https://tv.2345.com/detail/39343.html', 6.1, '战争', 0, 4534);
INSERT INTO `tv_series_data` VALUES (3844796879, '鲜花盛开的村庄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/9/s29699.jpg?1392771252', 'https://tv.2345.com/detail/29699.html', 8.5, '家庭', 0, 4819);
INSERT INTO `tv_series_data` VALUES (3847203116, '月落长江', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/2/s8051.jpg', 'https://tv.2345.com/detail/8051.html', 8.8, '伦理', 0, 4802);
INSERT INTO `tv_series_data` VALUES (3847268370, '商道天问', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/14/s42861.jpg', 'https://tv.2345.com/detail/42861.html', 7.7, '伦理', 0, 6720);
INSERT INTO `tv_series_data` VALUES (3847534859, '城市的边缘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/19/s59097.jpg', 'https://tv.2345.com/detail/59097.html', 9.7, '悬疑', 0, 5852);
INSERT INTO `tv_series_data` VALUES (3854329434, '暖春', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/857/1ed8a4b66bd0202ffd268a117ffbb7e3.jpg', 'https://tv.2345.com/detail/857.html', 9.7, '家庭', 0, 5783);
INSERT INTO `tv_series_data` VALUES (3857507188, '胡杨女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/920/21a9bb972ce129442c8e2b4b98081380.jpg', 'https://tv.2345.com/detail/920.html', 9.2, '家庭', 0, 4718);
INSERT INTO `tv_series_data` VALUES (3866656737, '我的宝贝', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/15/s46578.jpg?1498720458', 'https://tv.2345.com/detail/46578.html', 8.6, '家庭', 0, 3941);
INSERT INTO `tv_series_data` VALUES (3866720619, '十三格格新传', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/9/s29180.jpg?1390551481', 'https://tv.2345.com/detail/29180.html', 8.4, '其他', 0, 4439);
INSERT INTO `tv_series_data` VALUES (3874084198, '前世今生姜武版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/2349/9eade653495598adb49a379cafaebabb.jpg', 'https://tv.2345.com/detail/2349.html', 8, '战争', 0, 5288);
INSERT INTO `tv_series_data` VALUES (3875545447, '爱了别再说痛', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/17/s53044.jpg', 'https://tv.2345.com/detail/53044.html', 8.7, '家庭', 0, 3221);
INSERT INTO `tv_series_data` VALUES (3877244881, '锄奸', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/1710/16bd4a5599cb813bc69ebfefe66b87ad.jpg', 'https://tv.2345.com/detail/1710.html', 8.9, '战争', 0, 7808);
INSERT INTO `tv_series_data` VALUES (3877337781, '李大钊', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/14/s44733.jpg', 'https://tv.2345.com/detail/44733.html', 9.1, '其他', 0, 5886);
INSERT INTO `tv_series_data` VALUES (3882043058, '姐妹新娘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/1376/a4d0d0944debba89b0abacfe5aedd9a6.gif', 'https://tv.2345.com/detail/1376.html', 9.2, '伦理', 0, 3760);
INSERT INTO `tv_series_data` VALUES (3885062465, '拥抱星星的月亮', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/15/s46675.jpg?1437962999', 'https://tv.2345.com/detail/46675.html', 8.4, '家庭', 0, 7433);
INSERT INTO `tv_series_data` VALUES (3888074558, '排球女将', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/2/s7868.jpg', 'https://tv.2345.com/detail/7868.html', 6.7, '家庭', 0, 5274);
INSERT INTO `tv_series_data` VALUES (3889816312, '火蝴蝶', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/1/4555/9ea2896381a65ffd9175d79d29091223.jpg', 'https://tv.2345.com/detail/4555.html', 8.7, '家庭', 0, 3187);
INSERT INTO `tv_series_data` VALUES (3891769405, '樱桃红', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/6/18922/79694ccd986a1d79ee25ef8ca60e2f7a.jpg', 'https://tv.2345.com/detail/18922.html', 9.2, '伦理', 0, 7085);
INSERT INTO `tv_series_data` VALUES (3902375990, '卧底卫视版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/17/s53230.jpg', 'https://tv.2345.com/detail/53230.html', 8.8, '战争', 0, 6469);
INSERT INTO `tv_series_data` VALUES (3906161872, '东方', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/1886/8b8c27aa4c15149d6d981fbdfd522193.jpg', 'https://tv.2345.com/detail/1886.html', 9, '战争', 0, 4703);
INSERT INTO `tv_series_data` VALUES (3909582997, '远方的家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/18/s55186.jpg', 'https://tv.2345.com/detail/55186.html', 9.8, '家庭', 0, 6211);
INSERT INTO `tv_series_data` VALUES (3910281596, '八方传奇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/17/s52996.jpg', 'https://tv.2345.com/detail/52996.html', 8.5, '战争', 0, 7699);
INSERT INTO `tv_series_data` VALUES (3912264095, '依然爱你', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/1/3682/e7af81a0debe2e54149b04b925de173e.jpg', 'https://tv.2345.com/detail/3682.html', 8.5, '伦理', 0, 4126);
INSERT INTO `tv_series_data` VALUES (3913277492, '非亲父子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/2851/aa0ef6de681d16de8c3bc32630ba6bf3.jpg', 'https://tv.2345.com/detail/2851.html', 9.2, '伦理', 0, 3388);
INSERT INTO `tv_series_data` VALUES (3914699090, '守望正义', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/18/s56020.jpg', 'https://tv.2345.com/detail/56020.html', 9.8, '悬疑', 0, 4469);
INSERT INTO `tv_series_data` VALUES (3915888410, '梨花泪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/593/ab6bdb5f5c3d2ce21bbd30275895e7ff.jpg', 'https://tv.2345.com/detail/593.html', 8.9, '家庭', 0, 3142);
INSERT INTO `tv_series_data` VALUES (3919647009, '无间有爱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/1188/7213a1740b50dfd7d6a0dd4e6f0d4087.jpg', 'https://tv.2345.com/detail/1188.html', 9.4, '悬疑', 0, 3767);
INSERT INTO `tv_series_data` VALUES (3921717140, '北平无战事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/9/s28398.jpg?1412643293', 'https://tv.2345.com/detail/28398.html', 8.7, '战争', 0, 5021);
INSERT INTO `tv_series_data` VALUES (3922832174, '梦想光荣', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/2211/9e7959fe8f2427384baf5d7e6ab80cca.jpg', 'https://tv.2345.com/detail/2211.html', 9, '战争', 0, 3949);
INSERT INTO `tv_series_data` VALUES (3931127447, '全家福', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/c/0.jpg', 'https://tv.2345.com/detail/18521.html', 9.2, '家庭', 0, 3859);
INSERT INTO `tv_series_data` VALUES (3931919888, '硝烟背后的战争', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/2/s6216.jpg?1410419706', 'https://tv.2345.com/detail/6216.html', 8.7, '战争', 0, 3887);
INSERT INTO `tv_series_data` VALUES (3933446878, '家有父母', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/0/s2118.jpg', 'https://tv.2345.com/detail/2118.html', 8.7, '家庭', 0, 3852);
INSERT INTO `tv_series_data` VALUES (3936555805, '千古风流一坛醋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/14/s44776.jpg', 'https://tv.2345.com/detail/44776.html', 7.3, '家庭', 0, 6243);
INSERT INTO `tv_series_data` VALUES (3937048411, '回头是爱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/20/s61098.jpg', 'https://tv.2345.com/detail/61098.html', 8.6, '家庭', 0, 4247);
INSERT INTO `tv_series_data` VALUES (3940351517, '战火红颜', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/20/s61405.jpg', 'https://tv.2345.com/detail/61405.html', 8.2, '战争', 0, 5527);
INSERT INTO `tv_series_data` VALUES (3941770664, '非凡英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/6/14971.jpg', 'https://tv.2345.com/detail/14971.html', 9.3, '战争', 0, 6590);
INSERT INTO `tv_series_data` VALUES (3954513509, '上锁的房间', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/2/8921/8f3c5a28064e5cffbbf7064cf6032c62.jpg', 'https://tv.2345.com/detail/8921.html', 7.6, '悬疑', 0, 4845);
INSERT INTO `tv_series_data` VALUES (3958982073, '烽烟尽处', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/20/s61465.jpg', 'https://tv.2345.com/detail/61465.html', 9.8, '战争', 0, 3450);
INSERT INTO `tv_series_data` VALUES (3962144036, '大宅院的女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/10/s30404.jpg', 'https://tv.2345.com/detail/30404.html', 8.9, '伦理', 0, 6710);
INSERT INTO `tv_series_data` VALUES (3962636350, '玫瑰绽放的年代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/4/12320/516541f04a6ac93049b7eff05b8505f4.jpg', 'https://tv.2345.com/detail/12320.html', 9, '战争', 0, 6017);
INSERT INTO `tv_series_data` VALUES (3962944982, '江南锄奸', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/1464/ba0450caadf685ce8260c46384297a48.jpg', 'https://tv.2345.com/detail/1464.html', 9.5, '战争', 0, 4645);
INSERT INTO `tv_series_data` VALUES (3965196202, '毒刺', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/1706/d588484d61784af554bf4cbec60af9eb.jpg', 'https://tv.2345.com/detail/1706.html', 8.8, '悬疑', 0, 3954);
INSERT INTO `tv_series_data` VALUES (3967485088, '朱家花园', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/727/35e4258c8004c9b3446fb307cb152559.jpg', 'https://tv.2345.com/detail/727.html', 10, '战争', 0, 7967);
INSERT INTO `tv_series_data` VALUES (3969142691, '返城年代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/10/s30003.jpg?1393842661', 'https://tv.2345.com/detail/30003.html', 8.4, '伦理', 0, 4941);
INSERT INTO `tv_series_data` VALUES (3971486543, '红色娘子军', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/4/14004/dc07180cc679b57a6249cf9a1e9c822c.jpg', 'https://tv.2345.com/detail/14004.html', 7.8, '战争', 0, 4783);
INSERT INTO `tv_series_data` VALUES (3978336904, '哎呀妈妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/b/9.jpg', 'https://tv.2345.com/detail/16014.html', 9.1, '家庭', 0, 7548);
INSERT INTO `tv_series_data` VALUES (3981358899, '独立连', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/18/s56660.jpg', 'https://tv.2345.com/detail/56660.html', 8.9, '战争', 0, 7549);
INSERT INTO `tv_series_data` VALUES (3981650399, '我的抗战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/a/f.jpg', 'https://tv.2345.com/detail/14006.html', 9.8, '战争', 0, 3836);
INSERT INTO `tv_series_data` VALUES (3986270430, '有你才有家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/19/s57559.jpg', 'https://tv.2345.com/detail/57559.html', 8.3, '家庭', 0, 7986);
INSERT INTO `tv_series_data` VALUES (3992580256, '结婚你想好了么', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/19/s57129.jpg', 'https://tv.2345.com/detail/57129.html', 8.1, '家庭', 0, 6171);
INSERT INTO `tv_series_data` VALUES (3993981367, '我是特种兵之火凤凰DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/9/s28074.jpg?1411547215', 'https://tv.2345.com/detail/28074.html', 8.6, '军旅', 0, 3328);
INSERT INTO `tv_series_data` VALUES (3996873540, '家有大姐', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/16/s50241.jpg', 'https://tv.2345.com/detail/50241.html', 8.8, '家庭', 0, 4663);
INSERT INTO `tv_series_data` VALUES (4001020086, '新亮剑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/2/6548/e379443d023f33f533e6a85deb2676d6.jpg', 'https://tv.2345.com/detail/6548.html', 8.9, '战争', 0, 5608);
INSERT INTO `tv_series_data` VALUES (4002248358, '勇士之城TV剪辑版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/16/s50078.jpg', 'https://tv.2345.com/detail/50078.html', 9.4, '战争', 0, 4923);
INSERT INTO `tv_series_data` VALUES (4005004040, '中国远征军', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/1005/3ed88818d8e4dae8026f22eaccce21e5.jpg', 'https://tv.2345.com/detail/1005.html', 9.8, '战争', 0, 6210);
INSERT INTO `tv_series_data` VALUES (4010822177, '决杀', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/15/s45337.jpg?1447385195', 'https://tv.2345.com/detail/45337.html', 8.4, '战争', 0, 5326);
INSERT INTO `tv_series_data` VALUES (4017831900, '冲破囚笼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/16/s48420.jpg', 'https://tv.2345.com/detail/48420.html', 7.3, '其他', 0, 4120);
INSERT INTO `tv_series_data` VALUES (4023793133, '宝贝儿回家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/12/s36000.jpg?1401589836', 'https://tv.2345.com/detail/36000.html', 8.4, '伦理', 0, 4360);
INSERT INTO `tv_series_data` VALUES (4029655221, '江南锄奸未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/14/s42598.jpg', 'https://tv.2345.com/detail/42598.html', 9.5, '战争', 0, 7723);
INSERT INTO `tv_series_data` VALUES (4030192510, '长江一号', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/1/4460/15ce3a733e26c46241260d9727df4e61.jpg', 'https://tv.2345.com/detail/4460.html', 9.4, '战争', 0, 5562);
INSERT INTO `tv_series_data` VALUES (4032714711, '路上有狼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/0/s2286.jpg?1410419475', 'https://tv.2345.com/detail/2286.html', 8.8, '家庭', 0, 7042);
INSERT INTO `tv_series_data` VALUES (4035160671, '家有爹娘第2部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/345/d289194ce405a3f390a83b2236ceff41.jpg', 'https://tv.2345.com/detail/345.html', 9, '伦理', 0, 3531);
INSERT INTO `tv_series_data` VALUES (4037942786, '岁月如金', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/15/s47331.jpg?1446694216', 'https://tv.2345.com/detail/47331.html', 8.6, '家庭', 0, 4802);
INSERT INTO `tv_series_data` VALUES (4040009888, '一宅家族', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/19/s59294.jpg', 'https://tv.2345.com/detail/59294.html', 9.2, '家庭', 0, 4788);
INSERT INTO `tv_series_data` VALUES (4042127867, '家和万事兴', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/0/s2648.jpg?1446711749', 'https://tv.2345.com/detail/2648.html', 8.5, '家庭', 0, 4607);
INSERT INTO `tv_series_data` VALUES (4042375031, '二婶', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/15/s46341.jpg?1432623920', 'https://tv.2345.com/detail/46341.html', 8.4, '家庭', 0, 5924);
INSERT INTO `tv_series_data` VALUES (4042392833, '刀尖上行走', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/677/8593fc64f2457f13d5f77592b276ee5d.jpg', 'https://tv.2345.com/detail/677.html', 8.8, '悬疑', 0, 4946);
INSERT INTO `tv_series_data` VALUES (4049453668, '我的父亲母亲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/7/s23691.jpg?1374379190', 'https://tv.2345.com/detail/23691.html', 8.6, '家庭', 0, 3676);
INSERT INTO `tv_series_data` VALUES (4051497881, '女人汤', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/2/6714/5acf6ffd166cc2f2ce692e095964b747.jpg', 'https://tv.2345.com/detail/6714.html', 9, '伦理', 0, 5075);
INSERT INTO `tv_series_data` VALUES (4051665135, '大哥', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/13/s41870.jpg?1411527761', 'https://tv.2345.com/detail/41870.html', 8.8, '家庭', 0, 7292);
INSERT INTO `tv_series_data` VALUES (4056971739, '钢铁是怎样炼成的', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/18/s54472.jpg', 'https://tv.2345.com/detail/54472.html', 9.3, '战争', 0, 7129);
INSERT INTO `tv_series_data` VALUES (4058909384, '螳螂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/923/2691c1479e27d34716a71d6ce487856f.jpg', 'https://tv.2345.com/detail/923.html', 9, '军旅', 0, 5952);
INSERT INTO `tv_series_data` VALUES (4061587726, '中国骑兵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/6/6.jpg', 'https://tv.2345.com/detail/12726.html', 8.4, '战争', 0, 4285);
INSERT INTO `tv_series_data` VALUES (4062984907, '一家老小向前冲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/2/s6473.jpg?1410419730', 'https://tv.2345.com/detail/6473.html', 7.6, '家庭', 0, 6294);
INSERT INTO `tv_series_data` VALUES (4063028344, '善良背后', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/499/8a07eaa26aaf84cdca79757bef715a61.jpg', 'https://tv.2345.com/detail/499.html', 8.8, '家庭', 0, 7103);
INSERT INTO `tv_series_data` VALUES (4069546068, '沉睡花园', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/20/s60134.jpg', 'https://tv.2345.com/detail/60134.html', 5.7, '悬疑', 0, 4478);
INSERT INTO `tv_series_data` VALUES (4069997533, '冬日惊雷', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/8/s25787.jpg?1382020892', 'https://tv.2345.com/detail/25787.html', 8.1, '悬疑', 0, 3864);
INSERT INTO `tv_series_data` VALUES (4072141559, '维和步兵营', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/17/s53702.jpg?1505717365', 'https://tv.2345.com/detail/53702.html', 9.5, '军旅', 0, 3765);
INSERT INTO `tv_series_data` VALUES (4075849929, '惊天铁案', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/19/s57305.jpg', 'https://tv.2345.com/detail/57305.html', 9, '悬疑', 0, 5350);
INSERT INTO `tv_series_data` VALUES (4079696237, '黑玫瑰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/500/0db0351a97f1309d47c64b4bdf22d733.jpg', 'https://tv.2345.com/detail/500.html', 9.7, '战争', 0, 6247);
INSERT INTO `tv_series_data` VALUES (4087979085, '战友', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/1/s3148.jpg?1377074477', 'https://tv.2345.com/detail/3148.html', 8.7, '战争', 0, 3055);
INSERT INTO `tv_series_data` VALUES (4090620179, '王贵与安娜', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/2001/9fe0652504048b7378e4e34e6e898226.jpg', 'https://tv.2345.com/detail/2001.html', 9.1, '家庭', 0, 3865);
INSERT INTO `tv_series_data` VALUES (4094141840, '裸婚时代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/1/s4314.jpg?1396227886', 'https://tv.2345.com/detail/4314.html', 8.5, '家庭', 0, 5835);
INSERT INTO `tv_series_data` VALUES (4096778500, '天生要完美', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/15/s45310.jpg?1421035847', 'https://tv.2345.com/detail/45310.html', 8.4, '战争', 0, 7062);
INSERT INTO `tv_series_data` VALUES (4097789727, '刺刀英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/14/s43142.jpg?1414722338', 'https://tv.2345.com/detail/43142.html', 8, '战争', 0, 6682);
INSERT INTO `tv_series_data` VALUES (4098458219, '喋血黎明', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/17/s52304.jpg', 'https://tv.2345.com/detail/52304.html', 8.8, '战争', 0, 7311);
INSERT INTO `tv_series_data` VALUES (4098698855, '地雷战传奇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/4/12711/755e19bcde85111285a2e8d98b4166d7.jpg', 'https://tv.2345.com/detail/12711.html', 8.8, '战争', 0, 5977);
INSERT INTO `tv_series_data` VALUES (4106544762, '红灯记电视剧', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/17/s53824.jpg', 'https://tv.2345.com/detail/53824.html', 7.8, '战争', 0, 3837);
INSERT INTO `tv_series_data` VALUES (4111446724, '贤内助女王国语版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/7/s22288.jpg?1370315314', 'https://tv.2345.com/detail/22288.html', 8.6, '家庭', 0, 4784);
INSERT INTO `tv_series_data` VALUES (4116532530, '硝烟散尽', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/19/s57582.jpg', 'https://tv.2345.com/detail/57582.html', 9.4, '战争', 0, 7739);
INSERT INTO `tv_series_data` VALUES (4118393632, '男媒婆', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/9/s28344.jpg?1389687508', 'https://tv.2345.com/detail/28344.html', 8.6, '家庭', 0, 6102);
INSERT INTO `tv_series_data` VALUES (4121575379, '红日', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/803/f9071d52db3d405a731d372bac265d58.jpg', 'https://tv.2345.com/detail/803.html', 9.1, '战争', 0, 7800);
INSERT INTO `tv_series_data` VALUES (4121582686, '英雄祭', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/15/s45792.jpg?1487063350', 'https://tv.2345.com/detail/45792.html', 8.8, '战争', 0, 7058);
INSERT INTO `tv_series_data` VALUES (4122806810, '绝密1950', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/0/s4.jpg?1406190801', 'https://tv.2345.com/detail/4.html', 7.5, '战争', 0, 7691);
INSERT INTO `tv_series_data` VALUES (4123349781, '终结杉计划', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/18/s56706.jpg', 'https://tv.2345.com/detail/56706.html', 8.8, '战争', 0, 6381);
INSERT INTO `tv_series_data` VALUES (4126926269, '大有所为', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/15/s46653.jpg', 'https://tv.2345.com/detail/46653.html', 7.2, '其他', 0, 5407);
INSERT INTO `tv_series_data` VALUES (4133465727, '戈壁母亲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/1/3155/d2936d5a2d6f6ccf61403e64b2f9d713.jpg', 'https://tv.2345.com/detail/3155.html', 10, '家庭', 0, 6808);
INSERT INTO `tv_series_data` VALUES (4138068866, '一年又一年', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/387/848b5d9a760503d0f13e0c2aa44357e1.jpg', 'https://tv.2345.com/detail/387.html', 10, '家庭', 0, 3608);
INSERT INTO `tv_series_data` VALUES (4138510809, '虎啸龙吟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/18/s54167.jpg', 'https://tv.2345.com/detail/54167.html', 8.5, '战争', 0, 4583);
INSERT INTO `tv_series_data` VALUES (4142855244, '猜拳', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/15/s46021.jpg?1428391601', 'https://tv.2345.com/detail/46021.html', 8.3, '悬疑', 0, 4983);
INSERT INTO `tv_series_data` VALUES (4146026180, '左手亲情右手爱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/6/s18721.jpg?1399443882', 'https://tv.2345.com/detail/18721.html', 8.1, '家庭', 0, 4426);
INSERT INTO `tv_series_data` VALUES (4146804300, '爱情不打烊', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/15/s46498.jpg?1434590168', 'https://tv.2345.com/detail/46498.html', 8.5, '家庭', 0, 7204);
INSERT INTO `tv_series_data` VALUES (4150585765, '怒江之战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/16/s48892.jpg?1465983122', 'https://tv.2345.com/detail/48892.html', 8.6, '战争', 0, 6442);
INSERT INTO `tv_series_data` VALUES (4151674635, '郭海的家事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/208/99fe9ad7a942818a88992d89814e8978.jpg', 'https://tv.2345.com/detail/208.html', 9.7, '家庭', 0, 6485);
INSERT INTO `tv_series_data` VALUES (4155701781, '谢文东2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/13/s39167.jpg?1404183684', 'https://tv.2345.com/detail/39167.html', 8.6, '战争', 0, 4555);
INSERT INTO `tv_series_data` VALUES (4156610604, '轰炸天团', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/20/s61370.jpg', 'https://tv.2345.com/detail/61370.html', 7.4, '军旅', 0, 5287);
INSERT INTO `tv_series_data` VALUES (4158854463, '血色青春', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/2643/s2643.jpg', 'https://tv.2345.com/detail/2643.html', 6.6, '伦理', 0, 7101);
INSERT INTO `tv_series_data` VALUES (4160248805, '黑三角', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/3/9630/45e36f358add009e96bc0c19c28abf4c.jpg', 'https://tv.2345.com/detail/9630.html', 9.7, '战争', 0, 6609);
INSERT INTO `tv_series_data` VALUES (4166223608, '百媚千娇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/a/4.jpg', 'https://tv.2345.com/detail/17870.html', 8.9, '家庭', 0, 7524);
INSERT INTO `tv_series_data` VALUES (4174852797, '乡村爱情3', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/1630/bd9c1f4e732a6e21cb2f2de0a06470ae.jpg', 'https://tv.2345.com/detail/1630.html', 9.7, '家庭', 0, 4840);
INSERT INTO `tv_series_data` VALUES (4176442034, '尖刀战士', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/7/s21426.jpg?1382490094', 'https://tv.2345.com/detail/21426.html', 8.4, '战争', 0, 6424);
INSERT INTO `tv_series_data` VALUES (4181200884, '狼毒花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/1420/721185ed0fdf9eec63897dcaad099bb0.jpg', 'https://tv.2345.com/detail/1420.html', 9.2, '战争', 0, 3560);
INSERT INTO `tv_series_data` VALUES (4182306460, '无耻之徒第4季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/9/s28682.jpg?1403323426', 'https://tv.2345.com/detail/28682.html', 8.4, '伦理', 0, 4079);
INSERT INTO `tv_series_data` VALUES (4185268893, '到爱的距离', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/8/s26058.jpg?1381242073', 'https://tv.2345.com/detail/26058.html', 8.5, '家庭', 0, 6771);
INSERT INTO `tv_series_data` VALUES (4186892873, '雪域雄鹰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/15/s47391.jpg?1446689812', 'https://tv.2345.com/detail/47391.html', 8.5, '战争', 0, 5431);
INSERT INTO `tv_series_data` VALUES (4188265434, '猎刃', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/16/s50150.jpg?1473835434', 'https://tv.2345.com/detail/50150.html', 8.3, '战争', 0, 5915);
INSERT INTO `tv_series_data` VALUES (4188975183, '兄弟营DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/20/s61339.jpg', 'https://tv.2345.com/detail/61339.html', 7.1, '战争', 0, 3073);
INSERT INTO `tv_series_data` VALUES (4193905918, '王海涛今年四十一', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/1835/2fcd3534f88f6912db77b3ece8871b49.jpg', 'https://tv.2345.com/detail/1835.html', 9.2, '家庭', 0, 4968);
INSERT INTO `tv_series_data` VALUES (4193938511, '两家人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/7/s22081.jpg?1407316193', 'https://tv.2345.com/detail/22081.html', 8.2, '家庭', 0, 3618);
INSERT INTO `tv_series_data` VALUES (4196943070, '千里雷声万里闪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/16/s50264.jpg?1476164524', 'https://tv.2345.com/detail/50264.html', 7.6, '战争', 0, 3515);
INSERT INTO `tv_series_data` VALUES (4201335213, '重生门', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/6/19545/d62c788a9b0e8b2b9bbd0050ba09d476.jpg', 'https://tv.2345.com/detail/19545.html', 8.2, '伦理', 0, 3517);
INSERT INTO `tv_series_data` VALUES (4203587909, '半路父子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/13/s41959.jpg?1413248194', 'https://tv.2345.com/detail/41959.html', 8.6, '家庭', 0, 6830);
INSERT INTO `tv_series_data` VALUES (4206781985, '御赐小仵作', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/19/s59104.jpg', 'https://tv.2345.com/detail/59104.html', 9.7, '悬疑', 0, 6208);
INSERT INTO `tv_series_data` VALUES (4207526304, '密战无声', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/18/s54948.jpg', 'https://tv.2345.com/detail/54948.html', 8.8, '战争', 0, 4439);
INSERT INTO `tv_series_data` VALUES (4207908764, '我和我的传奇奶奶', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/9/s29826.jpg?1393222431', 'https://tv.2345.com/detail/29826.html', 8.6, '战争', 0, 3386);
INSERT INTO `tv_series_data` VALUES (4208552746, '我的岳父会武术', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/16/s49561.jpg?1481249719', 'https://tv.2345.com/detail/49561.html', 7.9, '家庭', 0, 6297);
INSERT INTO `tv_series_data` VALUES (4210518366, '龙城1937', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/18/s54310.jpg', 'https://tv.2345.com/detail/54310.html', 9.4, '悬疑', 0, 5723);
INSERT INTO `tv_series_data` VALUES (4214898978, '冬日惊雷', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/8/s25787.jpg?1382020892', 'https://tv.2345.com/detail/25787.html', 8.1, '战争', 0, 6035);
INSERT INTO `tv_series_data` VALUES (4215368076, '瞧这一家子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/1/5362/91de6469046a959a1fe16d9deb7cb5db.jpg', 'https://tv.2345.com/detail/5362.html', 9.3, '家庭', 0, 3360);
INSERT INTO `tv_series_data` VALUES (4220437766, '夜来香', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/239/1d951a4f5b07fc18db92471859ea8a48.jpg', 'https://tv.2345.com/detail/239.html', 9.2, '悬疑', 0, 6279);
INSERT INTO `tv_series_data` VALUES (4223062156, '爱情万万岁内地版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/20/s61196.jpg', 'https://tv.2345.com/detail/61196.html', 8.9, '家庭', 0, 6688);
INSERT INTO `tv_series_data` VALUES (4224637214, '家有儿女1', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/5.jpg', 'https://tv.2345.com/detail/5420.html', 9.7, '家庭', 0, 6334);
INSERT INTO `tv_series_data` VALUES (4226216395, '人生双行线', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/3/10208/9c7f3c214e3d351e4329cf7908005bbc.jpg', 'https://tv.2345.com/detail/10208.html', 8.8, '家庭', 0, 5018);
INSERT INTO `tv_series_data` VALUES (4229120924, '121枪杀大案', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/2/s6442.jpg', 'https://tv.2345.com/detail/6442.html', 9.7, '悬疑', 0, 3338);
INSERT INTO `tv_series_data` VALUES (4232956687, '首富', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/2/6898/4962a6cc719559883f6c2308f2db4092.jpg', 'https://tv.2345.com/detail/6898.html', 9.5, '伦理', 0, 4510);
INSERT INTO `tv_series_data` VALUES (4233958412, '承诺', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/377/34a040e6f44256968b28a34b172edb79.jpg', 'https://tv.2345.com/detail/377.html', 8.7, '家庭', 0, 5874);
INSERT INTO `tv_series_data` VALUES (4234046864, '麻雀', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/15/s47366.jpg?1466672022', 'https://tv.2345.com/detail/47366.html', 8.6, '悬疑', 0, 3551);
INSERT INTO `tv_series_data` VALUES (4243586195, '嫂子嫂子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/15/s47668.jpg?1449729036', 'https://tv.2345.com/detail/47668.html', 8.5, '战争', 0, 4771);
INSERT INTO `tv_series_data` VALUES (4244719098, '检察官公主', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/1/s3706.jpg', 'https://tv.2345.com/detail/3706.html', 9.2, '家庭', 0, 5572);
INSERT INTO `tv_series_data` VALUES (4245925333, '以家人之名', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/19/s57825.jpg', 'https://tv.2345.com/detail/57825.html', 7.3, '家庭', 0, 3242);
INSERT INTO `tv_series_data` VALUES (4248885014, '熊爸熊孩子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/18/s54347.jpg?1515633431', 'https://tv.2345.com/detail/54347.html', 9.1, '家庭', 0, 6374);
INSERT INTO `tv_series_data` VALUES (4253080355, '中国式相亲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/262/s262.jpg', 'https://tv.2345.com/detail/262.html', 8.9, '家庭', 0, 7200);
INSERT INTO `tv_series_data` VALUES (4256896915, '青春期撞上更年期1', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/950/e0234ebe7772959a87c3407b9c077ba3.jpg', 'https://tv.2345.com/detail/950.html', 9.2, '家庭', 0, 6343);
INSERT INTO `tv_series_data` VALUES (4258945634, '瓷都人之昌南的风', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/20/s61367.jpg', 'https://tv.2345.com/detail/61367.html', 8.5, '其他', 0, 5194);
INSERT INTO `tv_series_data` VALUES (4259411588, '三毛流浪记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/2395/22b056dcf0ea116da4d1dea848a10d87.jpg', 'https://tv.2345.com/detail/2395.html', 8.5, '家庭', 0, 3895);
INSERT INTO `tv_series_data` VALUES (4261639272, '中国特警', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/5/s17457.jpg?1502273557', 'https://tv.2345.com/detail/17457.html', 8.8, '战争', 0, 7074);
INSERT INTO `tv_series_data` VALUES (4266000975, '你笑了', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/2253/s2253.jpg', 'https://tv.2345.com/detail/2253.html', 7.8, '家庭', 0, 6309);
INSERT INTO `tv_series_data` VALUES (4266698813, '代号', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/16/s49110.jpg?1470123464', 'https://tv.2345.com/detail/49110.html', 8.5, '战争', 0, 5667);
INSERT INTO `tv_series_data` VALUES (4267524937, '别无选择', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/2/6865/bd7c50cfded12f3dca944e8616bdec0a.jpg', 'https://tv.2345.com/detail/6865.html', 9.2, '家庭', 0, 3777);
INSERT INTO `tv_series_data` VALUES (4267859285, '杀出绝地', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/1/4315/2947f0751cbb062a81564c0548e51d4f.jpg', 'https://tv.2345.com/detail/4315.html', 8.8, '悬疑', 0, 7689);
INSERT INTO `tv_series_data` VALUES (4274126243, '浴血玫瑰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/18/s56568.jpg', 'https://tv.2345.com/detail/56568.html', 8.8, '战争', 0, 6528);
INSERT INTO `tv_series_data` VALUES (4278026890, '风云天地TV版TV剪辑版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/16/s50100.jpg', 'https://tv.2345.com/detail/50100.html', 8.8, '家庭', 0, 6804);
INSERT INTO `tv_series_data` VALUES (4278372379, '请摘星星给我', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/6/827.jpg', 'https://tv.2345.com/detail/827.html', 9.4, '家庭', 0, 4772);
INSERT INTO `tv_series_data` VALUES (4287109336, '战舰大时代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/18/s56168.jpg', 'https://tv.2345.com/detail/56168.html', 8.8, '战争', 0, 6035);
INSERT INTO `tv_series_data` VALUES (4287692773, '借问英雄何处', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/449611/1348835047/d137fbfdfbb1fe800ccf7091b198fc36.jpg', 'https://tv.2345.com/detail/15420.html', 9.8, '战争', 0, 6728);
INSERT INTO `tv_series_data` VALUES (4288287382, '丈夫的秘密', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/7/e.jpg', 'https://tv.2345.com/detail/15314.html', 9.2, '伦理', 0, 4734);
INSERT INTO `tv_series_data` VALUES (4292180648, '一颗颗眼泪都是爱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/286/bfbaa9c16cbf2046edd41ed2c87f476d.jpg', 'https://tv.2345.com/detail/286.html', 9, '伦理', 0, 4096);
INSERT INTO `tv_series_data` VALUES (4292615107, '碎片', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/10/s30913.jpg?1415339336', 'https://tv.2345.com/detail/30913.html', 8.3, '家庭', 0, 7656);
INSERT INTO `tv_series_data` VALUES (4306232176, '纸婚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/11/s33203.jpg?1400982272', 'https://tv.2345.com/detail/33203.html', 8.4, '伦理', 0, 3344);
INSERT INTO `tv_series_data` VALUES (4306477894, '高粱红了', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/1471/9a12368953df0ff73f41b676c2c594ab.jpg', 'https://tv.2345.com/detail/1471.html', 9.5, '战争', 0, 5897);
INSERT INTO `tv_series_data` VALUES (4307758132, '战地狮吼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/15/s47694.jpg?1450146078', 'https://tv.2345.com/detail/47694.html', 8.3, '战争', 0, 4396);
INSERT INTO `tv_series_data` VALUES (4307955598, '金钱游戏', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/17/s53882.jpg', 'https://tv.2345.com/detail/53882.html', 9, '家庭', 0, 4736);
INSERT INTO `tv_series_data` VALUES (4308949385, '我心灿烂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/14/s43430.jpg', 'https://tv.2345.com/detail/43430.html', 8.8, '家庭', 0, 4222);
INSERT INTO `tv_series_data` VALUES (4312514051, '悬崖', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/2/6741/c44dd5010827534cc3b232ce65b2213d.jpg', 'https://tv.2345.com/detail/6741.html', 8.5, '悬疑', 0, 7495);
INSERT INTO `tv_series_data` VALUES (4318756984, '冲出月亮岛', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/15/s46974.jpg', 'https://tv.2345.com/detail/46974.html', 8.5, '战争', 0, 5194);
INSERT INTO `tv_series_data` VALUES (4321256242, '夺粮剿匪记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/0/s1892.jpg?1420688965', 'https://tv.2345.com/detail/1892.html', 8.7, '军旅', 0, 3870);
INSERT INTO `tv_series_data` VALUES (4328594367, '殊死七日', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/16/s48448.jpg?1460944118', 'https://tv.2345.com/detail/48448.html', 8.5, '战争', 0, 4244);
INSERT INTO `tv_series_data` VALUES (4329668086, '婆媳过招', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/2/s6210.jpg', 'https://tv.2345.com/detail/6210.html', 8.8, '伦理', 0, 6752);
INSERT INTO `tv_series_data` VALUES (4335026907, '二炮手', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/14/s43258.jpg?1419468070', 'https://tv.2345.com/detail/43258.html', 9, '战争', 0, 4031);
INSERT INTO `tv_series_data` VALUES (4335308736, '天一生水', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/7/s21652.jpg?1410420664', 'https://tv.2345.com/detail/21652.html', 9.3, '家庭', 0, 7442);
INSERT INTO `tv_series_data` VALUES (4335425158, '彝海结盟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/16/s50386.jpg?1477042939', 'https://tv.2345.com/detail/50386.html', 8.1, '战争', 0, 6790);
INSERT INTO `tv_series_data` VALUES (4339337177, '风和日丽', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/3/9831/07ce820a498fa03e9c55e904e6e5b309.jpg', 'https://tv.2345.com/detail/9831.html', 9.2, '家庭', 0, 5284);
INSERT INTO `tv_series_data` VALUES (4339588482, '第四审讯室', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/20/s61282.jpg', 'https://tv.2345.com/detail/61282.html', 8.8, '悬疑', 0, 7277);
INSERT INTO `tv_series_data` VALUES (4342747141, '楚乔传', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/16/s48541.jpg?1478140907', 'https://tv.2345.com/detail/48541.html', 9.1, '战争', 0, 6330);
INSERT INTO `tv_series_data` VALUES (4346100828, '乡村爱情浪漫曲下', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/15/s47835.jpg?1452584949', 'https://tv.2345.com/detail/47835.html', 8.5, '家庭', 0, 7799);
INSERT INTO `tv_series_data` VALUES (4346456023, '婆婆的镯子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/20/s60852.jpg', 'https://tv.2345.com/detail/60852.html', 7.7, '家庭', 0, 3632);
INSERT INTO `tv_series_data` VALUES (4356070700, '枪火英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/15/s46831.jpg?1439794771', 'https://tv.2345.com/detail/46831.html', 8.4, '战争', 0, 7588);
INSERT INTO `tv_series_data` VALUES (4356745658, '一江春水', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/3/9659/fadb4e30bca4d2d9eae7abf4f9870589.jpg', 'https://tv.2345.com/detail/9659.html', 9.3, '战争', 0, 6126);
INSERT INTO `tv_series_data` VALUES (4364247760, '美丽的田野', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/18/s56455.jpg', 'https://tv.2345.com/detail/56455.html', 8.7, '家庭', 0, 3819);
INSERT INTO `tv_series_data` VALUES (4365196124, '马大帅1', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/1616/e314a6fbc49ccec2e645c07dafcbccfe.jpg', 'https://tv.2345.com/detail/1616.html', 9.8, '家庭', 0, 5962);
INSERT INTO `tv_series_data` VALUES (4368998512, '血战长空', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/3/s10096.jpg', 'https://tv.2345.com/detail/10096.html', 8, '战争', 0, 7347);
INSERT INTO `tv_series_data` VALUES (4369314184, '爸爸叫红旗', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/4/12371/995dd0cdd8cb4764ce9274a36ed4809a.jpg', 'https://tv.2345.com/detail/12371.html', 10, '家庭', 0, 5254);
INSERT INTO `tv_series_data` VALUES (4375686780, '间谍风一号', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/2/8111/8cd525dc2642363a2fb9e141d06717da.jpg', 'https://tv.2345.com/detail/8111.html', 9.8, '悬疑', 0, 4621);
INSERT INTO `tv_series_data` VALUES (4376940491, '第五空间', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/895/ccc6bafdba3631e26559ec2fa96f80dc.jpg', 'https://tv.2345.com/detail/895.html', 9.3, '军旅', 0, 7295);
INSERT INTO `tv_series_data` VALUES (4378214217, '男人四十跑出租第三部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/18/s55536.jpg', 'https://tv.2345.com/detail/55536.html', 8, '伦理', 0, 3910);
INSERT INTO `tv_series_data` VALUES (4381266058, '老兵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/6/s19934.jpg?1393548770', 'https://tv.2345.com/detail/19934.html', 8.7, '军旅', 0, 6325);
INSERT INTO `tv_series_data` VALUES (4385794822, '为了承诺', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/2/6867/aaf9169802d890761e8d9ced85fbedcd.jpg', 'https://tv.2345.com/detail/6867.html', 8.7, '伦理', 0, 6580);
INSERT INTO `tv_series_data` VALUES (4387236179, '葡萄酒鉴赏家第4季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/13/s40781.jpg?1408585850', 'https://tv.2345.com/detail/40781.html', 8.6, '其他', 0, 4105);
INSERT INTO `tv_series_data` VALUES (4387519012, '卧底第2季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/17/s52974.jpg', 'https://tv.2345.com/detail/52974.html', 8.6, '悬疑', 0, 3605);
INSERT INTO `tv_series_data` VALUES (4391693803, '光影', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/15/s45455.jpg?1422255268', 'https://tv.2345.com/detail/45455.html', 8.1, '战争', 0, 3309);
INSERT INTO `tv_series_data` VALUES (4395009839, '生死迷局', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/791/59907188fe8a4652556db66bf6ccd4d6.jpg', 'https://tv.2345.com/detail/791.html', 8.8, '军旅', 0, 5701);
INSERT INTO `tv_series_data` VALUES (4396237206, '美国恐怖故事第3季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/8/s26118.jpg?1381459155', 'https://tv.2345.com/detail/26118.html', 8.3, '悬疑', 0, 3868);
INSERT INTO `tv_series_data` VALUES (4397719416, '铁色高原', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/3/10241/b19362f7a03ed05fd0fb535e6d9a6f80.jpg', 'https://tv.2345.com/detail/10241.html', 9.6, '战争', 0, 7244);
INSERT INTO `tv_series_data` VALUES (4397945519, '厨王', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/2/s8606.jpg', 'https://tv.2345.com/detail/8606.html', 8.7, '伦理', 0, 7604);
INSERT INTO `tv_series_data` VALUES (4407013993, '家有儿女4', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/5/a.jpg', 'https://tv.2345.com/detail/1111.html', 9, '家庭', 0, 3683);
INSERT INTO `tv_series_data` VALUES (4408798124, '北国英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/19/s58368.png', 'https://tv.2345.com/detail/58368.html', 8.9, '战争', 0, 6628);
INSERT INTO `tv_series_data` VALUES (4410067587, '燃情密码', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/9/s27050.jpg?1384417356', 'https://tv.2345.com/detail/27050.html', 8.6, '战争', 0, 7422);
INSERT INTO `tv_series_data` VALUES (4416268054, '百万新娘韩语版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/1/s5527.jpg', 'https://tv.2345.com/detail/5527.html', 8.9, '伦理', 0, 4342);
INSERT INTO `tv_series_data` VALUES (4417312804, '望族风云', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/6/s20485.jpg?1410420551', 'https://tv.2345.com/detail/20485.html', 6.6, '家庭', 0, 6969);
INSERT INTO `tv_series_data` VALUES (4422454661, '八角亭谜雾', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/20/s60991.jpg', 'https://tv.2345.com/detail/60991.html', 9.6, '家庭', 0, 4844);
INSERT INTO `tv_series_data` VALUES (4422689751, '玻璃之城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/885/4f2f450efb5c517032cfd6cdd9fbade6.jpg', 'https://tv.2345.com/detail/885.html', 8, '伦理', 0, 5003);
INSERT INTO `tv_series_data` VALUES (4426292124, '喋血边城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/8/f.jpg', 'https://tv.2345.com/detail/15913.html', 8.8, '战争', 0, 6906);
INSERT INTO `tv_series_data` VALUES (4430188902, '谁怜天下慈母心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/205/0193b65b05b9608e57a203cb4be23693.jpg', 'https://tv.2345.com/detail/205.html', 9.3, '家庭', 0, 6351);
INSERT INTO `tv_series_data` VALUES (4430378365, '爱的守护普通话版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/19/s58719.jpg', 'https://tv.2345.com/detail/58719.html', 9.8, '家庭', 0, 5682);
INSERT INTO `tv_series_data` VALUES (4437657395, '中国远征军电视剧', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/17/s53880.jpg', 'https://tv.2345.com/detail/53880.html', 7.3, '战争', 0, 5377);
INSERT INTO `tv_series_data` VALUES (4437934794, '儿媳妇的全盛时代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/1209/s1209.jpg', 'https://tv.2345.com/detail/1209.html', 7.7, '家庭', 0, 5251);
INSERT INTO `tv_series_data` VALUES (4438025794, '陈赓大将', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/2/8537/8bbc528189ccd1feaae65a913cabc4cf.jpg', 'https://tv.2345.com/detail/8537.html', 9.4, '战争', 0, 7910);
INSERT INTO `tv_series_data` VALUES (4438217159, '红蜘蛛2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/2/s7980.jpg?1398414559', 'https://tv.2345.com/detail/7980.html', 8.9, '悬疑', 0, 4712);
INSERT INTO `tv_series_data` VALUES (4440211998, '湖光山色', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/2236/1f0664a117d112b72c4b716a2467e30a.jpg', 'https://tv.2345.com/detail/2236.html', 8.7, '家庭', 0, 5907);
INSERT INTO `tv_series_data` VALUES (4441008004, '钻石豪门', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/1178/e1d520a23414c7735d5f13adfb4d9c32.jpg', 'https://tv.2345.com/detail/1178.html', 8.3, '伦理', 0, 7218);
INSERT INTO `tv_series_data` VALUES (4447256030, '霸道新娘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/19/s59012.jpg', 'https://tv.2345.com/detail/59012.html', 7, '家庭', 0, 4642);
INSERT INTO `tv_series_data` VALUES (4447630024, '北平和谈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/384/s384.jpg', 'https://tv.2345.com/detail/384.html', 8.7, '军旅', 0, 4329);
INSERT INTO `tv_series_data` VALUES (4448723665, '单亲妈妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/1362/f62e6f5c174494d77e99dfc895690c2d.jpg', 'https://tv.2345.com/detail/1362.html', 9.3, '家庭', 0, 3634);
INSERT INTO `tv_series_data` VALUES (4452154357, '将军日记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/3/10164/a64ab8e2063741c6c8e9d587df9bb151.jpg', 'https://tv.2345.com/detail/10164.html', 9.2, '战争', 0, 6820);
INSERT INTO `tv_series_data` VALUES (4456562614, '陪读妈妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/18/s54963.jpg', 'https://tv.2345.com/detail/54963.html', 9.5, '家庭', 0, 5714);
INSERT INTO `tv_series_data` VALUES (4456759601, '铁血兄弟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/8/s24889.jpg?1377578901', 'https://tv.2345.com/detail/24889.html', 8.2, '战争', 0, 6168);
INSERT INTO `tv_series_data` VALUES (4459231893, '超能少年第2季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/2666/s2666.jpg', 'https://tv.2345.com/detail/2666.html', 8.2, '伦理', 0, 3549);
INSERT INTO `tv_series_data` VALUES (4459926247, '新地道战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/2296/s2296.jpg', 'https://tv.2345.com/detail/2296.html', 6.6, '战争', 0, 4931);
INSERT INTO `tv_series_data` VALUES (4462375294, '篮球', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/8/s26493.jpg?1382757541', 'https://tv.2345.com/detail/26493.html', 8.4, '其他', 0, 4363);
INSERT INTO `tv_series_data` VALUES (4462480847, '谍战深海之惊蛰DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/18/s56738.jpg', 'https://tv.2345.com/detail/56738.html', 9.8, '战争', 0, 5867);
INSERT INTO `tv_series_data` VALUES (4464425005, '我是业主', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/626/1717dd84adf1c1e572dc47775823bc5d.jpg', 'https://tv.2345.com/detail/626.html', 8.7, '家庭', 0, 4519);
INSERT INTO `tv_series_data` VALUES (4472882266, '绿箭侠第4季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/16/s49608.jpg', 'https://tv.2345.com/detail/49608.html', 8.5, '悬疑', 0, 6576);
INSERT INTO `tv_series_data` VALUES (4475716585, '将婚姻进行到底国际版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/20/s61248.jpg', 'https://tv.2345.com/detail/61248.html', 7.3, '家庭', 0, 7905);
INSERT INTO `tv_series_data` VALUES (4477511436, '地下地上之大陆小岛', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/15/s45738.jpg?1425365859', 'https://tv.2345.com/detail/45738.html', 8.4, '战争', 0, 7128);
INSERT INTO `tv_series_data` VALUES (4480059568, '大学生士兵的故事2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/6/19794/c4e15c546215ac5d277711f781f43f13.jpg', 'https://tv.2345.com/detail/19794.html', 8, '战争', 0, 5131);
INSERT INTO `tv_series_data` VALUES (4480879479, '木兰妈妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/16/s50701.jpg?1478244714', 'https://tv.2345.com/detail/50701.html', 8.4, '家庭', 0, 5037);
INSERT INTO `tv_series_data` VALUES (4482530585, '火线出击上', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/17/s52671.jpg?1487832590', 'https://tv.2345.com/detail/52671.html', 8.6, '军旅', 0, 6075);
INSERT INTO `tv_series_data` VALUES (4484094145, '幸福院', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/19/s57198.jpg', 'https://tv.2345.com/detail/57198.html', 9.3, '家庭', 0, 7771);
INSERT INTO `tv_series_data` VALUES (4484704868, '阿霞', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/3/10102/b5f9ccd227639198578cac3496493bad.jpg', 'https://tv.2345.com/detail/10102.html', 8, '伦理', 0, 5705);
INSERT INTO `tv_series_data` VALUES (4486233202, '少年黄飞鸿', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/1167/35783109449716da0b4b64dedfa094a9.jpg', 'https://tv.2345.com/detail/1167.html', 9.4, '家庭', 0, 4096);
INSERT INTO `tv_series_data` VALUES (4487272708, '钱多多嫁人记刘涛版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/6/s19927.jpg?1362646682', 'https://tv.2345.com/detail/19927.html', 9.2, '家庭', 0, 7915);
INSERT INTO `tv_series_data` VALUES (4488256113, '密战太阳山', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/2/8629/186301313fea037eb67312aa9b42d1b5.jpg', 'https://tv.2345.com/detail/8629.html', 9.2, '战争', 0, 5754);
INSERT INTO `tv_series_data` VALUES (4489956382, '太行英雄传', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/17/s53248.jpg', 'https://tv.2345.com/detail/53248.html', 8.4, '战争', 0, 4893);
INSERT INTO `tv_series_data` VALUES (4490474257, '房战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/3/s11436.jpg', 'https://tv.2345.com/detail/11436.html', 8.9, '伦理', 0, 7130);
INSERT INTO `tv_series_data` VALUES (4490476161, '暗战危城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/16/s50347.jpg?1476343700', 'https://tv.2345.com/detail/50347.html', 8.2, '战争', 0, 5267);
INSERT INTO `tv_series_data` VALUES (4492378425, '家和万事兴未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/15/s47461.jpg?1447306547', 'https://tv.2345.com/detail/47461.html', 8.5, '伦理', 0, 7958);
INSERT INTO `tv_series_data` VALUES (4506759368, '侦探小说', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/1/4987/5887567dc2e2db3d46f5618f12568a42.jpg', 'https://tv.2345.com/detail/4987.html', 10, '战争', 0, 4574);
INSERT INTO `tv_series_data` VALUES (4506953698, '婆婆媳妇小姑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/1165/60a9a375376829c4ea1635c70c967b5b.jpg', 'https://tv.2345.com/detail/1165.html', 9.3, '伦理', 0, 5685);
INSERT INTO `tv_series_data` VALUES (4511355968, '情长路更长', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/18/s54012.jpg', 'https://tv.2345.com/detail/54012.html', 8.7, '家庭', 0, 3679);
INSERT INTO `tv_series_data` VALUES (4511535523, '唐山大地震2006版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/0/s106.jpg?1382108063', 'https://tv.2345.com/detail/106.html', 8.7, '家庭', 0, 5137);
INSERT INTO `tv_series_data` VALUES (4513389154, '耍叉', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/14/s44866.jpg', 'https://tv.2345.com/detail/44866.html', 7.5, '家庭', 0, 6069);
INSERT INTO `tv_series_data` VALUES (4513535811, '返城年代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/10/s30003.jpg?1393842661', 'https://tv.2345.com/detail/30003.html', 8.4, '家庭', 0, 3030);
INSERT INTO `tv_series_data` VALUES (4516624422, '战火中的花蕾', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/4/s14820.jpg?1374119453', 'https://tv.2345.com/detail/14820.html', 8.6, '战争', 0, 6075);
INSERT INTO `tv_series_data` VALUES (4521184342, '一路格桑花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/725/e7ec5cf1157986062fca6d21df1f132b.jpg', 'https://tv.2345.com/detail/725.html', 9.3, '战争', 0, 5122);
INSERT INTO `tv_series_data` VALUES (4525740817, '特警力量未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/15/s46405.jpg', 'https://tv.2345.com/detail/46405.html', 9, '战争', 0, 6775);
INSERT INTO `tv_series_data` VALUES (4528124993, '沙海老兵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/18/s54546.jpg', 'https://tv.2345.com/detail/54546.html', 9.6, '战争', 0, 3779);
INSERT INTO `tv_series_data` VALUES (4528265997, '以家人之名DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/19/s57827.jpg', 'https://tv.2345.com/detail/57827.html', 7.4, '家庭', 0, 5252);
INSERT INTO `tv_series_data` VALUES (4529281145, '兄弟营', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/18/s56457.jpg', 'https://tv.2345.com/detail/56457.html', 8.1, '战争', 0, 6089);
INSERT INTO `tv_series_data` VALUES (4529913143, '谁来伺候妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/2/8320/e33c31e8ea04a12f3552e354d9f2ce91.jpg', 'https://tv.2345.com/detail/8320.html', 8.5, '伦理', 0, 6536);
INSERT INTO `tv_series_data` VALUES (4536933146, '红妆', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/1/4549/5ca1a49e78c1bdcfb0cb503d078c0175.jpg', 'https://tv.2345.com/detail/4549.html', 9, '军旅', 0, 7265);
INSERT INTO `tv_series_data` VALUES (4537175635, '贤妻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/6/s19716.jpg?1494830047', 'https://tv.2345.com/detail/19716.html', 8.9, '伦理', 0, 4282);
INSERT INTO `tv_series_data` VALUES (4542102910, '月上海', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/2/7913/06cf8a044da6b00a7268598c28d97887.jpg', 'https://tv.2345.com/detail/7913.html', 9, '家庭', 0, 3386);
INSERT INTO `tv_series_data` VALUES (4547117714, '《花儿多多》之前世今生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/15/s46349.jpg', 'https://tv.2345.com/detail/46349.html', 8.6, '其他', 0, 6495);
INSERT INTO `tv_series_data` VALUES (4552156342, '国防生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/7/s23792.jpg?1374545933', 'https://tv.2345.com/detail/23792.html', 8.4, '战争', 0, 4807);
INSERT INTO `tv_series_data` VALUES (4552409331, '金牛报喜', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/19/s58967.jpg', 'https://tv.2345.com/detail/58967.html', 7.7, '家庭', 0, 6682);
INSERT INTO `tv_series_data` VALUES (4552643674, '雅典娜战争女神', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/2192/s2192.jpg', 'https://tv.2345.com/detail/2192.html', 8.8, '战争', 0, 6899);
INSERT INTO `tv_series_data` VALUES (4553329987, '美丽心灵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/3/10693/bfe51571b4d380ec245e9b20ecc3a160.jpg', 'https://tv.2345.com/detail/10693.html', 10, '家庭', 0, 6949);
INSERT INTO `tv_series_data` VALUES (4556309096, '新安家族', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/770/s770.jpg', 'https://tv.2345.com/detail/770.html', 9.4, '家庭', 0, 3882);
INSERT INTO `tv_series_data` VALUES (4556453370, '温州一家人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/b/a.jpg', 'https://tv.2345.com/detail/16557.html', 9.5, '家庭', 0, 4644);
INSERT INTO `tv_series_data` VALUES (4556661150, '不能没有她', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/c/5.jpg', 'https://tv.2345.com/detail/2980.html', 8.8, '家庭', 0, 5033);
INSERT INTO `tv_series_data` VALUES (4557013713, '浮尘下的枪声', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/20/s61125.jpg', 'https://tv.2345.com/detail/61125.html', 9.7, '悬疑', 0, 4788);
INSERT INTO `tv_series_data` VALUES (4557744208, '江湖绝恋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/594/f757acca80df3872c5b545e1525f78e7.jpg', 'https://tv.2345.com/detail/594.html', 10, '伦理', 0, 7822);
INSERT INTO `tv_series_data` VALUES (4558286814, '红粉', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/394/3d60a334e3dabf352f300beb13c2ca15.jpg', 'https://tv.2345.com/detail/394.html', 9, '家庭', 0, 6616);
INSERT INTO `tv_series_data` VALUES (4558310322, '反击美版第3季限时免费', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/15/s46588.jpg', 'https://tv.2345.com/detail/46588.html', 7.8, '战争', 0, 4305);
INSERT INTO `tv_series_data` VALUES (4558772667, '猎杀', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/7/s21992.jpg?1369104857', 'https://tv.2345.com/detail/21992.html', 8.7, '战争', 0, 5349);
INSERT INTO `tv_series_data` VALUES (4561930175, '冷雨', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/2/6888/917c65a42f5629484f9f1b3a9f81ee3f.jpg', 'https://tv.2345.com/detail/6888.html', 8.8, '家庭', 0, 3253);
INSERT INTO `tv_series_data` VALUES (4572463963, '家风', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/3/10163/02643f69895cd325b8a7a7c20be6c224.jpg', 'https://tv.2345.com/detail/10163.html', 8.8, '家庭', 0, 3870);
INSERT INTO `tv_series_data` VALUES (4573216591, '别逼我结婚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/13/s40084.jpg?1407205736', 'https://tv.2345.com/detail/40084.html', 8.3, '家庭', 0, 3639);
INSERT INTO `tv_series_data` VALUES (4580211130, '极度危机', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/17/s53205.jpg', 'https://tv.2345.com/detail/53205.html', 8.8, '战争', 0, 3680);
INSERT INTO `tv_series_data` VALUES (4581114994, '秦香莲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/1/5741/263f50fdd87dc0ca3022f9937d44d153.jpg', 'https://tv.2345.com/detail/5741.html', 8.8, '家庭', 0, 6837);
INSERT INTO `tv_series_data` VALUES (4583756895, '带上婆婆嫁', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/1615/s1615.jpg', 'https://tv.2345.com/detail/1615.html', 8.7, '伦理', 0, 5603);
INSERT INTO `tv_series_data` VALUES (4584021600, '烽火少年', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/2/s7349.jpg?1410419785', 'https://tv.2345.com/detail/7349.html', 9.8, '战争', 0, 5565);
INSERT INTO `tv_series_data` VALUES (4584314788, '雾都猎狐', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/249/s249.jpg', 'https://tv.2345.com/detail/249.html', 8.8, '战争', 0, 3274);
INSERT INTO `tv_series_data` VALUES (4587641081, '美丽无声', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/207/2c16cfd4e71a964a6857fe27355642a8.jpg', 'https://tv.2345.com/detail/207.html', 8, '战争', 0, 3571);
INSERT INTO `tv_series_data` VALUES (4590687617, '小楼又东风', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/18/s54282.jpg?1515129103', 'https://tv.2345.com/detail/54282.html', 9.1, '战争', 0, 7261);
INSERT INTO `tv_series_data` VALUES (4592064432, '常回家看看', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/1161/23e14803ae8b54f7421fcfdd2c6db37c.jpg', 'https://tv.2345.com/detail/1161.html', 10, '伦理', 0, 4727);
INSERT INTO `tv_series_data` VALUES (4596531282, '爱人的谎言', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/15/s47963.jpg?1455600756', 'https://tv.2345.com/detail/47963.html', 8.6, '家庭', 0, 6767);
INSERT INTO `tv_series_data` VALUES (4598937209, '反恐特战队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/15/s47382.jpg?1499305476', 'https://tv.2345.com/detail/47382.html', 8.6, '战争', 0, 5228);
INSERT INTO `tv_series_data` VALUES (4599523262, '大路朝天', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/775/s775.jpg', 'https://tv.2345.com/detail/775.html', 8.8, '战争', 0, 5202);
INSERT INTO `tv_series_data` VALUES (4601586720, '妻妾成群', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/14/s42866.jpg?1414553714', 'https://tv.2345.com/detail/42866.html', 8.2, '家庭', 0, 3794);
INSERT INTO `tv_series_data` VALUES (4601953834, '粉黛谍影', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/18/s55519.jpg', 'https://tv.2345.com/detail/55519.html', 9.8, '战争', 0, 5245);
INSERT INTO `tv_series_data` VALUES (4603309642, '拯救者', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/19/s59150.jpg', 'https://tv.2345.com/detail/59150.html', 8.8, '战争', 0, 3833);
INSERT INTO `tv_series_data` VALUES (4611877168, '婚战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/11/s33332.jpg?1415776788', 'https://tv.2345.com/detail/33332.html', 8.4, '家庭', 0, 7472);
INSERT INTO `tv_series_data` VALUES (4615704771, '人生百事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/4/8.jpg', 'https://tv.2345.com/detail/686.html', 8.8, '家庭', 0, 6164);
INSERT INTO `tv_series_data` VALUES (4616812226, '不良丈夫驯服记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/1/s3210.jpg?1396432909', 'https://tv.2345.com/detail/3210.html', 7.8, '家庭', 0, 3502);
INSERT INTO `tv_series_data` VALUES (4619121050, '追剿', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/9/s29470.jpg?1391824426', 'https://tv.2345.com/detail/29470.html', 8.5, '战争', 0, 4217);
INSERT INTO `tv_series_data` VALUES (4620539596, '断掌的女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/2/7038/c35d02958c36e3f5363c1ab25c93115b.jpg', 'https://tv.2345.com/detail/7038.html', 7.8, '家庭', 0, 7251);
INSERT INTO `tv_series_data` VALUES (4623167822, '狐步谍影', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/1/3080/dd91ddc6516c7e16ccef91ff1b7bca75.jpg', 'https://tv.2345.com/detail/3080.html', 6.2, '战争', 0, 7508);
INSERT INTO `tv_series_data` VALUES (4628967109, '幸福你就拍拍手', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/1901/7876a86adf7d33a438887e0ad614c57d.jpg', 'https://tv.2345.com/detail/1901.html', 8.8, '伦理', 0, 4184);
INSERT INTO `tv_series_data` VALUES (4629291427, '追我魂魄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/3/s11883.jpg?1386407659', 'https://tv.2345.com/detail/11883.html', 8.4, '战争', 0, 3687);
INSERT INTO `tv_series_data` VALUES (4629877034, '卫国先锋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/18/s54813.jpg', 'https://tv.2345.com/detail/54813.html', 7.5, '战争', 0, 7149);
INSERT INTO `tv_series_data` VALUES (4638631853, '丈母娘来了', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/3/s11453.jpg', 'https://tv.2345.com/detail/11453.html', 8.9, '家庭', 0, 7910);
INSERT INTO `tv_series_data` VALUES (4638916496, '让爱作主', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/2708/346e0885653b6132634c9333ccbfb0bb.jpg', 'https://tv.2345.com/detail/2708.html', 10, '家庭', 0, 3491);
INSERT INTO `tv_series_data` VALUES (4638959178, '绝命追踪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/15/s46700.jpg', 'https://tv.2345.com/detail/46700.html', 8.3, '悬疑', 0, 6744);
INSERT INTO `tv_series_data` VALUES (4639968598, '爱在离别时', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/3/10095/1ae94c7489d87d523b41f03aa85a322b.jpg', 'https://tv.2345.com/detail/10095.html', 8.8, '家庭', 0, 3815);
INSERT INTO `tv_series_data` VALUES (4642948106, '宝贝儿回家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/12/s36000.jpg?1401589836', 'https://tv.2345.com/detail/36000.html', 8.4, '家庭', 0, 7081);
INSERT INTO `tv_series_data` VALUES (4643069441, '重庆谍战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/1/3179/205227a62dfc4e184560600e6fa7082c.jpg', 'https://tv.2345.com/detail/3179.html', 9.2, '悬疑', 0, 5520);
INSERT INTO `tv_series_data` VALUES (4644904941, '裸婚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/3/s11635.jpg?1398408726', 'https://tv.2345.com/detail/11635.html', 8.9, '家庭', 0, 5963);
INSERT INTO `tv_series_data` VALUES (4646269664, '零距离2004', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/17/s53706.jpg', 'https://tv.2345.com/detail/53706.html', 7.6, '战争', 0, 6507);
INSERT INTO `tv_series_data` VALUES (4646339091, '在悉尼等我', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/3/11845/480ed5932921ea019d9e3a85770db7c2.jpg', 'https://tv.2345.com/detail/11845.html', 8.9, '伦理', 0, 3761);
INSERT INTO `tv_series_data` VALUES (4655198255, '杨靖宇将军', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/17/s53960.jpg', 'https://tv.2345.com/detail/53960.html', 9.3, '战争', 0, 7653);
INSERT INTO `tv_series_data` VALUES (4656499983, '钟点工们', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/10/s31191.jpg?1405301671', 'https://tv.2345.com/detail/31191.html', 8.6, '伦理', 0, 7872);
INSERT INTO `tv_series_data` VALUES (4658385733, '陈云在一九四九', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/0/s383.jpg?1421375249', 'https://tv.2345.com/detail/383.html', 6.8, '战争', 0, 6338);
INSERT INTO `tv_series_data` VALUES (4661386140, '暗房', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/20/s60911.jpg', 'https://tv.2345.com/detail/60911.html', 9.7, '悬疑', 0, 3264);
INSERT INTO `tv_series_data` VALUES (4662457843, '悠悠寸草心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/1965/acc8966fb7d964db74c86e925645c88c.jpg', 'https://tv.2345.com/detail/1965.html', 9.2, '伦理', 0, 5847);
INSERT INTO `tv_series_data` VALUES (4664811611, '枪声背后', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/653/03aca547d530e2dd3944928935f82ae0.jpg', 'https://tv.2345.com/detail/653.html', 8.8, '战争', 0, 6733);
INSERT INTO `tv_series_data` VALUES (4665145907, '被禁锢的历史', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/15/s45343.jpg', 'https://tv.2345.com/detail/45343.html', 7.5, '其他', 0, 3215);
INSERT INTO `tv_series_data` VALUES (4668912533, '女人魂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/0/s84.jpg?1398411422', 'https://tv.2345.com/detail/84.html', 8.8, '悬疑', 0, 4144);
INSERT INTO `tv_series_data` VALUES (4670824082, '灵魂工程', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/15/s45341.jpg', 'https://tv.2345.com/detail/45341.html', 7.5, '其他', 0, 7535);
INSERT INTO `tv_series_data` VALUES (4671501423, '我爸爸是超级大明星', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/13/s41139.jpg?1409713334', 'https://tv.2345.com/detail/41139.html', 8.7, '家庭', 0, 3809);
INSERT INTO `tv_series_data` VALUES (4672207174, '贫嘴张大民的幸福生活', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/219/4feea342a0aa0c6e7329165973d7dd67.jpg', 'https://tv.2345.com/detail/219.html', 9.3, '家庭', 0, 7591);
INSERT INTO `tv_series_data` VALUES (4674032529, '冰山上的来客电视剧', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/17/s53228.jpg', 'https://tv.2345.com/detail/53228.html', 7.4, '战争', 0, 7522);
INSERT INTO `tv_series_data` VALUES (4679092938, '家产', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/1/5323/07d39e939ecb50e43d780e9771455525.jpg', 'https://tv.2345.com/detail/5323.html', 9.4, '家庭', 0, 6591);
INSERT INTO `tv_series_data` VALUES (4679976975, '家比天大', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/1/4593/119d4abd71125db20ac541519140f5a4.jpg', 'https://tv.2345.com/detail/4593.html', 9.3, '家庭', 0, 3261);
INSERT INTO `tv_series_data` VALUES (4681210568, '我亲爱的小冤家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/2/s7044.jpg?1364782964', 'https://tv.2345.com/detail/7044.html', 8.5, '伦理', 0, 4767);
INSERT INTO `tv_series_data` VALUES (4684056024, '满堂儿女', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/17/s53555.jpg', 'https://tv.2345.com/detail/53555.html', 9.2, '伦理', 0, 4825);
INSERT INTO `tv_series_data` VALUES (4685930907, '裴家大院', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/169/s169.jpg', 'https://tv.2345.com/detail/169.html', 9.8, '家庭', 0, 4920);
INSERT INTO `tv_series_data` VALUES (4695357584, '王保长后传', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/18/s56044.jpg', 'https://tv.2345.com/detail/56044.html', 8.7, '战争', 0, 5320);
INSERT INTO `tv_series_data` VALUES (4695866163, '江湖儿女', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/c/8.jpg', 'https://tv.2345.com/detail/10292.html', 8.8, '战争', 0, 6835);
INSERT INTO `tv_series_data` VALUES (4697188976, '迷线', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/18/s56622.jpg', 'https://tv.2345.com/detail/56622.html', 9.8, '悬疑', 0, 5844);
INSERT INTO `tv_series_data` VALUES (4698747323, '特勤精英', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/17/s53682.jpg?1508206817', 'https://tv.2345.com/detail/53682.html', 8.9, '军旅', 0, 3893);
INSERT INTO `tv_series_data` VALUES (4699260970, '读心神探国语版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/d/3.jpg', 'https://tv.2345.com/detail/5403.html', 8.8, '悬疑', 0, 6290);
INSERT INTO `tv_series_data` VALUES (4699633617, '荆轲传奇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/1/5525/cf5988dedd611445689d01720211c41b.jpg', 'https://tv.2345.com/detail/5525.html', 8.6, '战争', 0, 3213);
INSERT INTO `tv_series_data` VALUES (4700113680, '代号十三钗', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/8/a.jpg', 'https://tv.2345.com/detail/15273.html', 9.5, '战争', 0, 4420);
INSERT INTO `tv_series_data` VALUES (4700875095, '地雷英雄传', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/15/s47662.jpg?1449642431', 'https://tv.2345.com/detail/47662.html', 8.5, '战争', 0, 3671);
INSERT INTO `tv_series_data` VALUES (4708277268, '男人底线', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/2/7907/e6041595f873c5cd3018e92a801952cb.jpg', 'https://tv.2345.com/detail/7907.html', 9.2, '家庭', 0, 7086);
INSERT INTO `tv_series_data` VALUES (4709891205, '新女婿时代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/5/c.jpg', 'https://tv.2345.com/detail/16015.html', 9.2, '家庭', 0, 3891);
INSERT INTO `tv_series_data` VALUES (4710695783, '山间铃响马帮来', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/666/70813ad41add60448f088b156ebd7b24.jpg', 'https://tv.2345.com/detail/666.html', 7, '战争', 0, 5498);
INSERT INTO `tv_series_data` VALUES (4711799309, '老柿子树', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/3/9766/77fa8799bab970305702d98ad28468e5.jpg', 'https://tv.2345.com/detail/9766.html', 9.8, '伦理', 0, 3706);
INSERT INTO `tv_series_data` VALUES (4712216973, '军统枪口下的女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/3/s9032.jpg', 'https://tv.2345.com/detail/9032.html', 8.8, '悬疑', 0, 7519);
INSERT INTO `tv_series_data` VALUES (4724558188, '百万新娘之爱无悔TV版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/6/s20185.jpg?1363574109', 'https://tv.2345.com/detail/20185.html', 8.9, '家庭', 0, 7512);
INSERT INTO `tv_series_data` VALUES (4726662967, '激情燃烧的岁月3', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/1608/c75ec07910f2c429b4bd1484b262042a.jpg', 'https://tv.2345.com/detail/1608.html', 8.8, '战争', 0, 4840);
INSERT INTO `tv_series_data` VALUES (4726895357, '高地', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/195/c273e483b468c516743a828148982d5d.jpg', 'https://tv.2345.com/detail/195.html', 9.3, '军旅', 0, 3538);
INSERT INTO `tv_series_data` VALUES (4731341582, '离婚女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/2/6483/db05db86a4dec4297adb7ce34f1ac638.jpg', 'https://tv.2345.com/detail/6483.html', 9.2, '家庭', 0, 7251);
INSERT INTO `tv_series_data` VALUES (4733590137, '如果爱可以重来', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/15/s45782.jpg?1425614374', 'https://tv.2345.com/detail/45782.html', 8.3, '家庭', 0, 6459);
INSERT INTO `tv_series_data` VALUES (4734266265, '最后的99天', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/7/s21640.jpg?1410420661', 'https://tv.2345.com/detail/21640.html', 9.2, '战争', 0, 6255);
INSERT INTO `tv_series_data` VALUES (4735063676, '蝴蝶行动', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/5/s15427.jpg?1362964663', 'https://tv.2345.com/detail/15427.html', 8.5, '战争', 0, 6066);
INSERT INTO `tv_series_data` VALUES (4746809252, '浴火危城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/5/s17700.jpg?1408616914', 'https://tv.2345.com/detail/17700.html', 9.3, '家庭', 0, 4593);
INSERT INTO `tv_series_data` VALUES (4756722796, '三进山城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/4/s12762.jpg?1394891294', 'https://tv.2345.com/detail/12762.html', 8.5, '战争', 0, 5597);
INSERT INTO `tv_series_data` VALUES (4759301103, '新虎口脱险', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/4/12385/f810d4c9ef5a51e6668e61f2e5260faa.jpg', 'https://tv.2345.com/detail/12385.html', 8.7, '战争', 0, 7582);
INSERT INTO `tv_series_data` VALUES (4759609943, '了不起的D小姐', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/20/s61457.jpg', 'https://tv.2345.com/detail/61457.html', 9.7, '悬疑', 0, 5311);
INSERT INTO `tv_series_data` VALUES (4766184137, '活色生香未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/15/s45561.jpg', 'https://tv.2345.com/detail/45561.html', 8.9, '家庭', 0, 4553);
INSERT INTO `tv_series_data` VALUES (4766516089, '派克式左轮', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/393/fba64fcad7494ad6fa00a83398112a1b.jpg', 'https://tv.2345.com/detail/393.html', 9.1, '伦理', 0, 3406);
INSERT INTO `tv_series_data` VALUES (4770361529, '义勇义勇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/10/s32782.jpg?1409730790', 'https://tv.2345.com/detail/32782.html', 8.7, '战争', 0, 7253);
INSERT INTO `tv_series_data` VALUES (4770431625, '你是我的生命', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/4/1.jpg', 'https://tv.2345.com/detail/1496.html', 9.3, '家庭', 0, 3637);
INSERT INTO `tv_series_data` VALUES (4770704052, '边城落日', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/449954/1349863830/75d9ffc5eccf786a012a5c38b9bd36b5.jpg', 'https://tv.2345.com/detail/15704.html', 8.8, '战争', 0, 3329);
INSERT INTO `tv_series_data` VALUES (4777004453, '决战南京', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/324/45bcac39db183024527890149974c502.jpg', 'https://tv.2345.com/detail/324.html', 9, '战争', 0, 6374);
INSERT INTO `tv_series_data` VALUES (4779283587, '摩天大楼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/19/s57871.png', 'https://tv.2345.com/detail/57871.html', 9.2, '悬疑', 0, 5674);
INSERT INTO `tv_series_data` VALUES (4780980910, '迎春花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/3/10262/d99c4a1c376c1f66258180ad16e80eb0.jpg', 'https://tv.2345.com/detail/10262.html', 8.7, '战争', 0, 3068);
INSERT INTO `tv_series_data` VALUES (4781658317, '江南锄奸未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/14/s42598.jpg', 'https://tv.2345.com/detail/42598.html', 9.5, '军旅', 0, 3558);
INSERT INTO `tv_series_data` VALUES (4784546102, '柳树屯', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/2/6398/7951199dcc71635270d8bf96823a2dcd.jpg', 'https://tv.2345.com/detail/6398.html', 8.8, '家庭', 0, 3816);
INSERT INTO `tv_series_data` VALUES (4785302019, '娘家的故事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/532/b17ac4d3f6133dab0c52a28fe15132bf.jpg', 'https://tv.2345.com/detail/532.html', 8.8, '家庭', 0, 6744);
INSERT INTO `tv_series_data` VALUES (4786775238, '春去春又回大陆版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/1967/7f36d2ba9fe8233e66af0aa560ca7560.jpg', 'https://tv.2345.com/detail/1967.html', 9.3, '家庭', 0, 7173);
INSERT INTO `tv_series_data` VALUES (4787182323, '爱的阶梯未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/17/s52807.jpg', 'https://tv.2345.com/detail/52807.html', 7.5, '伦理', 0, 5077);
INSERT INTO `tv_series_data` VALUES (4787672229, '婚里婚外那些事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/11/s35826.jpg?1401330742', 'https://tv.2345.com/detail/35826.html', 8.5, '家庭', 0, 7851);
INSERT INTO `tv_series_data` VALUES (4791805117, '和平使命', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/3/11516/2b12318350d309e869b0afcd2d30dcd1.jpg', 'https://tv.2345.com/detail/11516.html', 8.9, '战争', 0, 4197);
INSERT INTO `tv_series_data` VALUES (4794684711, '雷锋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/712/baa29f2370520e2df8c4b28b9459c080.jpg', 'https://tv.2345.com/detail/712.html', 8.8, '军旅', 0, 3748);
INSERT INTO `tv_series_data` VALUES (4796882903, '大校的女儿', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/3/10125/98a12e906ca90aea039fb8a49c433f16.jpg', 'https://tv.2345.com/detail/10125.html', 9.5, '伦理', 0, 6405);
INSERT INTO `tv_series_data` VALUES (4799064847, '沉默的真相', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/19/s57929.jpg', 'https://tv.2345.com/detail/57929.html', 9.6, '悬疑', 0, 7575);
INSERT INTO `tv_series_data` VALUES (4802509569, '蛇年警官', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/17/s53304.jpg', 'https://tv.2345.com/detail/53304.html', 9.2, '家庭', 0, 3212);
INSERT INTO `tv_series_data` VALUES (4805364464, '波涛汹涌', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/3/10106/422bc95a8118f32476cdd50d9404eec1.jpg', 'https://tv.2345.com/detail/10106.html', 6.4, '战争', 0, 6283);
INSERT INTO `tv_series_data` VALUES (4815062673, '羊城风暴', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/2/6055/9f06d5ccb2052c0160ff0bfa68d0a88e.jpg', 'https://tv.2345.com/detail/6055.html', 8.7, '战争', 0, 5891);
INSERT INTO `tv_series_data` VALUES (4815576339, '走出监狱的女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/10/s31171.jpg?1415339893', 'https://tv.2345.com/detail/31171.html', 7.9, '家庭', 0, 6388);
INSERT INTO `tv_series_data` VALUES (4820747492, '大太监国语版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/1/8.jpg', 'https://tv.2345.com/detail/16455.html', 9.2, '其他', 0, 3987);
INSERT INTO `tv_series_data` VALUES (4822915444, '国家命运', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/5/s15626.jpg?1501134798', 'https://tv.2345.com/detail/15626.html', 9.4, '战争', 0, 5879);
INSERT INTO `tv_series_data` VALUES (4837924522, '杜鹃山', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/31/3b30258ebaaa86768406928c8f8641b6.jpg', 'https://tv.2345.com/detail/31.html', 9.3, '战争', 0, 3901);
INSERT INTO `tv_series_data` VALUES (4838569035, '化剑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/397/5cfe678df4e8422733da35b0ba57c7ed.jpg', 'https://tv.2345.com/detail/397.html', 8, '战争', 0, 6262);
INSERT INTO `tv_series_data` VALUES (4838846995, '郎心如铁', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/1828/2688585141c3546e3cfc0000a5a31b45.jpg', 'https://tv.2345.com/detail/1828.html', 9.6, '家庭', 0, 5248);
INSERT INTO `tv_series_data` VALUES (4839084841, '望海的女人DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/19/s57769.jpg', 'https://tv.2345.com/detail/57769.html', 9.3, '家庭', 0, 4697);
INSERT INTO `tv_series_data` VALUES (4841213658, '孔子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/3/s11332.jpg?1410420029', 'https://tv.2345.com/detail/11332.html', 9.1, '其他', 0, 4481);
INSERT INTO `tv_series_data` VALUES (4843430097, '伴你到永远', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/20/s61184.jpg', 'https://tv.2345.com/detail/61184.html', 9.7, '家庭', 0, 7626);
INSERT INTO `tv_series_data` VALUES (4844622798, '深呼吸', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/531/a4e63e14470296687e0980659a974dae.jpg', 'https://tv.2345.com/detail/531.html', 8.8, '家庭', 0, 6802);
INSERT INTO `tv_series_data` VALUES (4845543314, '再婚劫', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/4/12500/1f491cfac5898781cf59bebf81c698de.jpg', 'https://tv.2345.com/detail/12500.html', 8.8, '家庭', 0, 7091);
INSERT INTO `tv_series_data` VALUES (4846909059, '红绒花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/1214/f4cddc2ae5321a9868261d2dd2a85986.jpg', 'https://tv.2345.com/detail/1214.html', 8.2, '伦理', 0, 5926);
INSERT INTO `tv_series_data` VALUES (4848116605, '《外姓兄弟》', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/17/s52108.jpg', 'https://tv.2345.com/detail/52108.html', 7.1, '家庭', 0, 4522);
INSERT INTO `tv_series_data` VALUES (4848247361, '经营婚姻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/2/7720/28985749eeea7ae64ccc7d94cfb67014.jpg', 'https://tv.2345.com/detail/7720.html', 9.8, '家庭', 0, 4952);
INSERT INTO `tv_series_data` VALUES (4849267654, '德雷尔一家第三季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/18/s55012.jpg', 'https://tv.2345.com/detail/55012.html', 8.3, '其他', 0, 7400);
INSERT INTO `tv_series_data` VALUES (4852177592, '风雨桃花镇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/10/s30089.jpg?1394098377', 'https://tv.2345.com/detail/30089.html', 8.3, '战争', 0, 5837);
INSERT INTO `tv_series_data` VALUES (4856044481, '兄弟英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/1/5040/2d64d0a839e033a2138a0a9609929129.jpg', 'https://tv.2345.com/detail/5040.html', 9.2, '战争', 0, 6704);
INSERT INTO `tv_series_data` VALUES (4859811651, '枪侠', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/15/s47629.jpg?1449199120', 'https://tv.2345.com/detail/47629.html', 8.5, '战争', 0, 5917);
INSERT INTO `tv_series_data` VALUES (4866467204, '善始善终', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/18/s56529.jpg', 'https://tv.2345.com/detail/56529.html', 9.3, '悬疑', 0, 3807);
INSERT INTO `tv_series_data` VALUES (4867331573, '婚姻那些事儿', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/987/s987.jpg', 'https://tv.2345.com/detail/987.html', 8.7, '伦理', 0, 3120);
INSERT INTO `tv_series_data` VALUES (4868546923, '护国军魂传奇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/2/7117/74e12ada597a58e39da7b4a2a2e7f3ce.jpg', 'https://tv.2345.com/detail/7117.html', 9.3, '战争', 0, 5695);
INSERT INTO `tv_series_data` VALUES (4869946689, '守夜', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/8/s24654.jpg?1376965956', 'https://tv.2345.com/detail/24654.html', 8.1, '家庭', 0, 5745);
INSERT INTO `tv_series_data` VALUES (4871536108, '老公们的私房钱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/16/s48341.jpg?1478074877', 'https://tv.2345.com/detail/48341.html', 7.9, '伦理', 0, 3716);
INSERT INTO `tv_series_data` VALUES (4872035754, '好大一个家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/9/s28024.jpg?1422411841', 'https://tv.2345.com/detail/28024.html', 8.5, '家庭', 0, 3680);
INSERT INTO `tv_series_data` VALUES (4872513428, '西部之恋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/2406/466761996fc10ad27e34d7d362de307f.jpg', 'https://tv.2345.com/detail/2406.html', 8.7, '伦理', 0, 4737);
INSERT INTO `tv_series_data` VALUES (4872840321, '战火四千金', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/6/s19763.jpg?1362101971', 'https://tv.2345.com/detail/19763.html', 8.9, '战争', 0, 6240);
INSERT INTO `tv_series_data` VALUES (4872928935, '没有语言的生活', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/1359/3d3af3ac53912e32ed0a8c10a8c5070a.jpg', 'https://tv.2345.com/detail/1359.html', 9.4, '家庭', 0, 5981);
INSERT INTO `tv_series_data` VALUES (4874156480, '狼毒花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/1420/721185ed0fdf9eec63897dcaad099bb0.jpg', 'https://tv.2345.com/detail/1420.html', 9.2, '军旅', 0, 3899);
INSERT INTO `tv_series_data` VALUES (4874559936, '刘老根3', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/19/s57204.jpg', 'https://tv.2345.com/detail/57204.html', 8.9, '家庭', 0, 4629);
INSERT INTO `tv_series_data` VALUES (4876893898, '汉口码头', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/5/s17068.jpg?1410420318', 'https://tv.2345.com/detail/17068.html', 8.8, '战争', 0, 7159);
INSERT INTO `tv_series_data` VALUES (4877586646, '谷文昌', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/19/s57275.jpg', 'https://tv.2345.com/detail/57275.html', 9.8, '战争', 0, 5672);
INSERT INTO `tv_series_data` VALUES (4879061987, '断箭', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/1/3.jpg', 'https://tv.2345.com/detail/11694.html', 9.2, '战争', 0, 3496);
INSERT INTO `tv_series_data` VALUES (4879199974, '决胜', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/15/s46012.jpg', 'https://tv.2345.com/detail/46012.html', 8.5, '战争', 0, 6692);
INSERT INTO `tv_series_data` VALUES (4879215308, '红色利剑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/6/s20541.jpg?1365314580', 'https://tv.2345.com/detail/20541.html', 8.9, '战争', 0, 5145);
INSERT INTO `tv_series_data` VALUES (4884355199, '大水井风云', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/18/s56408.jpg', 'https://tv.2345.com/detail/56408.html', 8.9, '战争', 0, 7934);
INSERT INTO `tv_series_data` VALUES (4884587035, '八零九零', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/19/s59084.jpg', 'https://tv.2345.com/detail/59084.html', 7.7, '家庭', 0, 7348);
INSERT INTO `tv_series_data` VALUES (4888846897, '少奇同志在东北', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/15/s45229.jpg?1420339160', 'https://tv.2345.com/detail/45229.html', 7, '其他', 0, 4182);
INSERT INTO `tv_series_data` VALUES (4892442682, '杀虎口', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/163/15daa8ab6a40740034272193381129b6.jpg', 'https://tv.2345.com/detail/163.html', 9.4, '战争', 0, 5681);
INSERT INTO `tv_series_data` VALUES (4893256171, '当家人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/3/10118/0d8ab6fba629fcdbf45f910e020dae9c.jpg', 'https://tv.2345.com/detail/10118.html', 6.1, '其他', 0, 4164);
INSERT INTO `tv_series_data` VALUES (4894934525, '无心法师2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/17/s51066.jpg?1478756274', 'https://tv.2345.com/detail/51066.html', 8.7, '悬疑', 0, 6332);
INSERT INTO `tv_series_data` VALUES (4899946415, '你在微笑我却哭了', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/2/6806/19611196769bd8c89647f39b554da741.jpg', 'https://tv.2345.com/detail/6806.html', 10, '家庭', 0, 4210);
INSERT INTO `tv_series_data` VALUES (4909543987, '潜行者', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/15/s47811.jpg?1452062510', 'https://tv.2345.com/detail/47811.html', 8.4, '悬疑', 0, 5973);
INSERT INTO `tv_series_data` VALUES (4912739319, '勇士之城钟汉良原声版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/13/s40723.jpg?1408411633', 'https://tv.2345.com/detail/40723.html', 8.8, '战争', 0, 4132);
INSERT INTO `tv_series_data` VALUES (4916054938, '反恐特战队之猎影', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/17/s53295.jpg?1499068908', 'https://tv.2345.com/detail/53295.html', 8.9, '战争', 0, 5184);
INSERT INTO `tv_series_data` VALUES (4916806235, '女人汤', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/2/6714/5acf6ffd166cc2f2ce692e095964b747.jpg', 'https://tv.2345.com/detail/6714.html', 9, '家庭', 0, 4744);
INSERT INTO `tv_series_data` VALUES (4920986450, '天下有情之阿福传', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/3/s9046.jpg', 'https://tv.2345.com/detail/9046.html', 9.2, '家庭', 0, 7995);
INSERT INTO `tv_series_data` VALUES (4923552570, '理发师', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/1/s4677.jpg?1369880079', 'https://tv.2345.com/detail/4677.html', 8.5, '家庭', 0, 4449);
INSERT INTO `tv_series_data` VALUES (4923826306, '特种兵之深入敌后', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/18/s55541.jpg', 'https://tv.2345.com/detail/55541.html', 8.8, '战争', 0, 6311);
INSERT INTO `tv_series_data` VALUES (4924456198, '谍战之特殊较量', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/85/973b884835f946f2994349ab4a08ad87.jpg', 'https://tv.2345.com/detail/85.html', 9.3, '战争', 0, 6231);
INSERT INTO `tv_series_data` VALUES (4931452345, '保姆', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/1/4214/d41babdf79120d999135661345bde57c.jpg', 'https://tv.2345.com/detail/4214.html', 9, '家庭', 0, 6011);
INSERT INTO `tv_series_data` VALUES (4933541597, '百万新娘之爱无悔TV版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/6/s20185.jpg?1363574109', 'https://tv.2345.com/detail/20185.html', 8.9, '伦理', 0, 6776);
INSERT INTO `tv_series_data` VALUES (4933794462, '奸细', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/5/s15047.jpg?1365991291', 'https://tv.2345.com/detail/15047.html', 8.8, '战争', 0, 5814);
INSERT INTO `tv_series_data` VALUES (4933917560, '富贵在天', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/1/s5607.jpg', 'https://tv.2345.com/detail/5607.html', 8.4, '家庭', 0, 5503);
INSERT INTO `tv_series_data` VALUES (4935331000, '边城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/12/s36602.jpg?1403228895', 'https://tv.2345.com/detail/36602.html', 8.5, '悬疑', 0, 3082);
INSERT INTO `tv_series_data` VALUES (4935857655, '护宝者', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/20/s61095.jpg', 'https://tv.2345.com/detail/61095.html', 7.5, '战争', 0, 5953);
INSERT INTO `tv_series_data` VALUES (4939993112, '现场铁证', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/6/s19148.jpg?1410420456', 'https://tv.2345.com/detail/19148.html', 9.3, '悬疑', 0, 4730);
INSERT INTO `tv_series_data` VALUES (4941748191, '武工队传奇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/8/s25947.jpg?1380761662', 'https://tv.2345.com/detail/25947.html', 8.5, '战争', 0, 3264);
INSERT INTO `tv_series_data` VALUES (4948919038, '济南战役', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/17/s52266.jpg', 'https://tv.2345.com/detail/52266.html', 8.7, '战争', 0, 6298);
INSERT INTO `tv_series_data` VALUES (4949421837, '读心探案', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/18/s56194.jpg', 'https://tv.2345.com/detail/56194.html', 9.8, '悬疑', 0, 5200);
INSERT INTO `tv_series_data` VALUES (4951174364, '春天里', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/17/s53577.jpg?1504747787', 'https://tv.2345.com/detail/53577.html', 8.2, '家庭', 0, 4703);
INSERT INTO `tv_series_data` VALUES (4957179780, '鲜花朵朵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/151/72f191cbe2d4d6ccea59c4ae54160c6d.jpg', 'https://tv.2345.com/detail/151.html', 9, '家庭', 0, 7084);
INSERT INTO `tv_series_data` VALUES (4961214100, '生死依托', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/2/s8996.jpg', 'https://tv.2345.com/detail/8996.html', 9.5, '家庭', 0, 7929);
INSERT INTO `tv_series_data` VALUES (4961870312, '沙海老兵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/18/s54546.jpg', 'https://tv.2345.com/detail/54546.html', 9.6, '军旅', 0, 4642);
INSERT INTO `tv_series_data` VALUES (4966461023, '抗日名将左权', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/1/4861/4d3cefb55649174c78920b27812be0d4.jpg', 'https://tv.2345.com/detail/17352.html', 8.9, '战争', 0, 6079);
INSERT INTO `tv_series_data` VALUES (4970739759, '老鼠爱大米', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/1/3091/s3091.jpg', 'https://tv.2345.com/detail/3091.html', 8.7, '伦理', 0, 7501);
INSERT INTO `tv_series_data` VALUES (4972608758, '六尺之下第五季限时免费', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/15/s46608.jpg', 'https://tv.2345.com/detail/46608.html', 8, '其他', 0, 4591);
INSERT INTO `tv_series_data` VALUES (4976840376, '风流戏王', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/73/5c8e1d1d231e035681b1c90181fb3b43.jpg', 'https://tv.2345.com/detail/73.html', 10, '家庭', 0, 3288);
INSERT INTO `tv_series_data` VALUES (4981986829, '只想今生一起走', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/17/s53879.jpg', 'https://tv.2345.com/detail/53879.html', 8.8, '家庭', 0, 3965);
INSERT INTO `tv_series_data` VALUES (4986804784, '大丽家的往事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/2/7116/721c1d2bf5a3a06b29b7250e7eb6960e.jpg', 'https://tv.2345.com/detail/7116.html', 9, '家庭', 0, 7574);
INSERT INTO `tv_series_data` VALUES (4987411023, '大宋少年志', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/18/s55105.jpg?1534212143', 'https://tv.2345.com/detail/55105.html', 8.8, '悬疑', 0, 5635);
INSERT INTO `tv_series_data` VALUES (4995550288, '黑金地的女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/2/6932/b51600bcafa57a3fa9bd619a65fc7ac1.jpg', 'https://tv.2345.com/detail/6932.html', 9.7, '伦理', 0, 4264);
INSERT INTO `tv_series_data` VALUES (4996233251, '豁口', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/20/s60829.jpg', 'https://tv.2345.com/detail/60829.html', 8.6, '家庭', 0, 7755);
INSERT INTO `tv_series_data` VALUES (4997264769, '走出蓝水河', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/2/8625/9ed34220f6b624fd32c15dd01eaac0d1.jpg', 'https://tv.2345.com/detail/8625.html', 9.3, '家庭', 0, 4899);
INSERT INTO `tv_series_data` VALUES (4998911960, '中国家庭之母爱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/1405/e8a3ada963c097ebd3a1b1c8886a452e.jpg', 'https://tv.2345.com/detail/1405.html', 8.8, '家庭', 0, 7846);
INSERT INTO `tv_series_data` VALUES (5005266237, '我为儿孙当北漂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/15/s46055.jpg', 'https://tv.2345.com/detail/46055.html', 8.4, '家庭', 0, 7389);
INSERT INTO `tv_series_data` VALUES (5005763551, '笨小孩', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/2010/c6713eb35dd5103988b9221aef5076b5.jpg', 'https://tv.2345.com/detail/2010.html', 9.2, '家庭', 0, 4259);
INSERT INTO `tv_series_data` VALUES (5013562653, '天涯浴血DVD', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/18/s54223.jpg', 'https://tv.2345.com/detail/54223.html', 7.6, '战争', 0, 7124);
INSERT INTO `tv_series_data` VALUES (5014224173, '民兵葛二蛋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/b/a.jpg', 'https://tv.2345.com/detail/17320.html', 9.6, '战争', 0, 7173);
INSERT INTO `tv_series_data` VALUES (5019103732, '大掌门', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/9/s28334.jpg?1387849623', 'https://tv.2345.com/detail/28334.html', 8.5, '战争', 0, 3127);
INSERT INTO `tv_series_data` VALUES (5020802838, '十级学者刺猬君', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/18/s56787.jpg', 'https://tv.2345.com/detail/56787.html', 7.9, '其他', 0, 6879);
INSERT INTO `tv_series_data` VALUES (5024406232, '魂断楼兰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/2/6880/73bcefe612d432cb24855d1dfc582ff0.jpg', 'https://tv.2345.com/detail/6880.html', 8.3, '悬疑', 0, 3408);
INSERT INTO `tv_series_data` VALUES (5026452554, '无名者', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/16/s50874.jpg?1478573887', 'https://tv.2345.com/detail/50874.html', 8.2, '战争', 0, 4098);
INSERT INTO `tv_series_data` VALUES (5026900896, '代号九耳犬', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/11/s34695.jpg?1398130369', 'https://tv.2345.com/detail/34695.html', 8.6, '战争', 0, 5273);
INSERT INTO `tv_series_data` VALUES (5027991326, '警察遇到兵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/2/s8511.jpg', 'https://tv.2345.com/detail/8511.html', 10, '战争', 0, 7614);
INSERT INTO `tv_series_data` VALUES (5028730444, '川军团血战到底', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/2/6206/cb2ee235772fe50f2d3698618ea03ffe.jpg', 'https://tv.2345.com/detail/6206.html', 9.5, '战争', 0, 7397);
INSERT INTO `tv_series_data` VALUES (5029515844, '千金女佣国语版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/8/3.jpg', 'https://tv.2345.com/detail/18709.html', 8.8, '家庭', 0, 3848);
INSERT INTO `tv_series_data` VALUES (5031097041, '鸽子哨', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/589/fd7ed1164c66a553ca9ce4dc3d9076c3.jpg', 'https://tv.2345.com/detail/589.html', 9.5, '家庭', 0, 6094);
INSERT INTO `tv_series_data` VALUES (5031917840, '绣娘兰馨', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/1844/1b1a28619c5964068b9bc8aeed710739.jpg', 'https://tv.2345.com/detail/1844.html', 9, '家庭', 0, 6681);
INSERT INTO `tv_series_data` VALUES (5039057092, '家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/14/s43107.jpg?1414641762', 'https://tv.2345.com/detail/43107.html', 9, '伦理', 0, 7354);
INSERT INTO `tv_series_data` VALUES (5043195206, '海啸电视剧', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/18/s56493.jpg', 'https://tv.2345.com/detail/56493.html', 7.6, '军旅', 0, 4345);
INSERT INTO `tv_series_data` VALUES (5047911946, '情锁', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/2893/e795588b1b267bd7e21c457e03cd0ec3.jpg', 'https://tv.2345.com/detail/2893.html', 10, '伦理', 0, 4121);
INSERT INTO `tv_series_data` VALUES (5047936026, '迷失的情感', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/9/8322.jpg', 'https://tv.2345.com/detail/8322.html', 8.8, '家庭', 0, 3895);
INSERT INTO `tv_series_data` VALUES (5054823363, '风影', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/7/s22529.jpg?1371173249', 'https://tv.2345.com/detail/22529.html', 8, '军旅', 0, 5045);
INSERT INTO `tv_series_data` VALUES (5055299751, '爱你一生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/15/s46176.jpg?1430792070', 'https://tv.2345.com/detail/46176.html', 8.3, '家庭', 0, 6203);
INSERT INTO `tv_series_data` VALUES (5055919054, '天伦劫', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/560/a849a666ba14c10f914b53e47cc73d61.jpg', 'https://tv.2345.com/detail/560.html', 9, '伦理', 0, 3074);
INSERT INTO `tv_series_data` VALUES (5062096847, '风云年代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/16/s48971.jpg?1467597932', 'https://tv.2345.com/detail/48971.html', 8.4, '悬疑', 0, 3140);
INSERT INTO `tv_series_data` VALUES (5062861239, '吸了个剧2019', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/18/s55745.jpg', 'https://tv.2345.com/detail/55745.html', 7.5, '其他', 0, 6584);
INSERT INTO `tv_series_data` VALUES (5062911642, '非亲父子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/2851/aa0ef6de681d16de8c3bc32630ba6bf3.jpg', 'https://tv.2345.com/detail/2851.html', 9.2, '家庭', 0, 4609);
INSERT INTO `tv_series_data` VALUES (5063465640, '老伴', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/182/0de33bf7110a43f61cccb6ec3c3c2c32.jpg', 'https://tv.2345.com/detail/182.html', 9.5, '伦理', 0, 4551);
INSERT INTO `tv_series_data` VALUES (5063833895, '咱家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/17/s52636.jpg?1487049791', 'https://tv.2345.com/detail/52636.html', 8.7, '家庭', 0, 3166);
INSERT INTO `tv_series_data` VALUES (5063873730, '我在等你回家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/8/s24145.jpg?1375502707', 'https://tv.2345.com/detail/24145.html', 8.1, '家庭', 0, 4425);
INSERT INTO `tv_series_data` VALUES (5071980245, '锋刃', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/14/s44789.jpg?1419816916', 'https://tv.2345.com/detail/44789.html', 8.7, '战争', 0, 6515);
INSERT INTO `tv_series_data` VALUES (5072285302, '长空铸剑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/1/3160/36cf2bcd6cdce04cd9ff5c7957fd785c.jpg', 'https://tv.2345.com/detail/3160.html', 9.2, '战争', 0, 4609);
INSERT INTO `tv_series_data` VALUES (5074361479, '钟点工们', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/10/s31191.jpg?1405301671', 'https://tv.2345.com/detail/31191.html', 8.6, '家庭', 0, 4433);
INSERT INTO `tv_series_data` VALUES (5077524919, '井冈山', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/1/3123/f4c4b946a64d7ac4a93c33e5819408de.jpg', 'https://tv.2345.com/detail/3123.html', 10, '战争', 0, 3369);
INSERT INTO `tv_series_data` VALUES (5081181095, '战争惊天之谜', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/19/s57407.jpg', 'https://tv.2345.com/detail/57407.html', 9.8, '战争', 0, 6707);
INSERT INTO `tv_series_data` VALUES (5081910378, '宽恕', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/1356/84feb6c8248be98a5fdd5128fe837dee.jpg', 'https://tv.2345.com/detail/1356.html', 10, '伦理', 0, 3161);
INSERT INTO `tv_series_data` VALUES (5087846148, '十日游戏', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/19/s57653.jpg', 'https://tv.2345.com/detail/57653.html', 9.4, '悬疑', 0, 7763);
INSERT INTO `tv_series_data` VALUES (5089979958, '夺爱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/3/b.jpg', 'https://tv.2345.com/detail/17496.html', 8.8, '家庭', 0, 7360);
INSERT INTO `tv_series_data` VALUES (5090858154, '第五空间', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/895/ccc6bafdba3631e26559ec2fa96f80dc.jpg', 'https://tv.2345.com/detail/895.html', 9.3, '战争', 0, 4428);
INSERT INTO `tv_series_data` VALUES (5094510495, '回到拉萨', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/18/s54828.jpg', 'https://tv.2345.com/detail/54828.html', 8.7, '家庭', 0, 6289);
INSERT INTO `tv_series_data` VALUES (5094846905, '喋血钱塘江', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/687/704542b8b7a0fdd0e6422db394b903be.jpg', 'https://tv.2345.com/detail/687.html', 8.9, '战争', 0, 7633);
INSERT INTO `tv_series_data` VALUES (5095408302, '嫁衣', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/0/s2109.jpg?1363252926', 'https://tv.2345.com/detail/2109.html', 8.4, '家庭', 0, 3347);
INSERT INTO `tv_series_data` VALUES (5098897264, '杀狼花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/2/s7796.jpg', 'https://tv.2345.com/detail/7796.html', 9, '战争', 0, 7211);
INSERT INTO `tv_series_data` VALUES (5099970887, '红粉', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/394/3d60a334e3dabf352f300beb13c2ca15.jpg', 'https://tv.2345.com/detail/394.html', 9, '伦理', 0, 3173);
INSERT INTO `tv_series_data` VALUES (5104296549, '我的兄弟姐妹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/1/3194/6935c1fdaaf6d3a55ca08c5d01f7225e.jpg', 'https://tv.2345.com/detail/3194.html', 10, '家庭', 0, 6200);
INSERT INTO `tv_series_data` VALUES (5106332602, '别再犹豫', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/1/s3714.jpg', 'https://tv.2345.com/detail/3714.html', 8.5, '伦理', 0, 3319);
INSERT INTO `tv_series_data` VALUES (5107069844, '独立纵队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/3/s9851.jpg', 'https://tv.2345.com/detail/9851.html', 8.8, '战争', 0, 6134);
INSERT INTO `tv_series_data` VALUES (5109933461, '圣堂风云', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/1108/73a5f403c670d5df6e6064269f5c5092.jpg', 'https://tv.2345.com/detail/1108.html', 9.2, '战争', 0, 7746);
INSERT INTO `tv_series_data` VALUES (5111013035, '烈火红岩', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/813/151243579426d34f12d3fa1af7c2b923.jpg', 'https://tv.2345.com/detail/813.html', 8.8, '战争', 0, 4594);
INSERT INTO `tv_series_data` VALUES (5111581726, '锁定目标', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/12/s36881.jpg?1404040617', 'https://tv.2345.com/detail/36881.html', 8.2, '悬疑', 0, 3849);
INSERT INTO `tv_series_data` VALUES (5114893990, '妈妈为我嫁', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/1387/aa38cd301db0732f1cf755f77f47ff53.jpg', 'https://tv.2345.com/detail/1387.html', 8.9, '家庭', 0, 7411);
INSERT INTO `tv_series_data` VALUES (5114983011, '家族荣誉', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/2/s7351.jpg?1409127446', 'https://tv.2345.com/detail/7351.html', 8.5, '家庭', 0, 7364);
INSERT INTO `tv_series_data` VALUES (5115015906, '越走越好', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/d/3.jpg', 'https://tv.2345.com/detail/18137.html', 9.2, '伦理', 0, 5901);
INSERT INTO `tv_series_data` VALUES (5115590718, '神探夏洛克第2季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/2/s8716.jpg', 'https://tv.2345.com/detail/8716.html', 8.6, '悬疑', 0, 3321);
INSERT INTO `tv_series_data` VALUES (5121617411, '铁甲英豪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/4/12365/09df0cbbb8d189d64a43b01c4a2cb836.jpg', 'https://tv.2345.com/detail/12365.html', 8.7, '战争', 0, 6997);
INSERT INTO `tv_series_data` VALUES (5124880405, '天真遇到现实', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/e/5.jpg', 'https://tv.2345.com/detail/17798.html', 8.8, '家庭', 0, 5125);
INSERT INTO `tv_series_data` VALUES (5127364499, '为了新中国前进', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/0/s1309.jpg?1501135083', 'https://tv.2345.com/detail/1309.html', 8.8, '战争', 0, 3197);
INSERT INTO `tv_series_data` VALUES (5130328057, '油菜花香', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/9/s28002.jpg?1387187401', 'https://tv.2345.com/detail/28002.html', 8.5, '家庭', 0, 5335);
INSERT INTO `tv_series_data` VALUES (5132185833, '空降利刃DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/18/s56615.jpg', 'https://tv.2345.com/detail/56615.html', 9.3, '战争', 0, 3539);
INSERT INTO `tv_series_data` VALUES (5132953030, '电视剧小兵张嘎', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/17/s53756.jpg', 'https://tv.2345.com/detail/53756.html', 8.3, '战争', 0, 5614);
INSERT INTO `tv_series_data` VALUES (5134858021, '若是一个人闽南话版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/19/s59100.jpg', 'https://tv.2345.com/detail/59100.html', 9.6, '家庭', 0, 5061);
INSERT INTO `tv_series_data` VALUES (5138633503, '石榴红了', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/4/4.jpg', 'https://tv.2345.com/detail/18117.html', 8.9, '家庭', 0, 6591);
INSERT INTO `tv_series_data` VALUES (5143256942, '勇者胜', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/18/s54800.jpg?1526348160', 'https://tv.2345.com/detail/54800.html', 8.9, '战争', 0, 3674);
INSERT INTO `tv_series_data` VALUES (5150129077, '等爱回家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/20/s61185.jpg', 'https://tv.2345.com/detail/61185.html', 9.8, '家庭', 0, 3538);
INSERT INTO `tv_series_data` VALUES (5152263404, '我要当八路军', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/7/s23909.jpg?1374978312', 'https://tv.2345.com/detail/23909.html', 8.1, '战争', 0, 4138);
INSERT INTO `tv_series_data` VALUES (5155880241, '《外姓兄弟》', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/17/s52108.jpg', 'https://tv.2345.com/detail/52108.html', 7.1, '其他', 0, 5045);
INSERT INTO `tv_series_data` VALUES (5158070655, '杀出绝地', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/1/4315/2947f0751cbb062a81564c0548e51d4f.jpg', 'https://tv.2345.com/detail/4315.html', 8.8, '战争', 0, 6990);
INSERT INTO `tv_series_data` VALUES (5159804599, '我和我的儿女们', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/18/s56614.jpg', 'https://tv.2345.com/detail/56614.html', 8.8, '家庭', 0, 6333);
INSERT INTO `tv_series_data` VALUES (5160184743, '十一级台阶', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/1/s4463.jpg?1410419600', 'https://tv.2345.com/detail/4463.html', 8.8, '军旅', 0, 3024);
INSERT INTO `tv_series_data` VALUES (5160222432, '梦断乐缘堂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/17/s53235.jpg', 'https://tv.2345.com/detail/53235.html', 8.8, '战争', 0, 6835);
INSERT INTO `tv_series_data` VALUES (5160732798, '历史的进程', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/321/965a9030e9195cc5a3265fbf6950e8e0.jpg', 'https://tv.2345.com/detail/321.html', 8.8, '战争', 0, 7165);
INSERT INTO `tv_series_data` VALUES (5163719040, '血色誓言', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/13/s41677.jpg?1411017910', 'https://tv.2345.com/detail/41677.html', 8, '悬疑', 0, 4452);
INSERT INTO `tv_series_data` VALUES (5164515335, '甄嬛后纪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/3/11542/72cb7c4929d07f58c2fe95057158a039.jpg', 'https://tv.2345.com/detail/11542.html', 6.1, '其他', 0, 5000);
INSERT INTO `tv_series_data` VALUES (5168427140, '兵王', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/18/s54866.jpg', 'https://tv.2345.com/detail/54866.html', 8.9, '战争', 0, 7319);
INSERT INTO `tv_series_data` VALUES (5170026160, '阴丹士林', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/1373/2b72aa56935ea479f1dcdec98783a51f.jpg', 'https://tv.2345.com/detail/1373.html', 10, '战争', 0, 6451);
INSERT INTO `tv_series_data` VALUES (5179945078, '装台', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/19/s58717.jpg', 'https://tv.2345.com/detail/58717.html', 8, '家庭', 0, 5563);
INSERT INTO `tv_series_data` VALUES (5179996671, '月嫂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/747/43878ca20e5798b7296af40886b43b5f.jpg', 'https://tv.2345.com/detail/747.html', 8, '家庭', 0, 4728);
INSERT INTO `tv_series_data` VALUES (5180531325, '生逢灿烂的日子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/16/s48615.jpg?1511421232', 'https://tv.2345.com/detail/48615.html', 8.9, '家庭', 0, 6289);
INSERT INTO `tv_series_data` VALUES (5181329387, '决币', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/18/s55583.jpg', 'https://tv.2345.com/detail/55583.html', 9.1, '战争', 0, 7047);
INSERT INTO `tv_series_data` VALUES (5182120489, '化剑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/397/5cfe678df4e8422733da35b0ba57c7ed.jpg', 'https://tv.2345.com/detail/397.html', 8, '军旅', 0, 6685);
INSERT INTO `tv_series_data` VALUES (5184814093, '软弱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/2231/s2231.jpg', 'https://tv.2345.com/detail/2231.html', 9.6, '家庭', 0, 4959);
INSERT INTO `tv_series_data` VALUES (5188808162, '闪闪的红星', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/2/s7876.jpg', 'https://tv.2345.com/detail/7876.html', 8.7, '战争', 0, 3796);
INSERT INTO `tv_series_data` VALUES (5189841571, '亲人爱人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/217/1e3d03d0eac55f9420bb195af91446f0.jpg', 'https://tv.2345.com/detail/217.html', 8.8, '伦理', 0, 6784);
INSERT INTO `tv_series_data` VALUES (5190320721, '天衣无缝', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/18/s55066.jpg?1533175400', 'https://tv.2345.com/detail/55066.html', 9.1, '悬疑', 0, 5521);
INSERT INTO `tv_series_data` VALUES (5192439883, '红海棠', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/1377/a8c6f5e84df98b05aaacc59337cd16b9.jpg', 'https://tv.2345.com/detail/1377.html', 9.3, '伦理', 0, 6665);
INSERT INTO `tv_series_data` VALUES (5192908798, '大宅门2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/2854/ea477f14258256256b87bc4c9ab63cf9.jpg', 'https://tv.2345.com/detail/2854.html', 9.4, '家庭', 0, 3108);
INSERT INTO `tv_series_data` VALUES (5193788089, '飞哥战队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/17/s53390.jpg?1500873062', 'https://tv.2345.com/detail/53390.html', 8.5, '战争', 0, 6225);
INSERT INTO `tv_series_data` VALUES (5195620242, '闺蜜嫁到', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/16/s49037.jpg?1479277770', 'https://tv.2345.com/detail/49037.html', 8.2, '家庭', 0, 4375);
INSERT INTO `tv_series_data` VALUES (5198316319, '情满大湾', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/20/s61344.jpg', 'https://tv.2345.com/detail/61344.html', 8.7, '其他', 0, 3176);
INSERT INTO `tv_series_data` VALUES (5201189789, '兵圣', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/2939/60add72214350ece86bfcaa4c3238704.jpg', 'https://tv.2345.com/detail/2939.html', 6.2, '战争', 0, 4012);
INSERT INTO `tv_series_data` VALUES (5201282330, '爱了散了', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/157/478dcab19b6d0dbdabff14f9d1b018c5.jpg', 'https://tv.2345.com/detail/157.html', 9.1, '家庭', 0, 7446);
INSERT INTO `tv_series_data` VALUES (5201872261, '东方战场', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/15/s47040.jpg?1441949966', 'https://tv.2345.com/detail/47040.html', 8.6, '战争', 0, 4329);
INSERT INTO `tv_series_data` VALUES (5204911372, '中国刑侦一号案', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/1/3189/s3189.jpg', 'https://tv.2345.com/detail/3189.html', 9.7, '悬疑', 0, 4510);
INSERT INTO `tv_series_data` VALUES (5206354463, '马大帅3', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/1624/s1624.jpg', 'https://tv.2345.com/detail/1624.html', 9.2, '家庭', 0, 5642);
INSERT INTO `tv_series_data` VALUES (5209950796, '敌特在行动', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/1454/3500ecc0b625e1a8c856370769d35b61.jpg', 'https://tv.2345.com/detail/1454.html', 8.9, '悬疑', 0, 7191);
INSERT INTO `tv_series_data` VALUES (5211289610, '孩子你在哪里', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/4/12455/ab0be8b148f31602bfd6d55a5d42d195.jpg', 'https://tv.2345.com/detail/12455.html', 9.8, '家庭', 0, 4337);
INSERT INTO `tv_series_data` VALUES (5211558719, '古村女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/2/s7809.jpg', 'https://tv.2345.com/detail/7809.html', 8.8, '家庭', 0, 7928);
INSERT INTO `tv_series_data` VALUES (5214014173, '最后的子弹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/2313/a032b0ada3263bfd0fd81a37f3cdd676.jpg', 'https://tv.2345.com/detail/2313.html', 9.2, '家庭', 0, 7105);
INSERT INTO `tv_series_data` VALUES (5214973594, '绝对零度', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/1/3462/45fce2b83f0366e063747ddc65290f27.jpg', 'https://tv.2345.com/detail/3462.html', 8.7, '悬疑', 0, 5505);
INSERT INTO `tv_series_data` VALUES (5219642018, '老有所依', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/8/s26812.jpg?1383705554', 'https://tv.2345.com/detail/26812.html', 8.6, '家庭', 0, 3664);
INSERT INTO `tv_series_data` VALUES (5220477530, '锁住有晴天', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/18/s55008.jpg', 'https://tv.2345.com/detail/55008.html', 8.8, '家庭', 0, 6873);
INSERT INTO `tv_series_data` VALUES (5221010418, '剩斗士的店', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/15/s46686.jpg', 'https://tv.2345.com/detail/46686.html', 8.8, '其他', 0, 4804);
INSERT INTO `tv_series_data` VALUES (5222911700, '完美妈妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/15/s47104.jpg', 'https://tv.2345.com/detail/47104.html', 7.5, '家庭', 0, 7281);
INSERT INTO `tv_series_data` VALUES (5227269023, '将门风云', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/2317/961a136c5532b440eb6ecaaf4739ebf3.jpg', 'https://tv.2345.com/detail/2317.html', 9.4, '战争', 0, 4643);
INSERT INTO `tv_series_data` VALUES (5228187257, '一生守护', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/6/s20951.jpg?1365952987', 'https://tv.2345.com/detail/20951.html', 8.8, '家庭', 0, 5491);
INSERT INTO `tv_series_data` VALUES (5229383246, '最后的较量', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/1247/ecad976d91537b1ee77fe6917bbcfb99.jpg', 'https://tv.2345.com/detail/1247.html', 8.9, '战争', 0, 7272);
INSERT INTO `tv_series_data` VALUES (5230886063, '铁血独立营', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/11/s35237.jpg?1399192121', 'https://tv.2345.com/detail/35237.html', 8.5, '战争', 0, 7122);
INSERT INTO `tv_series_data` VALUES (5231056776, '父爱如山', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/1284/bdeb464468952542c4773c183cadb53d.jpg', 'https://tv.2345.com/detail/1284.html', 9.3, '伦理', 0, 4245);
INSERT INTO `tv_series_data` VALUES (5238382449, '闲人马大姐', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/3/10392/d1a6307b1a4e87869c85f1f82c6e2bb5.jpg', 'https://tv.2345.com/detail/10392.html', 8, '家庭', 0, 3238);
INSERT INTO `tv_series_data` VALUES (5238716837, '贞观长歌', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/1075/2ef343472cd38f26f57d35d3642ef823.jpg', 'https://tv.2345.com/detail/1075.html', 9.5, '战争', 0, 3890);
INSERT INTO `tv_series_data` VALUES (5239955026, '西安事变', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/2423/1a9a4174c6db628ef75a0d4fbf1a83f1.jpg', 'https://tv.2345.com/detail/2423.html', 9.2, '战争', 0, 7145);
INSERT INTO `tv_series_data` VALUES (5240478284, '上海一家人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/3/10221/521f0ef56e1dcb6b47df5044f3582f15.jpg', 'https://tv.2345.com/detail/10221.html', 9.6, '家庭', 0, 6387);
INSERT INTO `tv_series_data` VALUES (5247139044, '淬火成钢', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/17/s52253.jpg?1481594769', 'https://tv.2345.com/detail/52253.html', 7.8, '战争', 0, 6060);
INSERT INTO `tv_series_data` VALUES (5247351245, '漂洋过海来看你未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/17/s52971.jpg', 'https://tv.2345.com/detail/52971.html', 9.1, '家庭', 0, 5244);
INSERT INTO `tv_series_data` VALUES (5250762173, '风筝', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/11/s33352.jpg?1402105781', 'https://tv.2345.com/detail/33352.html', 8.5, '悬疑', 0, 6686);
INSERT INTO `tv_series_data` VALUES (5252033163, '太行山上央视版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/15/s46859.jpg', 'https://tv.2345.com/detail/46859.html', 8.3, '战争', 0, 5906);
INSERT INTO `tv_series_data` VALUES (5256806636, '北平往事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/3/s9662.jpg', 'https://tv.2345.com/detail/9662.html', 6.7, '战争', 0, 4002);
INSERT INTO `tv_series_data` VALUES (5262981310, '五星红旗迎风飘扬2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/a/4.jpg', 'https://tv.2345.com/detail/16661.html', 9.2, '战争', 0, 7004);
INSERT INTO `tv_series_data` VALUES (5264315835, '香水', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/1450/80b81bca63585658051615332ddf97b5.jpg', 'https://tv.2345.com/detail/1450.html', 8.7, '悬疑', 0, 6694);
INSERT INTO `tv_series_data` VALUES (5264628862, '为了新中国前进', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/0/s1309.jpg?1501135083', 'https://tv.2345.com/detail/1309.html', 8.8, '军旅', 0, 7153);
INSERT INTO `tv_series_data` VALUES (5266423562, '樱桃', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/2/s7778.jpg?1362625379', 'https://tv.2345.com/detail/7778.html', 8.9, '家庭', 0, 5854);
INSERT INTO `tv_series_data` VALUES (5270610508, '战鼓擂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/19/s58813.png', 'https://tv.2345.com/detail/58813.html', 8.8, '战争', 0, 4128);
INSERT INTO `tv_series_data` VALUES (5270974370, '突然心动', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/550/8c53eb59217f2c898113076080f88ac8.jpg', 'https://tv.2345.com/detail/550.html', 8.8, '家庭', 0, 7536);
INSERT INTO `tv_series_data` VALUES (5274614809, '第一声枪响', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/18/s54289.jpg', 'https://tv.2345.com/detail/54289.html', 9.2, '战争', 0, 3004);
INSERT INTO `tv_series_data` VALUES (5281125585, '光荣使命', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/8/s25065.jpg?1378177770', 'https://tv.2345.com/detail/25065.html', 8.5, '战争', 0, 7365);
INSERT INTO `tv_series_data` VALUES (5283064250, '母子连心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/5/s15365.jpg?1394175516', 'https://tv.2345.com/detail/15365.html', 8.3, '家庭', 0, 3814);
INSERT INTO `tv_series_data` VALUES (5284454722, '香迷研究所', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/15/s45559.jpg', 'https://tv.2345.com/detail/45559.html', 8, '其他', 0, 3209);
INSERT INTO `tv_series_data` VALUES (5288068031, '樱桃小丸子真人版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/17/s52668.jpg', 'https://tv.2345.com/detail/52668.html', 8.5, '家庭', 0, 6921);
INSERT INTO `tv_series_data` VALUES (5289459958, '换子成龙', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/3/9055/8da9c9656f016211fb0b1e1f931dd60e.jpg', 'https://tv.2345.com/detail/9055.html', 8.9, '家庭', 0, 4574);
INSERT INTO `tv_series_data` VALUES (5298550666, '战后之战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/323/e56862418c870c70a0a62564001043b4.jpg', 'https://tv.2345.com/detail/323.html', 9.6, '战争', 0, 3321);
INSERT INTO `tv_series_data` VALUES (5299094938, '更年期的幸福生活', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/1/5553/1f044230a47142d601f1374ca4e27212.jpg', 'https://tv.2345.com/detail/5553.html', 8.7, '家庭', 0, 3869);
INSERT INTO `tv_series_data` VALUES (5300310242, '幸福向前走', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/6/s19960.jpg?1363142038', 'https://tv.2345.com/detail/19960.html', 8.5, '伦理', 0, 4430);
INSERT INTO `tv_series_data` VALUES (5303509703, '义海风云', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/2/6811/dec2585bc91c19e22b8cee2df14efcbf.jpg', 'https://tv.2345.com/detail/6811.html', 9.2, '伦理', 0, 3468);
INSERT INTO `tv_series_data` VALUES (5306097211, '推理笔记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/17/s53283.jpg', 'https://tv.2345.com/detail/53283.html', 8.7, '悬疑', 0, 7324);
INSERT INTO `tv_series_data` VALUES (5310165093, '您好母亲大人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/20/s60990.jpg', 'https://tv.2345.com/detail/60990.html', 9.7, '家庭', 0, 3349);
INSERT INTO `tv_series_data` VALUES (5319924467, '数风流人物', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/2/s8622.jpg', 'https://tv.2345.com/detail/8622.html', 9, '战争', 0, 5726);
INSERT INTO `tv_series_data` VALUES (5322161242, '日出', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/2007/6c0e88984a2c47759377dfc8bf5d888a.jpg', 'https://tv.2345.com/detail/2007.html', 10, '家庭', 0, 5895);
INSERT INTO `tv_series_data` VALUES (5322975758, '真爱一世情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/1/s4609.jpg', 'https://tv.2345.com/detail/4609.html', 8.8, '家庭', 0, 6201);
INSERT INTO `tv_series_data` VALUES (5324163042, '大校的女儿', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/3/10125/98a12e906ca90aea039fb8a49c433f16.jpg', 'https://tv.2345.com/detail/10125.html', 9.5, '战争', 0, 3100);
INSERT INTO `tv_series_data` VALUES (5326032123, '母亲陈小艺版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/3/s9000.jpg?1417401610', 'https://tv.2345.com/detail/9000.html', 7.2, '伦理', 0, 6783);
INSERT INTO `tv_series_data` VALUES (5328902999, '牵挂TV版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/20/s60892.jpg', 'https://tv.2345.com/detail/60892.html', 9.8, '家庭', 0, 4879);
INSERT INTO `tv_series_data` VALUES (5336063399, '婆家娘家2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/14/s43538.jpg', 'https://tv.2345.com/detail/43538.html', 8.5, '家庭', 0, 3331);
INSERT INTO `tv_series_data` VALUES (5338978851, '一日夫妻百日恩', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/2/8217/a32471bc324c0033716889867c433bdd.jpg', 'https://tv.2345.com/detail/8217.html', 8, '家庭', 0, 6806);
INSERT INTO `tv_series_data` VALUES (5339096615, '人活一张脸', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/96/7741ecb67852f38fc48ecc1b4b78b5e9.jpg', 'https://tv.2345.com/detail/96.html', 9.6, '家庭', 0, 4483);
INSERT INTO `tv_series_data` VALUES (5341522913, '绝密押运', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/3/10176/1823823dda015175395ae63ad7962b4f.jpg', 'https://tv.2345.com/detail/10176.html', 9.7, '军旅', 0, 4654);
INSERT INTO `tv_series_data` VALUES (5347937631, '冷箭', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/529/f81b9eb1874ce04604cd57d2273a9f55.jpg', 'https://tv.2345.com/detail/529.html', 9.1, '战争', 0, 5569);
INSERT INTO `tv_series_data` VALUES (5351721735, '婆婆来了DVD', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/18/s54422.jpg', 'https://tv.2345.com/detail/54422.html', 7.2, '伦理', 0, 4669);
INSERT INTO `tv_series_data` VALUES (5354086962, '千金保姆', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/13/s40853.jpg?1449274962', 'https://tv.2345.com/detail/40853.html', 8.4, '家庭', 0, 5403);
INSERT INTO `tv_series_data` VALUES (5354480461, '小爸妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/15/s46633.jpg?1498720239', 'https://tv.2345.com/detail/46633.html', 8.5, '家庭', 0, 7811);
INSERT INTO `tv_series_data` VALUES (5355102600, '美梦成真', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/0/s2600.jpg?1444472415', 'https://tv.2345.com/detail/2600.html', 8.4, '家庭', 0, 5455);
INSERT INTO `tv_series_data` VALUES (5355240322, '毁灭', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/2/s8249.jpg?1366186748', 'https://tv.2345.com/detail/8249.html', 8.3, '悬疑', 0, 7977);
INSERT INTO `tv_series_data` VALUES (5357492149, '血色沉香', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/275/9945c4dc6e71ad09ad8d912a5d2949fe.jpg', 'https://tv.2345.com/detail/275.html', 9.1, '战争', 0, 4351);
INSERT INTO `tv_series_data` VALUES (5362098577, '烈火凤凰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/19/s58992.jpg', 'https://tv.2345.com/detail/58992.html', 8.7, '战争', 0, 5900);
INSERT INTO `tv_series_data` VALUES (5369478171, '周恩来在重庆', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/2/7354/53838a2512cbfe0179c3267c2f392d35.jpg', 'https://tv.2345.com/detail/7354.html', 10, '战争', 0, 5766);
INSERT INTO `tv_series_data` VALUES (5369711183, '走火', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/18/s54874.jpg', 'https://tv.2345.com/detail/54874.html', 9.8, '悬疑', 0, 6136);
INSERT INTO `tv_series_data` VALUES (5371285912, '秘密列车', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/1339/ac088592eb13410ae8cee64e80dbc2f9.jpg', 'https://tv.2345.com/detail/1339.html', 9.1, '军旅', 0, 7074);
INSERT INTO `tv_series_data` VALUES (5373266857, '解放大西南', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/13/s41999.jpg?1411874456', 'https://tv.2345.com/detail/41999.html', 9, '军旅', 0, 7678);
INSERT INTO `tv_series_data` VALUES (5373374958, '和平饭店DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/18/s54391.jpg', 'https://tv.2345.com/detail/54391.html', 9.6, '战争', 0, 6121);
INSERT INTO `tv_series_data` VALUES (5381035538, '军统枪口下的女人之潜伏', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/3/s9040.jpg', 'https://tv.2345.com/detail/9040.html', 8.8, '战争', 0, 6438);
INSERT INTO `tv_series_data` VALUES (5385248967, '红粉', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/394/3d60a334e3dabf352f300beb13c2ca15.jpg', 'https://tv.2345.com/detail/394.html', 9, '战争', 0, 3857);
INSERT INTO `tv_series_data` VALUES (5387721695, '养个孩子不容易', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/16/s50209.jpg', 'https://tv.2345.com/detail/50209.html', 8.3, '家庭', 0, 5053);
INSERT INTO `tv_series_data` VALUES (5395149962, '钦天异闻录', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/20/s61226.jpg', 'https://tv.2345.com/detail/61226.html', 7.7, '悬疑', 0, 3234);
INSERT INTO `tv_series_data` VALUES (5396201991, '离婚官司', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/1/4624/a62b870599f79fed6c606789d921ef62.jpg', 'https://tv.2345.com/detail/4624.html', 8.9, '家庭', 0, 3689);
INSERT INTO `tv_series_data` VALUES (5397520880, '北海风云', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/1986/fe9ceebc64b7e4abcac8750103e21c54.jpg', 'https://tv.2345.com/detail/1986.html', 8.8, '战争', 0, 6477);
INSERT INTO `tv_series_data` VALUES (5400694958, '末代皇妃', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/2/s8655.jpg?1362650220', 'https://tv.2345.com/detail/8655.html', 8.9, '家庭', 0, 3372);
INSERT INTO `tv_series_data` VALUES (5409002829, '小菊的春天', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/2/s8871.jpg', 'https://tv.2345.com/detail/8871.html', 8.9, '家庭', 0, 5242);
INSERT INTO `tv_series_data` VALUES (5409018246, '地下地上', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/17/88dfcd38c8bfb52efe36a31fe4e393e7.jpg', 'https://tv.2345.com/detail/17.html', 9.2, '战争', 0, 4068);
INSERT INTO `tv_series_data` VALUES (5412872007, '冰山上的来客', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/0/s1160.jpg?1484291866', 'https://tv.2345.com/detail/1160.html', 8.1, '军旅', 0, 6783);
INSERT INTO `tv_series_data` VALUES (5419292020, '卧槽者', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/16/s48810.jpg', 'https://tv.2345.com/detail/48810.html', 8.7, '家庭', 0, 3852);
INSERT INTO `tv_series_data` VALUES (5422036353, '我爷爷和奶奶的故事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/15/s45797.jpg?1425628333', 'https://tv.2345.com/detail/45797.html', 8, '战争', 0, 6666);
INSERT INTO `tv_series_data` VALUES (5422657630, '三十而已', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/18/s56981.jpg?1575524892', 'https://tv.2345.com/detail/56981.html', 8.9, '家庭', 0, 6208);
INSERT INTO `tv_series_data` VALUES (5431242010, '金婚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/298/4d64850512fe7d6c6443ce3eed5aa22b.jpg', 'https://tv.2345.com/detail/298.html', 9.2, '家庭', 0, 6128);
INSERT INTO `tv_series_data` VALUES (5432414459, '幸福生活在招手', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/2/s8835.jpg', 'https://tv.2345.com/detail/8835.html', 9.1, '家庭', 0, 6513);
INSERT INTO `tv_series_data` VALUES (5435335796, '血战奉阳城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/18/s55154.jpg', 'https://tv.2345.com/detail/55154.html', 9.2, '战争', 0, 6722);
INSERT INTO `tv_series_data` VALUES (5439246975, '领养', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/17/s53445.jpg', 'https://tv.2345.com/detail/53445.html', 8.2, '家庭', 0, 6958);
INSERT INTO `tv_series_data` VALUES (5456181814, '上海上海', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/0/s2290.jpg?1363167040', 'https://tv.2345.com/detail/2290.html', 8.7, '战争', 0, 3752);
INSERT INTO `tv_series_data` VALUES (5457534376, '五十玫瑰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/1389/a9a1230b04c4c11bd056907135629236.jpg', 'https://tv.2345.com/detail/1389.html', 9.2, '家庭', 0, 7717);
INSERT INTO `tv_series_data` VALUES (5468081981, '十宗罪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/16/s48258.jpg', 'https://tv.2345.com/detail/48258.html', 7.6, '悬疑', 0, 5664);
INSERT INTO `tv_series_data` VALUES (5468714756, '传奇之王', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/2/6730/ecbfb35ad37f4ab1bf88acd1fdfb6d06.jpg', 'https://tv.2345.com/detail/6730.html', 9.4, '战争', 0, 5681);
INSERT INTO `tv_series_data` VALUES (5469544180, '王保长新传', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/10/s30999.jpg', 'https://tv.2345.com/detail/30999.html', 9.4, '战争', 0, 4712);
INSERT INTO `tv_series_data` VALUES (5471270866, '承诺', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/377/34a040e6f44256968b28a34b172edb79.jpg', 'https://tv.2345.com/detail/377.html', 8.7, '悬疑', 0, 3246);
INSERT INTO `tv_series_data` VALUES (5474037320, '满仓进城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/14/s43252.jpg?1414996355', 'https://tv.2345.com/detail/43252.html', 8.1, '家庭', 0, 6338);
INSERT INTO `tv_series_data` VALUES (5479677807, '封神英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/14/s43172.jpg?1423728684', 'https://tv.2345.com/detail/43172.html', 8.9, '战争', 0, 3451);
INSERT INTO `tv_series_data` VALUES (5480811069, '无言的旅程', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/347/102f21d7ca7fa440d63681a79b9cb46c.jpg', 'https://tv.2345.com/detail/347.html', 8.7, '家庭', 0, 6787);
INSERT INTO `tv_series_data` VALUES (5481603564, '秘密图纸', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/59/2ed3929d1102e97310c803cd52fc11e3.jpg', 'https://tv.2345.com/detail/59.html', 9.3, '悬疑', 0, 3835);
INSERT INTO `tv_series_data` VALUES (5491728995, '白鹭谣', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/17/s53894.jpg', 'https://tv.2345.com/detail/53894.html', 8.7, '家庭', 0, 5573);
INSERT INTO `tv_series_data` VALUES (5508096014, '城北人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/839/s839.jpg', 'https://tv.2345.com/detail/839.html', 8.6, '家庭', 0, 7178);
INSERT INTO `tv_series_data` VALUES (5508186056, '咖啡女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/15/s47551.jpg', 'https://tv.2345.com/detail/47551.html', 8.7, '家庭', 0, 5805);
INSERT INTO `tv_series_data` VALUES (5518168930, '岳母的幸福生活', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/3/5.jpg', 'https://tv.2345.com/detail/12179.html', 8.9, '家庭', 0, 6413);
INSERT INTO `tv_series_data` VALUES (5518340552, '情殇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/355/07c016897fd6290a2549defd9abe91d2.jpg', 'https://tv.2345.com/detail/355.html', 8.8, '家庭', 0, 6181);
INSERT INTO `tv_series_data` VALUES (5518782860, '我是你的百搭', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/16/s48369.jpg?1459550365', 'https://tv.2345.com/detail/48369.html', 8.4, '家庭', 0, 7054);
INSERT INTO `tv_series_data` VALUES (5519484275, '零炮楼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/7/s22268.jpg?1369886542', 'https://tv.2345.com/detail/22268.html', 8.7, '战争', 0, 6361);
INSERT INTO `tv_series_data` VALUES (5520823926, '家常菜', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/802/eed57a8b492fe78fff1635b7b66fc108.jpg', 'https://tv.2345.com/detail/802.html', 9.7, '家庭', 0, 4035);
INSERT INTO `tv_series_data` VALUES (5524415208, '暗战在拂晓之前', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/19/s58991.jpg', 'https://tv.2345.com/detail/58991.html', 7.9, '战争', 0, 6421);
INSERT INTO `tv_series_data` VALUES (5529828130, '伤痛', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/20/s61207.jpg', 'https://tv.2345.com/detail/61207.html', 8.7, '家庭', 0, 3365);
INSERT INTO `tv_series_data` VALUES (5529935990, '烟雨斜阳', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/1497/8be1e6a3ebb26fa8026c43811e8a45e7.jpg', 'https://tv.2345.com/detail/1497.html', 9.8, '家庭', 0, 5237);
INSERT INTO `tv_series_data` VALUES (5530941962, '婆媳过招', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/2/s6210.jpg', 'https://tv.2345.com/detail/6210.html', 8.8, '家庭', 0, 7218);
INSERT INTO `tv_series_data` VALUES (5532265481, '盐娃娃', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/781/s781.jpg', 'https://tv.2345.com/detail/781.html', 6.1, '家庭', 0, 6221);
INSERT INTO `tv_series_data` VALUES (5536660733, '烈火警魂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/14/s42743.jpg', 'https://tv.2345.com/detail/42743.html', 7.6, '战争', 0, 3199);
INSERT INTO `tv_series_data` VALUES (5537834040, '老爸回家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/9/s27232.jpg?1384868134', 'https://tv.2345.com/detail/27232.html', 8.5, '家庭', 0, 4342);
INSERT INTO `tv_series_data` VALUES (5547845789, '岳母的幸福生活', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/3/5.jpg', 'https://tv.2345.com/detail/12179.html', 8.9, '伦理', 0, 3439);
INSERT INTO `tv_series_data` VALUES (5548498974, '嫁入豪门', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/6/s19238.jpg?1484805242', 'https://tv.2345.com/detail/19238.html', 8.9, '家庭', 0, 5124);
INSERT INTO `tv_series_data` VALUES (5548868622, '归途如虹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/2064/0542d3427cb432ec08a2be6ee6035e0d.jpg', 'https://tv.2345.com/detail/2064.html', 8.5, '战争', 0, 6359);
INSERT INTO `tv_series_data` VALUES (5550973529, '闺中密友', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/8/s25038.jpg?1398396496', 'https://tv.2345.com/detail/25038.html', 8.5, '家庭', 0, 6055);
INSERT INTO `tv_series_data` VALUES (5557690497, '温州两家人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/15/s46011.jpg?1448589880', 'https://tv.2345.com/detail/46011.html', 8.5, '家庭', 0, 6145);
INSERT INTO `tv_series_data` VALUES (5560564749, '酷爸俏妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/15/s45787.jpg?1425622874', 'https://tv.2345.com/detail/45787.html', 8.3, '家庭', 0, 3201);
INSERT INTO `tv_series_data` VALUES (5562277388, '大路朝天', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/775/s775.jpg', 'https://tv.2345.com/detail/775.html', 8.8, '家庭', 0, 5982);
INSERT INTO `tv_series_data` VALUES (5563437767, '田教授家的28个保姆', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/1138/078453be21d3620bf3e1656ead830156.jpg', 'https://tv.2345.com/detail/1138.html', 9, '家庭', 0, 4824);
INSERT INTO `tv_series_data` VALUES (5563844139, '狼烟北平', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/53/6510a30ec786aae2ed74f27993291fc1.jpg', 'https://tv.2345.com/detail/53.html', 9.4, '战争', 0, 4654);
INSERT INTO `tv_series_data` VALUES (5564237987, '迫在眉睫', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/15/s46781.jpg?1438846968', 'https://tv.2345.com/detail/46781.html', 8.4, '战争', 0, 4571);
INSERT INTO `tv_series_data` VALUES (5564721132, '前妻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/1/s3734.jpg?1410419562', 'https://tv.2345.com/detail/3734.html', 8.8, '伦理', 0, 7882);
INSERT INTO `tv_series_data` VALUES (5567912125, '如此婚姻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/2/s6977.jpg?1410419761', 'https://tv.2345.com/detail/6977.html', 9.2, '家庭', 0, 3252);
INSERT INTO `tv_series_data` VALUES (5568916698, '中国1945', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/1/s4462.jpg', 'https://tv.2345.com/detail/4462.html', 7.8, '军旅', 0, 3942);
INSERT INTO `tv_series_data` VALUES (5572138418, '昆虫赞歌', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/15/s45447.jpg', 'https://tv.2345.com/detail/45447.html', 7.5, '其他', 0, 4907);
INSERT INTO `tv_series_data` VALUES (5575914776, '《夏洛特烦恼》爆笑同人小剧场', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/17/s52643.jpg', 'https://tv.2345.com/detail/52643.html', 8.8, '家庭', 0, 3941);
INSERT INTO `tv_series_data` VALUES (5576378078, '回马枪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/19/s58723.jpg', 'https://tv.2345.com/detail/58723.html', 8.7, '战争', 0, 5881);
INSERT INTO `tv_series_data` VALUES (5576910171, '迷雾重重', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/562/4e29c3ff22fe2360e0e097f745642bad.jpg', 'https://tv.2345.com/detail/562.html', 9.2, '战争', 0, 6512);
INSERT INTO `tv_series_data` VALUES (5580185032, '黑枪背后', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/512/s512.jpg', 'https://tv.2345.com/detail/512.html', 6.9, '战争', 0, 3484);
INSERT INTO `tv_series_data` VALUES (5584966273, '四世同堂85版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/2/s6794.jpg', 'https://tv.2345.com/detail/6794.html', 8.6, '家庭', 0, 3566);
INSERT INTO `tv_series_data` VALUES (5585840185, '贫富人生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/1/4305/4ab20e0b90a945d7f8cb561ef4d1386e.jpg', 'https://tv.2345.com/detail/4305.html', 9.1, '家庭', 0, 4089);
INSERT INTO `tv_series_data` VALUES (5589680860, '秋海棠', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/1363/d8d2c3225699635ffc7bb5c76c42bdc6.jpg', 'https://tv.2345.com/detail/1363.html', 9.2, '家庭', 0, 3238);
INSERT INTO `tv_series_data` VALUES (5590238959, '铁血使命片花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/3/10621/3bac7b56a960b8602c67991dce4696e6.jpg', 'https://tv.2345.com/detail/10621.html', 6.5, '战争', 0, 5559);
INSERT INTO `tv_series_data` VALUES (5590550829, '五月的鲜花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/2757/a9df97c33b77c413857f5bdb1880f767.jpg', 'https://tv.2345.com/detail/2757.html', 8.5, '战争', 0, 6139);
INSERT INTO `tv_series_data` VALUES (5591854970, '中年计划', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/3/9701/dbd1b92561a6d8163cabb34ef53493ad.jpg', 'https://tv.2345.com/detail/9701.html', 9.3, '家庭', 0, 4234);
INSERT INTO `tv_series_data` VALUES (5593908789, '正者无敌', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/5/c.jpg', 'https://tv.2345.com/detail/11817.html', 8.5, '战争', 0, 4420);
INSERT INTO `tv_series_data` VALUES (5597712737, '激情燃烧的岁月3', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/1608/c75ec07910f2c429b4bd1484b262042a.jpg', 'https://tv.2345.com/detail/1608.html', 8.8, '军旅', 0, 5078);
INSERT INTO `tv_series_data` VALUES (5601827703, '枪花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/6/s20977.jpg?1366090756', 'https://tv.2345.com/detail/20977.html', 8.9, '战争', 0, 4474);
INSERT INTO `tv_series_data` VALUES (5603176758, '西藏秘密', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/c/3.jpg', 'https://tv.2345.com/detail/18370.html', 9.8, '家庭', 0, 7317);
INSERT INTO `tv_series_data` VALUES (5604274920, '闯关东DVD', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/17/s53862.jpg', 'https://tv.2345.com/detail/53862.html', 7.3, '伦理', 0, 3769);
INSERT INTO `tv_series_data` VALUES (5605792091, '孩奴', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/8/s25480.jpg?1380424785', 'https://tv.2345.com/detail/25480.html', 8.6, '伦理', 0, 3044);
INSERT INTO `tv_series_data` VALUES (5605899910, '火线英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/11/s33225.jpg?1435800656', 'https://tv.2345.com/detail/33225.html', 8.5, '军旅', 0, 3740);
INSERT INTO `tv_series_data` VALUES (5610292224, '恶魔少爷别吻我', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/16/s49568.jpg?1483932407', 'https://tv.2345.com/detail/49568.html', 8.5, '家庭', 0, 4755);
INSERT INTO `tv_series_data` VALUES (5615044452, '成家立业', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/1452/c889d5b4e5137f21133fe5d76cd5e40c.jpg', 'https://tv.2345.com/detail/1452.html', 9, '家庭', 0, 6267);
INSERT INTO `tv_series_data` VALUES (5623042037, '电视剧《解放》', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/18/s56483.jpg', 'https://tv.2345.com/detail/56483.html', 7.7, '其他', 0, 5921);
INSERT INTO `tv_series_data` VALUES (5623232383, '妈妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/13/s40346.jpg?1407066686', 'https://tv.2345.com/detail/40346.html', 8.4, '伦理', 0, 6641);
INSERT INTO `tv_series_data` VALUES (5623730988, '错婚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/5/s15141.jpg?1423184667', 'https://tv.2345.com/detail/15141.html', 8.4, '家庭', 0, 5975);
INSERT INTO `tv_series_data` VALUES (5628558762, '洪武大案', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/2/6765/3d4060aac3594c9f48023b01c581c7ed.jpg', 'https://tv.2345.com/detail/6765.html', 8.3, '悬疑', 0, 5774);
INSERT INTO `tv_series_data` VALUES (5631466275, '薛定谔的猫', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/17/s52052.jpg', 'https://tv.2345.com/detail/52052.html', 7.9, '其他', 0, 3628);
INSERT INTO `tv_series_data` VALUES (5632808261, '家事无理', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/2/6886/ecd5fad64c05014c3a3a729c44a7b020.jpg', 'https://tv.2345.com/detail/6886.html', 8.7, '家庭', 0, 6570);
INSERT INTO `tv_series_data` VALUES (5632900015, '英雄泪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/0/s794.jpg', 'https://tv.2345.com/detail/794.html', 8.8, '家庭', 0, 7436);
INSERT INTO `tv_series_data` VALUES (5636851142, '改变世界的飞行器', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/16/s49899.jpg', 'https://tv.2345.com/detail/49899.html', 8.8, '战争', 0, 4322);
INSERT INTO `tv_series_data` VALUES (5638247780, '保镖小姐与初恋先生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/20/s61431.jpg', 'https://tv.2345.com/detail/61431.html', 7.4, '悬疑', 0, 3078);
INSERT INTO `tv_series_data` VALUES (5639111265, '桃花劫', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/6/7.jpg', 'https://tv.2345.com/detail/15226.html', 8.7, '家庭', 0, 3282);
INSERT INTO `tv_series_data` VALUES (5639311067, '南侨机工英雄传', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/15/s46940.jpg?1441415010', 'https://tv.2345.com/detail/46940.html', 8.5, '战争', 0, 7659);
INSERT INTO `tv_series_data` VALUES (5642026133, '我爱我夫我爱子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/1/4771/a50f2f5851b076f01be63a628fb691ec.jpg', 'https://tv.2345.com/detail/4771.html', 10, '家庭', 0, 4963);
INSERT INTO `tv_series_data` VALUES (5644543463, '超人马大姐', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/2424/e22480f5572f114488a96b50f6e4bad2.jpg', 'https://tv.2345.com/detail/2424.html', 9.5, '家庭', 0, 6789);
INSERT INTO `tv_series_data` VALUES (5645738728, '生活大爆炸第十二季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/17/s52902.jpg', 'https://tv.2345.com/detail/52902.html', 8.3, '家庭', 0, 5213);
INSERT INTO `tv_series_data` VALUES (5647560082, '哈勃望远镜', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/15/s45463.jpg', 'https://tv.2345.com/detail/45463.html', 7.5, '其他', 0, 3123);
INSERT INTO `tv_series_data` VALUES (5658667839, '我爱我家2圆圆的故事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/2/s6458.jpg?1364283437', 'https://tv.2345.com/detail/6458.html', 8.6, '家庭', 0, 7229);
INSERT INTO `tv_series_data` VALUES (5660542276, '兄弟厨子兵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/19/s58835.jpg', 'https://tv.2345.com/detail/58835.html', 8.7, '战争', 0, 7785);
INSERT INTO `tv_series_data` VALUES (5661370781, '十指连心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/8/8.jpg', 'https://tv.2345.com/detail/15484.html', 8.8, '家庭', 0, 3967);
INSERT INTO `tv_series_data` VALUES (5662192901, '青春期撞上更年期2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/6/s19899.jpg?1365997594', 'https://tv.2345.com/detail/19899.html', 9.2, '家庭', 0, 6706);
INSERT INTO `tv_series_data` VALUES (5663207365, '反黑使命2沉默', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/3/s9729.jpg', 'https://tv.2345.com/detail/9729.html', 8.8, '悬疑', 0, 5638);
INSERT INTO `tv_series_data` VALUES (5664365580, '爱的保镖', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/11/s33245.jpg?1408691917', 'https://tv.2345.com/detail/33245.html', 8.4, '家庭', 0, 3218);
INSERT INTO `tv_series_data` VALUES (5664938623, '法律至上2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/20/s60948.jpg', 'https://tv.2345.com/detail/60948.html', 9.8, '家庭', 0, 7002);
INSERT INTO `tv_series_data` VALUES (5668205955, '高校教师', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/1/s3265.jpg?1388282056', 'https://tv.2345.com/detail/3265.html', 8.6, '伦理', 0, 5452);
INSERT INTO `tv_series_data` VALUES (5669639999, '亲情协议', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/15/s46477.jpg', 'https://tv.2345.com/detail/46477.html', 8.5, '家庭', 0, 3336);
INSERT INTO `tv_series_data` VALUES (5670888112, '永远的田野', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/820/ba5d07cc1bd4fd8bb0928e9fda93affc.jpg', 'https://tv.2345.com/detail/820.html', 8.7, '家庭', 0, 3375);
INSERT INTO `tv_series_data` VALUES (5671113241, '王牌部队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/20/s61279.jpg', 'https://tv.2345.com/detail/61279.html', 9.7, '战争', 0, 3229);
INSERT INTO `tv_series_data` VALUES (5671271696, '中国故事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/3/s9652.jpg?1466488664', 'https://tv.2345.com/detail/9652.html', 9.4, '伦理', 0, 6830);
INSERT INTO `tv_series_data` VALUES (5671436052, '参工传奇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/16/s48836.jpg?1465189046', 'https://tv.2345.com/detail/48836.html', 8.3, '战争', 0, 4588);
INSERT INTO `tv_series_data` VALUES (5673759508, '南下南下', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/390/c929cdbc384bc7992ab59763e0003bff.jpg', 'https://tv.2345.com/detail/390.html', 9, '战争', 0, 6518);
INSERT INTO `tv_series_data` VALUES (5680017111, '原谅', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/1/4511/acbc559d9cbf451c7b423f38247cd38d.jpg', 'https://tv.2345.com/detail/4511.html', 8.7, '家庭', 0, 7645);
INSERT INTO `tv_series_data` VALUES (5680057639, '我的父亲是板凳', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/814/8996b3c2ae7725ab658475527d05274f.jpg', 'https://tv.2345.com/detail/814.html', 8.8, '军旅', 0, 6285);
INSERT INTO `tv_series_data` VALUES (5683309309, '我是红军', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/16/s50354.jpg?1476430884', 'https://tv.2345.com/detail/50354.html', 8.6, '战争', 0, 4977);
INSERT INTO `tv_series_data` VALUES (5685410535, '中国往事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/234/aae5698097f72dd7a96ea31353651264.jpg', 'https://tv.2345.com/detail/234.html', 9.4, '家庭', 0, 6032);
INSERT INTO `tv_series_data` VALUES (5686651551, '海啸电视剧', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/18/s56493.jpg', 'https://tv.2345.com/detail/56493.html', 7.6, '战争', 0, 7096);
INSERT INTO `tv_series_data` VALUES (5692719586, '铁面御史', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/18/s54929.jpg', 'https://tv.2345.com/detail/54929.html', 9.7, '悬疑', 0, 4757);
INSERT INTO `tv_series_data` VALUES (5693601863, '跟我回家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/14/s43670.jpg?1416294072', 'https://tv.2345.com/detail/43670.html', 8.8, '家庭', 0, 4980);
INSERT INTO `tv_series_data` VALUES (5695905956, '过界', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/3/s10869.jpg?1510536528', 'https://tv.2345.com/detail/10869.html', 8.9, '战争', 0, 7189);
INSERT INTO `tv_series_data` VALUES (5696593169, '东方母亲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/1/4574/7c924dd052b796ff29511d8aa63d4c1f.jpg', 'https://tv.2345.com/detail/4574.html', 10, '伦理', 0, 5425);
INSERT INTO `tv_series_data` VALUES (5698905274, '笑红颜', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/2/8765/0bbee4d8fab6d41f33505ae5f68be63c.jpg', 'https://tv.2345.com/detail/8765.html', 8.9, '家庭', 0, 6809);
INSERT INTO `tv_series_data` VALUES (5698929806, '妻子的秘密卫视版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/10/s32173.jpg?1395105985', 'https://tv.2345.com/detail/32173.html', 8.8, '家庭', 0, 6575);
INSERT INTO `tv_series_data` VALUES (5704198736, '爱人同志', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/17/s53739.jpg?1506328325', 'https://tv.2345.com/detail/53739.html', 8.1, '战争', 0, 4386);
INSERT INTO `tv_series_data` VALUES (5712258068, '女工', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/1/3490/a857603d87ea855710c21f63b8e22bef.jpg', 'https://tv.2345.com/detail/3490.html', 9.3, '家庭', 0, 7542);
INSERT INTO `tv_series_data` VALUES (5724362878, '春桃的战争', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/161/4ac7c6dc2edc72f25b11cdd477586dff.jpg', 'https://tv.2345.com/detail/161.html', 8.9, '战争', 0, 5564);
INSERT INTO `tv_series_data` VALUES (5724403385, '破冰行动', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/18/s56043.jpg', 'https://tv.2345.com/detail/56043.html', 9.8, '悬疑', 0, 4796);
INSERT INTO `tv_series_data` VALUES (5735840462, '光荣大地', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/2/s6721.jpg', 'https://tv.2345.com/detail/6721.html', 9.4, '战争', 0, 6357);
INSERT INTO `tv_series_data` VALUES (5736555284, '明星危情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/153/992540fe8468cfb58dc1083958281e3a.jpg', 'https://tv.2345.com/detail/153.html', 8.7, '伦理', 0, 5490);
INSERT INTO `tv_series_data` VALUES (5739205236, '女囚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/226/e876d61d7693f1041b59ca312f9357f2.jpg', 'https://tv.2345.com/detail/226.html', 8.8, '伦理', 0, 4422);
INSERT INTO `tv_series_data` VALUES (5746447961, '尖峰火力', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/18/s56245.jpg', 'https://tv.2345.com/detail/56245.html', 9.8, '战争', 0, 4327);
INSERT INTO `tv_series_data` VALUES (5748156002, '三十而立', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/f/a.jpg', 'https://tv.2345.com/detail/16103.html', 8.8, '家庭', 0, 7202);
INSERT INTO `tv_series_data` VALUES (5756151638, '青春无极限', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/11/s35431.jpg?1399942868', 'https://tv.2345.com/detail/35431.html', 8.4, '家庭', 0, 7751);
INSERT INTO `tv_series_data` VALUES (5757624194, '关中秘事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/2197/326252c99db2f835cf5da245eaaa7826.jpg', 'https://tv.2345.com/detail/2197.html', 9.5, '战争', 0, 7971);
INSERT INTO `tv_series_data` VALUES (5758529120, '瑞莲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/7/s21963.jpg?1410420732', 'https://tv.2345.com/detail/21963.html', 8.8, '家庭', 0, 7624);
INSERT INTO `tv_series_data` VALUES (5759405474, '新渔岛怒潮', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/15/s47245.jpg?1445224758', 'https://tv.2345.com/detail/47245.html', 8.4, '战争', 0, 4066);
INSERT INTO `tv_series_data` VALUES (5760288984, '一代枭雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/9/s28034.jpg?1388718755', 'https://tv.2345.com/detail/28034.html', 8.8, '战争', 0, 5199);
INSERT INTO `tv_series_data` VALUES (5764749551, '女人心事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/2/8639/70a989c128f9d477032da5fd249ce3ea.jpg', 'https://tv.2345.com/detail/8639.html', 9.1, '家庭', 0, 4933);
INSERT INTO `tv_series_data` VALUES (5773897392, '孤军英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/c/0.jpg', 'https://tv.2345.com/detail/15968.html', 8.6, '战争', 0, 4918);
INSERT INTO `tv_series_data` VALUES (5776227231, '青春突击', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/18/s54177.jpg', 'https://tv.2345.com/detail/54177.html', 8.8, '战争', 0, 7022);
INSERT INTO `tv_series_data` VALUES (5777883125, '洪流', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/14/s44029.jpg?1416794927', 'https://tv.2345.com/detail/44029.html', 8.3, '战争', 0, 4610);
INSERT INTO `tv_series_data` VALUES (5778231627, '我们的青春期', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/18/s54949.jpg', 'https://tv.2345.com/detail/54949.html', 8.2, '家庭', 0, 6071);
INSERT INTO `tv_series_data` VALUES (5779117861, '秋月', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/16/s50205.jpg', 'https://tv.2345.com/detail/50205.html', 8.8, '家庭', 0, 5889);
INSERT INTO `tv_series_data` VALUES (5779489269, '因为有你', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/2912/164735d97a91086f7ac4a4f757b819cb.jpg', 'https://tv.2345.com/detail/2912.html', 9.2, '家庭', 0, 4917);
INSERT INTO `tv_series_data` VALUES (5780866073, '男人的天堂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/1279/c5cf259e1cf54ca80cd3c4328129a815.jpg', 'https://tv.2345.com/detail/1279.html', 9.2, '战争', 0, 6922);
INSERT INTO `tv_series_data` VALUES (5782076161, '父亲的战争', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/126/411110fcaaf3c2de86b196654e871c4e.jpg', 'https://tv.2345.com/detail/126.html', 9, '军旅', 0, 5924);
INSERT INTO `tv_series_data` VALUES (5783278216, '米脂婆姨', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/18/s55884.jpg', 'https://tv.2345.com/detail/55884.html', 8.8, '战争', 0, 6734);
INSERT INTO `tv_series_data` VALUES (5785890726, '心理罪2三集版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/17/s52931.jpg', 'https://tv.2345.com/detail/52931.html', 8, '家庭', 0, 4343);
INSERT INTO `tv_series_data` VALUES (5785989940, '欲望之城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/18/s55114.jpg?1534388680', 'https://tv.2345.com/detail/55114.html', 8.8, '家庭', 0, 4342);
INSERT INTO `tv_series_data` VALUES (5788901041, '真爱一生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/2/s7480.jpg', 'https://tv.2345.com/detail/7480.html', 8.8, '伦理', 0, 3730);
INSERT INTO `tv_series_data` VALUES (5790867283, '老邪爆笑吐槽系列', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/18/s56769.jpg', 'https://tv.2345.com/detail/56769.html', 8.4, '其他', 0, 6100);
INSERT INTO `tv_series_data` VALUES (5798272540, '我这一辈子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/1703/673ebd779410e4d7867e35a2de96aa1f.jpg', 'https://tv.2345.com/detail/1703.html', 9.6, '伦理', 0, 5890);
INSERT INTO `tv_series_data` VALUES (5799579641, '娘家的故事下', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/17/s53526.jpg', 'https://tv.2345.com/detail/53526.html', 8.5, '家庭', 0, 4795);
INSERT INTO `tv_series_data` VALUES (5802234463, '穷妈妈富妈妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/2/6033/2ca5d25102c09c6b2271b805939cdcf2.jpg', 'https://tv.2345.com/detail/6033.html', 8.9, '伦理', 0, 5903);
INSERT INTO `tv_series_data` VALUES (5803392896, '暗黑者', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/11/s34222.jpg?1402472774', 'https://tv.2345.com/detail/34222.html', 8.5, '悬疑', 0, 5755);
INSERT INTO `tv_series_data` VALUES (5805694128, '解放', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/83/76a63571d5622baa63f0badd59d62606.jpg', 'https://tv.2345.com/detail/83.html', 9.2, '战争', 0, 7117);
INSERT INTO `tv_series_data` VALUES (5809987926, '夜凛神探第一季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/19/s59177.jpg', 'https://tv.2345.com/detail/59177.html', 9.7, '悬疑', 0, 5349);
INSERT INTO `tv_series_data` VALUES (5810753121, '先结婚后恋爱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/c/9.jpg', 'https://tv.2345.com/detail/16568.html', 8.8, '家庭', 0, 5805);
INSERT INTO `tv_series_data` VALUES (5815988097, '红绒花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/1214/f4cddc2ae5321a9868261d2dd2a85986.jpg', 'https://tv.2345.com/detail/1214.html', 8.2, '家庭', 0, 6728);
INSERT INTO `tv_series_data` VALUES (5818957688, '天堑1949', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/7/s21878.jpg?1410420714', 'https://tv.2345.com/detail/21878.html', 8.8, '战争', 0, 3535);
INSERT INTO `tv_series_data` VALUES (5823231477, '秘密图纸', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/59/2ed3929d1102e97310c803cd52fc11e3.jpg', 'https://tv.2345.com/detail/59.html', 9.3, '战争', 0, 3663);
INSERT INTO `tv_series_data` VALUES (5825103092, '后妈的春天', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/18/s54538.jpg', 'https://tv.2345.com/detail/54538.html', 9.2, '家庭', 0, 7137);
INSERT INTO `tv_series_data` VALUES (5827094779, '断刺', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/816/13068395f451763f3e178cc45981d98a.jpg', 'https://tv.2345.com/detail/816.html', 9.2, '军旅', 0, 7891);
INSERT INTO `tv_series_data` VALUES (5830212275, '这个王妃有点萌', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/20/s61149.jpg', 'https://tv.2345.com/detail/61149.html', 7.5, '悬疑', 0, 7239);
INSERT INTO `tv_series_data` VALUES (5843886162, '热血勇士', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/16/s49470.jpg', 'https://tv.2345.com/detail/49470.html', 9.1, '战争', 0, 5658);
INSERT INTO `tv_series_data` VALUES (5850103158, '爱在战火纷飞时', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/1/3150/2f7c793dad00185ca306945702ef48d4.jpg', 'https://tv.2345.com/detail/3150.html', 9.1, '家庭', 0, 6793);
INSERT INTO `tv_series_data` VALUES (5852774135, '《黄金密码》', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/17/s52117.jpg', 'https://tv.2345.com/detail/52117.html', 8.1, '军旅', 0, 6130);
INSERT INTO `tv_series_data` VALUES (5857613992, '誓言贾乃亮版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/18/s54776.jpg', 'https://tv.2345.com/detail/54776.html', 8.8, '战争', 0, 7737);
INSERT INTO `tv_series_data` VALUES (5863546884, '手枪队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/19/s57777.jpg', 'https://tv.2345.com/detail/57777.html', 8.8, '战争', 0, 5354);
INSERT INTO `tv_series_data` VALUES (5864963904, '风声', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/18/s55009.jpg?1531120774', 'https://tv.2345.com/detail/55009.html', 9.2, '悬疑', 0, 6173);
INSERT INTO `tv_series_data` VALUES (5870499483, '穷孩子富孩子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/449904/1349712656/561ee36449ca62a017c6ce3cacf697d4.jpg', 'https://tv.2345.com/detail/15656.html', 9.4, '家庭', 0, 7717);
INSERT INTO `tv_series_data` VALUES (5870512420, '媳妇的美好宣言TV版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/5/s16552.jpg?1407407144', 'https://tv.2345.com/detail/16552.html', 8.9, '家庭', 0, 5339);
INSERT INTO `tv_series_data` VALUES (5870560101, '红色天网', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/18/s56853.jpg', 'https://tv.2345.com/detail/56853.html', 7.7, '悬疑', 0, 5142);
INSERT INTO `tv_series_data` VALUES (5872783315, '艺妓之变', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/0/s2274.jpg?1381242764', 'https://tv.2345.com/detail/2274.html', 8.3, '战争', 0, 6210);
INSERT INTO `tv_series_data` VALUES (5873602445, '誓言无声', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/3/s9688.jpg', 'https://tv.2345.com/detail/9688.html', 8.8, '悬疑', 0, 4482);
INSERT INTO `tv_series_data` VALUES (5878807711, '锋刃DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/19/s57661.jpg', 'https://tv.2345.com/detail/57661.html', 7.2, '战争', 0, 3183);
INSERT INTO `tv_series_data` VALUES (5882877605, '飞哥大英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/11/s35175.jpg?1398840432', 'https://tv.2345.com/detail/35175.html', 8.3, '战争', 0, 3943);
INSERT INTO `tv_series_data` VALUES (5883240111, '热血商人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/1/s5154.jpg', 'https://tv.2345.com/detail/5154.html', 8, '家庭', 0, 7282);
INSERT INTO `tv_series_data` VALUES (5895804812, '人间烟火', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/7/2219.jpg', 'https://tv.2345.com/detail/2219.html', 8.8, '伦理', 0, 7512);
INSERT INTO `tv_series_data` VALUES (5897128624, '美丽的田野', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/18/s56455.jpg', 'https://tv.2345.com/detail/56455.html', 8.7, '伦理', 0, 4133);
INSERT INTO `tv_series_data` VALUES (5909179165, '领袖', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/14/s42484.jpg', 'https://tv.2345.com/detail/42484.html', 8.5, '战争', 0, 6915);
INSERT INTO `tv_series_data` VALUES (5912100280, '房奴', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/1348/7f4a1cb6c0b2dc9ca476b130c1e2cb72.jpg', 'https://tv.2345.com/detail/1348.html', 9, '家庭', 0, 3990);
INSERT INTO `tv_series_data` VALUES (5914016666, '钻石豪门', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/1178/e1d520a23414c7735d5f13adfb4d9c32.jpg', 'https://tv.2345.com/detail/1178.html', 8.3, '家庭', 0, 6659);
INSERT INTO `tv_series_data` VALUES (5914615786, '亮剑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/986/9884387b284b5cf012adf28c06b7de40.jpg', 'https://tv.2345.com/detail/986.html', 9.7, '战争', 0, 6030);
INSERT INTO `tv_series_data` VALUES (5916692254, '像火花像蝴蝶', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/7/s22568.jpg?1371449582', 'https://tv.2345.com/detail/22568.html', 8.7, '伦理', 0, 6094);
INSERT INTO `tv_series_data` VALUES (5917463456, '城事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/7/s21896.jpg?1410420719', 'https://tv.2345.com/detail/21896.html', 8.7, '家庭', 0, 4472);
INSERT INTO `tv_series_data` VALUES (5917753086, '对攻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/548/058b371a38fe2931b4ae3c379f0511ac.jpg', 'https://tv.2345.com/detail/548.html', 10, '悬疑', 0, 7184);
INSERT INTO `tv_series_data` VALUES (5918716149, '复仇第4季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/14/s42102.jpg', 'https://tv.2345.com/detail/42102.html', 8.3, '家庭', 0, 4119);
INSERT INTO `tv_series_data` VALUES (5918730965, '乔家的儿女', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/20/s60803.jpg', 'https://tv.2345.com/detail/60803.html', 9.8, '家庭', 0, 5269);
INSERT INTO `tv_series_data` VALUES (5923070933, '老家门口唱大戏', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/8/s25765.jpg?1380250814', 'https://tv.2345.com/detail/25765.html', 8.1, '伦理', 0, 3583);
INSERT INTO `tv_series_data` VALUES (5925135070, '奋进的旋律', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/19/s57207.jpg', 'https://tv.2345.com/detail/57207.html', 8.9, '家庭', 0, 3237);
INSERT INTO `tv_series_data` VALUES (5933246484, '花女的抗战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/18/s55732.jpg', 'https://tv.2345.com/detail/55732.html', 8.8, '战争', 0, 3360);
INSERT INTO `tv_series_data` VALUES (5934147371, '秘密王学兵版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/20/s61317.jpg', 'https://tv.2345.com/detail/61317.html', 9.8, '家庭', 0, 5846);
INSERT INTO `tv_series_data` VALUES (5935329709, '我们的父亲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/2/6903/ca406090ae58ba478478e67ad6e222b5.jpg', 'https://tv.2345.com/detail/6903.html', 10, '家庭', 0, 7103);
INSERT INTO `tv_series_data` VALUES (5936855117, '狼烟遍地', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/9/s29602.jpg?1392337978', 'https://tv.2345.com/detail/29602.html', 8.5, '战争', 0, 4668);
INSERT INTO `tv_series_data` VALUES (5941785904, '来势凶猛', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/15/s45796.jpg?1425628153', 'https://tv.2345.com/detail/45796.html', 8.2, '战争', 0, 7808);
INSERT INTO `tv_series_data` VALUES (5941968729, '女子军魂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/2/s8919.jpg', 'https://tv.2345.com/detail/8919.html', 9.2, '战争', 0, 4655);
INSERT INTO `tv_series_data` VALUES (5944310655, '婆婆媳妇小姑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/1165/60a9a375376829c4ea1635c70c967b5b.jpg', 'https://tv.2345.com/detail/1165.html', 9.3, '家庭', 0, 7323);
INSERT INTO `tv_series_data` VALUES (5946074768, '幸福还有多远', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/1198/03deb370d3e0d0bd09fc2467c53b3df2.jpg', 'https://tv.2345.com/detail/1198.html', 9.3, '伦理', 0, 4836);
INSERT INTO `tv_series_data` VALUES (5947017897, '饭团之家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/641/9c7c2cadbcc6d0be52327a41d29b21c6.jpg', 'https://tv.2345.com/detail/641.html', 6.8, '伦理', 0, 6237);
INSERT INTO `tv_series_data` VALUES (5949174203, '死去活来', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/1/3028/b4edf7b0e8a445e4fdc8b6dec1d778f9.jpg', 'https://tv.2345.com/detail/3028.html', 9.1, '伦理', 0, 5772);
INSERT INTO `tv_series_data` VALUES (5949555212, '四十九日祭', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/9/s27996.jpg?1418870493', 'https://tv.2345.com/detail/27996.html', 8.6, '战争', 0, 3516);
INSERT INTO `tv_series_data` VALUES (5950416739, '雷霆战将TV剪辑版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/19/s58504.jpg', 'https://tv.2345.com/detail/58504.html', 8.8, '战争', 0, 3893);
INSERT INTO `tv_series_data` VALUES (5953062682, '传说中的故乡', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/1488/8ea7a03e49033a7c0a355ecf85d4f9f8.jpg', 'https://tv.2345.com/detail/1488.html', 9.4, '悬疑', 0, 5335);
INSERT INTO `tv_series_data` VALUES (5957617335, '一锁五十年', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/75/e8f867055a902eabb4d9ca48d054f670.jpg', 'https://tv.2345.com/detail/75.html', 9, '家庭', 0, 7476);
INSERT INTO `tv_series_data` VALUES (5958226842, '九死一生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/10/s32742.jpg?1403921089', 'https://tv.2345.com/detail/32742.html', 8.5, '战争', 0, 7458);
INSERT INTO `tv_series_data` VALUES (5963248472, '夜隼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/2/s6752.jpg', 'https://tv.2345.com/detail/6752.html', 9.2, '战争', 0, 6517);
INSERT INTO `tv_series_data` VALUES (5966288608, '徽娘宛心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/1837/90f079944862092c200832edf6644359.jpg', 'https://tv.2345.com/detail/1837.html', 9.5, '家庭', 0, 3924);
INSERT INTO `tv_series_data` VALUES (5972403472, '地道英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/754/97c13237732c5ce0b24696e30fce3074.jpg', 'https://tv.2345.com/detail/754.html', 9, '战争', 0, 6521);
INSERT INTO `tv_series_data` VALUES (5974109460, '壮丁也是兵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/15/s46381.jpg?1433210296', 'https://tv.2345.com/detail/46381.html', 8.4, '战争', 0, 3437);
INSERT INTO `tv_series_data` VALUES (5980079489, '江姐', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/2101/0817e6647461093d36ee6e15a8230317.jpg', 'https://tv.2345.com/detail/2101.html', 9.1, '战争', 0, 7918);
INSERT INTO `tv_series_data` VALUES (5981851020, '《劝和小组》', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/17/s52121.jpg', 'https://tv.2345.com/detail/52121.html', 7.7, '其他', 0, 6829);
INSERT INTO `tv_series_data` VALUES (5983021697, '罗马', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/15/s46091.jpg', 'https://tv.2345.com/detail/46091.html', 8.3, '战争', 0, 6841);
INSERT INTO `tv_series_data` VALUES (5983641527, '军人机密', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/1200/14c32d46e1c030962d6b96c25e3ace29.jpg', 'https://tv.2345.com/detail/1200.html', 9.4, '战争', 0, 4056);
INSERT INTO `tv_series_data` VALUES (5983896005, '血色迷雾', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/1336/87165df7bfee39118f53a29592be12ef.jpg', 'https://tv.2345.com/detail/1336.html', 8.7, '悬疑', 0, 3959);
INSERT INTO `tv_series_data` VALUES (5984353993, '婚内外', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/2198/fe38fc4304d2d64ec079aee448fd3bd5.jpg', 'https://tv.2345.com/detail/17348.html', 9.2, '伦理', 0, 3898);
INSERT INTO `tv_series_data` VALUES (5985525208, '亲爱的你在哪里', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/19/s57923.png', 'https://tv.2345.com/detail/57923.html', 8.9, '家庭', 0, 6210);
INSERT INTO `tv_series_data` VALUES (5988604600, '婚姻时差', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/15/s46187.jpg?1498719871', 'https://tv.2345.com/detail/46187.html', 8.4, '家庭', 0, 3605);
INSERT INTO `tv_series_data` VALUES (5990245032, '爸爸别走', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/1779/9742e48950da5c8498dd3460e266edc8.jpg', 'https://tv.2345.com/detail/1779.html', 8.8, '家庭', 0, 3583);
INSERT INTO `tv_series_data` VALUES (5993249892, '婚前协议', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/10/s32695.jpg?1428044259', 'https://tv.2345.com/detail/32695.html', 8.4, '家庭', 0, 4773);
INSERT INTO `tv_series_data` VALUES (5993326057, '保密局的枪声', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/121/4693bfe7a79b8556612af4cc8b6b3ea1.jpg', 'https://tv.2345.com/detail/121.html', 9.2, '战争', 0, 4376);
INSERT INTO `tv_series_data` VALUES (5995132606, '百万新娘韩语版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/1/s5527.jpg', 'https://tv.2345.com/detail/5527.html', 8.9, '家庭', 0, 5853);
INSERT INTO `tv_series_data` VALUES (5996667835, '上海王', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/296/5051f9c86dd3a80dd42bf7830b52c742.jpg', 'https://tv.2345.com/detail/296.html', 9.8, '悬疑', 0, 3720);
INSERT INTO `tv_series_data` VALUES (6002128521, '我的青春遇见你', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/18/s54285.jpg', 'https://tv.2345.com/detail/54285.html', 9.2, '家庭', 0, 7229);
INSERT INTO `tv_series_data` VALUES (6004083308, '幸福请你等等我未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/16/s50042.jpg', 'https://tv.2345.com/detail/50042.html', 7.5, '家庭', 0, 3906);
INSERT INTO `tv_series_data` VALUES (6004452612, '北风那个吹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/155/079c6a39bf9cb350d7b2a5b25f101faa.jpg', 'https://tv.2345.com/detail/155.html', 9.3, '家庭', 0, 3472);
INSERT INTO `tv_series_data` VALUES (6005422675, '哥谭市第1季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/13/s41830.jpg?1411456354', 'https://tv.2345.com/detail/41830.html', 9.1, '悬疑', 0, 6510);
INSERT INTO `tv_series_data` VALUES (6010185426, '团圆TVB国语版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/1878/f14508c52b338e04e66c731711394434.jpg', 'https://tv.2345.com/detail/1878.html', 9.8, '家庭', 0, 5830);
INSERT INTO `tv_series_data` VALUES (6014130901, '惊世新娘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/616/s616.jpg', 'https://tv.2345.com/detail/616.html', 7.8, '家庭', 0, 5038);
INSERT INTO `tv_series_data` VALUES (6014256168, '十月围城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/3/s11077.jpg?1403920617', 'https://tv.2345.com/detail/11077.html', 8.6, '战争', 0, 4338);
INSERT INTO `tv_series_data` VALUES (6015874940, '刀尖舞者', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/19/s57150.jpg', 'https://tv.2345.com/detail/57150.html', 8.9, '战争', 0, 4344);
INSERT INTO `tv_series_data` VALUES (6017571952, '回到爱以前普通话版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/19/s59023.jpg', 'https://tv.2345.com/detail/59023.html', 9.1, '家庭', 0, 4128);
INSERT INTO `tv_series_data` VALUES (6018494311, '我要结婚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/0/s160.jpg?1381489750', 'https://tv.2345.com/detail/160.html', 8.4, '伦理', 0, 7000);
INSERT INTO `tv_series_data` VALUES (6019355136, '雷霆战将DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/19/s58512.png', 'https://tv.2345.com/detail/58512.html', 8.6, '战争', 0, 4933);
INSERT INTO `tv_series_data` VALUES (6022141180, '多少爱可以重来', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/16/s49059.jpg?1468628997', 'https://tv.2345.com/detail/49059.html', 8.5, '家庭', 0, 5907);
INSERT INTO `tv_series_data` VALUES (6023777270, '保卫延安', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/508/3ec6414b35f94e24cafc9229f89096bc.jpg', 'https://tv.2345.com/detail/508.html', 10, '战争', 0, 5520);
INSERT INTO `tv_series_data` VALUES (6024199292, '关中义事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/3/9746/6dd1f9278c29952fe1f2413d47f8fb53.jpg', 'https://tv.2345.com/detail/9746.html', 8.8, '战争', 0, 6371);
INSERT INTO `tv_series_data` VALUES (6024710684, '赵氏孤儿案', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/3/s11232.jpg?1365991390', 'https://tv.2345.com/detail/11232.html', 9.2, '战争', 0, 5435);
INSERT INTO `tv_series_data` VALUES (6024750916, '家宴', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/10/s32163.jpg?1394888900', 'https://tv.2345.com/detail/32163.html', 8.5, '家庭', 0, 7606);
INSERT INTO `tv_series_data` VALUES (6029741281, '巨人国语版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/2/s8102.jpg', 'https://tv.2345.com/detail/8102.html', 9.3, '家庭', 0, 6516);
INSERT INTO `tv_series_data` VALUES (6040022513, '好妻子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/15/s47310.jpg', 'https://tv.2345.com/detail/47310.html', 9, '家庭', 0, 6228);
INSERT INTO `tv_series_data` VALUES (6043367562, '绝地刀锋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/15/s46377.jpg', 'https://tv.2345.com/detail/46377.html', 8.4, '战争', 0, 5418);
INSERT INTO `tv_series_data` VALUES (6043914570, '青果巷', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/10/s30240.jpg?1394759512', 'https://tv.2345.com/detail/30240.html', 8.4, '伦理', 0, 6582);
INSERT INTO `tv_series_data` VALUES (6045361670, '神枪之倒刺', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/11/s35522.jpg?1400307133', 'https://tv.2345.com/detail/35522.html', 8.4, '战争', 0, 5321);
INSERT INTO `tv_series_data` VALUES (6054787013, '我爷爷我爸爸', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/15/s46535.jpg', 'https://tv.2345.com/detail/46535.html', 8.7, '战争', 0, 4994);
INSERT INTO `tv_series_data` VALUES (6055403739, '铸匠', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/20/s61102.jpg', 'https://tv.2345.com/detail/61102.html', 8.9, '战争', 0, 5918);
INSERT INTO `tv_series_data` VALUES (6058332771, '左伟与杜叶的婚姻生活', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/1/s4318.jpg?1408429124', 'https://tv.2345.com/detail/4318.html', 6.1, '家庭', 0, 3502);
INSERT INTO `tv_series_data` VALUES (6065185924, '限时追捕', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/15/s45546.jpg', 'https://tv.2345.com/detail/45546.html', 8.6, '其他', 0, 6771);
INSERT INTO `tv_series_data` VALUES (6067616253, '少奇同志在武汉', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/14/s44854.jpg', 'https://tv.2345.com/detail/44854.html', 7, '其他', 0, 6162);
INSERT INTO `tv_series_data` VALUES (6072566630, '我怀了你的孩子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/d/d.png', 'https://tv.2345.com/detail/18104.html', 9.2, '家庭', 0, 4047);
INSERT INTO `tv_series_data` VALUES (6073845017, '幽灵计划', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/129/9e549c767c3c0e22467a6e99d651da1f.jpg', 'https://tv.2345.com/detail/129.html', 9, '悬疑', 0, 5541);
INSERT INTO `tv_series_data` VALUES (6074063873, '当我们在一起', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/20/s61186.jpg', 'https://tv.2345.com/detail/61186.html', 9.7, '家庭', 0, 7100);
INSERT INTO `tv_series_data` VALUES (6074528245, '托管班的故事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/18/s56851.jpg', 'https://tv.2345.com/detail/56851.html', 9.6, '家庭', 0, 5434);
INSERT INTO `tv_series_data` VALUES (6076514620, '燃情密码', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/9/s27050.jpg?1384417356', 'https://tv.2345.com/detail/27050.html', 8.6, '军旅', 0, 7879);
INSERT INTO `tv_series_data` VALUES (6083740323, '剑谍', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/311/2912078671bf8d2ae0a5aecee35c425e.jpg', 'https://tv.2345.com/detail/311.html', 9.3, '战争', 0, 4045);
INSERT INTO `tv_series_data` VALUES (6083795116, '湄洲岛奇缘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/2702/82cd7932042ce71ff8de4f4da821401a.png', 'https://tv.2345.com/detail/2702.html', 8.7, '伦理', 0, 5761);
INSERT INTO `tv_series_data` VALUES (6088890430, '泄露天机之锁住有情天', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/20/s61376.jpg', 'https://tv.2345.com/detail/61376.html', 8.6, '其他', 0, 4160);
INSERT INTO `tv_series_data` VALUES (6089786622, '偷心俏冤家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/3/s10302.jpg?1426824004', 'https://tv.2345.com/detail/10302.html', 8.9, '家庭', 0, 3580);
INSERT INTO `tv_series_data` VALUES (6090747330, '亲家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/1/3249/68fb08d8daa287de55b837242beb8c86.jpg', 'https://tv.2345.com/detail/3249.html', 8.8, '伦理', 0, 3842);
INSERT INTO `tv_series_data` VALUES (6094821573, '黄河在咆哮', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/15/s46863.jpg?1441508171', 'https://tv.2345.com/detail/46863.html', 8.4, '战争', 0, 6661);
INSERT INTO `tv_series_data` VALUES (6097370726, '六尺之下', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/15/s46264.jpg', 'https://tv.2345.com/detail/46264.html', 8.2, '家庭', 0, 7955);
INSERT INTO `tv_series_data` VALUES (6097624769, '真爱诺言', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/1/3109/56953e6c7365ca9c98143f8a0c1ebd76.jpg', 'https://tv.2345.com/detail/3109.html', 10, '家庭', 0, 6199);
INSERT INTO `tv_series_data` VALUES (6099731418, '女人的抗战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/15/s46172.jpg?1430702689', 'https://tv.2345.com/detail/46172.html', 8.4, '悬疑', 0, 4403);
INSERT INTO `tv_series_data` VALUES (6101173373, '警察锅哥第1季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/16/s48801.jpg?1499130673', 'https://tv.2345.com/detail/48801.html', 8.7, '悬疑', 0, 5666);
INSERT INTO `tv_series_data` VALUES (6102705969, '女子监狱第1季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/11/s35022.jpg?1415183783', 'https://tv.2345.com/detail/35022.html', 8.6, '伦理', 0, 4175);
INSERT INTO `tv_series_data` VALUES (6107372342, '过好年', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/1/3042/s3042.jpg', 'https://tv.2345.com/detail/3042.html', 8, '伦理', 0, 7755);
INSERT INTO `tv_series_data` VALUES (6107671578, '迷局1931', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/19/s57012.jpg', 'https://tv.2345.com/detail/57012.html', 8.8, '战争', 0, 3868);
INSERT INTO `tv_series_data` VALUES (6110866612, '别让我看见', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/15/s45149.jpg?1422858696', 'https://tv.2345.com/detail/45149.html', 8.4, '悬疑', 0, 5488);
INSERT INTO `tv_series_data` VALUES (6111629445, '我的娜塔莎', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/2/s6719.jpg', 'https://tv.2345.com/detail/6719.html', 9.5, '战争', 0, 4994);
INSERT INTO `tv_series_data` VALUES (6119242105, '最后的子弹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/2313/a032b0ada3263bfd0fd81a37f3cdd676.jpg', 'https://tv.2345.com/detail/2313.html', 9.2, '战争', 0, 5793);
INSERT INTO `tv_series_data` VALUES (6120758468, '冬天不冷', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/761/208b5ed2a90ceef9668e78ed7bc1f3d9.jpg', 'https://tv.2345.com/detail/761.html', 9.2, '伦理', 0, 4110);
INSERT INTO `tv_series_data` VALUES (6121009069, '龙虎人生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/859/43d909abadb9eb256553837c8b09caa4.jpg', 'https://tv.2345.com/detail/859.html', 9.5, '战争', 0, 3182);
INSERT INTO `tv_series_data` VALUES (6121941056, '欢乐农家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/1/3201/s3201.jpg', 'https://tv.2345.com/detail/3201.html', 6.9, '伦理', 0, 7159);
INSERT INTO `tv_series_data` VALUES (6134187656, '密查', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/18/s56010.jpg?1567142517', 'https://tv.2345.com/detail/56010.html', 8.8, '战争', 0, 6758);
INSERT INTO `tv_series_data` VALUES (6137897282, '孙老倔的幸福', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/15/s46153.jpg', 'https://tv.2345.com/detail/46153.html', 8.3, '家庭', 0, 4382);
INSERT INTO `tv_series_data` VALUES (6141437889, '第一杀手王亚樵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/2/s8001.jpg', 'https://tv.2345.com/detail/8001.html', 8.8, '战争', 0, 6301);
INSERT INTO `tv_series_data` VALUES (6142284252, '老虎队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/18/s56233.jpg', 'https://tv.2345.com/detail/56233.html', 8.3, '战争', 0, 7744);
INSERT INTO `tv_series_data` VALUES (6145595721, '我的兄弟姐妹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/1/3194/6935c1fdaaf6d3a55ca08c5d01f7225e.jpg', 'https://tv.2345.com/detail/3194.html', 10, '伦理', 0, 3932);
INSERT INTO `tv_series_data` VALUES (6146728450, '婚巢', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/d.jpg', 'https://tv.2345.com/detail/16566.html', 9.2, '伦理', 0, 7592);
INSERT INTO `tv_series_data` VALUES (6151153170, '向着幸福前进', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/15/s45771.jpg?1481794403', 'https://tv.2345.com/detail/45771.html', 8.5, '家庭', 0, 5353);
INSERT INTO `tv_series_data` VALUES (6154051302, '老牛家的战争', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/2344/9f07de30ba518c57110d62b47926a823.jpg', 'https://tv.2345.com/detail/2344.html', 9.1, '家庭', 0, 5289);
INSERT INTO `tv_series_data` VALUES (6155357215, '梅花儿香', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/18/s54993.jpg', 'https://tv.2345.com/detail/54993.html', 8.8, '家庭', 0, 6503);
INSERT INTO `tv_series_data` VALUES (6158160213, '前妻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/1/s3734.jpg?1410419562', 'https://tv.2345.com/detail/3734.html', 8.8, '家庭', 0, 5851);
INSERT INTO `tv_series_data` VALUES (6158433617, '亲爱的别哭', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/17/s53359.jpg', 'https://tv.2345.com/detail/53359.html', 8.9, '家庭', 0, 6203);
INSERT INTO `tv_series_data` VALUES (6160752906, '烟雨斜阳', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/1497/8be1e6a3ebb26fa8026c43811e8a45e7.jpg', 'https://tv.2345.com/detail/1497.html', 9.8, '伦理', 0, 3169);
INSERT INTO `tv_series_data` VALUES (6162192166, '五月槐花香', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/1849/3a005f4e5f73f21843b1504c1e3ba649.jpg', 'https://tv.2345.com/detail/1849.html', 9.5, '家庭', 0, 4160);
INSERT INTO `tv_series_data` VALUES (6166797741, '为爱结婚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/4/12487/62ad0db02cc5d0881996fb744894813c.jpg', 'https://tv.2345.com/detail/12487.html', 10, '家庭', 0, 6626);
INSERT INTO `tv_series_data` VALUES (6170692258, '有个地方叫马兰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/18/s55903.jpg', 'https://tv.2345.com/detail/55903.html', 8.3, '军旅', 0, 3150);
INSERT INTO `tv_series_data` VALUES (6171039704, '彼岸1945', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/c/5.jpg', 'https://tv.2345.com/detail/16551.html', 8.8, '战争', 0, 7179);
INSERT INTO `tv_series_data` VALUES (6174948341, '饭团之家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/641/9c7c2cadbcc6d0be52327a41d29b21c6.jpg', 'https://tv.2345.com/detail/641.html', 6.8, '家庭', 0, 5293);
INSERT INTO `tv_series_data` VALUES (6175826157, '怒火英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/15/s47397.jpg?1473482567', 'https://tv.2345.com/detail/47397.html', 8.3, '战争', 0, 6495);
INSERT INTO `tv_series_data` VALUES (6187182944, '兵出潼关', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/14/s44193.jpg?1416970623', 'https://tv.2345.com/detail/44193.html', 8, '战争', 0, 5096);
INSERT INTO `tv_series_data` VALUES (6187641251, '伙伴夫妻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/15/s46074.jpg?1429315661', 'https://tv.2345.com/detail/46074.html', 8.2, '家庭', 0, 3994);
INSERT INTO `tv_series_data` VALUES (6197763890, '谁说我结不了婚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/19/s57641.jpg', 'https://tv.2345.com/detail/57641.html', 9.4, '家庭', 0, 7031);
INSERT INTO `tv_series_data` VALUES (6203306404, '爱了散了', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/157/478dcab19b6d0dbdabff14f9d1b018c5.jpg', 'https://tv.2345.com/detail/157.html', 9.1, '伦理', 0, 7204);
INSERT INTO `tv_series_data` VALUES (6205174358, '沂蒙', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/154/38dd8d781e911c8b7dd50adf4931a131.jpg', 'https://tv.2345.com/detail/154.html', 9.6, '战争', 0, 5346);
INSERT INTO `tv_series_data` VALUES (6205736235, '冬日惊雷DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/9/s27954.jpg?1410421499', 'https://tv.2345.com/detail/27954.html', 7.6, '战争', 0, 6777);
INSERT INTO `tv_series_data` VALUES (6206583551, '孙子谋略', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/18/s56886.jpg', 'https://tv.2345.com/detail/56886.html', 9.4, '战争', 0, 3109);
INSERT INTO `tv_series_data` VALUES (6207047443, '带你去探班', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/15/s46100.jpg', 'https://tv.2345.com/detail/46100.html', 8.3, '其他', 0, 6095);
INSERT INTO `tv_series_data` VALUES (6209659582, '刑警使命', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/6/20368/3a5a36d88127d0a2d56f63fa9ad71211.jpg', 'https://tv.2345.com/detail/20368.html', 9.5, '悬疑', 0, 4968);
INSERT INTO `tv_series_data` VALUES (6212342998, '家的N次方', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/2/8525/e8ecb24d14544849d9edbff6a3461004.jpg', 'https://tv.2345.com/detail/8525.html', 9.5, '伦理', 0, 6754);
INSERT INTO `tv_series_data` VALUES (6216018660, '篱笆女人和狗', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/18/s54257.jpg', 'https://tv.2345.com/detail/54257.html', 9.2, '家庭', 0, 6821);
INSERT INTO `tv_series_data` VALUES (6217013884, '铁血雄心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/10/s32999.jpg', 'https://tv.2345.com/detail/32999.html', 8.1, '战争', 0, 7645);
INSERT INTO `tv_series_data` VALUES (6217721998, '我的左手右手', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/7/s23239.png?1383704749', 'https://tv.2345.com/detail/23239.html', 8.5, '家庭', 0, 7134);
INSERT INTO `tv_series_data` VALUES (6220116954, '杨光的新生活', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/1313/3e8fcbc9f2ec13c422d2493821b86bd6.jpg', 'https://tv.2345.com/detail/1313.html', 9.6, '家庭', 0, 4157);
INSERT INTO `tv_series_data` VALUES (6220252011, '风语', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/678/263615307d13cdb3b66eafe2cab21ddb.jpg', 'https://tv.2345.com/detail/678.html', 8.9, '悬疑', 0, 4809);
INSERT INTO `tv_series_data` VALUES (6225173707, '夜市人生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/1/s3513.jpg?1490237104', 'https://tv.2345.com/detail/3513.html', 8.5, '家庭', 0, 7250);
INSERT INTO `tv_series_data` VALUES (6227107710, '生死桥未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/2289/b81e3d9445ba89effa1ee595f0f01170.jpg', 'https://tv.2345.com/detail/2289.html', 9.2, '家庭', 0, 3513);
INSERT INTO `tv_series_data` VALUES (6228397423, '青春烈火', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/9/s28003.jpg?1393985399', 'https://tv.2345.com/detail/28003.html', 8.6, '战争', 0, 3959);
INSERT INTO `tv_series_data` VALUES (6229449477, '法网追击', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/19/s57337.jpg', 'https://tv.2345.com/detail/57337.html', 9.1, '悬疑', 0, 4757);
INSERT INTO `tv_series_data` VALUES (6229731790, '学生兵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/17/s53393.jpg', 'https://tv.2345.com/detail/53393.html', 8.1, '战争', 0, 7327);
INSERT INTO `tv_series_data` VALUES (6230064796, '王保长新篇2死去生来', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/13/s40842.jpg?1408692640', 'https://tv.2345.com/detail/40842.html', 8.5, '战争', 0, 3555);
INSERT INTO `tv_series_data` VALUES (6231123430, '朱元璋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/1028/c76b8c61163acce42316743fee1c3bec.jpg', 'https://tv.2345.com/detail/1028.html', 9.5, '战争', 0, 7697);
INSERT INTO `tv_series_data` VALUES (6233625073, '紧急审讯室3', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/19/s57450.jpg', 'https://tv.2345.com/detail/57450.html', 7.1, '悬疑', 0, 3691);
INSERT INTO `tv_series_data` VALUES (6233866825, '罗武林向前冲韩语版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/2/s8132.jpg?1364268157', 'https://tv.2345.com/detail/8132.html', 8.5, '伦理', 0, 6707);
INSERT INTO `tv_series_data` VALUES (6235202655, '家有仙妻续', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/18/s56162.jpg', 'https://tv.2345.com/detail/56162.html', 8.7, '家庭', 0, 3045);
INSERT INTO `tv_series_data` VALUES (6237443217, '关中女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/3/9624/17a3ea7079e6caeafa7bdd2b48bb0461.jpg', 'https://tv.2345.com/detail/9624.html', 9.3, '伦理', 0, 6123);
INSERT INTO `tv_series_data` VALUES (6242164063, '当婆婆遇上妈之欢喜冤家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/13/s40281.jpg?1406774254', 'https://tv.2345.com/detail/40281.html', 8.4, '家庭', 0, 7281);
INSERT INTO `tv_series_data` VALUES (6242823111, '石光荣的战火青春', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/5/s16925.jpg?1386118628', 'https://tv.2345.com/detail/16925.html', 8.5, '战争', 0, 4839);
INSERT INTO `tv_series_data` VALUES (6245880501, '大宅院的女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/10/s30404.jpg', 'https://tv.2345.com/detail/30404.html', 8.9, '家庭', 0, 5111);
INSERT INTO `tv_series_data` VALUES (6247933677, '抗倭英雄戚继光', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/15/s47753.jpg?1450858022', 'https://tv.2345.com/detail/47753.html', 8.5, '战争', 0, 7671);
INSERT INTO `tv_series_data` VALUES (6250348677, '神探杨金邦', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/15/s47842.jpg?1452673563', 'https://tv.2345.com/detail/47842.html', 8.3, '悬疑', 0, 7605);
INSERT INTO `tv_series_data` VALUES (6251125527, '闯荡', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/624/3fe19ff260dfc4c477add1a9d5cc6260.jpg', 'https://tv.2345.com/detail/624.html', 10, '伦理', 0, 5207);
INSERT INTO `tv_series_data` VALUES (6251223151, '决战前', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/5/s15373.jpg?1370240407', 'https://tv.2345.com/detail/15373.html', 8.5, '战争', 0, 5324);
INSERT INTO `tv_series_data` VALUES (6251865543, '守望的天空', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/2/7991/a12db26fe641d058399506ae8b1139c6.jpg', 'https://tv.2345.com/detail/7991.html', 9.4, '伦理', 0, 5138);
INSERT INTO `tv_series_data` VALUES (6254882852, '猛犸敢死队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/2300/d9b186f4ff60af40835cc29809bd21bb.jpg', 'https://tv.2345.com/detail/2300.html', 8.8, '战争', 0, 6718);
INSERT INTO `tv_series_data` VALUES (6256303807, '血脉', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/1/s3615.jpg', 'https://tv.2345.com/detail/3615.html', 8.8, '家庭', 0, 6712);
INSERT INTO `tv_series_data` VALUES (6257441601, '桃花灿烂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/17/s53309.jpg', 'https://tv.2345.com/detail/53309.html', 9.3, '家庭', 0, 5056);
INSERT INTO `tv_series_data` VALUES (6259425640, '单凤', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/17/s53515.jpg', 'https://tv.2345.com/detail/53515.html', 8.8, '家庭', 0, 7284);
INSERT INTO `tv_series_data` VALUES (6261665095, '雾都', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/2/8737/987098a1c5d2e6cd13e0b77cd0731b44.jpg', 'https://tv.2345.com/detail/8737.html', 8.9, '战争', 0, 7110);
INSERT INTO `tv_series_data` VALUES (6261972504, '满堂儿女', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/17/s53555.jpg', 'https://tv.2345.com/detail/53555.html', 9.2, '家庭', 0, 3505);
INSERT INTO `tv_series_data` VALUES (6263113147, '百战天龙第1季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/18/s56116.jpg', 'https://tv.2345.com/detail/56116.html', 8.5, '战争', 0, 7064);
INSERT INTO `tv_series_data` VALUES (6264110165, '黄金瞳', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/18/s55878.jpg', 'https://tv.2345.com/detail/55878.html', 9.6, '悬疑', 0, 7076);
INSERT INTO `tv_series_data` VALUES (6265278618, '彭德怀元帅', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/16/s48650.jpg', 'https://tv.2345.com/detail/48650.html', 8.6, '战争', 0, 5233);
INSERT INTO `tv_series_data` VALUES (6271664985, '大家庭', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/1/5.jpg', 'https://tv.2345.com/detail/14967.html', 8.5, '家庭', 0, 5435);
INSERT INTO `tv_series_data` VALUES (6272202887, '第二条战线', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/1/s4523.jpg?1410419602', 'https://tv.2345.com/detail/4523.html', 8.7, '战争', 0, 5726);
INSERT INTO `tv_series_data` VALUES (6275071768, '男人四十跑出租第一部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/18/s55545.jpg', 'https://tv.2345.com/detail/55545.html', 8.1, '伦理', 0, 6296);
INSERT INTO `tv_series_data` VALUES (6276369948, '啊摇篮', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/19/s59117.jpg', 'https://tv.2345.com/detail/59117.html', 9.8, '家庭', 0, 3591);
INSERT INTO `tv_series_data` VALUES (6277547340, '谍战之特殊较量', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/85/973b884835f946f2994349ab4a08ad87.jpg', 'https://tv.2345.com/detail/85.html', 9.3, '悬疑', 0, 4298);
INSERT INTO `tv_series_data` VALUES (6281129348, '饮食男女上部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/16/s49483.jpg', 'https://tv.2345.com/detail/49483.html', 8.3, '家庭', 0, 7509);
INSERT INTO `tv_series_data` VALUES (6286771492, '欢喜婆婆俏媳妇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/1692/e607f815d17f40807f088027f3e7baeb.jpg', 'https://tv.2345.com/detail/1692.html', 9, '家庭', 0, 6226);
INSERT INTO `tv_series_data` VALUES (6286876429, '清潭洞爱丽丝', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/2/f.jpg', 'https://tv.2345.com/detail/17213.html', 9.1, '家庭', 0, 7015);
INSERT INTO `tv_series_data` VALUES (6287443086, '盛世华衣', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/386/s386.jpg', 'https://tv.2345.com/detail/386.html', 8.6, '家庭', 0, 7129);
INSERT INTO `tv_series_data` VALUES (6289974583, '返城年代全集', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/18/s56324.jpg', 'https://tv.2345.com/detail/56324.html', 7.7, '家庭', 0, 5232);
INSERT INTO `tv_series_data` VALUES (6295275186, '半路夫妻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/1/5375/41dd0abb4139bab4d5cb9ad488afe9dd.jpg', 'https://tv.2345.com/detail/5375.html', 9.2, '伦理', 0, 3156);
INSERT INTO `tv_series_data` VALUES (6296715433, '荆棘鸟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/3/10469/779fa066d6965088c006d34344c29016.jpg', 'https://tv.2345.com/detail/10469.html', 8, '家庭', 0, 6098);
INSERT INTO `tv_series_data` VALUES (6297926606, '搞笑一家人中国版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/1/s4471.jpg?1437544366', 'https://tv.2345.com/detail/4471.html', 9.1, '家庭', 0, 3797);
INSERT INTO `tv_series_data` VALUES (6301255308, '激情燃烧的岁月1', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/1611/658461b8e61e409ba2ce7ec27113d941.jpg', 'https://tv.2345.com/detail/1611.html', 9.4, '家庭', 0, 4072);
INSERT INTO `tv_series_data` VALUES (6305651057, '底牌', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/2112/e132ac213f91b6e030b2a2d6446a2e6b.jpg', 'https://tv.2345.com/detail/2112.html', 8.8, '家庭', 0, 5424);
INSERT INTO `tv_series_data` VALUES (6309092730, '马大姐新传', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/3/9835/6f8504bece45c32c7379d2af4483fdc6.jpg', 'https://tv.2345.com/detail/9835.html', 8, '家庭', 0, 6715);
INSERT INTO `tv_series_data` VALUES (6309202853, '从头再来', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/4/12391/1dcda02cd8b114dab70168905775ebd9.jpg', 'https://tv.2345.com/detail/12391.html', 8.7, '家庭', 0, 6094);
INSERT INTO `tv_series_data` VALUES (6316062273, '青盲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/2/s7844.jpg?1363252432', 'https://tv.2345.com/detail/7844.html', 8.5, '悬疑', 0, 4290);
INSERT INTO `tv_series_data` VALUES (6318889727, '雪浴昆仑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/2/s8908.jpg', 'https://tv.2345.com/detail/8908.html', 9.2, '家庭', 0, 3659);
INSERT INTO `tv_series_data` VALUES (6321736104, '我姥爷1945之绝命枪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/20/s60858.jpg', 'https://tv.2345.com/detail/60858.html', 7.1, '战争', 0, 6229);
INSERT INTO `tv_series_data` VALUES (6326983732, '小兵阿福', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/2/6849/49b457843d89598e152fe48f8935912c.png', 'https://tv.2345.com/detail/6849.html', 9.2, '战争', 0, 4825);
INSERT INTO `tv_series_data` VALUES (6334945277, '娘家的故事3', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/3/s10199.jpg', 'https://tv.2345.com/detail/10199.html', 8.9, '家庭', 0, 5375);
INSERT INTO `tv_series_data` VALUES (6335655642, '人到中年', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/183/db6eb3be361c68cc1134e6b89128f97d.jpg', 'https://tv.2345.com/detail/183.html', 9.3, '家庭', 0, 4625);
INSERT INTO `tv_series_data` VALUES (6341033028, '大地情深', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/4/s14909.jpg?1379293954', 'https://tv.2345.com/detail/14909.html', 8.7, '家庭', 0, 5622);
INSERT INTO `tv_series_data` VALUES (6345210318, '青春集结号未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/15/s47176.jpg', 'https://tv.2345.com/detail/47176.html', 8.6, '战争', 0, 4921);
INSERT INTO `tv_series_data` VALUES (6353700194, '理智与情感', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/3/s11632.jpg?1376625987', 'https://tv.2345.com/detail/11632.html', 8, '家庭', 0, 5662);
INSERT INTO `tv_series_data` VALUES (6355253617, '我的爱情撞上了战争', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/16/s48979.jpg?1469414239', 'https://tv.2345.com/detail/48979.html', 8.4, '战争', 0, 7559);
INSERT INTO `tv_series_data` VALUES (6356879032, '雪豹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/0/s722.jpg?1443424073', 'https://tv.2345.com/detail/722.html', 9.5, '战争', 0, 6024);
INSERT INTO `tv_series_data` VALUES (6357501696, '绝情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/18/s55173.jpg', 'https://tv.2345.com/detail/55173.html', 9.6, '战争', 0, 7336);
INSERT INTO `tv_series_data` VALUES (6364756931, '天天有喜DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/17/s53266.jpg', 'https://tv.2345.com/detail/53266.html', 9, '家庭', 0, 3277);
INSERT INTO `tv_series_data` VALUES (6366872869, '爱情有点蓝', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/1050/9b52d84d30ace951c835a16f20744019.jpg', 'https://tv.2345.com/detail/1050.html', 7, '家庭', 0, 4409);
INSERT INTO `tv_series_data` VALUES (6369864949, '女工', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/1/3490/a857603d87ea855710c21f63b8e22bef.jpg', 'https://tv.2345.com/detail/3490.html', 9.3, '伦理', 0, 4062);
INSERT INTO `tv_series_data` VALUES (6370975977, '黑金地的女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/2/6932/b51600bcafa57a3fa9bd619a65fc7ac1.jpg', 'https://tv.2345.com/detail/6932.html', 9.7, '家庭', 0, 4702);
INSERT INTO `tv_series_data` VALUES (6371767429, '婚后三十年', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/1459/6d1f0d31921573bc765a2b8dd28c8607.jpg', 'https://tv.2345.com/detail/1459.html', 8.8, '伦理', 0, 5070);
INSERT INTO `tv_series_data` VALUES (6373036517, '待到山花烂漫时', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/10/s32586.jpg', 'https://tv.2345.com/detail/32586.html', 8.4, '军旅', 0, 3119);
INSERT INTO `tv_series_data` VALUES (6376451925, '半路夫妻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/1/5375/41dd0abb4139bab4d5cb9ad488afe9dd.jpg', 'https://tv.2345.com/detail/5375.html', 9.2, '家庭', 0, 6859);
INSERT INTO `tv_series_data` VALUES (6376888994, '铁血刀锋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/11/s33315.jpg?1408930067', 'https://tv.2345.com/detail/33315.html', 8.6, '悬疑', 0, 5686);
INSERT INTO `tv_series_data` VALUES (6385530700, '幸福小丈夫', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/3/10500/5cfaab6b207fcb0bdd316a1ef94e3397.jpg', 'https://tv.2345.com/detail/10500.html', 8.8, '家庭', 0, 7489);
INSERT INTO `tv_series_data` VALUES (6389509962, '家有一老', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/15/s45653.jpg?1423819176', 'https://tv.2345.com/detail/45653.html', 7.8, '伦理', 0, 7288);
INSERT INTO `tv_series_data` VALUES (6391507428, '惊蛰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/18/s55467.jpg', 'https://tv.2345.com/detail/55467.html', 9.2, '战争', 0, 5163);
INSERT INTO `tv_series_data` VALUES (6393668211, '飞虎神鹰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/2/7940/61db9b5f69b02bd86ce1e28a0490aa8a.jpg', 'https://tv.2345.com/detail/7940.html', 8.7, '战争', 0, 5391);
INSERT INTO `tv_series_data` VALUES (6394302033, '敌营十八年旧版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/18/s56475.jpg', 'https://tv.2345.com/detail/56475.html', 7.2, '战争', 0, 7389);
INSERT INTO `tv_series_data` VALUES (6395100345, '老柿子树', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/3/9766/77fa8799bab970305702d98ad28468e5.jpg', 'https://tv.2345.com/detail/9766.html', 9.8, '家庭', 0, 4989);
INSERT INTO `tv_series_data` VALUES (6395565424, '永不回头', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/625/cb99a57db90b067f0f6212e32703be78.jpg', 'https://tv.2345.com/detail/625.html', 9.7, '家庭', 0, 5335);
INSERT INTO `tv_series_data` VALUES (6395807967, '神探狄仁杰5', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/15/s47569.jpg?1448443754', 'https://tv.2345.com/detail/47569.html', 8.5, '悬疑', 0, 5200);
INSERT INTO `tv_series_data` VALUES (6396461746, '春天里', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/17/s53577.jpg?1504747787', 'https://tv.2345.com/detail/53577.html', 8.2, '伦理', 0, 4638);
INSERT INTO `tv_series_data` VALUES (6398789315, '富贵在天', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/1/s5607.jpg', 'https://tv.2345.com/detail/5607.html', 8.4, '伦理', 0, 6309);
INSERT INTO `tv_series_data` VALUES (6400515591, '康定情歌', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/2178/e09e1be578aa7ff90a2e0eab940cd90b.jpg', 'https://tv.2345.com/detail/2178.html', 9.2, '伦理', 0, 4183);
INSERT INTO `tv_series_data` VALUES (6400790858, '新乌龙山剿匪记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/2/7628/2351e0fdd61ab4613de8b6684f5b6bcc.jpg', 'https://tv.2345.com/detail/7628.html', 8.6, '战争', 0, 6246);
INSERT INTO `tv_series_data` VALUES (6402910206, '十九岁的纯情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/6/s19701.jpg?1410420495', 'https://tv.2345.com/detail/19701.html', 6.2, '家庭', 0, 3514);
INSERT INTO `tv_series_data` VALUES (6405358796, '我爱我家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/2/s6313.jpg?1364283086', 'https://tv.2345.com/detail/6313.html', 9.8, '家庭', 0, 3718);
INSERT INTO `tv_series_data` VALUES (6407030360, '义者无敌', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/16/s50904.jpg?1478658080', 'https://tv.2345.com/detail/50904.html', 7.9, '战争', 0, 4736);
INSERT INTO `tv_series_data` VALUES (6414849827, '你是我的幸福', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/1/4313/2a1ce0fe4ab87d8363fe89bf5796832a.jpg', 'https://tv.2345.com/detail/4313.html', 9.4, '家庭', 0, 6240);
INSERT INTO `tv_series_data` VALUES (6420254243, '十二夜', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/20/s61167.jpg', 'https://tv.2345.com/detail/61167.html', 8.4, '悬疑', 0, 4222);
INSERT INTO `tv_series_data` VALUES (6420370902, '明德绣庄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/1280/6fa0f4dbad614727253a89992cf8fe32.jpg', 'https://tv.2345.com/detail/1280.html', 9.2, '伦理', 0, 5115);
INSERT INTO `tv_series_data` VALUES (6424313895, '烽火燃情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/18/s56971.jpg', 'https://tv.2345.com/detail/56971.html', 8.1, '战争', 0, 4213);
INSERT INTO `tv_series_data` VALUES (6426288859, '地道战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/1694/b289cc29b0941345b813bb62de195ab2.jpg', 'https://tv.2345.com/detail/1694.html', 9.6, '战争', 0, 4950);
INSERT INTO `tv_series_data` VALUES (6437090723, '添丁发财', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/0/s2208.jpg', 'https://tv.2345.com/detail/2208.html', 6.2, '伦理', 0, 5565);
INSERT INTO `tv_series_data` VALUES (6437556822, '致命名单', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/e/19295.jpg', 'https://tv.2345.com/detail/19295.html', 9.2, '战争', 0, 7909);
INSERT INTO `tv_series_data` VALUES (6437630407, '家有爹娘第2部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/345/d289194ce405a3f390a83b2236ceff41.jpg', 'https://tv.2345.com/detail/345.html', 9, '家庭', 0, 4398);
INSERT INTO `tv_series_data` VALUES (6437693390, '复仇第1季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/1034/s1034.jpg', 'https://tv.2345.com/detail/1034.html', 7.9, '伦理', 0, 4231);
INSERT INTO `tv_series_data` VALUES (6438151448, '出关央视版TV剪辑版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/19/s59226.jpg', 'https://tv.2345.com/detail/59226.html', 8.8, '战争', 0, 5206);
INSERT INTO `tv_series_data` VALUES (6438532062, '戈壁剿匪记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/0/s368.jpg?1410419356', 'https://tv.2345.com/detail/368.html', 8.8, '战争', 0, 6519);
INSERT INTO `tv_series_data` VALUES (6443927957, '红军东征', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/2/7845/6f4ec9cd014531177802a6d1cfec4555.jpg', 'https://tv.2345.com/detail/7845.html', 6.3, '军旅', 0, 7855);
INSERT INTO `tv_series_data` VALUES (6445377686, '凶案现场', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/19/s57438.jpg', 'https://tv.2345.com/detail/57438.html', 9.7, '悬疑', 0, 5163);
INSERT INTO `tv_series_data` VALUES (6445385571, '顺娘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/2811/a6f320bad957c4f69175af47c89ba322.jpg', 'https://tv.2345.com/detail/2811.html', 8.8, '伦理', 0, 4269);
INSERT INTO `tv_series_data` VALUES (6452851568, '新世界', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/18/s56992.jpg?1575881288', 'https://tv.2345.com/detail/56992.html', 8.9, '战争', 0, 4463);
INSERT INTO `tv_series_data` VALUES (6455583930, '幽灵计划', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/129/9e549c767c3c0e22467a6e99d651da1f.jpg', 'https://tv.2345.com/detail/129.html', 9, '战争', 0, 6328);
INSERT INTO `tv_series_data` VALUES (6462816405, '人怕出名', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/237/7a1835dce25b2f422f08e58f942bd756.jpg', 'https://tv.2345.com/detail/237.html', 7.2, '家庭', 0, 6856);
INSERT INTO `tv_series_data` VALUES (6466081375, '这里的黎明静悄悄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/1/5939/681a42574e66cef47b047ddb4b23baff.jpg', 'https://tv.2345.com/detail/5939.html', 10, '战争', 0, 7670);
INSERT INTO `tv_series_data` VALUES (6466270847, '我的孩子我的家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/889/fbb0bf36e0c93b9e2aac69b3442f068c.jpg', 'https://tv.2345.com/detail/889.html', 9, '家庭', 0, 7603);
INSERT INTO `tv_series_data` VALUES (6472832560, '养母', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/2035/s2035.jpg', 'https://tv.2345.com/detail/2035.html', 9.8, '战争', 0, 4991);
INSERT INTO `tv_series_data` VALUES (6473520019, '朝鲜侦探丁若镛', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/3/11569/fb5a2fef07c880f6bfe4151b92de59ba.jpg', 'https://tv.2345.com/detail/11569.html', 7.8, '战争', 0, 7049);
INSERT INTO `tv_series_data` VALUES (6477030662, '向天真的女生投降', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/1/4878/215ae3fbd1ed9485ec2ccd60a9803fdc.jpg', 'https://tv.2345.com/detail/4878.html', 10, '家庭', 0, 4523);
INSERT INTO `tv_series_data` VALUES (6477856354, '兼并', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/2/s7925.jpg?1398418854', 'https://tv.2345.com/detail/7925.html', 9.2, '伦理', 0, 6551);
INSERT INTO `tv_series_data` VALUES (6479592637, '女人的抉择', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/3/3.jpg', 'https://tv.2345.com/detail/10582.html', 8.8, '伦理', 0, 7537);
INSERT INTO `tv_series_data` VALUES (6480208985, '五台山抗日传奇女兵排', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/18/s56354.jpg', 'https://tv.2345.com/detail/56354.html', 9.8, '战争', 0, 4190);
INSERT INTO `tv_series_data` VALUES (6486647973, '后裔', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/19/s57000.jpg', 'https://tv.2345.com/detail/57000.html', 9.8, '悬疑', 0, 7081);
INSERT INTO `tv_series_data` VALUES (6492007706, '热血神探', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/20/s61280.jpg', 'https://tv.2345.com/detail/61280.html', 8.5, '悬疑', 0, 3888);
INSERT INTO `tv_series_data` VALUES (6493343007, '热血尖兵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/17/s52782.jpg?1488937266', 'https://tv.2345.com/detail/52782.html', 8.7, '军旅', 0, 4358);
INSERT INTO `tv_series_data` VALUES (6493845952, '黄金彩虹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/8/s26527.jpg?1382538998', 'https://tv.2345.com/detail/26527.html', 8.6, '伦理', 0, 3871);
INSERT INTO `tv_series_data` VALUES (6494360647, '飞行少年', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/0/s2072.jpg?1569292152', 'https://tv.2345.com/detail/2072.html', 9.2, '战争', 0, 5218);
INSERT INTO `tv_series_data` VALUES (6502270742, '刀尖上行走', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/677/8593fc64f2457f13d5f77592b276ee5d.jpg', 'https://tv.2345.com/detail/677.html', 8.8, '战争', 0, 7171);
INSERT INTO `tv_series_data` VALUES (6503213185, '国际大营救', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/1821/3e9a7aaad52df63f12aefe42d780c1f8.jpg', 'https://tv.2345.com/detail/1821.html', 9.6, '战争', 0, 5963);
INSERT INTO `tv_series_data` VALUES (6503713738, '金婚风雨情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/1/5405/f87bb9631d78c83b5632ee10bf07080d.jpg', 'https://tv.2345.com/detail/5405.html', 9.3, '家庭', 0, 7004);
INSERT INTO `tv_series_data` VALUES (6510724714, '生活真奇特', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/15/s46712.jpg', 'https://tv.2345.com/detail/46712.html', 8.1, '其他', 0, 4435);
INSERT INTO `tv_series_data` VALUES (6510850687, '婚姻料理', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/13/s41134.jpg?1410150256', 'https://tv.2345.com/detail/41134.html', 8.6, '家庭', 0, 4932);
INSERT INTO `tv_series_data` VALUES (6514212672, '毕业生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/1/s4222.jpg?1410419584', 'https://tv.2345.com/detail/4222.html', 9.2, '家庭', 0, 6542);
INSERT INTO `tv_series_data` VALUES (6517953417, '爱心小天使', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/4/12572/a2e998cd94c8a7aa340588dca4113da1.jpg', 'https://tv.2345.com/detail/12572.html', 8.7, '家庭', 0, 3428);
INSERT INTO `tv_series_data` VALUES (6519168289, '外来媳妇本地郎第四部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/18/s55444.jpg', 'https://tv.2345.com/detail/55444.html', 8.9, '家庭', 0, 4513);
INSERT INTO `tv_series_data` VALUES (6521858944, '八九不离十', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/16/s48327.jpg?1505785804', 'https://tv.2345.com/detail/48327.html', 8.1, '家庭', 0, 4949);
INSERT INTO `tv_series_data` VALUES (6521914845, '刑档内幕', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/1/s5094.jpg?1410419638', 'https://tv.2345.com/detail/5094.html', 9.3, '悬疑', 0, 6865);
INSERT INTO `tv_series_data` VALUES (6521976873, '禁区', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/0/s88.jpg?1502698571', 'https://tv.2345.com/detail/88.html', 8.2, '伦理', 0, 7601);
INSERT INTO `tv_series_data` VALUES (6522093234, '情与缘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/449611/1348835050/9c2f0d7f9a41740a424f93d6b3c15aae.jpg', 'https://tv.2345.com/detail/15421.html', 8.7, '家庭', 0, 5402);
INSERT INTO `tv_series_data` VALUES (6522586441, '太行山上央视版TV剪辑版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/16/s50107.jpg', 'https://tv.2345.com/detail/50107.html', 8.8, '战争', 0, 5538);
INSERT INTO `tv_series_data` VALUES (6529140318, '孩奴', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/8/s25480.jpg?1380424785', 'https://tv.2345.com/detail/25480.html', 8.6, '家庭', 0, 7193);
INSERT INTO `tv_series_data` VALUES (6534886959, '名门媳妇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/17/s52232.jpg', 'https://tv.2345.com/detail/52232.html', 8.8, '家庭', 0, 7487);
INSERT INTO `tv_series_data` VALUES (6535979391, '因为爱情有幸福之二', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/16/s48253.jpg', 'https://tv.2345.com/detail/48253.html', 9, '家庭', 0, 7074);
INSERT INTO `tv_series_data` VALUES (6540888303, '寒秋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/17/s52193.jpg', 'https://tv.2345.com/detail/52193.html', 9.2, '战争', 0, 4153);
INSERT INTO `tv_series_data` VALUES (6544121207, '四十九日祭TV剪辑版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/19/s59225.jpg', 'https://tv.2345.com/detail/59225.html', 9.5, '战争', 0, 7104);
INSERT INTO `tv_series_data` VALUES (6545616753, '双面神探', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/20/s60886.jpg', 'https://tv.2345.com/detail/60886.html', 8, '悬疑', 0, 3413);
INSERT INTO `tv_series_data` VALUES (6546625064, '老大的幸福', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/507/caa3038d3a245ae17335c5b2cf82435f.jpg', 'https://tv.2345.com/detail/507.html', 9.5, '家庭', 0, 6388);
INSERT INTO `tv_series_data` VALUES (6546669965, '二叔', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/9/s27144.jpg?1384567262', 'https://tv.2345.com/detail/27144.html', 8.4, '家庭', 0, 7614);
INSERT INTO `tv_series_data` VALUES (6547195751, '谍战深海', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/1/d.png', 'https://tv.2345.com/detail/12777.html', 9, '战争', 0, 5822);
INSERT INTO `tv_series_data` VALUES (6549370540, '妈妈的花样年华', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/8/s25108.jpg?1378258467', 'https://tv.2345.com/detail/25108.html', 8.6, '伦理', 0, 6834);
INSERT INTO `tv_series_data` VALUES (6550175318, '谁懂女儿心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/1192/d581108bc2b191c01aaef0e7a322f9a0.jpg', 'https://tv.2345.com/detail/1192.html', 9.1, '伦理', 0, 6582);
INSERT INTO `tv_series_data` VALUES (6552299050, '亲家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/1/3249/68fb08d8daa287de55b837242beb8c86.jpg', 'https://tv.2345.com/detail/3249.html', 8.8, '家庭', 0, 3699);
INSERT INTO `tv_series_data` VALUES (6553978597, '尖锋之烈焰青春', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/17/s52204.jpg', 'https://tv.2345.com/detail/52204.html', 8.9, '战争', 0, 4641);
INSERT INTO `tv_series_data` VALUES (6554313849, '一颗颗眼泪都是爱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/286/bfbaa9c16cbf2046edd41ed2c87f476d.jpg', 'https://tv.2345.com/detail/286.html', 9, '家庭', 0, 3543);
INSERT INTO `tv_series_data` VALUES (6557622036, '铁道游击队1', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/2/s7627.jpg', 'https://tv.2345.com/detail/7627.html', 7.8, '战争', 0, 4783);
INSERT INTO `tv_series_data` VALUES (6557967382, '猛兽列车未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/16/s50090.jpg', 'https://tv.2345.com/detail/50090.html', 8.8, '战争', 0, 3161);
INSERT INTO `tv_series_data` VALUES (6566090093, '娶进来嫁出去', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/16/s50395.jpg', 'https://tv.2345.com/detail/50395.html', 8.7, '家庭', 0, 6137);
INSERT INTO `tv_series_data` VALUES (6570999788, '中国式离婚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/1475/17b6da2ebce039f9452717278a20e81b.jpg', 'https://tv.2345.com/detail/1475.html', 9.4, '家庭', 0, 3280);
INSERT INTO `tv_series_data` VALUES (6571264461, '敌营十八年', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/18/706fe4cc344ad4c12691bd113dbacd54.jpg', 'https://tv.2345.com/detail/18.html', 9.4, '战争', 0, 3149);
INSERT INTO `tv_series_data` VALUES (6571980319, '第66届艾美奖', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/12/s36138.jpg?1410421795', 'https://tv.2345.com/detail/36138.html', 6.7, '其他', 0, 3574);
INSERT INTO `tv_series_data` VALUES (6573931202, '毛泽东', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/9/s28390.jpg?1388025533', 'https://tv.2345.com/detail/28390.html', 8.5, '战争', 0, 7451);
INSERT INTO `tv_series_data` VALUES (6574945190, '诛寇行动', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/2/b.jpg', 'https://tv.2345.com/detail/18261.html', 9.2, '战争', 0, 5051);
INSERT INTO `tv_series_data` VALUES (6576897352, '战地枪王', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/18/s55309.jpg', 'https://tv.2345.com/detail/55309.html', 9.2, '战争', 0, 4654);
INSERT INTO `tv_series_data` VALUES (6577691533, '金三角风云', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/2/6369/891b47633ffa46486cf97b1e838fb297.jpg', 'https://tv.2345.com/detail/6369.html', 9.2, '战争', 0, 6826);
INSERT INTO `tv_series_data` VALUES (6578293848, '密谍伙伴第2季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/18/s56155.jpg', 'https://tv.2345.com/detail/56155.html', 8.9, '战争', 0, 7105);
INSERT INTO `tv_series_data` VALUES (6587712611, '十送红军', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/12/s36241.jpg?1402459272', 'https://tv.2345.com/detail/36241.html', 8.7, '战争', 0, 6220);
INSERT INTO `tv_series_data` VALUES (6589637744, '啼笑因缘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/3/10239/bd4dac4d35f1457ae13208fe7d2024a6.jpg', 'https://tv.2345.com/detail/10239.html', 9, '战争', 0, 3919);
INSERT INTO `tv_series_data` VALUES (6590294124, '电视剧地雷战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/17/s53713.jpg', 'https://tv.2345.com/detail/53713.html', 7.3, '战争', 0, 7226);
INSERT INTO `tv_series_data` VALUES (6595626846, '大唐诗圣', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/2/6824/be0e3ef1a7e657ab79ab7efe05e8f3b7.jpg', 'https://tv.2345.com/detail/6824.html', 9.3, '其他', 0, 7929);
INSERT INTO `tv_series_data` VALUES (6596591976, '新四军', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/2771/92120b694d20192bac0a38df0c10074f.jpg', 'https://tv.2345.com/detail/2771.html', 10, '战争', 0, 6591);
INSERT INTO `tv_series_data` VALUES (6596692576, '玉海棠', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/16/s48498.jpg?1463213856', 'https://tv.2345.com/detail/48498.html', 8.4, '悬疑', 0, 7225);
INSERT INTO `tv_series_data` VALUES (6600399034, '小姨多鹤', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/103/2b73a0288a5ba2dc26d6680e5235cc06.jpg', 'https://tv.2345.com/detail/103.html', 9.7, '家庭', 0, 6283);
INSERT INTO `tv_series_data` VALUES (6608057726, '上有老', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/171/f7257bfaca82f668474102f36054610f.jpg', 'https://tv.2345.com/detail/171.html', 10, '家庭', 0, 6578);
INSERT INTO `tv_series_data` VALUES (6609181386, '风华绝代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/230/a26eeabbc4c0aaf37487b4fb045259a4.jpg', 'https://tv.2345.com/detail/230.html', 10, '家庭', 0, 7116);
INSERT INTO `tv_series_data` VALUES (6611006729, '迷案1937', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/0/s900.jpg?1487731562', 'https://tv.2345.com/detail/900.html', 8.1, '战争', 0, 5600);
INSERT INTO `tv_series_data` VALUES (6611439201, '军人机密', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/1200/14c32d46e1c030962d6b96c25e3ace29.jpg', 'https://tv.2345.com/detail/1200.html', 9.4, '军旅', 0, 4618);
INSERT INTO `tv_series_data` VALUES (6611586561, '三十里铺', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/2/s7070.jpg?1410419769', 'https://tv.2345.com/detail/7070.html', 8.8, '军旅', 0, 4776);
INSERT INTO `tv_series_data` VALUES (6625113037, '天伦', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/10/s31695.jpg?1456299216', 'https://tv.2345.com/detail/31695.html', 8.4, '家庭', 0, 3702);
INSERT INTO `tv_series_data` VALUES (6626529421, '功夫传奇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/16/s49630.jpg', 'https://tv.2345.com/detail/49630.html', 8.4, '其他', 0, 5832);
INSERT INTO `tv_series_data` VALUES (6629681094, '小欢喜', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/18/s56313.jpg?1564625951', 'https://tv.2345.com/detail/56313.html', 8.8, '家庭', 0, 4639);
INSERT INTO `tv_series_data` VALUES (6642723221, '医者仁心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/0/s831.jpg?1365328059', 'https://tv.2345.com/detail/831.html', 9.6, '家庭', 0, 6610);
INSERT INTO `tv_series_data` VALUES (6645913676, '福贵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/2/7928/e55475dc3ec09b15795795195e45a43c.jpg', 'https://tv.2345.com/detail/7928.html', 10, '家庭', 0, 6058);
INSERT INTO `tv_series_data` VALUES (6646944126, '温柔的谎言', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/1/s5834.jpg?1361934878', 'https://tv.2345.com/detail/5834.html', 8.5, '家庭', 0, 4127);
INSERT INTO `tv_series_data` VALUES (6647487389, '激战江南', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/3/10165/d14363d70ff6cdcf3f6376c26f1f0719.jpg', 'https://tv.2345.com/detail/10165.html', 8.8, '战争', 0, 7373);
INSERT INTO `tv_series_data` VALUES (6648043938, '黄埔虎将', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/19/s58306.jpg', 'https://tv.2345.com/detail/58306.html', 9.7, '战争', 0, 7391);
INSERT INTO `tv_series_data` VALUES (6659842257, '赌场大揭秘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/15/s45462.jpg', 'https://tv.2345.com/detail/45462.html', 7.5, '其他', 0, 6926);
INSERT INTO `tv_series_data` VALUES (6660090461, '怒放', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/15/s46478.jpg?1434337458', 'https://tv.2345.com/detail/46478.html', 8.4, '战争', 0, 7767);
INSERT INTO `tv_series_data` VALUES (6672169928, '傻儿传奇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/14/s44591.jpg?1418950571', 'https://tv.2345.com/detail/44591.html', 8.6, '战争', 0, 5483);
INSERT INTO `tv_series_data` VALUES (6672864782, '生死劫', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/1785/552a6611ca0df4dcb937ed768478b77c.jpg', 'https://tv.2345.com/detail/1785.html', 9.1, '家庭', 0, 7903);
INSERT INTO `tv_series_data` VALUES (6675033610, '绝密任务', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/18/s55353.jpg', 'https://tv.2345.com/detail/55353.html', 8.8, '战争', 0, 3658);
INSERT INTO `tv_series_data` VALUES (6677372486, '军服的历史', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/18/s56282.jpg', 'https://tv.2345.com/detail/56282.html', 9.8, '战争', 0, 6753);
INSERT INTO `tv_series_data` VALUES (6680005964, '我怕来不及', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/18/s56965.jpg', 'https://tv.2345.com/detail/56965.html', 9.8, '家庭', 0, 3904);
INSERT INTO `tv_series_data` VALUES (6681082385, '坐88路车回家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/15/s46185.jpg?1430794804', 'https://tv.2345.com/detail/46185.html', 8.3, '家庭', 0, 5007);
INSERT INTO `tv_series_data` VALUES (6682073260, '花红花火', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/15/s45142.jpg', 'https://tv.2345.com/detail/45142.html', 8.5, '战争', 0, 5199);
INSERT INTO `tv_series_data` VALUES (6693546990, '端脑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/18/s54161.jpg', 'https://tv.2345.com/detail/54161.html', 7.6, '悬疑', 0, 3721);
INSERT INTO `tv_series_data` VALUES (6697031230, '黄金血道', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/16/s48975.jpg?1472437069', 'https://tv.2345.com/detail/48975.html', 8.2, '战争', 0, 7758);
INSERT INTO `tv_series_data` VALUES (6697217484, '婚姻历险记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/18/s54930.jpg?1529543983', 'https://tv.2345.com/detail/54930.html', 8.8, '家庭', 0, 7600);
INSERT INTO `tv_series_data` VALUES (6698070471, '卧虎', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/16/s50153.jpg', 'https://tv.2345.com/detail/50153.html', 8.5, '悬疑', 0, 5659);
INSERT INTO `tv_series_data` VALUES (6699081946, '悠长假期', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/2727/67fa92da817b41dc2a8f51dc04297c52.jpg', 'https://tv.2345.com/detail/2727.html', 8.9, '家庭', 0, 7549);
INSERT INTO `tv_series_data` VALUES (6699648361, '地球的秘密花园', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/15/s45611.jpg', 'https://tv.2345.com/detail/45611.html', 7.5, '其他', 0, 7205);
INSERT INTO `tv_series_data` VALUES (6700770467, '撞车', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/231/6944699967e39efdb32122e8b157c8ec.jpg', 'https://tv.2345.com/detail/231.html', 8.7, '家庭', 0, 7344);
INSERT INTO `tv_series_data` VALUES (6703090367, '利箭纵横', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/9/s28346.jpg?1388623931', 'https://tv.2345.com/detail/28346.html', 8.5, '战争', 0, 4524);
INSERT INTO `tv_series_data` VALUES (6705164059, '谢谢你纽约', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/14/s44629.jpg', 'https://tv.2345.com/detail/44629.html', 9.1, '其他', 0, 6131);
INSERT INTO `tv_series_data` VALUES (6709413200, '三国演义', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/737/defbb0be9119b85a609f74817c79878b.jpg', 'https://tv.2345.com/detail/737.html', 8.4, '战争', 0, 7738);
INSERT INTO `tv_series_data` VALUES (6712382154, '玻璃之城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/885/4f2f450efb5c517032cfd6cdd9fbade6.jpg', 'https://tv.2345.com/detail/885.html', 8, '家庭', 0, 3470);
INSERT INTO `tv_series_data` VALUES (6716816024, '翠兰的爱情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/13/s41424.jpg?1410416537', 'https://tv.2345.com/detail/41424.html', 8.5, '家庭', 0, 6143);
INSERT INTO `tv_series_data` VALUES (6716876670, '外姓兄弟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/450597/1351793524/525abcbe6b4b2b79ce46b61bc3061536.jpg', 'https://tv.2345.com/detail/16404.html', 8.5, '家庭', 0, 4426);
INSERT INTO `tv_series_data` VALUES (6723112899, 'G12特别行动组—未来战士', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/18/s55737.jpg', 'https://tv.2345.com/detail/55737.html', 7.2, '战争', 0, 7377);
INSERT INTO `tv_series_data` VALUES (6723287008, '江城令', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/233/5ba9b07e98017dccd7f51ebad0ebcb86.jpg', 'https://tv.2345.com/detail/233.html', 9, '战争', 0, 3390);
INSERT INTO `tv_series_data` VALUES (6725141523, '剃刀边缘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/17/s52101.jpg?1490145286', 'https://tv.2345.com/detail/52101.html', 8.5, '战争', 0, 5959);
INSERT INTO `tv_series_data` VALUES (6728089089, '盲点第二季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/18/s54364.jpg', 'https://tv.2345.com/detail/54364.html', 8.1, '战争', 0, 7165);
INSERT INTO `tv_series_data` VALUES (6730647101, '落差', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/15/s46978.jpg', 'https://tv.2345.com/detail/46978.html', 8.8, '家庭', 0, 5164);
INSERT INTO `tv_series_data` VALUES (6731418185, '血色童心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/348/5446ba08986c82d696e3a11b354d653c.jpg', 'https://tv.2345.com/detail/348.html', 9.4, '家庭', 0, 5500);
INSERT INTO `tv_series_data` VALUES (6732660002, '以家人之名三兄妹日常篇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/19/s57851.jpg', 'https://tv.2345.com/detail/57851.html', 7.9, '家庭', 0, 6783);
INSERT INTO `tv_series_data` VALUES (6737018925, '趟过男人河的女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/3/10236/b8f5a5f6c218cb7614b83c62ba34b681.jpg', 'https://tv.2345.com/detail/10236.html', 9.1, '家庭', 0, 7563);
INSERT INTO `tv_series_data` VALUES (6739705214, '都是兄弟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/6/19547/e1d6a7326e0b4c36ffd149af8f48c69f.jpg', 'https://tv.2345.com/detail/19547.html', 8.8, '伦理', 0, 7350);
INSERT INTO `tv_series_data` VALUES (6740933753, '夺爱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/3/b.jpg', 'https://tv.2345.com/detail/17496.html', 8.8, '伦理', 0, 3894);
INSERT INTO `tv_series_data` VALUES (6743667659, '幸福满院', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/17/s53900.jpg', 'https://tv.2345.com/detail/53900.html', 8.9, '家庭', 0, 5543);
INSERT INTO `tv_series_data` VALUES (6744383183, '不要公开你的秘密', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/2/6195/3a0e3690be8d92c9701765703d051888.jpg', 'https://tv.2345.com/detail/6195.html', 9.2, '家庭', 0, 4777);
INSERT INTO `tv_series_data` VALUES (6744527263, '战火连天', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/13/s41112.jpg?1409533043', 'https://tv.2345.com/detail/41112.html', 8.7, '战争', 0, 3156);
INSERT INTO `tv_series_data` VALUES (6748517057, '浴血重生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/15/s47960.jpg?1455420921', 'https://tv.2345.com/detail/47960.html', 8.5, '战争', 0, 5064);
INSERT INTO `tv_series_data` VALUES (6750199542, '皮影', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/18/s54569.jpg', 'https://tv.2345.com/detail/54569.html', 8.6, '战争', 0, 7010);
INSERT INTO `tv_series_data` VALUES (6750671842, '我们是一家人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/2/s7076.jpg', 'https://tv.2345.com/detail/7076.html', 8.8, '家庭', 0, 4390);
INSERT INTO `tv_series_data` VALUES (6755813802, '我们的快乐人生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/3/4.jpg', 'https://tv.2345.com/detail/18824.html', 9.2, '家庭', 0, 7111);
INSERT INTO `tv_series_data` VALUES (6756266482, '狙击部队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/10/s32743.jpg?1398309577', 'https://tv.2345.com/detail/32743.html', 8.4, '战争', 0, 7006);
INSERT INTO `tv_series_data` VALUES (6757768332, '红问号', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/15/s45091.jpg', 'https://tv.2345.com/detail/45091.html', 7.3, '悬疑', 0, 4085);
INSERT INTO `tv_series_data` VALUES (6760846290, '老妈的三国时代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/8/s25248.jpg?1390353684', 'https://tv.2345.com/detail/25248.html', 8.4, '家庭', 0, 3235);
INSERT INTO `tv_series_data` VALUES (6764907258, '新京城四少', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/921/918a1fb30acbe9604d21895d49e35bd9.jpg', 'https://tv.2345.com/detail/921.html', 8, '伦理', 0, 3786);
INSERT INTO `tv_series_data` VALUES (6765077956, '悠悠寸草心2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/2/8255/ffc8d0f153e5c0bf2d463e43ef7951f1.jpg', 'https://tv.2345.com/detail/8255.html', 8.8, '伦理', 0, 6513);
INSERT INTO `tv_series_data` VALUES (6765127335, '万山剿匪记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/3/s9923.jpg', 'https://tv.2345.com/detail/9923.html', 8.8, '战争', 0, 5388);
INSERT INTO `tv_series_data` VALUES (6765441551, '绅士恋上假男佣', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/5/16380/d2b860980c0b1eb424edb776d8cb4699.jpg', 'https://tv.2345.com/detail/16380.html', 8.5, '伦理', 0, 6339);
INSERT INTO `tv_series_data` VALUES (6765596972, '功夫战警', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/19/s58771.jpg', 'https://tv.2345.com/detail/58771.html', 9.8, '战争', 0, 6279);
INSERT INTO `tv_series_data` VALUES (6767530643, '战火兵魂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/9/s28873.jpg?1389667839', 'https://tv.2345.com/detail/28873.html', 8.5, '战争', 0, 3618);
INSERT INTO `tv_series_data` VALUES (6769559498, '潜伏在黎明之前', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/16/s48036.jpg?1458096386', 'https://tv.2345.com/detail/48036.html', 8.5, '战争', 0, 7152);
INSERT INTO `tv_series_data` VALUES (6769808402, '反击美版第2季限时免费', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/15/s46520.jpg', 'https://tv.2345.com/detail/46520.html', 7.9, '战争', 0, 4071);
INSERT INTO `tv_series_data` VALUES (6774532930, '我是一棵小草', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/495/8fce0b57a1f2a7bb37efc0070502a307.jpg', 'https://tv.2345.com/detail/495.html', 9.2, '家庭', 0, 7654);
INSERT INTO `tv_series_data` VALUES (6777434613, '光荣之旅', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/18/s54578.jpg', 'https://tv.2345.com/detail/54578.html', 9.3, '战争', 0, 3222);
INSERT INTO `tv_series_data` VALUES (6778693080, '老爸当家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/17/s52404.jpg?1483426564', 'https://tv.2345.com/detail/52404.html', 8.9, '家庭', 0, 4542);
INSERT INTO `tv_series_data` VALUES (6778956281, '家经难念DVD', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/18/s54216.jpg', 'https://tv.2345.com/detail/54216.html', 7.7, '伦理', 0, 6115);
INSERT INTO `tv_series_data` VALUES (6780761383, '紧急链接', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/2/7460/02e43e1577fc1553bb785b8eda82732f.jpg', 'https://tv.2345.com/detail/7460.html', 8.7, '伦理', 0, 7979);
INSERT INTO `tv_series_data` VALUES (6785766763, '冷风暴', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/449611/1348833827/3e984f85faa1d93f8283451b73bdca58.jpg', 'https://tv.2345.com/detail/14999.html', 9, '战争', 0, 5422);
INSERT INTO `tv_series_data` VALUES (6788172955, '回家的路2005', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/19/s58857.jpg', 'https://tv.2345.com/detail/58857.html', 7.5, '家庭', 0, 4943);
INSERT INTO `tv_series_data` VALUES (6790619391, '战火中的兄弟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/17/s52532.jpg?1484807428', 'https://tv.2345.com/detail/52532.html', 8.1, '战争', 0, 4800);
INSERT INTO `tv_series_data` VALUES (6790846240, '冬日惊雷TV版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/8/s26530.jpg?1410421396', 'https://tv.2345.com/detail/26530.html', 8, '战争', 0, 7025);
INSERT INTO `tv_series_data` VALUES (6794155094, '金三角夺宝', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/11/s35603.jpg?1411115206', 'https://tv.2345.com/detail/35603.html', 7.9, '悬疑', 0, 5934);
INSERT INTO `tv_series_data` VALUES (6804388655, '我和我的他们', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/10/s32410.jpg?1396245439', 'https://tv.2345.com/detail/32410.html', 8.3, '家庭', 0, 5276);
INSERT INTO `tv_series_data` VALUES (6806689979, '边城汉子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/1712/05b5e495a9a92d31afede864189d052b.jpg', 'https://tv.2345.com/detail/1712.html', 8.9, '战争', 0, 7211);
INSERT INTO `tv_series_data` VALUES (6807291563, '兵团岁月', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/0/s896.jpg?1488851255', 'https://tv.2345.com/detail/896.html', 9.2, '战争', 0, 6578);
INSERT INTO `tv_series_data` VALUES (6808809918, '篱笆女人和狗', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/2/8385/786d3073e4085723a5afb043ca2e10a7.jpg', 'https://tv.2345.com/detail/8385.html', 8, '伦理', 0, 4626);
INSERT INTO `tv_series_data` VALUES (6810110056, '江南锄奸', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/1464/ba0450caadf685ce8260c46384297a48.jpg', 'https://tv.2345.com/detail/1464.html', 9.5, '军旅', 0, 7212);
INSERT INTO `tv_series_data` VALUES (6811518029, '不能没有你', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/1/3301/4bb64cd333ca3393a58c39e5355d8ce1.jpg', 'https://tv.2345.com/detail/3301.html', 9, '家庭', 0, 3383);
INSERT INTO `tv_series_data` VALUES (6817085546, '平安扣', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/19/s59234.jpg', 'https://tv.2345.com/detail/59234.html', 8.8, '悬疑', 0, 3111);
INSERT INTO `tv_series_data` VALUES (6818036663, '德雷尔一家第二季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/18/s54954.jpg', 'https://tv.2345.com/detail/54954.html', 7, '其他', 0, 5335);
INSERT INTO `tv_series_data` VALUES (6818197946, '天阵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/1985/6e7fc582bf1d41c2d632a37749e3c63b.jpg', 'https://tv.2345.com/detail/1985.html', 8, '战争', 0, 6655);
INSERT INTO `tv_series_data` VALUES (6818869549, '灵魂交易', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/17/s52041.jpg', 'https://tv.2345.com/detail/52041.html', 8.1, '家庭', 0, 4777);
INSERT INTO `tv_series_data` VALUES (6819000203, '烽火孤儿', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/2607/c80bbc7f62c7ed22d65423e5e06ec3d1.jpg', 'https://tv.2345.com/detail/2607.html', 9.1, '战争', 0, 5373);
INSERT INTO `tv_series_data` VALUES (6819108280, '寒山令', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/16/s50365.jpg?1476768280', 'https://tv.2345.com/detail/50365.html', 8.1, '战争', 0, 3643);
INSERT INTO `tv_series_data` VALUES (6821266862, '壮志凌云', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/8/s24768.jpg?1410421273', 'https://tv.2345.com/detail/24768.html', 9.2, '战争', 0, 7343);
INSERT INTO `tv_series_data` VALUES (6823658243, '十三省', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/131/7b212422b77e43a22ccab6a62054a03d.jpg', 'https://tv.2345.com/detail/131.html', 9.5, '战争', 0, 3270);
INSERT INTO `tv_series_data` VALUES (6824231326, '国家命运', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/5/s15626.jpg?1501134798', 'https://tv.2345.com/detail/15626.html', 9.4, '军旅', 0, 4630);
INSERT INTO `tv_series_data` VALUES (6826710984, '结发夫妻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/2409/s2409.jpg', 'https://tv.2345.com/detail/2409.html', 8.8, '家庭', 0, 5680);
INSERT INTO `tv_series_data` VALUES (6828063050, '昨日今夜', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/18/s56109.jpg', 'https://tv.2345.com/detail/56109.html', 9.8, '家庭', 0, 4552);
INSERT INTO `tv_series_data` VALUES (6832391241, '大丽家的往事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/2/7116/721c1d2bf5a3a06b29b7250e7eb6960e.jpg', 'https://tv.2345.com/detail/7116.html', 9, '伦理', 0, 4999);
INSERT INTO `tv_series_data` VALUES (6837349264, '红岩', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/1962/a618c0113e0781a9e28b92529b98b8a8.jpg', 'https://tv.2345.com/detail/1962.html', 9.3, '战争', 0, 3366);
INSERT INTO `tv_series_data` VALUES (6837632623, '长沙保卫战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/11/s33293.jpg?1418782411', 'https://tv.2345.com/detail/33293.html', 8.5, '战争', 0, 7491);
INSERT INTO `tv_series_data` VALUES (6839626778, '老伴', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/182/0de33bf7110a43f61cccb6ec3c3c2c32.jpg', 'https://tv.2345.com/detail/182.html', 9.5, '家庭', 0, 5289);
INSERT INTO `tv_series_data` VALUES (6842807410, '知足常乐', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/450393/1351181404/07a55d6b36c6ef84cb63704b5abf7215.jpg', 'https://tv.2345.com/detail/16158.html', 8.8, '家庭', 0, 6611);
INSERT INTO `tv_series_data` VALUES (6845565580, '硬骨头之绝地归途', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/18/s54749.jpg?1524638414', 'https://tv.2345.com/detail/54749.html', 8.8, '战争', 0, 3822);
INSERT INTO `tv_series_data` VALUES (6846218789, '小儿难养', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/3/c.jpg', 'https://tv.2345.com/detail/18694.html', 9.3, '伦理', 0, 7868);
INSERT INTO `tv_series_data` VALUES (6849515472, '顺娘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/2811/a6f320bad957c4f69175af47c89ba322.jpg', 'https://tv.2345.com/detail/2811.html', 8.8, '家庭', 0, 6253);
INSERT INTO `tv_series_data` VALUES (6851601567, '生死绝恋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/165/b37959ae8448460be4a1b5aa084af9bf.png', 'https://tv.2345.com/detail/165.html', 8.7, '伦理', 0, 6844);
INSERT INTO `tv_series_data` VALUES (6851913054, '兵变1938', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/1/4820/6fef3a2bbeffee851c137987dd4d1ccd.jpg', 'https://tv.2345.com/detail/4820.html', 8.8, '悬疑', 0, 5002);
INSERT INTO `tv_series_data` VALUES (6854989309, '男人的天堂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/1279/c5cf259e1cf54ca80cd3c4328129a815.jpg', 'https://tv.2345.com/detail/1279.html', 9.2, '家庭', 0, 4951);
INSERT INTO `tv_series_data` VALUES (6858387443, '白云飘飘的年代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/15/s47165.jpg?1443496023', 'https://tv.2345.com/detail/47165.html', 8.4, '战争', 0, 7317);
INSERT INTO `tv_series_data` VALUES (6861022791, '你是我的幸福', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/1/4313/2a1ce0fe4ab87d8363fe89bf5796832a.jpg', 'https://tv.2345.com/detail/4313.html', 9.4, '伦理', 0, 6027);
INSERT INTO `tv_series_data` VALUES (6863950743, '女监档案', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/2/s6948.jpg?1375781911', 'https://tv.2345.com/detail/6948.html', 8.8, '家庭', 0, 6630);
INSERT INTO `tv_series_data` VALUES (6868353605, '午夜谍影', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/15/s47557.jpg', 'https://tv.2345.com/detail/47557.html', 9.6, '战争', 0, 7634);
INSERT INTO `tv_series_data` VALUES (6870136562, '婚姻遇险记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/18/s55038.jpg', 'https://tv.2345.com/detail/55038.html', 8.9, '家庭', 0, 3369);
INSERT INTO `tv_series_data` VALUES (6872065534, '《什刹海》', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/19/s57751.jpg', 'https://tv.2345.com/detail/57751.html', 8.4, '家庭', 0, 4331);
INSERT INTO `tv_series_data` VALUES (6873408479, '法医秦明2清道夫', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/18/s54918.jpg', 'https://tv.2345.com/detail/54918.html', 8.2, '悬疑', 0, 6733);
INSERT INTO `tv_series_data` VALUES (6876346244, '江山', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/3/10168/4ae87d804b6d998fd7766a2f452199f7.jpg', 'https://tv.2345.com/detail/10168.html', 9.2, '战争', 0, 6854);
INSERT INTO `tv_series_data` VALUES (6878521490, '新乱世佳人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/2148/b7f99ad5bb3ef89fd8eee9cec5792399.jpg', 'https://tv.2345.com/detail/2148.html', 9.5, '家庭', 0, 6884);
INSERT INTO `tv_series_data` VALUES (6881676609, '奶娘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/1/s5245.jpg?1398414780', 'https://tv.2345.com/detail/5245.html', 8.8, '家庭', 0, 4484);
INSERT INTO `tv_series_data` VALUES (6883069957, '最后一枪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/4/b.jpg', 'https://tv.2345.com/detail/11634.html', 9.1, '战争', 0, 5387);
INSERT INTO `tv_series_data` VALUES (6883087228, '小小飞虎队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/2022/5b73fbdc31e14d284137c65b51094866.jpg', 'https://tv.2345.com/detail/2022.html', 9.5, '战争', 0, 5301);
INSERT INTO `tv_series_data` VALUES (6885331283, '隋唐英雄2未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/6/s18116.jpg?1410420391', 'https://tv.2345.com/detail/18116.html', 8.8, '战争', 0, 3684);
INSERT INTO `tv_series_data` VALUES (6891107649, '老严有女不愁嫁', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/3/f.jpg', 'https://tv.2345.com/detail/16401.html', 9.8, '家庭', 0, 4814);
INSERT INTO `tv_series_data` VALUES (6891724050, '猎鹰1949', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/37/67cf67bb00828b081e2e895eee6b125c.jpg', 'https://tv.2345.com/detail/37.html', 9.4, '悬疑', 0, 6152);
INSERT INTO `tv_series_data` VALUES (6895091523, '掩护', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/0/s901.jpg?1362647180', 'https://tv.2345.com/detail/901.html', 9.1, '军旅', 0, 3663);
INSERT INTO `tv_series_data` VALUES (6897989505, '烽火儿女情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/4/s12303.jpg?1367896300', 'https://tv.2345.com/detail/12303.html', 8.9, '家庭', 0, 6404);
INSERT INTO `tv_series_data` VALUES (6898599922, '军统枪口下的女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/3/s9032.jpg', 'https://tv.2345.com/detail/9032.html', 8.8, '战争', 0, 4439);
INSERT INTO `tv_series_data` VALUES (6904484730, '丑八怪警报', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/7/s21991.jpg?1369280444', 'https://tv.2345.com/detail/21991.html', 8.7, '家庭', 0, 7522);
INSERT INTO `tv_series_data` VALUES (6906611489, '刘少奇故事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/3/10191/1f932bc54e5ca4db4d018fecc5a5b994.jpg', 'https://tv.2345.com/detail/10191.html', 10, '战争', 0, 7399);
INSERT INTO `tv_series_data` VALUES (6908070616, '为爱而生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/180/5e0d28d1fdb8bf4067c9b1f3f7d333e1.jpg', 'https://tv.2345.com/detail/180.html', 8.7, '家庭', 0, 5164);
INSERT INTO `tv_series_data` VALUES (6911699818, '代号山豹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/20/s60862.jpg', 'https://tv.2345.com/detail/60862.html', 7.7, '战争', 0, 7397);
INSERT INTO `tv_series_data` VALUES (6912828165, '说好不分手', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/1814/bc1c6e3c74efeb39a295ecbfd732fbd0.jpg', 'https://tv.2345.com/detail/1814.html', 9, '家庭', 0, 5305);
INSERT INTO `tv_series_data` VALUES (6915697702, '养女', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/5/s16353.jpg?1396941551', 'https://tv.2345.com/detail/16353.html', 8.3, '伦理', 0, 5785);
INSERT INTO `tv_series_data` VALUES (6916814711, '大学生士兵的故事2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/6/19794/c4e15c546215ac5d277711f781f43f13.jpg', 'https://tv.2345.com/detail/19794.html', 8, '军旅', 0, 7070);
INSERT INTO `tv_series_data` VALUES (6917762771, '朝五晚九', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/19/s59251.jpg', 'https://tv.2345.com/detail/59251.html', 8.8, '家庭', 0, 4275);
INSERT INTO `tv_series_data` VALUES (6923383563, '驼道', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/372/s372.jpg', 'https://tv.2345.com/detail/372.html', 8.7, '家庭', 0, 6026);
INSERT INTO `tv_series_data` VALUES (6931666300, '猎豺狼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/18/s54559.jpg?1521430136', 'https://tv.2345.com/detail/54559.html', 8.9, '战争', 0, 7933);
INSERT INTO `tv_series_data` VALUES (6931731191, '战地黄花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/3/10272/2edeb68de502dc309c42dc898745416d.jpg', 'https://tv.2345.com/detail/10272.html', 9.2, '战争', 0, 3056);
INSERT INTO `tv_series_data` VALUES (6933374014, '让爱作主', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/2708/346e0885653b6132634c9333ccbfb0bb.jpg', 'https://tv.2345.com/detail/2708.html', 10, '伦理', 0, 4952);
INSERT INTO `tv_series_data` VALUES (6937225183, '永不回头2001版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/18/s55439.jpg', 'https://tv.2345.com/detail/55439.html', 9.1, '家庭', 0, 5516);
INSERT INTO `tv_series_data` VALUES (6937285615, '神探夏洛克第1季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/1/5492/55fd96b51df53b9051421443e130b4c3.jpg', 'https://tv.2345.com/detail/5492.html', 9.8, '悬疑', 0, 3419);
INSERT INTO `tv_series_data` VALUES (6938244240, '微笑妈妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/2184/fde1529332d980e9dc7df9ada45c3768.png', 'https://tv.2345.com/detail/2184.html', 10, '家庭', 0, 5231);
INSERT INTO `tv_series_data` VALUES (6942045546, '常回家看看', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/1161/23e14803ae8b54f7421fcfdd2c6db37c.jpg', 'https://tv.2345.com/detail/1161.html', 10, '家庭', 0, 5469);
INSERT INTO `tv_series_data` VALUES (6945844845, '激情燃烧的岁月2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/1606/9f472296a47ef61083d40afb2f865021.jpg', 'https://tv.2345.com/detail/1606.html', 8.7, '军旅', 0, 6181);
INSERT INTO `tv_series_data` VALUES (6950074269, '这群汉子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/12/s36132.jpg?1410421795', 'https://tv.2345.com/detail/36132.html', 8.8, '战争', 0, 5091);
INSERT INTO `tv_series_data` VALUES (6951663031, '复仇第4季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/14/s42102.jpg', 'https://tv.2345.com/detail/42102.html', 8.3, '伦理', 0, 3262);
INSERT INTO `tv_series_data` VALUES (6956952323, '林海雪原2017版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/17/s53252.jpg?1498443903', 'https://tv.2345.com/detail/53252.html', 8.7, '战争', 0, 3446);
INSERT INTO `tv_series_data` VALUES (6963128275, '军营芝麻官', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/2/6996/041856bb403e1d902a42f08abde7118a.jpg', 'https://tv.2345.com/detail/6996.html', 8.8, '战争', 0, 3425);
INSERT INTO `tv_series_data` VALUES (6964019071, '烈焰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/7/s22935.jpg?1371698340', 'https://tv.2345.com/detail/22935.html', 8.3, '家庭', 0, 4609);
INSERT INTO `tv_series_data` VALUES (6969899018, '杨光的快乐生活3', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/1463/fe75d69ce7d3a9b2657328e80bfba86f.jpg', 'https://tv.2345.com/detail/1463.html', 9.3, '家庭', 0, 3801);
INSERT INTO `tv_series_data` VALUES (6970745170, '错伏', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/9/s28202.jpg?1387377701', 'https://tv.2345.com/detail/28202.html', 8.5, '战争', 0, 5023);
INSERT INTO `tv_series_data` VALUES (6971773253, '我们的爱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/17/s52424.jpg?1484620833', 'https://tv.2345.com/detail/52424.html', 8.1, '家庭', 0, 6453);
INSERT INTO `tv_series_data` VALUES (6974780423, '麻雀春天', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/15/s45899.jpg', 'https://tv.2345.com/detail/45899.html', 8.2, '战争', 0, 3491);
INSERT INTO `tv_series_data` VALUES (6975273730, '妈妈向前冲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/15/s46576.jpg?1436161271', 'https://tv.2345.com/detail/46576.html', 8.5, '家庭', 0, 3150);
INSERT INTO `tv_series_data` VALUES (6975620093, '猜拳', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/15/s46021.jpg?1428391601', 'https://tv.2345.com/detail/46021.html', 8.3, '战争', 0, 7945);
INSERT INTO `tv_series_data` VALUES (6977217010, '朱家花园', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/727/35e4258c8004c9b3446fb307cb152559.jpg', 'https://tv.2345.com/detail/727.html', 10, '家庭', 0, 3743);
INSERT INTO `tv_series_data` VALUES (6977654248, '菜刀班尖刀连', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/15/s47356.jpg?1445999749', 'https://tv.2345.com/detail/47356.html', 8.4, '战争', 0, 3606);
INSERT INTO `tv_series_data` VALUES (6978711386, '当铺', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/0/s2578.jpg?1366102218', 'https://tv.2345.com/detail/2578.html', 8.5, '战争', 0, 7633);
INSERT INTO `tv_series_data` VALUES (6979708335, '战寇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/19/s58802.jpg', 'https://tv.2345.com/detail/58802.html', 8.8, '战争', 0, 3088);
INSERT INTO `tv_series_data` VALUES (6980854968, '四世同堂2007版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/0/s56.jpg?1418283922', 'https://tv.2345.com/detail/56.html', 7.7, '伦理', 0, 6519);
INSERT INTO `tv_series_data` VALUES (6981006969, '女囚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/226/e876d61d7693f1041b59ca312f9357f2.jpg', 'https://tv.2345.com/detail/226.html', 8.8, '家庭', 0, 7081);
INSERT INTO `tv_series_data` VALUES (6982163988, '悠悠寸草心2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/2/8255/ffc8d0f153e5c0bf2d463e43ef7951f1.jpg', 'https://tv.2345.com/detail/8255.html', 8.8, '家庭', 0, 6620);
INSERT INTO `tv_series_data` VALUES (6988651691, '上有老', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/171/f7257bfaca82f668474102f36054610f.jpg', 'https://tv.2345.com/detail/171.html', 10, '伦理', 0, 4394);
INSERT INTO `tv_series_data` VALUES (6994819880, '在一起电视剧', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/15/s47217.jpg', 'https://tv.2345.com/detail/47217.html', 7.4, '家庭', 0, 3258);
INSERT INTO `tv_series_data` VALUES (6994859559, '红莓花儿开', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/3/10150/e9910d3c1c6f9c25a303cb2ec32e5ff6.jpg', 'https://tv.2345.com/detail/10150.html', 9.4, '战争', 0, 5149);
INSERT INTO `tv_series_data` VALUES (6994973948, '洗冤录第1部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/7/s23919.jpg?1408003919', 'https://tv.2345.com/detail/23919.html', 6.1, '悬疑', 0, 4868);
INSERT INTO `tv_series_data` VALUES (6995841942, '绝战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/5/s16363.jpg?1385084624', 'https://tv.2345.com/detail/16363.html', 8.5, '战争', 0, 7227);
INSERT INTO `tv_series_data` VALUES (6998439603, '孤战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/17/s52369.jpg?1482720299', 'https://tv.2345.com/detail/52369.html', 8.6, '战争', 0, 4615);
INSERT INTO `tv_series_data` VALUES (7003607792, '捍卫者', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/5/s16097.jpg?1415342514', 'https://tv.2345.com/detail/16097.html', 8.9, '战争', 0, 3488);
INSERT INTO `tv_series_data` VALUES (7004020486, '无言的旅程', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/347/102f21d7ca7fa440d63681a79b9cb46c.jpg', 'https://tv.2345.com/detail/347.html', 8.7, '伦理', 0, 4931);
INSERT INTO `tv_series_data` VALUES (7005822075, '东风破', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/18/s54162.jpg', 'https://tv.2345.com/detail/54162.html', 8.9, '战争', 0, 7176);
INSERT INTO `tv_series_data` VALUES (7014654213, '浴血坚持', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/5/15935/21a5331acefcd001733cbbf0246a27bd.jpg', 'https://tv.2345.com/detail/15935.html', 9.3, '战争', 0, 3880);
INSERT INTO `tv_series_data` VALUES (7020426358, '新京华烟云', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/11/s33377.jpg?1399516853', 'https://tv.2345.com/detail/33377.html', 8.6, '家庭', 0, 3497);
INSERT INTO `tv_series_data` VALUES (7021321472, '保密局一九四九', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/16/s50322.jpg', 'https://tv.2345.com/detail/50322.html', 8.7, '战争', 0, 7702);
INSERT INTO `tv_series_data` VALUES (7021379159, '51号兵站', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/3/s9115.jpg', 'https://tv.2345.com/detail/9115.html', 9.3, '战争', 0, 7518);
INSERT INTO `tv_series_data` VALUES (7021758076, '红狐', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/17/s53361.jpg', 'https://tv.2345.com/detail/53361.html', 8.2, '战争', 0, 5756);
INSERT INTO `tv_series_data` VALUES (7023027398, '生死相依', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/7/s23907.jpg?1375068673', 'https://tv.2345.com/detail/23907.html', 8.1, '家庭', 0, 7635);
INSERT INTO `tv_series_data` VALUES (7025512685, '春去春又回大陆版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/1967/7f36d2ba9fe8233e66af0aa560ca7560.jpg', 'https://tv.2345.com/detail/1967.html', 9.3, '伦理', 0, 4992);
INSERT INTO `tv_series_data` VALUES (7025982132, '禁区', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/0/s88.jpg?1502698571', 'https://tv.2345.com/detail/88.html', 8.2, '家庭', 0, 4428);
INSERT INTO `tv_series_data` VALUES (7031607061, '红色娘子军电视剧', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/15/s47052.jpg', 'https://tv.2345.com/detail/47052.html', 7.8, '战争', 0, 5104);
INSERT INTO `tv_series_data` VALUES (7046065779, '牌坊下的女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/172/265f6241c44588bc029cd82fbebb70ab.jpg', 'https://tv.2345.com/detail/172.html', 9, '家庭', 0, 6278);
INSERT INTO `tv_series_data` VALUES (7046132526, '火蓝刀锋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/5/s15500.jpg?1483498560', 'https://tv.2345.com/detail/15500.html', 9.7, '悬疑', 0, 4087);
INSERT INTO `tv_series_data` VALUES (7046951835, '插树岭', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/2/s8523.jpg?1488265409', 'https://tv.2345.com/detail/8523.html', 8.9, '伦理', 0, 4980);
INSERT INTO `tv_series_data` VALUES (7048073452, '刷新3+7', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/450464/1351393806/ab58c9c8d0eb5a03074bd6c1bc0beb63.jpg', 'https://tv.2345.com/detail/16225.html', 9.2, '家庭', 0, 6259);
INSERT INTO `tv_series_data` VALUES (7050132367, '红', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/20/s61272.jpg', 'https://tv.2345.com/detail/61272.html', 7.8, '战争', 0, 3373);
INSERT INTO `tv_series_data` VALUES (7051349160, '暖秋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/636/621f9f18dca133434cf5724d1a9e117a.jpg', 'https://tv.2345.com/detail/636.html', 8.8, '伦理', 0, 3032);
INSERT INTO `tv_series_data` VALUES (7057142453, '有你才幸福', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/5/s15930.jpg?1365827912', 'https://tv.2345.com/detail/15930.html', 8.8, '家庭', 0, 7713);
INSERT INTO `tv_series_data` VALUES (7057526482, '欢喜亲家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/87/f95a0582a5197e0d8b6134cdb8f97b0f.jpg', 'https://tv.2345.com/detail/87.html', 10, '家庭', 0, 4628);
INSERT INTO `tv_series_data` VALUES (7059047208, '亲爱的回家DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/18/s55468.jpg', 'https://tv.2345.com/detail/55468.html', 8.1, '家庭', 0, 3745);
INSERT INTO `tv_series_data` VALUES (7059868212, '天阵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/1985/6e7fc582bf1d41c2d632a37749e3c63b.jpg', 'https://tv.2345.com/detail/1985.html', 8, '军旅', 0, 7889);
INSERT INTO `tv_series_data` VALUES (7060002486, '大爱无敌', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/0/s504.jpg?1363252239', 'https://tv.2345.com/detail/504.html', 9.2, '家庭', 0, 3565);
INSERT INTO `tv_series_data` VALUES (7061683919, '我的前半生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/17/s53246.jpg?1499651459', 'https://tv.2345.com/detail/53246.html', 8.7, '家庭', 0, 6070);
INSERT INTO `tv_series_data` VALUES (7067633674, '我的丑爹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/777/81f72bd530150a27f831eb956785b1b5.jpg', 'https://tv.2345.com/detail/777.html', 8.5, '家庭', 0, 7042);
INSERT INTO `tv_series_data` VALUES (7073903888, '迷失洛杉矶', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/1261/de7a5ca8d938daaabf8135cbe8b29d39.jpg', 'https://tv.2345.com/detail/1261.html', 9, '家庭', 0, 5522);
INSERT INTO `tv_series_data` VALUES (7076713930, '不思异谜人谜事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/19/s59058.jpg', 'https://tv.2345.com/detail/59058.html', 7.9, '悬疑', 0, 3855);
INSERT INTO `tv_series_data` VALUES (7079339466, '在劫难逃', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/19/s57890.jpg', 'https://tv.2345.com/detail/57890.html', 9.5, '悬疑', 0, 6258);
INSERT INTO `tv_series_data` VALUES (7080060593, '渴望', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/352/f7edf60140df64d4269dbeb52c5cc0c5.jpg', 'https://tv.2345.com/detail/352.html', 9.5, '家庭', 0, 6340);
INSERT INTO `tv_series_data` VALUES (7086456631, '心不再遥远', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/2/7884/733ce015a76a6da324f00d869af605a6.jpg', 'https://tv.2345.com/detail/7884.html', 8.7, '伦理', 0, 6292);
INSERT INTO `tv_series_data` VALUES (7090702562, '黄河浪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/2/6493/8e96f070c0ecbe845d4744804c2e5dcb.jpg', 'https://tv.2345.com/detail/6493.html', 8.8, '战争', 0, 5961);
INSERT INTO `tv_series_data` VALUES (7090947908, '后宫', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/1/5682/103459f2575218886c1e24642d971eb9.jpg', 'https://tv.2345.com/detail/5682.html', 8.8, '悬疑', 0, 6544);
INSERT INTO `tv_series_data` VALUES (7098365149, '无法攻略的女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/20/s61220.jpg', 'https://tv.2345.com/detail/61220.html', 8, '悬疑', 0, 6511);
INSERT INTO `tv_series_data` VALUES (7098548082, '雾都魅影', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/319/ebc2e5499741303d8a4d179e3bbe82e7.jpg', 'https://tv.2345.com/detail/319.html', 8.8, '战争', 0, 5537);
INSERT INTO `tv_series_data` VALUES (7101493348, '东北抗日联军', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/15/s46586.jpg?1436235824', 'https://tv.2345.com/detail/46586.html', 8.4, '战争', 0, 4595);
INSERT INTO `tv_series_data` VALUES (7102773280, '黑色名单', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/748/5ec4045fd0744993eb55f63eec6277f2.jpg', 'https://tv.2345.com/detail/748.html', 10, '悬疑', 0, 5782);
INSERT INTO `tv_series_data` VALUES (7104973901, '满山打鬼子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/17/s52911.jpg', 'https://tv.2345.com/detail/52911.html', 8, '战争', 0, 5628);
INSERT INTO `tv_series_data` VALUES (7109775339, '静静的白桦林', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/3/10174/b8f02f3961dd5c1373c9852edb8fdd3a.jpg', 'https://tv.2345.com/detail/10174.html', 7.4, '家庭', 0, 6424);
INSERT INTO `tv_series_data` VALUES (7116247860, '都叫我三妹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/2/6949/291465f85f910576da040aebc1fb37e3.jpg', 'https://tv.2345.com/detail/6949.html', 8.7, '家庭', 0, 3327);
INSERT INTO `tv_series_data` VALUES (7119191615, '夺粮剿匪记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/0/s1892.jpg?1420688965', 'https://tv.2345.com/detail/1892.html', 8.7, '战争', 0, 6188);
INSERT INTO `tv_series_data` VALUES (7119275570, '漂亮主妇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/4/3.jpg', 'https://tv.2345.com/detail/18433.html', 9.2, '伦理', 0, 7688);
INSERT INTO `tv_series_data` VALUES (7120207475, '幸福的旅程', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/7/s22267.jpg?1369970196', 'https://tv.2345.com/detail/22267.html', 8.5, '家庭', 0, 3788);
INSERT INTO `tv_series_data` VALUES (7122969637, '玻钻之争', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/1/s3891.jpg', 'https://tv.2345.com/detail/3891.html', 9, '伦理', 0, 3446);
INSERT INTO `tv_series_data` VALUES (7128378456, '福将军', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/9/s29350.jpg?1390799919', 'https://tv.2345.com/detail/29350.html', 8.2, '战争', 0, 6021);
INSERT INTO `tv_series_data` VALUES (7130902045, '都市外乡人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/2/8382/304c124102f3a2c87ff48a624080a611.jpg', 'https://tv.2345.com/detail/8382.html', 10, '伦理', 0, 6812);
INSERT INTO `tv_series_data` VALUES (7133641619, '战火大金脉', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/7/s22536.jpg?1407405300', 'https://tv.2345.com/detail/22536.html', 6.9, '战争', 0, 6487);
INSERT INTO `tv_series_data` VALUES (7134628351, '危情杜鹃', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/14/s43108.jpg', 'https://tv.2345.com/detail/43108.html', 7.5, '家庭', 0, 4636);
INSERT INTO `tv_series_data` VALUES (7135701711, '新结婚时代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/200/8f4bf28c087fcdce62d8b8c91923e6a7.jpg', 'https://tv.2345.com/detail/200.html', 9.3, '家庭', 0, 4586);
INSERT INTO `tv_series_data` VALUES (7136851954, '爱在战火纷飞时', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/1/3150/2f7c793dad00185ca306945702ef48d4.jpg', 'https://tv.2345.com/detail/3150.html', 9.1, '战争', 0, 7962);
INSERT INTO `tv_series_data` VALUES (7137712834, '锻刀', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/16/s50227.jpg?1475055534', 'https://tv.2345.com/detail/50227.html', 8.4, '战争', 0, 7749);
INSERT INTO `tv_series_data` VALUES (7138951620, '尚道我们上学去', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/1290/6116fc7ac750890a38b1ced194421682.jpg', 'https://tv.2345.com/detail/1290.html', 8.6, '家庭', 0, 3574);
INSERT INTO `tv_series_data` VALUES (7142993492, '新乱世佳人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/2148/b7f99ad5bb3ef89fd8eee9cec5792399.jpg', 'https://tv.2345.com/detail/2148.html', 9.5, '战争', 0, 6043);
INSERT INTO `tv_series_data` VALUES (7143990264, '完美新娘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/3/s11127.jpg?1389315558', 'https://tv.2345.com/detail/11127.html', 8.6, '家庭', 0, 5137);
INSERT INTO `tv_series_data` VALUES (7145734971, '独生子女的婆婆妈妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/a/19294.jpg', 'https://tv.2345.com/detail/19294.html', 8.9, '伦理', 0, 7022);
INSERT INTO `tv_series_data` VALUES (7149374251, '致命关系', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/19/s58828.jpg', 'https://tv.2345.com/detail/58828.html', 9.6, '家庭', 0, 4802);
INSERT INTO `tv_series_data` VALUES (7149951007, '逗吧逗把街日播版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/16/s49188.jpg', 'https://tv.2345.com/detail/49188.html', 8.8, '家庭', 0, 6377);
INSERT INTO `tv_series_data` VALUES (7150343618, '淘气包马小跳', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/915/s915.jpg', 'https://tv.2345.com/detail/915.html', 8.7, '战争', 0, 3190);
INSERT INTO `tv_series_data` VALUES (7157371611, '千里难寻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/375/5c86f331cef4ed7f0ec0de2f2c809033.jpg', 'https://tv.2345.com/detail/375.html', 9.5, '伦理', 0, 6395);
INSERT INTO `tv_series_data` VALUES (7157833990, '告密者', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/0/s942.jpg?1366105431', 'https://tv.2345.com/detail/942.html', 8.2, '悬疑', 0, 4654);
INSERT INTO `tv_series_data` VALUES (7158248183, '你是我的亲人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/11/s33387.jpg', 'https://tv.2345.com/detail/33387.html', 9.2, '家庭', 0, 4866);
INSERT INTO `tv_series_data` VALUES (7161299153, '假面', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/15/s46421.jpg', 'https://tv.2345.com/detail/46421.html', 8.3, '家庭', 0, 5041);
INSERT INTO `tv_series_data` VALUES (7162020663, '廖家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/2/7507/fdbaed51a2bb8499df67732ea4f5f7e1.jpg', 'https://tv.2345.com/detail/7507.html', 8.7, '家庭', 0, 5214);
INSERT INTO `tv_series_data` VALUES (7162186339, '左手劈刀', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/15/s46864.jpg?1457405115', 'https://tv.2345.com/detail/46864.html', 8.5, '战争', 0, 6687);
INSERT INTO `tv_series_data` VALUES (7164534841, '绝地枪王', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/14/s42545.jpg?1414639381', 'https://tv.2345.com/detail/42545.html', 9.1, '战争', 0, 7265);
INSERT INTO `tv_series_data` VALUES (7165013844, '我要你幸福', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/0/s2202.jpg?1409564339', 'https://tv.2345.com/detail/2202.html', 8, '家庭', 0, 6404);
INSERT INTO `tv_series_data` VALUES (7165355965, '永不消逝的电波电视剧', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/17/s53810.jpg', 'https://tv.2345.com/detail/53810.html', 7.6, '战争', 0, 7518);
INSERT INTO `tv_series_data` VALUES (7166712453, '锻刀之绝地重生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/19/s57023.jpg', 'https://tv.2345.com/detail/57023.html', 7.8, '战争', 0, 3450);
INSERT INTO `tv_series_data` VALUES (7169789871, '像童话一样', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/6/s20250.jpg?1363658368', 'https://tv.2345.com/detail/20250.html', 8.5, '家庭', 0, 4930);
INSERT INTO `tv_series_data` VALUES (7172399674, '猎狼人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/18/s54535.jpg', 'https://tv.2345.com/detail/54535.html', 8.8, '战争', 0, 7248);
INSERT INTO `tv_series_data` VALUES (7172979299, '完美伴侣DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/20/s61301.jpg', 'https://tv.2345.com/detail/61301.html', 8.8, '家庭', 0, 6761);
INSERT INTO `tv_series_data` VALUES (7175964806, '新四军女兵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/1/s4054.jpg', 'https://tv.2345.com/detail/4054.html', 8.6, '战争', 0, 6350);
INSERT INTO `tv_series_data` VALUES (7176445401, '再婚进行时', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/3/s9151.jpg', 'https://tv.2345.com/detail/9151.html', 9.1, '伦理', 0, 4499);
INSERT INTO `tv_series_data` VALUES (7178021187, '家有儿女2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/f/7.jpg', 'https://tv.2345.com/detail/1115.html', 9.6, '家庭', 0, 6801);
INSERT INTO `tv_series_data` VALUES (7180468276, '军刺', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/19/s59201.jpg', 'https://tv.2345.com/detail/59201.html', 7.4, '战争', 0, 7477);
INSERT INTO `tv_series_data` VALUES (7182867009, '别让我看见', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/15/s45149.jpg?1422858696', 'https://tv.2345.com/detail/45149.html', 8.4, '家庭', 0, 5620);
INSERT INTO `tv_series_data` VALUES (7184355264, '无情的爱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/2/s6904.jpg?1410419752', 'https://tv.2345.com/detail/6904.html', 8.7, '家庭', 0, 6584);
INSERT INTO `tv_series_data` VALUES (7186491397, '渴望城市', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/14/s44798.jpg', 'https://tv.2345.com/detail/44798.html', 7.3, '家庭', 0, 4164);
INSERT INTO `tv_series_data` VALUES (7194720726, '战争不相信眼泪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/d/6.jpg', 'https://tv.2345.com/detail/12267.html', 9.1, '战争', 0, 5352);
INSERT INTO `tv_series_data` VALUES (7198313750, '婚姻诊断', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/328/0b736a98f63a0c4917762c1211893ffe.jpg', 'https://tv.2345.com/detail/328.html', 10, '家庭', 0, 4389);
INSERT INTO `tv_series_data` VALUES (7201622760, '狼烟遍地', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/9/s29602.jpg?1392337978', 'https://tv.2345.com/detail/29602.html', 8.5, '悬疑', 0, 3627);
INSERT INTO `tv_series_data` VALUES (7203565704, '乱世危情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/19/s59052.jpg', 'https://tv.2345.com/detail/59052.html', 8.2, '战争', 0, 6777);
INSERT INTO `tv_series_data` VALUES (7203856048, '罗斯坎普中东危机', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/15/s45461.jpg', 'https://tv.2345.com/detail/45461.html', 7.5, '其他', 0, 6060);
INSERT INTO `tv_series_data` VALUES (7204643883, '风雨沙坡头', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/2239/2c095ef1fe74a0f437c6a8d793b921cb.jpg', 'https://tv.2345.com/detail/2239.html', 8.9, '军旅', 0, 7501);
INSERT INTO `tv_series_data` VALUES (7204937250, '铁道游击队2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/2/s8567.jpg?1364871970', 'https://tv.2345.com/detail/8567.html', 8.5, '战争', 0, 4534);
INSERT INTO `tv_series_data` VALUES (7208885473, '空巷子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/118/6e42724d29f01a57d3a3665b3b531bf1.jpg', 'https://tv.2345.com/detail/118.html', 9.4, '家庭', 0, 7130);
INSERT INTO `tv_series_data` VALUES (7212013054, '风华正茂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/2172/s2172.jpg', 'https://tv.2345.com/detail/2172.html', 6.1, '战争', 0, 7011);
INSERT INTO `tv_series_data` VALUES (7213103992, '民国往事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/1638/23237a93cb57192e00a8338f9ebcc119.png', 'https://tv.2345.com/detail/1638.html', 9.3, '战争', 0, 5060);
INSERT INTO `tv_series_data` VALUES (7219531797, '希望使命', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/17/s52449.jpg?1483414246', 'https://tv.2345.com/detail/52449.html', 8.1, '战争', 0, 7457);
INSERT INTO `tv_series_data` VALUES (7227376489, '空降利刃', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/18/s56434.jpg?1564646200', 'https://tv.2345.com/detail/56434.html', 9.2, '战争', 0, 4453);
INSERT INTO `tv_series_data` VALUES (7230115390, '外来媳妇本地郎第一部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/18/s56780.jpg', 'https://tv.2345.com/detail/56780.html', 7, '家庭', 0, 3482);
INSERT INTO `tv_series_data` VALUES (7233968583, '生活秀', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/2363/s2363.jpg', 'https://tv.2345.com/detail/2363.html', 9.4, '伦理', 0, 6478);
INSERT INTO `tv_series_data` VALUES (7238182231, '喵不可言', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/20/s61302.jpg', 'https://tv.2345.com/detail/61302.html', 9.8, '悬疑', 0, 3483);
INSERT INTO `tv_series_data` VALUES (7240542280, '利刃出击', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/18/s54498.jpg', 'https://tv.2345.com/detail/54498.html', 9.2, '战争', 0, 4531);
INSERT INTO `tv_series_data` VALUES (7241246858, '延安爱情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/756/e7ce7a362dae1d086e97b3d93a7c63dc.jpg', 'https://tv.2345.com/detail/756.html', 9.6, '战争', 0, 3749);
INSERT INTO `tv_series_data` VALUES (7257945008, '双枪李向阳', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/3/9134/72f8e813862aaa0f32017c7041483f64.jpg', 'https://tv.2345.com/detail/9134.html', 9.1, '战争', 0, 6740);
INSERT INTO `tv_series_data` VALUES (7258379011, '我们的队伍向太阳', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/1406/s1406.jpg', 'https://tv.2345.com/detail/1406.html', 9, '战争', 0, 3213);
INSERT INTO `tv_series_data` VALUES (7259855262, '乔省长和他的女儿们', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/3/9620/ea63ff0682a3ecc874f88d315d8ba176.jpg', 'https://tv.2345.com/detail/9620.html', 10, '伦理', 0, 4716);
INSERT INTO `tv_series_data` VALUES (7266447072, '撞车', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/231/6944699967e39efdb32122e8b157c8ec.jpg', 'https://tv.2345.com/detail/231.html', 8.7, '伦理', 0, 7449);
INSERT INTO `tv_series_data` VALUES (7274717039, '突围突围', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/15/s45868.jpg?1426490291', 'https://tv.2345.com/detail/45868.html', 8, '战争', 0, 3730);
INSERT INTO `tv_series_data` VALUES (7275049849, '青春六人行', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/1/s3323.jpg?1463998211', 'https://tv.2345.com/detail/3323.html', 7.8, '伦理', 0, 7371);
INSERT INTO `tv_series_data` VALUES (7281490962, '以朋友的名义', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/2739/42f2cdc648a72f8d239cec77eff33348.jpg', 'https://tv.2345.com/detail/2739.html', 9.4, '伦理', 0, 5627);
INSERT INTO `tv_series_data` VALUES (7283413187, '江照黎明黎明将至版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/20/s61381.jpg', 'https://tv.2345.com/detail/61381.html', 7.9, '悬疑', 0, 3742);
INSERT INTO `tv_series_data` VALUES (7284716454, '憨豆先生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/3/9184/54d899ad5588ef48500256b42590f93e.jpg', 'https://tv.2345.com/detail/9184.html', 8, '家庭', 1, 7912);
INSERT INTO `tv_series_data` VALUES (7285048463, '婚后三十年', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/1459/6d1f0d31921573bc765a2b8dd28c8607.jpg', 'https://tv.2345.com/detail/1459.html', 8.8, '家庭', 0, 4109);
INSERT INTO `tv_series_data` VALUES (7293074961, '维和步兵营', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/17/s53702.jpg?1505717365', 'https://tv.2345.com/detail/53702.html', 9.5, '战争', 0, 3981);
INSERT INTO `tv_series_data` VALUES (7297686872, '监狱家庭', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/15/s45458.jpg', 'https://tv.2345.com/detail/45458.html', 7.5, '其他', 0, 7124);
INSERT INTO `tv_series_data` VALUES (7304079897, '光荣岁月', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/1993/3ef9f42cd00f859403a49757a9008e26.jpg', 'https://tv.2345.com/detail/1993.html', 9.2, '战争', 0, 6111);
INSERT INTO `tv_series_data` VALUES (7305019206, '离婚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/4/a.jpg', 'https://tv.2345.com/detail/1417.html', 9.1, '家庭', 0, 7889);
INSERT INTO `tv_series_data` VALUES (7308700929, '我们俩的婚姻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/582/ae082dacb1f332da602a3db0bd4beac4.jpg', 'https://tv.2345.com/detail/582.html', 9.2, '家庭', 0, 5581);
INSERT INTO `tv_series_data` VALUES (7309936865, '爱你不放手', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/15/s45306.jpg?1421207416', 'https://tv.2345.com/detail/45306.html', 8.5, '伦理', 0, 4064);
INSERT INTO `tv_series_data` VALUES (7310164775, '家有一老', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/15/s45653.jpg?1423819176', 'https://tv.2345.com/detail/45653.html', 7.8, '家庭', 0, 3425);
INSERT INTO `tv_series_data` VALUES (7312660999, '蓝色三环', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/212/s212.jpg', 'https://tv.2345.com/detail/212.html', 8.7, '战争', 0, 7540);
INSERT INTO `tv_series_data` VALUES (7317722194, '少共国际师', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/19/s59073.jpg', 'https://tv.2345.com/detail/59073.html', 8.7, '战争', 0, 3737);
INSERT INTO `tv_series_data` VALUES (7318628632, '密使2之江都谍影', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/11/s35491.jpg?1400492468', 'https://tv.2345.com/detail/35491.html', 8.4, '战争', 0, 5753);
INSERT INTO `tv_series_data` VALUES (7320761361, '篱笆女人和狗', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/2/8385/786d3073e4085723a5afb043ca2e10a7.jpg', 'https://tv.2345.com/detail/8385.html', 8, '家庭', 0, 3989);
INSERT INTO `tv_series_data` VALUES (7322741280, '娘妻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/1508/bf9682d6deccb2bdb457432f02751412.jpg', 'https://tv.2345.com/detail/1508.html', 8.9, '家庭', 0, 3866);
INSERT INTO `tv_series_data` VALUES (7329254429, '婆媳的战国时代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/15/s45983.jpg?1427770155', 'https://tv.2345.com/detail/45983.html', 8.4, '家庭', 0, 3815);
INSERT INTO `tv_series_data` VALUES (7331235550, '兵心依旧', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/1/3256/d4eef4e6e3aa8acb5d072b06ea590f29.jpg', 'https://tv.2345.com/detail/3256.html', 8.7, '战争', 0, 6617);
INSERT INTO `tv_series_data` VALUES (7332875123, '大丫鬟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/346/9dc5448471759403c64eaa2ff02b537a.jpg', 'https://tv.2345.com/detail/346.html', 9.1, '伦理', 0, 6128);
INSERT INTO `tv_series_data` VALUES (7334942109, '苏菲的供词', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/114/461872b58a88648d0e275192ed1f3e38.jpg', 'https://tv.2345.com/detail/114.html', 10, '家庭', 0, 4277);
INSERT INTO `tv_series_data` VALUES (7338058453, '铁血茶城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/18/s56164.jpg', 'https://tv.2345.com/detail/56164.html', 8.1, '战争', 0, 6840);
INSERT INTO `tv_series_data` VALUES (7338638037, '乡村爱情5', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/2/7638/05ce7e3a7c4f3223fe5260224a2887e4.jpg', 'https://tv.2345.com/detail/7638.html', 8.8, '家庭', 0, 5966);
INSERT INTO `tv_series_data` VALUES (7342745961, '谎言背后', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/11/s34517.jpg?1398239100', 'https://tv.2345.com/detail/34517.html', 7.8, '家庭', 0, 3962);
INSERT INTO `tv_series_data` VALUES (7344180550, '铁甲舰上的男人们未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/15/s46590.jpg', 'https://tv.2345.com/detail/46590.html', 8.9, '战争', 0, 5385);
INSERT INTO `tv_series_data` VALUES (7346777374, '我的妈妈是天使', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/5/s17856.jpg?1367892711', 'https://tv.2345.com/detail/17856.html', 8.6, '伦理', 0, 4561);
INSERT INTO `tv_series_data` VALUES (7349094254, '叶挺将军', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/1/5311/e4a7dbb67cb5ac9b4a8dd5997e36db00.jpg', 'https://tv.2345.com/detail/5311.html', 10, '战争', 0, 5064);
INSERT INTO `tv_series_data` VALUES (7353828862, '冤家夫妻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/2/s6827.jpg', 'https://tv.2345.com/detail/6827.html', 6.7, '伦理', 0, 3034);
INSERT INTO `tv_series_data` VALUES (7354138134, '嘉庆皇帝', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/1/4597/3252f9edca5ef746bef75ad165e24655.jpg', 'https://tv.2345.com/detail/4597.html', 6.3, '战争', 0, 7557);
INSERT INTO `tv_series_data` VALUES (7357806357, '耳光响亮', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/4/12350/bcf374badefc1d46d81e3c486868ee6a.jpg', 'https://tv.2345.com/detail/12350.html', 9.2, '家庭', 0, 6659);
INSERT INTO `tv_series_data` VALUES (7358827830, '真爱诺言', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/1/3109/56953e6c7365ca9c98143f8a0c1ebd76.jpg', 'https://tv.2345.com/detail/3109.html', 10, '伦理', 0, 4114);
INSERT INTO `tv_series_data` VALUES (7359639787, '银杏飘落', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/1/5077/2096686c586a7edb11cbdd45e42a2374.jpg', 'https://tv.2345.com/detail/5077.html', 10, '伦理', 0, 5461);
INSERT INTO `tv_series_data` VALUES (7361882516, '滇西往事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/16/s50233.jpg', 'https://tv.2345.com/detail/50233.html', 8.7, '战争', 0, 3526);
INSERT INTO `tv_series_data` VALUES (7362771449, '前世今生姜武版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/2349/9eade653495598adb49a379cafaebabb.jpg', 'https://tv.2345.com/detail/2349.html', 8, '伦理', 0, 4438);
INSERT INTO `tv_series_data` VALUES (7366957488, '烽火英雄传未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/15/s46229.jpg', 'https://tv.2345.com/detail/46229.html', 7.3, '战争', 0, 3180);
INSERT INTO `tv_series_data` VALUES (7369059707, '雪珂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/2150/07603701be8016f50ad684034c29bc0b.jpg', 'https://tv.2345.com/detail/2150.html', 9.5, '家庭', 0, 6995);
INSERT INTO `tv_series_data` VALUES (7369449856, '香格里拉', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/1858/a7bec4f28fbc0cf23c34815bfd47a500.jpg', 'https://tv.2345.com/detail/1858.html', 9.4, '战争', 0, 3157);
INSERT INTO `tv_series_data` VALUES (7371342735, '因为有你', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/2912/164735d97a91086f7ac4a4f757b819cb.jpg', 'https://tv.2345.com/detail/2912.html', 9.2, '伦理', 0, 5955);
INSERT INTO `tv_series_data` VALUES (7372631654, '心理罪2三集版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/17/s52931.jpg', 'https://tv.2345.com/detail/52931.html', 8, '伦理', 0, 3560);
INSERT INTO `tv_series_data` VALUES (7380907085, '媳妇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/2/6823/381420a5ace53758902aea6f039fbca1.jpg', 'https://tv.2345.com/detail/6823.html', 8.8, '家庭', 0, 4357);
INSERT INTO `tv_series_data` VALUES (7382498989, '红樱剑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/18/s56361.jpg', 'https://tv.2345.com/detail/56361.html', 8.9, '战争', 0, 6907);
INSERT INTO `tv_series_data` VALUES (7390290751, '军医', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/140/e70856df254a92c7163188f04fd0892e.png', 'https://tv.2345.com/detail/140.html', 9, '军旅', 0, 6244);
INSERT INTO `tv_series_data` VALUES (7392050350, '铁血风尘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/19/s58292.jpg', 'https://tv.2345.com/detail/58292.html', 8.8, '战争', 0, 4637);
INSERT INTO `tv_series_data` VALUES (7399145658, '雪狼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/778/d66af90f0f1dccaa2d59da8d95e516db.jpg', 'https://tv.2345.com/detail/778.html', 8.8, '战争', 0, 5047);
INSERT INTO `tv_series_data` VALUES (7405890258, '中国地', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/2059/bf31291c6dd0dbe8e6c5c6b02da309ab.jpg', 'https://tv.2345.com/detail/2059.html', 8.9, '军旅', 0, 7381);
INSERT INTO `tv_series_data` VALUES (7406692308, '秘密追踪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/19/s59040.jpg', 'https://tv.2345.com/detail/59040.html', 9.7, '悬疑', 0, 7594);
INSERT INTO `tv_series_data` VALUES (7413510360, '马大帅2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/1623/s1623.jpg', 'https://tv.2345.com/detail/1623.html', 9, '家庭', 0, 6714);
INSERT INTO `tv_series_data` VALUES (7415492897, '红七军', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/2272/82158653588c1df91aee540fa592e4dc.jpg', 'https://tv.2345.com/detail/2272.html', 8.8, '战争', 0, 5650);
INSERT INTO `tv_series_data` VALUES (7417153972, '真情到永远', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/20/s61160.jpg', 'https://tv.2345.com/detail/61160.html', 9.3, '家庭', 0, 5713);
INSERT INTO `tv_series_data` VALUES (7418457001, '名门新娘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/2/6199/67ca54752ad0b3701966eb64bbe5e41c.jpg', 'https://tv.2345.com/detail/6199.html', 6.2, '家庭', 0, 6981);
INSERT INTO `tv_series_data` VALUES (7418822257, '潜梦追凶', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/19/s58785.png', 'https://tv.2345.com/detail/58785.html', 8.9, '悬疑', 0, 5942);
INSERT INTO `tv_series_data` VALUES (7420988651, '灵魂摆渡', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/9/s29963.jpg?1393565290', 'https://tv.2345.com/detail/29963.html', 8.3, '悬疑', 0, 5558);
INSERT INTO `tv_series_data` VALUES (7424502752, '少奇同志在安源', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/14/s44853.jpg', 'https://tv.2345.com/detail/44853.html', 7, '其他', 0, 5314);
INSERT INTO `tv_series_data` VALUES (7436268066, '谢文东1', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/11/s35616.jpg?1400482592', 'https://tv.2345.com/detail/35616.html', 8.3, '战争', 0, 5712);
INSERT INTO `tv_series_data` VALUES (7438310104, '天地男儿', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/1790/8bba9214f467c178e58ab1d5403a016a.jpg', 'https://tv.2345.com/detail/1790.html', 9.6, '家庭', 0, 6262);
INSERT INTO `tv_series_data` VALUES (7438434477, '浪漫的事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/2/8399/4253f75d71cf1b07064e5e2b2f178d33.jpg', 'https://tv.2345.com/detail/8399.html', 10, '家庭', 0, 4224);
INSERT INTO `tv_series_data` VALUES (7440116642, '女人无悔', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/164/68f9ae90cf34acc73be8e1b0f03341a6.jpg', 'https://tv.2345.com/detail/164.html', 8.1, '家庭', 0, 7981);
INSERT INTO `tv_series_data` VALUES (7442842765, '傻春', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/928/1517b11fc0485ee2526ec5d12d5b7ce6.jpg', 'https://tv.2345.com/detail/928.html', 9.4, '伦理', 0, 5509);
INSERT INTO `tv_series_data` VALUES (7446927538, '二胎时代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/15/s46699.jpg?1438239806', 'https://tv.2345.com/detail/46699.html', 8.5, '家庭', 0, 7821);
INSERT INTO `tv_series_data` VALUES (7447144233, '民族英雄马本斋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/1/s4999.jpg?1410419633', 'https://tv.2345.com/detail/4999.html', 8.8, '战争', 0, 4794);
INSERT INTO `tv_series_data` VALUES (7447972827, '亲爱的婚姻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/16/s49150.jpg?1558579157', 'https://tv.2345.com/detail/49150.html', 8.4, '家庭', 0, 7924);
INSERT INTO `tv_series_data` VALUES (7448614062, '全家福2010', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/7/1.jpg', 'https://tv.2345.com/detail/845.html', 9.5, '家庭', 0, 3724);
INSERT INTO `tv_series_data` VALUES (7450128711, '宝贝', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/7/s21066.jpg?1366355475', 'https://tv.2345.com/detail/21066.html', 8.8, '家庭', 0, 5068);
INSERT INTO `tv_series_data` VALUES (7457073576, '海啸', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/3/10161/62c809a5d9c141ca9dd4cad6175d5959.jpg', 'https://tv.2345.com/detail/10161.html', 8.7, '战争', 0, 3784);
INSERT INTO `tv_series_data` VALUES (7460518125, '婚变', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/216/46fa0631279104bae268d9e190741622.jpg', 'https://tv.2345.com/detail/216.html', 8.8, '家庭', 0, 6308);
INSERT INTO `tv_series_data` VALUES (7465730363, '岛城风云', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/4/s14054.jpg?1410420139', 'https://tv.2345.com/detail/14054.html', 8.8, '战争', 0, 6476);
INSERT INTO `tv_series_data` VALUES (7467381817, '绣娘兰馨', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/1844/1b1a28619c5964068b9bc8aeed710739.jpg', 'https://tv.2345.com/detail/1844.html', 9, '伦理', 0, 5919);
INSERT INTO `tv_series_data` VALUES (7468223447, '我是真的', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/1/5041/0aaba8dda3ef7b4666e38d4c792f86c4.jpg', 'https://tv.2345.com/detail/5041.html', 8.9, '战争', 0, 6126);
INSERT INTO `tv_series_data` VALUES (7468491334, '带上婆婆嫁', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/1615/s1615.jpg', 'https://tv.2345.com/detail/1615.html', 8.7, '家庭', 0, 6272);
INSERT INTO `tv_series_data` VALUES (7473183730, '墓道', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/2218/259e1a21e06f2e0d08618be1e1016725.jpg', 'https://tv.2345.com/detail/2218.html', 9.4, '悬疑', 0, 5010);
INSERT INTO `tv_series_data` VALUES (7480716904, '复婚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/391/52088ace8effc4ced453820b3c5942c6.jpg', 'https://tv.2345.com/detail/391.html', 8.7, '家庭', 0, 7252);
INSERT INTO `tv_series_data` VALUES (7481403629, '鲁南抗日游击队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/17/s53936.jpg', 'https://tv.2345.com/detail/53936.html', 9.8, '战争', 0, 6572);
INSERT INTO `tv_series_data` VALUES (7483993506, '纯真的年代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/8/s26689.jpg?1383183078', 'https://tv.2345.com/detail/26689.html', 8.5, '伦理', 0, 4686);
INSERT INTO `tv_series_data` VALUES (7487009151, '愤怒的天使', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/214/cf7642caa13e368578f6b018dcd98301.jpg', 'https://tv.2345.com/detail/214.html', 9.1, '战争', 0, 3150);
INSERT INTO `tv_series_data` VALUES (7488504506, '永不磨灭的番号', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/1/5348/39259866e2074e4aa2a366385fcca71b.jpg', 'https://tv.2345.com/detail/5348.html', 9.2, '战争', 0, 6042);
INSERT INTO `tv_series_data` VALUES (7490467965, '叫一声妈妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/105/5482decb1f9ea73c03aebe09fe94978e.jpg', 'https://tv.2345.com/detail/105.html', 9.2, '伦理', 0, 6191);
INSERT INTO `tv_series_data` VALUES (7494582941, '娘要嫁人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/6/s20486.jpg?1365314407', 'https://tv.2345.com/detail/20486.html', 9.2, '家庭', 0, 5728);
INSERT INTO `tv_series_data` VALUES (7497975470, '无间有爱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/1188/7213a1740b50dfd7d6a0dd4e6f0d4087.jpg', 'https://tv.2345.com/detail/1188.html', 9.4, '战争', 0, 7521);
INSERT INTO `tv_series_data` VALUES (7498834233, '军歌嘹亮', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/3/9749/6512c5b2e0939498f55162c4c4d8a0c7.jpg', 'https://tv.2345.com/detail/9749.html', 9.6, '战争', 0, 6901);
INSERT INTO `tv_series_data` VALUES (7500374879, '跨过鸭绿江', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/19/s58836.jpg', 'https://tv.2345.com/detail/58836.html', 8.4, '战争', 0, 6003);
INSERT INTO `tv_series_data` VALUES (7507847226, '老家门口唱大戏', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/8/s25765.jpg?1380250814', 'https://tv.2345.com/detail/25765.html', 8.1, '家庭', 0, 5937);
INSERT INTO `tv_series_data` VALUES (7509841351, '如此多娇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/3/10213/f10a363c43914a7280632b1d65f0dcd6.jpg', 'https://tv.2345.com/detail/10213.html', 9.4, '战争', 0, 6716);
INSERT INTO `tv_series_data` VALUES (7511156480, '冰锋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/19/s57818.jpg', 'https://tv.2345.com/detail/57818.html', 8.8, '战争', 0, 4059);
INSERT INTO `tv_series_data` VALUES (7511913510, '《黄金密码》', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/17/s52117.jpg', 'https://tv.2345.com/detail/52117.html', 8.1, '战争', 0, 3585);
INSERT INTO `tv_series_data` VALUES (7518195231, '炮神', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/16/s50919.jpg', 'https://tv.2345.com/detail/50919.html', 8.9, '军旅', 0, 7570);
INSERT INTO `tv_series_data` VALUES (7522227716, '说好不流泪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/10/s32966.jpg', 'https://tv.2345.com/detail/32966.html', 8.9, '家庭', 0, 4605);
INSERT INTO `tv_series_data` VALUES (7523727422, '记忆之城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/7/7.jpg', 'https://tv.2345.com/detail/17329.html', 9.6, '战争', 0, 5763);
INSERT INTO `tv_series_data` VALUES (7526395033, '军中红舞鞋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/7/s23550.jpg?1373866415', 'https://tv.2345.com/detail/23550.html', 7.6, '战争', 0, 4163);
INSERT INTO `tv_series_data` VALUES (7532571077, '如意', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/2/s7641.jpg?1483516104', 'https://tv.2345.com/detail/7641.html', 8.9, '家庭', 0, 3026);
INSERT INTO `tv_series_data` VALUES (7534833259, '湄公河大案', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/13/s39869.jpg?1405927145', 'https://tv.2345.com/detail/39869.html', 8.4, '悬疑', 0, 5216);
INSERT INTO `tv_series_data` VALUES (7538578789, '天字一号', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/3/11483/345ade299b66f63028fab9c008b1c431.jpg', 'https://tv.2345.com/detail/11483.html', 9.1, '战争', 0, 3837);
INSERT INTO `tv_series_data` VALUES (7547930483, '别说爱我', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/19/s58872.jpg', 'https://tv.2345.com/detail/58872.html', 8.7, '战争', 0, 5670);
INSERT INTO `tv_series_data` VALUES (7549312938, '证据', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/13/s41337.jpg?1410413805', 'https://tv.2345.com/detail/41337.html', 7.7, '悬疑', 0, 5268);
INSERT INTO `tv_series_data` VALUES (7554088581, '女人当官', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/1671/89b804537ce3b1090a8533c23d8d740c.jpg', 'https://tv.2345.com/detail/1671.html', 9.7, '家庭', 0, 6134);
INSERT INTO `tv_series_data` VALUES (7555595730, '没有语言的生活', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/1359/3d3af3ac53912e32ed0a8c10a8c5070a.jpg', 'https://tv.2345.com/detail/1359.html', 9.4, '伦理', 0, 5122);
INSERT INTO `tv_series_data` VALUES (7555734034, '拿什么让你幸福', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/18/s55446.jpg', 'https://tv.2345.com/detail/55446.html', 9.4, '家庭', 0, 6507);
INSERT INTO `tv_series_data` VALUES (7559165599, '欢天喜地对亲家未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/15/s47849.jpg', 'https://tv.2345.com/detail/47849.html', 8.4, '家庭', 0, 6931);
INSERT INTO `tv_series_data` VALUES (7560786195, '狙击生死线', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/1082/2597928400437dc616eb5b210b132843.jpg', 'https://tv.2345.com/detail/1082.html', 9, '军旅', 0, 7641);
INSERT INTO `tv_series_data` VALUES (7561025354, '乡村爱情6', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/b/19276.jpg', 'https://tv.2345.com/detail/19276.html', 8.8, '家庭', 0, 4703);
INSERT INTO `tv_series_data` VALUES (7563372489, '名校', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/2/6003/657bf24c0e73d360cffc71b5efa142e6.jpg', 'https://tv.2345.com/detail/6003.html', 9, '家庭', 0, 5227);
INSERT INTO `tv_series_data` VALUES (7566721607, '什刹海速看版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/19/s57846.jpg', 'https://tv.2345.com/detail/57846.html', 8.7, '家庭', 0, 3321);
INSERT INTO `tv_series_data` VALUES (7568397954, '谍影杀机', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/18/s55535.jpg', 'https://tv.2345.com/detail/55535.html', 8.5, '战争', 0, 4628);
INSERT INTO `tv_series_data` VALUES (7571375169, '老爸的爱情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/b/8.jpg', 'https://tv.2345.com/detail/11853.html', 9.1, '家庭', 0, 6842);
INSERT INTO `tv_series_data` VALUES (7571404613, '宝贝战争', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/b/7.jpg', 'https://tv.2345.com/detail/15320.html', 8.8, '伦理', 0, 3182);
INSERT INTO `tv_series_data` VALUES (7573959530, '离婚再婚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/4/12368/84d9c5c580ecfec49d09a8d4573913f4.jpg', 'https://tv.2345.com/detail/12368.html', 8.9, '伦理', 0, 3959);
INSERT INTO `tv_series_data` VALUES (7574470521, '香草美人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/2/7827/89db6ba7e78016288b8ba4fe2c0f4ca8.jpg', 'https://tv.2345.com/detail/7827.html', 9.2, '悬疑', 0, 6423);
INSERT INTO `tv_series_data` VALUES (7577949938, '紫檀王', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/1/1.jpg', 'https://tv.2345.com/detail/17101.html', 9, '家庭', 0, 3768);
INSERT INTO `tv_series_data` VALUES (7578955734, '决战江桥', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/15/s47299.jpg?1499396080', 'https://tv.2345.com/detail/47299.html', 8.7, '军旅', 0, 6123);
INSERT INTO `tv_series_data` VALUES (7581595751, '妈妈你到底在哪里', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/4/s14920.jpg?1370663804', 'https://tv.2345.com/detail/14920.html', 8.7, '伦理', 0, 3046);
INSERT INTO `tv_series_data` VALUES (7584886981, '古村女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/2/s7809.jpg', 'https://tv.2345.com/detail/7809.html', 8.8, '伦理', 0, 7133);
INSERT INTO `tv_series_data` VALUES (7585555536, '大珍珠', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/1374/8f210e3740dad8d37f63322d99bde475.jpg', 'https://tv.2345.com/detail/1374.html', 8.7, '伦理', 0, 6606);
INSERT INTO `tv_series_data` VALUES (7587641504, '猎人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/15/s46244.jpg?1457605536', 'https://tv.2345.com/detail/46244.html', 8.6, '悬疑', 0, 4399);
INSERT INTO `tv_series_data` VALUES (7587768290, '战火青春', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/13/s41150.jpg?1409797050', 'https://tv.2345.com/detail/41150.html', 8.9, '战争', 0, 4445);
INSERT INTO `tv_series_data` VALUES (7592876698, '兴国兴国', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/1793/s1793.jpg', 'https://tv.2345.com/detail/1793.html', 9.2, '战争', 0, 4467);
INSERT INTO `tv_series_data` VALUES (7594499220, '无贼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/9/s28046.jpg?1387591189', 'https://tv.2345.com/detail/28046.html', 8.4, '悬疑', 0, 5520);
INSERT INTO `tv_series_data` VALUES (7594605913, '黎明前的暗战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/892/cb7c1c277a4f4c671560108252b33b3e.jpg', 'https://tv.2345.com/detail/892.html', 10, '军旅', 0, 5986);
INSERT INTO `tv_series_data` VALUES (7595613671, '决不妥协', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/2385/4f6657fd6982c1209940ed1eb87b5a81.jpg', 'https://tv.2345.com/detail/17350.html', 8.8, '家庭', 0, 6843);
INSERT INTO `tv_series_data` VALUES (7596091653, '暗花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/8/s25044.jpg?1378177480', 'https://tv.2345.com/detail/25044.html', 8.5, '悬疑', 0, 5831);
INSERT INTO `tv_series_data` VALUES (7597685425, '潜行者', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/15/s47811.jpg?1452062510', 'https://tv.2345.com/detail/47811.html', 8.4, '战争', 0, 5514);
INSERT INTO `tv_series_data` VALUES (7599478430, '专列一号', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/8/s26666.jpg?1383097296', 'https://tv.2345.com/detail/26666.html', 8.6, '战争', 0, 4125);
INSERT INTO `tv_series_data` VALUES (7600143770, '决战黎明', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/596/b1204dc42da8cc42676d001fbe19936e.jpg', 'https://tv.2345.com/detail/596.html', 8.9, '战争', 0, 3524);
INSERT INTO `tv_series_data` VALUES (7603354618, '十一级台阶', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/1/s4463.jpg?1410419600', 'https://tv.2345.com/detail/4463.html', 8.8, '战争', 0, 3707);
INSERT INTO `tv_series_data` VALUES (7606452849, '母子连心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/5/s15365.jpg?1394175516', 'https://tv.2345.com/detail/15365.html', 8.3, '伦理', 0, 6647);
INSERT INTO `tv_series_data` VALUES (7607449042, '东宫皇子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/17/s52414.jpg', 'https://tv.2345.com/detail/52414.html', 8.8, '其他', 0, 7320);
INSERT INTO `tv_series_data` VALUES (7611777778, '翡翠王', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/10/s30498.jpg?1408614791', 'https://tv.2345.com/detail/30498.html', 8.3, '战争', 0, 4982);
INSERT INTO `tv_series_data` VALUES (7612442880, '共和国血脉', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/18/s56220.jpg', 'https://tv.2345.com/detail/56220.html', 9.8, '其他', 0, 5218);
INSERT INTO `tv_series_data` VALUES (7614489888, '少女大人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/19/s57881.png', 'https://tv.2345.com/detail/57881.html', 8.9, '悬疑', 0, 5556);
INSERT INTO `tv_series_data` VALUES (7614639747, '战士', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/380/6cc15769e83adab21b6cecf890e95b7c.jpg', 'https://tv.2345.com/detail/380.html', 9.3, '战争', 0, 6420);
INSERT INTO `tv_series_data` VALUES (7616039322, '超级战舰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/17/s52318.jpg', 'https://tv.2345.com/detail/52318.html', 8.7, '战争', 0, 3922);
INSERT INTO `tv_series_data` VALUES (7617093945, '当婆婆遇上妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/1/5000/d909ba959fc933f7f3366712f996f7d1.jpg', 'https://tv.2345.com/detail/5000.html', 7.4, '伦理', 0, 7007);
INSERT INTO `tv_series_data` VALUES (7619178124, '惊世新娘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/616/s616.jpg', 'https://tv.2345.com/detail/616.html', 7.8, '伦理', 0, 4968);
INSERT INTO `tv_series_data` VALUES (7619932900, '惊天大迷局', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/19/s58610.jpg', 'https://tv.2345.com/detail/58610.html', 8.7, '悬疑', 0, 5398);
INSERT INTO `tv_series_data` VALUES (7623015013, '看不见的背后', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/10/s30664.jpg', 'https://tv.2345.com/detail/30664.html', 7.5, '家庭', 0, 7275);
INSERT INTO `tv_series_data` VALUES (7624544531, '向天真的女生投降', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/1/4878/215ae3fbd1ed9485ec2ccd60a9803fdc.jpg', 'https://tv.2345.com/detail/4878.html', 10, '伦理', 0, 6828);
INSERT INTO `tv_series_data` VALUES (7627459882, '东方有大海', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/17/s53170.jpg', 'https://tv.2345.com/detail/53170.html', 8.5, '战争', 0, 4655);
INSERT INTO `tv_series_data` VALUES (7629333036, '妻子的谎言未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/15/s45975.jpg', 'https://tv.2345.com/detail/45975.html', 8.7, '家庭', 0, 4293);
INSERT INTO `tv_series_data` VALUES (7632909730, '黑玫瑰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/500/0db0351a97f1309d47c64b4bdf22d733.jpg', 'https://tv.2345.com/detail/500.html', 9.7, '悬疑', 0, 7500);
INSERT INTO `tv_series_data` VALUES (7633768864, '敢爱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/15/s45702.jpg?1425018642', 'https://tv.2345.com/detail/45702.html', 8, '家庭', 0, 3080);
INSERT INTO `tv_series_data` VALUES (7636853465, '强者风范', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/2/1.jpg', 'https://tv.2345.com/detail/15799.html', 9.2, '战争', 0, 7761);
INSERT INTO `tv_series_data` VALUES (7637544627, '密谍伙伴', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/16/s48003.jpg?1456721855', 'https://tv.2345.com/detail/48003.html', 8.5, '战争', 0, 5407);
INSERT INTO `tv_series_data` VALUES (7638872812, '烈火战士', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/20/s61054.jpg', 'https://tv.2345.com/detail/61054.html', 7.5, '战争', 0, 4938);
INSERT INTO `tv_series_data` VALUES (7640233946, '超少年密码', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/16/s48082.jpg?1468214101', 'https://tv.2345.com/detail/48082.html', 8.5, '悬疑', 0, 3698);
INSERT INTO `tv_series_data` VALUES (7640585207, '密查', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/18/s56010.jpg?1567142517', 'https://tv.2345.com/detail/56010.html', 8.8, '军旅', 0, 5333);
INSERT INTO `tv_series_data` VALUES (7642934179, '反击', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/1/s3497.jpg?1395881248', 'https://tv.2345.com/detail/3497.html', 8.5, '战争', 0, 6854);
INSERT INTO `tv_series_data` VALUES (7646296552, '秋蝉', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/19/s57599.jpg', 'https://tv.2345.com/detail/57599.html', 9.4, '悬疑', 1, 7902);
INSERT INTO `tv_series_data` VALUES (7649954847, '电视剧夺宝', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/17/s53699.jpg', 'https://tv.2345.com/detail/53699.html', 7.2, '战争', 0, 3744);
INSERT INTO `tv_series_data` VALUES (7652364283, '热血奇侠', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/18/s55098.jpg', 'https://tv.2345.com/detail/55098.html', 9.2, '战争', 0, 7726);
INSERT INTO `tv_series_data` VALUES (7653080946, '夺子战争', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/564/50648c65ac1d9b6b4087be9d9df2aac5.jpg', 'https://tv.2345.com/detail/564.html', 8, '伦理', 0, 6904);
INSERT INTO `tv_series_data` VALUES (7653213486, '我要结婚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/0/s160.jpg?1381489750', 'https://tv.2345.com/detail/160.html', 8.4, '家庭', 0, 3835);
INSERT INTO `tv_series_data` VALUES (7656772698, '辣妈正传', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/8/s25037.jpg?1379221107', 'https://tv.2345.com/detail/25037.html', 8.6, '家庭', 0, 5262);
INSERT INTO `tv_series_data` VALUES (7657985605, '风云1911', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/2/s7150.jpg', 'https://tv.2345.com/detail/7150.html', 8.7, '战争', 0, 5539);
INSERT INTO `tv_series_data` VALUES (7660346019, '橘子红了', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/2/s8894.jpg?1509613283', 'https://tv.2345.com/detail/8894.html', 9.4, '家庭', 0, 6943);
INSERT INTO `tv_series_data` VALUES (7661551783, '夏家三千金', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/924/57d16b0ba71239a4dc71b1dceb84a697.jpg', 'https://tv.2345.com/detail/924.html', 8.2, '家庭', 0, 6247);
INSERT INTO `tv_series_data` VALUES (7664122969, '爱在何方', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/1/s4073.jpg', 'https://tv.2345.com/detail/4073.html', 6.9, '家庭', 0, 7151);
INSERT INTO `tv_series_data` VALUES (7666504360, '绝命毒师第1季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/3/s11417.jpg?1373594850', 'https://tv.2345.com/detail/11417.html', 8.6, '悬疑', 0, 5875);
INSERT INTO `tv_series_data` VALUES (7667624714, '中国1945', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/1/s4462.jpg', 'https://tv.2345.com/detail/4462.html', 7.8, '战争', 0, 7255);
INSERT INTO `tv_series_data` VALUES (7672047796, '神秘人质', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/8/s25766.jpg?1380247377', 'https://tv.2345.com/detail/25766.html', 8.5, '悬疑', 0, 4615);
INSERT INTO `tv_series_data` VALUES (7672717110, '再婚劫', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/4/12500/1f491cfac5898781cf59bebf81c698de.jpg', 'https://tv.2345.com/detail/12500.html', 8.8, '伦理', 0, 3600);
INSERT INTO `tv_series_data` VALUES (7673870190, '边陲迷雾', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/18/s55768.jpg', 'https://tv.2345.com/detail/55768.html', 9.2, '战争', 0, 5065);
INSERT INTO `tv_series_data` VALUES (7679041753, '独狼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/9/s27231.jpg?1387462869', 'https://tv.2345.com/detail/27231.html', 8.6, '悬疑', 0, 4838);
INSERT INTO `tv_series_data` VALUES (7681112991, '新恋爱时代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/7/s22144.jpg?1369278922', 'https://tv.2345.com/detail/22144.html', 8.7, '家庭', 0, 7754);
INSERT INTO `tv_series_data` VALUES (7695492542, '民国恩仇录', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/449611/1348833348/6dad5e8dfa5c62fe74b43d0ed5584d9d.jpg', 'https://tv.2345.com/detail/14813.html', 8.2, '伦理', 0, 4185);
INSERT INTO `tv_series_data` VALUES (7703103094, '大河儿女未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/11/s34770.jpg?1406717264', 'https://tv.2345.com/detail/34770.html', 8.4, '战争', 0, 5344);
INSERT INTO `tv_series_data` VALUES (7706023107, '乱世女儿红', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/2/6183/bcffbd06155ed32bffc5df8dcda75ca6.jpg', 'https://tv.2345.com/detail/6183.html', 6.2, '战争', 0, 5069);
INSERT INTO `tv_series_data` VALUES (7721706020, '黑狐', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/2/6551/c14ad94a623591b513d8694e8e8d8b11.jpg', 'https://tv.2345.com/detail/6551.html', 9, '战争', 0, 7097);
INSERT INTO `tv_series_data` VALUES (7721823719, '雷锋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/712/baa29f2370520e2df8c4b28b9459c080.jpg', 'https://tv.2345.com/detail/712.html', 8.8, '战争', 0, 6659);
INSERT INTO `tv_series_data` VALUES (7722935488, '闯关东DVD', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/17/s53862.jpg', 'https://tv.2345.com/detail/53862.html', 7.3, '家庭', 0, 3383);
INSERT INTO `tv_series_data` VALUES (7723992154, '西山剿匪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/19/s57930.jpg', 'https://tv.2345.com/detail/57930.html', 7.4, '战争', 0, 3575);
INSERT INTO `tv_series_data` VALUES (7724848386, '四世同堂1985版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/15/s46346.jpg', 'https://tv.2345.com/detail/46346.html', 7.6, '家庭', 0, 6225);
INSERT INTO `tv_series_data` VALUES (7724929500, '二胎', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/13/s40373.jpg?1407292832', 'https://tv.2345.com/detail/40373.html', 8.6, '家庭', 0, 6307);
INSERT INTO `tv_series_data` VALUES (7725374877, '圣天门口', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/450307/1350922204/9b9bdbdaeb9ac423edf3be5e0b494658.jpg', 'https://tv.2345.com/detail/16013.html', 9.3, '战争', 0, 3990);
INSERT INTO `tv_series_data` VALUES (7726800242, '血色青春', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/2643/s2643.jpg', 'https://tv.2345.com/detail/2643.html', 6.6, '家庭', 0, 3673);
INSERT INTO `tv_series_data` VALUES (7730414774, '亲爱的回家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/2/s7828.jpg', 'https://tv.2345.com/detail/7828.html', 8.8, '家庭', 0, 3254);
INSERT INTO `tv_series_data` VALUES (7735136142, '刺蝶', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/15/s46867.jpg?1440202367', 'https://tv.2345.com/detail/46867.html', 8.4, '战争', 0, 3719);
INSERT INTO `tv_series_data` VALUES (7742257413, '傻阿甘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/18/s55102.jpg', 'https://tv.2345.com/detail/55102.html', 9.3, '伦理', 0, 7714);
INSERT INTO `tv_series_data` VALUES (7747401206, '你是我的姐妹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/15/s46409.jpg?1433389785', 'https://tv.2345.com/detail/46409.html', 8.5, '家庭', 0, 4778);
INSERT INTO `tv_series_data` VALUES (7751901865, '誓言永恒', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/21/99856796774cd1562b03da0dc9bc25c8.jpg', 'https://tv.2345.com/detail/21.html', 9.3, '战争', 0, 4358);
INSERT INTO `tv_series_data` VALUES (7754977634, '女怕嫁错郎', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/16/s49560.jpg?1473483673', 'https://tv.2345.com/detail/49560.html', 8.5, '家庭', 0, 7286);
INSERT INTO `tv_series_data` VALUES (7755971207, '家和万事兴之兄弟姐妹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/16/s50986.jpg', 'https://tv.2345.com/detail/50986.html', 7.7, '家庭', 0, 3497);
INSERT INTO `tv_series_data` VALUES (7756484031, '编辑部的故事短剧版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/19/s57157.jpg', 'https://tv.2345.com/detail/57157.html', 7.1, '家庭', 0, 5863);
INSERT INTO `tv_series_data` VALUES (7760827668, '梅艳芳菲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/34/00b31c461e970d9ccdbf9de2d65d30be.jpg', 'https://tv.2345.com/detail/34.html', 8.9, '伦理', 0, 6252);
INSERT INTO `tv_series_data` VALUES (7761120421, '猎手高光CUT', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/19/s57892.png', 'https://tv.2345.com/detail/57892.html', 8.8, '战争', 0, 7852);
INSERT INTO `tv_series_data` VALUES (7763875077, '真情相约', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/17/s51184.jpg', 'https://tv.2345.com/detail/51184.html', 8.7, '家庭', 0, 3458);
INSERT INTO `tv_series_data` VALUES (7769018875, '张学良将军', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/2662/s2662.jpg', 'https://tv.2345.com/detail/2662.html', 8.8, '战争', 0, 5511);
INSERT INTO `tv_series_data` VALUES (7773509135, '继父', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/2/7613/77a4159fb361e7ead5997eecaf1275ca.jpg', 'https://tv.2345.com/detail/7613.html', 10, '伦理', 0, 4523);
INSERT INTO `tv_series_data` VALUES (7778173279, '小棉袄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/18/s55051.jpg', 'https://tv.2345.com/detail/55051.html', 9.8, '家庭', 0, 7994);
INSERT INTO `tv_series_data` VALUES (7780255866, '王保长新篇2之死去生来', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/19/s57433.jpg', 'https://tv.2345.com/detail/57433.html', 7.4, '战争', 0, 3102);
INSERT INTO `tv_series_data` VALUES (7781986279, '谍网第1季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/16/s49105.jpg', 'https://tv.2345.com/detail/49105.html', 8.5, '战争', 0, 3824);
INSERT INTO `tv_series_data` VALUES (7784273877, '中国1921', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/1/s4397.jpg?1501123476', 'https://tv.2345.com/detail/4397.html', 8.6, '战争', 0, 4153);
INSERT INTO `tv_series_data` VALUES (7785470650, '疯人院', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/18/s55088.jpg', 'https://tv.2345.com/detail/55088.html', 7, '悬疑', 0, 6731);
INSERT INTO `tv_series_data` VALUES (7786075746, '乱世玉缘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/186/fc62c63524cc74cd0948f6c954e07d25.jpg', 'https://tv.2345.com/detail/186.html', 9.3, '战争', 0, 5435);
INSERT INTO `tv_series_data` VALUES (7789333589, '有个地方叫马兰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/18/s55903.jpg', 'https://tv.2345.com/detail/55903.html', 8.3, '战争', 0, 3666);
INSERT INTO `tv_series_data` VALUES (7790989089, '满洲间谍', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/18/s55510.jpg', 'https://tv.2345.com/detail/55510.html', 9.2, '战争', 0, 6028);
INSERT INTO `tv_series_data` VALUES (7794630648, '血族第1季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/13/s39819.jpg?1405940425', 'https://tv.2345.com/detail/39819.html', 8.4, '悬疑', 0, 4049);
INSERT INTO `tv_series_data` VALUES (7799044736, '玫瑰园里的老少爷们儿', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/860/s860.jpg', 'https://tv.2345.com/detail/860.html', 8.1, '伦理', 0, 6588);
INSERT INTO `tv_series_data` VALUES (7800734023, '酸甜苦辣小夫妻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/16/s48774.jpg?1470281384', 'https://tv.2345.com/detail/48774.html', 8.3, '家庭', 0, 7219);
INSERT INTO `tv_series_data` VALUES (7801550010, '生死迷局', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/791/59907188fe8a4652556db66bf6ccd4d6.jpg', 'https://tv.2345.com/detail/791.html', 8.8, '悬疑', 0, 5688);
INSERT INTO `tv_series_data` VALUES (7803339863, '别样幸福', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/5/s15426.jpg?1384568226', 'https://tv.2345.com/detail/15426.html', 8.4, '伦理', 0, 3662);
INSERT INTO `tv_series_data` VALUES (7811405187, '盗火线', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/f.jpg', 'https://tv.2345.com/detail/12038.html', 8.8, '悬疑', 0, 6352);
INSERT INTO `tv_series_data` VALUES (7812473871, '烈日炎炎', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/2196/f627b451d1232ad29a1accf151c42140.jpg', 'https://tv.2345.com/detail/2196.html', 8.8, '军旅', 0, 6953);
INSERT INTO `tv_series_data` VALUES (7816360745, '警察李酒瓶', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/16/s48581.jpg', 'https://tv.2345.com/detail/48581.html', 9.1, '家庭', 0, 5588);
INSERT INTO `tv_series_data` VALUES (7816721528, '脱身', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/16/s50464.jpg?1510819009', 'https://tv.2345.com/detail/50464.html', 9.5, '战争', 0, 6714);
INSERT INTO `tv_series_data` VALUES (7817199290, '走过幸福', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/23/11de3dc8189d2a8c48c53dfcb25e44fc.jpg', 'https://tv.2345.com/detail/23.html', 9.3, '家庭', 0, 4158);
INSERT INTO `tv_series_data` VALUES (7819953965, '苦菜花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/3/10180/caba26d93532bee40135d62da65a35d9.jpg', 'https://tv.2345.com/detail/10180.html', 9, '战争', 0, 7772);
INSERT INTO `tv_series_data` VALUES (7820473038, '青春之歌2006', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/17/s53925.jpg', 'https://tv.2345.com/detail/53925.html', 8.3, '战争', 0, 4844);
INSERT INTO `tv_series_data` VALUES (7820882340, '女人的抉择', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/3/3.jpg', 'https://tv.2345.com/detail/10582.html', 8.8, '家庭', 0, 7125);
INSERT INTO `tv_series_data` VALUES (7823278210, '身边的幸福', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/5/s15101.jpg?1426645949', 'https://tv.2345.com/detail/15101.html', 8.2, '家庭', 0, 6076);
INSERT INTO `tv_series_data` VALUES (7824083030, '幸福', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/130/00accfa8ad34bfb5e7e303291179b977.jpg', 'https://tv.2345.com/detail/130.html', 8.8, '伦理', 0, 6671);
INSERT INTO `tv_series_data` VALUES (7828409170, '滴血玫瑰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/3/s9724.jpg', 'https://tv.2345.com/detail/9724.html', 8.9, '战争', 0, 5811);
INSERT INTO `tv_series_data` VALUES (7831566974, '铁核桃', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/15/s45794.jpg?1425627363', 'https://tv.2345.com/detail/45794.html', 9.2, '战争', 0, 5017);
INSERT INTO `tv_series_data` VALUES (7832135489, '我把忠诚献给你', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/18/s56790.jpg', 'https://tv.2345.com/detail/56790.html', 8.2, '战争', 0, 5664);
INSERT INTO `tv_series_data` VALUES (7833061743, '徽州女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/3/9733/82c6d6299ffbe08e92e68694128244fa.jpg', 'https://tv.2345.com/detail/9733.html', 10, '伦理', 0, 5064);
INSERT INTO `tv_series_data` VALUES (7833571805, '胭脂雪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/40/51fb866b4d5e0ba4838314b7ae7453d7.jpg', 'https://tv.2345.com/detail/40.html', 7.5, '伦理', 0, 3944);
INSERT INTO `tv_series_data` VALUES (7834059831, '红星照耀中国未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/16/s50378.jpg', 'https://tv.2345.com/detail/50378.html', 9.2, '战争', 0, 6916);
INSERT INTO `tv_series_data` VALUES (7835142774, '婚战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/11/s33332.jpg?1415776788', 'https://tv.2345.com/detail/33332.html', 8.4, '伦理', 0, 5241);
INSERT INTO `tv_series_data` VALUES (7840333589, '嫂子的情感时代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/10/s32941.jpg?1408612011', 'https://tv.2345.com/detail/32941.html', 7.6, '家庭', 0, 3607);
INSERT INTO `tv_series_data` VALUES (7850498348, '雪域天路DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/18/s55165.jpg', 'https://tv.2345.com/detail/55165.html', 8.8, '战争', 0, 7690);
INSERT INTO `tv_series_data` VALUES (7850727529, '道北人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/2061/36dacbef56955a41526eedafc7c263e4.jpg', 'https://tv.2345.com/detail/2061.html', 10, '家庭', 0, 5916);
INSERT INTO `tv_series_data` VALUES (7853319422, '断刺', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/816/13068395f451763f3e178cc45981d98a.jpg', 'https://tv.2345.com/detail/816.html', 9.2, '悬疑', 0, 7419);
INSERT INTO `tv_series_data` VALUES (7856560847, '不要公开你的秘密', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/2/6195/3a0e3690be8d92c9701765703d051888.jpg', 'https://tv.2345.com/detail/6195.html', 9.2, '伦理', 0, 6203);
INSERT INTO `tv_series_data` VALUES (7863036773, '师傅', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/1876/f23a5e367c892ec42767015c8bd1eba9.jpg', 'https://tv.2345.com/detail/1876.html', 9.5, '家庭', 0, 3371);
INSERT INTO `tv_series_data` VALUES (7869489757, '婚变', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/216/46fa0631279104bae268d9e190741622.jpg', 'https://tv.2345.com/detail/216.html', 8.8, '伦理', 0, 7150);
INSERT INTO `tv_series_data` VALUES (7870479110, '红色宝藏', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/19/s57094.jpg', 'https://tv.2345.com/detail/57094.html', 8.8, '战争', 0, 4824);
INSERT INTO `tv_series_data` VALUES (7872554594, '黄浦虎将', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/20/s61342.jpg', 'https://tv.2345.com/detail/61342.html', 8.7, '战争', 0, 5053);
INSERT INTO `tv_series_data` VALUES (7874095149, '花非花雾非雾', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/7/s23481.jpg?1375839641', 'https://tv.2345.com/detail/23481.html', 9.6, '悬疑', 0, 7960);
INSERT INTO `tv_series_data` VALUES (7880298172, '秀秀的男人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/11/s34241.jpg?1396874452', 'https://tv.2345.com/detail/34241.html', 8.5, '家庭', 0, 7571);
INSERT INTO `tv_series_data` VALUES (7884472264, '新燕子李三', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/8/s25815.jpg?1380337029', 'https://tv.2345.com/detail/25815.html', 8.4, '战争', 0, 4702);
INSERT INTO `tv_series_data` VALUES (7885594849, '血色玫瑰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/2770/04c72ddebe015853af222d8eb865d9bb.jpg', 'https://tv.2345.com/detail/2770.html', 8.8, '战争', 0, 7102);
INSERT INTO `tv_series_data` VALUES (7888691103, '第20届上海电视节', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/12/s36230.jpg?1410421801', 'https://tv.2345.com/detail/36230.html', 6.9, '其他', 0, 5097);
INSERT INTO `tv_series_data` VALUES (7889331789, '能人冯天贵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/1816/9815fc3d950e006fd794dbe741e7ee96.jpg', 'https://tv.2345.com/detail/1816.html', 9.6, '伦理', 0, 4254);
INSERT INTO `tv_series_data` VALUES (7890770692, '使命召唤', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/17/s52657.jpg?1487558193', 'https://tv.2345.com/detail/52657.html', 8.1, '战争', 0, 6527);
INSERT INTO `tv_series_data` VALUES (7894808963, '无神之地不下雨', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/20/s61060.jpg', 'https://tv.2345.com/detail/61060.html', 9.4, '悬疑', 0, 4907);
INSERT INTO `tv_series_data` VALUES (7900597272, '孤岛飞鹰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/450569/1351707163/bfd6cb97f3feb1edeb3616a6c854e705.jpg', 'https://tv.2345.com/detail/16371.html', 9, '战争', 0, 3150);
INSERT INTO `tv_series_data` VALUES (7900713914, '幸福在路上', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/716/b814e1f7c883aaed415444e323b258bf.jpg', 'https://tv.2345.com/detail/716.html', 8.7, '家庭', 0, 3148);
INSERT INTO `tv_series_data` VALUES (7904040828, '第九个寡妇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/5/s16359.jpg?1372125162', 'https://tv.2345.com/detail/16359.html', 8.9, '家庭', 0, 3055);
INSERT INTO `tv_series_data` VALUES (7904369687, '血刃', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/11/s33120.jpg?1420711084', 'https://tv.2345.com/detail/33120.html', 8.1, '战争', 0, 4093);
INSERT INTO `tv_series_data` VALUES (7906940858, '迷魂谷', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/15/s46087.jpg', 'https://tv.2345.com/detail/46087.html', 8.8, '战争', 0, 6051);
INSERT INTO `tv_series_data` VALUES (7908803438, '电视剧《雄关漫道》', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/18/s56488.jpg', 'https://tv.2345.com/detail/56488.html', 8.2, '军旅', 0, 5197);
INSERT INTO `tv_series_data` VALUES (7909930251, '眼中钉', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/1/3837/0b1eb80501095e4b3890dd4b53879985.jpg', 'https://tv.2345.com/detail/3837.html', 8, '战争', 0, 7201);
INSERT INTO `tv_series_data` VALUES (7910431084, '陆军一号', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/15/s47813.jpg?1451981496', 'https://tv.2345.com/detail/47813.html', 8.8, '战争', 0, 6649);
INSERT INTO `tv_series_data` VALUES (7910947917, '出关', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/10/s32541.jpg?1427082937', 'https://tv.2345.com/detail/32541.html', 7.8, '战争', 0, 4205);
INSERT INTO `tv_series_data` VALUES (7911247486, '一门三司令', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/b/1.jpg', 'https://tv.2345.com/detail/15044.html', 9.2, '战争', 0, 3845);
INSERT INTO `tv_series_data` VALUES (7915114813, '战士', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/380/6cc15769e83adab21b6cecf890e95b7c.jpg', 'https://tv.2345.com/detail/380.html', 9.3, '军旅', 0, 5447);
INSERT INTO `tv_series_data` VALUES (7915751049, '十三省', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/131/7b212422b77e43a22ccab6a62054a03d.jpg', 'https://tv.2345.com/detail/131.html', 9.5, '军旅', 0, 5707);
INSERT INTO `tv_series_data` VALUES (7918343259, '深宅1927', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/17/s52181.jpg?1480299579', 'https://tv.2345.com/detail/52181.html', 7.9, '家庭', 0, 6509);
INSERT INTO `tv_series_data` VALUES (7922153341, '鳄鱼先生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/15/s45385.jpg', 'https://tv.2345.com/detail/45385.html', 8.7, '其他', 0, 6174);
INSERT INTO `tv_series_data` VALUES (7924163784, '花花的故事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/17/s53497.jpg', 'https://tv.2345.com/detail/53497.html', 8.8, '其他', 0, 7507);
INSERT INTO `tv_series_data` VALUES (7924188438, '合适婚姻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/1715/796b88a08d8b4262a9a79f02de131ebf.jpg', 'https://tv.2345.com/detail/1715.html', 8.8, '家庭', 0, 4191);
INSERT INTO `tv_series_data` VALUES (7924276057, '民国奇探', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/19/s57369.jpg', 'https://tv.2345.com/detail/57369.html', 9.6, '悬疑', 0, 5286);
INSERT INTO `tv_series_data` VALUES (7927853893, '吸了个剧', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/18/s55575.jpg', 'https://tv.2345.com/detail/55575.html', 8.5, '其他', 0, 5573);
INSERT INTO `tv_series_data` VALUES (7928092394, '先遣连2012', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/18/s55727.jpg', 'https://tv.2345.com/detail/55727.html', 7.3, '战争', 0, 6631);
INSERT INTO `tv_series_data` VALUES (7934578864, '再婚进行时', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/3/s9151.jpg', 'https://tv.2345.com/detail/9151.html', 9.1, '家庭', 0, 6385);
INSERT INTO `tv_series_data` VALUES (7934915649, '结婚十年', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/7/8c5951459c73a77dba17499a4efec82d.jpg', 'https://tv.2345.com/detail/7.html', 9.5, '家庭', 0, 6400);
INSERT INTO `tv_series_data` VALUES (7935936958, '她们的完美一天', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/6/s19449.jpg?1363240527', 'https://tv.2345.com/detail/19449.html', 7.6, '家庭', 0, 4511);
INSERT INTO `tv_series_data` VALUES (7945140709, '生死十七天', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/2/8037/a4576c0011e680e7f9786180be92ea18.jpg', 'https://tv.2345.com/detail/8037.html', 8.8, '家庭', 0, 5232);
INSERT INTO `tv_series_data` VALUES (7946582060, '特勤精英', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/17/s53682.jpg?1508206817', 'https://tv.2345.com/detail/53682.html', 8.9, '战争', 0, 6507);
INSERT INTO `tv_series_data` VALUES (7952301404, '虎踞龙盘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/2/8358/b3bb6a3f9c952f1529ec511eec8d6211.jpg', 'https://tv.2345.com/detail/8358.html', 8.8, '战争', 0, 5425);
INSERT INTO `tv_series_data` VALUES (7955693544, '婚巢', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/d.jpg', 'https://tv.2345.com/detail/16566.html', 9.2, '家庭', 0, 5742);
INSERT INTO `tv_series_data` VALUES (7960975665, '铁血雄心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/10/s32999.jpg', 'https://tv.2345.com/detail/32999.html', 8.1, '军旅', 0, 4801);
INSERT INTO `tv_series_data` VALUES (7962144435, '电视剧可可西里', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/17/s53743.jpg', 'https://tv.2345.com/detail/53743.html', 8.2, '家庭', 0, 5494);
INSERT INTO `tv_series_data` VALUES (7962709307, '你到底要什么', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/0/s2104.jpg?1410419464', 'https://tv.2345.com/detail/2104.html', 7.9, '伦理', 0, 7596);
INSERT INTO `tv_series_data` VALUES (7962920873, '非常出击', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/2/s6436.jpg', 'https://tv.2345.com/detail/6436.html', 8.8, '战争', 0, 4988);
INSERT INTO `tv_series_data` VALUES (7972669140, '永不放弃', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/2/7528/6a87195ef8abf9f654aa2398a5588b90.jpg', 'https://tv.2345.com/detail/7528.html', 8.5, '伦理', 0, 4296);
INSERT INTO `tv_series_data` VALUES (7978526747, '暗宅之谜', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/2/6864/81d232b2d03acb0e32f4fa3aedf01aea.jpg', 'https://tv.2345.com/detail/6864.html', 8, '家庭', 0, 4893);
INSERT INTO `tv_series_data` VALUES (7980322832, '剿匪英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/14/s44503.jpg?1417505031', 'https://tv.2345.com/detail/44503.html', 8.6, '战争', 0, 4088);
INSERT INTO `tv_series_data` VALUES (7992185344, '守望', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/6/s19734.jpg?1407404131', 'https://tv.2345.com/detail/19734.html', 7.8, '家庭', 0, 6392);
INSERT INTO `tv_series_data` VALUES (7993132016, '地雷战传奇之锄奸行动', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/0/s701.jpg', 'https://tv.2345.com/detail/701.html', 8.8, '战争', 0, 5705);
INSERT INTO `tv_series_data` VALUES (7994623497, '别再犹豫', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/1/s3714.jpg', 'https://tv.2345.com/detail/3714.html', 8.5, '家庭', 0, 6419);
INSERT INTO `tv_series_data` VALUES (7995311761, '大秦腔', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/218/s218.jpg', 'https://tv.2345.com/detail/218.html', 9.5, '家庭', 0, 3907);
INSERT INTO `tv_series_data` VALUES (7996815642, '延安锄奸', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/125/e0972f75193c119f9dba15ca14389259.jpg', 'https://tv.2345.com/detail/125.html', 9.5, '战争', 0, 3502);
INSERT INTO `tv_series_data` VALUES (7996992298, '冤家亲家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/15/s45740.jpg?1425868319', 'https://tv.2345.com/detail/45740.html', 7.8, '伦理', 0, 6024);
INSERT INTO `tv_series_data` VALUES (7998340315, '林海雪原2002版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/2024/f87bdb96a9d38e71935aa941ea3ae32c.jpg', 'https://tv.2345.com/detail/2024.html', 8.6, '军旅', 0, 4634);
INSERT INTO `tv_series_data` VALUES (7999129344, '那女人很可怕', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/1/s4056.jpg', 'https://tv.2345.com/detail/4056.html', 6.4, '家庭', 0, 7568);
INSERT INTO `tv_series_data` VALUES (8000536324, '火线对峙', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/4/12616/12b65d6ac3b9d371fa9665d4492b4893.jpg', 'https://tv.2345.com/detail/12616.html', 8.7, '战争', 0, 4626);
INSERT INTO `tv_series_data` VALUES (8003883474, '海上牧云记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/15/s46899.jpg?1476437767', 'https://tv.2345.com/detail/46899.html', 8.7, '战争', 0, 6721);
INSERT INTO `tv_series_data` VALUES (8004774761, '生活有点甜', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/16/s48605.jpg?1463380144', 'https://tv.2345.com/detail/48605.html', 8.5, '家庭', 0, 6563);
INSERT INTO `tv_series_data` VALUES (8005577490, '水上游击队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/1/5982/ac9b0e00c72c070b2239998e0e2d73c1.jpg', 'https://tv.2345.com/detail/5982.html', 8.8, '战争', 0, 6407);
INSERT INTO `tv_series_data` VALUES (8006587114, '小两口', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/8/s25831.jpg?1380590131', 'https://tv.2345.com/detail/25831.html', 8.6, '家庭', 0, 4641);
INSERT INTO `tv_series_data` VALUES (8011006877, '父亲的身份', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/16/s48433.jpg?1460604953', 'https://tv.2345.com/detail/48433.html', 8.5, '悬疑', 0, 4927);
INSERT INTO `tv_series_data` VALUES (8015870474, '中国母亲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/38/b6e00f68e2560f366f7258bf913b96d9.jpg', 'https://tv.2345.com/detail/38.html', 10, '伦理', 0, 4416);
INSERT INTO `tv_series_data` VALUES (8016558127, '城北人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/839/s839.jpg', 'https://tv.2345.com/detail/839.html', 8.6, '伦理', 0, 4829);
INSERT INTO `tv_series_data` VALUES (8018188694, '土司男之吻爱情本事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/20/s61418.jpg', 'https://tv.2345.com/detail/61418.html', 8.6, '其他', 0, 4727);
INSERT INTO `tv_series_data` VALUES (8021806583, '咱家那些事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/1/5836/37ff3f1d8dd38af34b8ea4c4b163ad9d.jpg', 'https://tv.2345.com/detail/5836.html', 9.8, '家庭', 0, 7175);
INSERT INTO `tv_series_data` VALUES (8025965112, '亲情树', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/8/s26270.jpg?1407401437', 'https://tv.2345.com/detail/26270.html', 7.6, '家庭', 0, 6809);
INSERT INTO `tv_series_data` VALUES (8029960599, '越走越好', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/d/3.jpg', 'https://tv.2345.com/detail/18137.html', 9.2, '家庭', 0, 7188);
INSERT INTO `tv_series_data` VALUES (8032131372, '手机', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/11/s35548.jpg?1410421771', 'https://tv.2345.com/detail/35548.html', 9.6, '家庭', 0, 3227);
INSERT INTO `tv_series_data` VALUES (8032145859, '一生守护', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/6/s20951.jpg?1365952987', 'https://tv.2345.com/detail/20951.html', 8.8, '伦理', 0, 5483);
INSERT INTO `tv_series_data` VALUES (8035171247, '回家的诱惑全集', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/16/s49122.jpg', 'https://tv.2345.com/detail/49122.html', 8.1, '家庭', 0, 3067);
INSERT INTO `tv_series_data` VALUES (8037013469, '我是太阳', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/1260/0d86214935c30fdde61d3dac7a5dc3fe.jpg', 'https://tv.2345.com/detail/1260.html', 8.9, '战争', 0, 4212);
INSERT INTO `tv_series_data` VALUES (8038066220, '无须喝彩', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/18/s54334.jpg', 'https://tv.2345.com/detail/54334.html', 9.7, '悬疑', 0, 3942);
INSERT INTO `tv_series_data` VALUES (8039923223, '好家伙', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/10/s32698.jpg?1473484285', 'https://tv.2345.com/detail/32698.html', 8.4, '战争', 0, 3188);
INSERT INTO `tv_series_data` VALUES (8044170404, '无法抗拒', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/2741/c76ee2db2ed589981814ec8caec3f900.jpg', 'https://tv.2345.com/detail/2741.html', 9, '家庭', 0, 3239);
INSERT INTO `tv_series_data` VALUES (8045890887, '无耻之徒第4季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/9/s28682.jpg?1403323426', 'https://tv.2345.com/detail/28682.html', 8.4, '家庭', 0, 6838);
INSERT INTO `tv_series_data` VALUES (8050687811, '科学怪咖', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/15/s45443.jpg', 'https://tv.2345.com/detail/45443.html', 7.5, '其他', 0, 4457);
INSERT INTO `tv_series_data` VALUES (8054944287, '给我一个爱的理由', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/2/6680/6e2134d0f853e8404db697f1e5c5e3f5.jpg', 'https://tv.2345.com/detail/6680.html', 7.3, '家庭', 0, 7038);
INSERT INTO `tv_series_data` VALUES (8059530023, '侬本多情贾静雯版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/2/s6273.jpg', 'https://tv.2345.com/detail/6273.html', 8.4, '战争', 0, 4417);
INSERT INTO `tv_series_data` VALUES (8060814259, '小戏骨放开那三国', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/17/s53534.jpg', 'https://tv.2345.com/detail/53534.html', 7.5, '战争', 0, 7587);
INSERT INTO `tv_series_data` VALUES (8066319679, '老爸老妈的婚事儿', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/19/s57014.jpg', 'https://tv.2345.com/detail/57014.html', 9.8, '家庭', 0, 3307);
INSERT INTO `tv_series_data` VALUES (8071412076, '敢死队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/2302/s2302.jpg', 'https://tv.2345.com/detail/2302.html', 8.8, '战争', 0, 6508);
INSERT INTO `tv_series_data` VALUES (8085763998, '继母后妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/2/6607/da1e521789aae0a93337ced8c4734137.jpg', 'https://tv.2345.com/detail/6607.html', 9.2, '家庭', 0, 6659);
INSERT INTO `tv_series_data` VALUES (8086760999, '沙场点兵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/2759/d9f042d5eef15defb832b6152ac53f79.jpg', 'https://tv.2345.com/detail/2759.html', 8.5, '战争', 0, 5091);
INSERT INTO `tv_series_data` VALUES (8087012801, '冰是睡着的水', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/1560/9b666919e128dabd0dcbc31946af66dd.jpg', 'https://tv.2345.com/detail/1560.html', 8.9, '战争', 0, 7564);
INSERT INTO `tv_series_data` VALUES (8088073470, '挣扎', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/10/s31167.jpg', 'https://tv.2345.com/detail/31167.html', 8.7, '家庭', 0, 6413);
INSERT INTO `tv_series_data` VALUES (8091177091, '远山的红叶', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/630/98aef00d9fd8a61aa142a19305c405ca.jpg', 'https://tv.2345.com/detail/630.html', 9.1, '其他', 0, 4767);
INSERT INTO `tv_series_data` VALUES (8093636741, '日出东方', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/2/8535/d1f5b2857580bf809994e72b82b1bd10.jpg', 'https://tv.2345.com/detail/8535.html', 8.9, '战争', 0, 3317);
INSERT INTO `tv_series_data` VALUES (8094792412, '水落石出3', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/9/s29519.jpg?1392272471', 'https://tv.2345.com/detail/29519.html', 8.4, '悬疑', 0, 7013);
INSERT INTO `tv_series_data` VALUES (8095220119, '欲望之城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/18/s55114.jpg?1534388680', 'https://tv.2345.com/detail/55114.html', 8.8, '伦理', 0, 5216);
INSERT INTO `tv_series_data` VALUES (8098729369, '尖刀', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/1394/7f70373ba552542d55e442ae3deec8e7.jpg', 'https://tv.2345.com/detail/1394.html', 8.8, '战争', 0, 6219);
INSERT INTO `tv_series_data` VALUES (8099113285, '幸福还有多远', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/1198/03deb370d3e0d0bd09fc2467c53b3df2.jpg', 'https://tv.2345.com/detail/1198.html', 9.3, '家庭', 0, 3831);
INSERT INTO `tv_series_data` VALUES (8100259147, '新大头儿子和小头爸爸第二季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/20/s61331.jpg', 'https://tv.2345.com/detail/61331.html', 9.7, '家庭', 0, 4796);
INSERT INTO `tv_series_data` VALUES (8101171702, '芒洛医生第2季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/8/s25385.jpg?1379818294', 'https://tv.2345.com/detail/25385.html', 8.1, '伦理', 0, 3417);
INSERT INTO `tv_series_data` VALUES (8103460682, '幸福二重奏', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/20/s61294.jpg', 'https://tv.2345.com/detail/61294.html', 7.5, '家庭', 0, 6899);
INSERT INTO `tv_series_data` VALUES (8103771971, '巾帼英雄穆桂英', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/8/s25216.jpg?1378454426', 'https://tv.2345.com/detail/25216.html', 8.4, '战争', 0, 7331);
INSERT INTO `tv_series_data` VALUES (8107693115, '家事如天', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/1162/d99aa28442ffab7bbfe88dd3c1459e28.jpg', 'https://tv.2345.com/detail/1162.html', 9.5, '伦理', 0, 4823);
INSERT INTO `tv_series_data` VALUES (8111080327, '蜗牛与黄鹂鸟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/19/s57702.jpg', 'https://tv.2345.com/detail/57702.html', 9.8, '其他', 0, 6166);
INSERT INTO `tv_series_data` VALUES (8111810871, '决战江南', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/7/s21039.jpg?1366861366', 'https://tv.2345.com/detail/21039.html', 9.2, '战争', 0, 5437);
INSERT INTO `tv_series_data` VALUES (8115412450, '生死迷局', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/791/59907188fe8a4652556db66bf6ccd4d6.jpg', 'https://tv.2345.com/detail/791.html', 8.8, '战争', 0, 5923);
INSERT INTO `tv_series_data` VALUES (8123026812, '半路兄弟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/1142/6d9d9722eb2373c367c0578464fc303e.jpg', 'https://tv.2345.com/detail/1142.html', 10, '家庭', 0, 4909);
INSERT INTO `tv_series_data` VALUES (8128404783, '邮差', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/16/s48712.jpg?1464663112', 'https://tv.2345.com/detail/48712.html', 8.5, '战争', 0, 6316);
INSERT INTO `tv_series_data` VALUES (8132397788, '执着的追踪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/19/s57245.jpg', 'https://tv.2345.com/detail/57245.html', 8.8, '战争', 0, 5289);
INSERT INTO `tv_series_data` VALUES (8136061292, '上海的早晨', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/19/s58289.jpg', 'https://tv.2345.com/detail/58289.html', 9.2, '战争', 0, 3217);
INSERT INTO `tv_series_data` VALUES (8138395867, '南下', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/2306/7935b4a25569e001bffdc2d60b741799.jpg', 'https://tv.2345.com/detail/2306.html', 9.2, '战争', 0, 4036);
INSERT INTO `tv_series_data` VALUES (8138475821, '夫妻那些事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/2/7821/db2f0152cde4c04bd824ead51e660eca.jpg', 'https://tv.2345.com/detail/7821.html', 9.3, '家庭', 0, 6575);
INSERT INTO `tv_series_data` VALUES (8144529576, '正者无敌TV版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/7/s21639.jpg?1410420661', 'https://tv.2345.com/detail/21639.html', 6.3, '战争', 0, 4550);
INSERT INTO `tv_series_data` VALUES (8147050552, '双枪李向阳之再战松井', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/2/7734/01628f54ade18ee182f5c0098066e4f4.png', 'https://tv.2345.com/detail/7734.html', 9, '军旅', 0, 6831);
INSERT INTO `tv_series_data` VALUES (8147068954, '烽火线', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/18/s55837.jpg', 'https://tv.2345.com/detail/55837.html', 8.5, '战争', 0, 4216);
INSERT INTO `tv_series_data` VALUES (8149305238, '情系北大荒', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/3/11482/48b426b6b7e56d872dc9a281d0d2d074.jpg', 'https://tv.2345.com/detail/11482.html', 10, '战争', 0, 6805);
INSERT INTO `tv_series_data` VALUES (8151401748, '剧说', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/18/s54182.jpg', 'https://tv.2345.com/detail/54182.html', 7, '其他', 0, 6669);
INSERT INTO `tv_series_data` VALUES (8153592483, '生死归途', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/2/7115/b9ceea5ab559f0cdb2a8ebeae16ec103.jpg', 'https://tv.2345.com/detail/7115.html', 8.7, '战争', 0, 4402);
INSERT INTO `tv_series_data` VALUES (8156182290, '哥哥姐姐的花样年华', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/18/s56257.jpg', 'https://tv.2345.com/detail/56257.html', 8.3, '家庭', 0, 7438);
INSERT INTO `tv_series_data` VALUES (8159566751, '我家的故事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/2360/s2360.jpg', 'https://tv.2345.com/detail/2360.html', 8.8, '家庭', 0, 3597);
INSERT INTO `tv_series_data` VALUES (8162787894, '娘心计', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/4/s14823.jpg?1395107114', 'https://tv.2345.com/detail/14823.html', 8.5, '家庭', 0, 6116);
INSERT INTO `tv_series_data` VALUES (8164918374, '妻子2018普通话版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/18/s56870.jpg', 'https://tv.2345.com/detail/56870.html', 9.5, '家庭', 0, 3824);
INSERT INTO `tv_series_data` VALUES (8165137862, '觉醒', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/19/s57717.png', 'https://tv.2345.com/detail/57717.html', 9.6, '战争', 0, 4403);
INSERT INTO `tv_series_data` VALUES (8167690000, '辛亥革命', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/965/75c2fc0326167d0d6e2ffa9d66887149.jpg', 'https://tv.2345.com/detail/965.html', 8.9, '战争', 0, 3637);
INSERT INTO `tv_series_data` VALUES (8174671647, '理想的征途', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/19/s59239.jpg', 'https://tv.2345.com/detail/59239.html', 7.2, '其他', 0, 7090);
INSERT INTO `tv_series_data` VALUES (8181723998, '天使的城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/14/s44145.jpg?1426837889', 'https://tv.2345.com/detail/44145.html', 8.8, '家庭', 0, 3576);
INSERT INTO `tv_series_data` VALUES (8184949170, '北方有佳人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/3/11468/f76bbb2acd56b2bcde2a39e3ae522cad.jpg', 'https://tv.2345.com/detail/11468.html', 9.4, '战争', 0, 7714);
INSERT INTO `tv_series_data` VALUES (8188801180, '沧海', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/65/266a3c81def5ecdedc5cd62db6f7a214.jpg', 'https://tv.2345.com/detail/65.html', 8.9, '战争', 0, 6043);
INSERT INTO `tv_series_data` VALUES (8189818338, '《可爱的中国》', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/18/s56296.jpg', 'https://tv.2345.com/detail/56296.html', 8.2, '战争', 0, 4659);
INSERT INTO `tv_series_data` VALUES (8191497508, '从海底出击', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/19/s57635.jpg', 'https://tv.2345.com/detail/57635.html', 9.4, '战争', 0, 6889);
INSERT INTO `tv_series_data` VALUES (8192133491, '谢文东4风云再起之再战江湖', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/16/s48014.jpg?1458281397', 'https://tv.2345.com/detail/48014.html', 8.2, '战争', 0, 4347);
INSERT INTO `tv_series_data` VALUES (8194941514, '突击再突击', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/17/s53355.jpg?1499915095', 'https://tv.2345.com/detail/53355.html', 8.7, '战争', 0, 5564);
INSERT INTO `tv_series_data` VALUES (8201607740, '天字一号', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/3/11483/345ade299b66f63028fab9c008b1c431.jpg', 'https://tv.2345.com/detail/11483.html', 9.1, '悬疑', 0, 3928);
INSERT INTO `tv_series_data` VALUES (8201859854, '平原枪声', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/337/cce5382f7ee6795478ef257f169968a4.jpg', 'https://tv.2345.com/detail/337.html', 7, '战争', 0, 7615);
INSERT INTO `tv_series_data` VALUES (8203450512, '偏不离婚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/2400/s2400.jpg', 'https://tv.2345.com/detail/2400.html', 8.9, '家庭', 0, 7579);
INSERT INTO `tv_series_data` VALUES (8203734570, '异镇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/11/s34342.jpg?1437177322', 'https://tv.2345.com/detail/34342.html', 8.4, '战争', 0, 6199);
INSERT INTO `tv_series_data` VALUES (8206423816, '兄弟车行', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/9/s28112.jpg?1387156841', 'https://tv.2345.com/detail/28112.html', 8.4, '家庭', 0, 3405);
INSERT INTO `tv_series_data` VALUES (8211063569, '大帅哥', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/18/s55567.jpg', 'https://tv.2345.com/detail/55567.html', 7.6, '战争', 0, 7508);
INSERT INTO `tv_series_data` VALUES (8211229669, '青果巷', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/10/s30240.jpg?1394759512', 'https://tv.2345.com/detail/30240.html', 8.4, '家庭', 0, 4974);
INSERT INTO `tv_series_data` VALUES (8212460999, '幸福妈妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/5/s16328.jpg?1386920083', 'https://tv.2345.com/detail/16328.html', 9, '家庭', 0, 4781);
INSERT INTO `tv_series_data` VALUES (8214670735, '梅花三弄水云间', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/1/5044/d168d161458f107e9b88e6fb1cace8ab.jpg', 'https://tv.2345.com/detail/5044.html', 9, '家庭', 0, 3432);
INSERT INTO `tv_series_data` VALUES (8216896574, '爱你不放手', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/15/s45306.jpg?1421207416', 'https://tv.2345.com/detail/45306.html', 8.5, '家庭', 0, 4397);
INSERT INTO `tv_series_data` VALUES (8221414172, '雪浴昆仑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/2/s8908.jpg', 'https://tv.2345.com/detail/8908.html', 9.2, '伦理', 0, 5908);
INSERT INTO `tv_series_data` VALUES (8224816186, '大嫂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/3/9754/8c9c2dc7f1345d31ce8c9a49a82a0394.jpg', 'https://tv.2345.com/detail/9754.html', 8.8, '伦理', 0, 5675);
INSERT INTO `tv_series_data` VALUES (8229126059, '垂直打击', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/1/4571/37e514867c8608716c81051ed1dfc8e4.jpg', 'https://tv.2345.com/detail/4571.html', 9.4, '军旅', 0, 6033);
INSERT INTO `tv_series_data` VALUES (8229135182, '兄弟英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/1/5040/2d64d0a839e033a2138a0a9609929129.jpg', 'https://tv.2345.com/detail/5040.html', 9.2, '军旅', 0, 6012);
INSERT INTO `tv_series_data` VALUES (8229143220, '不能没有家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/11/s33313.jpg?1426488401', 'https://tv.2345.com/detail/33313.html', 8.3, '家庭', 0, 6054);
INSERT INTO `tv_series_data` VALUES (8232449099, '血未冷', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/363/29ed241410f8ab57f9794a54e193c5f6.jpg', 'https://tv.2345.com/detail/363.html', 10, '伦理', 0, 4648);
INSERT INTO `tv_series_data` VALUES (8235146521, '快乐星球第一部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/2/s6540.jpg', 'https://tv.2345.com/detail/6540.html', 8.1, '家庭', 0, 3956);
INSERT INTO `tv_series_data` VALUES (8235513577, '德雷尔一家第一季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/18/s56816.jpg', 'https://tv.2345.com/detail/56816.html', 7.8, '其他', 0, 3248);
INSERT INTO `tv_series_data` VALUES (8235570634, '许茂和他的女儿们', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/f/b.jpg', 'https://tv.2345.com/detail/16795.html', 8.8, '家庭', 0, 5527);
INSERT INTO `tv_series_data` VALUES (8243072277, '喋血英魂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/1/s4687.jpg', 'https://tv.2345.com/detail/4687.html', 8.8, '战争', 0, 6013);
INSERT INTO `tv_series_data` VALUES (8252897892, '干得漂亮', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/3/10136/e7f1af8f28122de1c20470ba3ab3a4d1.jpg', 'https://tv.2345.com/detail/10136.html', 8.4, '战争', 0, 3485);
INSERT INTO `tv_series_data` VALUES (8255839670, '零号国境线', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/1933/cbca4a28a54c9989396078b5ffe15c09.jpg', 'https://tv.2345.com/detail/1933.html', 9.1, '军旅', 0, 6069);
INSERT INTO `tv_series_data` VALUES (8257138859, '川西大决战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/17/s53695.jpg', 'https://tv.2345.com/detail/53695.html', 7.5, '战争', 0, 4223);
INSERT INTO `tv_series_data` VALUES (8257442455, '为了一句话', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/15/s47653.jpg', 'https://tv.2345.com/detail/47653.html', 8, '其他', 0, 6453);
INSERT INTO `tv_series_data` VALUES (8260119515, '无名卫士', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/18/s56161.jpg', 'https://tv.2345.com/detail/56161.html', 8.8, '战争', 0, 5974);
INSERT INTO `tv_series_data` VALUES (8261442867, '少年如歌', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/19/s58871.jpg', 'https://tv.2345.com/detail/58871.html', 9.3, '其他', 0, 7589);
INSERT INTO `tv_series_data` VALUES (8262113522, '誓盟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/18/s55331.jpg', 'https://tv.2345.com/detail/55331.html', 9.2, '战争', 0, 3882);
INSERT INTO `tv_series_data` VALUES (8264008609, '长征大会师', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/16/s50455.jpg?1478574443', 'https://tv.2345.com/detail/50455.html', 7.8, '战争', 0, 3486);
INSERT INTO `tv_series_data` VALUES (8264735906, '为了承诺', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/2/6867/aaf9169802d890761e8d9ced85fbedcd.jpg', 'https://tv.2345.com/detail/6867.html', 8.7, '家庭', 0, 3619);
INSERT INTO `tv_series_data` VALUES (8269768690, '心不再遥远', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/2/7884/733ce015a76a6da324f00d869af605a6.jpg', 'https://tv.2345.com/detail/7884.html', 8.7, '家庭', 0, 3765);
INSERT INTO `tv_series_data` VALUES (8273676472, '少林小英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/18/s55834.jpg', 'https://tv.2345.com/detail/55834.html', 9.8, '家庭', 0, 6645);
INSERT INTO `tv_series_data` VALUES (8277038893, '敌后英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/19/s58441.jpg', 'https://tv.2345.com/detail/58441.html', 9, '战争', 0, 6763);
INSERT INTO `tv_series_data` VALUES (8279593337, '大营救', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/2/s7861.jpg?1410419818', 'https://tv.2345.com/detail/7861.html', 7.6, '战争', 0, 5264);
INSERT INTO `tv_series_data` VALUES (8279926163, '我怀了你的孩子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/d/d.png', 'https://tv.2345.com/detail/18104.html', 9.2, '伦理', 0, 5932);
INSERT INTO `tv_series_data` VALUES (8283512748, '刘墉追案', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/20/s60868.jpg', 'https://tv.2345.com/detail/60868.html', 9.3, '悬疑', 0, 5785);
INSERT INTO `tv_series_data` VALUES (8284249116, '想爱都难', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/3/11519/c3ffc7bbe064ed559ff4df5a6f75c5af.jpg', 'https://tv.2345.com/detail/11519.html', 8.7, '家庭', 0, 6497);
INSERT INTO `tv_series_data` VALUES (8286116458, '爱情二十年', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/3/9642/5dc861f3c4cf4a06c2a608a84cd5e424.jpg', 'https://tv.2345.com/detail/9642.html', 9.4, '家庭', 0, 7624);
INSERT INTO `tv_series_data` VALUES (8287458161, '老妈第2季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/14/s43151.jpg', 'https://tv.2345.com/detail/43151.html', 8.5, '家庭', 0, 6115);
INSERT INTO `tv_series_data` VALUES (8297372542, '女人的抗战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/15/s46172.jpg?1430702689', 'https://tv.2345.com/detail/46172.html', 8.4, '战争', 0, 3803);
INSERT INTO `tv_series_data` VALUES (8298388963, '无悔追踪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/373/7f9799f01f6c1c36373634be9c04dce0.jpg', 'https://tv.2345.com/detail/373.html', 9.7, '悬疑', 0, 3875);
INSERT INTO `tv_series_data` VALUES (8301140796, '大年初一立春', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/15/s47919.jpg?1454467054', 'https://tv.2345.com/detail/47919.html', 8.5, '家庭', 0, 5598);
INSERT INTO `tv_series_data` VALUES (8302530713, '终极谍匪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/2/6368/f8fe52b675980bb9e1bf0d5c36fd4177.jpg', 'https://tv.2345.com/detail/6368.html', 9.6, '战争', 0, 7857);
INSERT INTO `tv_series_data` VALUES (8304248281, '战火中的花蕾', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/4/s14820.jpg?1374119453', 'https://tv.2345.com/detail/14820.html', 8.6, '军旅', 0, 3875);
INSERT INTO `tv_series_data` VALUES (8304662164, '决战大南山', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/18/s55257.jpg', 'https://tv.2345.com/detail/55257.html', 7.8, '战争', 0, 5359);
INSERT INTO `tv_series_data` VALUES (8305417080, '灯火黄昏', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/2/8869/9bf8b28578ea5faa36f313151b891b81.jpg', 'https://tv.2345.com/detail/8869.html', 8.7, '伦理', 0, 5400);
INSERT INTO `tv_series_data` VALUES (8306319552, '中国特警', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/5/s17457.jpg?1502273557', 'https://tv.2345.com/detail/17457.html', 8.8, '军旅', 0, 6940);
INSERT INTO `tv_series_data` VALUES (8307191230, '追风行动', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/19/s57199.jpg', 'https://tv.2345.com/detail/57199.html', 8.9, '战争', 0, 7188);
INSERT INTO `tv_series_data` VALUES (8307494878, '荆棘鸟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/3/10469/779fa066d6965088c006d34344c29016.jpg', 'https://tv.2345.com/detail/10469.html', 8, '伦理', 0, 5133);
INSERT INTO `tv_series_data` VALUES (8309761833, '火线', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/661/9c999ead1dba74fb6a406745cba5a4b7.jpg', 'https://tv.2345.com/detail/661.html', 7.6, '战争', 0, 5629);
INSERT INTO `tv_series_data` VALUES (8310732018, '憨媳当家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/1208/3efced2d0aa1ba2db343c9bc686b0289.jpg', 'https://tv.2345.com/detail/1208.html', 9.2, '伦理', 0, 5747);
INSERT INTO `tv_series_data` VALUES (8316256581, '能人冯天贵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/1816/9815fc3d950e006fd794dbe741e7ee96.jpg', 'https://tv.2345.com/detail/1816.html', 9.6, '家庭', 0, 3497);
INSERT INTO `tv_series_data` VALUES (8317368240, '我的儿子是奇葩', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/9/s28018.jpg?1496650686', 'https://tv.2345.com/detail/28018.html', 8.5, '家庭', 0, 5491);
INSERT INTO `tv_series_data` VALUES (8317608548, '黄金新娘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/2108/9f4c67a6495edb239f28651b817bb634.jpg', 'https://tv.2345.com/detail/2108.html', 6.4, '家庭', 0, 3723);
INSERT INTO `tv_series_data` VALUES (8317765649, '真爱一生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/2/s7480.jpg', 'https://tv.2345.com/detail/7480.html', 8.8, '家庭', 0, 7576);
INSERT INTO `tv_series_data` VALUES (8318608080, '陆军特战队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/2775/8bf229f1d73e94c6a0f6eef1aacd58e9.jpg', 'https://tv.2345.com/detail/2775.html', 9.3, '战争', 0, 6599);
INSERT INTO `tv_series_data` VALUES (8323116221, '满秋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/2/s8912.jpg', 'https://tv.2345.com/detail/8912.html', 8.2, '伦理', 0, 3292);
INSERT INTO `tv_series_data` VALUES (8326944498, '乱世佳人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/d/5.jpg', 'https://tv.2345.com/detail/10985.html', 9.2, '伦理', 0, 6662);
INSERT INTO `tv_series_data` VALUES (8327574888, '战争目光', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/0/s2780.jpg?1364978552', 'https://tv.2345.com/detail/2780.html', 8.9, '战争', 0, 6868);
INSERT INTO `tv_series_data` VALUES (8328568186, '三个奶爸', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/15/s46090.jpg?1429674372', 'https://tv.2345.com/detail/46090.html', 8.5, '家庭', 0, 4008);
INSERT INTO `tv_series_data` VALUES (8331637755, '幸福', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/130/00accfa8ad34bfb5e7e303291179b977.jpg', 'https://tv.2345.com/detail/130.html', 8.8, '家庭', 0, 6010);
INSERT INTO `tv_series_data` VALUES (8332317353, '因为是你才喜欢', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/a/11867.jpg', 'https://tv.2345.com/detail/11867.html', 8.2, '伦理', 0, 7055);
INSERT INTO `tv_series_data` VALUES (8335752255, '血色童心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/348/5446ba08986c82d696e3a11b354d653c.jpg', 'https://tv.2345.com/detail/348.html', 9.4, '战争', 0, 7449);
INSERT INTO `tv_series_data` VALUES (8342172032, '哑妹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/1/s5095.jpg?1410419638', 'https://tv.2345.com/detail/5095.html', 6.1, '家庭', 0, 6169);
INSERT INTO `tv_series_data` VALUES (8343514757, '牌坊下的女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/172/265f6241c44588bc029cd82fbebb70ab.jpg', 'https://tv.2345.com/detail/172.html', 9, '伦理', 0, 3441);
INSERT INTO `tv_series_data` VALUES (8343742843, '囧西游', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/15/s45632.jpg', 'https://tv.2345.com/detail/45632.html', 9, '其他', 0, 6111);
INSERT INTO `tv_series_data` VALUES (8344553879, '郭海的家事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/208/99fe9ad7a942818a88992d89814e8978.jpg', 'https://tv.2345.com/detail/208.html', 9.7, '伦理', 0, 7721);
INSERT INTO `tv_series_data` VALUES (8345265672, '悬崖', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/2/6741/c44dd5010827534cc3b232ce65b2213d.jpg', 'https://tv.2345.com/detail/6741.html', 8.5, '战争', 0, 7061);
INSERT INTO `tv_series_data` VALUES (8346324420, '父母爱情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/9/s29428.jpg?1391393068', 'https://tv.2345.com/detail/29428.html', 8.5, '家庭', 0, 4817);
INSERT INTO `tv_series_data` VALUES (8346442920, '杨善洲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/450795/1352387402/6129198005c8bba9960ea485ed226a6a.jpg', 'https://tv.2345.com/detail/16550.html', 8.7, '家庭', 0, 4784);
INSERT INTO `tv_series_data` VALUES (8348653471, '风声传奇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/1763/bae7503216a18d7a14e49e70c5647f51.jpg', 'https://tv.2345.com/detail/1763.html', 7.5, '军旅', 0, 6667);
INSERT INTO `tv_series_data` VALUES (8351426542, '说书人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/7/s23707.jpg?1374205968', 'https://tv.2345.com/detail/23707.html', 8.4, '家庭', 0, 3491);
INSERT INTO `tv_series_data` VALUES (8352974798, '东北一家人第一部短剧版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/19/s57039.jpg', 'https://tv.2345.com/detail/57039.html', 7.4, '家庭', 0, 6796);
INSERT INTO `tv_series_data` VALUES (8357138398, '北上广不相信眼泪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/15/s45865.jpg', 'https://tv.2345.com/detail/45865.html', 8.6, '家庭', 0, 7553);
INSERT INTO `tv_series_data` VALUES (8357296632, '世纪突击', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/2414/s2414.jpg', 'https://tv.2345.com/detail/2414.html', 8.8, '军旅', 0, 6484);
INSERT INTO `tv_series_data` VALUES (8358465153, '一路格桑花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/725/e7ec5cf1157986062fca6d21df1f132b.jpg', 'https://tv.2345.com/detail/725.html', 9.3, '军旅', 0, 5608);
INSERT INTO `tv_series_data` VALUES (8359639848, '悠悠寸草心第二部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/1140/s1140.jpg', 'https://tv.2345.com/detail/1140.html', 8.9, '家庭', 0, 6595);
INSERT INTO `tv_series_data` VALUES (8361742113, '金戈梨园', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/14/s44589.jpg', 'https://tv.2345.com/detail/44589.html', 7.2, '战争', 0, 4620);
INSERT INTO `tv_series_data` VALUES (8364296610, '侦察记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/1988/e7b347cb6d109160b5f24187d56ea982.jpg', 'https://tv.2345.com/detail/1988.html', 9, '战争', 0, 3936);
INSERT INTO `tv_series_data` VALUES (8365439309, '临界婚姻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/1/3338/70c1b6ada16e02428961a570efd95455.jpg', 'https://tv.2345.com/detail/3338.html', 9.1, '伦理', 0, 6655);
INSERT INTO `tv_series_data` VALUES (8366328507, '风流戏王', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/73/5c8e1d1d231e035681b1c90181fb3b43.jpg', 'https://tv.2345.com/detail/73.html', 10, '伦理', 0, 3804);
INSERT INTO `tv_series_data` VALUES (8369432956, '门风传第一部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/18/s56662.jpg', 'https://tv.2345.com/detail/56662.html', 9.7, '家庭', 0, 3778);
INSERT INTO `tv_series_data` VALUES (8371108015, '闪婚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/964/d3809ced917d3e19039c5361c88d9e93.jpg', 'https://tv.2345.com/detail/964.html', 9.3, '家庭', 0, 6205);
INSERT INTO `tv_series_data` VALUES (8372381235, '商道天问', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/14/s42861.jpg', 'https://tv.2345.com/detail/42861.html', 7.7, '家庭', 0, 3770);
INSERT INTO `tv_series_data` VALUES (8373035757, '大校的女儿', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/3/10125/98a12e906ca90aea039fb8a49c433f16.jpg', 'https://tv.2345.com/detail/10125.html', 9.5, '家庭', 0, 5315);
INSERT INTO `tv_series_data` VALUES (8374884224, '一世牵挂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/2/7149/2d87c0002afb77c9181f7b92003de80e.jpg', 'https://tv.2345.com/detail/7149.html', 8.9, '家庭', 0, 4584);
INSERT INTO `tv_series_data` VALUES (8375463948, '铁在烧', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/15/s45633.jpg?1439456651', 'https://tv.2345.com/detail/45633.html', 8.5, '战争', 0, 5809);
INSERT INTO `tv_series_data` VALUES (8377266171, '大刀记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/15/s45394.jpg?1421633938', 'https://tv.2345.com/detail/45394.html', 9, '战争', 0, 5201);
INSERT INTO `tv_series_data` VALUES (8378062788, '老虎队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/18/s56233.jpg', 'https://tv.2345.com/detail/56233.html', 8.3, '军旅', 0, 3969);
INSERT INTO `tv_series_data` VALUES (8379073675, '谁是我爸爸', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/2758/37067b444bd005ccab68542e493924ae.jpg', 'https://tv.2345.com/detail/2758.html', 6.3, '伦理', 0, 7327);
INSERT INTO `tv_series_data` VALUES (8379473648, '保姆妈妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/280/0baa1ee618efe9c00de513ad047a7b7a.jpg', 'https://tv.2345.com/detail/280.html', 8.8, '伦理', 0, 4896);
INSERT INTO `tv_series_data` VALUES (8381062084, '爱与恨', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/2305/657e02b094a992579bf939204ea4182c.jpg', 'https://tv.2345.com/detail/2305.html', 6.6, '家庭', 0, 3482);
INSERT INTO `tv_series_data` VALUES (8383727477, '内线', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/702/198467d4edca4901fc6b7b9397257253.jpg', 'https://tv.2345.com/detail/702.html', 9.3, '战争', 0, 3198);
INSERT INTO `tv_series_data` VALUES (8384371436, '鸳鸯河', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/248/7f99803101781ccb407cba5e957669ab.jpg', 'https://tv.2345.com/detail/248.html', 8.8, '家庭', 0, 6003);
INSERT INTO `tv_series_data` VALUES (8385572669, '誓言今生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/2/7680/98bfd829b2d201c50aaa832f24448115.jpg', 'https://tv.2345.com/detail/7680.html', 9.7, '战争', 0, 7809);
INSERT INTO `tv_series_data` VALUES (8386036080, '掌门女婿', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/1/e.jpg', 'https://tv.2345.com/detail/11672.html', 8.8, '家庭', 0, 3339);
INSERT INTO `tv_series_data` VALUES (8386319472, '所谓婚姻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/13/57a25361e6398aabbef58642c78d2de6.jpg', 'https://tv.2345.com/detail/13.html', 9, '家庭', 0, 3426);
INSERT INTO `tv_series_data` VALUES (8386747039, '樱桃红', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/6/18922/79694ccd986a1d79ee25ef8ca60e2f7a.jpg', 'https://tv.2345.com/detail/18922.html', 9.2, '家庭', 0, 4701);
INSERT INTO `tv_series_data` VALUES (8386889658, '伟大的转折', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/18/s56550.jpg', 'https://tv.2345.com/detail/56550.html', 9.4, '战争', 0, 5851);
INSERT INTO `tv_series_data` VALUES (8387831614, '全能星人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/15/s45442.jpg', 'https://tv.2345.com/detail/45442.html', 7.5, '其他', 0, 7451);
INSERT INTO `tv_series_data` VALUES (8389581767, '养父', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/940/dade47685a30d25b019571468b68223a.jpg', 'https://tv.2345.com/detail/940.html', 9.4, '家庭', 0, 4164);
INSERT INTO `tv_series_data` VALUES (8389901524, '徽州女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/3/9733/82c6d6299ffbe08e92e68694128244fa.jpg', 'https://tv.2345.com/detail/9733.html', 10, '家庭', 0, 5659);
INSERT INTO `tv_series_data` VALUES (8391775818, '绝密孝金', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/19/s59036.jpg', 'https://tv.2345.com/detail/59036.html', 9.1, '悬疑', 0, 3580);
INSERT INTO `tv_series_data` VALUES (8392547737, '雪域雄鹰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/15/s47391.jpg?1446689812', 'https://tv.2345.com/detail/47391.html', 8.5, '军旅', 0, 3316);
INSERT INTO `tv_series_data` VALUES (8392822931, '第二十二条婚规', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/6/s20167.jpg?1363486542', 'https://tv.2345.com/detail/20167.html', 9.2, '家庭', 0, 7597);
INSERT INTO `tv_series_data` VALUES (8395410808, '赖汉的幸福指数', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/8/s25557.jpg?1379556260', 'https://tv.2345.com/detail/25557.html', 8.7, '家庭', 0, 5401);
INSERT INTO `tv_series_data` VALUES (8404958431, '绽放吧百合DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/18/s56047.jpg', 'https://tv.2345.com/detail/56047.html', 7.4, '家庭', 0, 7879);
INSERT INTO `tv_series_data` VALUES (8408330194, '密使', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/2/8062/c16f67daa29bbcd391a5b95a289329f2.jpg', 'https://tv.2345.com/detail/8062.html', 8.4, '战争', 0, 6386);
INSERT INTO `tv_series_data` VALUES (8413465970, '以家人之名凌霄成长日记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/19/s57868.jpg', 'https://tv.2345.com/detail/57868.html', 7.7, '家庭', 0, 7292);
INSERT INTO `tv_series_data` VALUES (8418511634, '兄弟们上', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/15/s45465.jpg', 'https://tv.2345.com/detail/45465.html', 7.8, '战争', 0, 6343);
INSERT INTO `tv_series_data` VALUES (8419581235, '黑白之门', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/2/6914/e74676396396e0b37bff0b165d547e4d.jpg', 'https://tv.2345.com/detail/6914.html', 10, '家庭', 0, 4418);
INSERT INTO `tv_series_data` VALUES (8420020543, '再过把瘾', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/3/1.jpg', 'https://tv.2345.com/detail/277.html', 9.3, '家庭', 0, 4831);
INSERT INTO `tv_series_data` VALUES (8423167502, '看不见的背后', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/10/s30664.jpg', 'https://tv.2345.com/detail/30664.html', 7.5, '伦理', 0, 5835);
INSERT INTO `tv_series_data` VALUES (8424838619, '杀出绝地', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/1/4315/2947f0751cbb062a81564c0548e51d4f.jpg', 'https://tv.2345.com/detail/4315.html', 8.8, '军旅', 0, 6720);
INSERT INTO `tv_series_data` VALUES (8425097797, '闯荡', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/624/3fe19ff260dfc4c477add1a9d5cc6260.jpg', 'https://tv.2345.com/detail/624.html', 10, '家庭', 0, 6463);
INSERT INTO `tv_series_data` VALUES (8425925685, '我的体育老师DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/18/s54039.jpg?1511501896', 'https://tv.2345.com/detail/54039.html', 9.3, '家庭', 0, 5894);
INSERT INTO `tv_series_data` VALUES (8430201845, '出生入死', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/7/s23224.jpg?1372737116', 'https://tv.2345.com/detail/23224.html', 8.6, '战争', 0, 7841);
INSERT INTO `tv_series_data` VALUES (8432231855, '都市外乡人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/2/8382/304c124102f3a2c87ff48a624080a611.jpg', 'https://tv.2345.com/detail/8382.html', 10, '家庭', 0, 5175);
INSERT INTO `tv_series_data` VALUES (8433836960, '南国有佳人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/3/9880/705c88260721b8ab0b577f14ef10d156.jpg', 'https://tv.2345.com/detail/9880.html', 8.9, '家庭', 0, 7592);
INSERT INTO `tv_series_data` VALUES (8434269597, '瑞雪丰年', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/2/s6896.jpg', 'https://tv.2345.com/detail/17353.html', 8.8, '家庭', 0, 3570);
INSERT INTO `tv_series_data` VALUES (8440861863, '黄金密码', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/3/s11581.jpg', 'https://tv.2345.com/detail/11581.html', 7.6, '战争', 0, 5255);
INSERT INTO `tv_series_data` VALUES (8443997196, '战争与和平', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/16/s48998.jpg', 'https://tv.2345.com/detail/48998.html', 8.6, '战争', 0, 7984);
INSERT INTO `tv_series_data` VALUES (8447016055, '红色电波', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/497/ac28c21c2827ff7e31d566c22ed8059c.jpg', 'https://tv.2345.com/detail/497.html', 9.1, '战争', 0, 4998);
INSERT INTO `tv_series_data` VALUES (8456416192, '家里家外', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/1/5702/6a9f4870649eadd2c865f5fb4d64a92a.jpg', 'https://tv.2345.com/detail/5702.html', 8.8, '家庭', 0, 7141);
INSERT INTO `tv_series_data` VALUES (8456645049, '康定情歌', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/2178/e09e1be578aa7ff90a2e0eab940cd90b.jpg', 'https://tv.2345.com/detail/2178.html', 9.2, '家庭', 0, 7263);
INSERT INTO `tv_series_data` VALUES (8457499202, '红楼梦', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/17/s51524.jpg', 'https://tv.2345.com/detail/51524.html', 9.9, '家庭', 0, 7148);
INSERT INTO `tv_series_data` VALUES (8459876569, '乱世兄弟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/1/3186/s3186.jpg', 'https://tv.2345.com/detail/3186.html', 8.7, '战争', 0, 5137);
INSERT INTO `tv_series_data` VALUES (8465677888, '等你回家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/5/s15233.jpg?1481705812', 'https://tv.2345.com/detail/15233.html', 7.9, '家庭', 0, 6217);
INSERT INTO `tv_series_data` VALUES (8466407638, '伪装者TV剪辑版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/16/s50093.jpg', 'https://tv.2345.com/detail/50093.html', 9.6, '悬疑', 0, 3933);
INSERT INTO `tv_series_data` VALUES (8468265800, '雪浴昆仑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/2/s8908.jpg', 'https://tv.2345.com/detail/8908.html', 9.2, '战争', 0, 7829);
INSERT INTO `tv_series_data` VALUES (8469171667, '绝境铸剑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/19/s57104.jpg', 'https://tv.2345.com/detail/57104.html', 7.9, '战争', 0, 7335);
INSERT INTO `tv_series_data` VALUES (8470020323, '反恐特战队之猎影', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/17/s53295.jpg?1499068908', 'https://tv.2345.com/detail/53295.html', 8.9, '军旅', 0, 3484);
INSERT INTO `tv_series_data` VALUES (8472582559, '爸爸快长大', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/13/s40805.jpg?1449452070', 'https://tv.2345.com/detail/40805.html', 8.5, '家庭', 0, 6096);
INSERT INTO `tv_series_data` VALUES (8476049737, '安息香', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/20/s61135.jpg', 'https://tv.2345.com/detail/61135.html', 8.9, '家庭', 0, 4107);
INSERT INTO `tv_series_data` VALUES (8477112728, '快把我哥带走', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/18/s54959.jpg', 'https://tv.2345.com/detail/54959.html', 9.5, '家庭', 0, 4162);
INSERT INTO `tv_series_data` VALUES (8477915191, '瑶山大剿匪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/1/5772/99ea47efda98e0d30c235c7b67b08785.jpg', 'https://tv.2345.com/detail/5772.html', 8.8, '战争', 0, 5095);
INSERT INTO `tv_series_data` VALUES (8480552786, '人到中年', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/183/db6eb3be361c68cc1134e6b89128f97d.jpg', 'https://tv.2345.com/detail/183.html', 9.3, '伦理', 0, 6322);
INSERT INTO `tv_series_data` VALUES (8481362709, '幸福敲了两次门', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/19/s57270.jpg', 'https://tv.2345.com/detail/57270.html', 8.8, '家庭', 0, 7672);
INSERT INTO `tv_series_data` VALUES (8482071194, '远远的爱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/2/7597/557c96e5dce4edbb264d3405edb31b74.jpg', 'https://tv.2345.com/detail/7597.html', 8.4, '家庭', 0, 5489);
INSERT INTO `tv_series_data` VALUES (8483439590, '妈妈的爱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/1/s3079.jpg?1422602299', 'https://tv.2345.com/detail/3079.html', 6.2, '家庭', 0, 6676);
INSERT INTO `tv_series_data` VALUES (8485745628, '邻居冤家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/879/5e2bab1e816c7c4a309bb54313bfeaa0.jpg', 'https://tv.2345.com/detail/879.html', 6.1, '家庭', 0, 6252);
INSERT INTO `tv_series_data` VALUES (8486161455, '解放海南岛', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/2/8411/ff85e3a0b994326efe7a2265936093c9.jpg', 'https://tv.2345.com/detail/8411.html', 9.2, '战争', 0, 3596);
INSERT INTO `tv_series_data` VALUES (8487696090, '南岳龙蛇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/20/s60847.jpg', 'https://tv.2345.com/detail/60847.html', 8.8, '战争', 0, 3633);
INSERT INTO `tv_series_data` VALUES (8490036613, '我和老妈一起嫁', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/3/s10015.jpg', 'https://tv.2345.com/detail/10015.html', 9.2, '伦理', 0, 6164);
INSERT INTO `tv_series_data` VALUES (8492128490, '荷花淀女人和枪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/17/s53023.jpg', 'https://tv.2345.com/detail/53023.html', 8.7, '战争', 0, 5258);
INSERT INTO `tv_series_data` VALUES (8493735471, '爱的厘米TV剪辑版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/19/s58676.png', 'https://tv.2345.com/detail/58676.html', 9, '家庭', 0, 7467);
INSERT INTO `tv_series_data` VALUES (8499847116, '我和我的父亲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/29/s29.jpg', 'https://tv.2345.com/detail/29.html', 8.8, '伦理', 0, 5715);
INSERT INTO `tv_series_data` VALUES (8502477987, '我的土地我的家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/4/9.jpg', 'https://tv.2345.com/detail/18154.html', 9.2, '家庭', 0, 7698);
INSERT INTO `tv_series_data` VALUES (8506000255, '七妹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/819/cbd0fd6d2a175b581d5d6be9f920749c.jpg', 'https://tv.2345.com/detail/819.html', 10, '战争', 0, 3498);
INSERT INTO `tv_series_data` VALUES (8506245282, '养母的花样年华', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/18/s54553.jpg', 'https://tv.2345.com/detail/54553.html', 9.2, '家庭', 0, 7859);
INSERT INTO `tv_series_data` VALUES (8508643361, '妻子2018泰语版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/18/s56869.jpg', 'https://tv.2345.com/detail/56869.html', 9.5, '家庭', 0, 4150);
INSERT INTO `tv_series_data` VALUES (8512972516, '爸爸别走', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/1779/9742e48950da5c8498dd3460e266edc8.jpg', 'https://tv.2345.com/detail/1779.html', 8.8, '伦理', 0, 3332);
INSERT INTO `tv_series_data` VALUES (8520295131, '空房子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/1259/11a17c9973a28e015c71690c0997690f.jpg', 'https://tv.2345.com/detail/1259.html', 8.8, '家庭', 0, 5125);
INSERT INTO `tv_series_data` VALUES (8521681322, '浴火危城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/5/s17700.jpg?1408616914', 'https://tv.2345.com/detail/17700.html', 9.3, '伦理', 0, 4558);
INSERT INTO `tv_series_data` VALUES (8525693324, '五妹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/2407/9388625f983190d9088095b4409642bd.jpg', 'https://tv.2345.com/detail/2407.html', 10, '家庭', 0, 4484);
INSERT INTO `tv_series_data` VALUES (8526696558, '侦察记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/1988/e7b347cb6d109160b5f24187d56ea982.jpg', 'https://tv.2345.com/detail/1988.html', 9, '军旅', 0, 3664);
INSERT INTO `tv_series_data` VALUES (8529510719, '暗战风云', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/16/s50243.jpg', 'https://tv.2345.com/detail/50243.html', 8.7, '战争', 0, 5129);
INSERT INTO `tv_series_data` VALUES (8530135127, '等到胜利那一天', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/1/5458/e72b0ea98e72ba7fc0035065b830800d.jpg', 'https://tv.2345.com/detail/5458.html', 9, '战争', 0, 4743);
INSERT INTO `tv_series_data` VALUES (8535564331, '正阳门下小女人DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/18/s55367.jpg', 'https://tv.2345.com/detail/55367.html', 9.5, '家庭', 0, 7820);
INSERT INTO `tv_series_data` VALUES (8535774879, '壮士出川', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/9/s28539.jpg?1388719279', 'https://tv.2345.com/detail/28539.html', 8.5, '战争', 0, 7547);
INSERT INTO `tv_series_data` VALUES (8536970781, '红鲨突击', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/18/s56794.jpg', 'https://tv.2345.com/detail/56794.html', 9.8, '战争', 0, 4625);
INSERT INTO `tv_series_data` VALUES (8542106897, '风雨中国心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/18/s55155.jpg', 'https://tv.2345.com/detail/55155.html', 9.4, '战争', 0, 7377);
INSERT INTO `tv_series_data` VALUES (8549684872, '恋爱真美', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/16/s50468.jpg?1477985411', 'https://tv.2345.com/detail/50468.html', 8.6, '家庭', 0, 4128);
INSERT INTO `tv_series_data` VALUES (8550215802, '幸福满满', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/6/s18408.jpg?1365314338', 'https://tv.2345.com/detail/18408.html', 8.5, '伦理', 0, 7206);
INSERT INTO `tv_series_data` VALUES (8552448163, '一往无前', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/18/s56140.jpg', 'https://tv.2345.com/detail/56140.html', 9.8, '悬疑', 0, 7619);
INSERT INTO `tv_series_data` VALUES (8553285101, '决战燕子门', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/8/s26712.jpg?1383271213', 'https://tv.2345.com/detail/26712.html', 8.6, '战争', 0, 5789);
INSERT INTO `tv_series_data` VALUES (8556861739, '间谍家族', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/2205/b010428636b9b262a1217c1a60dc1d32.jpg', 'https://tv.2345.com/detail/2205.html', 8.8, '战争', 0, 4996);
INSERT INTO `tv_series_data` VALUES (8560090723, '奇志', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/99/s99.jpg', 'https://tv.2345.com/detail/99.html', 8.8, '战争', 0, 3814);
INSERT INTO `tv_series_data` VALUES (8564555137, '大地情深', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/4/s14909.jpg?1379293954', 'https://tv.2345.com/detail/14909.html', 8.7, '伦理', 0, 5273);
INSERT INTO `tv_series_data` VALUES (8569050867, '雷哥老范', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/247/s247.jpg', 'https://tv.2345.com/detail/247.html', 8.4, '家庭', 0, 3935);
INSERT INTO `tv_series_data` VALUES (8569728531, '角力', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/0/s2111.jpg?1411118785', 'https://tv.2345.com/detail/2111.html', 7.6, '悬疑', 0, 7356);
INSERT INTO `tv_series_data` VALUES (8571439337, '金枝欲孽1国语版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/1518/47a9ed4ce2b1b438cec06bfaba24516f.jpg', 'https://tv.2345.com/detail/1518.html', 9.1, '悬疑', 0, 4465);
INSERT INTO `tv_series_data` VALUES (8576342757, '踏破硝烟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/16/s48947.jpg?1467165499', 'https://tv.2345.com/detail/48947.html', 8.5, '战争', 0, 5789);
INSERT INTO `tv_series_data` VALUES (8577662048, '尖锋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/8/s26946.jpg?1383969122', 'https://tv.2345.com/detail/26946.html', 8.5, '战争', 0, 3911);
INSERT INTO `tv_series_data` VALUES (8579696620, '我的父亲是板凳', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/814/8996b3c2ae7725ab658475527d05274f.jpg', 'https://tv.2345.com/detail/814.html', 8.8, '战争', 0, 5037);
INSERT INTO `tv_series_data` VALUES (8583769767, '侠探高飞', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/19/s59238.jpg', 'https://tv.2345.com/detail/59238.html', 8.8, '悬疑', 0, 3224);
INSERT INTO `tv_series_data` VALUES (8584206792, '秋去秋来', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/3/9734/95e4f989bb39ac9baa77469a4bb28e0d.jpg', 'https://tv.2345.com/detail/9734.html', 8.8, '家庭', 0, 3365);
INSERT INTO `tv_series_data` VALUES (8586519048, '铁道游击队第二部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/17/s53833.jpg', 'https://tv.2345.com/detail/53833.html', 7.1, '战争', 0, 4296);
INSERT INTO `tv_series_data` VALUES (8587524414, '生活秀', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/2363/s2363.jpg', 'https://tv.2345.com/detail/2363.html', 9.4, '家庭', 0, 3710);
INSERT INTO `tv_series_data` VALUES (8589768907, '少主且慢行第一季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/19/s57219.jpg', 'https://tv.2345.com/detail/57219.html', 9.6, '悬疑', 0, 6564);
INSERT INTO `tv_series_data` VALUES (8595761928, '寒冬', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/11/s33357.jpg?1419929866', 'https://tv.2345.com/detail/33357.html', 8.8, '战争', 0, 3184);
INSERT INTO `tv_series_data` VALUES (8597233051, '楼外楼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/18/s54797.jpg', 'https://tv.2345.com/detail/54797.html', 8.8, '战争', 0, 5269);
INSERT INTO `tv_series_data` VALUES (8602362936, '陪你漫步这个世界', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/19/s58892.jpg', 'https://tv.2345.com/detail/58892.html', 9.8, '家庭', 0, 4665);
INSERT INTO `tv_series_data` VALUES (8602616966, '爱情句号', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/1121/55a911c6f08608b396302d2d5646c1a5.jpg', 'https://tv.2345.com/detail/1121.html', 8.9, '伦理', 0, 7206);
INSERT INTO `tv_series_data` VALUES (8604993746, '《原始疯狂人》第一季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/16/s48261.jpg', 'https://tv.2345.com/detail/48261.html', 9.1, '悬疑', 0, 3569);
INSERT INTO `tv_series_data` VALUES (8609008959, '清凌凌的水蓝莹莹的天', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/1203/fbb57b3228983f8b40861844f90189f8.jpg', 'https://tv.2345.com/detail/1203.html', 9.3, '家庭', 0, 4379);
INSERT INTO `tv_series_data` VALUES (8610815169, '原来就是你', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/0/s2195.jpg?1362650093', 'https://tv.2345.com/detail/2195.html', 8.4, '家庭', 0, 5566);
INSERT INTO `tv_series_data` VALUES (8611164742, '游击兵工厂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/5/s16649.jpg?1371696731', 'https://tv.2345.com/detail/16649.html', 8.5, '战争', 0, 6866);
INSERT INTO `tv_series_data` VALUES (8616627845, '射天狼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/7/s21782.jpg?1427444257', 'https://tv.2345.com/detail/21782.html', 8.8, '战争', 0, 6036);
INSERT INTO `tv_series_data` VALUES (8621035704, '台湾往事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/18/s54377.jpg?1516590031', 'https://tv.2345.com/detail/54377.html', 8.7, '战争', 0, 7004);
INSERT INTO `tv_series_data` VALUES (8622139602, '男人底线', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/2/7907/e6041595f873c5cd3018e92a801952cb.jpg', 'https://tv.2345.com/detail/7907.html', 9.2, '伦理', 0, 6828);
INSERT INTO `tv_series_data` VALUES (8625156969, '妈妈的花样年华', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/8/s25108.jpg?1378258467', 'https://tv.2345.com/detail/25108.html', 8.6, '家庭', 0, 7448);
INSERT INTO `tv_series_data` VALUES (8625712039, '同门兄弟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/18/s56646.jpg', 'https://tv.2345.com/detail/56646.html', 8.8, '战争', 0, 3167);
INSERT INTO `tv_series_data` VALUES (8627796535, '面具DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/18/s55048.jpg', 'https://tv.2345.com/detail/55048.html', 9.1, '战争', 0, 4010);
INSERT INTO `tv_series_data` VALUES (8630410136, '滇西1944', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/201/566a4738eca6c19b53c9c07c6d626b8e.jpg', 'https://tv.2345.com/detail/201.html', 9.2, '军旅', 0, 3765);
INSERT INTO `tv_series_data` VALUES (8631040019, '北京我的爱国语版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/13/s41022.jpg?1409197231', 'https://tv.2345.com/detail/41022.html', 8.1, '家庭', 0, 5714);
INSERT INTO `tv_series_data` VALUES (8631780457, '北平往事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/3/s9662.jpg', 'https://tv.2345.com/detail/9662.html', 6.7, '伦理', 0, 7183);
INSERT INTO `tv_series_data` VALUES (8632535268, '富滇风云', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/10/s32619.jpg', 'https://tv.2345.com/detail/32619.html', 8.4, '战争', 0, 4857);
INSERT INTO `tv_series_data` VALUES (8640015871, '战北平', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/64/24d342a7f1038d4668bccfe652d88625.jpg', 'https://tv.2345.com/detail/64.html', 9.3, '战争', 0, 3682);
INSERT INTO `tv_series_data` VALUES (8640179012, '想飞', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/2364/5d76532783d8e2795b4ca70c7376a3c1.jpg', 'https://tv.2345.com/detail/2364.html', 9.1, '家庭', 0, 3836);
INSERT INTO `tv_series_data` VALUES (8641503430, '西部之恋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/2406/466761996fc10ad27e34d7d362de307f.jpg', 'https://tv.2345.com/detail/2406.html', 8.7, '家庭', 0, 4381);
INSERT INTO `tv_series_data` VALUES (8645362217, '民主之澜', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/0/s250.jpg?1411875974', 'https://tv.2345.com/detail/250.html', 10, '战争', 0, 5834);
INSERT INTO `tv_series_data` VALUES (8647520930, '铁血玫瑰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/7/s22560.jpg?1371440197', 'https://tv.2345.com/detail/22560.html', 8.8, '战争', 0, 6530);
INSERT INTO `tv_series_data` VALUES (8649948226, '深宫谍影', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/2/7711/ac48dad5ec3fc83f955cbf7e0e6ce5c0.jpg', 'https://tv.2345.com/detail/7711.html', 8.3, '悬疑', 0, 6779);
INSERT INTO `tv_series_data` VALUES (8654124752, '回家的欲望卫视版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/16/s49121.jpg', 'https://tv.2345.com/detail/49121.html', 7.6, '家庭', 0, 4823);
INSERT INTO `tv_series_data` VALUES (8654825519, '历史的使命', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/20/s60919.jpg', 'https://tv.2345.com/detail/60919.html', 7.3, '战争', 0, 4227);
INSERT INTO `tv_series_data` VALUES (8656158118, '莫让情两难', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/1/5602/fd03b71fc378dc06fb4da1b66e91b1b0.jpg', 'https://tv.2345.com/detail/5602.html', 10, '家庭', 0, 3631);
INSERT INTO `tv_series_data` VALUES (8656890041, '火蓝刀锋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/5/s15500.jpg?1483498560', 'https://tv.2345.com/detail/15500.html', 9.7, '战争', 0, 3860);
INSERT INTO `tv_series_data` VALUES (8663225288, '酒民胡四海', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/2/s6675.jpg', 'https://tv.2345.com/detail/6675.html', 8.7, '伦理', 0, 3359);
INSERT INTO `tv_series_data` VALUES (8664343990, '妻子的秘密卫视版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/10/s32173.jpg?1395105985', 'https://tv.2345.com/detail/32173.html', 8.8, '伦理', 0, 6588);
INSERT INTO `tv_series_data` VALUES (8665883881, '在那遥远的地方', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/8/5b62a1f695ae5b6e38edc465b0a859a8.jpg', 'https://tv.2345.com/detail/8.html', 9.3, '战争', 0, 3102);
INSERT INTO `tv_series_data` VALUES (8666545154, '人间烟火', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/7/2219.jpg', 'https://tv.2345.com/detail/2219.html', 8.8, '家庭', 0, 6943);
INSERT INTO `tv_series_data` VALUES (8666989539, '铁血战狼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/16/s48336.jpg?1459219445', 'https://tv.2345.com/detail/48336.html', 8.4, '战争', 0, 3617);
INSERT INTO `tv_series_data` VALUES (8671053151, '亲爱的孩子们', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/20/s61202.jpg', 'https://tv.2345.com/detail/61202.html', 9.8, '家庭', 0, 6846);
INSERT INTO `tv_series_data` VALUES (8671391804, '代号021', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/3/10121/a28faad55af456cb7611f10a8f7e3259.jpg', 'https://tv.2345.com/detail/10121.html', 10, '战争', 0, 6695);
INSERT INTO `tv_series_data` VALUES (8671692714, '那年来了鬼子兵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/19/s58814.png', 'https://tv.2345.com/detail/58814.html', 8.9, '战争', 0, 5311);
INSERT INTO `tv_series_data` VALUES (8674218469, '法医秦明之幸存者', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/18/s55091.jpg', 'https://tv.2345.com/detail/55091.html', 9.3, '悬疑', 0, 7758);
INSERT INTO `tv_series_data` VALUES (8676016189, '与狼共舞2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/9/s28369.jpg?1387948654', 'https://tv.2345.com/detail/28369.html', 8.6, '悬疑', 0, 6184);
INSERT INTO `tv_series_data` VALUES (8682764919, '锣鼓巷', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/318/105bf06c115cf43e00c835fdb324df91.jpg', 'https://tv.2345.com/detail/318.html', 8.9, '家庭', 0, 3146);
INSERT INTO `tv_series_data` VALUES (8688788053, '第一伞兵队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/13/s41310.jpg?1444363315', 'https://tv.2345.com/detail/41310.html', 8.5, '战争', 0, 4815);
INSERT INTO `tv_series_data` VALUES (8690877776, '生死兄弟情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/15/s46549.jpg', 'https://tv.2345.com/detail/46549.html', 8.4, '战争', 0, 3419);
INSERT INTO `tv_series_data` VALUES (8694612898, '妈妈在等你', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/19/s59025.jpg', 'https://tv.2345.com/detail/59025.html', 8.2, '家庭', 0, 7998);
INSERT INTO `tv_series_data` VALUES (8695707867, '婚姻那些事儿', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/987/s987.jpg', 'https://tv.2345.com/detail/987.html', 8.7, '家庭', 0, 5337);
INSERT INTO `tv_series_data` VALUES (8698199745, '薛仁贵传奇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/162/626d1d043893dc6138924d7030a6db6d.jpg', 'https://tv.2345.com/detail/162.html', 9.1, '战争', 0, 6894);
INSERT INTO `tv_series_data` VALUES (8699763515, '决不妥协', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/2385/4f6657fd6982c1209940ed1eb87b5a81.jpg', 'https://tv.2345.com/detail/17350.html', 8.8, '伦理', 0, 7208);
INSERT INTO `tv_series_data` VALUES (8706804180, '致命名单', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/e/19295.jpg', 'https://tv.2345.com/detail/19295.html', 9.2, '悬疑', 0, 6704);
INSERT INTO `tv_series_data` VALUES (8709122973, '战地青春之歌', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/20/s61227.jpg', 'https://tv.2345.com/detail/61227.html', 7.3, '战争', 0, 7627);
INSERT INTO `tv_series_data` VALUES (8710996100, '铁血军歌', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/20/s60939.jpg', 'https://tv.2345.com/detail/60939.html', 7.1, '战争', 0, 6803);
INSERT INTO `tv_series_data` VALUES (8713198967, '迫在眉睫', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/15/s46781.jpg?1438846968', 'https://tv.2345.com/detail/46781.html', 8.4, '悬疑', 0, 3999);
INSERT INTO `tv_series_data` VALUES (8713359190, '非常有喜', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/6/s19313.jpg?1388111806', 'https://tv.2345.com/detail/19313.html', 8.3, '家庭', 0, 3335);
INSERT INTO `tv_series_data` VALUES (8714819468, '密令1949', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/1274/4e8df2c109696908d78a848c2f08c39d.jpg', 'https://tv.2345.com/detail/1274.html', 10, '战争', 0, 3064);
INSERT INTO `tv_series_data` VALUES (8717840153, '婆婆来了DVD', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/18/s54422.jpg', 'https://tv.2345.com/detail/54422.html', 7.2, '家庭', 0, 7954);
INSERT INTO `tv_series_data` VALUES (8718587031, '守卫者浮出水面', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/15/s46865.jpg?1476261844', 'https://tv.2345.com/detail/46865.html', 8.6, '悬疑', 0, 3941);
INSERT INTO `tv_series_data` VALUES (8718878071, '我们队伍向太阳', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/1/4270/645f52642dbb3e1dce743ff8346b3f65.jpg', 'https://tv.2345.com/detail/4270.html', 9.1, '战争', 0, 4120);
INSERT INTO `tv_series_data` VALUES (8723001313, '蚂蚱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/16/s48282.jpg?1458525793', 'https://tv.2345.com/detail/48282.html', 8.3, '战争', 0, 6159);
INSERT INTO `tv_series_data` VALUES (8727356053, '警察李酒瓶', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/16/s48581.jpg', 'https://tv.2345.com/detail/48581.html', 9.1, '伦理', 0, 6609);
INSERT INTO `tv_series_data` VALUES (8730066498, '特殊使命', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/1194/a73b0ca5d8a6e01d14a96cf80e665d2d.jpg', 'https://tv.2345.com/detail/1194.html', 9.4, '战争', 0, 7268);
INSERT INTO `tv_series_data` VALUES (8732245731, '顾乐家的幸福生活', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/2/d.jpg', 'https://tv.2345.com/detail/11633.html', 6.8, '伦理', 0, 5722);
INSERT INTO `tv_series_data` VALUES (8734085488, '决战华岩寺', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/1771/b0bee5e6405cf870af683d9da6434c70.jpg', 'https://tv.2345.com/detail/1771.html', 9.2, '战争', 0, 6005);
INSERT INTO `tv_series_data` VALUES (8734486080, '法律至上1', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/20/s60947.jpg', 'https://tv.2345.com/detail/60947.html', 9.8, '家庭', 0, 7837);
INSERT INTO `tv_series_data` VALUES (8737472771, '浪花淘尽', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/18/s56675.jpg', 'https://tv.2345.com/detail/56675.html', 8.8, '战争', 0, 6036);
INSERT INTO `tv_series_data` VALUES (8739140023, '周末父母DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/19/s57797.jpg', 'https://tv.2345.com/detail/57797.html', 8.8, '家庭', 0, 6079);
INSERT INTO `tv_series_data` VALUES (8739531824, '香草美人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/2/7827/89db6ba7e78016288b8ba4fe2c0f4ca8.jpg', 'https://tv.2345.com/detail/7827.html', 9.2, '战争', 0, 3029);
INSERT INTO `tv_series_data` VALUES (8757505867, '野山鹰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/15/s46698.jpg', 'https://tv.2345.com/detail/46698.html', 8.4, '战争', 0, 7667);
INSERT INTO `tv_series_data` VALUES (8760161717, '风雨沙坡头', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/2239/2c095ef1fe74a0f437c6a8d793b921cb.jpg', 'https://tv.2345.com/detail/2239.html', 8.9, '战争', 0, 3266);
INSERT INTO `tv_series_data` VALUES (8760381695, '守卫者浮出水面DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/17/s53451.jpg', 'https://tv.2345.com/detail/53451.html', 8.6, '悬疑', 0, 6896);
INSERT INTO `tv_series_data` VALUES (8762260916, '大江东去李幼斌版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/1/s3133.jpg?1431395056', 'https://tv.2345.com/detail/3133.html', 8.4, '悬疑', 0, 6735);
INSERT INTO `tv_series_data` VALUES (8764742855, '解放大西南', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/13/s41999.jpg?1411874456', 'https://tv.2345.com/detail/41999.html', 9, '战争', 0, 6545);
INSERT INTO `tv_series_data` VALUES (8768022145, '浪漫的事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/2/8399/4253f75d71cf1b07064e5e2b2f178d33.jpg', 'https://tv.2345.com/detail/8399.html', 10, '伦理', 0, 7771);
INSERT INTO `tv_series_data` VALUES (8768917501, '银杏飘落', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/1/5077/2096686c586a7edb11cbdd45e42a2374.jpg', 'https://tv.2345.com/detail/5077.html', 10, '家庭', 0, 7283);
INSERT INTO `tv_series_data` VALUES (8771433528, '家有儿女初长成', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/18/s54814.jpg?1528765403', 'https://tv.2345.com/detail/54814.html', 9.2, '家庭', 0, 6876);
INSERT INTO `tv_series_data` VALUES (8775015461, '宜昌保卫战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/16/s50141.jpg?1473643767', 'https://tv.2345.com/detail/50141.html', 8.4, '战争', 0, 5539);
INSERT INTO `tv_series_data` VALUES (8775120574, '瑶山大剿匪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/1/5772/99ea47efda98e0d30c235c7b67b08785.jpg', 'https://tv.2345.com/detail/5772.html', 8.8, '军旅', 0, 7630);
INSERT INTO `tv_series_data` VALUES (8778579218, '女人不容易', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/10/s30767.jpg?1450256647', 'https://tv.2345.com/detail/30767.html', 8.5, '家庭', 0, 6572);
INSERT INTO `tv_series_data` VALUES (8778853805, '血色沉香', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/275/9945c4dc6e71ad09ad8d912a5d2949fe.jpg', 'https://tv.2345.com/detail/275.html', 9.1, '家庭', 0, 6112);
INSERT INTO `tv_series_data` VALUES (8781910632, '飞虎神鹰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/2/7940/61db9b5f69b02bd86ce1e28a0490aa8a.jpg', 'https://tv.2345.com/detail/7940.html', 8.7, '悬疑', 0, 3332);
INSERT INTO `tv_series_data` VALUES (8782759989, '血泉', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/19/s58290.jpg', 'https://tv.2345.com/detail/58290.html', 8.8, '战争', 0, 6988);
INSERT INTO `tv_series_data` VALUES (8784762920, '队列之末', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/5/s17204.jpg?1375538894', 'https://tv.2345.com/detail/17204.html', 8.5, '战争', 0, 3303);
INSERT INTO `tv_series_data` VALUES (8788481803, '大路方圆', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/14/s44761.jpg', 'https://tv.2345.com/detail/44761.html', 7.5, '其他', 0, 3149);
INSERT INTO `tv_series_data` VALUES (8789694261, '苍天厚土', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/1/4256/12e870dd0336ab9cb58a26051ff15381.jpg', 'https://tv.2345.com/detail/4256.html', 8.8, '家庭', 0, 7274);
INSERT INTO `tv_series_data` VALUES (8789760913, '风云世家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/1/s4598.jpg?1410419607', 'https://tv.2345.com/detail/4598.html', 8.8, '家庭', 0, 7958);
INSERT INTO `tv_series_data` VALUES (8789762965, '都是兄弟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/6/19547/e1d6a7326e0b4c36ffd149af8f48c69f.jpg', 'https://tv.2345.com/detail/19547.html', 8.8, '家庭', 0, 7193);
INSERT INTO `tv_series_data` VALUES (8790779071, '红军东征', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/2/7845/6f4ec9cd014531177802a6d1cfec4555.jpg', 'https://tv.2345.com/detail/7845.html', 6.3, '战争', 0, 6520);
INSERT INTO `tv_series_data` VALUES (8791365980, '天鹅套索', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/2/s8637.jpg?1378957705', 'https://tv.2345.com/detail/8637.html', 8, '家庭', 0, 6227);
INSERT INTO `tv_series_data` VALUES (8791718417, '红色通道', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/11/s33257.jpg?1471847683', 'https://tv.2345.com/detail/33257.html', 8.5, '战争', 0, 6529);
INSERT INTO `tv_series_data` VALUES (8793121843, '幻影', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/3/s10041.jpg?1372211912', 'https://tv.2345.com/detail/10041.html', 8.3, '战争', 0, 5401);
INSERT INTO `tv_series_data` VALUES (8793375584, '信者无敌', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/16/s50442.jpg?1477878225', 'https://tv.2345.com/detail/50442.html', 8.4, '战争', 0, 3843);
INSERT INTO `tv_series_data` VALUES (8793811659, '爱的厘米DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/19/s58673.png', 'https://tv.2345.com/detail/58673.html', 8.8, '家庭', 0, 4019);
INSERT INTO `tv_series_data` VALUES (8795379495, '当婚姻走到尽头', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/2/6873/a81e5a2037415e3a07f64c33374e0fcc.jpg', 'https://tv.2345.com/detail/6873.html', 8.8, '家庭', 0, 6275);
INSERT INTO `tv_series_data` VALUES (8796352774, '我是特种兵1', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/0/s914.jpg', 'https://tv.2345.com/detail/914.html', 9.5, '战争', 0, 7178);
INSERT INTO `tv_series_data` VALUES (8798171430, '插树岭', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/2/s8523.jpg?1488265409', 'https://tv.2345.com/detail/8523.html', 8.9, '家庭', 0, 7480);
INSERT INTO `tv_series_data` VALUES (8798570006, '少年派DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/18/s56189.jpg', 'https://tv.2345.com/detail/56189.html', 9.8, '家庭', 0, 4451);
INSERT INTO `tv_series_data` VALUES (8802832493, '嫁入豪门', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/6/s19238.jpg?1484805242', 'https://tv.2345.com/detail/19238.html', 8.9, '伦理', 0, 7725);
INSERT INTO `tv_series_data` VALUES (8807268152, '乾隆王朝', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/221/68de7073374d3b935bf26e7888060fc8.jpg', 'https://tv.2345.com/detail/221.html', 9.3, '其他', 0, 7429);
INSERT INTO `tv_series_data` VALUES (8811283021, '妻子的反击', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/1043/s1043.jpg', 'https://tv.2345.com/detail/1043.html', 9.1, '家庭', 0, 7270);
INSERT INTO `tv_series_data` VALUES (8813928457, '中国式关系', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/16/s48985.jpg?1473390570', 'https://tv.2345.com/detail/48985.html', 8.6, '家庭', 0, 5513);
INSERT INTO `tv_series_data` VALUES (8814761713, '天若有情2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/4/12486/b94a7aa3e9d4b791bf20492139d19688.jpg', 'https://tv.2345.com/detail/12486.html', 9, '家庭', 0, 4932);
INSERT INTO `tv_series_data` VALUES (8817155438, '殊途同归第2季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/5/s17194.jpg?1376105058', 'https://tv.2345.com/detail/17194.html', 7.5, '伦理', 0, 6116);
INSERT INTO `tv_series_data` VALUES (8819768161, '双刺', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/15/s47249.jpg?1473642895', 'https://tv.2345.com/detail/47249.html', 8.4, '战争', 0, 7178);
INSERT INTO `tv_series_data` VALUES (8820758904, '重启之极海听雷第一季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/19/s57773.jpg', 'https://tv.2345.com/detail/57773.html', 9.7, '悬疑', 0, 6474);
INSERT INTO `tv_series_data` VALUES (8831669856, '政委', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/16/s50256.jpg?1476847236', 'https://tv.2345.com/detail/50256.html', 8.2, '战争', 0, 7789);
INSERT INTO `tv_series_data` VALUES (8831670475, '冰是睡着的水', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/1560/9b666919e128dabd0dcbc31946af66dd.jpg', 'https://tv.2345.com/detail/1560.html', 8.9, '军旅', 0, 6645);
INSERT INTO `tv_series_data` VALUES (8833130448, '国家审计', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/14/s42716.jpg', 'https://tv.2345.com/detail/42716.html', 7.3, '悬疑', 0, 7353);
INSERT INTO `tv_series_data` VALUES (8835136324, '区小队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/18/s55516.jpg', 'https://tv.2345.com/detail/55516.html', 9.8, '战争', 0, 7970);
INSERT INTO `tv_series_data` VALUES (8836805928, '荷花淀女人和枪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/17/s53506.jpg', 'https://tv.2345.com/detail/53506.html', 8.8, '战争', 0, 3213);
INSERT INTO `tv_series_data` VALUES (8846585134, '烽火英雄传', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/15/s46231.jpg', 'https://tv.2345.com/detail/46231.html', 8.8, '战争', 0, 3860);
INSERT INTO `tv_series_data` VALUES (8848106087, '英雄虎胆', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/3/10266/ea13367ecdf639fb7f329f41389b1d21.jpg', 'https://tv.2345.com/detail/10266.html', 10, '战争', 0, 7755);
INSERT INTO `tv_series_data` VALUES (8849258662, '剃刀边缘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/17/s52101.jpg?1490145286', 'https://tv.2345.com/detail/52101.html', 8.5, '悬疑', 0, 5904);
INSERT INTO `tv_series_data` VALUES (8852613865, '盗火线', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/f.jpg', 'https://tv.2345.com/detail/12038.html', 8.8, '战争', 0, 7347);
INSERT INTO `tv_series_data` VALUES (8858269753, '《叩响明天》双线影集纯享版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/19/s57869.jpg', 'https://tv.2345.com/detail/57869.html', 8.2, '其他', 0, 4732);
INSERT INTO `tv_series_data` VALUES (8859389608, '反恐特战队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/15/s47382.jpg?1499305476', 'https://tv.2345.com/detail/47382.html', 8.6, '悬疑', 0, 4495);
INSERT INTO `tv_series_data` VALUES (8863437357, '惊天大迷局', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/19/s58610.jpg', 'https://tv.2345.com/detail/58610.html', 8.7, '战争', 0, 6675);
INSERT INTO `tv_series_data` VALUES (8869637009, '查泰莱夫人的情人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/16/s50039.jpg', 'https://tv.2345.com/detail/50039.html', 7.2, '伦理', 0, 3685);
INSERT INTO `tv_series_data` VALUES (8874091774, '我和我的父亲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/29/s29.jpg', 'https://tv.2345.com/detail/29.html', 8.8, '家庭', 0, 4516);
INSERT INTO `tv_series_data` VALUES (8880979328, '龙须沟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/42/9066cb3157ca07ac074832bccfceec7f.jpg', 'https://tv.2345.com/detail/42.html', 9.3, '战争', 0, 5144);
INSERT INTO `tv_series_data` VALUES (8880982170, '王保长新篇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/0/s2754.jpg?1411523859', 'https://tv.2345.com/detail/2754.html', 8.2, '战争', 0, 6238);
INSERT INTO `tv_series_data` VALUES (8885143178, '我的亲爹和后爸', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/18/s55830.jpg', 'https://tv.2345.com/detail/55830.html', 7.8, '家庭', 0, 5647);
INSERT INTO `tv_series_data` VALUES (8888140251, '爸爸我怀了你的孩子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/1042/s1042.jpg', 'https://tv.2345.com/detail/1042.html', 6.6, '家庭', 0, 7889);
INSERT INTO `tv_series_data` VALUES (8891237587, '淘气包马小跳', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/915/s915.jpg', 'https://tv.2345.com/detail/915.html', 8.7, '家庭', 0, 6686);
INSERT INTO `tv_series_data` VALUES (8892203094, '远征远征', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/17/s53048.jpg', 'https://tv.2345.com/detail/53048.html', 8.5, '战争', 0, 4308);
INSERT INTO `tv_series_data` VALUES (8895665976, '错恨', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/2/8113/a5023de08625798016a2e6bae3988341.jpg', 'https://tv.2345.com/detail/8113.html', 8.9, '伦理', 0, 7824);
INSERT INTO `tv_series_data` VALUES (8896964262, '你的孩子不是你的孩子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/18/s56024.jpg', 'https://tv.2345.com/detail/56024.html', 9.8, '家庭', 0, 6672);
INSERT INTO `tv_series_data` VALUES (8900117994, '新包青天之七侠五义', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/0/s2214.jpg', 'https://tv.2345.com/detail/2214.html', 9.4, '悬疑', 0, 7954);
INSERT INTO `tv_series_data` VALUES (8901036478, '将门风云', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/2317/961a136c5532b440eb6ecaaf4739ebf3.jpg', 'https://tv.2345.com/detail/2317.html', 9.4, '军旅', 0, 5255);
INSERT INTO `tv_series_data` VALUES (8901744866, '星星知我心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/1/4886/5e3c59b53a1d451b15e531b31cdb1e58.jpg', 'https://tv.2345.com/detail/4886.html', 10, '家庭', 0, 5578);
INSERT INTO `tv_series_data` VALUES (8904016487, '铁石心肠', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/1.jpg', 'https://tv.2345.com/detail/949.html', 8.7, '家庭', 0, 4973);
INSERT INTO `tv_series_data` VALUES (8905126505, '米兰达第1季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/1/s3504.jpg', 'https://tv.2345.com/detail/3504.html', 7.7, '伦理', 0, 5150);
INSERT INTO `tv_series_data` VALUES (8908125589, '红岩', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/1962/a618c0113e0781a9e28b92529b98b8a8.jpg', 'https://tv.2345.com/detail/1962.html', 9.3, '军旅', 0, 4182);
INSERT INTO `tv_series_data` VALUES (8911552768, '结婚前规则', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/10/s32365.jpg?1395727763', 'https://tv.2345.com/detail/32365.html', 8.5, '家庭', 0, 5434);
INSERT INTO `tv_series_data` VALUES (8913359295, '风语', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/678/263615307d13cdb3b66eafe2cab21ddb.jpg', 'https://tv.2345.com/detail/678.html', 8.9, '战争', 0, 3843);
INSERT INTO `tv_series_data` VALUES (8915235894, '功勋柳云龙版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/20/s60930.jpg', 'https://tv.2345.com/detail/60930.html', 8.7, '战争', 0, 3627);
INSERT INTO `tv_series_data` VALUES (8917980558, '小兵张嘎电视剧', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/13/s39343.jpg?1410422062', 'https://tv.2345.com/detail/39343.html', 6.1, '军旅', 0, 6083);
INSERT INTO `tv_series_data` VALUES (8920225189, '生死劫杀1946', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/2/s6901.jpg?1410419752', 'https://tv.2345.com/detail/6901.html', 8.7, '战争', 0, 7523);
INSERT INTO `tv_series_data` VALUES (8922511330, '雪鹰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/14/s44590.jpg?1417672743', 'https://tv.2345.com/detail/44590.html', 8.2, '战争', 0, 3937);
INSERT INTO `tv_series_data` VALUES (8923593423, '港媳嫁到', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/16/s48778.jpg?1464919077', 'https://tv.2345.com/detail/48778.html', 8.4, '家庭', 0, 5674);
INSERT INTO `tv_series_data` VALUES (8927775548, '我在北京挺好的', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/11/s35342.jpg?1399535987', 'https://tv.2345.com/detail/35342.html', 8.4, '家庭', 0, 7779);
INSERT INTO `tv_series_data` VALUES (8928205636, '沉默的证人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/3/9603/3cfc7bb6d5cc48a28f07f869cef315f9.jpg', 'https://tv.2345.com/detail/9603.html', 8, '悬疑', 0, 7223);
INSERT INTO `tv_series_data` VALUES (8928446242, '当人心遇上仁心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/15/s45320.jpg', 'https://tv.2345.com/detail/45320.html', 8, '家庭', 0, 3619);
INSERT INTO `tv_series_data` VALUES (8935008506, '烽火抗大', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/19/s59273.jpg', 'https://tv.2345.com/detail/59273.html', 9.8, '战争', 0, 4533);
INSERT INTO `tv_series_data` VALUES (8935050143, '铁家伙', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/20/s61404.jpg', 'https://tv.2345.com/detail/61404.html', 8, '战争', 0, 4315);
INSERT INTO `tv_series_data` VALUES (8937289677, '我是特种兵2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/5/9.jpg', 'https://tv.2345.com/detail/15557.html', 9.4, '战争', 0, 7099);
INSERT INTO `tv_series_data` VALUES (8937606416, '无证之罪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/17/s53484.jpg?1502947157', 'https://tv.2345.com/detail/53484.html', 9.2, '悬疑', 0, 4799);
INSERT INTO `tv_series_data` VALUES (8940412934, '明德绣庄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/1280/6fa0f4dbad614727253a89992cf8fe32.jpg', 'https://tv.2345.com/detail/1280.html', 9.2, '家庭', 0, 6067);
INSERT INTO `tv_series_data` VALUES (8941417674, '当我们同在一起', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/2102/s2102.jpg', 'https://tv.2345.com/detail/2102.html', 9.4, '家庭', 0, 3263);
INSERT INTO `tv_series_data` VALUES (8942300669, '头号前妻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/3/s9301.jpg?1460948614', 'https://tv.2345.com/detail/9301.html', 8.5, '家庭', 0, 4335);
INSERT INTO `tv_series_data` VALUES (8943605311, '飞虎队大营救', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/17/s53397.jpg?1501117641', 'https://tv.2345.com/detail/53397.html', 8.2, '战争', 0, 7023);
INSERT INTO `tv_series_data` VALUES (8946952903, '妈妈的罗曼史', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/755/3bf1e5577c53cfbfcb30cd2b0d465db6.jpg', 'https://tv.2345.com/detail/755.html', 10, '家庭', 0, 4662);
INSERT INTO `tv_series_data` VALUES (8949905941, '道北人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/2061/36dacbef56955a41526eedafc7c263e4.jpg', 'https://tv.2345.com/detail/2061.html', 10, '战争', 0, 4930);
INSERT INTO `tv_series_data` VALUES (8951598807, '绝命追踪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/15/s46700.jpg', 'https://tv.2345.com/detail/46700.html', 8.3, '战争', 0, 4502);
INSERT INTO `tv_series_data` VALUES (8960414809, '爱在离别时', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/3/10095/1ae94c7489d87d523b41f03aa85a322b.jpg', 'https://tv.2345.com/detail/10095.html', 8.8, '伦理', 0, 4677);
INSERT INTO `tv_series_data` VALUES (8963683899, '胜算', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/15/s46929.jpg', 'https://tv.2345.com/detail/46929.html', 9.3, '悬疑', 0, 3625);
INSERT INTO `tv_series_data` VALUES (8963803028, '因为爱情有幸福', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/15/s47159.jpg?1443419569', 'https://tv.2345.com/detail/47159.html', 8.6, '家庭', 0, 7766);
INSERT INTO `tv_series_data` VALUES (8972979061, '追捕者', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/18/s55465.jpg', 'https://tv.2345.com/detail/55465.html', 9, '悬疑', 0, 7368);
INSERT INTO `tv_series_data` VALUES (8978458904, '殊死七日', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/16/s48448.jpg?1460944118', 'https://tv.2345.com/detail/48448.html', 8.5, '悬疑', 0, 6948);
INSERT INTO `tv_series_data` VALUES (8979359903, '秋收起义DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/17/s53410.jpg', 'https://tv.2345.com/detail/53410.html', 8.8, '战争', 0, 4289);
INSERT INTO `tv_series_data` VALUES (8979457104, '风车', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/1/5353/9cfba9fa02f7f40bc544523fd8003552.jpg', 'https://tv.2345.com/detail/5353.html', 9.2, '伦理', 0, 4983);
INSERT INTO `tv_series_data` VALUES (8980228988, '少年派', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/18/s56188.jpg', 'https://tv.2345.com/detail/56188.html', 8.7, '家庭', 0, 7376);
INSERT INTO `tv_series_data` VALUES (8983257278, '刺蝶', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/15/s46867.jpg?1440202367', 'https://tv.2345.com/detail/46867.html', 8.4, '悬疑', 0, 6352);
INSERT INTO `tv_series_data` VALUES (8983514239, '妻子回来了', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/2087/bb2e189ab62df3f292f9a6f7b41666ca.jpg', 'https://tv.2345.com/detail/2087.html', 9, '伦理', 0, 3500);
INSERT INTO `tv_series_data` VALUES (8985353685, '重庆谍战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/1/3179/205227a62dfc4e184560600e6fa7082c.jpg', 'https://tv.2345.com/detail/3179.html', 9.2, '战争', 0, 7952);
INSERT INTO `tv_series_data` VALUES (8986141743, '天鹅套索', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/2/s8637.jpg?1378957705', 'https://tv.2345.com/detail/8637.html', 8, '伦理', 0, 5731);
INSERT INTO `tv_series_data` VALUES (8990046445, '小儿难养', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/3/c.jpg', 'https://tv.2345.com/detail/18694.html', 9.3, '家庭', 0, 4076);
INSERT INTO `tv_series_data` VALUES (8991833324, '聪明小空空', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/3/11687/f635b370fe07441a4a6a3a268e4a5c48.jpg', 'https://tv.2345.com/detail/11687.html', 8.8, '家庭', 0, 4562);
INSERT INTO `tv_series_data` VALUES (8992565620, '毒刺', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/1706/d588484d61784af554bf4cbec60af9eb.jpg', 'https://tv.2345.com/detail/1706.html', 8.8, '战争', 0, 5008);
INSERT INTO `tv_series_data` VALUES (8992646810, '野狼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/2/s8998.jpg', 'https://tv.2345.com/detail/8998.html', 7.6, '战争', 0, 6273);
INSERT INTO `tv_series_data` VALUES (8996062099, '不谈爱情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/14/s44040.jpg', 'https://tv.2345.com/detail/44040.html', 9.1, '家庭', 0, 6009);
INSERT INTO `tv_series_data` VALUES (8996245377, '瓷都人之南山红', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/20/s61366.jpg', 'https://tv.2345.com/detail/61366.html', 8.6, '其他', 0, 3709);
INSERT INTO `tv_series_data` VALUES (8997112810, '兰花香', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/1851/3f6e7c51d70e3400cda84890bd4eb304.jpg', 'https://tv.2345.com/detail/1851.html', 10, '伦理', 0, 5305);
INSERT INTO `tv_series_data` VALUES (9000448248, '船娘雯蔚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/2383/88ed8f26c440e1b718d44e3d6176773e.jpg', 'https://tv.2345.com/detail/2383.html', 8.8, '家庭', 0, 7846);
INSERT INTO `tv_series_data` VALUES (9001155394, '道德底线', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/1349/s1349.jpg', 'https://tv.2345.com/detail/1349.html', 8.8, '家庭', 0, 6611);
INSERT INTO `tv_series_data` VALUES (9004039682, '大宅门1912TV版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/19/s57418.jpg', 'https://tv.2345.com/detail/57418.html', 7, '家庭', 0, 5814);
INSERT INTO `tv_series_data` VALUES (9004394985, '做局', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/17/s52416.jpg', 'https://tv.2345.com/detail/52416.html', 8.7, '伦理', 0, 3369);
INSERT INTO `tv_series_data` VALUES (9005003155, '寻亲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/7/s23160.jpg?1410421055', 'https://tv.2345.com/detail/23160.html', 8.8, '家庭', 0, 4788);
INSERT INTO `tv_series_data` VALUES (9011687188, '铁血使命', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/3/s10353.jpg', 'https://tv.2345.com/detail/10353.html', 8.6, '战争', 0, 5147);
INSERT INTO `tv_series_data` VALUES (9012574255, '长城红', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/18/s55188.jpg', 'https://tv.2345.com/detail/55188.html', 8.8, '战争', 0, 3454);
INSERT INTO `tv_series_data` VALUES (9013385641, '米兰达第1季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/1/s3504.jpg', 'https://tv.2345.com/detail/3504.html', 7.7, '家庭', 0, 7558);
INSERT INTO `tv_series_data` VALUES (9014912209, '谁知女人心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/957/da0c3bc1f24d4fa56e26f2608f1df394.jpg', 'https://tv.2345.com/detail/957.html', 8.8, '家庭', 0, 4927);
INSERT INTO `tv_series_data` VALUES (9015571841, '老马家的幸福往事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/876/da706526e7b52dafd702a41cbdbde534.jpg', 'https://tv.2345.com/detail/876.html', 9.3, '家庭', 0, 7986);
INSERT INTO `tv_series_data` VALUES (9026046485, '巾帼大将军', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/8/s24508.jpg?1376447778', 'https://tv.2345.com/detail/24508.html', 8.5, '战争', 0, 3952);
INSERT INTO `tv_series_data` VALUES (9029717509, '如果爱张柏芝版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/18/s54871.jpg', 'https://tv.2345.com/detail/54871.html', 8.2, '家庭', 0, 5748);
INSERT INTO `tv_series_data` VALUES (9033219533, '幸福向前走', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/6/s19960.jpg?1363142038', 'https://tv.2345.com/detail/19960.html', 8.5, '家庭', 0, 5965);
INSERT INTO `tv_series_data` VALUES (9033897991, '丈夫的秘密', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/7/e.jpg', 'https://tv.2345.com/detail/15314.html', 9.2, '家庭', 0, 4241);
INSERT INTO `tv_series_data` VALUES (9034638107, '乡村爱情圆舞曲', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/9/s28399.jpg?1390805634', 'https://tv.2345.com/detail/28399.html', 8.6, '家庭', 0, 5089);
INSERT INTO `tv_series_data` VALUES (9036623926, '我的女儿是花儿', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/2/s8686.jpg?1428991067', 'https://tv.2345.com/detail/8686.html', 8.6, '家庭', 0, 6144);
INSERT INTO `tv_series_data` VALUES (9037011332, '家后', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/1/s5861.jpg', 'https://tv.2345.com/detail/5861.html', 8.8, '家庭', 0, 3220);
INSERT INTO `tv_series_data` VALUES (9041593871, '相思树', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/1324/24c316d1cda47637449f525419e3719f.jpg', 'https://tv.2345.com/detail/1324.html', 9.5, '家庭', 0, 5477);
INSERT INTO `tv_series_data` VALUES (9045336989, '单亲之家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/16/s48869.jpg', 'https://tv.2345.com/detail/48869.html', 9.3, '伦理', 0, 3677);
INSERT INTO `tv_series_data` VALUES (9049507313, '地道英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/754/97c13237732c5ce0b24696e30fce3074.jpg', 'https://tv.2345.com/detail/754.html', 9, '军旅', 0, 4319);
INSERT INTO `tv_series_data` VALUES (9055740270, '那座城这家人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/18/s55563.jpg', 'https://tv.2345.com/detail/55563.html', 9.1, '家庭', 0, 7628);
INSERT INTO `tv_series_data` VALUES (9056426115, '绅士的品格', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/3/s9216.jpg', 'https://tv.2345.com/detail/9216.html', 9.3, '家庭', 0, 6176);
INSERT INTO `tv_series_data` VALUES (9057333360, '义海风云', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/2/6811/dec2585bc91c19e22b8cee2df14efcbf.jpg', 'https://tv.2345.com/detail/6811.html', 9.2, '家庭', 0, 7400);
INSERT INTO `tv_series_data` VALUES (9058522163, '一周剧能说', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/18/s54381.jpg', 'https://tv.2345.com/detail/54381.html', 7.6, '战争', 0, 7178);
INSERT INTO `tv_series_data` VALUES (9059117137, '还君明珠', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/2316/6e3585f7b9a31d75e826e245bb7e2402.jpg', 'https://tv.2345.com/detail/2316.html', 9.3, '伦理', 0, 5540);
INSERT INTO `tv_series_data` VALUES (9059433718, '法律至上1', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/20/s60947.jpg', 'https://tv.2345.com/detail/60947.html', 9.8, '悬疑', 0, 7745);
INSERT INTO `tv_series_data` VALUES (9060826455, '如此可爱的我们', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/19/s57804.jpg', 'https://tv.2345.com/detail/57804.html', 9.4, '家庭', 0, 4476);
INSERT INTO `tv_series_data` VALUES (9061329208, '日出', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/2007/6c0e88984a2c47759377dfc8bf5d888a.jpg', 'https://tv.2345.com/detail/2007.html', 10, '伦理', 0, 4135);
INSERT INTO `tv_series_data` VALUES (9073011653, '冷枪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/2295/s2295.jpg', 'https://tv.2345.com/detail/2295.html', 8.8, '战争', 0, 5236);
INSERT INTO `tv_series_data` VALUES (9081550497, '道北人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/2061/36dacbef56955a41526eedafc7c263e4.jpg', 'https://tv.2345.com/detail/2061.html', 10, '伦理', 0, 6470);
INSERT INTO `tv_series_data` VALUES (9086614014, '江湖正道DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/17/s53391.jpg', 'https://tv.2345.com/detail/53391.html', 7.3, '战争', 0, 4697);
INSERT INTO `tv_series_data` VALUES (9089399018, '滇西1944', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/201/566a4738eca6c19b53c9c07c6d626b8e.jpg', 'https://tv.2345.com/detail/201.html', 9.2, '战争', 0, 5047);
INSERT INTO `tv_series_data` VALUES (9091687282, '穷妈妈富妈妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/2/6033/2ca5d25102c09c6b2271b805939cdcf2.jpg', 'https://tv.2345.com/detail/6033.html', 8.9, '家庭', 0, 5177);
INSERT INTO `tv_series_data` VALUES (9091763891, '温柔的谎言', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/1/s5834.jpg?1361934878', 'https://tv.2345.com/detail/5834.html', 8.5, '伦理', 0, 5438);
INSERT INTO `tv_series_data` VALUES (9095091368, '吕梁英雄传', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/3/10188/ed970bd0cd59acfae17147b6ee706e01.jpg', 'https://tv.2345.com/detail/10188.html', 9.1, '战争', 0, 3594);
INSERT INTO `tv_series_data` VALUES (9098759171, '战天狼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/18/s55268.jpg', 'https://tv.2345.com/detail/55268.html', 8.9, '战争', 0, 3279);
INSERT INTO `tv_series_data` VALUES (9103209752, '兵变1929', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/15/s45704.jpg?1425029918', 'https://tv.2345.com/detail/45704.html', 8.3, '战争', 0, 6129);
INSERT INTO `tv_series_data` VALUES (9111985602, '东方战场DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/20/s61416.jpg', 'https://tv.2345.com/detail/61416.html', 9.2, '战争', 0, 7815);
INSERT INTO `tv_series_data` VALUES (9114078293, '末代皇妃', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/2/s8655.jpg?1362650220', 'https://tv.2345.com/detail/8655.html', 8.9, '伦理', 0, 5204);
INSERT INTO `tv_series_data` VALUES (9115876060, '嘿老头', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/15/s45872.jpg?1427426901', 'https://tv.2345.com/detail/45872.html', 8.4, '家庭', 0, 6873);
INSERT INTO `tv_series_data` VALUES (9116525811, '秋海棠', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/1363/d8d2c3225699635ffc7bb5c76c42bdc6.jpg', 'https://tv.2345.com/detail/1363.html', 9.2, '伦理', 0, 5831);
INSERT INTO `tv_series_data` VALUES (9120296152, '楚汉传奇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/9/2.jpg', 'https://tv.2345.com/detail/17539.html', 9.3, '战争', 0, 6120);
INSERT INTO `tv_series_data` VALUES (9120948778, '我的爱蝴蝶夫人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/5/15600/9641f9783e82ebb19a5b98540bf2dbeb.jpg', 'https://tv.2345.com/detail/15600.html', 8.8, '家庭', 0, 5965);
INSERT INTO `tv_series_data` VALUES (9121133941, '留神', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/0/s191.jpg?1363260870', 'https://tv.2345.com/detail/191.html', 8.9, '家庭', 0, 4294);
INSERT INTO `tv_series_data` VALUES (9129838340, '矿山烽火', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/20/s60799.jpg', 'https://tv.2345.com/detail/60799.html', 8.5, '战争', 0, 3641);
INSERT INTO `tv_series_data` VALUES (9130108463, '离婚前规则', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/9/6.jpg', 'https://tv.2345.com/detail/17100.html', 8.8, '家庭', 0, 6586);
INSERT INTO `tv_series_data` VALUES (9131676808, '大宅门1', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/3/9623/a873182d3a59976780bb02f063ae950b.jpg', 'https://tv.2345.com/detail/9623.html', 9.7, '家庭', 0, 3714);
INSERT INTO `tv_series_data` VALUES (9131755296, '白夜追凶', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/17/s53544.jpg', 'https://tv.2345.com/detail/53544.html', 8.2, '悬疑', 0, 6432);
INSERT INTO `tv_series_data` VALUES (9133743684, '大河儿女', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/10/s32592.jpg?1396489930', 'https://tv.2345.com/detail/32592.html', 8.4, '战争', 0, 4882);
INSERT INTO `tv_series_data` VALUES (9138332944, '南北有情天', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/2/s7006.jpg?1398418624', 'https://tv.2345.com/detail/7006.html', 8.8, '家庭', 0, 5978);
INSERT INTO `tv_series_data` VALUES (9142400424, '妈妈再爱我一次', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/1156/a9b649448253240df397e5f8a36edc0b.jpg', 'https://tv.2345.com/detail/1156.html', 9.7, '家庭', 0, 3393);
INSERT INTO `tv_series_data` VALUES (9142864293, '七妹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/819/cbd0fd6d2a175b581d5d6be9f920749c.jpg', 'https://tv.2345.com/detail/819.html', 10, '家庭', 0, 5298);
INSERT INTO `tv_series_data` VALUES (9147000619, '爱无尽头', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/210/e85dda4bbed4c768bb8048ff1538816c.jpg', 'https://tv.2345.com/detail/210.html', 8.7, '伦理', 0, 6791);
INSERT INTO `tv_series_data` VALUES (9148240011, '雪城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/19/s58294.jpg', 'https://tv.2345.com/detail/58294.html', 9, '战争', 0, 3217);
INSERT INTO `tv_series_data` VALUES (9150395862, '省港大营救', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/15/s47246.jpg?1445225652', 'https://tv.2345.com/detail/47246.html', 8.4, '战争', 0, 4157);
INSERT INTO `tv_series_data` VALUES (9156179449, '我的团长我的团', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/0/s1887.jpg?1484291683', 'https://tv.2345.com/detail/1887.html', 9.8, '战争', 0, 5565);
INSERT INTO `tv_series_data` VALUES (9157499795, '生死桥未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/2289/b81e3d9445ba89effa1ee595f0f01170.jpg', 'https://tv.2345.com/detail/2289.html', 9.2, '伦理', 0, 7891);
INSERT INTO `tv_series_data` VALUES (9161164680, '走出监狱的女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/10/s31171.jpg?1415339893', 'https://tv.2345.com/detail/31171.html', 7.9, '伦理', 0, 7466);
INSERT INTO `tv_series_data` VALUES (9161730424, '风云群英会', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/2/s8316.jpg', 'https://tv.2345.com/detail/8316.html', 8.6, '战争', 0, 4640);
INSERT INTO `tv_series_data` VALUES (9162665556, '伙头智多星', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/2367/768ccf06ae5ae104c8a278e587c8f6df.jpg', 'https://tv.2345.com/detail/2367.html', 8.7, '家庭', 0, 3329);
INSERT INTO `tv_series_data` VALUES (9165680093, '乱世丽人行', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/17/s52336.jpg?1482284880', 'https://tv.2345.com/detail/52336.html', 8.3, '战争', 0, 4540);
INSERT INTO `tv_series_data` VALUES (9167361945, '飘帅', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/9/s29727.jpg?1392860939', 'https://tv.2345.com/detail/29727.html', 8.4, '悬疑', 0, 6907);
INSERT INTO `tv_series_data` VALUES (9170478535, '猛兽列车', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/14/s42745.jpg', 'https://tv.2345.com/detail/42745.html', 8.8, '战争', 0, 7370);
INSERT INTO `tv_series_data` VALUES (9171500753, '好好过日子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/240/de0e48d2befb3e62fa0faced545bdab7.jpg', 'https://tv.2345.com/detail/240.html', 10, '家庭', 0, 7865);
INSERT INTO `tv_series_data` VALUES (9171511416, '守望爱情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/1/3040/s3040.jpg', 'https://tv.2345.com/detail/3040.html', 8.8, '伦理', 0, 3490);
INSERT INTO `tv_series_data` VALUES (9174919291, '麻辣芳邻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/16/s48337.jpg?1459222497', 'https://tv.2345.com/detail/48337.html', 8.5, '家庭', 0, 6962);
INSERT INTO `tv_series_data` VALUES (9179777337, '人体外部探险', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/15/s45448.jpg', 'https://tv.2345.com/detail/45448.html', 7.5, '其他', 0, 5549);
INSERT INTO `tv_series_data` VALUES (9184057785, '天下兄弟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/629/08ee8cdc89155706fdd3e82d69ace06e.jpg', 'https://tv.2345.com/detail/629.html', 9.3, '家庭', 0, 3475);
INSERT INTO `tv_series_data` VALUES (9188204498, '粘豆包', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/17/s53850.jpg', 'https://tv.2345.com/detail/53850.html', 9.2, '家庭', 0, 5743);
INSERT INTO `tv_series_data` VALUES (9189364467, 'Miss欧巴桑韩国', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/3/11420/20f800c7874e32638756ec40c3470410.jpg', 'https://tv.2345.com/detail/11420.html', 7.6, '家庭', 0, 5230);
INSERT INTO `tv_series_data` VALUES (9189709138, '悲情母子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/9/s28593.jpg?1388989454', 'https://tv.2345.com/detail/28593.html', 8.4, '家庭', 0, 5881);
INSERT INTO `tv_series_data` VALUES (9191156578, '大男人小男人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/18/s55319.jpg', 'https://tv.2345.com/detail/55319.html', 9.7, '家庭', 0, 7358);
INSERT INTO `tv_series_data` VALUES (9191191012, '欢天喜地对亲家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/15/s47784.jpg?1451093716', 'https://tv.2345.com/detail/47784.html', 8.5, '家庭', 0, 5261);
INSERT INTO `tv_series_data` VALUES (9193194139, '冤家亲家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/15/s45740.jpg?1425868319', 'https://tv.2345.com/detail/45740.html', 7.8, '家庭', 0, 6970);
INSERT INTO `tv_series_data` VALUES (9206370753, '妈妈长角了', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/2/6471/32056f71db96ac1be803657347359d11.jpg', 'https://tv.2345.com/detail/6471.html', 6.3, '家庭', 0, 5216);
INSERT INTO `tv_series_data` VALUES (9206669072, '霞光', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/20/s60944.jpg', 'https://tv.2345.com/detail/60944.html', 9.8, '战争', 0, 3246);
INSERT INTO `tv_series_data` VALUES (9206806476, '节振国传奇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/2/6519/039d022e063bb59478e0f684507a9d3e.jpg', 'https://tv.2345.com/detail/6519.html', 8.6, '战争', 0, 5887);
INSERT INTO `tv_series_data` VALUES (9216516669, '神秘人质', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/8/s25766.jpg?1380247377', 'https://tv.2345.com/detail/25766.html', 8.5, '战争', 0, 6552);
INSERT INTO `tv_series_data` VALUES (9221612561, '矿长', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/16/s48601.jpg', 'https://tv.2345.com/detail/48601.html', 8.7, '家庭', 0, 7637);
INSERT INTO `tv_series_data` VALUES (9221989656, '鬼吹灯之龙岭迷窟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/6/s18289.jpg?1572498967', 'https://tv.2345.com/detail/18289.html', 8, '悬疑', 0, 7615);
INSERT INTO `tv_series_data` VALUES (9228692946, '英雄使命', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/6/s20983.jpg?1366165975', 'https://tv.2345.com/detail/20983.html', 8.8, '战争', 0, 6580);
INSERT INTO `tv_series_data` VALUES (9236438573, '兰花香', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/1851/3f6e7c51d70e3400cda84890bd4eb304.jpg', 'https://tv.2345.com/detail/1851.html', 10, '家庭', 0, 7434);
INSERT INTO `tv_series_data` VALUES (9241033626, '激情燃烧的岁月2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/1606/9f472296a47ef61083d40afb2f865021.jpg', 'https://tv.2345.com/detail/1606.html', 8.7, '战争', 0, 4016);
INSERT INTO `tv_series_data` VALUES (9241212928, '孝子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/2237/425cf8a52c3033b6354e0bc4d717eb11.jpg', 'https://tv.2345.com/detail/2237.html', 10, '家庭', 0, 4144);
INSERT INTO `tv_series_data` VALUES (9244109540, '大捕房', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/1/s4312.jpg?1410419588', 'https://tv.2345.com/detail/4312.html', 9.3, '悬疑', 0, 6531);
INSERT INTO `tv_series_data` VALUES (9246341628, '中国地DVD', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/18/s54056.jpg', 'https://tv.2345.com/detail/54056.html', 8.4, '伦理', 0, 7249);
INSERT INTO `tv_series_data` VALUES (9247252595, '马文的战争', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/573/58a5cb3e819ec850516300b2a671f996.jpg', 'https://tv.2345.com/detail/573.html', 8.8, '伦理', 0, 3178);
INSERT INTO `tv_series_data` VALUES (9249700090, '奶奶再爱我一次', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/6/s19377.jpg?1380418110', 'https://tv.2345.com/detail/19377.html', 8.5, '伦理', 0, 3584);
INSERT INTO `tv_series_data` VALUES (9250764599, '如歌的岁月', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/2/8346/d2e070aa367b257114455e41f3f3245d.jpg', 'https://tv.2345.com/detail/8346.html', 9.2, '伦理', 0, 7591);
INSERT INTO `tv_series_data` VALUES (9251976227, '杀手十三第2季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/7/s21814.jpg?1395638203', 'https://tv.2345.com/detail/21814.html', 8.4, '悬疑', 0, 6166);
INSERT INTO `tv_series_data` VALUES (9253765574, '谍海追踪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/19/s58669.jpg', 'https://tv.2345.com/detail/58669.html', 9.8, '战争', 0, 6404);
INSERT INTO `tv_series_data` VALUES (9257501970, '最后的战士', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/18/s54086.jpg', 'https://tv.2345.com/detail/54086.html', 8.9, '战争', 0, 5424);
INSERT INTO `tv_series_data` VALUES (9258515801, '谋局', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/19/s57901.jpg', 'https://tv.2345.com/detail/57901.html', 9.3, '悬疑', 0, 7000);
INSERT INTO `tv_series_data` VALUES (9259698586, '神探狄仁杰第2部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/1024/s1024.jpg', 'https://tv.2345.com/detail/1024.html', 9.3, '悬疑', 0, 5694);
INSERT INTO `tv_series_data` VALUES (9263539135, '会战雪峰山', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/17/s53921.jpg', 'https://tv.2345.com/detail/53921.html', 8.8, '战争', 0, 7282);
INSERT INTO `tv_series_data` VALUES (9268130346, '闭嘴花美男乐队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/13/s40421.jpg?1426054273', 'https://tv.2345.com/detail/40421.html', 8.5, '其他', 0, 6194);
INSERT INTO `tv_series_data` VALUES (9271015305, '罪之缘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/2843/d2cb217813a541d4c6d6764ec585f3bf.jpg', 'https://tv.2345.com/detail/2843.html', 9.2, '家庭', 0, 6867);
INSERT INTO `tv_series_data` VALUES (9273658910, '浮华世家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/8/s26437.jpg?1382757912', 'https://tv.2345.com/detail/26437.html', 8.3, '伦理', 0, 3024);
INSERT INTO `tv_series_data` VALUES (9273771020, '美丽谎言', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/10/s32830.jpg?1398489235', 'https://tv.2345.com/detail/32830.html', 8.4, '家庭', 0, 3744);
INSERT INTO `tv_series_data` VALUES (9273794880, '以家人之名李尖尖成长日记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/19/s57857.jpg', 'https://tv.2345.com/detail/57857.html', 8, '家庭', 0, 5830);
INSERT INTO `tv_series_data` VALUES (9273859944, '第二次人生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/14/s43037.jpg?1415599303', 'https://tv.2345.com/detail/43037.html', 8.1, '家庭', 0, 3996);
INSERT INTO `tv_series_data` VALUES (9275768714, '双刺TV版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/16/s50237.jpg', 'https://tv.2345.com/detail/50237.html', 8.7, '战争', 0, 5684);
INSERT INTO `tv_series_data` VALUES (9276813006, '我们都要好好的越南语版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/19/s59196.jpg', 'https://tv.2345.com/detail/59196.html', 7.8, '家庭', 0, 5403);
INSERT INTO `tv_series_data` VALUES (9277681917, '隐秘的角落', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/19/s57689.jpg', 'https://tv.2345.com/detail/57689.html', 9.5, '悬疑', 0, 5446);
INSERT INTO `tv_series_data` VALUES (9279764212, '我的丑爹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/777/81f72bd530150a27f831eb956785b1b5.jpg', 'https://tv.2345.com/detail/777.html', 8.5, '伦理', 0, 4207);
INSERT INTO `tv_series_data` VALUES (9280190376, '上海的早晨', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/19/s58289.jpg', 'https://tv.2345.com/detail/58289.html', 9.2, '家庭', 0, 7998);
INSERT INTO `tv_series_data` VALUES (9280373813, '咱爸咱妈六十年', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/0/s528.jpg?1421636433', 'https://tv.2345.com/detail/528.html', 8.5, '伦理', 0, 6879);
INSERT INTO `tv_series_data` VALUES (9281116469, '做局', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/17/s52416.jpg', 'https://tv.2345.com/detail/52416.html', 8.7, '家庭', 0, 4213);
INSERT INTO `tv_series_data` VALUES (9281141384, '爱在旅途', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/1/s3926.jpg?1426817004', 'https://tv.2345.com/detail/3926.html', 9.2, '家庭', 0, 7001);
INSERT INTO `tv_series_data` VALUES (9281952353, '嫂娘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/18/s54735.jpg', 'https://tv.2345.com/detail/54735.html', 9.2, '家庭', 0, 3331);
INSERT INTO `tv_series_data` VALUES (9282940919, '黄炎培', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/0/s403.jpg?1410419358', 'https://tv.2345.com/detail/403.html', 8.8, '战争', 0, 4804);
INSERT INTO `tv_series_data` VALUES (9290237664, '回家的欲望', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/1798/s1798.jpg', 'https://tv.2345.com/detail/1798.html', 9, '伦理', 0, 3010);
INSERT INTO `tv_series_data` VALUES (9294979348, '新上门女婿', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/1/5927/787cb7c13a5acfa9887fcd5b507c9597.jpg', 'https://tv.2345.com/detail/5927.html', 8, '家庭', 0, 6556);
INSERT INTO `tv_series_data` VALUES (9299473916, '日出日落', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/15/s47031.jpg', 'https://tv.2345.com/detail/47031.html', 8.7, '伦理', 0, 7753);
INSERT INTO `tv_series_data` VALUES (9301023023, '流泪的新娘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/3/s9948.jpg', 'https://tv.2345.com/detail/9948.html', 8.8, '家庭', 0, 5403);
INSERT INTO `tv_series_data` VALUES (9304255628, '炊事班的故事第一部精编版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/18/s56501.jpg', 'https://tv.2345.com/detail/56501.html', 8, '军旅', 0, 5807);
INSERT INTO `tv_series_data` VALUES (9304447877, '月嫂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/747/43878ca20e5798b7296af40886b43b5f.jpg', 'https://tv.2345.com/detail/747.html', 8, '伦理', 0, 4487);
INSERT INTO `tv_series_data` VALUES (9305656222, '雪地娘子军', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/17/s52474.jpg?1483679837', 'https://tv.2345.com/detail/52474.html', 8.9, '战争', 0, 3924);
INSERT INTO `tv_series_data` VALUES (9306120050, '盗墓笔记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/10/s32549.jpg?1484644764', 'https://tv.2345.com/detail/32549.html', 9.3, '悬疑', 0, 3128);
INSERT INTO `tv_series_data` VALUES (9306568045, '百战天狼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/20/s61106.jpg', 'https://tv.2345.com/detail/61106.html', 9.1, '战争', 0, 4701);
INSERT INTO `tv_series_data` VALUES (9313407090, '不惑之年', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/18/s54058.jpg', 'https://tv.2345.com/detail/54058.html', 9.7, '家庭', 0, 4210);
INSERT INTO `tv_series_data` VALUES (9314619400, '林海雪原2002版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/2024/f87bdb96a9d38e71935aa941ea3ae32c.jpg', 'https://tv.2345.com/detail/2024.html', 8.6, '战争', 0, 5886);
INSERT INTO `tv_series_data` VALUES (9316790225, '燃烧的玫瑰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/509/8af32c33e1c5fdc32fd9c52bea236891.jpg', 'https://tv.2345.com/detail/509.html', 9, '家庭', 0, 6930);
INSERT INTO `tv_series_data` VALUES (9319980779, '天涯浴血', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/16/s48909.jpg', 'https://tv.2345.com/detail/48909.html', 8.1, '战争', 0, 6355);
INSERT INTO `tv_series_data` VALUES (9330923690, '红星照耀中国', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/16/s48795.jpg?1476162932', 'https://tv.2345.com/detail/48795.html', 8.3, '战争', 0, 6263);
INSERT INTO `tv_series_data` VALUES (9339141026, '军礼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/610/s610.jpg', 'https://tv.2345.com/detail/610.html', 8.8, '战争', 0, 3961);
INSERT INTO `tv_series_data` VALUES (9339267566, '谍战深海之惊蛰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/18/s56623.jpg?1571794101', 'https://tv.2345.com/detail/56623.html', 8.9, '战争', 0, 4415);
INSERT INTO `tv_series_data` VALUES (9340420600, '兵变1938', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/1/4820/6fef3a2bbeffee851c137987dd4d1ccd.jpg', 'https://tv.2345.com/detail/4820.html', 8.8, '战争', 0, 7208);
INSERT INTO `tv_series_data` VALUES (9342278054, '家有儿女初长成VIP独享版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/18/s54848.jpg', 'https://tv.2345.com/detail/54848.html', 9.1, '家庭', 0, 5204);
INSERT INTO `tv_series_data` VALUES (9349794331, '卧底未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/15/s47115.jpg?1442615680', 'https://tv.2345.com/detail/47115.html', 8.4, '战争', 0, 7892);
INSERT INTO `tv_series_data` VALUES (9349809857, '换子成龙', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/3/9055/8da9c9656f016211fb0b1e1f931dd60e.jpg', 'https://tv.2345.com/detail/9055.html', 8.9, '伦理', 0, 3771);
INSERT INTO `tv_series_data` VALUES (9351078524, '当家的女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/558/bd35eece67a3bc64eca704bc897ba7eb.jpg', 'https://tv.2345.com/detail/558.html', 10, '家庭', 0, 4183);
INSERT INTO `tv_series_data` VALUES (9354317878, '花灯满城', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/17/s53402.jpg?1501466078', 'https://tv.2345.com/detail/53402.html', 8.5, '家庭', 0, 5349);
INSERT INTO `tv_series_data` VALUES (9359489861, '空降利刃', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/18/s56434.jpg?1564646200', 'https://tv.2345.com/detail/56434.html', 9.2, '军旅', 0, 7926);
INSERT INTO `tv_series_data` VALUES (9359538604, '孤雁', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/15/s47145.jpg?1443158078', 'https://tv.2345.com/detail/47145.html', 8.4, '战争', 0, 5373);
INSERT INTO `tv_series_data` VALUES (9360993784, '江照黎明', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/20/s61354.jpg', 'https://tv.2345.com/detail/61354.html', 7.1, '悬疑', 0, 4115);
INSERT INTO `tv_series_data` VALUES (9361458444, '中天悬剑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/340/b6d634268d2e85eb66f23d1526f3ca6a.jpg', 'https://tv.2345.com/detail/340.html', 8.7, '战争', 0, 4736);
INSERT INTO `tv_series_data` VALUES (9364437167, '名门劫名门望族', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/0/s236.jpg?1438132426', 'https://tv.2345.com/detail/236.html', 9.3, '家庭', 0, 4233);
INSERT INTO `tv_series_data` VALUES (9369472014, '我只在乎你', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/1242/831b9f36d7d03f8981f3db1a0a5ad397.jpg', 'https://tv.2345.com/detail/1242.html', 9.2, '家庭', 0, 5766);
INSERT INTO `tv_series_data` VALUES (9371372400, '谍战古山塘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/2819/1f8c8515d8102da3270a94d9f97337c6.jpg', 'https://tv.2345.com/detail/2819.html', 10, '战争', 0, 4972);
INSERT INTO `tv_series_data` VALUES (9372354528, '断刺', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/816/13068395f451763f3e178cc45981d98a.jpg', 'https://tv.2345.com/detail/816.html', 9.2, '战争', 0, 3818);
INSERT INTO `tv_series_data` VALUES (9375716085, '飘帅', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/9/s29727.jpg?1392860939', 'https://tv.2345.com/detail/29727.html', 8.4, '战争', 0, 6908);
INSERT INTO `tv_series_data` VALUES (9375838635, '宽恕', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/1356/84feb6c8248be98a5fdd5128fe837dee.jpg', 'https://tv.2345.com/detail/1356.html', 10, '家庭', 0, 5211);
INSERT INTO `tv_series_data` VALUES (9376294534, '追赶我可能丢了的爱情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/2/6911/82b12e3c7ee58edfa907da1712e55f62.jpg', 'https://tv.2345.com/detail/6911.html', 9.6, '家庭', 0, 6361);
INSERT INTO `tv_series_data` VALUES (9378339613, '小舍得', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/19/s59066.jpg', 'https://tv.2345.com/detail/59066.html', 9.7, '家庭', 0, 4536);
INSERT INTO `tv_series_data` VALUES (9384559390, '母亲的忏悔', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/10/s30745.jpg?1415341610', 'https://tv.2345.com/detail/30745.html', 7.7, '伦理', 0, 3809);
INSERT INTO `tv_series_data` VALUES (9388515284, '敌特在行动', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/1454/3500ecc0b625e1a8c856370769d35b61.jpg', 'https://tv.2345.com/detail/1454.html', 8.9, '军旅', 0, 7709);
INSERT INTO `tv_series_data` VALUES (9391161382, '嫂子的情感时代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/10/s32941.jpg?1408612011', 'https://tv.2345.com/detail/32941.html', 7.6, '伦理', 0, 7211);
INSERT INTO `tv_series_data` VALUES (9395456312, '血浓于水', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/3/s9612.jpg', 'https://tv.2345.com/detail/9612.html', 8.8, '伦理', 0, 3756);
INSERT INTO `tv_series_data` VALUES (9400496892, '谎言使用法则', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/20/s61330.jpg', 'https://tv.2345.com/detail/61330.html', 8.5, '悬疑', 0, 7120);
INSERT INTO `tv_series_data` VALUES (9400877300, '女人的战争', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/400/ca5d0f8a3246aac7220f2fdf6e9268c0.jpg', 'https://tv.2345.com/detail/400.html', 9, '战争', 0, 5768);
INSERT INTO `tv_series_data` VALUES (9401850034, '暖秋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/636/621f9f18dca133434cf5724d1a9e117a.jpg', 'https://tv.2345.com/detail/636.html', 8.8, '家庭', 0, 5898);
INSERT INTO `tv_series_data` VALUES (9403486776, '男人的秘密', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/19/s57855.png', 'https://tv.2345.com/detail/57855.html', 8.9, '家庭', 0, 7913);
INSERT INTO `tv_series_data` VALUES (9405075836, '太行之脊', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/19/s57880.jpg', 'https://tv.2345.com/detail/57880.html', 9.7, '战争', 0, 6721);
INSERT INTO `tv_series_data` VALUES (9405458182, '枪口', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/17/s52831.jpg?1490064340', 'https://tv.2345.com/detail/52831.html', 8.5, '战争', 0, 5851);
INSERT INTO `tv_series_data` VALUES (9405700782, '大声呼喊你回来', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/2/8396/6022ac693c2890aa081b58b7c49788be.jpg', 'https://tv.2345.com/detail/8396.html', 9.2, '家庭', 0, 4509);
INSERT INTO `tv_series_data` VALUES (9408656022, '外乡人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/414/6b2734951e09e3674c778c5aa0c1116b.jpg', 'https://tv.2345.com/detail/414.html', 9.8, '家庭', 0, 5247);
INSERT INTO `tv_series_data` VALUES (9411057767, 'Healer', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/14/s43825.jpg?1476692406', 'https://tv.2345.com/detail/43825.html', 8.2, '悬疑', 0, 5590);
INSERT INTO `tv_series_data` VALUES (9412629327, '对你的爱很美双爸夺女大作战', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/19/s59267.jpg', 'https://tv.2345.com/detail/59267.html', 7.3, '家庭', 0, 7988);
INSERT INTO `tv_series_data` VALUES (9416445204, '傻瓜妈妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/2/7998/1011997a083e4307ed9e571ce068da57.jpg', 'https://tv.2345.com/detail/7998.html', 9.5, '伦理', 0, 4745);
INSERT INTO `tv_series_data` VALUES (9417838381, '一屋老友记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/16/s48057.jpg', 'https://tv.2345.com/detail/48057.html', 7.3, '家庭', 0, 7252);
INSERT INTO `tv_series_data` VALUES (9419974980, '红海棠', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/1377/a8c6f5e84df98b05aaacc59337cd16b9.jpg', 'https://tv.2345.com/detail/1377.html', 9.3, '家庭', 0, 5877);
INSERT INTO `tv_series_data` VALUES (9426504058, '皮影', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/19/s58074.jpg', 'https://tv.2345.com/detail/58074.html', 8.9, '战争', 0, 7279);
INSERT INTO `tv_series_data` VALUES (9426972272, '案发现场2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/2979/s2979.jpg', 'https://tv.2345.com/detail/2979.html', 8.2, '悬疑', 0, 4758);
INSERT INTO `tv_series_data` VALUES (9429115747, '激情燃烧的岁月2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/1606/9f472296a47ef61083d40afb2f865021.jpg', 'https://tv.2345.com/detail/1606.html', 8.7, '家庭', 0, 6333);
INSERT INTO `tv_series_data` VALUES (9434214241, '决战黎明', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/596/b1204dc42da8cc42676d001fbe19936e.jpg', 'https://tv.2345.com/detail/596.html', 8.9, '军旅', 0, 6206);
INSERT INTO `tv_series_data` VALUES (9437979572, '绝地苍狼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/1/5243/73a022254b81ea460208f9033c085858.jpg', 'https://tv.2345.com/detail/5243.html', 9.3, '战争', 0, 7666);
INSERT INTO `tv_series_data` VALUES (9439206273, '与狼共舞2未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/9/s29601.jpg?1392603602', 'https://tv.2345.com/detail/29601.html', 8.2, '战争', 0, 6962);
INSERT INTO `tv_series_data` VALUES (9439948584, '出租女友', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/2782/3585acfd121fe9a0e2c7ae5ce6ec22bb.jpg', 'https://tv.2345.com/detail/2782.html', 8, '伦理', 0, 7139);
INSERT INTO `tv_series_data` VALUES (9440905970, '生死连2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/19/s58950.jpg', 'https://tv.2345.com/detail/58950.html', 8.9, '战争', 0, 6149);
INSERT INTO `tv_series_data` VALUES (9441003736, '关中秘事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/2197/326252c99db2f835cf5da245eaaa7826.jpg', 'https://tv.2345.com/detail/2197.html', 9.5, '军旅', 0, 7614);
INSERT INTO `tv_series_data` VALUES (9443162082, '红色娘子军', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/4/14004/dc07180cc679b57a6249cf9a1e9c822c.jpg', 'https://tv.2345.com/detail/14004.html', 7.8, '军旅', 0, 4920);
INSERT INTO `tv_series_data` VALUES (9444019383, '东北一家人1', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/15/s47218.jpg', 'https://tv.2345.com/detail/47218.html', 8.3, '家庭', 0, 6877);
INSERT INTO `tv_series_data` VALUES (9447487280, '瓷都人之姐妹豪情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/20/s61368.jpg', 'https://tv.2345.com/detail/61368.html', 8.6, '其他', 0, 6677);
INSERT INTO `tv_series_data` VALUES (9448935616, '兄弟无间', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/2004/430fe0ef01b70b0a47794b8bf28dc951.jpg', 'https://tv.2345.com/detail/2004.html', 8.6, '家庭', 0, 5845);
INSERT INTO `tv_series_data` VALUES (9449616854, '金玉满堂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/8/s25833.jpg?1494833115', 'https://tv.2345.com/detail/25833.html', 8.6, '家庭', 0, 7576);
INSERT INTO `tv_series_data` VALUES (9450418165, '大学生士兵的故事1', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/1691/62bb8c42918828458cf83f0f9924ad23.jpg', 'https://tv.2345.com/detail/1691.html', 9.4, '战争', 0, 6921);
INSERT INTO `tv_series_data` VALUES (9458918996, '夜幕下的哈尔滨', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/51/6b3616d2cb75fbce0bb336148b4054fe.jpg', 'https://tv.2345.com/detail/51.html', 8.8, '悬疑', 0, 3228);
INSERT INTO `tv_series_data` VALUES (9459274791, '我和我的他们', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/10/s32410.jpg?1396245439', 'https://tv.2345.com/detail/32410.html', 8.3, '伦理', 0, 5307);
INSERT INTO `tv_series_data` VALUES (9461445970, '四世同堂2007版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/0/s56.jpg?1418283922', 'https://tv.2345.com/detail/56.html', 7.7, '家庭', 0, 5693);
INSERT INTO `tv_series_data` VALUES (9461601920, '台北故宫', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/18/s54764.png', 'https://tv.2345.com/detail/54764.html', 9.6, '其他', 0, 5591);
INSERT INTO `tv_series_data` VALUES (9461952901, '敌特在行动', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/1454/3500ecc0b625e1a8c856370769d35b61.jpg', 'https://tv.2345.com/detail/1454.html', 8.9, '战争', 0, 6151);
INSERT INTO `tv_series_data` VALUES (9470133842, '麻辣女兵未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/7/s21682.jpg?1377910625', 'https://tv.2345.com/detail/21682.html', 8.8, '战争', 0, 4939);
INSERT INTO `tv_series_data` VALUES (9473096821, '戊子风雪同仁堂', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/1125/eb6ff41915b121c9369e99f8bc0e614b.jpg', 'https://tv.2345.com/detail/1125.html', 7.6, '家庭', 0, 6301);
INSERT INTO `tv_series_data` VALUES (9478744456, '三十里铺', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/2/s7070.jpg?1410419769', 'https://tv.2345.com/detail/7070.html', 8.8, '战争', 0, 6273);
INSERT INTO `tv_series_data` VALUES (9480316041, '中国家庭之新渴望', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/2/s8393.jpg', 'https://tv.2345.com/detail/8393.html', 8.9, '家庭', 0, 4899);
INSERT INTO `tv_series_data` VALUES (9481152091, '勇敢的心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/13/s40639.jpg?1408604760', 'https://tv.2345.com/detail/40639.html', 8.7, '战争', 0, 5498);
INSERT INTO `tv_series_data` VALUES (9487213542, '幸福在路上', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/716/b814e1f7c883aaed415444e323b258bf.jpg', 'https://tv.2345.com/detail/716.html', 8.7, '军旅', 0, 3774);
INSERT INTO `tv_series_data` VALUES (9489888544, '杀手十三第2季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/7/s21814.jpg?1395638203', 'https://tv.2345.com/detail/21814.html', 8.4, '战争', 1, 7963);
INSERT INTO `tv_series_data` VALUES (9490646643, '青春的童话', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/3/10211/10ea44841cd2f8ddaa68989c79b1a13d.jpg', 'https://tv.2345.com/detail/10211.html', 9.2, '家庭', 0, 5890);
INSERT INTO `tv_series_data` VALUES (9496866724, '雾柳镇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/402/e4049ccd6b93b06176058b48a80de347.jpg', 'https://tv.2345.com/detail/402.html', 9, '战争', 0, 3735);
INSERT INTO `tv_series_data` VALUES (9497877228, '锁定美军特使', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/2/s7939.jpg', 'https://tv.2345.com/detail/7939.html', 9, '战争', 0, 6345);
INSERT INTO `tv_series_data` VALUES (9498715651, '风影', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/7/s22529.jpg?1371173249', 'https://tv.2345.com/detail/22529.html', 8, '战争', 0, 6030);
INSERT INTO `tv_series_data` VALUES (9501066447, '解放大西南未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/0/s2248.jpg?1411874474', 'https://tv.2345.com/detail/2248.html', 9, '战争', 0, 4173);
INSERT INTO `tv_series_data` VALUES (9501206567, '遇见幸福', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/18/s56554.jpg', 'https://tv.2345.com/detail/56554.html', 9.4, '家庭', 0, 5524);
INSERT INTO `tv_series_data` VALUES (9501909906, '镇长', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/3/10271/8f514d91e3d376d42cab513fcaf63b14.jpg', 'https://tv.2345.com/detail/10271.html', 9.6, '家庭', 0, 6855);
INSERT INTO `tv_series_data` VALUES (9502450524, '五湖四海', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/2/7968/a62228e70abeccfbd81f070427dcea02.jpg', 'https://tv.2345.com/detail/7968.html', 8.5, '战争', 0, 7964);
INSERT INTO `tv_series_data` VALUES (9502766574, '水落石出2', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/17/s53899.jpg', 'https://tv.2345.com/detail/53899.html', 9.4, '悬疑', 0, 6261);
INSERT INTO `tv_series_data` VALUES (9507918076, '远远的爱', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/2/7597/557c96e5dce4edbb264d3405edb31b74.jpg', 'https://tv.2345.com/detail/7597.html', 8.4, '战争', 0, 4374);
INSERT INTO `tv_series_data` VALUES (9508269195, '爱的守护', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/19/s58718.jpg', 'https://tv.2345.com/detail/58718.html', 9.8, '家庭', 0, 6732);
INSERT INTO `tv_series_data` VALUES (9508487552, '第二十二条军规', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/18/s56733.jpg', 'https://tv.2345.com/detail/56733.html', 8.8, '战争', 0, 3634);
INSERT INTO `tv_series_data` VALUES (9509285134, '大瓷商', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/136/4ff130d02d0d0947fef7e08420b8d814.jpg', 'https://tv.2345.com/detail/136.html', 9, '伦理', 0, 5887);
INSERT INTO `tv_series_data` VALUES (9509593663, '鬼吹灯之牧野诡事1', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/15/s47408.jpg?1497494684', 'https://tv.2345.com/detail/47408.html', 8.5, '悬疑', 0, 5563);
INSERT INTO `tv_series_data` VALUES (9509745777, '我是特种兵之火凤凰精简版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/9/s27197.jpg?1411547432', 'https://tv.2345.com/detail/27197.html', 8.6, '战争', 0, 5489);
INSERT INTO `tv_series_data` VALUES (9512349865, '燃烧', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/15/s46076.jpg?1494815942', 'https://tv.2345.com/detail/46076.html', 8.5, '悬疑', 0, 6556);
INSERT INTO `tv_series_data` VALUES (9514120063, '幸福密码', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/1845/83be8b2bfb917394160ce3aba05f1db0.jpg', 'https://tv.2345.com/detail/1845.html', 9.5, '伦理', 0, 5005);
INSERT INTO `tv_series_data` VALUES (9514716576, '幸福来了你就喊', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/2/6087/94e348053bdbbc3c014ea7864ad0b070.jpg', 'https://tv.2345.com/detail/6087.html', 10, '家庭', 0, 5494);
INSERT INTO `tv_series_data` VALUES (9515378351, '天伦', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/10/s31695.jpg?1456299216', 'https://tv.2345.com/detail/31695.html', 8.4, '伦理', 0, 6874);
INSERT INTO `tv_series_data` VALUES (9523099625, '故梦', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/95/6858795962ee9f2e8cc5bb240d235062.jpg', 'https://tv.2345.com/detail/95.html', 9.5, '家庭', 0, 7291);
INSERT INTO `tv_series_data` VALUES (9524036212, '白狼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/1759/b5a51afcc02dae0e26703b2555b94cb9.jpg', 'https://tv.2345.com/detail/1759.html', 9.2, '战争', 0, 4985);
INSERT INTO `tv_series_data` VALUES (9524226706, '第二次也很美', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/18/s56875.jpg', 'https://tv.2345.com/detail/56875.html', 8.9, '家庭', 0, 4178);
INSERT INTO `tv_series_data` VALUES (9530926953, '复仇第1季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/0/1034/s1034.jpg', 'https://tv.2345.com/detail/1034.html', 7.9, '家庭', 0, 3778);
INSERT INTO `tv_series_data` VALUES (9539837266, '新一剪梅', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/0/s683.jpg?1362147701', 'https://tv.2345.com/detail/683.html', 9.1, '伦理', 0, 3444);
INSERT INTO `tv_series_data` VALUES (9543360649, '浴血青春', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/20/s61305.jpg', 'https://tv.2345.com/detail/61305.html', 8.9, '战争', 0, 6774);
INSERT INTO `tv_series_data` VALUES (9543694018, '妻子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/4/12346/10efd7fa313e7e25903fd6906d8ef198.jpg', 'https://tv.2345.com/detail/12346.html', 9, '家庭', 0, 6137);
INSERT INTO `tv_series_data` VALUES (9544725425, '红蔷薇DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/18/s54196.jpg', 'https://tv.2345.com/detail/54196.html', 9.3, '战争', 0, 3099);
INSERT INTO `tv_series_data` VALUES (9546593875, '黄金地带', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/1681/83868fbe32db77e1cde45f1597dd5341.jpg', 'https://tv.2345.com/detail/1681.html', 8.9, '家庭', 0, 6902);
INSERT INTO `tv_series_data` VALUES (9550588792, '血色湘西第二部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/17/s53877.jpg', 'https://tv.2345.com/detail/53877.html', 7.8, '战争', 0, 6284);
INSERT INTO `tv_series_data` VALUES (9551975296, '相伴', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/527/07e131175b0209d7b967533014ce6658.jpg', 'https://tv.2345.com/detail/527.html', 9.1, '家庭', 0, 7576);
INSERT INTO `tv_series_data` VALUES (9552724870, '小家大事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/0/1440/eb5a6dcff4d3da8a554fdd017af358b0.jpg', 'https://tv.2345.com/detail/1440.html', 8.9, '伦理', 0, 3348);
INSERT INTO `tv_series_data` VALUES (9555189271, '江湖正道', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/8/s25591.jpg?1380594276', 'https://tv.2345.com/detail/25591.html', 8.5, '战争', 0, 4948);
INSERT INTO `tv_series_data` VALUES (9555325782, '寒冬', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/11/s33357.jpg?1419929866', 'https://tv.2345.com/detail/33357.html', 8.8, '悬疑', 0, 7578);
INSERT INTO `tv_series_data` VALUES (9561178403, '鸳鸯佩', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/8/s26461.jpg?1439798923', 'https://tv.2345.com/detail/26461.html', 8.5, '家庭', 0, 6294);
INSERT INTO `tv_series_data` VALUES (9563202779, '红色护卫', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/16/s50260.jpg?1476428443', 'https://tv.2345.com/detail/50260.html', 8.6, '战争', 0, 5865);
INSERT INTO `tv_series_data` VALUES (9568723674, '亚洲特种部队', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/18/s55149.jpg', 'https://tv.2345.com/detail/55149.html', 9.7, '战争', 0, 6005);
INSERT INTO `tv_series_data` VALUES (9569051298, '锁春记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/792/54da3227a137c05eb2442a8db4c8a117.jpg', 'https://tv.2345.com/detail/792.html', 9.2, '家庭', 0, 5816);
INSERT INTO `tv_series_data` VALUES (9573129652, '火线英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/11/s33225.jpg?1435800656', 'https://tv.2345.com/detail/33225.html', 8.5, '战争', 0, 6057);
INSERT INTO `tv_series_data` VALUES (9577592158, '追捕', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/868/5a5358c188c0bbce9cff7d5e4523889f.jpg', 'https://tv.2345.com/detail/868.html', 8.1, '悬疑', 0, 3417);
INSERT INTO `tv_series_data` VALUES (9578873682, '追捕', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/868/5a5358c188c0bbce9cff7d5e4523889f.jpg', 'https://tv.2345.com/detail/868.html', 8.1, '战争', 0, 3529);
INSERT INTO `tv_series_data` VALUES (9580202235, '走出蓝水河', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/2/8625/9ed34220f6b624fd32c15dd01eaac0d1.jpg', 'https://tv.2345.com/detail/8625.html', 9.3, '伦理', 0, 3770);
INSERT INTO `tv_series_data` VALUES (9582104308, '回家的欲望', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/1798/s1798.jpg', 'https://tv.2345.com/detail/1798.html', 9, '家庭', 0, 5283);
INSERT INTO `tv_series_data` VALUES (9582865740, '老爸快跑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/265/b2f73d392da4a9602fc7ecfb4a5b675a.jpg', 'https://tv.2345.com/detail/265.html', 9.4, '家庭', 0, 3954);
INSERT INTO `tv_series_data` VALUES (9585296750, '回家的诱惑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/1713/bff4a7f0a4e591b4f26d0c2c04d9f23c.jpg', 'https://tv.2345.com/detail/1713.html', 9.1, '家庭', 0, 4661);
INSERT INTO `tv_series_data` VALUES (9587961294, '又见阿郎', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/90/56de63cb786ea4814343b62be495b0d6.jpg', 'https://tv.2345.com/detail/90.html', 8.9, '伦理', 0, 6853);
INSERT INTO `tv_series_data` VALUES (9591556909, '永不褪色的家园', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/15/s47168.jpg', 'https://tv.2345.com/detail/47168.html', 7.1, '其他', 0, 7924);
INSERT INTO `tv_series_data` VALUES (9592792878, '我是特种兵之火凤凰TV版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/8/s25914.jpg?1382666988', 'https://tv.2345.com/detail/25914.html', 8.6, '战争', 0, 6301);
INSERT INTO `tv_series_data` VALUES (9595734749, '摩登家庭大陆版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/1/4668/0c15386a5bd2593607ba01ec57ec7248.jpg', 'https://tv.2345.com/detail/4668.html', 9.5, '家庭', 0, 5300);
INSERT INTO `tv_series_data` VALUES (9597813338, '掩护', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/0/s901.jpg?1362647180', 'https://tv.2345.com/detail/901.html', 9.1, '战争', 0, 7916);
INSERT INTO `tv_series_data` VALUES (9599747806, '新猛龙过江', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/17/s52629.jpg?1486981726', 'https://tv.2345.com/detail/52629.html', 8.7, '战争', 0, 5291);
INSERT INTO `tv_series_data` VALUES (9602782314, '妈妈再爱我一次', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/1156/a9b649448253240df397e5f8a36edc0b.jpg', 'https://tv.2345.com/detail/1156.html', 9.7, '伦理', 0, 7826);
INSERT INTO `tv_series_data` VALUES (9603343488, '情锁', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/2893/e795588b1b267bd7e21c457e03cd0ec3.jpg', 'https://tv.2345.com/detail/2893.html', 10, '家庭', 0, 7370);
INSERT INTO `tv_series_data` VALUES (9607519681, '向幸福前进', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/11/s33378.jpg', 'https://tv.2345.com/detail/33378.html', 8.8, '家庭', 0, 6210);
INSERT INTO `tv_series_data` VALUES (9607954853, '完美结局', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/229/dd63eb8234366c96883b1e4b75b7402b.jpg', 'https://tv.2345.com/detail/229.html', 8.9, '家庭', 0, 7185);
INSERT INTO `tv_series_data` VALUES (9613504763, '谍战狂花', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/1144/s1144.jpg', 'https://tv.2345.com/detail/1144.html', 8.8, '家庭', 0, 6520);
INSERT INTO `tv_series_data` VALUES (9618322231, '一错再错', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/2/s8054.jpg', 'https://tv.2345.com/detail/8054.html', 9.8, '伦理', 0, 6852);
INSERT INTO `tv_series_data` VALUES (9618813042, '陪你一起长大', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/19/s59046.jpg', 'https://tv.2345.com/detail/59046.html', 7.7, '家庭', 0, 6712);
INSERT INTO `tv_series_data` VALUES (9621396724, '像童话一样', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/6/s20250.jpg?1363658368', 'https://tv.2345.com/detail/20250.html', 8.5, '伦理', 0, 7203);
INSERT INTO `tv_series_data` VALUES (9622666945, '甜蜜计划', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/20/s60917.jpg', 'https://tv.2345.com/detail/60917.html', 9.7, '家庭', 0, 4061);
INSERT INTO `tv_series_data` VALUES (9622794822, '嫁给爱情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/13/s39075.jpg?1403833470', 'https://tv.2345.com/detail/39075.html', 8.5, '家庭', 0, 4364);
INSERT INTO `tv_series_data` VALUES (9624757905, '秋去秋来', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/3/9734/95e4f989bb39ac9baa77469a4bb28e0d.jpg', 'https://tv.2345.com/detail/9734.html', 8.8, '伦理', 0, 7851);
INSERT INTO `tv_series_data` VALUES (9627481269, '我的丑娘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/0/203/24fd8543761299f386e8b1a4e1478b54.jpg', 'https://tv.2345.com/detail/203.html', 9.3, '家庭', 0, 3282);
INSERT INTO `tv_series_data` VALUES (9628979684, '少年大钦差', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/198/f3e96e21112489ce873eb4fcde968a3f.jpg', 'https://tv.2345.com/detail/198.html', 9, '家庭', 0, 7290);
INSERT INTO `tv_series_data` VALUES (9632867437, '江阴要塞', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/1/4449/f932e57db6e915fdd59dc62aae79a2e4.jpg', 'https://tv.2345.com/detail/4449.html', 9.1, '战争', 0, 3857);
INSERT INTO `tv_series_data` VALUES (9635693123, '石光荣的战火青春', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/5/s16925.jpg?1386118628', 'https://tv.2345.com/detail/16925.html', 8.5, '悬疑', 0, 4678);
INSERT INTO `tv_series_data` VALUES (9635939451, '妻子的反攻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/20/s61235.jpg', 'https://tv.2345.com/detail/61235.html', 8.9, '家庭', 0, 7638);
INSERT INTO `tv_series_data` VALUES (9636271834, '娘家的故事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/532/b17ac4d3f6133dab0c52a28fe15132bf.jpg', 'https://tv.2345.com/detail/532.html', 8.8, '伦理', 0, 4651);
INSERT INTO `tv_series_data` VALUES (9642862190, '医学调查', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/15/s47262.jpg', 'https://tv.2345.com/detail/47262.html', 9.5, '其他', 0, 7431);
INSERT INTO `tv_series_data` VALUES (9648527104, '薛丁山', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/11/s33115.jpg?1398821906', 'https://tv.2345.com/detail/33115.html', 8.3, '战争', 0, 7533);
INSERT INTO `tv_series_data` VALUES (9648970016, '天敌', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/3/11475/e3794701b48056b1422ad1417a904c95.jpg', 'https://tv.2345.com/detail/11475.html', 9.3, '战争', 0, 7816);
INSERT INTO `tv_series_data` VALUES (9655534688, '中国地', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/2059/bf31291c6dd0dbe8e6c5c6b02da309ab.jpg', 'https://tv.2345.com/detail/2059.html', 8.9, '战争', 0, 3301);
INSERT INTO `tv_series_data` VALUES (9671983450, '幸福里九号', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/2/6906/ab6cecf9936f18e2c50ad86fa01acff5.jpg', 'https://tv.2345.com/detail/6906.html', 8.9, '家庭', 0, 3874);
INSERT INTO `tv_series_data` VALUES (9672173831, '生死十七天', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/2/8037/a4576c0011e680e7f9786180be92ea18.jpg', 'https://tv.2345.com/detail/8037.html', 8.8, '伦理', 0, 5282);
INSERT INTO `tv_series_data` VALUES (9675292007, '沙场点兵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/2759/d9f042d5eef15defb832b6152ac53f79.jpg', 'https://tv.2345.com/detail/2759.html', 8.5, '军旅', 0, 6851);
INSERT INTO `tv_series_data` VALUES (9685409207, '我爱你2012TV版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/0/s2240.jpg?1415346115', 'https://tv.2345.com/detail/2240.html', 9.4, '家庭', 0, 6174);
INSERT INTO `tv_series_data` VALUES (9686971697, '黄河那道弯', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/3/9233/c3f7f7e0aa878e15d401d31c8439c79a.jpg', 'https://tv.2345.com/detail/9233.html', 7.8, '伦理', 0, 4911);
INSERT INTO `tv_series_data` VALUES (9688691981, '原谅', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/1/4511/acbc559d9cbf451c7b423f38247cd38d.jpg', 'https://tv.2345.com/detail/4511.html', 8.7, '战争', 0, 4121);
INSERT INTO `tv_series_data` VALUES (9689566280, '聊斋3', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/1402/s1402.jpg', 'https://tv.2345.com/detail/1402.html', 8.4, '悬疑', 0, 7333);
INSERT INTO `tv_series_data` VALUES (9690799992, '新乌龙山剿匪记', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/2/7628/2351e0fdd61ab4613de8b6684f5b6bcc.jpg', 'https://tv.2345.com/detail/7628.html', 8.6, '军旅', 0, 3584);
INSERT INTO `tv_series_data` VALUES (9697227839, '俺娘田小草', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/15/s47455.jpg?1447134245', 'https://tv.2345.com/detail/47455.html', 8.5, '家庭', 0, 7281);
INSERT INTO `tv_series_data` VALUES (9699958961, '天生要完美', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/15/s45310.jpg?1421035847', 'https://tv.2345.com/detail/45310.html', 8.4, '军旅', 0, 6691);
INSERT INTO `tv_series_data` VALUES (9702405536, '侦探成旭', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/15/s45557.jpg', 'https://tv.2345.com/detail/45557.html', 9.2, '战争', 0, 5036);
INSERT INTO `tv_series_data` VALUES (9706635196, '双城生活', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/1/5681/9bc72d07f9d2865cb4fc09d91f442592.jpg', 'https://tv.2345.com/detail/5681.html', 9.1, '家庭', 0, 3005);
INSERT INTO `tv_series_data` VALUES (9708022957, '马迭尔旅馆的枪声', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/2033/4c8b6e3598d1f4e716c59f12181d52f6.jpg', 'https://tv.2345.com/detail/2033.html', 9.8, '战争', 0, 5684);
INSERT INTO `tv_series_data` VALUES (9710735963, '蓝军出击', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/19/s57897.jpg', 'https://tv.2345.com/detail/57897.html', 9.8, '战争', 0, 5918);
INSERT INTO `tv_series_data` VALUES (9711817034, '前世今生姜武版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/2349/9eade653495598adb49a379cafaebabb.jpg', 'https://tv.2345.com/detail/2349.html', 8, '家庭', 0, 6007);
INSERT INTO `tv_series_data` VALUES (9711920944, '誓言DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/18/s54774.jpg', 'https://tv.2345.com/detail/54774.html', 9.6, '战争', 0, 6021);
INSERT INTO `tv_series_data` VALUES (9718394769, '罗龙镇女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/15/s46501.jpg?1434511935', 'https://tv.2345.com/detail/46501.html', 8.4, '战争', 0, 4680);
INSERT INTO `tv_series_data` VALUES (9718761744, '永不放弃', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/2/7528/6a87195ef8abf9f654aa2398a5588b90.jpg', 'https://tv.2345.com/detail/7528.html', 8.5, '家庭', 0, 6018);
INSERT INTO `tv_series_data` VALUES (9720401291, '和婆婆一起出嫁', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/1/3/s10016.jpg', 'https://tv.2345.com/detail/10016.html', 7.4, '伦理', 0, 4957);
INSERT INTO `tv_series_data` VALUES (9720620723, '亲情协议', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/15/s46477.jpg', 'https://tv.2345.com/detail/46477.html', 8.5, '伦理', 0, 3589);
INSERT INTO `tv_series_data` VALUES (9721036612, '中国家庭之新渴望', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/2/s8393.jpg', 'https://tv.2345.com/detail/8393.html', 8.9, '伦理', 0, 4669);
INSERT INTO `tv_series_data` VALUES (9722199951, '乱世新娘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/409/3fc45613d0edb9d190c57a341fc4e968.jpg', 'https://tv.2345.com/detail/409.html', 8.8, '战争', 0, 4293);
INSERT INTO `tv_series_data` VALUES (9723175727, '鬼吹灯之黄皮子坟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/16/s48059.jpg?1500621070', 'https://tv.2345.com/detail/48059.html', 8.7, '悬疑', 0, 3859);
INSERT INTO `tv_series_data` VALUES (9724463471, '奶娘', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/1/s5245.jpg?1398414780', 'https://tv.2345.com/detail/5245.html', 8.8, '伦理', 0, 6577);
INSERT INTO `tv_series_data` VALUES (9725394233, '爱我就给我一个家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/1/4468/d7e52f993e7c51ec7e84c73f3e28d73f.jpg', 'https://tv.2345.com/detail/4468.html', 8.6, '家庭', 0, 6721);
INSERT INTO `tv_series_data` VALUES (9726783213, '沙家浜', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/1974/f2206c4be23c71b97b0d6e096fae4ae5.jpg', 'https://tv.2345.com/detail/1974.html', 7.4, '战争', 0, 3566);
INSERT INTO `tv_series_data` VALUES (9728483457, '傻春', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/928/1517b11fc0485ee2526ec5d12d5b7ce6.jpg', 'https://tv.2345.com/detail/928.html', 9.4, '家庭', 0, 6282);
INSERT INTO `tv_series_data` VALUES (9729764707, '巨浪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/15/s47214.jpg?1444720864', 'https://tv.2345.com/detail/47214.html', 8.5, '战争', 0, 5632);
INSERT INTO `tv_series_data` VALUES (9732539985, '我本英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/1/s4395.jpg?1410419596', 'https://tv.2345.com/detail/4395.html', 9.6, '家庭', 0, 3890);
INSERT INTO `tv_series_data` VALUES (9733551024, '红蔷薇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/18/s54152.jpg?1512443219', 'https://tv.2345.com/detail/54152.html', 9.2, '战争', 0, 7300);
INSERT INTO `tv_series_data` VALUES (9734379593, '回家的路', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/4/12531/7b5549c9a9e30efead07cc5899b9b6ed.jpg', 'https://tv.2345.com/detail/12531.html', 8.8, '家庭', 0, 5744);
INSERT INTO `tv_series_data` VALUES (9734556356, '最后一枪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/e/4/b.jpg', 'https://tv.2345.com/detail/11634.html', 9.1, '悬疑', 0, 7910);
INSERT INTO `tv_series_data` VALUES (9734983632, '地下地上', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/17/88dfcd38c8bfb52efe36a31fe4e393e7.jpg', 'https://tv.2345.com/detail/17.html', 9.2, '悬疑', 0, 5110);
INSERT INTO `tv_series_data` VALUES (9735166149, '绝对权力', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/776/187b3f83c4a81274f08dc8cc74923ca1.jpg', 'https://tv.2345.com/detail/776.html', 8.5, '悬疑', 0, 4517);
INSERT INTO `tv_series_data` VALUES (9738109539, '红色电波', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/497/ac28c21c2827ff7e31d566c22ed8059c.jpg', 'https://tv.2345.com/detail/497.html', 9.1, '悬疑', 0, 5099);
INSERT INTO `tv_series_data` VALUES (9739904196, '猎毒人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/18/s54952.jpg?1530077708', 'https://tv.2345.com/detail/54952.html', 9.2, '悬疑', 0, 3937);
INSERT INTO `tv_series_data` VALUES (9740337237, '共产党人刘少奇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/18/s55935.jpg', 'https://tv.2345.com/detail/55935.html', 9.8, '战争', 0, 5808);
INSERT INTO `tv_series_data` VALUES (9746725944, '心理罪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/15/s45641.jpg?1477982070', 'https://tv.2345.com/detail/45641.html', 8.6, '悬疑', 0, 4482);
INSERT INTO `tv_series_data` VALUES (9748821698, '李三枪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/18/s56362.jpg', 'https://tv.2345.com/detail/56362.html', 8, '战争', 0, 4029);
INSERT INTO `tv_series_data` VALUES (9752266786, '解放大西南未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/0/s2248.jpg?1411874474', 'https://tv.2345.com/detail/2248.html', 9, '军旅', 0, 7798);
INSERT INTO `tv_series_data` VALUES (9755844665, '老娘泪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/b/3/10192/a69d9014bf0ad1ac2f1b2051bfe5b1cb.jpg', 'https://tv.2345.com/detail/10192.html', 9.6, '家庭', 0, 3071);
INSERT INTO `tv_series_data` VALUES (9757092647, '反恐特战队之天狼', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/18/s56053.jpg', 'https://tv.2345.com/detail/56053.html', 9.2, '战争', 0, 5036);
INSERT INTO `tv_series_data` VALUES (9764104709, '人生是美丽的', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/1/s3444.jpg', 'https://tv.2345.com/detail/3444.html', 7.5, '伦理', 0, 6566);
INSERT INTO `tv_series_data` VALUES (9772836922, '空巢姥爷', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/15/s46342.jpg?1432624933', 'https://tv.2345.com/detail/46342.html', 8.4, '家庭', 0, 7121);
INSERT INTO `tv_series_data` VALUES (9773536280, '陆战之王', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/18/s56553.jpg', 'https://tv.2345.com/detail/56553.html', 8.9, '战争', 0, 4059);
INSERT INTO `tv_series_data` VALUES (9773726643, '城里城外东北人1', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/19/s57293.jpg', 'https://tv.2345.com/detail/57293.html', 8.6, '家庭', 0, 3081);
INSERT INTO `tv_series_data` VALUES (9775237879, '富贵临门', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/2/s6812.jpg', 'https://tv.2345.com/detail/6812.html', 9.2, '家庭', 0, 7461);
INSERT INTO `tv_series_data` VALUES (9779106624, '春江英雄之秀才遇到兵', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/15/s46220.jpg?1438826271', 'https://tv.2345.com/detail/46220.html', 8.5, '战争', 0, 6750);
INSERT INTO `tv_series_data` VALUES (9786063729, '天衣无缝烧脑速看版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/18/s55823.jpg', 'https://tv.2345.com/detail/55823.html', 8.2, '战争', 0, 5670);
INSERT INTO `tv_series_data` VALUES (9789518269, '晋中大捷', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/2/6885/c3b5283e0bdfa3162e0f883ad1030af4.jpg', 'https://tv.2345.com/detail/6885.html', 8.7, '战争', 0, 3450);
INSERT INTO `tv_series_data` VALUES (9794051379, '厨王', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/2/s8606.jpg', 'https://tv.2345.com/detail/8606.html', 8.7, '家庭', 0, 7138);
INSERT INTO `tv_series_data` VALUES (9794748203, '温暖青春', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/19/s57813.jpg', 'https://tv.2345.com/detail/57813.html', 9.1, '家庭', 0, 7854);
INSERT INTO `tv_series_data` VALUES (9797482997, '幸福36计', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/13/s41338.jpg?1411091712', 'https://tv.2345.com/detail/41338.html', 8.6, '家庭', 0, 7993);
INSERT INTO `tv_series_data` VALUES (9801589037, '誓言2004版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/0/2398/s2398.jpg', 'https://tv.2345.com/detail/2398.html', 9.5, '战争', 0, 6071);
INSERT INTO `tv_series_data` VALUES (9812691263, '太行英雄传TV版TV剪辑版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/17/s53327.jpg', 'https://tv.2345.com/detail/53327.html', 8.8, '战争', 0, 7215);
INSERT INTO `tv_series_data` VALUES (9818057391, '父亲的战争', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/126/411110fcaaf3c2de86b196654e871c4e.jpg', 'https://tv.2345.com/detail/126.html', 9, '战争', 0, 5031);
INSERT INTO `tv_series_data` VALUES (9825324256, '红旗漫卷西风', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/16/s49573.jpg?1475916914', 'https://tv.2345.com/detail/49573.html', 8.1, '战争', 0, 6978);
INSERT INTO `tv_series_data` VALUES (9826999352, '第22条婚规', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/16/s48831.jpg', 'https://tv.2345.com/detail/48831.html', 7.2, '家庭', 0, 7110);
INSERT INTO `tv_series_data` VALUES (9830868506, '军医', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/140/e70856df254a92c7163188f04fd0892e.png', 'https://tv.2345.com/detail/140.html', 9, '战争', 0, 3132);
INSERT INTO `tv_series_data` VALUES (9831959275, '黄河英雄', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/18/s55976.jpg', 'https://tv.2345.com/detail/55976.html', 9.2, '战争', 0, 3954);
INSERT INTO `tv_series_data` VALUES (9836658412, '青年乌兰夫', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/18/s55330.jpg', 'https://tv.2345.com/detail/55330.html', 9.2, '战争', 0, 7107);
INSERT INTO `tv_series_data` VALUES (9837018202, '啊摇篮', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/19/s59117.jpg', 'https://tv.2345.com/detail/59117.html', 9.8, '战争', 0, 7146);
INSERT INTO `tv_series_data` VALUES (9837751203, '书香门第', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/18/s56999.jpg', 'https://tv.2345.com/detail/56999.html', 9.3, '家庭', 0, 5401);
INSERT INTO `tv_series_data` VALUES (9837969598, '还是夫妻', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/15/s47962.jpg?1455594370', 'https://tv.2345.com/detail/47962.html', 8.5, '家庭', 0, 4788);
INSERT INTO `tv_series_data` VALUES (9841368417, '纸婚未删减版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/d/13/s39777.jpg?1410422096', 'https://tv.2345.com/detail/39777.html', 6.3, '伦理', 0, 5101);
INSERT INTO `tv_series_data` VALUES (9846357649, '太行山上', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/15/s46758.jpg', 'https://tv.2345.com/detail/46758.html', 8.5, '战争', 0, 6572);
INSERT INTO `tv_series_data` VALUES (9846690809, '秋蝉任嘉伦篇', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/19/s57626.jpg', 'https://tv.2345.com/detail/57626.html', 7, '战争', 0, 3230);
INSERT INTO `tv_series_data` VALUES (9848724222, '血染大青山', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/17/s53438.jpg?1502332409', 'https://tv.2345.com/detail/53438.html', 8.1, '战争', 0, 7479);
INSERT INTO `tv_series_data` VALUES (9851225623, '前世今生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/16/s50589.jpg', 'https://tv.2345.com/detail/50589.html', 8.2, '其他', 0, 4928);
INSERT INTO `tv_series_data` VALUES (9852108921, '江南锄奸', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/c/0/1464/ba0450caadf685ce8260c46384297a48.jpg', 'https://tv.2345.com/detail/1464.html', 9.5, '悬疑', 0, 5895);
INSERT INTO `tv_series_data` VALUES (9852528979, '我们生活的年代', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/25/546d3d958a2bf5734c00671af73626c2.jpg', 'https://tv.2345.com/detail/25.html', 9.5, '家庭', 0, 6681);
INSERT INTO `tv_series_data` VALUES (9856813455, '枪火', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/10/s32366.jpg?1395729860', 'https://tv.2345.com/detail/32366.html', 8.5, '战争', 0, 7105);
INSERT INTO `tv_series_data` VALUES (9859535421, '当婆婆遇上妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/1/5000/d909ba959fc933f7f3366712f996f7d1.jpg', 'https://tv.2345.com/detail/5000.html', 7.4, '家庭', 0, 4238);
INSERT INTO `tv_series_data` VALUES (9860113195, '青春不言败', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/16/s50199.jpg', 'https://tv.2345.com/detail/50199.html', 9.5, '家庭', 0, 6547);
INSERT INTO `tv_series_data` VALUES (9861957735, '夜市人生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/1/s3513.jpg?1490237104', 'https://tv.2345.com/detail/3513.html', 8.5, '伦理', 0, 5405);
INSERT INTO `tv_series_data` VALUES (9869136369, '一个女人引发的血案', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/3/s9691.jpg', 'https://tv.2345.com/detail/9691.html', 6.8, '伦理', 0, 4498);
INSERT INTO `tv_series_data` VALUES (9869183819, '儿女的战争', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/f/5/9.jpg', 'https://tv.2345.com/detail/15883.html', 8.9, '家庭', 0, 3575);
INSERT INTO `tv_series_data` VALUES (9874306040, '中国刑警803', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/15/s46104.jpg?1429758525', 'https://tv.2345.com/detail/46104.html', 8.4, '悬疑', 0, 5838);
INSERT INTO `tv_series_data` VALUES (9875725049, '傻瓜妈妈', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/2/7998/1011997a083e4307ed9e571ce068da57.jpg', 'https://tv.2345.com/detail/7998.html', 9.5, '家庭', 0, 5568);
INSERT INTO `tv_series_data` VALUES (9879109059, '毕业生', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/0/1/s4222.jpg?1410419584', 'https://tv.2345.com/detail/4222.html', 9.2, '伦理', 0, 7814);
INSERT INTO `tv_series_data` VALUES (9879485971, '母爱十三宗', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/252/358912bbbe6ff987e3f37d59f590c9aa.jpg', 'https://tv.2345.com/detail/252.html', 8.7, '伦理', 0, 6032);
INSERT INTO `tv_series_data` VALUES (9881833903, '冷枪手', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/18/s55944.jpg', 'https://tv.2345.com/detail/55944.html', 8.4, '战争', 0, 7483);
INSERT INTO `tv_series_data` VALUES (9881958853, '爱你千万次', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/0/0/888/ab549456bb0d652528d5d1a23a8237f0.jpg', 'https://tv.2345.com/detail/888.html', 9.5, '家庭', 0, 5416);
INSERT INTO `tv_series_data` VALUES (9882338827, '雳剑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/10/s32793.jpg?1408612675', 'https://tv.2345.com/detail/32793.html', 8.3, '战争', 0, 5605);
INSERT INTO `tv_series_data` VALUES (9882495518, '向左走向右走', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/3/9681/6d6df24858dee2ab73bfe8ce01717e7c.jpg', 'https://tv.2345.com/detail/9681.html', 9.1, '伦理', 0, 6357);
INSERT INTO `tv_series_data` VALUES (9883313694, '把爱带回家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/13/s40961.jpg?1408953234', 'https://tv.2345.com/detail/40961.html', 8.4, '家庭', 0, 7181);
INSERT INTO `tv_series_data` VALUES (9884923299, '玫瑰战争', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/1/s3644.jpg', 'https://tv.2345.com/detail/3644.html', 7.6, '家庭', 0, 7521);
INSERT INTO `tv_series_data` VALUES (9889111703, '红色追击令', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/2/0/2012/d16c3a926c796a35f09e8652f1fb0766.jpg', 'https://tv.2345.com/detail/2012.html', 10, '战争', 0, 5098);
INSERT INTO `tv_series_data` VALUES (9890011497, '宁为女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/846/bb6ba3108d92d91632733652f407627c.jpg', 'https://tv.2345.com/detail/846.html', 8.9, '家庭', 0, 4510);
INSERT INTO `tv_series_data` VALUES (9891276532, '新一剪梅', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/0/s683.jpg?1362147701', 'https://tv.2345.com/detail/683.html', 9.1, '家庭', 0, 3805);
INSERT INTO `tv_series_data` VALUES (9892862528, '一错再错', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/2/s8054.jpg', 'https://tv.2345.com/detail/8054.html', 9.8, '家庭', 0, 4735);
INSERT INTO `tv_series_data` VALUES (9893635242, '血色黎明', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/4/s14875.jpg?1415772348', 'https://tv.2345.com/detail/14875.html', 7.3, '战争', 0, 4870);
INSERT INTO `tv_series_data` VALUES (9895836933, '失踪女人', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/16/s49115.jpg', 'https://tv.2345.com/detail/49115.html', 9, '家庭', 0, 4925);
INSERT INTO `tv_series_data` VALUES (9895986858, '狼心', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/3/9756/ea4e530c4942c550de1f67af9b024792.jpg', 'https://tv.2345.com/detail/9756.html', 8.7, '家庭', 0, 7595);
INSERT INTO `tv_series_data` VALUES (9901502621, '我是特种兵之火凤凰DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/9/s28074.jpg?1411547215', 'https://tv.2345.com/detail/28074.html', 8.6, '战争', 0, 5436);
INSERT INTO `tv_series_data` VALUES (9904236855, '神探夏洛克第3季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/7/s21918.jpg?1389601022', 'https://tv.2345.com/detail/21918.html', 8.4, '悬疑', 0, 6947);
INSERT INTO `tv_series_data` VALUES (9906103048, '最后的格格', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/9/0/300/49eaef5839b47f48a0dcba01df02c278.jpg', 'https://tv.2345.com/detail/300.html', 9.3, '家庭', 0, 5143);
INSERT INTO `tv_series_data` VALUES (9906558946, '战斗的青春', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/30/07bee85639c54ce632d4d13dcda77c9f.jpg', 'https://tv.2345.com/detail/30.html', 9.2, '战争', 0, 7292);
INSERT INTO `tv_series_data` VALUES (9907789763, '下辈子还做我老爸', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/16/s50467.jpg?1477977211', 'https://tv.2345.com/detail/50467.html', 8.2, '家庭', 0, 5865);
INSERT INTO `tv_series_data` VALUES (9914821382, '终极特警第1季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/7/9/s28794.jpg?1389341236', 'https://tv.2345.com/detail/28794.html', 8.2, '战争', 0, 7686);
INSERT INTO `tv_series_data` VALUES (9918950770, '锣鼓巷', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/4/0/318/105bf06c115cf43e00c835fdb324df91.jpg', 'https://tv.2345.com/detail/318.html', 8.9, '伦理', 0, 3788);
INSERT INTO `tv_series_data` VALUES (9919259466, '返城年代全集', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/b/18/s56324.jpg', 'https://tv.2345.com/detail/56324.html', 7.7, '伦理', 0, 7112);
INSERT INTO `tv_series_data` VALUES (9920577438, '弹孔', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/d/0/1057/s1057.jpg', 'https://tv.2345.com/detail/1057.html', 9, '军旅', 0, 5256);
INSERT INTO `tv_series_data` VALUES (9923986437, '风中玫瑰', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/15/s46843.jpg', 'https://tv.2345.com/detail/46843.html', 9.8, '家庭', 0, 7925);
INSERT INTO `tv_series_data` VALUES (9925681764, '蜂鸟', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/16/s50355.jpg?1476433241', 'https://tv.2345.com/detail/50355.html', 8.6, '战争', 0, 3190);
INSERT INTO `tv_series_data` VALUES (9926892338, '爸爸父亲爹', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/15/s46521.jpg?1434950584', 'https://tv.2345.com/detail/46521.html', 8.5, '战争', 0, 3992);
INSERT INTO `tv_series_data` VALUES (9928877246, '风云金三角', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/1/3185/s3185.jpg', 'https://tv.2345.com/detail/3185.html', 6.1, '战争', 0, 3988);
INSERT INTO `tv_series_data` VALUES (9930996158, '我是传说', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/6/0/823/7b7a5ad880593e0695a9412c6ee0aa13.jpg', 'https://tv.2345.com/detail/823.html', 8.4, '家庭', 0, 6943);
INSERT INTO `tv_series_data` VALUES (9936091597, '终极尖兵对决', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/a/16/s50236.jpg', 'https://tv.2345.com/detail/50236.html', 8.7, '战争', 0, 5751);
INSERT INTO `tv_series_data` VALUES (9938996759, '笑笑茶楼第二部', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/4/12491/1544d1076a78e4cfe4c78c0cd200cda8.jpg', 'https://tv.2345.com/detail/12491.html', 8, '家庭', 0, 3307);
INSERT INTO `tv_series_data` VALUES (9941302390, '暖暖的幸福', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/18/s55833.jpg', 'https://tv.2345.com/detail/55833.html', 8.9, '家庭', 0, 7888);
INSERT INTO `tv_series_data` VALUES (9941883979, '家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/14/s43107.jpg?1414641762', 'https://tv.2345.com/detail/43107.html', 9, '家庭', 0, 3929);
INSERT INTO `tv_series_data` VALUES (9942403675, '战昆仑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/e/17/s53563.jpg', 'https://tv.2345.com/detail/53563.html', 8.1, '战争', 0, 5105);
INSERT INTO `tv_series_data` VALUES (9944874718, '金粉世家内地版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/1/s3878.jpg?1576750955', 'https://tv.2345.com/detail/3878.html', 9.6, '家庭', 0, 3072);
INSERT INTO `tv_series_data` VALUES (9946443543, '我的天才女友', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/8/18/s55972.jpg', 'https://tv.2345.com/detail/55972.html', 9.8, '家庭', 0, 7422);
INSERT INTO `tv_series_data` VALUES (9949672278, '海峡往事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/a/0/1711/c441837858c2362be4340006b0d322bd.jpg', 'https://tv.2345.com/detail/1711.html', 8.7, '战争', 0, 3991);
INSERT INTO `tv_series_data` VALUES (9957564346, '婚里婚外那些事', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/11/s35826.jpg?1401330742', 'https://tv.2345.com/detail/35826.html', 8.5, '伦理', 0, 3015);
INSERT INTO `tv_series_data` VALUES (9957752368, '拯救女兵司徒慧', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/9/1/s3660.jpg', 'https://tv.2345.com/detail/3660.html', 8.8, '战争', 0, 3625);
INSERT INTO `tv_series_data` VALUES (9958576092, '闪婚', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/964/d3809ced917d3e19039c5361c88d9e93.jpg', 'https://tv.2345.com/detail/964.html', 9.3, '伦理', 0, 7201);
INSERT INTO `tv_series_data` VALUES (9959094471, '海天之恋', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/1/0/2876/b5213c2432028767753000c7771306e4.jpg', 'https://tv.2345.com/detail/2876.html', 8.8, '战争', 0, 4056);
INSERT INTO `tv_series_data` VALUES (9959319215, '彭雪枫', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/4/2/s8617.jpg', 'https://tv.2345.com/detail/8617.html', 7.8, '战争', 0, 3366);
INSERT INTO `tv_series_data` VALUES (9962546055, '虾球传', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/f/0/s577.jpg?1413427911', 'https://tv.2345.com/detail/577.html', 8.7, '战争', 0, 5369);
INSERT INTO `tv_series_data` VALUES (9965971101, '永不消逝的电波', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/8/0/665/8433b5afd59eed75a0ac0de3f45f2802.jpg', 'https://tv.2345.com/detail/665.html', 9.3, '战争', 0, 7501);
INSERT INTO `tv_series_data` VALUES (9969373806, '我这一辈子', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/3/0/1703/673ebd779410e4d7867e35a2de96aa1f.jpg', 'https://tv.2345.com/detail/1703.html', 9.6, '家庭', 0, 6488);
INSERT INTO `tv_series_data` VALUES (9974181520, '血雨母子情DVD版', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/6/17/s53224.jpg', 'https://tv.2345.com/detail/53224.html', 7.8, '战争', 0, 7131);
INSERT INTO `tv_series_data` VALUES (9976858562, '夜班医生第二季', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/15/s47592.jpg', 'https://tv.2345.com/detail/47592.html', 9.4, '其他', 0, 4495);
INSERT INTO `tv_series_data` VALUES (9981619923, '血雨母子情', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/2/7/s21153.jpg?1366683160', 'https://tv.2345.com/detail/21153.html', 8.8, '家庭', 0, 3172);
INSERT INTO `tv_series_data` VALUES (9985877843, '陆军一号', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/3/15/s47813.jpg?1451981496', 'https://tv.2345.com/detail/47813.html', 8.8, '军旅', 0, 6027);
INSERT INTO `tv_series_data` VALUES (9988938901, '男人养家', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/7/0/2335/s2335.jpg', 'https://tv.2345.com/detail/2335.html', 8.7, '家庭', 0, 3511);
INSERT INTO `tv_series_data` VALUES (9992509179, '深宅雪', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/c/17/s52199.jpg?1481081624', 'https://tv.2345.com/detail/52199.html', 8.5, '战争', 0, 3989);
INSERT INTO `tv_series_data` VALUES (9994685681, '太阳的后裔制作特辑', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/5/16/s48460.jpg?1461230184', 'https://tv.2345.com/detail/48460.html', 8.4, '其他', 0, 6394);
INSERT INTO `tv_series_data` VALUES (9998534958, '生死归途', 'https://yingshi-stream.2345cdn.net/dypcimg/tv/img/cae/5/2/7115/b9ceea5ab559f0cdb2a8ebeae16ec103.jpg', 'https://tv.2345.com/detail/7115.html', 8.7, '军旅', 0, 5246);

SET FOREIGN_KEY_CHECKS = 1;
