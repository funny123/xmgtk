-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2018-07-20 10:05:57
-- 服务器版本： 5.5.57-log
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tp51_com`
--

-- --------------------------------------------------------

--
-- 表的结构 `xmg_admin`
--

CREATE TABLE IF NOT EXISTS `xmg_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT '用户名',
  `password` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '密码',
  `portrait` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '头像',
  `loginnum` int(11) DEFAULT '0' COMMENT '登陆次数',
  `last_login_ip` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '最后登录IP',
  `last_login_time` int(11) DEFAULT '0' COMMENT '最后登录时间',
  `real_name` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT '真实姓名',
  `status` int(1) DEFAULT '0' COMMENT '状态',
  `groupid` int(11) DEFAULT '1' COMMENT '用户角色id',
  `token` varchar(32) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `xmg_admin`
--

INSERT INTO `xmg_admin` (`id`, `username`, `password`, `portrait`, `loginnum`, `last_login_ip`, `last_login_time`, `real_name`, `status`, `groupid`, `token`) VALUES
(1, 'admin', '4297f44b13955235245b2497399d7a93', '20161122\\admin.jpg', 311, '112.20.118.145', 1531629090, 'admin', 1, 1, 'a52709b29f6840a1f91d6e1cd421e101'),
(13, 'test', 'c8837b23ff8aaa8a2dde915473ce0991', '20161122\\293c8cd05478b029a378ac4e5a880303.jpg', 2166, '113.87.163.243', 1503366101, 'test', 1, 4, '4ee2e395e9921f515d00599a5f79ae3f');

-- --------------------------------------------------------

--
-- 表的结构 `xmg_auth_group`
--

CREATE TABLE IF NOT EXISTS `xmg_auth_group` (
  `id` mediumint(8) unsigned NOT NULL,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` text NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xmg_auth_group`
--

INSERT INTO `xmg_auth_group` (`id`, `title`, `status`, `rules`, `create_time`, `update_time`) VALUES
(1, '超级管理员', 1, '', 1446535750, 1446535750),
(4, '系统测试员', 1, '1,2,9,3,30,4,39,61,62,5,6,7,27,29,13,14,22,24,25,40,41,43,26,44,45,47,48,49,50,51,52,53,54,55,56,57,58,70,71,72,73,74,80,75,76,77,79', 1446535750, 1521601507);

-- --------------------------------------------------------

--
-- 表的结构 `xmg_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `xmg_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xmg_auth_group_access`
--

INSERT INTO `xmg_auth_group_access` (`uid`, `group_id`) VALUES
(1, 1),
(13, 4),
(21, 4),
(22, 4),
(23, 4),
(24, 4),
(25, 4),
(26, 4);

-- --------------------------------------------------------

--
-- 表的结构 `xmg_auth_rule`
--

CREATE TABLE IF NOT EXISTS `xmg_auth_rule` (
  `id` int(11) unsigned NOT NULL,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `css` varchar(20) NOT NULL COMMENT '样式',
  `condition` char(100) NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父栏目ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xmg_auth_rule`
--

INSERT INTO `xmg_auth_rule` (`id`, `name`, `title`, `type`, `status`, `css`, `condition`, `pid`, `sort`, `create_time`, `update_time`) VALUES
(1, '#', '系统管理', 1, 1, 'fa fa-gear', '', 0, 1, 1446535750, 1477312169),
(2, 'admin/user/index', '用户管理', 1, 1, '', '', 1, 10, 1446535750, 1477312169),
(3, 'admin/role/index', '角色管理', 1, 1, '', '', 1, 20, 1446535750, 1477312169),
(4, 'admin/menu/index', '菜单管理', 1, 1, '', '', 1, 30, 1446535750, 1477312169),
(5, '#', '数据库管理', 1, 1, 'fa fa-database', '', 0, 2, 1446535750, 1477312169),
(6, 'admin/data/index', '数据库备份', 1, 1, '', '', 5, 50, 1446535750, 1477312169),
(7, 'admin/data/optimize', '优化表', 1, 1, '', '', 6, 50, 1477312169, 1477312169),
(8, 'admin/data/repair', '修复表', 1, 1, '', '', 6, 50, 1477312169, 1477312169),
(9, 'admin/user/useradd', '添加用户', 1, 1, '', '', 2, 50, 1477312169, 1477312169),
(10, 'admin/user/useredit', '编辑用户', 1, 1, '', '', 2, 50, 1477312169, 1477312169),
(11, 'admin/user/userdel', '删除用户', 1, 1, '', '', 2, 50, 1477312169, 1477312169),
(12, 'admin/user/user_state', '用户状态', 1, 1, '', '', 2, 20, 1477312169, 1477312169),
(13, '#', '日志管理', 1, 1, 'fa fa-tasks', '', 0, 6, 1477312169, 1477312169),
(14, 'admin/log/operate_log', '行为日志', 1, 1, '', '', 13, 50, 1477312169, 1477312169),
(22, 'admin/log/del_log', '删除日志', 1, 1, '', '', 14, 50, 1477312169, 1477316778),
(24, '#', '文章管理', 1, 1, 'fa fa-paste', '', 0, 4, 1477312169, 1477312169),
(25, 'admin/article/index_cate', '文章分类', 1, 1, '', '', 24, 10, 1477312260, 1477312260),
(26, 'admin/article/index', '文章列表', 1, 1, '', '', 24, 20, 1477312333, 1477312333),
(27, 'admin/data/import', '数据库还原', 1, 1, '', '', 5, 50, 1477639870, 1477639870),
(28, 'admin/data/revert', '还原', 1, 1, '', '', 27, 50, 1477639972, 1477639972),
(29, 'admin/data/del', '删除', 1, 1, '', '', 27, 50, 1477640011, 1477640011),
(30, 'admin/role/roleAdd', '添加角色', 1, 1, '', '', 3, 50, 1477640011, 1477640011),
(31, 'admin/role/roleEdit', '编辑角色', 1, 1, '', '', 3, 50, 1477640011, 1477640011),
(32, 'admin/role/roleDel', '删除角色', 1, 1, '', '', 3, 50, 1477640011, 1477640011),
(33, 'admin/role/role_state', '角色状态', 1, 1, '', '', 3, 50, 1477640011, 1477640011),
(34, 'admin/role/giveAccess', '权限分配', 1, 1, '', '', 3, 50, 1477640011, 1477640011),
(35, 'admin/menu/add_rule', '添加菜单', 1, 1, '', '', 4, 50, 1477640011, 1477640011),
(36, 'admin/menu/edit_rule', '编辑菜单', 1, 1, '', '', 4, 50, 1477640011, 1477640011),
(37, 'admin/menu/del_rule', '删除菜单', 1, 1, '', '', 4, 50, 1477640011, 1477640011),
(38, 'admin/menu/rule_state', '菜单状态', 1, 1, '', '', 4, 50, 1477640011, 1477640011),
(39, 'admin/menu/ruleorder', '菜单排序', 1, 1, '', '', 4, 50, 1477640011, 1477640011),
(40, 'admin/article/add_cate', '添加分类', 1, 1, '', '', 25, 50, 1477640011, 1477640011),
(41, 'admin/article/edit_cate', '编辑分类', 1, 1, '', '', 25, 50, 1477640011, 1477640011),
(42, 'admin/article/del_cate', '删除分类', 1, 1, '', '', 25, 50, 1477640011, 1477640011),
(43, 'admin/article/cate_state', '分类状态', 1, 1, '', '', 25, 50, 1477640011, 1477640011),
(44, 'admin/article/add_article', '添加文章', 1, 1, '', '', 26, 50, 1477640011, 1477640011),
(45, 'admin/article/edit_article', '编辑文章', 1, 1, '', '', 26, 50, 1477640011, 1477640011),
(46, 'admin/article/del_article', '删除文章', 1, 1, '', '', 26, 50, 1477640011, 1477640011),
(47, 'admin/article/article_state', '文章状态', 1, 1, '', '', 26, 50, 1477640011, 1477640011),
(48, '#', '广告管理', 1, 1, 'fa fa-image', '', 0, 5, 1477640011, 1477640011),
(49, 'admin/ad/index_position', '广告位', 1, 1, '', '', 48, 10, 1477640011, 1477640011),
(50, 'admin/ad/add_position', '添加广告位', 1, 1, '', '', 49, 50, 1477640011, 1477640011),
(51, 'admin/ad/edit_position', '编辑广告位', 1, 1, '', '', 49, 50, 1477640011, 1477640011),
(52, 'admin/ad/del_position', '删除广告位', 1, 1, '', '', 49, 50, 1477640011, 1477640011),
(53, 'admin/ad/position_state', '广告位状态', 1, 1, '', '', 49, 50, 1477640011, 1477640011),
(54, 'admin/ad/index', '广告列表', 1, 1, '', '', 48, 20, 1477640011, 1477640011),
(55, 'admin/ad/add_ad', '添加广告', 1, 1, '', '', 54, 50, 1477640011, 1477640011),
(56, 'admin/ad/edit_ad', '编辑广告', 1, 1, '', '', 54, 50, 1477640011, 1477640011),
(57, 'admin/ad/del_ad', '删除广告', 1, 1, '', '', 54, 50, 1477640011, 1477640011),
(58, 'admin/ad/ad_state', '广告状态', 1, 1, '', '', 54, 50, 1477640011, 1477640011),
(61, 'admin/config/index', '配置管理', 1, 1, '', '', 1, 50, 1479908607, 1479908607),
(62, 'admin/config/index', '配置列表', 1, 1, '', '', 61, 50, 1479908607, 1487943813),
(63, 'admin/config/save', '保存配置', 1, 1, '', '', 61, 50, 1479908607, 1487943831),
(70, '#', '会员管理', 1, 1, 'fa fa-users', '', 0, 3, 1484103066, 1484103066),
(72, 'admin/member/add_group', '添加会员组', 1, 1, '', '', 71, 50, 1484103304, 1484103304),
(71, 'admin/member/group', '会员组', 1, 1, '', '', 70, 10, 1484103304, 1484103304),
(73, 'admin/member/edit_group', '编辑会员组', 1, 1, '', '', 71, 50, 1484103304, 1484103304),
(74, 'admin/member/del_group', '删除会员组', 1, 1, '', '', 71, 50, 1484103304, 1484103304),
(75, 'admin/member/index', '会员列表', 1, 1, '', '', 70, 20, 1484103304, 1484103304),
(76, 'admin/member/add_member', '添加会员', 1, 1, '', '', 75, 50, 1484103304, 1484103304),
(77, 'admin/member/edit_member', '编辑会员', 1, 1, '', '', 75, 50, 1484103304, 1484103304),
(78, 'admin/member/del_member', '删除会员', 1, 1, '', '', 75, 50, 1484103304, 1484103304),
(79, 'admin/member/member_status', '会员状态', 1, 1, '', '', 75, 50, 1484103304, 1487937671),
(80, 'admin/member/group_status', '会员组状态', 1, 1, '', '', 71, 50, 1484103304, 1484103304),
(83, '#', '货币管理', 1, 1, 'fa fa-cny', '', 0, 50, 1521695291, 1521708770),
(84, 'admin/money/adjustment', '价格调整', 1, 1, '', '', 83, 50, 1521695585, 1521695585),
(85, 'admin/money/history', '历史价格', 1, 1, '', '', 83, 50, 1521696421, 1521696421),
(86, 'admin/money/money', '货币创建', 1, 1, '', '', 83, 50, 1521708735, 1521708802),
(87, '#', '矿机管理', 1, 1, 'fa fa-server', '', 0, 2, 1521768710, 1521768710),
(88, 'admin/mills/index', '矿机列表', 1, 1, '', '', 87, 50, 1521768742, 1521768742),
(89, 'admin/mills/add_mills', '矿机添加', 1, 1, '', '', 88, 50, 1521768790, 1521768790),
(90, 'admin/mills/edit_mills', '矿机修改', 1, 1, '', '', 88, 50, 1521768819, 1521768819),
(91, 'admin/mills/del_mills', '矿机删除', 1, 1, '', '', 88, 50, 1521768847, 1521768847),
(92, 'admin/mills/index_cate', '矿机分类', 1, 1, '', '', 87, 50, 1521783419, 1521783419),
(93, '#', '订单管理', 1, 1, 'fa fa-file-text', '', 0, 6, 1522114703, 1522114703),
(94, 'admin/order/index', '订单列表', 1, 1, '', '', 93, 50, 1522114777, 1522114777),
(95, 'admin/order/paying', '交易中', 1, 1, '', '', 93, 50, 1522114821, 1522114821),
(96, 'admin/order/sell', '出售订单', 1, 1, '', '', 93, 50, 1522114862, 1522114862),
(97, 'admin/order/buy', '购买订单', 1, 1, '', '', 93, 50, 1522114885, 1522114885),
(99, '#', '实名认证', 1, 1, 'fa fa-card', '', 0, 3, 1522121372, 1522227169),
(100, 'admin/authentication/stay', '待认证', 1, 1, '', '', 99, 50, 1522121735, 1522121735),
(101, 'admin/authentication/already', '已认证', 1, 1, '', '', 99, 50, 1522121789, 1522140203),
(102, 'admin/authentication/auth_error', '认证失败', 1, 1, '', '', 99, 50, 1522121829, 1522140753),
(103, '#', '代理管理', 1, 1, 'fa fa-sitemap', '', 0, 50, 1522141103, 1522141103),
(104, 'admin/agent/agent', '代理设置', 1, 1, '', '', 103, 50, 1522141166, 1522143495),
(105, 'admin/log/error_log', '错误日志', 1, 1, '', '', 13, 50, 1522226792, 1522226792),
(106, '#', '优惠券管理', 1, 1, 'fa fa-certificate', '', 0, 0, 1527472360, 1527472856),
(107, 'admin/coupon/index', '优惠券列表', 1, 1, 'fa fa-car', '', 106, 50, 1527472936, 1527473160),
(108, 'admin/coupon/dumpxls', '导入优惠券', 1, 1, 'fa fa-user', '', 106, 50, 1527510268, 1527510268);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `xmg_admin`
--
ALTER TABLE `xmg_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xmg_auth_group`
--
ALTER TABLE `xmg_auth_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xmg_auth_group_access`
--
ALTER TABLE `xmg_auth_group_access`
  ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `xmg_auth_rule`
--
ALTER TABLE `xmg_auth_rule`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `xmg_admin`
--
ALTER TABLE `xmg_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `xmg_auth_group`
--
ALTER TABLE `xmg_auth_group`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `xmg_auth_rule`
--
ALTER TABLE `xmg_auth_rule`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=109;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
