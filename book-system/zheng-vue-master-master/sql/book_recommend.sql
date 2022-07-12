/*
 Navicat MySQL Data Transfer

 Source Server         : 47.104.206.142
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : 47.104.206.142:33060
 Source Schema         : book_recommend

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 04/05/2022 08:34:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for add_book
-- ----------------------------
DROP TABLE IF EXISTS `add_book`;
CREATE TABLE `add_book`  (
  `id` int NOT NULL COMMENT '书籍id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '书籍名称',
  `title_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '书籍地址',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作者',
  `images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '书籍图片',
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字数',
  `favorite` bigint NULL DEFAULT NULL COMMENT '收藏  0 未收藏 1 收藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of add_book
-- ----------------------------
INSERT INTO `add_book` VALUES (100382, '在别的星球上', 'https://read.douban.com/ebook/132939167/?dcs=category', '[法] 吕西安·吕都', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/132939167.jpg?v=1583479293', '15.4 万字', 1);
INSERT INTO `add_book` VALUES (103922, '春风沉醉的晚上', 'https://read.douban.com/ebook/109941313/?dcs=category', '郁达夫', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/109941313.jpg?v=1553675886', '16.6 万字', 1);
INSERT INTO `add_book` VALUES (104298, '猫城记', 'https://read.douban.com/ebook/132100579/?dcs=category', '老舍', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/132100579.jpg?v=1582860734', '8.8 万字', 0);
INSERT INTO `add_book` VALUES (108407, '中世纪之美', 'https://book.douban.com/subject/35431246/', NULL, 'https://img9.doubanio.com/view/subject/s/public/s33927714.jpg', NULL, 1);
INSERT INTO `add_book` VALUES (122879, '尊重自己：给予与接收的心灵艺术', 'https://read.douban.com/ebook/132946207/?dcs=category', '[美] 帕特里西亚·斯帕达罗', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/132946207.jpg?v=1583482041', '10.6 万字', 0);
INSERT INTO `add_book` VALUES (131490, '空间的敦煌::走近莫高窟', 'https://book.douban.com/subject/35694442/', NULL, 'https://img9.doubanio.com/view/subject/s/public/s34079984.jpg', NULL, 0);
INSERT INTO `add_book` VALUES (137020, '情商高，就是把情绪控制好', 'https://read.douban.com/ebook/106564156/?dcs=category', '于一鲁', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/106564156.jpg?v=0', '10.2 万字', 1);
INSERT INTO `add_book` VALUES (143503, '你一读就懂的逻辑学', 'https://read.douban.com/ebook/389804370/?dcs=category', '刘娴素', 'https://img3.doubanio.com/view/ark_article_cover/retina/public/389804370.jpg?v=1651212678', '10.9 万字', 0);
INSERT INTO `add_book` VALUES (150438, '与另一个世界的你相遇', 'https://read.douban.com/ebook/106563062/?dcs=category', '陈谌', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/106563062.jpg?v=0', '10.2 万字', 0);
INSERT INTO `add_book` VALUES (150743, '时短术', 'https://read.douban.com/ebook/109928873/?dcs=category', '日本生产性改善会议编', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/109928873.jpg?v=1553586447', '8.8 万字', 0);
INSERT INTO `add_book` VALUES (158819, '莎士比亚喜剧集', 'https://read.douban.com/ebook/132959046/?dcs=category', '[英] 威廉·莎士比亚', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/132959046.jpg?v=1583909422', '21.0 万字', 0);
INSERT INTO `add_book` VALUES (161330, '疯人说', 'https://read.douban.com/ebook/384926733/?dcs=category', '刘建', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/384926733.jpg?v=1651031127', '21.9 万字', 0);
INSERT INTO `add_book` VALUES (169812, '西西弗神话', 'https://read.douban.com/ebook/389553624/?dcs=category', '[法] 阿尔贝·加缪', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/389553624.jpg?v=1651111218', '6.4 万字', 0);
INSERT INTO `add_book` VALUES (170935, '追凶者之萨满疑云', 'https://read.douban.com/ebook/108146000/?dcs=category', '管彦杰', 'https://img3.doubanio.com/view/ark_article_cover/retina/public/108146000.jpg?v=1550642558', '19.6 万字', 0);
INSERT INTO `add_book` VALUES (171170, '亚历山大大帝', 'https://read.douban.com/ebook/389359243/?dcs=category', '[英] 安东尼·艾福瑞特', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/389359243.jpg?v=1651042691', '26.5 万字', 0);
INSERT INTO `add_book` VALUES (173027, '不忍不逃，正面掌控情绪', 'https://read.douban.com/ebook/132015723/?dcs=category', '[美] 贾斯汀·巴里索', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/132015723.jpg?v=1582792475', '8.6 万字', 0);
INSERT INTO `add_book` VALUES (185639, '《科幻世界·译文版》2022年2期', 'https://read.douban.com/ebook/388794804/?dcs=category', '姚海军 主编', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/388794804.jpg?v=1651024250', '20.5 万字', 0);
INSERT INTO `add_book` VALUES (194344, '华为崛起', 'https://read.douban.com/ebook/132015607/?dcs=category', '王民盛', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/132015607.jpg?v=1582794917', '15.0 万字', 0);
INSERT INTO `add_book` VALUES (195171, '霍克尼论摄影（增订本）', 'https://book.douban.com/subject/35634560/', NULL, 'https://img2.doubanio.com/view/subject/s/public/s34023401.jpg', NULL, 0);
INSERT INTO `add_book` VALUES (201832, '交换之物', 'https://read.douban.com/ebook/388757014/?dcs=category', '[美] 柯浩德（Harold J. Cook）', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/388757014.jpg?v=1650949859', '46.1 万字', 0);
INSERT INTO `add_book` VALUES (213349, '东大教授漫画日本史', 'https://read.douban.com/ebook/389803875/?dcs=category', '[日] 本乡和人', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/389803875.jpg?v=1651213161', '279 字', 0);
INSERT INTO `add_book` VALUES (218777, '这一切', 'https://read.douban.com/ebook/389835600/?dcs=category', '[美] 詹姆斯·索特', 'https://img3.doubanio.com/view/ark_article_cover/retina/public/389835600.jpg?v=1651215824', '18.2 万字', 0);
INSERT INTO `add_book` VALUES (219338, '80张地图环游世界', 'https://read.douban.com/ebook/108146239/?dcs=category', '[英] 克莱尔·希伯特（Clare Hibbert）', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/108146239.jpg?v=1550643726', '663 字', 0);
INSERT INTO `add_book` VALUES (228559, '重走：在公路、河流和驿道上寻找西南联大', 'https://book.douban.com/subject/35436901/', NULL, 'https://img1.doubanio.com/view/subject/s/public/s33878309.jpg', NULL, 0);
INSERT INTO `add_book` VALUES (240506, '微尘', 'https://book.douban.com/subject/35585201/', NULL, 'https://img9.doubanio.com/view/subject/s/public/s33985995.jpg', NULL, 0);
INSERT INTO `add_book` VALUES (247037, '《科幻世界·译文版》2021年第四季度合集（套装共三册）', 'https://read.douban.com/bundle/380324345/?dcs=category', '塞南·麦圭尔 等', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/380324345.jpg?v=1646727438', '60.6 万字', 0);
INSERT INTO `add_book` VALUES (247335, '好好告别：世界葬礼观察手记', 'https://read.douban.com/ebook/389553055/?dcs=category', '[美] 凯特琳·道蒂', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/389553055.jpg?v=1651114265', '9.3 万字', 0);
INSERT INTO `add_book` VALUES (249589, '价值规律', 'https://read.douban.com/ebook/106563877/?dcs=category', '水木然', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/106563877.jpg?v=0', '9.0 万字', 0);
INSERT INTO `add_book` VALUES (266254, '恐惧：推动全球运转的隐藏力量', 'https://read.douban.com/ebook/132100714/?dcs=category', '[英] 弗兰克·菲雷迪（Frank Furedi）', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/132100714.jpg?v=1582860176', '18.4 万字', 0);
INSERT INTO `add_book` VALUES (269045, '三国不演义（套装全三册）', 'https://read.douban.com/bundle/389089284/?dcs=category', '王觉仁', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/389089284.jpg?v=1650958116', '65.6 万字', 0);
INSERT INTO `add_book` VALUES (285890, '昨天堂', 'https://book.douban.com/subject/35567281/', NULL, 'https://img9.doubanio.com/view/subject/s/public/s33986805.jpg', NULL, 0);
INSERT INTO `add_book` VALUES (286951, '有间文库：老舍文集（套装19册）', 'https://read.douban.com/bundle/152091304/?dcs=category', '老舍', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/152091304.jpg?v=1593746421', '215 万字', 0);
INSERT INTO `add_book` VALUES (289275, '上海译文睿文馆书系精选（套装共15册）', 'https://read.douban.com/bundle/389618001/?dcs=category', '赫伯特·马尔库塞', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/389618001.jpg?v=1651129978', '373 万字', 0);
INSERT INTO `add_book` VALUES (298597, '碳中和经济学', 'https://read.douban.com/ebook/388757107/?dcs=category', '中金公司研究部', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/388757107.jpg?v=1650950121', '18.9 万字', 0);
INSERT INTO `add_book` VALUES (302238, '沟通力就是执行力', 'https://read.douban.com/ebook/106563647/?dcs=category', '赵伟', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/106563647.jpg?v=0', '10.3 万字', 0);
INSERT INTO `add_book` VALUES (309347, '量子传', 'https://read.douban.com/ebook/389359163/?dcs=category', '[英] 曼吉特·库马尔', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/389359163.jpg?v=1651043224', '29.4 万字', 0);
INSERT INTO `add_book` VALUES (311272, '情商高，就是把情绪控制好', 'https://read.douban.com/ebook/132016065/?dcs=category', '于一鲁', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/132016065.jpg?v=1582856426', '9.8 万字', 0);
INSERT INTO `add_book` VALUES (321664, '猫咪海洋简史', 'https://read.douban.com/ebook/109929267/?dcs=category', '[澳] 菲利帕·桑德尔 著', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/109929267.jpg?v=1553585828', '8.1 万字', 0);
INSERT INTO `add_book` VALUES (324609, '你有多凶猛，世界就有多软弱', 'https://read.douban.com/ebook/106564615/?dcs=category', '眠眠', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/106564615.jpg?v=0', '10.5 万字', 0);
INSERT INTO `add_book` VALUES (336559, '《科幻世界》2021年全年合集（套装共12册）', 'https://read.douban.com/bundle/380321973/?dcs=category', '拉兹 主编', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/380321973.jpg?v=1646726759', '133 万字', 0);
INSERT INTO `add_book` VALUES (336819, '褚时健传（修订版）', 'https://read.douban.com/ebook/389376638/?dcs=category', '周桦', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/389376638.jpg?v=1651044567', '32.9 万字', 0);
INSERT INTO `add_book` VALUES (351640, '大势将至，未来已来', 'https://read.douban.com/ebook/108145880/?dcs=category', '王鹏', 'https://img3.doubanio.com/view/ark_article_cover/retina/public/108145880.jpg?v=1550641653', '11.4 万字', 0);
INSERT INTO `add_book` VALUES (356180, '技术大全', 'https://read.douban.com/ebook/389835324/?dcs=category', '[波兰] 斯坦尼斯瓦夫·莱姆', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/389835324.jpg?v=1651218180', '36.1 万字', 0);
INSERT INTO `add_book` VALUES (372708, '和孩子共读的国学启蒙：声律启蒙', 'https://read.douban.com/ebook/106564904/?dcs=category', '[清]车万育', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/106564904.jpg?v=0', '4.0 万字', 0);
INSERT INTO `add_book` VALUES (372714, '销售就是会谈判', 'https://read.douban.com/ebook/132101381/?dcs=category', '陈兴华', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/132101381.jpg?v=1582876241', '9.5 万字', 0);
INSERT INTO `add_book` VALUES (377848, '掌握分布式跟踪：微服务和复杂系统性能分析', 'https://read.douban.com/ebook/386396938/?dcs=category', '[美] 尤里·史库罗（Yuri Shkuro）', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/386396938.jpg?v=1650527603', '17.4 万字', 0);
INSERT INTO `add_book` VALUES (386436, '不焦虑了', 'https://read.douban.com/ebook/118555492/?dcs=category', '[日] 安藤俊介', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/118555492.jpg?v=1560756259', '5.7 万字', 0);
INSERT INTO `add_book` VALUES (396180, '明帝国与倭寇', 'https://read.douban.com/ebook/389580107/?dcs=category', '[日] 三田村泰助', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/389580107.jpg?v=1651123676', '16.0 万字', 1);
INSERT INTO `add_book` VALUES (401331, '三国演义', 'https://book.douban.com/subject/35634560/', '曹雪芹', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/106573703.jpg?v=0', '15.5', 0);
INSERT INTO `add_book` VALUES (409646, '弥散的心智', 'https://read.douban.com/ebook/118556191/?dcs=category', '[意] 里卡多·曼佐蒂', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/118556191.jpg?v=1560908729', '19.3 万字', 0);
INSERT INTO `add_book` VALUES (409941, '朝花夕拾', 'https://read.douban.com/ebook/121007781/?dcs=category', '鲁迅', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/121007781.jpg?v=1563940389', '11.3 万字', 0);
INSERT INTO `add_book` VALUES (411807, '镜花缘（全三册）', 'https://read.douban.com/ebook/132015840/?dcs=category', '（清）李汝珍', 'https://img3.doubanio.com/view/ark_article_cover/retina/public/132015840.jpg?v=1582801121', '44.6 万字', 0);
INSERT INTO `add_book` VALUES (413648, '三精管理', 'https://read.douban.com/ebook/389602455/?dcs=category', '宋志平', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/389602455.jpg?v=1651126256', '15.1 万字', 0);
INSERT INTO `add_book` VALUES (418101, '生物性思维', 'https://read.douban.com/ebook/389350005/?dcs=category', '[美] 艾伦·贾萨诺夫', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/389350005.jpg?v=1651039337', '17.9 万字', 0);
INSERT INTO `add_book` VALUES (432078, '春天终将来临：大卫·霍克尼在诺曼底', 'https://book.douban.com/subject/35713902/', NULL, 'https://img1.doubanio.com/view/subject/s/public/s34078008.jpg', NULL, 0);
INSERT INTO `add_book` VALUES (437458, '效率红利', 'https://read.douban.com/ebook/389602568/?dcs=category', '谢春霖', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/389602568.jpg?v=1651127359', '16.2 万字', 0);
INSERT INTO `add_book` VALUES (448950, '大话中国艺术史', 'https://book.douban.com/subject/35747488/', NULL, 'https://img2.doubanio.com/view/subject/s/public/s34103893.jpg', NULL, 1);
INSERT INTO `add_book` VALUES (452495, '心静的力量', 'https://read.douban.com/ebook/118557160/?dcs=category', '[美] 拿破仑·希尔', 'https://img3.doubanio.com/view/ark_article_cover/retina/public/118557160.jpg?v=1560914225', '14.8 万字', 0);
INSERT INTO `add_book` VALUES (461566, '我的前半生（全本）', 'https://read.douban.com/ebook/132101658/?dcs=category', '爱新觉罗·溥仪', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/132101658.jpg?v=1582876086', '42.9 万字', 0);
INSERT INTO `add_book` VALUES (467464, '二十四节气七十二候', 'https://read.douban.com/ebook/389804764/?dcs=category', '徐立京 著', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/389804764.jpg?v=1651216710', '14.0 万字', 0);
INSERT INTO `add_book` VALUES (467576, '和你的情绪聊聊天', 'https://read.douban.com/ebook/389101061/?dcs=category', '[日] 小池龙之介', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/389101061.jpg?v=1650962272', '4.0 万字', 0);
INSERT INTO `add_book` VALUES (473802, '内向者优势', 'https://read.douban.com/ebook/106570049/?dcs=category', '赵静', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/106570049.jpg?v=0', '9.8 万字', 0);
INSERT INTO `add_book` VALUES (475713, '任正非：除了胜利，我们已无路可走', 'https://read.douban.com/ebook/106564782/?dcs=category', '周显亮', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/106564782.jpg?v=0', '12.0 万字', 0);
INSERT INTO `add_book` VALUES (486438, '局外人', 'https://read.douban.com/ebook/389574837/?dcs=category', '[法] 阿尔贝·加缪', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/389574837.jpg?v=1651115875', '5.2 万字', 0);
INSERT INTO `add_book` VALUES (501237, '狗与花椒树女王口述史', 'https://read.douban.com/ebook/118555286/?dcs=category', '王静文', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/118555286.jpg?v=1560757696', '11.0 万字', 0);
INSERT INTO `add_book` VALUES (510240, '声色野记', 'https://read.douban.com/ebook/108145756/?dcs=category', '侯磊', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/108145756.jpg?v=1550640985', '10.8 万字', 0);
INSERT INTO `add_book` VALUES (519526, '科幻世界·2022年02月', 'https://read.douban.com/ebook/388794908/?dcs=category', '归芜 等', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/388794908.jpg?v=1650959787', '11.0 万字', 0);
INSERT INTO `add_book` VALUES (521005, '《科幻世界·译文版》2021年全年合集（套装共12册）', 'https://read.douban.com/bundle/380325029/?dcs=category', '姚海军 主编', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/380325029.jpg?v=1646727697', '243 万字', 0);
INSERT INTO `add_book` VALUES (528732, '做世间淡定优雅的女子', 'https://read.douban.com/ebook/106566300/?dcs=category', '吕夏乔', 'https://img3.doubanio.com/view/ark_article_cover/retina/public/106566300.jpg?v=0', '15.9 万字', 0);
INSERT INTO `add_book` VALUES (538241, '请带我回家', 'https://read.douban.com/ebook/108146116/?dcs=category', '[英] 布里特·科林斯（Britt Collins）', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/108146116.jpg?v=1550642106', '13.3 万字', 0);
INSERT INTO `add_book` VALUES (539737, '时间不够用，现在就行动', 'https://read.douban.com/ebook/106562741/?dcs=category', '曹国记', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/106562741.jpg?v=0', '9.7 万字', 0);
INSERT INTO `add_book` VALUES (541978, '中国通史', 'https://read.douban.com/ebook/132943016/?dcs=category', '吕思勉', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/132943016.jpg?v=1583480702', '37.9 万字', 0);
INSERT INTO `add_book` VALUES (543147, '《科幻世界·译文版》2022年1期（赛博朋克专辑）', 'https://read.douban.com/ebook/388795025/?dcs=category', '姚海军 主编', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/388795025.jpg?v=1650966148', '18.5 万字', 0);
INSERT INTO `add_book` VALUES (546479, '《科幻世界》2021年第四季度合集（套装共三册）', 'https://read.douban.com/bundle/380323957/?dcs=category', '任青 等', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/380323957.jpg?v=1646727221', '33.4 万字', 0);
INSERT INTO `add_book` VALUES (557481, '科幻世界·2022年01月', 'https://read.douban.com/ebook/388794707/?dcs=category', '江波 等', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/388794707.jpg?v=1650942915', '11.2 万字', 0);
INSERT INTO `add_book` VALUES (564392, '你的猫尝起来是甜的', 'https://read.douban.com/ebook/106564216/?dcs=category', '田可乐', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/106564216.jpg?v=0', '9.0 万字', 0);
INSERT INTO `add_book` VALUES (571837, '和孩子共读的国学启蒙（套装共2册）', 'https://read.douban.com/bundle/106573703/?dcs=category', '[清]李渔', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/106573703.jpg?v=0', '8.3 万字', 0);
INSERT INTO `add_book` VALUES (572547, '别让好脾气害了你', 'https://read.douban.com/ebook/106564067/?dcs=category', '周维丽', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/106564067.jpg?v=0', '9.1 万字', 0);
INSERT INTO `add_book` VALUES (574378, '讲给大家的中国历史11', 'https://read.douban.com/ebook/389349850/?dcs=category', '杨照', 'https://img3.doubanio.com/view/ark_article_cover/retina/public/389349850.jpg?v=1651038850', '12.8 万字', 0);
INSERT INTO `add_book` VALUES (581453, '我本芬芳', 'https://book.douban.com/subject/35695541/', NULL, 'https://img2.doubanio.com/view/subject/s/public/s34072342.jpg', NULL, 0);
INSERT INTO `add_book` VALUES (584950, '流浪图书馆', 'https://read.douban.com/ebook/132016299/?dcs=category', '[英] 大卫·怀特豪斯', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/132016299.jpg?v=1582801710', '13.5 万字', 0);
INSERT INTO `add_book` VALUES (586719, '密西西比河某处', 'https://book.douban.com/subject/35691416/', NULL, 'https://img9.doubanio.com/view/subject/s/public/s34061816.jpg', NULL, 0);
INSERT INTO `add_book` VALUES (587720, '笑对无礼之人', 'https://read.douban.com/ebook/389782658/?dcs=category', '[韩] 郑文正', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/389782658.jpg?v=1651196876', '6.9 万字', 0);
INSERT INTO `add_book` VALUES (606446, '历史：终结之前的最终事', 'https://read.douban.com/ebook/387948762/?dcs=category', '[德] 齐格弗里德·克拉考尔（Siegfried Kracauer）', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/387948762.jpg?v=1650608619', '16.7 万字', 0);
INSERT INTO `add_book` VALUES (610937, '好兵帅克', 'https://read.douban.com/ebook/132016530/?dcs=category', '[捷克] 雅·哈谢克', 'https://img3.doubanio.com/view/ark_article_cover/retina/public/132016530.jpg?v=1582794139', '14.6 万字', 0);
INSERT INTO `add_book` VALUES (612597, '喝掉这“罐”书', 'https://read.douban.com/ebook/118555809/?dcs=category', '阿米殿下', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/118555809.jpg?v=1560824650', '11.2 万字', 0);
INSERT INTO `add_book` VALUES (616658, '为何母爱会伤人', 'https://read.douban.com/ebook/132101008/?dcs=category', '[美] 贾丝明·李·科里', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/132101008.jpg?v=1582871985', '13.7 万字', 0);
INSERT INTO `add_book` VALUES (619648, '读库2201', 'https://book.douban.com/subject/35706351/', NULL, 'https://img1.doubanio.com/view/subject/s/public/s34092307.jpg', NULL, 0);
INSERT INTO `add_book` VALUES (630975, '呼兰河传', 'https://read.douban.com/ebook/109941566/?dcs=category', '萧红', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/109941566.jpg?v=1553667994', '9.7 万字', 1);
INSERT INTO `add_book` VALUES (645244, '奈良美智：始于空无一物的世界：始于空无一物的世界', 'https://book.douban.com/subject/35455233/', NULL, 'https://img1.doubanio.com/view/subject/s/public/s34055617.jpg', NULL, 0);
INSERT INTO `add_book` VALUES (657067, '活着就是冲天一喊', 'https://book.douban.com/subject/35498378/', NULL, 'https://img2.doubanio.com/view/subject/s/public/s33923642.jpg', NULL, 0);
INSERT INTO `add_book` VALUES (657718, '看人心理学', 'https://read.douban.com/ebook/106562666/?dcs=category', '赵育宁', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/106562666.jpg?v=0', '9.9 万字', 0);
INSERT INTO `add_book` VALUES (666274, '莎士比亚悲剧集', 'https://read.douban.com/ebook/132938884/?dcs=category', '[英] 威廉·莎士比亚', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/132938884.jpg?v=1583485430', '27.9 万字', 0);
INSERT INTO `add_book` VALUES (672606, '人的潜能和价值', 'https://read.douban.com/ebook/389804479/?dcs=category', '[美] 亚伯拉罕·马斯洛 等', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/389804479.jpg?v=1651211790', '13.3 万字', 0);
INSERT INTO `add_book` VALUES (674493, '癌症传：众病之王（新版）', 'https://read.douban.com/ebook/389803522/?dcs=category', '[美] 悉达多·穆克吉', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/389803522.jpg?v=1651211178', '41.3 万字', 0);
INSERT INTO `add_book` VALUES (675557, '少有人看见的美', 'https://read.douban.com/ebook/132101815/?dcs=category', '熊逸', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/132101815.jpg?v=1582868271', '11.5 万字', 0);
INSERT INTO `add_book` VALUES (685435, '四万万顾客', 'https://read.douban.com/ebook/389381076/?dcs=category', '[美] 卡尔·克劳', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/389381076.jpg?v=1651045746', '15.3 万字', 0);
INSERT INTO `add_book` VALUES (687347, '我将宇宙随身携带：佩索阿诗集：佩索阿诗集', 'https://book.douban.com/subject/35430137/', NULL, 'https://img1.doubanio.com/view/subject/s/public/s33959398.jpg', NULL, 0);
INSERT INTO `add_book` VALUES (697125, '得半日之闲，抵十年尘梦', 'https://read.douban.com/ebook/53895307/?dcs=category', '周作人', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/53895307.jpg?v=0', '6.7 万字', 0);
INSERT INTO `add_book` VALUES (697190, '22款传奇球鞋的前世今生', 'https://read.douban.com/ebook/383037035/?dcs=category', '黄贺', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/383037035.jpg?v=1651049410', '9.1 万字', 0);
INSERT INTO `add_book` VALUES (698418, '能力变现', 'https://read.douban.com/ebook/106564834/?dcs=category', '林宣', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/106564834.jpg?v=0', '9.1 万字', 0);
INSERT INTO `add_book` VALUES (698938, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `add_book` VALUES (700519, '局外人', 'https://read.douban.com/ebook/132100435/?dcs=category', '[法] 阿尔贝·加缪（Albert Camus）', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/132100435.jpg?v=1582858908', '5.9 万字', 0);
INSERT INTO `add_book` VALUES (706079, '《科幻世界·译文版》2021年12期', 'https://read.douban.com/ebook/388795130/?dcs=category', '姚海军 主编', 'https://img3.doubanio.com/view/ark_article_cover/retina/public/388795130.jpg?v=1650963728', '19.9 万字', 0);
INSERT INTO `add_book` VALUES (713446, '读库2202', 'https://book.douban.com/subject/35797195/', NULL, 'https://img1.doubanio.com/view/subject/s/public/s34146288.jpg', NULL, 0);
INSERT INTO `add_book` VALUES (725352, '午夜降临前抵达', 'https://book.douban.com/subject/35522033/', NULL, 'https://img1.doubanio.com/view/subject/s/public/s33955237.jpg', NULL, 0);
INSERT INTO `add_book` VALUES (732056, '苏特里', 'https://read.douban.com/ebook/389835501/?dcs=category', '[美] 科马克·麦卡锡', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/389835501.jpg?v=1651216099', '31.2 万字', 0);
INSERT INTO `add_book` VALUES (732202, '诗人的意大利之旅', 'https://book.douban.com/subject/34857521/', NULL, 'https://img2.doubanio.com/view/subject/s/public/s34146022.jpg', NULL, 0);
INSERT INTO `add_book` VALUES (744190, '我们内心的“坏东西”', 'https://read.douban.com/ebook/132101267/?dcs=category', '[英] 蒂凡尼·瓦特·史密斯', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/132101267.jpg?v=1582875300', '7.5 万字', 0);
INSERT INTO `add_book` VALUES (752241, '王阳明：一切心法', 'https://read.douban.com/ebook/132100963/?dcs=category', '熊逸', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/132100963.jpg?v=1582871261', '36.1 万字', 0);
INSERT INTO `add_book` VALUES (762992, '你的能力，要学会用故事讲出来', 'https://read.douban.com/ebook/106569947/?dcs=category', '王小辉', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/106569947.jpg?v=0', '10.0 万字', 0);
INSERT INTO `add_book` VALUES (768411, '人是一根会思考的芦苇', 'https://read.douban.com/ebook/132100613/?dcs=category', '[法] 帕斯卡', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/132100613.jpg?v=1582863010', '8.9 万字', 0);
INSERT INTO `add_book` VALUES (809807, '情感心理学', 'https://read.douban.com/ebook/132015964/?dcs=category', '何丽娟', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/132015964.jpg?v=1582856025', '8.0 万字', 0);
INSERT INTO `add_book` VALUES (810089, '宇宙小史', 'https://read.douban.com/ebook/389356568/?dcs=category', '[美] 莱曼·佩奇', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/389356568.jpg?v=1651043739', '8.2 万字', 0);
INSERT INTO `add_book` VALUES (816304, '你坚持的原则其实害了你', 'https://read.douban.com/ebook/106570156/?dcs=category', '[日] 午堂登纪雄', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/106570156.jpg?v=0', '6.9 万字', 0);
INSERT INTO `add_book` VALUES (821253, '你是你最好的明天', 'https://read.douban.com/ebook/132016367/?dcs=category', '张西', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/132016367.jpg?v=1582855489', '6.4 万字', 0);
INSERT INTO `add_book` VALUES (828986, '江山如画：中国古代山水志', 'https://read.douban.com/ebook/132016630/?dcs=category', '吴树强 编撰', 'https://img3.doubanio.com/view/ark_article_cover/retina/public/132016630.jpg?v=1582797376', '9.0 万字', 0);
INSERT INTO `add_book` VALUES (829859, '和孩子共读的国学启蒙：笠翁对韵', 'https://read.douban.com/ebook/106563278/?dcs=category', '[清]李渔', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/106563278.jpg?v=0', '4.2 万字', 0);
INSERT INTO `add_book` VALUES (836071, '俗女养成记', 'https://book.douban.com/subject/35608319/', NULL, 'https://img9.doubanio.com/view/subject/s/public/s34006244.jpg', NULL, 0);
INSERT INTO `add_book` VALUES (841827, '疼', 'https://read.douban.com/ebook/118556609/?dcs=category', '孙频', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/118556609.jpg?v=1560909873', '15.2 万字', 0);
INSERT INTO `add_book` VALUES (843205, '海之滨', 'https://read.douban.com/ebook/109928965/?dcs=category', '[美 ] 蕾切尔·卡森', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/109928965.jpg?v=1553587260', '12.4 万字', 0);
INSERT INTO `add_book` VALUES (867065, '惊呆了！经济学超简单', 'https://read.douban.com/ebook/389574628/?dcs=category', '[日] 泉美智子', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/389574628.jpg?v=1651116840', '3.3 万字', 0);
INSERT INTO `add_book` VALUES (875574, '优秀的人从来不会输在表达上', 'https://read.douban.com/ebook/106562896/?dcs=category', '王鹏', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/106562896.jpg?v=0', '9.9 万字', 0);
INSERT INTO `add_book` VALUES (890358, '中国绘画：远古至唐', 'https://book.douban.com/subject/35812422/', NULL, 'https://img2.doubanio.com/view/subject/s/public/s34158331.jpg', NULL, 0);
INSERT INTO `add_book` VALUES (903234, '迷人的误解', 'https://read.douban.com/ebook/132101589/?dcs=category', '[美] 安德鲁·斯托曼（Andrew Shtulman）', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/132101589.jpg?v=1582861761', '17.2 万字', 0);
INSERT INTO `add_book` VALUES (924854, '新史纪丛书·聊出来的三国：蜀汉兵革', 'https://read.douban.com/ebook/389782786/?dcs=category', '锋云', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/389782786.jpg?v=1651200716', '18.7 万字', 0);
INSERT INTO `add_book` VALUES (927495, '傻子的骨头', 'https://read.douban.com/ebook/109929170/?dcs=category', '刘宇', 'https://img3.doubanio.com/view/ark_article_cover/retina/public/109929170.jpg?v=1553586085', '10.5 万字', 0);
INSERT INTO `add_book` VALUES (927927, '天才程序员：技术狂人如何改变世界', 'https://read.douban.com/ebook/389356669/?dcs=category', '[美] 克拉夫·汤普森', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/389356669.jpg?v=1651039559', '22.3 万字', 0);
INSERT INTO `add_book` VALUES (931664, '人间修炼指南', 'https://read.douban.com/ebook/389100872/?dcs=category', '半佛仙人', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/389100872.jpg?v=1650961463', '14.4 万字', 0);
INSERT INTO `add_book` VALUES (939916, '高情商，掌控完美情感', 'https://read.douban.com/ebook/106563545/?dcs=category', '天晴', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/106563545.jpg?v=0', '10.1 万字', 0);
INSERT INTO `add_book` VALUES (955882, '一个女人的成长', 'https://read.douban.com/ebook/109929017/?dcs=category', '薇薇夫人', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/109929017.jpg?v=1553585866', '9.5 万字', 0);
INSERT INTO `add_book` VALUES (960128, '约翰·克利斯朵夫（套装全四册）', 'https://read.douban.com/ebook/133040686/?dcs=category', '[法] 罗曼·罗兰', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/133040686.jpg?v=1583558201', '99.0 万字', 0);
INSERT INTO `add_book` VALUES (960823, '管团队管的就是执行力', 'https://read.douban.com/ebook/106563708/?dcs=category', '高朋', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/106563708.jpg?v=0', '9.9 万字', 0);
INSERT INTO `add_book` VALUES (960955, '前男友的遗书', 'https://read.douban.com/ebook/389100994/?dcs=category', '[日] 新川帆立', 'https://img9.doubanio.com/view/ark_article_cover/retina/public/389100994.jpg?v=1650961679', '11.3 万字', 0);
INSERT INTO `add_book` VALUES (963253, '战胜心魔', 'https://read.douban.com/ebook/118557511/?dcs=category', '[美] 拿破仑·希尔', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/118557511.jpg?v=1560915110', '12.3 万字', 0);
INSERT INTO `add_book` VALUES (963507, '女人，过好自己最重要', 'https://read.douban.com/ebook/108145951/?dcs=category', '小田栗', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/108145951.jpg?v=1550642895', '7.3 万字', 0);
INSERT INTO `add_book` VALUES (972145, '硅谷密码', 'https://read.douban.com/ebook/388756947/?dcs=category', '[美] 玛格丽特·奥马拉', 'https://img1.doubanio.com/view/ark_article_cover/retina/public/388756947.jpg?v=1650950775', '35.5 万字', 0);
INSERT INTO `add_book` VALUES (976633, '高效学习', 'https://read.douban.com/ebook/389349771/?dcs=category', '[日] 西冈一诚', 'https://img2.doubanio.com/view/ark_article_cover/retina/public/389349771.jpg?v=1651038544', '7.4 万字', 0);
INSERT INTO `add_book` VALUES (981703, '黄渤说话有道', 'https://read.douban.com/ebook/118555750/?dcs=category', '刘瑞江', 'https://img3.doubanio.com/view/ark_article_cover/retina/public/118555750.jpg?v=1560825659', '13.9 万字', 0);

-- ----------------------------
-- Table structure for book_data
-- ----------------------------
DROP TABLE IF EXISTS `book_data`;
CREATE TABLE `book_data`  (
  `book_id` int NOT NULL COMMENT '编号',
  `user_id` int NULL DEFAULT NULL COMMENT '用户编号',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `score` double NULL DEFAULT NULL COMMENT '评分',
  `title_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
  `collect` int NULL DEFAULT 0 COMMENT '收藏 0 是 1 否',
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_data
-- ----------------------------
INSERT INTO `book_data` VALUES (108407, 8974374, '中世纪之美', 3.3, 'https://book.douban.com/subject/35431246/', 'https://img9.doubanio.com/view/subject/s/public/s33927714.jpg', 1);
INSERT INTO `book_data` VALUES (131490, 5763355, '空间的敦煌：走近莫高窟', 3.7, 'https://book.douban.com/subject/35694442/', 'https://img9.doubanio.com/view/subject/s/public/s34079984.jpg', 1);
INSERT INTO `book_data` VALUES (195171, 2517935, '霍克尼论摄影（增订本）', 3.7, 'https://book.douban.com/subject/35634560/', 'https://img2.doubanio.com/view/subject/s/public/s34023401.jpg', 0);
INSERT INTO `book_data` VALUES (228559, 5254082, '重走：在公路、河流和驿道上寻找西南联大', 4, 'https://book.douban.com/subject/35436901/', 'https://img1.doubanio.com/view/subject/s/public/s33878309.jpg', 0);
INSERT INTO `book_data` VALUES (240506, 8233260, '微尘', 3.3, 'https://book.douban.com/subject/35585201/', 'https://img9.doubanio.com/view/subject/s/public/s33985995.jpg', 0);
INSERT INTO `book_data` VALUES (285890, 1143088, '昨天堂', 3.3, 'https://book.douban.com/subject/35567281/', 'https://img9.doubanio.com/view/subject/s/public/s33986805.jpg', 0);
INSERT INTO `book_data` VALUES (432078, 2093219, '春天终将来临：大卫·霍克尼在诺曼底', 4.2, 'https://book.douban.com/subject/35713902/', 'https://img1.doubanio.com/view/subject/s/public/s34078008.jpg', 0);
INSERT INTO `book_data` VALUES (448950, 7903310, '大话中国艺术史', 3.2, 'https://book.douban.com/subject/35747488/', 'https://img2.doubanio.com/view/subject/s/public/s34103893.jpg', 0);
INSERT INTO `book_data` VALUES (581453, 3602615, '我本芬芳', 3.2, 'https://book.douban.com/subject/35695541/', 'https://img2.doubanio.com/view/subject/s/public/s34072342.jpg', 0);
INSERT INTO `book_data` VALUES (586719, 3716975, '密西西比河某处', 4.8, 'https://book.douban.com/subject/35691416/', 'https://img9.doubanio.com/view/subject/s/public/s34061816.jpg', 0);
INSERT INTO `book_data` VALUES (619648, 5035991, '读库2201', 2.6, 'https://book.douban.com/subject/35706351/', 'https://img1.doubanio.com/view/subject/s/public/s34092307.jpg', 0);
INSERT INTO `book_data` VALUES (645244, 4981141, '奈良美智：始于空无一物的世界：始于空无一物的世界', 4.2, 'https://book.douban.com/subject/35455233/', 'https://img1.doubanio.com/view/subject/s/public/s34055617.jpg', 0);
INSERT INTO `book_data` VALUES (657067, 2749635, '活着就是冲天一喊', 3.1, 'https://book.douban.com/subject/35498378/', 'https://img2.doubanio.com/view/subject/s/public/s33923642.jpg', 0);
INSERT INTO `book_data` VALUES (687347, 1948309, '我将宇宙随身携带：佩索阿诗集：佩索阿诗集', 3.6, 'https://book.douban.com/subject/35430137/', 'https://img1.doubanio.com/view/subject/s/public/s33959398.jpg', 0);
INSERT INTO `book_data` VALUES (713446, 1817265, '读库2202', 3.3, 'https://book.douban.com/subject/35797195/', 'https://img1.doubanio.com/view/subject/s/public/s34146288.jpg', 0);
INSERT INTO `book_data` VALUES (725352, 8116416, '午夜降临前抵达', 3.1, 'https://book.douban.com/subject/35522033/', 'https://img1.doubanio.com/view/subject/s/public/s33955237.jpg', 0);
INSERT INTO `book_data` VALUES (732202, 3587535, '诗人的意大利之旅', 2.6, 'https://book.douban.com/subject/34857521/', 'https://img2.doubanio.com/view/subject/s/public/s34146022.jpg', 0);
INSERT INTO `book_data` VALUES (836071, 1636657, '俗女养成记', 3.3, 'https://book.douban.com/subject/35608319/', 'https://img9.doubanio.com/view/subject/s/public/s34006244.jpg', 0);
INSERT INTO `book_data` VALUES (890358, 8723270, '中国绘画：远古至唐', 4, 'https://book.douban.com/subject/35812422/', 'https://img2.doubanio.com/view/subject/s/public/s34158331.jpg', 0);

-- ----------------------------
-- Table structure for recommend_results
-- ----------------------------
DROP TABLE IF EXISTS `recommend_results`;
CREATE TABLE `recommend_results`  (
  `book_id` int NOT NULL COMMENT '书籍编号',
  `user_id` int NULL DEFAULT NULL COMMENT '用户编号',
  `score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评分',
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recommend_results
-- ----------------------------
INSERT INTO `recommend_results` VALUES (131490, 5763355, '3.7');
INSERT INTO `recommend_results` VALUES (195171, 2517935, '3.7');
INSERT INTO `recommend_results` VALUES (228559, 5254082, '4.0');
INSERT INTO `recommend_results` VALUES (240506, 8233260, '3.3');
INSERT INTO `recommend_results` VALUES (285890, 1143088, '3.3');
INSERT INTO `recommend_results` VALUES (432078, 2093219, '4.2');
INSERT INTO `recommend_results` VALUES (448950, 7903310, '3.2');
INSERT INTO `recommend_results` VALUES (581453, 3602615, '3.2');
INSERT INTO `recommend_results` VALUES (586719, 3716975, '4.8');
INSERT INTO `recommend_results` VALUES (619648, 5035991, '2.6');
INSERT INTO `recommend_results` VALUES (645244, 4981141, '4.2');
INSERT INTO `recommend_results` VALUES (657067, 2749635, '3.1');
INSERT INTO `recommend_results` VALUES (687347, 1948309, '3.6');
INSERT INTO `recommend_results` VALUES (713446, 1817265, '3.3');
INSERT INTO `recommend_results` VALUES (725352, 8116416, '3.1');
INSERT INTO `recommend_results` VALUES (732202, 3587535, '2.6');
INSERT INTO `recommend_results` VALUES (836071, 1636657, '3.3');
INSERT INTO `recommend_results` VALUES (890358, 8723270, '4.0');

-- ----------------------------
-- Table structure for user_score
-- ----------------------------
DROP TABLE IF EXISTS `user_score`;
CREATE TABLE `user_score`  (
  `book_id` int NOT NULL COMMENT '书籍名称',
  `user_id` int NULL DEFAULT NULL COMMENT '用户名称',
  `data` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评分日期',
  `score` int NULL DEFAULT NULL COMMENT '评分数',
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_score
-- ----------------------------
INSERT INTO `user_score` VALUES (123, 123, '1', 22);

SET FOREIGN_KEY_CHECKS = 1;
