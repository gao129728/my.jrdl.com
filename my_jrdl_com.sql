/*
Navicat MySQL Data Transfer

Source Server         : 本地链接
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : my_jrql_com

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2022-04-22 16:09:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `core_ad`
-- ----------------------------
DROP TABLE IF EXISTS `core_ad`;
CREATE TABLE `core_ad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL,
  `ad_position_id` int(10) DEFAULT NULL COMMENT '广告位',
  `url` varchar(128) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `closed` tinyint(1) DEFAULT '0',
  `orderby` int(11) DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_ad
-- ----------------------------
INSERT INTO `core_ad` VALUES ('77', '首页banner1', '1', '', '20220421/12dcdd8b2b627df2257b7168b0b2f8a5.jpg', '1', '0', '10');
INSERT INTO `core_ad` VALUES ('78', '首页banner2', '1', '', '20220421/6b13ad7f0737631081c7fe24b5a8e881.jpg', '1', '0', '20');
INSERT INTO `core_ad` VALUES ('79', '首页banner3', '1', '', '20220421/d2233ae0c8f690db8e843c765f532a49.jpg', '1', '0', '30');
INSERT INTO `core_ad` VALUES ('80', 'sitemap_banner', '28', '', '20220422/d2001fc8b58aa0800e7255d888661c95.jpg', '1', '0', '40');

-- ----------------------------
-- Table structure for `core_add_field`
-- ----------------------------
DROP TABLE IF EXISTS `core_add_field`;
CREATE TABLE `core_add_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `style` tinyint(11) DEFAULT '1',
  `value` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of core_add_field
-- ----------------------------
INSERT INTO `core_add_field` VALUES ('1', '外链', '1', 'website');
INSERT INTO `core_add_field` VALUES ('23', '成立年份', '1', 'dataone');
INSERT INTO `core_add_field` VALUES ('24', '上市时间', '1', 'datatwo');
INSERT INTO `core_add_field` VALUES ('25', '污水厂数量', '1', 'datathree');
INSERT INTO `core_add_field` VALUES ('26', '日处理量', '1', 'datafour');
INSERT INTO `core_add_field` VALUES ('27', '下载地址', '1', 'download_url');
INSERT INTO `core_add_field` VALUES ('28', '提取码', '1', 'get_code');

-- ----------------------------
-- Table structure for `core_admin`
-- ----------------------------
DROP TABLE IF EXISTS `core_admin`;
CREATE TABLE `core_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT '用户名',
  `password` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '密码',
  `portrait` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '头像',
  `loginnum` int(11) DEFAULT '0' COMMENT '登陆次数',
  `last_login_ip` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '最后登录IP',
  `last_login_time` int(11) DEFAULT '0' COMMENT '最后登录时间',
  `real_name` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT '真实姓名',
  `status` int(1) DEFAULT '0' COMMENT '状态',
  `groupid` int(11) DEFAULT '1' COMMENT '用户角色id',
  `token` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of core_admin
-- ----------------------------
INSERT INTO `core_admin` VALUES ('1', 'admin', 'e73c461eb3da024a3389c0e65c5b3769', '20161122\\admin.jpg', '297', '127.0.0.1', '1550199922', 'admin', '1', '1', 'cfcd208495d565ef66e7dff9f98764da');
INSERT INTO `core_admin` VALUES ('9', 'xiaomei', '218dbb225911693af03a713581a7227f', '20161122\\ab9f9c492871857e1a6c5bc1c658ef7f.jpg', '20', '127.0.0.1', '1501321632', '田建龙', '1', '2', 'e96ed478dab8595a7dbda4cbcbee168f');

-- ----------------------------
-- Table structure for `core_ad_position`
-- ----------------------------
DROP TABLE IF EXISTS `core_ad_position`;
CREATE TABLE `core_ad_position` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '分类名称',
  `orderby` int(11) DEFAULT '100' COMMENT '排序',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_ad_position
-- ----------------------------
INSERT INTO `core_ad_position` VALUES ('1', '首页轮播', '1', '1477140627', '1518228789', '1');
INSERT INTO `core_ad_position` VALUES ('25', '内页banner', '11', '1530499756', '1530499756', '1');
INSERT INTO `core_ad_position` VALUES ('26', '手机banner', '30', '1629185802', '1629185802', '1');
INSERT INTO `core_ad_position` VALUES ('27', '手机内页banner', '40', '1629186269', '1629186269', '1');
INSERT INTO `core_ad_position` VALUES ('28', '网站地图banner', '40', '1650598796', '1650598796', '1');

-- ----------------------------
-- Table structure for `core_article`
-- ----------------------------
DROP TABLE IF EXISTS `core_article`;
CREATE TABLE `core_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章逻辑ID',
  `sortnum` int(10) DEFAULT NULL,
  `title` varchar(128) NOT NULL COMMENT '文章标题',
  `admin_id` int(11) DEFAULT '0',
  `website` varchar(200) DEFAULT NULL,
  `cate_id` int(11) NOT NULL DEFAULT '1' COMMENT '文章类别',
  `photo` varchar(200) DEFAULT '' COMMENT '文章图片',
  `video` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `bigpic` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `annex` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_title` varchar(200) DEFAULT '' COMMENT '文章描述',
  `keyword` varchar(200) DEFAULT '' COMMENT '文章关键字',
  `description` text,
  `intro` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `content` text NOT NULL COMMENT '文章内容',
  `views` int(11) NOT NULL DEFAULT '1' COMMENT '浏览量',
  `attribute_ids` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `isTop` int(1) DEFAULT '0' COMMENT '是否推荐',
  `writer` varchar(200) DEFAULT NULL COMMENT '作者',
  `source` varchar(200) DEFAULT NULL,
  `ip` varchar(16) NOT NULL,
  `create_time` int(11) NOT NULL,
  `updata_time` int(11) DEFAULT NULL,
  `dataone` varchar(200) DEFAULT NULL,
  `datatwo` varchar(200) DEFAULT NULL,
  `datathree` varchar(200) DEFAULT NULL,
  `area` varchar(200) DEFAULT NULL,
  `download_url` varchar(200) DEFAULT NULL,
  `get_code` varchar(200) DEFAULT NULL,
  `datafour` varchar(200) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `a_title` (`title`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of core_article
-- ----------------------------
INSERT INTO `core_article` VALUES ('1', '10', '公司简介', '0', null, '12', '20220421/b909ba3d4cf8c2809e852e91bd6aba25.jpg', null, null, null, '', '', '', '<p>中节能国祯环保科技股份有限公司创建于1997年，2014年在深交所上市（SZ300388），提供环保领域的项目投资、科技研发、设计建造、设备制造与集成及项目运营服务。</p><p>公司着力布局<strong>水环境综合治理、市政污水、村镇水环境综合整治及工业水系统综合服务等领域。</strong></p>', '<h2>about us</h2><h3>中节能国祯环保科技股份有限公司</h3><p>中节能国祯环保科技股份有限公司创建于1997年，2014年在深交所创业板上市（股票代码：300388），2020年12月中国节能环保集团有限公司成为公司第一大股东。</p><p><br/></p><p>公司长期致力于水资源的综合利用和开发，服务区域遍及国内二十余个省市自治区直辖市。公司已建立和拥有完备的产业链优势，为客户提供环保领域的项目投资、科技研发、设计建造、设备制造与集成及项目运营服务。近年来，公司着力布局水环境综合治理、市政污水、村镇水环境综合整治及工业水系统综合服务。公司将秉承“让天更蓝、山更绿、水更清，让生活更美好”的使命，为人类创造清洁美丽、良好和谐的生活环境。</p><p><br/></p><p>Founded in 1997, CECEP Guozhen Environmental Protection Technology Co., Ltd.&nbsp;became a listed company in Shenzhen Stock Exchange Market in 2014(Stock Code: 300388). Its services cover engineering design, project contracting, equipment R&amp;D, O&amp;M as well as project financing.</p><p><br/></p><p>CECEPGZ has established a complete industrial chain capable of providing its customers with a full-cycle municipal and industrial wastewater treatment solutions such comprehensive treatment of water environment, municipal sewage, comprehensive treatment of water environment in villages and towns, and comprehensive services of industrial water system, etc.</p><p><br/></p><p>Add.:14-16 Floor, Zhongxin Wang&#39;an Building, 2688 Chuangxin Rd. , Hefei High-tech Zone, Anhui Province, P.R. of China</p><p><br/></p><p><span style=\"color:#003399;font-size:24px;\"><strong>数字中节能国祯</strong></span></p><p><span style=\"font-size:24px;line-height:2;\">1997</span><span style=\"font-size: 14px; line-height: 2;\">2014年8月成立于1997年，深根环保行业20多年深交所上市</span></p><p><span style=\"font-size:24px;line-height:2;\">TOP 40</span><span style=\"line-height:2;\">&nbsp;</span><span style=\"font-size: 14px; line-height: 2;\">—— 六次荣获中国水业十大影响力企业<sup>②</sup></span></p><p><span style=\"font-size:18px;line-height:2;\">150</span><span style=\"line-height:2;\">&nbsp;</span><span style=\"font-size: 14px; line-height: 2;\">—— 公司运营市政污水厂511万吨/日</span></p><p><span style=\"font-size:24px;line-height:2;\">20</span><span style=\"line-height:2;\">&nbsp;</span><span style=\"font-size:14px;font-family:\"></span></p><p><span style=\"color:#494949;font-size:11pt;font-family:\">数据出处为英国传媒分析有限公司旗下的GWI (Global Water Intelligence)公司2016年1月《水务年鉴》</span></p><p><span style=\"color:#494949;font-size:11pt;font-family:\"><span style=\"font-size:14px;font-family:\"><span style=\"color: rgb(68, 68, 68); font-family: \">注②：</span>由E20环境平台颁发，分别于2003年、2004年、2005年、2010年、2019年和2020年获得</span></span></p><p><span style=\"color:#494949;font-size:11pt;font-family:\"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></p><p><span style=\"font-size:14px;font-family:\"></span></p><p><span style=\"font-size:24px;\"><strong><span style=\"color:#003399;\">360°全景展示办公环境</span>&nbsp;<span style=\"font-size:24px;\">&nbsp;</span></strong></span><a href=\"https://www.expoon.com/e/j5japzd7v9p/panorama?from=singlemessage&isappinstalled=0\" target=\"_blank\"><span style=\"font-size:24px;\">点击查看&gt;&gt;</span></a></p>', '0', '', '1', '0', '', '', '127.0.0.1', '1650510571', null, '1997', '2014', '150', null, null, null, '511', null);
INSERT INTO `core_article` VALUES ('2', '10', '麦王环境', '0', 'http://www.mcwongtech.com/', '13', '20220421/0f5342a9456f7c0d7902305bae9afbed.jpg', null, null, null, '', '', '', null, '<p>中节能国祯控股公司麦王环境技术股份有限公司在工业水系统、工业园区污水处理及再生利用、能源利用、土壤修复、...</p>', '0', '', '1', '0', '', '', '127.0.0.1', '1650520630', null, null, null, null, null, null, null, null, null);
INSERT INTO `core_article` VALUES ('3', '20', 'Biovac', '0', '', '13', '20220421/e3f994b6b9d44145ede89182ed55e5e7.jpg', null, null, null, '', '', '', null, '<p>中节能国祯在挪威的全资子公司，主要从事为私人住宅、集中式住宅等提供污水和灰水处理系统、饮用水处理系...</p>', '1', '', '1', '0', '', '', '127.0.0.1', '1650520945', null, null, null, null, null, null, null, null, null);
INSERT INTO `core_article` VALUES ('4', '30', '国祯膜科技', '0', 'http://www.gzep-membrane.com/', '13', '20220421/391898ba46099068b6ac7230aff7df97.jpg', null, null, null, '', '', '', null, '<p>中节能国祯在挪威的全资子公司，主要从事为私人住宅、集中式住宅等提供污水和灰水处理系统、饮用水处理系...</p>', '0', '', '1', '0', '', '', '127.0.0.1', '1650521070', null, null, null, null, null, null, null, null, null);
INSERT INTO `core_article` VALUES ('5', '40', '国祯环境修复', '0', '', '13', '20220421/72a252fafcf0982de5c6e90c4573e62a.jpg', null, null, null, '', '', '', null, '<p>中节能国祯在挪威的全资子公司，主要从事为私人住宅、集中式住宅等提供污水和灰水处理系统、饮用水处理系...</p>', '0', '', '1', '0', '', '', '127.0.0.1', '1650521091', null, null, null, null, null, null, null, null, null);
INSERT INTO `core_article` VALUES ('6', '10', '视频1', '0', null, '38', '20220421/3ddb961cc9309a78ab935c72c9949d7e.jpg', null, null, null, '', '', '', null, '', '6', '', '1', '0', '', '', '127.0.0.1', '1650521842', null, null, null, null, null, null, null, null, null);
INSERT INTO `core_article` VALUES ('7', '10', '宣传片', '0', null, '37', '20220421/6566870a4ce3960f39acf20cf1790575.jpg', null, null, '2022-04/165052217086734200.mp4', '', '', '', null, '', '0', '', '1', '0', '', '', '127.0.0.1', '1650522106', null, null, null, null, null, 'https://pan.baidu.com/s/1xJ7MpwoHJ1KM-fLKTjt9cg?pwd=3xum', '3xum', null, null);
INSERT INTO `core_article` VALUES ('8', '10', '企业资质', '0', null, '15', '', null, null, null, '', '', '', null, '<p><strong><span style=\"font-size:16px;\">设计资质</span></strong><span style=\"font-size:16px;\">工程设计单位环境工程甲级、市政行业乙级、工程咨询单位乙级</span></p><p><strong><span style=\"font-size:16px;\">建筑资质</span></strong><span style=\"font-size:16px;\">环境工程专业承包壹级、市政总承包贰级、机电总承包壹级、机电安装专业承包贰级、水利水电工程施工总承包叁级</span></p><p><strong><span style=\"font-size:16px;\">运营资质</span></strong><span style=\"font-size:16px;\">生活污水处理一级、工业废水处理一级</span></p><p style=\"font-family:Arial;font-weight:bold;\"><span style=\"font-size:16px;\">Design Qualification:</span></p><p style=\"font-family:Arial;\"><span style=\"font-size:16px;\">Engineering certificate for environmental project grade 1 and municipal drainage project grade 2、project consulting certificate grade 2</span></p><p style=\"font-family:Arial;font-weight:bold;\"><span style=\"font-size:16px;\">Construction Qualification:</span></p><p style=\"font-family:Arial;\"><span style=\"font-size:16px;\">Contracting certificate of environmental protection project grade 1</span></p><p style=\"font-family:Arial;\"><span style=\"font-size:16px;\">General contracting certificate of municipal construction grade 2</span></p><p style=\"font-family:Arial;\"><span style=\"font-size:16px;\">General contracting certificate of mechanical &amp; electrical engineering grade 1</span></p><p style=\"font-family:Arial;\"><span style=\"font-size:16px;\">Contracting certificate of mechanical &amp; electrical equipment installation for construction grade 2</span></p><p style=\"font-family:Arial;\"><span style=\"font-size:16px;\">General contracting certificate of water conservancy and hydropower project grade 3</span></p><p style=\"font-family:Arial;font-weight:bold;\"><span style=\"font-size:16px;\">O&amp;M Qualification:</span></p><p style=\"font-family:Arial;\"><span style=\"font-size:16px;\">Sewage treatment grade 1</span></p><p style=\"font-family: Arial;\"><span style=\"font-size:16px;\">Industrial wastewater treatment grade 1</span></p><p style=\"font-family: Arial;\"><span style=\"font-size:16px;\"><br/></span></p><p style=\"font-family: Arial;\"><span style=\"font-size:16px;\"><br/></span></p><p style=\"font-family: Arial;\"><span style=\"font-size:16px;\"><br/></span></p>', '0', '', '1', '0', '', '', '127.0.0.1', '1650522821', null, null, null, null, null, null, null, null, null);
INSERT INTO `core_article` VALUES ('9', '10', '企业荣誉', '0', null, '16', '20220421/d6a8e7a762586eeadf14fc1b35ea53ff.png', null, null, null, '', '', '', null, '<p>承担国家水专项十二五课题<strong>1</strong>项</p><p>主持和参加国家863计划课题<strong>4</strong>项</p><p>参加国家科技支撑计划课题<strong>2</strong>项</p><p><span style=\"white-space:normal;\">主持和参加编制了34项国家、行业、地方标准，其中国家标准4项</span></p><p>2009年、2012年、2020年<strong>3次</strong>获得国家科技进步二等奖</p><p>国家级高新技术企业</p><p>公司拥有在权国家专利<strong>98</strong>项，其中发明专利<strong>43</strong>项；拥有软件著作权<strong>14</strong>项</p><p>注：以上数据截止到2021年12月31日</p><p><br/></p>', '0', '', '1', '0', '', '', '127.0.0.1', '1650522947', null, null, null, null, null, null, null, null, null);
INSERT INTO `core_article` VALUES ('10', '10', '111', '0', null, '39', '20220421/b981568a5f33d5752c38494999c69a23.jpg', null, null, null, '', '', '', null, '<p>111</p><p><br/></p>', '11', '', '1', '1', '', '', '127.0.0.1', '1650523713', null, null, null, null, null, null, null, null, null);
INSERT INTO `core_article` VALUES ('11', '20', '222', '0', null, '39', '20220422/4851556cf6cae2fa96977c5ca9ca7ddf.jpg', null, null, null, '', '', '', null, '<p>222</p>', '5', '', '1', '0', '', '', '127.0.0.1', '1650523732', null, null, null, null, null, null, null, null, null);
INSERT INTO `core_article` VALUES ('12', '10', '安徽省合肥胡大郢净水厂', '0', null, '17', '20220421/0df5e7649173cf9a35e5f782fb12382e.jpg', null, null, null, '', '', '', '<p>项目位于徐州市南郊姚庄，占地215.9亩，采用AAO工艺，服务范围为徐州老城区奎河、故黄河排水区，1994年12月投入运行，是淮河流域建成的大型城市污水处理厂。</p>', '<p>111</p>', '1', '', '1', '0', '', '', '127.0.0.1', '1650526559', null, null, null, null, '28', null, null, null, '17');
INSERT INTO `core_article` VALUES ('13', '10', '111', '0', null, '23', '', null, null, null, '', '', '', null, '<p>111</p>', '1', '', '1', '0', '', '', '127.0.0.1', '1650529987', null, null, null, null, null, null, null, null, null);
INSERT INTO `core_article` VALUES ('14', '10', '111', '0', null, '40', '20220421/d704ec4ee6b494284181e6ad13abb284.jpg', null, null, null, '', '', '', null, '<p>111</p>', '7', '', '1', '0', '', '', '127.0.0.1', '1650530335', null, null, null, null, null, null, null, null, null);
INSERT INTO `core_article` VALUES ('15', '10', '1', '0', null, '30', '20220421/a4c883699a47b91911d2c692332b54bc.jpg', null, null, null, '', '', '', null, '', '0', '', '1', '0', '', '', '127.0.0.1', '1650531279', null, null, null, null, null, null, null, null, null);
INSERT INTO `core_article` VALUES ('16', '20', '2', '0', null, '30', '20220421/5c7818d9a922b798d26b370fe8338902.jpg', null, null, null, '', '', '', null, '', '0', '', '1', '0', '', '', '127.0.0.1', '1650531285', null, null, null, null, null, null, null, null, null);
INSERT INTO `core_article` VALUES ('17', '30', '3', '0', null, '30', '20220421/8dfcc9cb28829dfc5425359248ff5a02.jpg', null, null, null, '', '', '', null, '', '0', '', '1', '0', '', '', '127.0.0.1', '1650531290', null, null, null, null, null, null, null, null, null);
INSERT INTO `core_article` VALUES ('18', '10', '1', '0', null, '31', '20220421/153aa03e8f63dcbb2c70b526078c3d8d.jpg', null, null, null, '', '', '', null, '', '1', '', '1', '0', '', '', '127.0.0.1', '1650531507', null, null, null, null, null, null, null, null, null);
INSERT INTO `core_article` VALUES ('19', '10', '1', '0', null, '32', '20220421/246b259012c2623919a804a51673be5b.jpg', null, null, null, '', '', '', null, '', '0', '', '1', '0', '', '', '127.0.0.1', '1650531576', null, null, null, null, null, null, null, null, null);
INSERT INTO `core_article` VALUES ('20', '10', '11', '0', null, '33', '20220421/35eeb82a0a24b0e22604d8778b26abb8.jpg', null, null, null, '', '', '', null, '', '2', '', '1', '0', '', '', '127.0.0.1', '1650531908', null, null, null, null, null, null, null, null, null);
INSERT INTO `core_article` VALUES ('21', '10', '福利待遇', '0', null, '35', '', null, null, null, '', '', '', null, '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><span style=\"transition: all 0.5s ease 0s; font-size: 24px;\">薪资</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">●<strong>岗位工资</strong>&nbsp;根据所在岗位设定对应的有竞争力的岗位工资&nbsp;&nbsp; ●<strong>绩效工资</strong>&nbsp;根据工作完成情况享受绩效奖金&nbsp;&nbsp; ●<strong>奖励工资</strong>&nbsp;特别贡献、重大项目专属奖金</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><span style=\"transition: all 0.5s ease 0s; font-size: 24px;\">基础保障</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><strong>●五险一金&nbsp;</strong>养老、医疗、工伤、失业、生育、住房公积金&nbsp; &nbsp; ●<strong>午餐补贴</strong>&nbsp;工作日享受专属午餐补贴&nbsp;&nbsp;&nbsp; ●<strong>差旅补贴</strong>&nbsp;对需要经常出差的岗位，公司会提供出差补贴及误餐补贴</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">●<strong>通讯补贴</strong>&nbsp;员工定岗后，公司将依据岗位给予一定额度的通讯补贴&nbsp; &nbsp; ●<strong>带薪年假</strong>&nbsp;公司鼓励入职满一年员工带薪休假</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><span style=\"transition: all 0.5s ease 0s; font-size: 24px;\">其他补贴</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">●<strong>节日红包</strong>&nbsp;端午节、中秋节、春节享受节日红包&nbsp;&nbsp;&nbsp; ●<strong>生日红包</strong>&nbsp;在属于你的日子里享受生日红包&nbsp;&nbsp;&nbsp; ●<strong>婚育红包</strong>&nbsp;结婚or生娃？红包当然也少不了&nbsp;&nbsp;&nbsp; ●加班调休 工作生活双平衡</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">●<strong>住院补贴</strong>&nbsp;提供住院补贴祝福早日康复&nbsp;&nbsp;&nbsp; ●<strong>员工及直系亲属离世</strong>&nbsp;关怀啥也不说了。节哀顺变&nbsp;&nbsp;&nbsp; ●<strong>重大变故爱心基金</strong>&nbsp;员工遭遇重大疾病协助申请国祯爱心基金</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><span style=\"transition: all 0.5s ease 0s; font-size: 24px;\">培训与生活</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">●<strong>职业培训</strong>&nbsp;公司拥有科学完善的培训管理体系，使员工在工作的同时能够提升工作能力和综合素质</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">●<strong>网络商学院</strong>&nbsp;与国内知名机构携手打造“中节能国祯网络商学院”，时间、目标、思维方式、沟通、执行、团队协作等课程丰富多彩</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">●<strong>继续教育</strong>&nbsp;公司出台一系列补贴政策，鼓励员工参加继续教育</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">●<strong>国学教育</strong>&nbsp;仁义礼智信 温良恭俭让，国祯书院为您提供专属的国学教育课程</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">●<strong>员工健康食堂</strong>&nbsp;无论是早餐的五谷杂粮，还是午餐的肉奶蛋禽，为您提供膳食合理的食物</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">●<strong>旅游活动</strong>&nbsp;组织员工游览祖国山水、了解各地风土人情</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">●<strong>社团活动</strong>&nbsp;足球、篮球、登山等社团不定期组织比赛，丰富日常生活</p><p><br/></p>', '0', '', '1', '0', '', '', '127.0.0.1', '1650534963', null, null, null, null, null, null, null, null, null);
INSERT INTO `core_article` VALUES ('22', '10', '你问我答', '0', null, '36', '', null, null, null, '', '', '', null, '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><strong>Q: 中节能国祯的企业性质是？</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><span style=\"transition: all 0.5s ease 0s; color: rgb(0, 0, 0);\">A：中节能国祯是股份制上市公司，控股股东是中国节能环保集团有限公司，</span><span style=\"transition: all 0.5s ease 0s; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255);\">公司</span><span style=\"transition: all 0.5s ease 0s; color: rgb(247, 49, 49); font-family: Arial, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255);\"><span style=\"transition: all 0.5s ease 0s; color: rgb(0, 0, 0);\">实际控制人为</span><span style=\"transition: all 0.5s ease 0s; color: rgb(0, 0, 0);\">国务院国有资产监督管理委员会</span><span style=\"transition: all 0.5s ease 0s; color: rgb(0, 0, 0);\"></span></span><span style=\"transition: all 0.5s ease 0s; color: rgb(0, 0, 0);\">。话说公司的性质真的有那么重要</span>吗？自己通过这个平台当上总经理，出任CEO，迎娶白富美，走上人生巅峰才是王道。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><strong>Q: 中节能国祯的工作时间如何？</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">8:30-12:00 13:00-17:00</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><strong>Q: 公司假期是怎样的？</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">A：公司完全按照国家法定节假日执行。工龄（不是司龄哦~）已满1年不满10年的，年休假5天;已满10年不满20年的，年休假10天;已满20年的，年休假15天。公司积极鼓励员工使用带薪年休假。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><strong>Q：你们的主招聘渠道是哪儿？</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">A：<a href=\"http://special.zhaopin.com/pagepublish/13643280/index.html\" target=\"_blank\" style=\"text-decoration-line: none; outline: none; transition: all 0.5s ease 0s; color: rgb(68, 68, 68);\">智联招聘（http://special.zhaopin.com/pagepublish/13643280/index.html</a>）及<a href=\"https://ehr.goodjobs.cn/show.php?corpID=1484&page=list&widget=4\" target=\"_blank\" style=\"text-decoration-line: none; outline: none; transition: all 0.5s ease 0s; color: rgb(68, 68, 68);\">新安人才网（https://ehr.goodjobs.cn/show.php?corpID=1484&amp;page=list&amp;widget=4）</a></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><strong>Q: 应届毕业生入职后需要立刻上岗吗？公司有哪些培训？</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">A：公司会组织统一的入职培训，让员工快速了解公司的文化、制度；每个部门还会不定期的开展专业相关的培训与讲座分享。每个人还会有自己的专业导师，更多的技能通过在工作中学习，在工作中成长。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><strong>Q: 请问工作压力大吗？</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">A：压力往往取决于自身，对自己要求高，压力也大；反之也乐得轻松。在中节能国祯有来自五湖四海的年轻人，他们凭借着不服输的劲，才有今天的成绩 。你说，压力大不大。我们非常欢迎不畏压力的青年人过来挑战。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><strong>Q: 听说在中节能国祯很容易长胖？</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">A：丰富多彩的午餐的确容易让人长胖，不过别担心，我们有各类足球、篮球、乒乓球、瑜伽、跑步协会，让我们在享受美食的同时也能保持好身材！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><strong>Q: 中节能国祯的发展前景如何？</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">A：比尔盖茨说微软离破产永远只有18个月、158岁的雷曼倒下了。我们不敢承诺您选择的中节能国祯会是一个百年基业，但在中节能国祯创业历程中，我们积累了最重要的财富——一批又一批优秀的人才！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><strong>Q: 人事管理理念</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">1.我们尊重人才，我们寻找人才，我们也培养人才。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">2.选人。广开渠道，不拘一格，唯才是举，以德为先，择优录用。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">3.育人。员工培训是企业风险最小，收益最大的战略性投资。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">4.用人。让想干事的人有机会，能干事的人有舞台，干成事的人有地位有待遇。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><strong>Q: 职业规划</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">公司建立了科学、统一、规范的职级管理体系，实行“以岗定级，以岗定薪；岗变级变，级变薪变”的管理模式，为员工提供行政管理岗位序列和业务技术岗位序列“双轨制”晋升体系。其中，专业技术类分为：技术研发岗、市场营销岗、职能管理岗、专业管理岗、辅助类岗五个职类。各序列按照岗位的工作性质、技术含量、技能素质要求、繁简难易、责任大小、任务轻重等因素对岗位由高到低共设12级。社会招聘新员工，根据承担工作岗位、工作经验经历、技能、学历、职称、原单位职务与职级等要素确定初始职级。应届大学毕业见习期职级暂定12级，见习期3个月，通过见习期考核后定为11级。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">公司根据员工业绩考核结果，原则上每3年进行一次职级调整，根据公司人力资源需求状况，以及员工工作业绩表现，对有突出表现的员工，给予职级晋升；对于表现不符合职位要求者，经同样程序，进行降职处理。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\"><strong>Q: 招聘流程</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; text-align: justify; white-space: normal;\">在线提交简历→资格审查→组织面试→体检→录用→录用人员上岗前培训→试用期考察→试用期满进行正式的工作表现评价→成为中节能国祯人。</p><p><br/></p>', '0', '', '1', '0', '', '', '127.0.0.1', '1650535058', null, null, null, null, null, null, null, null, null);
INSERT INTO `core_article` VALUES ('23', '10', '1', '0', null, '34', '20220421/393ecfaeda88e2834a471a50b8fcd46c.jpg', null, null, null, '', '', '', null, '', '4', '', '1', '0', '', '', '127.0.0.1', '1650535180', null, null, null, null, null, null, null, null, null);
INSERT INTO `core_article` VALUES ('26', '10', '安徽', '0', null, '44', '', null, null, null, '', '', '', null, '', '0', '', '1', '0', '', '', '127.0.0.1', '1650607906', null, null, null, null, null, null, null, null, null);
INSERT INTO `core_article` VALUES ('28', '20', '浙江', '0', null, '44', '', null, null, null, '', '', '', null, '', '0', '', '1', '0', '', '', '127.0.0.1', '1650607933', null, null, null, null, null, null, null, null, null);
INSERT INTO `core_article` VALUES ('31', '20', '129+728', '0', null, '17', '20220422/2081d2db75db864bd6cc7642860d7501.jpg', null, null, null, '', '', '', '<p>123123213</p>', '', '1', '', '1', '0', '', '', '127.0.0.1', '1650611641', null, null, null, null, '26', null, null, null, '17');
INSERT INTO `core_article` VALUES ('32', '10', '1111', '0', null, '18', '20220422/967a00b805d3245a60f557152eef6d00.jpg', null, null, null, '', '', '', '<p>123</p>', '<p>121213221321</p>', '0', '', '1', '0', '', '', '127.0.0.1', '1650611808', null, null, null, null, '28', null, null, null, '18');

-- ----------------------------
-- Table structure for `core_article_cate`
-- ----------------------------
DROP TABLE IF EXISTS `core_article_cate`;
CREATE TABLE `core_article_cate` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '分类名称',
  `en_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `orderby` int(11) DEFAULT '100' COMMENT '排序',
  `info_state` tinyint(5) NOT NULL DEFAULT '0',
  `website` varchar(200) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `wap_photo` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `wap_website` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `pic` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `is_Target` tinyint(2) DEFAULT NULL,
  `is_nav` tinyint(2) DEFAULT NULL,
  `seo_title` text,
  `keyword` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `fields` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `classification_ids` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `catedir` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_bigpic` int(5) DEFAULT '0',
  `is_annex` int(5) DEFAULT '0',
  `is_intro` int(5) DEFAULT '0',
  `is_video` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_piclist` int(5) DEFAULT '0',
  `cate_des` text COMMENT '分类简介',
  `is_area` int(5) DEFAULT '0' COMMENT '区域',
  `is_type` int(5) DEFAULT '0' COMMENT '类型		',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_article_cate
-- ----------------------------
INSERT INTO `core_article_cate` VALUES ('1', '首页', '', '0', '0', '10', '1', '', '', null, null, '', '1649484730', '1649484730', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `core_article_cate` VALUES ('2', '关于我们', 'About', '0', '0', '20', '1', '', '20220421/57698b13ef4b0edd44356ef9cc381779.jpg', null, null, '', '1649484746', '1650520578', '1', null, null, '', '', '', '23,24,25,26', '', null, '0', '0', '0', null, '1', null, '0', '0');
INSERT INTO `core_article_cate` VALUES ('3', '最新动态', 'News', '0', '0', '30', '3', '', '20220421/4f932e7a85c806ef9ae57d100cf26ecb.jpg', null, null, '', '1649485320', '1650523550', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `core_article_cate` VALUES ('4', '环境服务', 'Service', '0', '0', '40', '1', '', '20220421/9dd6bd19d8322f09cf3510367f682272.jpg', null, null, '', '1650505492', '1650526273', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('5', '项目案例', 'Project', '0', '0', '50', '8', '', '20220422/a6d11c9d42c57de9f737f728e5b2c62b.jpg', null, null, '', '1650505531', '1650596216', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('6', '投资者关系', 'Investor', '0', '0', '60', '1', '', '20220421/c360239cc8503f695f49577d02377b5f.jpg', null, null, '', '1650505545', '1650529662', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('7', '党群工作', 'Party & mass', '0', '0', '70', '1', '', '20220421/9d6b5a3a8441ffc29969006365fccd77.jpg', null, null, '', '1650505556', '1650530324', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('8', '视频展示', 'Video', '0', '0', '80', '5', '', '20220421/a82a8433fac5809930cf23ce6aa62fdc.jpg', null, null, '', '1650505564', '1650530592', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('9', '企业文化', 'Culture', '0', '0', '90', '1', '', '20220421/8cf91078db4784e1f26025bac4aa6d2e.jpg', null, null, '', '1650505573', '1650530794', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('10', '加入我们', 'Join Us', '0', '0', '100', '7', '', '20220421/a3e0b7f92f889f087784285d83e7924a.jpg', null, null, '', '1650505582', '1650534784', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('11', '联系我们', 'Contact', '0', '0', '110', '6', '', '', null, null, '', '1650505590', '1650587930', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('12', '公司简介', '', '2', '0', '10', '1', '', null, null, null, '', '1650507900', '1650591447', '1', null, null, '', '', '', '23,24,25,26', '', null, '0', '0', '1', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('13', '控参股公司', '', '2', '0', '20', '4', '', '', null, null, '', '1650507965', '1650520934', '1', null, null, '', '', '', '1', '', null, '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `core_article_cate` VALUES ('14', '宣传片', '', '2', '0', '30', '5', '', '', null, null, '', '1650507974', '1650521368', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `core_article_cate` VALUES ('15', '企业资质', '', '2', '0', '40', '1', '', '', null, null, '', '1650507982', '1650507982', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `core_article_cate` VALUES ('16', '企业荣誉', '', '2', '0', '50', '1', '', '', null, null, '', '1650507988', '1650507988', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `core_article_cate` VALUES ('17', '市政水务', 'Urban Water Services', '4', '0', '10', '4', '', '', null, null, '20220422/22a97d0562ebc7872e92d8ef451201fd.jpg', '1650508073', '1650611264', '1', null, null, '', '', '', '', '', null, '0', '0', '1', null, '0', '<p><span style=\"font-size:16px;\">中节能国祯经过20余年不懈的努力，在发展过程中逐渐形成了集项目投资、研发设计、设备制造、工程建设、运营管理等为一体的完整的产业链优势。中节能国祯以客户需求为导向，以技术研发与智慧运营为两翼，利用多年积淀的运营技术、经验，并在此基础上进行创新，形成灵活高效、快速复制管理体系，并通过精细化管理形成低成本竞争优势。通过BOT、TOT、DBO、PPP和托管运营等形式运营管理市政污水处理厂数量超过150个，工艺类型包括A²/O、氧化沟、SBR、MBR、BAF等，运营规模超过524万吨/日，运营的管网长度达5597公里，运营泵站数量约131座；运营的工业废水近20万吨/日。</span></p>', '1', '0');
INSERT INTO `core_article_cate` VALUES ('18', '水环境综合治理', '', '4', '0', '20', '4', '', '', null, null, '20220422/96699a839349f20c46a05e239e19a0e0.jpg', '1650508082', '1650613072', '1', null, null, '', '', '', '', '', null, '0', '0', '1', null, '0', '', '1', '0');
INSERT INTO `core_article_cate` VALUES ('19', '村镇服务', '', '4', '0', '30', '4', '', '', null, null, '20220422/66566803163ead2620e9c56152628f90.jpg', '1650508088', '1650613078', '1', null, null, '', '', '', '', '', null, '0', '0', '1', null, '0', '', '1', '0');
INSERT INTO `core_article_cate` VALUES ('20', '工业水务', '', '4', '0', '40', '4', '', '', null, null, '20220422/bf6158e38d5ac8c7638ea8a8dec01540.jpg', '1650508095', '1650613083', '1', null, null, '', '', '', '', '', null, '0', '0', '1', null, '0', '', '1', '0');
INSERT INTO `core_article_cate` VALUES ('21', '设备', '', '4', '0', '50', '4', '', '', null, null, '', '1650508103', '1650526934', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('22', '管网', '', '4', '0', '60', '4', '', '', null, null, '', '1650508110', '1650526939', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('23', '公司公告', '', '6', '0', '10', '2', '', '', null, null, '', '1650508204', '1650529561', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('24', '股票实时行情', '', '6', '0', '20', '2', '', '', null, null, '', '1650508210', '1650529580', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('25', '董事', '', '6', '0', '30', '2', '', '', null, null, '', '1650508217', '1650529584', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('26', '财务报告', '', '6', '0', '40', '2', '', '', null, null, '', '1650508224', '1650529589', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('27', '投资者服务', '', '6', '0', '50', '2', '', '', null, null, '', '1650508233', '1650529594', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('28', '宣传片', '', '8', '0', '10', '5', '', '', null, null, '', '1650508297', '1650530599', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('29', '视频', '', '8', '0', '20', '5', '', '', null, null, '', '1650508307', '1650530739', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('30', '企业文化', '', '9', '0', '10', '4', '', '', null, null, '', '1650508352', '1650531108', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('31', '文化活动', '', '9', '0', '20', '4', '', '', null, null, '', '1650508358', '1650531502', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('32', '社会责任', '', '9', '0', '30', '4', '', '', null, null, '', '1650508366', '1650531543', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('33', '内刊《节能祯知》', '', '9', '0', '40', '4', '', '', null, null, '', '1650508375', '1650532477', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('34', '办公环境', '', '10', '0', '10', '4', '/home/category/index/id/34.html', '', null, null, '20220421/4139b9cc2087d434ca52de4b83af7c19.jpg', '1650508504', '1650614854', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '<p>中节能国祯是国家环保产业骨干企业，国家高新技术企业，安徽省首批创新型企业，省质量管理奖获得单位。</p>', '0', '0');
INSERT INTO `core_article_cate` VALUES ('35', '福利待遇', '', '10', '0', '20', '1', '/home/category/index/id/35.html', '', null, null, '', '1650508513', '1650614866', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '<p>中节能国祯建立了企业博士后科研工作站、省级工程技术研究中心，并牵头成立了安徽省污水处理产业。</p>', '0', '0');
INSERT INTO `core_article_cate` VALUES ('36', '你问我答', '', '10', '0', '30', '1', '/home/category/index/id/36.html', '', null, null, '', '1650508522', '1650614871', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '<p>中节能国祯成立于1997年2月，是我国生活污水处理行业市场化过程中最早提供“一站式六维服务”综合解决方案的专业公司。</p>', '0', '0');
INSERT INTO `core_article_cate` VALUES ('37', '宣传片', '', '14', '0', '10', '5', '', '', null, null, '', '1650521469', '1650530451', '1', null, null, '', '', '', '27,28', '', null, '0', '1', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('38', '视频', '', '14', '0', '20', '1', '', '', null, null, '', '1650521490', '1650521490', '1', null, null, '', '', '', '', '', null, '0', '1', '0', null, '0', null, '0', '0');
INSERT INTO `core_article_cate` VALUES ('39', '最新动态', '', '3', '0', '10', '3', '', '', null, null, '', '1650523708', '1650523708', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `core_article_cate` VALUES ('40', '党群工作', '', '7', '0', '10', '3', '', '', null, null, '', '1650530156', '1650530156', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('41', '工程案例', '', '5', '0', '10', '8', '', '', null, null, '', '1650595557', '1650614040', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('43', '联系我们', '', '11', '0', '10', '6', '', '', null, null, '', '1650598680', '1650598680', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');
INSERT INTO `core_article_cate` VALUES ('44', '项目区域', '', '5', '0', '20', '8', '', '', null, null, '', '1650607500', '1650613679', '1', null, null, '', '', '', '', '', null, '0', '0', '0', null, '0', '', '0', '0');

-- ----------------------------
-- Table structure for `core_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `core_attribute`;
CREATE TABLE `core_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sortnum` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `create_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of core_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for `core_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `core_auth_group`;
CREATE TABLE `core_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` text NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_auth_group
-- ----------------------------
INSERT INTO `core_auth_group` VALUES ('1', '系统管理员', '1', '1,2,3,61,88,89,90,5,6,27,13,14,24,25,26,48,81,82,83,85,87,84,70,91,71,75,92,93,96,97,98,115,116,117', '1446535750', '1520211372');
INSERT INTO `core_auth_group` VALUES ('2', '内容管理员', '1', '1,2,3,61,94,95,5,6,27,13,14,24,25,26,48,81,82,70,71,75,92,93,96,97,98', '1446535750', '1531301016');

-- ----------------------------
-- Table structure for `core_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `core_auth_group_access`;
CREATE TABLE `core_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_auth_group_access
-- ----------------------------
INSERT INTO `core_auth_group_access` VALUES ('1', '1');
INSERT INTO `core_auth_group_access` VALUES ('9', '2');

-- ----------------------------
-- Table structure for `core_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `core_auth_rule`;
CREATE TABLE `core_auth_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `css` varchar(20) NOT NULL COMMENT '样式',
  `condition` char(100) NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父栏目ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_auth_rule
-- ----------------------------
INSERT INTO `core_auth_rule` VALUES ('1', '#', '系统管理', '1', '1', 'fa fa-gear', '', '0', '40', '1446535750', '1477312169');
INSERT INTO `core_auth_rule` VALUES ('2', 'admin/user/index', '用户管理', '1', '1', '', '', '1', '10', '1446535750', '1477312169');
INSERT INTO `core_auth_rule` VALUES ('3', 'admin/role/index', '角色管理', '1', '1', '', '', '1', '20', '1446535750', '1477312169');
INSERT INTO `core_auth_rule` VALUES ('5', '#', '数据库管理', '1', '0', 'fa fa-database', '', '0', '50', '1446535750', '1477312169');
INSERT INTO `core_auth_rule` VALUES ('6', 'admin/data/index', '数据库备份', '1', '0', '', '', '5', '50', '1446535750', '1477312169');
INSERT INTO `core_auth_rule` VALUES ('13', '#', '日志管理', '1', '0', 'fa fa-tasks', '', '0', '60', '1477312169', '1477312169');
INSERT INTO `core_auth_rule` VALUES ('14', 'admin/log/operate_log', '行为日志', '1', '0', '', '', '13', '50', '1477312169', '1477312169');
INSERT INTO `core_auth_rule` VALUES ('24', '#', '文章管理', '1', '1', 'fa fa-paste', '', '0', '20', '1477312169', '1535340122');
INSERT INTO `core_auth_rule` VALUES ('25', 'admin/article/index_cate', '栏目分类', '1', '1', '', '', '24', '10', '1477312260', '1547544024');
INSERT INTO `core_auth_rule` VALUES ('26', 'admin/article/index', '文章列表', '1', '1', '', '', '24', '20', '1477312333', '1535340145');
INSERT INTO `core_auth_rule` VALUES ('27', 'admin/data/import', '数据库还原', '1', '0', '', '', '5', '50', '1477639870', '1477639870');
INSERT INTO `core_auth_rule` VALUES ('48', '#', '广告管理', '1', '1', 'fa fa-image', '', '0', '30', '1477640011', '1477640011');
INSERT INTO `core_auth_rule` VALUES ('81', 'admin/ad/index_position', '广告位', '1', '0', '', '', '48', '50', '1517022329', '1517022329');
INSERT INTO `core_auth_rule` VALUES ('82', 'admin/ad/index', '广告列表', '1', '1', '', '', '48', '50', '1517022352', '1517022352');
INSERT INTO `core_auth_rule` VALUES ('61', 'admin/config/index', '系统配置', '1', '0', '', '', '1', '50', '1479908607', '1527832715');
INSERT INTO `core_auth_rule` VALUES ('70', '#', '会员管理', '1', '0', 'fa fa-user-circle-o', '', '0', '10', '1484103066', '1528095832');
INSERT INTO `core_auth_rule` VALUES ('71', 'admin/member/group', '会员组', '1', '0', '', '', '70', '20', '1484103304', '1528096076');
INSERT INTO `core_auth_rule` VALUES ('75', 'admin/member/index', '会员列表', '1', '0', '', '', '70', '10', '1484103304', '1484103304');
INSERT INTO `core_auth_rule` VALUES ('92', '#', '功能管理', '1', '1', 'fa fa fa-legal', '', '0', '35', '1519872916', '1528098816');
INSERT INTO `core_auth_rule` VALUES ('93', 'admin/message/index', '留言管理', '1', '0', '', '', '92', '20', '1519872954', '1528098912');
INSERT INTO `core_auth_rule` VALUES ('94', 'admin/website/index', '网站配置', '1', '1', '', '', '1', '10', '1527835580', '1527835580');
INSERT INTO `core_auth_rule` VALUES ('95', 'admin/counter/index', '访问统计', '1', '1', '', '', '1', '50', '1527924894', '1527924894');
INSERT INTO `core_auth_rule` VALUES ('100', 'admin/nature/cate', '链接分类', '1', '0', '', '', '92', '50', '1532058065', '1532058065');
INSERT INTO `core_auth_rule` VALUES ('101', 'admin/nature/index', '链接列表', '1', '1', '', '', '92', '50', '1532058093', '1532058093');
INSERT INTO `core_auth_rule` VALUES ('102', '#', '内容批量处理', '1', '1', 'fa fa-legal ', '', '0', '50', '1532081423', '1532081454');
INSERT INTO `core_auth_rule` VALUES ('103', 'admin/batch/batchupload', '信息批量上传', '1', '1', '', '', '102', '1', '1532081526', '1532081526');
INSERT INTO `core_auth_rule` VALUES ('104', 'admin/batch/move', ' 批量转移', '1', '1', '', '', '102', '50', '1532081555', '1532081555');
INSERT INTO `core_auth_rule` VALUES ('105', 'admin/batch/watermark', '批量水印', '1', '1', '', '', '102', '50', '1532081582', '1532081582');
INSERT INTO `core_auth_rule` VALUES ('106', 'admin/batch/replace', '批量替换', '1', '1', '', '', '102', '50', '1532081610', '1532081610');
INSERT INTO `core_auth_rule` VALUES ('107', 'admin/weixin/index', '微信配置', '1', '0', '', '', '1', '50', '1538035879', '1538035879');
INSERT INTO `core_auth_rule` VALUES ('108', 'admin/wx_member/index', '微信会员', '1', '0', '', '', '70', '50', '1542334651', '1542334651');
INSERT INTO `core_auth_rule` VALUES ('109', 'admin/article/article_recycle', '回收站', '1', '1', '', '', '24', '50', '1542961855', '1542961855');
INSERT INTO `core_auth_rule` VALUES ('110', 'admin/querlist/index', '抓取网站数据', '1', '0', '', '', '1', '50', '1547629860', '1547629860');
INSERT INTO `core_auth_rule` VALUES ('111', 'admin/fields/index', '新增新闻字段', '1', '0', '', '', '1', '50', '1557368380', '1557368380');
INSERT INTO `core_auth_rule` VALUES ('112', 'admin/floating/index', '漂浮窗', '1', '0', '', '', '92', '50', '1560993700', '1560993700');
INSERT INTO `core_auth_rule` VALUES ('113', 'admin/online/index', '在线客服', '1', '0', '', '', '92', '50', '1561944795', '1561944795');
INSERT INTO `core_auth_rule` VALUES ('115', '#', '属性管理', '1', '0', 'fa fa-cubes', '', '0', '50', '1583119681', '1583119681');
INSERT INTO `core_auth_rule` VALUES ('116', 'admin/classification/index', '属性分类', '1', '0', '', '', '115', '50', '1583119845', '1583119845');
INSERT INTO `core_auth_rule` VALUES ('117', 'admin/attribute/index', '属性列表', '1', '0', '', '', '115', '50', '1583140434', '1583140434');
INSERT INTO `core_auth_rule` VALUES ('118', 'admin/apply/job_index', '人才招聘', '1', '1', '', '', '92', '50', '1629179481', '1629179481');

-- ----------------------------
-- Table structure for `core_cate_config`
-- ----------------------------
DROP TABLE IF EXISTS `core_cate_config`;
CREATE TABLE `core_cate_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `value` text COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_cate_config
-- ----------------------------
INSERT INTO `core_cate_config` VALUES ('1', 'en_name', '1');
INSERT INTO `core_cate_config` VALUES ('2', 'catedir', '0');
INSERT INTO `core_cate_config` VALUES ('3', 'website', '1');
INSERT INTO `core_cate_config` VALUES ('4', 'photo', '1');
INSERT INTO `core_cate_config` VALUES ('5', 'wap_photo', '0');
INSERT INTO `core_cate_config` VALUES ('6', 'pic', '1');
INSERT INTO `core_cate_config` VALUES ('7', 'info_state', '1');
INSERT INTO `core_cate_config` VALUES ('8', 'target', '0');
INSERT INTO `core_cate_config` VALUES ('9', 'nav', '0');
INSERT INTO `core_cate_config` VALUES ('10', 'other', '1');
INSERT INTO `core_cate_config` VALUES ('11', 'pic_list', '1');
INSERT INTO `core_cate_config` VALUES ('12', 'wzjl', '0');
INSERT INTO `core_cate_config` VALUES ('17', 'wap_website', '0');

-- ----------------------------
-- Table structure for `core_classification`
-- ----------------------------
DROP TABLE IF EXISTS `core_classification`;
CREATE TABLE `core_classification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sortnum` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `style` tinyint(2) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `create_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of core_classification
-- ----------------------------

-- ----------------------------
-- Table structure for `core_config`
-- ----------------------------
DROP TABLE IF EXISTS `core_config`;
CREATE TABLE `core_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `value` text COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_config
-- ----------------------------
INSERT INTO `core_config` VALUES ('1', 'web_site_close', '1');
INSERT INTO `core_config` VALUES ('2', 'list_rows', '10');
INSERT INTO `core_config` VALUES ('3', 'admin_allow_ip', '');
INSERT INTO `core_config` VALUES ('13', 'web_weixin_close', '0');
INSERT INTO `core_config` VALUES ('14', 'wap_site_state', '1');
INSERT INTO `core_config` VALUES ('15', 'wap_site_domain', '');

-- ----------------------------
-- Table structure for `core_counter`
-- ----------------------------
DROP TABLE IF EXISTS `core_counter`;
CREATE TABLE `core_counter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `ip` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `state` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=958 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of core_counter
-- ----------------------------
INSERT INTO `core_counter` VALUES ('1', '电脑端', '', '1637227382', '127.0.0.1', '0');
INSERT INTO `core_counter` VALUES ('2', '电脑端', '', '1637281948', '127.0.0.1', '0');
INSERT INTO `core_counter` VALUES ('3', '电脑端', 'http://my.anjs.com/cfwl_system.php/index/index.html', '1637285741', '127.0.0.1', '0');
INSERT INTO `core_counter` VALUES ('4', '电脑端', 'http://my.anjs.com/cfwl_system.php/index/index.html', '1637289491', '127.0.0.1', '0');
INSERT INTO `core_counter` VALUES ('5', '电脑端', 'http://my.anjs.com/home/category/index/id/87.html?page=1', '1637293109', '127.0.0.1', '0');
INSERT INTO `core_counter` VALUES ('6', '电脑端', 'http://my.anjs.com/home/category/detail/id/351.html', '1637297909', '127.0.0.1', '0');
INSERT INTO `core_counter` VALUES ('7', '电脑端', 'http://my.anjs.com/home/search/index.html?keys=%E9%9B%86%E5%9B%A2', '1637301523', '127.0.0.1', '0');
INSERT INTO `core_counter` VALUES ('8', '电脑端', 'http://my.anjs.com/home/category/index/id/118.html', '1637305191', '127.0.0.1', '0');
INSERT INTO `core_counter` VALUES ('9', '电脑端', 'http://my.jrql.com/home/index/index.html', '1650508558', '127.0.0.1', '0');
INSERT INTO `core_counter` VALUES ('10', '电脑端', 'http://my.jrql.com/home/index/index.html', '1650512232', '127.0.0.1', '0');
INSERT INTO `core_counter` VALUES ('11', '电脑端', 'http://my.jrql.com/home/category/index/id/16.html', '1650519291', '127.0.0.1', '0');
INSERT INTO `core_counter` VALUES ('12', '电脑端', 'http://my.jrql.com/home/category/index/id/15.html', '1650523001', '127.0.0.1', '0');
INSERT INTO `core_counter` VALUES ('13', '电脑端', 'http://my.jrql.com/home/category/index/id/4.html', '1650526672', '127.0.0.1', '0');
INSERT INTO `core_counter` VALUES ('14', '电脑端', 'http://my.jrql.com/home/category/index/id/24.html', '1650530309', '127.0.0.1', '0');
INSERT INTO `core_counter` VALUES ('15', '电脑端', 'http://my.jrql.com/home/category/index/id/10.html', '1650534350', '127.0.0.1', '0');
INSERT INTO `core_counter` VALUES ('16', '电脑端', '', '1650587142', '127.0.0.1', '0');
INSERT INTO `core_counter` VALUES ('17', '电脑端', 'http://my.jrql.com/home/category/index/id/7.html', '1650590783', '127.0.0.1', '0');
INSERT INTO `core_counter` VALUES ('18', '电脑端', 'http://my.jrql.com/home/category/index/id/2.html', '1650592127', '127.0.0.1', '0');
INSERT INTO `core_counter` VALUES ('19', '电脑端', 'http://my.jrql.com/home/index/index.html', '1650595752', '127.0.0.1', '0');
INSERT INTO `core_counter` VALUES ('20', '电脑端', 'http://my.jrql.com/home/category/index/id/11.html', '1650605737', '127.0.0.1', '0');
INSERT INTO `core_counter` VALUES ('21', '电脑端', 'http://my.jrql.com/home/category/index/id/17.html', '1650609374', '127.0.0.1', '0');
INSERT INTO `core_counter` VALUES ('22', '电脑端', 'http://my.jrql.com/home/category/index/id/5.html', '1650612988', '127.0.0.1', '0');

-- ----------------------------
-- Table structure for `core_floating`
-- ----------------------------
DROP TABLE IF EXISTS `core_floating`;
CREATE TABLE `core_floating` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL,
  `link_url` varchar(128) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `ad_position` int(10) DEFAULT NULL,
  `mode` varchar(200) DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `height` int(10) DEFAULT NULL,
  `start_date` int(11) DEFAULT NULL COMMENT '开始时间',
  `end_date` int(11) DEFAULT NULL COMMENT '结束时间',
  `asidetop` int(10) DEFAULT NULL,
  `asideleft` int(10) DEFAULT NULL,
  `screen_time` int(10) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `closed` tinyint(1) DEFAULT '0',
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_floating
-- ----------------------------

-- ----------------------------
-- Table structure for `core_job`
-- ----------------------------
DROP TABLE IF EXISTS `core_job`;
CREATE TABLE `core_job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cateId` int(10) unsigned DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `sortnum` int(10) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `age` varchar(50) DEFAULT NULL,
  `graduate_time` varchar(50) DEFAULT NULL,
  `college` varchar(50) DEFAULT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `resumes` text,
  `appraise` text,
  `create_time` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `birthday` varchar(100) DEFAULT NULL,
  `major` varchar(50) DEFAULT NULL,
  `cate_name` varchar(50) DEFAULT NULL,
  `annex` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_job
-- ----------------------------

-- ----------------------------
-- Table structure for `core_log`
-- ----------------------------
DROP TABLE IF EXISTS `core_log`;
CREATE TABLE `core_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `admin_name` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `ip` char(60) DEFAULT NULL COMMENT 'IP地址',
  `status` tinyint(1) DEFAULT NULL COMMENT '1 成功 2 失败',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3796 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_log
-- ----------------------------

-- ----------------------------
-- Table structure for `core_member`
-- ----------------------------
DROP TABLE IF EXISTS `core_member`;
CREATE TABLE `core_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(32) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `sex` int(10) DEFAULT NULL COMMENT '1男2女',
  `password` char(32) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `head_img` varchar(200) DEFAULT NULL,
  `realname` varchar(32) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL COMMENT '认证的手机号码',
  `create_time` int(11) DEFAULT '0' COMMENT '注册时间',
  `login_num` varchar(15) DEFAULT NULL COMMENT '登录次数',
  `status` tinyint(1) DEFAULT NULL COMMENT '1正常  0 禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_member
-- ----------------------------

-- ----------------------------
-- Table structure for `core_member_group`
-- ----------------------------
DROP TABLE IF EXISTS `core_member_group`;
CREATE TABLE `core_member_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言Id',
  `group_name` varchar(32) NOT NULL COMMENT '留言评论作者',
  `status` tinyint(1) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '留言回复时间',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COMMENT='文章评论表';

-- ----------------------------
-- Records of core_member_group
-- ----------------------------
INSERT INTO `core_member_group` VALUES ('1', '普通会员', '1', '1441616559', '1528097175');
INSERT INTO `core_member_group` VALUES ('2', '高级会员', '1', '1441617195', '1528097192');
INSERT INTO `core_member_group` VALUES ('3', 'VIP会员', '1', '1441769224', '1528097200');

-- ----------------------------
-- Table structure for `core_message`
-- ----------------------------
DROP TABLE IF EXISTS `core_message`;
CREATE TABLE `core_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sortnum` int(10) unsigned DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `reply` text COLLATE utf8_unicode_ci,
  `create_time` int(11) NOT NULL,
  `ip` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` tinyint(1) unsigned NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of core_message
-- ----------------------------
INSERT INTO `core_message` VALUES ('79', '10', 'hidden_curitis', '13625641234', null, '1', null, '1637305031', '127.0.0.1', '1', '1');

-- ----------------------------
-- Table structure for `core_nature`
-- ----------------------------
DROP TABLE IF EXISTS `core_nature`;
CREATE TABLE `core_nature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `pic` varchar(200) DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `nature_id` int(11) NOT NULL,
  `sortnum` int(11) NOT NULL DEFAULT '0',
  `create_time` varchar(200) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of core_nature
-- ----------------------------
INSERT INTO `core_nature` VALUES ('3', '中国节能', null, 'http://www.cecep.cn/g13809.aspx', '1', '10', '1637289042', '1');
INSERT INTO `core_nature` VALUES ('5', '麦王环境', null, 'http://www.mcwongtech.com/', '1', '30', '1637289179', '1');
INSERT INTO `core_nature` VALUES ('6', '国祯膜科技', null, 'http://www.gzep-membrane.com/', '1', '40', '1637289215', '1');

-- ----------------------------
-- Table structure for `core_nature_cate`
-- ----------------------------
DROP TABLE IF EXISTS `core_nature_cate`;
CREATE TABLE `core_nature_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sortnum` int(11) NOT NULL DEFAULT '0',
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of core_nature_cate
-- ----------------------------
INSERT INTO `core_nature_cate` VALUES ('1', '1', '友情链接');

-- ----------------------------
-- Table structure for `core_online_config`
-- ----------------------------
DROP TABLE IF EXISTS `core_online_config`;
CREATE TABLE `core_online_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `value` text COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_online_config
-- ----------------------------
INSERT INTO `core_online_config` VALUES ('1', 'status', '0');
INSERT INTO `core_online_config` VALUES ('2', 'position', 'right');
INSERT INTO `core_online_config` VALUES ('3', 'show_btn', '1');
INSERT INTO `core_online_config` VALUES ('4', 'topSpace', '200');
INSERT INTO `core_online_config` VALUES ('5', 'width', '160');
INSERT INTO `core_online_config` VALUES ('6', 'bgcolor', '#FFFFFF');
INSERT INTO `core_online_config` VALUES ('8', 'title', '在线客服');
INSERT INTO `core_online_config` VALUES ('9', 'qrcode', null);
INSERT INTO `core_online_config` VALUES ('10', 'content', '<p style=\"text-align: center;\">联系电话</p><h6 style=\"text-align: center;\"><strong><span style=\"font-size: 16px;\">18600588099</span></strong></h6>');
INSERT INTO `core_online_config` VALUES ('7', 'serviceLine', '');
INSERT INTO `core_online_config` VALUES ('11', 'titcolor', '#FFFFFF');
INSERT INTO `core_online_config` VALUES ('12', 'titbgcolor', '#262626');
INSERT INTO `core_online_config` VALUES ('13', 'color', '#555555');
INSERT INTO `core_online_config` VALUES ('14', 'is_open', '0');

-- ----------------------------
-- Table structure for `core_online_list`
-- ----------------------------
DROP TABLE IF EXISTS `core_online_list`;
CREATE TABLE `core_online_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sortnum` int(10) unsigned NOT NULL,
  `number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_icon` int(10) unsigned NOT NULL,
  `state` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of core_online_list
-- ----------------------------
INSERT INTO `core_online_list` VALUES ('1', '1', '26216125', '在线客服', '1', '1');

-- ----------------------------
-- Table structure for `core_pic_catelist`
-- ----------------------------
DROP TABLE IF EXISTS `core_pic_catelist`;
CREATE TABLE `core_pic_catelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `sortnum` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `pic` varchar(200) NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of core_pic_catelist
-- ----------------------------
INSERT INTO `core_pic_catelist` VALUES ('7', '17', '1', '市政水务', '20220422/9f7333fb4970ce8243a32fd98471efb4.png', '');
INSERT INTO `core_pic_catelist` VALUES ('8', '18', '1', '水环境综合治理', '20220422/58ebd78a48cd66d83f135849aa6011ea.png', '');
INSERT INTO `core_pic_catelist` VALUES ('9', '19', '1', '水环境综合治理', '20220422/7d8262ab287548fd5e6353eebc7d20b6.png', '');
INSERT INTO `core_pic_catelist` VALUES ('10', '20', '1', '工业水务', '20220422/febce5944a7c3b9d4d4f37cd52fa85c8.png', '');

-- ----------------------------
-- Table structure for `core_pic_list`
-- ----------------------------
DROP TABLE IF EXISTS `core_pic_list`;
CREATE TABLE `core_pic_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `sortnum` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `pic` varchar(200) NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of core_pic_list
-- ----------------------------
INSERT INTO `core_pic_list` VALUES ('12', '275', '1', '20190249471115964', '20211020/3cc1d7d37d48ab99d02d77e108f735d8.jpg', '');
INSERT INTO `core_pic_list` VALUES ('13', '275', '2', '1550645600617', '20211020/b5557451674e8474790a23af2e26853a.jpg', '');
INSERT INTO `core_pic_list` VALUES ('14', '275', '3', '1550645608084', '20211020/3e8e0742ebf5195fd0990b1a1f29e53a.jpg', '');
INSERT INTO `core_pic_list` VALUES ('15', '277', '1', '20190170284213136', '20211021/f937f9e1f923f3b7f5cefa6b3a9f6e68.jpg', '');
INSERT INTO `core_pic_list` VALUES ('17', '277', '3', '20190160410213136', '20211021/65298b1c75a7cbb524fe0358ef564574.jpg', '');

-- ----------------------------
-- Table structure for `core_watermark`
-- ----------------------------
DROP TABLE IF EXISTS `core_watermark`;
CREATE TABLE `core_watermark` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `value` text COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_watermark
-- ----------------------------
INSERT INTO `core_watermark` VALUES ('1', 'wm_type', '1');
INSERT INTO `core_watermark` VALUES ('2', 'wm_position', '3');
INSERT INTO `core_watermark` VALUES ('3', 'wm_text', '晨飞网络');
INSERT INTO `core_watermark` VALUES ('4', 'wm_fontfamily', 'ARIAL.TTF');
INSERT INTO `core_watermark` VALUES ('5', 'wm_fontsize', '18');
INSERT INTO `core_watermark` VALUES ('6', 'wm_color', '#363636');
INSERT INTO `core_watermark` VALUES ('7', 'wm_textquality', '75');
INSERT INTO `core_watermark` VALUES ('8', 'wm_image', '20180721/1793529026c8ecf744fe9149c7be6299.png');
INSERT INTO `core_watermark` VALUES ('9', 'wm_alpha', '60');
INSERT INTO `core_watermark` VALUES ('10', 'wm_imgquality', '75');

-- ----------------------------
-- Table structure for `core_web_config`
-- ----------------------------
DROP TABLE IF EXISTS `core_web_config`;
CREATE TABLE `core_web_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `value` text COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_web_config
-- ----------------------------
INSERT INTO `core_web_config` VALUES ('1', 'web_site_title', '合肥精锐电力');
INSERT INTO `core_web_config` VALUES ('2', 'web_site_description', '合肥精锐电力');
INSERT INTO `core_web_config` VALUES ('3', 'web_site_keyword', '合肥精锐电力');
INSERT INTO `core_web_config` VALUES ('4', 'web_site_icp', '陇ICP备15002349号-1');
INSERT INTO `core_web_config` VALUES ('9', 'web_footer_javascript', '');
INSERT INTO `core_web_config` VALUES ('6', 'web_site_copy', '<p>©&nbsp;2021&nbsp;中节能国祯环保科技股份有限公司 股票代码 300388 <a href=\"https://beian.miit.gov.cn/\" target=\"_blank\">皖ICP备05010359号-1</a></p>');
INSERT INTO `core_web_config` VALUES ('5', 'web_serviceLine', '0551-6532 9201');
INSERT INTO `core_web_config` VALUES ('7', 'web_site_logo', '20220421/27041d4584040e925628941f7f47284c.png');
INSERT INTO `core_web_config` VALUES ('8', 'web_head_javascript', '');
INSERT INTO `core_web_config` VALUES ('13', 'web_site_address', '安徽省合肥高新区创新大道2688号中新网安大厦14-16楼');
INSERT INTO `core_web_config` VALUES ('14', 'web_site_qrcode', '20220421/8517ffeff72076ab6fdd5025e1875737.jpg');
INSERT INTO `core_web_config` VALUES ('15', 'web_site_ico', '20220422/e8a2f640a1707e3e2f04854add045672.ico');
INSERT INTO `core_web_config` VALUES ('16', 'web_qq', '');
INSERT INTO `core_web_config` VALUES ('17', 'web_contact', '');
INSERT INTO `core_web_config` VALUES ('18', 'web_site_waplogo', null);
INSERT INTO `core_web_config` VALUES ('19', 'web_email', 'gzep@gzep.com.cn');
INSERT INTO `core_web_config` VALUES ('20', 'web_site_wapqrcode', null);
INSERT INTO `core_web_config` VALUES ('21', 'web_site_address_x', '117.200643');
INSERT INTO `core_web_config` VALUES ('22', 'web_site_address_y', '31.832613');

-- ----------------------------
-- Table structure for `core_wx_account`
-- ----------------------------
DROP TABLE IF EXISTS `core_wx_account`;
CREATE TABLE `core_wx_account` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `wx_name` varchar(32) DEFAULT NULL COMMENT '公众号名称',
  `appid` varchar(32) DEFAULT NULL,
  `appsecret` varchar(64) DEFAULT NULL,
  `access_token_time` int(11) DEFAULT NULL COMMENT 'token的更新时间',
  `access_token` text,
  `jsapi_ticket_time` int(11) DEFAULT NULL COMMENT 'ticket更新时间',
  `jsapi_ticket` text,
  `token` varchar(32) DEFAULT NULL COMMENT '开发者模式的token',
  `mch_id` varchar(16) DEFAULT NULL COMMENT '微信支付商户号',
  `sub_mch_id` varchar(16) DEFAULT NULL COMMENT '子商户号',
  `pay_key` varchar(32) DEFAULT NULL COMMENT '微信支付密钥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `appid` (`appid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='微信公众号';

-- ----------------------------
-- Records of core_wx_account
-- ----------------------------
INSERT INTO `core_wx_account` VALUES ('1', 'ces', '121212', '2222', null, null, null, null, null, '2222', null, '2222');

-- ----------------------------
-- Table structure for `core_wx_member`
-- ----------------------------
DROP TABLE IF EXISTS `core_wx_member`;
CREATE TABLE `core_wx_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(32) NOT NULL,
  `openid` varchar(32) NOT NULL,
  `nickname` varchar(128) NOT NULL,
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 未知 1 男 2 女',
  `country` varchar(32) NOT NULL,
  `province` varchar(32) NOT NULL,
  `city` varchar(32) NOT NULL,
  `subscribe_time` int(11) NOT NULL COMMENT '关注的时间',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '最后登录时间',
  `create_ip` varchar(20) NOT NULL,
  `update_ip` varchar(20) NOT NULL,
  `phone` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `headimgurl` varchar(512) NOT NULL COMMENT '头像地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`),
  KEY `appid` (`appid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_wx_member
-- ----------------------------
