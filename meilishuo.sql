DROP DATABASE IF EXISTS meilishuo;
CREATE DATABASE meilishuo CHARSET=UTF8;
USE meilishuo;

#用户表
CREATE TABLE mls_user(
	uid INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(32) UNIQUE,
    upwd VARCHAR(32),
    user_phone VARCHAR(16) UNIQUE,
	avatar VARCHAR(128),
    email VARCHAR(64) UNIQUE,
    user_name VARCHAR(32),
    gender TINYINT
);
INSERT INTO mls_user VALUES(null,'tom','123456','18815597006','img/avatar/default.jpg','132456@qq.com','xiaoming',1);
INSERT INTO mls_user VALUES(null,'lucy','123456','18815527006','img/avatar/default.jpg','13256@qq.com','xiaoming',0);
INSERT INTO mls_user VALUES(null,'candy','123456','18815537006','img/avatar/default.jpg','12456@qq.com','xiaoming',0);
INSERT INTO mls_user VALUES(null,'xixi','123456','18815547006','img/avatar/default.jpg','1456@qq.com','xiaoming',1);
INSERT INTO mls_user VALUES(null,'haha','123456','18815517006','img/avatar/default.jpg','1326@qq.com','xiaoming',0);

#首页轮播图表
CREATE TABLE mls_index_carousel(
	cid INT PRIMARY KEY AUTO_INCREMENT,
    imgUrl VARCHAR(128)
);
INSERT INTO mls_index_carousel VALUES
(null,'img/banner/banner1_1200x400.jpg'),
(null,'img/banner/banner2_1200x400.jpg'),
(null,'img/banner/banner3_1200x400.jpg');

CREATE TABLE mls_product_family(
	fid INT PRIMARY KEY AUTO_INCREMENT,
	fname VARCHAR(32)
);
INSERT INTO mls_product_family VALUES
(null,'clothing'),
(null,'skirt'),
(null,'trousers'),
(null,'shoes'),
(null,'bags'),
(null,'accessories'),
(null,'magic'),
(null,'men'),
(null,'children'),
(null,'home');

CREATE TABLE mls_store(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	sname VARCHAR(64),
	describe_score DECIMAL(3,2),
	price_score DECIMAL(3,2),
	quality_score DECIMAL(3,2),
	serve_score DECIMAL(3,2),
	store_bimg VARCHAR(128),
	store_simg VARCHAR(128)
);
INSERT INTO mls_store VALUES
(null,'美丽优选',4.58,4.64,4.56,4.62,'img/shop/lg/shop_mlyx_2000x120.png','img/shop/sm/meiliyouxuan_100x100.jpg'),
(null,'LRUD原创女装旗舰店',4.58,4.57,5.00,4.69,'img/shop/lg/lrud_1920x150.jpg','img/shop/sm/lrud_100x100.jpg');

CREATE TABLE mls_product(
	pid INT PRIMARY KEY AUTO_INCREMENT,
	family_id INT,
	store_id INT,
	title VARCHAR(128),
	price DECIMAL(10,2),
	spec VARCHAR(64),
	is_onsale BOOLEAN, #优惠
	shelf_time BIGINT,
	inventory INT,     #库存
	sold_count INT,	   #销量
	favorite INT,	   #收藏
    seq_recommended INT,
    seq_new_arrival INT,
    seq_top_sale INT
);
INSERT INTO mls_product VALUES
(null, 1, 1, '2017春秋新款韩版小蜜蜂刺绣中长款针织开衫女宽松毛衣外套潮', '49.00', '均码',  1, 1500704637838, 15, 179, 29,15,3,1),
(null, 1, 1, '秋冬新款女装甜美百搭时尚粗毛线衣韩版学生闺蜜装复古针织衫毛衣', '59.00', '均码',  1, 1490744637838, 15, 11, 229,10,13,3),
(null, 2, 2, '学院风可爱长袖毛衣2017秋冬新款波浪纹圆领套头毛衣', '89.00', '均码',  0, 1485744637838, 344, 1649, 299,7,2,2),
(null, 3, 2, '2017百搭款不挑人针织阔腿裤女复古高腰宽松九分裤休闲裤', '69.00', '均码', 1, 1497446370838, 201, 140, 661,9,12,13),
(null, 3, 2, '不抽丝 打底裤女加绒黑色秋冬外穿显瘦韩系高腰小脚裤九分裤子女', '39.00', '均码',  1, 1500004637838, 201, 62, 61,3,1,16),
(null, 4, 2, '过膝长靴长筒靴子女秋冬款2017新款平底百搭增高显瘦高筒弹力', '79.00', '均码',  1, 1490666637838, 21, 142, 161,1,11,7),
(null, 4, 2, '秋冬季新款加绒马丁靴女短靴平底复古英伦风韩版百搭磨砂靴子女鞋', '69.30', '37',  1, 1510730215838, 201, 1302, 6,12,4,12),
(null, 4, 2, '女靴子春秋新款真皮英伦风复古马丁靴百搭粗跟厚底冬季加绒短靴', '109.80', '均码', 1, 1502544637838, 201, 112, 11,8,10,11),
(null, 5, 2, '包包女2017新款潮韩版简约百搭大气单肩斜挎包chic链条包', '69.30', '均码', 1, 1490744615438, 201, 1462, 31,14,17,15),
(null, 5, 2, '2017新款包包女韩版时尚宽肩带复古皮带水桶包百搭单肩斜挎包', '99.00', '均码', 1, 1502544637838, 201, 122, 661,17,8,8),
(null, 6, 2, '46款日韩版时尚简约长款耳钉女士韩国气质甜美耳环耳饰配饰', '6.90', '均码', 0, 1510744630000, 201, 140, 621,5,14,4),
(null, 6, 2, '貂毛系列可爱耳钉（可拍下备注颜色）', '23.80', '均码', 1, 1510702102138, 201, 1412, 601,11,2,14),
(null, 7, 2, '韩国苾旎口红不掉色不脱色滋润防水唇膏唇彩咬唇妆持久防脱色保湿', '19.99', '均码', 0, 1510741025838, 201, 12, 1661,7,9,5),
(null, 7, 2, '忆丽贝萝女士玫瑰护手霜保湿补水滋润嫩肤不油腻防冻正品2支装', '29.90', '均码', 1, 1510744032838, 201, 462, 461,13,15,9),
(null, 8, 2, '加厚秋冬新款韩版百搭长牛仔裤男小脚裤子修身学生韩版黑色潮流', '69.30', '均码', 0, 1510721577838, 201, 262, 761,16,5,17),
(null, 8, 2, '港仔新款2017冬季男士圆领套头毛衣时尚补丁潮流帅气针织衫男', '98.00', '均码', 1, 1510744612348, 201, 142, 61,2,16,6),
(null, 9, 2, '女宝宝金丝绒套装2017新款冬装0-4岁婴幼儿小童加厚两件套', '68.60', '均码', 1, 1510224637838, 201, 162, 461,6,6,10),
(null, 1, 1, '学院风背心毛衣17秋冬新款学生百搭显瘦可爱针织吊带背心毛衣女', '49.90', '均码', 1, 1510744637838, 108, 141, 410,23,8,12),
(null, 1, 1, '2017新款缎面拼接百搭飞行员夹克刺绣情侣装棒球外套', '69.90', '均码', 1, 1510744024738, 1402, 688, 48,10,24,31),
(null, 1, 1, '2017冬韩版显瘦中长款过膝大毛领连帽气质羽绒服女大衣外套女', '218.00', '均码', 1, 1510023637838, 591, 477, 555,6,3,1),
(null, 1, 1, '面包服棉衣女中长款过膝韩版宽松大毛领棉服韩国学生冬装棉袄外套', '178.00', '均码', 1, 1510740637838, 5000, 777, 171,20,5,8),
(null, 1, 1, '秋冬季新款韩版原宿百搭宽松加厚毛领棉服女中长款棉衣显瘦外套女', '135.00', '均码', 1, 1510744637038, 2000, 2222, 529,5,13,11),
(null, 1, 1, '2017韩版冬季新款茧型夹棉加厚中长款焦糖色毛呢外套大衣女', '168.00', '均码', 1, 1510004637838, 1215, 461, 511,20,18,31),
(null, 1, 1, '喇叭袖复古麻花大袖宽松慵懒半高领显瘦韩版小清新新品套头毛衣女', '59.50', '均码', 1, 1510744630308, 15, 179, 29,15,3,1),
(null, 1, 1, '冬季新款清新甜美撞色木耳边高领毛衣套头女中长款打底衫长袖上衣', '59.90', '均码', 1, 1500701257380, 15, 11, 229,10,13,3),
(null, 1, 1, '秋冬季新款女装韩版简约款翻领口袋短款外套女毛呢外套呢子大衣潮', '89.90', '均码', 1, 1500701257380, 2751, 1751, 520,40,33,30),
(null, 10, 2, '简易布衣柜牛津布衣服收纳柜加粗加固实木布衣橱大号双人简约现代', '99.90', '均码', 1, 1502014637838, 21, 22, 1101,18,18,18),
(null, 3, 1, '超显瘦加厚气质百搭阔腿休闲七分裤休闲呢裤', '69.00', '均码', 1, 1510744024738, 5, 41, 166,10,20,30),
(null, 2, 2, '港味气质chic风百搭新款呢料收腰显瘦连衣裙女喇叭袖A型裙潮', '75.10', '均码',  0, 1485744637838, 344, 1649, 299,7,2,2);

CREATE TABLE mls_product_img(
	iid INT PRIMARY KEY AUTO_INCREMENT,
	product_id INT,
	sm VARCHAR(128),
	md VARCHAR(128)
);
INSERT INTO mls_product_img VALUES
(null,1,'img/goods/sm/sm1_1_1_100x100.jpg','img/goods/md/goods1_1_1_468x468.jpg'),
(null,2,'img/goods/sm/sm1_2_1_100x100.jpg','img/goods/md/goods1_2_1_468x468.jpg'),
(null,2,'img/goods/sm/sm1_2_2_100x100.jpg','img/goods/md/goods1_2_2_468x468.jpg'),
(null,2,'img/goods/sm/sm1_2_3_100x100.jpg','img/goods/md/goods1_2_3_468x468.jpg'),
(null,3,'img/goods/sm/sm1_3_1_100x100.jpg','img/goods/md/goods1_3_1_468x468.jpg'),
(null,4,'img/goods/sm/sm3_1_1_100x100.jpg','img/goods/md/goods3_1_1_468x468.jpg'),
(null,5,'img/goods/sm/sm3_2_1_100x100.jpg','img/goods/md/goods3_2_1_468x468.jpg'),
(null,6,'img/goods/sm/sm4_1_1_100x100.jpg','img/goods/md/goods4_1_1_468x468.jpg'),
(null,7,'img/goods/sm/sm4_2_1_100x100.jpg','img/goods/md/goods4_2_1_468x468.jpg'),
(null,7,'img/goods/sm/sm4_2_2_100x100.jpg','img/goods/md/goods4_2_2_468x468.jpg'),
(null,8,'img/goods/sm/sm4_3_1_100x100.jpg','img/goods/md/goods4_3_1_468x468.jpg'),
(null,8,'img/goods/sm/sm4_3_1_100x100.jpg','img/goods/md/goods4_3_1_468x468.jpg'),
(null,9,'img/goods/sm/sm5_1_1_100x100.jpg','img/goods/md/goods5_1_1_468x468.jpg'),
(null,9,'img/goods/sm/sm5_1_2_100x100.jpg','img/goods/md/goods5_1_2_468x468.jpg'),
(null,9,'img/goods/sm/sm5_1_3_100x100.jpg','img/goods/md/goods5_1_3_468x468.jpg'),
(null,10,'img/goods/sm/sm5_2_1_100x100.jpg','img/goods/md/goods5_2_1_468x468.jpg'),
(null,11,'img/goods/sm/sm6_1_1_100x100.jpg','img/goods/md/goods6_1_1_468x468.jpg'),
(null,12,'img/goods/sm/sm6_2_1_100x100.jpg','img/goods/md/goods6_2_1_468x468.jpg'),
(null,13,'img/goods/sm/sm7_1_1_100x100.jpg','img/goods/md/goods7_1_1_468x468.jpg'),
(null,14,'img/goods/sm/sm7_2_1_100x100.jpg','img/goods/md/goods7_2_1_468x468.jpg'),
(null,15,'img/goods/sm/sm8_1_1_100x100.jpg','img/goods/md/goods8_1_1_468x468.jpg'),
(null,16,'img/goods/sm/sm8_2_1_100x100.jpg','img/goods/md/goods8_2_1_468x468.jpg'),
(null,17,'img/goods/sm/sm9_1_1_100x100.jpg','img/goods/md/goods9_1_1_468x468.jpg'),
(null,17,'img/goods/sm/sm9_1_2_100x100.jpg','img/goods/md/goods9_1_2_468x468.jpg'),
(null,18,'img/goods/sm/sm1_8_1_100x100.jpg','img/goods/md/goods1_8_1_468x468.jpg'),
(null,18,'img/goods/sm/sm1_8_2_100x100.jpg','img/goods/md/goods1_8_2_468x468.jpg'),
(null,18,'img/goods/sm/sm1_8_3_100x100.jpg','img/goods/md/goods1_8_3_468x468.jpg'),
(null,18,'img/goods/sm/sm1_8_4_100x100.jpg','img/goods/md/goods1_8_4_468x468.jpg'),
(null,18,'img/goods/sm/sm1_8_5_100x100.jpg','img/goods/md/goods1_8_5_468x468.jpg'),
(null,18,'img/goods/sm/sm1_8_6_100x100.jpg','img/goods/md/goods1_8_6_468x468.jpg'),
(null,18,'img/goods/sm/sm1_8_7_100x100.jpg','img/goods/md/goods1_8_7_468x468.jpg'),
(null,18,'img/goods/sm/sm1_8_8_100x100.jpg','img/goods/md/goods1_8_8_468x468.jpg'),
(null,18,'img/goods/sm/sm1_8_9_100x100.jpg','img/goods/md/goods1_8_9_468x468.jpg'),
(null,18,'img/goods/sm/sm1_8_10_100x100.jpg','img/goods/md/goods1_8_10_468x468.jpg'),
(null,18,'img/goods/sm/sm1_8_11_100x100.jpg','img/goods/md/goods1_8_11_468x468.jpg'),
(null,18,'img/goods/sm/sm1_8_12_100x100.jpg','img/goods/md/goods1_8_12_468x468.jpg'),
(null,18,'img/goods/sm/sm1_8_13_100x100.jpg','img/goods/md/goods1_8_13_468x468.jpg'),
(null,18,'img/goods/sm/sm1_8_14_100x100.jpg','img/goods/md/goods1_8_14_468x468.jpg'),
(null,18,'img/goods/sm/sm1_8_15_100x100.jpg','img/goods/md/goods1_8_15_468x468.jpg'),
(null,18,'img/goods/sm/sm1_8_16_100x100.jpg','img/goods/md/goods1_8_16_468x468.jpg'),
(null,19,'img/goods/sm/sm1_9_1_100x100.jpg','img/goods/md/goods1_9_1_468x468.jpg'),
(null,19,'img/goods/sm/sm1_9_2_100x100.jpg','img/goods/md/goods1_9_2_468x468.jpg'),
(null,19,'img/goods/sm/sm1_9_3_100x100.jpg','img/goods/md/goods1_9_3_468x468.jpg'),
(null,19,'img/goods/sm/sm1_9_4_100x100.jpg','img/goods/md/goods1_9_4_468x468.jpg'),
(null,19,'img/goods/sm/sm1_9_5_100x100.jpg','img/goods/md/goods1_9_5_468x468.jpg'),
(null,19,'img/goods/sm/sm1_9_6_100x100.jpg','img/goods/md/goods1_9_6_468x468.jpg'),
(null,19,'img/goods/sm/sm1_9_7_100x100.jpg','img/goods/md/goods1_9_7_468x468.jpg'),
(null,20,'img/goods/sm/sm1_10_1_100x100.jpg','img/goods/md/goods1_10_1_468x468.jpg'),
(null,20,'img/goods/sm/sm1_10_2_100x100.jpg','img/goods/md/goods1_10_2_468x468.jpg'),
(null,20,'img/goods/sm/sm1_10_3_100x100.jpg','img/goods/md/goods1_10_3_468x468.jpg'),
(null,21,'img/goods/sm/sm1_11_1_100x100.jpg','img/goods/md/goods1_11_1_468x468.jpg'),
(null,21,'img/goods/sm/sm1_11_2_100x100.jpg','img/goods/md/goods1_11_2_468x468.jpg'),
(null,21,'img/goods/sm/sm1_11_3_100x100.jpg','img/goods/md/goods1_11_3_468x468.jpg'),
(null,22,'img/goods/sm/sm1_12_1_100x100.jpg','img/goods/md/goods1_12_1_468x468.jpg'),
(null,22,'img/goods/sm/sm1_12_2_100x100.jpg','img/goods/md/goods1_12_2_468x468.jpg'),
(null,22,'img/goods/sm/sm1_12_3_100x100.jpg','img/goods/md/goods1_12_3_468x468.jpg'),
(null,23,'img/goods/sm/sm1_13_1_100x100.jpg','img/goods/md/goods1_13_1_468x468.jpg'),
(null,23,'img/goods/sm/sm1_13_2_100x100.jpg','img/goods/md/goods1_13_2_468x468.jpg'),
(null,23,'img/goods/sm/sm1_13_3_100x100.jpg','img/goods/md/goods1_13_3_468x468.jpg'),
(null,24,'img/goods/sm/sm1_15_1_100x100.jpg','img/goods/md/goods1_15_1_468x468.jpg'),
(null,25,'img/goods/sm/sm1_15_1_100x100.jpg','img/goods/md/goods1_15_1_468x468.jpg'),
(null,26,'img/goods/sm/sm1_14_1_100x100.jpg','img/goods/md/goods1_14_1_468x468.jpg'),
(null,26,'img/goods/sm/sm1_14_2_100x100.jpg','img/goods/md/goods1_14_2_468x468.jpg'),
(null,26,'img/goods/sm/sm1_14_3_100x100.jpg','img/goods/md/goods1_14_3_468x468.jpg'),
(null,27,'img/goods/sm/sm10_1_1_100x100.jpg','img/goods/md/goods10_1_1_468x468.jpg'),
(null,27,'img/goods/sm/sm10_1_2_100x100.jpg','img/goods/md/goods10_1_2_468x468.jpg'),
(null,27,'img/goods/sm/sm10_1_3_100x100.jpg','img/goods/md/goods10_1_3_468x468.jpg'),
(null,27,'img/goods/sm/sm10_1_4_100x100.jpg','img/goods/md/goods10_1_4_468x468.jpg'),
(null,28,'img/goods/sm/sm3_9_1_100x100.jpg','img/goods/md/goods3_9_1_468x468.jpg'),
(null,28,'img/goods/sm/sm3_9_2_100x100.jpg','img/goods/md/goods3_9_2_468x468.jpg'),
(null,28,'img/goods/sm/sm3_9_3_100x100.jpg','img/goods/md/goods3_9_3_468x468.jpg'),
(null,28,'img/goods/sm/sm3_9_4_100x100.jpg','img/goods/md/goods3_9_4_468x468.jpg'),
(null,28,'img/goods/sm/sm3_9_5_100x100.jpg','img/goods/md/goods3_9_5_468x468.jpg'),
(null,28,'img/goods/sm/sm3_9_6_100x100.jpg','img/goods/md/goods3_9_6_468x468.jpg'),
(null,28,'img/goods/sm/sm3_9_7_100x100.jpg','img/goods/md/goods3_9_7_468x468.jpg'),
(null,29,'img/goods/sm/sm2_3_1_100x100.jpg','img/goods/md/goods2_3_1_468x468.jpg'),
(null,29,'img/goods/sm/sm2_3_2_100x100.jpg','img/goods/md/goods2_3_2_468x468.jpg'),
(null,29,'img/goods/sm/sm2_3_3_100x100.jpg','img/goods/md/goods2_3_3_468x468.jpg');


CREATE TABLE mls_shopping_cart(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	uid INT,
	product_id INT,
	count INT,
	is_checked TINYINT
);
INSERT INTO mls_shopping_cart VALUES(null,1,1,1,1);