/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : demo

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-05-12 15:12:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for x_action_node
-- ----------------------------
DROP TABLE IF EXISTS `x_action_node`;
CREATE TABLE `x_action_node` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属父节点',
  `name` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '导航节点的名称',
  `url` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '导航的url',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1-顶部菜单,2-左侧主节点,3-左侧子节点',
  `icon_class` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT 'icon-none' COMMENT '导航节点的小图标',
  `sort_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  `is_menu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '菜单是否显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT COMMENT='后台操作节点';

-- ----------------------------
-- Records of x_action_node
-- ----------------------------
INSERT INTO `x_action_node` VALUES ('19', '88', '权限设置', '/', '2', 'icon-accept', '1', '1', '1');
INSERT INTO `x_action_node` VALUES ('22', '19', '角色管理', 'admin/role', '3', 'icon-none', '1', '1', '1');
INSERT INTO `x_action_node` VALUES ('23', '19', '节点管理', 'admin/action_node', '3', 'icon-none', '2', '1', '1');
INSERT INTO `x_action_node` VALUES ('88', '0', '系统设置', '/', '1', 'icon-none', '1', '1', '1');
INSERT INTO `x_action_node` VALUES ('227', '19', '用户管理', 'User/list', '3', '', '3', '1', '1');
INSERT INTO `x_action_node` VALUES ('242', '0', '板块管理', '/', '1', '', '0', '1', '1');
INSERT INTO `x_action_node` VALUES ('243', '242', '板块管理', '/', '2', '', '0', '1', '1');
INSERT INTO `x_action_node` VALUES ('244', '243', '板块列表', 'plate/list', '3', '', '0', '1', '1');
INSERT INTO `x_action_node` VALUES ('245', '0', '文章管理', '/', '1', '', '0', '1', '1');
INSERT INTO `x_action_node` VALUES ('246', '245', '文章管理', '/', '2', '', '0', '1', '1');
INSERT INTO `x_action_node` VALUES ('247', '246', '文章列表', 'article/list', '3', '', '1', '1', '1');
INSERT INTO `x_action_node` VALUES ('251', '246', '文章评论', 'article_comment/list', '3', '', '2', '1', '1');
INSERT INTO `x_action_node` VALUES ('252', '0', '员工管理', '/', '1', '', '0', '1', '1');
INSERT INTO `x_action_node` VALUES ('253', '252', '员工管理', '/', '2', '', '0', '1', '1');
INSERT INTO `x_action_node` VALUES ('254', '253', '员工管理', 'staff_info/list', '3', '', '1', '1', '1');
INSERT INTO `x_action_node` VALUES ('255', '253', '员工排班', 'staff_weektime/list', '3', '', '3', '1', '1');
INSERT INTO `x_action_node` VALUES ('256', '0', '知识库系统', '/', '1', '', '0', '1', '1');
INSERT INTO `x_action_node` VALUES ('257', '256', '智能知识库', '/', '2', '', '0', '1', '1');
INSERT INTO `x_action_node` VALUES ('259', '257', '智能搜索', 'question/searchList', '3', '', '1', '1', '1');
INSERT INTO `x_action_node` VALUES ('260', '257', '最热市政消息', 'news/list', '3', '', '2', '1', '1');
INSERT INTO `x_action_node` VALUES ('263', '0', '统计分析管理', '/', '1', '', '0', '1', '1');
INSERT INTO `x_action_node` VALUES ('264', '263', '当前统计', '/', '2', '', '0', '1', '1');
INSERT INTO `x_action_node` VALUES ('265', '264', '热门标签', 'staff/line', '3', '', '1', '1', '1');
INSERT INTO `x_action_node` VALUES ('266', '264', '热门问题', 'staff/add', '3', '', '2', '1', '1');
INSERT INTO `x_action_node` VALUES ('267', '264', '客服工作情况', 'staff/bar', '3', '', '3', '1', '1');
INSERT INTO `x_action_node` VALUES ('268', '0', '员工工作', '/', '1', '', '0', '1', '1');
INSERT INTO `x_action_node` VALUES ('269', '268', '员工工作', '/', '2', '', '0', '1', '1');
INSERT INTO `x_action_node` VALUES ('270', '269', '在线提问', 'chat/list', '3', '', '1', '1', '1');
INSERT INTO `x_action_node` VALUES ('273', '269', '非在线提问', 'question/list', '3', '', '0', '1', '1');
INSERT INTO `x_action_node` VALUES ('274', '253', '智能排班', 'staff_arrangetime/list', '3', '', '2', '1', '1');
INSERT INTO `x_action_node` VALUES ('275', '0', '排班情况', 'staff_weektime/look', '1', '', '0', '1', '1');
INSERT INTO `x_action_node` VALUES ('276', '253', '排班情况', 'staff_weektime/look', '3', '', '4', '1', '1');

-- ----------------------------
-- Table structure for x_article
-- ----------------------------
DROP TABLE IF EXISTS `x_article`;
CREATE TABLE `x_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `article_title` varchar(255) NOT NULL COMMENT '文章标题',
  `release_time` int(11) NOT NULL COMMENT '发布时间',
  `edit_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `author` varchar(20) NOT NULL COMMENT '作者',
  `plate` int(20) NOT NULL COMMENT '板块',
  `level` int(20) NOT NULL COMMENT '文章等级',
  `article_content` varchar(255) NOT NULL COMMENT '文章内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_article
-- ----------------------------
INSERT INTO `x_article` VALUES ('1', '国务院', '1492165980', '1494510728', '123', '3', '1', '国务院总理李克强5月3日主持召开国务院常务会议，决定提高中央财政自然灾害生活补助标准、加快因灾倒损民房恢复重建；确定支持社会办医和健康旅游发展的措施，满足群众多层次多样化健康需求；部署推动大中型商业银行设立普惠金融事业部，聚焦小微企业和“三农”等提升服务能力。');
INSERT INTO `x_article` VALUES ('2', '美国', '1492240997', '1494510739', '匿名', '4', '2', '会议指出，按照党中央、国务院部署，完善救灾补助政策，是践行以人民为中心发展思想的具体体现，是基本民生兜底保障的重要内容。会议决定，结合救灾工作实际和近年来物价增长等因素，中央财政对台风和其他各类自然灾害应急救助补助实行统一标准，并大幅提高补助水平，同时大幅提高因重特大自然灾害遇难人员家属抚慰金、过渡期生活救助和倒损民房恢复重建的中央补助标准。上述中央补助资金由地方根据实际制定办法、统筹使用。');
INSERT INTO `x_article` VALUES ('3', '经济', '1492515336', '1494510753', 'me', '3', '3', '上述中央补助资金由地方根据实际制定办法、统筹使用。针对去年全国因灾倒损需重建的15.7万户和需修缮的48.7万户民房，会议要求，灾区各级政府和有关部门要在已做大量工作、目前大部分倒损民房已重建或修缮的基础上，继续加大力度，用好资金、保证质量，确保年内全部解决去年因灾仍住在临时安置住所的受灾群众住房问题，其中洪涝灾害倒损民房要在9月底前全部完成重建。让受灾群众尽快走出临时安置状态，步入新生活。');
INSERT INTO `x_article` VALUES ('4', '中美联合', '1493971799', '1494510767', '右脚', '5', '4', '会议指出，普惠金融事关发展和公平，有利于促进创业创新和就业。按照《政府工作报告》部署，着力推进供给侧结构性改革，推动大中型商业银行设立聚焦服务小微企业、“三农”、脱贫攻坚及大众创业、万众创新的普惠金融事业部，可以提高金融服务覆盖率和可得性，为实体经济提供有效支持，防止脱实向虚。会议明确，大型商业银行2017年内要完成普惠金融事业部设立，成为发展普惠金融的骨干力量。');
INSERT INTO `x_article` VALUES ('5', '二孩政策的普及意味着什么', '1494323913', '1494510844', '1', '6', '1', '二孩政策对经济会有着多大的影响？');
INSERT INTO `x_article` VALUES ('6', '习近平出访', '1494510948', '0', '客服1', '3', '5', '出访英美，受热烈欢迎');
INSERT INTO `x_article` VALUES ('7', '最美程序员', '1494510999', '0', '客服3', '4', '1', '深夜里不知有多少埋头的程序员正勤劳的劳动着');
INSERT INTO `x_article` VALUES ('8', '反恐的意义', '1494534166', '0', '客服2', '9', '3', '全民反恐');
INSERT INTO `x_article` VALUES ('10', '11', '1494556410', '0', 'gg', '3', '1', ' ssr');

-- ----------------------------
-- Table structure for x_article_comment
-- ----------------------------
DROP TABLE IF EXISTS `x_article_comment`;
CREATE TABLE `x_article_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content_name` int(11) NOT NULL COMMENT '评论者用户名',
  `content` varchar(255) NOT NULL COMMENT '评论内容',
  `content_time` int(11) NOT NULL COMMENT '评论时间',
  `up` int(11) unsigned DEFAULT NULL COMMENT '赞',
  `down` int(11) unsigned DEFAULT NULL COMMENT '踩',
  `article_id` int(11) NOT NULL COMMENT '文章id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_article_comment
-- ----------------------------
INSERT INTO `x_article_comment` VALUES ('1', '1', '1', '1492166134', '0', '0', '1');
INSERT INTO `x_article_comment` VALUES ('2', '2', 'good', '1494213502', '0', '0', '4');
INSERT INTO `x_article_comment` VALUES ('3', '3', 'false', '1494213562', '0', '0', '2');
INSERT INTO `x_article_comment` VALUES ('4', '1', '文章内容很好，对我很有帮助', '1494335237', '0', '0', '2');
INSERT INTO `x_article_comment` VALUES ('5', '2', '小编希望对推送这些文章', '1494335259', '0', '0', '1');

-- ----------------------------
-- Table structure for x_chat
-- ----------------------------
DROP TABLE IF EXISTS `x_chat`;
CREATE TABLE `x_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户',
  `title` varchar(255) DEFAULT NULL COMMENT '问询标题',
  `chat_time` int(13) DEFAULT NULL COMMENT '问询时间',
  `spon_id` int(11) DEFAULT NULL COMMENT '客服',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_chat
-- ----------------------------
INSERT INTO `x_chat` VALUES ('1', '1', '国务院', '1444444444', '1');
INSERT INTO `x_chat` VALUES ('2', '2', '政府', '1455787897', '2');
INSERT INTO `x_chat` VALUES ('3', '3', '美国', '478894987', null);

-- ----------------------------
-- Table structure for x_label
-- ----------------------------
DROP TABLE IF EXISTS `x_label`;
CREATE TABLE `x_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签',
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_label
-- ----------------------------

-- ----------------------------
-- Table structure for x_news
-- ----------------------------
DROP TABLE IF EXISTS `x_news`;
CREATE TABLE `x_news` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `filename` varchar(255) DEFAULT NULL COMMENT '附件',
  `time` varchar(255) DEFAULT NULL COMMENT '日期',
  `is_hot` tinyint(4) DEFAULT NULL COMMENT '是否热点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='新闻';

-- ----------------------------
-- Records of x_news
-- ----------------------------
INSERT INTO `x_news` VALUES ('1', '4', '市政府法令第一条', 'beTvoIKWoT_!!11854.xlsx', '2017-04-07', '0');
INSERT INTO `x_news` VALUES ('2', '1', '市政府新工作', null, '2017-04-02', '0');
INSERT INTO `x_news` VALUES ('3', '3', '市政热点剖析', null, '2015-07-08', '0');
INSERT INTO `x_news` VALUES ('4', '2', '市政改革机制', null, '2017-01-05', '1');

-- ----------------------------
-- Table structure for x_plate
-- ----------------------------
DROP TABLE IF EXISTS `x_plate`;
CREATE TABLE `x_plate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '板块id',
  `plate_name` varchar(255) NOT NULL COMMENT '板块的名称',
  `plate_manager` int(11) NOT NULL COMMENT '板块负责人',
  `project_num` int(11) NOT NULL COMMENT '板块下项目数',
  `last_edit_time` int(11) NOT NULL COMMENT '该板块最后一次操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_plate
-- ----------------------------
INSERT INTO `x_plate` VALUES ('3', '国务院', '1', '5', '1492240877');
INSERT INTO `x_plate` VALUES ('4', '美联航', '3', '1', '1494512091');
INSERT INTO `x_plate` VALUES ('5', '韩国', '4', '1', '1494512106');
INSERT INTO `x_plate` VALUES ('6', '中美双方', '2', '1', '1494512116');
INSERT INTO `x_plate` VALUES ('7', '朝鲜', '7', '0', '1494512124');
INSERT INTO `x_plate` VALUES ('8', '市政', '7', '0', '1494514359');
INSERT INTO `x_plate` VALUES ('9', '反恐', '8', '1', '1494514375');

-- ----------------------------
-- Table structure for x_question
-- ----------------------------
DROP TABLE IF EXISTS `x_question`;
CREATE TABLE `x_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_title` varchar(255) NOT NULL COMMENT '问题标题',
  `question_content` varchar(255) NOT NULL COMMENT '问题内容',
  `sponsor_id` varchar(255) NOT NULL COMMENT '问题的发起人',
  `release_time` int(13) NOT NULL COMMENT '问题发布时间',
  `answer` varchar(255) NOT NULL COMMENT '问题的回复',
  `answerer_id` int(11) NOT NULL COMMENT '客服id',
  `question_type` int(10) NOT NULL COMMENT '问题类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_question
-- ----------------------------
INSERT INTO `x_question` VALUES ('1', '中关村', '中关村购物', '1', '1455555555', '花钱买', '1', '1');
INSERT INTO `x_question` VALUES ('2', '国务院', '国务院在哪里', '2', '1400000100', '在北京', '2', '2');
INSERT INTO `x_question` VALUES ('3', '韩国', '韩国汇率', '3', '1654486100', '1：1000', '2', '3');
INSERT INTO `x_question` VALUES ('4', '中美关系', '中美建交多少年了', '4', '1428585500', '45年', '4', '2');
INSERT INTO `x_question` VALUES ('5', '萨德', '萨德部署完了吗', '5', '1452522500', '很抱歉，已经初步完成', '3', '1');
INSERT INTO `x_question` VALUES ('6', '市政', '市长热线', '6', '1587644600', '13548965444', '4', '3');

-- ----------------------------
-- Table structure for x_report
-- ----------------------------
DROP TABLE IF EXISTS `x_report`;
CREATE TABLE `x_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报id',
  `report_content` varchar(255) NOT NULL COMMENT '举报内容',
  `reporter` varchar(255) NOT NULL COMMENT '举报者Id',
  `report_object` varchar(255) NOT NULL COMMENT '举报对象',
  `report_time` int(11) NOT NULL COMMENT '举报时间',
  `report_state` int(2) NOT NULL COMMENT '举报状态',
  `report_answer` varchar(255) NOT NULL COMMENT '举报回复',
  `report_process` varchar(255) DEFAULT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_report
-- ----------------------------

-- ----------------------------
-- Table structure for x_role
-- ----------------------------
DROP TABLE IF EXISTS `x_role`;
CREATE TABLE `x_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级角色',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态(1:可用,0:不可用)',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色表';

-- ----------------------------
-- Records of x_role
-- ----------------------------
INSERT INTO `x_role` VALUES ('1', '主管', '0', '拥有系统最高权限', '1', '0');
INSERT INTO `x_role` VALUES ('4', '客服经理', '0', '日常管理', '1', '0');
INSERT INTO `x_role` VALUES ('5', '客服员工', '0', '后台服务使用者', '1', '0');
INSERT INTO `x_role` VALUES ('6', '用户', '0', '只读用户', '1', '0');

-- ----------------------------
-- Table structure for x_role_node
-- ----------------------------
DROP TABLE IF EXISTS `x_role_node`;
CREATE TABLE `x_role_node` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色id',
  `node_id` int(10) unsigned NOT NULL,
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=994 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色和权限节点关联表';

-- ----------------------------
-- Records of x_role_node
-- ----------------------------
INSERT INTO `x_role_node` VALUES ('709', '5', '246', '1492516449');
INSERT INTO `x_role_node` VALUES ('710', '5', '247', '1492516449');
INSERT INTO `x_role_node` VALUES ('711', '5', '251', '1492516450');
INSERT INTO `x_role_node` VALUES ('712', '5', '257', '1492516450');
INSERT INTO `x_role_node` VALUES ('713', '5', '259', '1492516450');
INSERT INTO `x_role_node` VALUES ('714', '5', '260', '1492516450');
INSERT INTO `x_role_node` VALUES ('715', '5', '261', '1492516450');
INSERT INTO `x_role_node` VALUES ('716', '5', '262', '1492516450');
INSERT INTO `x_role_node` VALUES ('717', '5', '264', '1492516450');
INSERT INTO `x_role_node` VALUES ('718', '5', '265', '1492516450');
INSERT INTO `x_role_node` VALUES ('719', '5', '266', '1492516450');
INSERT INTO `x_role_node` VALUES ('720', '5', '267', '1492516450');
INSERT INTO `x_role_node` VALUES ('765', '4', '240', '1493363228');
INSERT INTO `x_role_node` VALUES ('766', '4', '241', '1493363228');
INSERT INTO `x_role_node` VALUES ('767', '4', '243', '1493363228');
INSERT INTO `x_role_node` VALUES ('768', '4', '244', '1493363228');
INSERT INTO `x_role_node` VALUES ('769', '4', '246', '1493363228');
INSERT INTO `x_role_node` VALUES ('770', '4', '247', '1493363229');
INSERT INTO `x_role_node` VALUES ('771', '4', '251', '1493363229');
INSERT INTO `x_role_node` VALUES ('772', '4', '253', '1493363229');
INSERT INTO `x_role_node` VALUES ('773', '4', '254', '1493363229');
INSERT INTO `x_role_node` VALUES ('774', '4', '255', '1493363229');
INSERT INTO `x_role_node` VALUES ('775', '4', '271', '1493363229');
INSERT INTO `x_role_node` VALUES ('776', '4', '257', '1493363229');
INSERT INTO `x_role_node` VALUES ('777', '4', '260', '1493363229');
INSERT INTO `x_role_node` VALUES ('778', '4', '259', '1493363229');
INSERT INTO `x_role_node` VALUES ('779', '4', '261', '1493363229');
INSERT INTO `x_role_node` VALUES ('780', '4', '262', '1493363229');
INSERT INTO `x_role_node` VALUES ('781', '4', '264', '1493363229');
INSERT INTO `x_role_node` VALUES ('782', '4', '265', '1493363229');
INSERT INTO `x_role_node` VALUES ('783', '4', '266', '1493363229');
INSERT INTO `x_role_node` VALUES ('784', '4', '267', '1493363229');
INSERT INTO `x_role_node` VALUES ('785', '4', '269', '1493363229');
INSERT INTO `x_role_node` VALUES ('786', '4', '270', '1493363229');
INSERT INTO `x_role_node` VALUES ('787', '4', '19', '1493363229');
INSERT INTO `x_role_node` VALUES ('788', '4', '22', '1493363229');
INSERT INTO `x_role_node` VALUES ('789', '4', '23', '1493363229');
INSERT INTO `x_role_node` VALUES ('790', '4', '227', '1493363229');
INSERT INTO `x_role_node` VALUES ('970', '1', '243', '1494553520');
INSERT INTO `x_role_node` VALUES ('971', '1', '244', '1494553520');
INSERT INTO `x_role_node` VALUES ('972', '1', '246', '1494553521');
INSERT INTO `x_role_node` VALUES ('973', '1', '247', '1494553521');
INSERT INTO `x_role_node` VALUES ('974', '1', '251', '1494553521');
INSERT INTO `x_role_node` VALUES ('975', '1', '253', '1494553521');
INSERT INTO `x_role_node` VALUES ('976', '1', '254', '1494553521');
INSERT INTO `x_role_node` VALUES ('977', '1', '274', '1494553521');
INSERT INTO `x_role_node` VALUES ('978', '1', '255', '1494553521');
INSERT INTO `x_role_node` VALUES ('979', '1', '276', '1494553522');
INSERT INTO `x_role_node` VALUES ('980', '1', '257', '1494553522');
INSERT INTO `x_role_node` VALUES ('981', '1', '259', '1494553522');
INSERT INTO `x_role_node` VALUES ('982', '1', '260', '1494553522');
INSERT INTO `x_role_node` VALUES ('983', '1', '264', '1494553522');
INSERT INTO `x_role_node` VALUES ('984', '1', '265', '1494553522');
INSERT INTO `x_role_node` VALUES ('985', '1', '266', '1494553522');
INSERT INTO `x_role_node` VALUES ('986', '1', '267', '1494553522');
INSERT INTO `x_role_node` VALUES ('987', '1', '269', '1494553523');
INSERT INTO `x_role_node` VALUES ('988', '1', '273', '1494553523');
INSERT INTO `x_role_node` VALUES ('989', '1', '270', '1494553523');
INSERT INTO `x_role_node` VALUES ('990', '1', '19', '1494553524');
INSERT INTO `x_role_node` VALUES ('991', '1', '22', '1494553524');
INSERT INTO `x_role_node` VALUES ('992', '1', '23', '1494553524');
INSERT INTO `x_role_node` VALUES ('993', '1', '227', '1494553524');

-- ----------------------------
-- Table structure for x_staff
-- ----------------------------
DROP TABLE IF EXISTS `x_staff`;
CREATE TABLE `x_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工表id',
  `staff_id` int(11) NOT NULL COMMENT '员工id',
  `plate_id` int(11) NOT NULL COMMENT '部门id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_staff
-- ----------------------------

-- ----------------------------
-- Table structure for x_staff_arrangetime
-- ----------------------------
DROP TABLE IF EXISTS `x_staff_arrangetime`;
CREATE TABLE `x_staff_arrangetime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL COMMENT '员工id',
  `weektime` varchar(8) NOT NULL COMMENT '一周员工排班',
  `begintime` int(11) NOT NULL COMMENT '起始时间',
  `isAddtime` int(1) NOT NULL COMMENT '判断是否添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_staff_arrangetime
-- ----------------------------
INSERT INTO `x_staff_arrangetime` VALUES ('1', '1', '10111111', '1494259200', '1');
INSERT INTO `x_staff_arrangetime` VALUES ('2', '2', '11110111', '1494259200', '1');
INSERT INTO `x_staff_arrangetime` VALUES ('3', '3', '11101111', '1494259200', '1');
INSERT INTO `x_staff_arrangetime` VALUES ('4', '4', '11011111', '1494259200', '1');
INSERT INTO `x_staff_arrangetime` VALUES ('5', '7', '11111101', '1494259200', '1');
INSERT INTO `x_staff_arrangetime` VALUES ('6', '8', '11111011', '1494259200', '1');
INSERT INTO `x_staff_arrangetime` VALUES ('7', '1', '11111111', '1493568000', '1');
INSERT INTO `x_staff_arrangetime` VALUES ('8', '2', '10010111', '1493568000', '1');
INSERT INTO `x_staff_arrangetime` VALUES ('9', '3', '11011111', '1493568000', '1');
INSERT INTO `x_staff_arrangetime` VALUES ('10', '4', '11111101', '1493568000', '1');
INSERT INTO `x_staff_arrangetime` VALUES ('11', '7', '11111110', '1493568000', '1');
INSERT INTO `x_staff_arrangetime` VALUES ('12', '8', '11111011', '1493568000', '1');

-- ----------------------------
-- Table structure for x_staff_info
-- ----------------------------
DROP TABLE IF EXISTS `x_staff_info`;
CREATE TABLE `x_staff_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `staff_name` varchar(20) NOT NULL COMMENT '员工姓名',
  `staff_sex` int(2) NOT NULL COMMENT '员工性别',
  `staff_level` int(2) NOT NULL COMMENT '员工等级',
  `staff_phone` int(20) NOT NULL COMMENT '员工联系方式',
  `staff_area` varchar(255) NOT NULL COMMENT '员工居住地',
  `intime` int(11) NOT NULL COMMENT '入职时间',
  `outtime` int(11) NOT NULL COMMENT '离职时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_staff_info
-- ----------------------------
INSERT INTO `x_staff_info` VALUES ('1', '张三', '1', '1', '187', '湖州', '1231', '111');
INSERT INTO `x_staff_info` VALUES ('2', '莉莉', '2', '1', '321', '123', '123', '123');
INSERT INTO `x_staff_info` VALUES ('3', '老铁', '1', '2', '123', '123', '1', '1');
INSERT INTO `x_staff_info` VALUES ('4', 'boss', '2', '3', '213', '123', '1430236800', '1494432000');
INSERT INTO `x_staff_info` VALUES ('7', '李四', '1', '2', '123', '312', '1490457600', '1493481600');
INSERT INTO `x_staff_info` VALUES ('8', '王五', '1', '1', '741852', '火星', '1493568000', '0');

-- ----------------------------
-- Table structure for x_staff_weektime
-- ----------------------------
DROP TABLE IF EXISTS `x_staff_weektime`;
CREATE TABLE `x_staff_weektime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `begintime` int(11) NOT NULL COMMENT '工作开始时间',
  `setweektime` int(11) NOT NULL COMMENT '排班时间',
  `othernews` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_staff_weektime
-- ----------------------------
INSERT INTO `x_staff_weektime` VALUES ('1', '1493654400', '1494538564', '');
INSERT INTO `x_staff_weektime` VALUES ('2', '1493568000', '1494552380', '');
INSERT INTO `x_staff_weektime` VALUES ('3', '1494777600', '1494553141', '');
INSERT INTO `x_staff_weektime` VALUES ('4', '1493913600', '1494553187', '');
INSERT INTO `x_staff_weektime` VALUES ('5', '1494259200', '1494553265', '');
INSERT INTO `x_staff_weektime` VALUES ('6', '1493568000', '1494553757', '');

-- ----------------------------
-- Table structure for x_staff_worktime
-- ----------------------------
DROP TABLE IF EXISTS `x_staff_worktime`;
CREATE TABLE `x_staff_worktime` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) NOT NULL COMMENT '员工id',
  `onwork_time` int(11) NOT NULL COMMENT '上岗时间',
  `outwork_time` int(11) NOT NULL COMMENT '下岗时间',
  `working_time` int(11) NOT NULL COMMENT '工作时长',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_staff_worktime
-- ----------------------------

-- ----------------------------
-- Table structure for x_user
-- ----------------------------
DROP TABLE IF EXISTS `x_user`;
CREATE TABLE `x_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) DEFAULT NULL COMMENT '账号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `real_name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `phone` char(11) DEFAULT NULL COMMENT '手机号码',
  `add_time` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='审核人员';

-- ----------------------------
-- Records of x_user
-- ----------------------------
INSERT INTO `x_user` VALUES ('1', 'aaaa', 'e10adc3949ba59abbe56e057f20f883e', 'sssasd', '15613222321', '1532412311', '1');
INSERT INTO `x_user` VALUES ('2', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'asd', '123', '321', '2');

-- ----------------------------
-- Table structure for x_user_role
-- ----------------------------
DROP TABLE IF EXISTS `x_user_role`;
CREATE TABLE `x_user_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_id` int(11) DEFAULT NULL COMMENT '职务id',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='审核人员';

-- ----------------------------
-- Records of x_user_role
-- ----------------------------
INSERT INTO `x_user_role` VALUES ('1', '4', '1');
INSERT INTO `x_user_role` VALUES ('3', '1', '2');
INSERT INTO `x_user_role` VALUES ('4', '1', '1');

-- ----------------------------
-- Procedure structure for randuser_connection
-- ----------------------------
DROP PROCEDURE IF EXISTS `randuser_connection`;
DELIMITER ;;
CREATE DEFINER=`cpp`@`%` PROCEDURE `randuser_connection`(k int)
begin
  declare i int;
  set i=0;
  while i<k*5 do
     insert ignore into tbl_user_connection_t(self_id,friend_id,family,colleague,schoolmate,business) 
values(floor(rand()*50+1),floor(rand()*50+1),round(rand()),round(rand()),round(rand()),round(rand()));
      set i=i+1;
  end while;
  end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for test_multi_sets
-- ----------------------------
DROP PROCEDURE IF EXISTS `test_multi_sets`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `test_multi_sets`()
    DETERMINISTIC
begin
        select user() as first_col;
        select user() as first_col, now() as second_col;
        select user() as first_col, now() as second_col, now() as third_col;
        end
;;
DELIMITER ;
