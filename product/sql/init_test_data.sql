--测试环境模拟数据
delete from store;
insert into store (store_no,store_name) values ('0001','华硕旗舰店');
insert into store (store_no,store_name) values ('0002','弘基专卖店');
insert into store (store_no,store_name) values ('0006','风华电子商城');
insert into store (store_no,store_name) values ('0008','酷儿玩具店');
insert into store (store_no,store_name) values ('2018100009','天天数码城');
insert into store (store_no,store_name) values ('2018100010','青青家电城');
insert into store (store_no,store_name) values ('2018100011','阳阳百货');
insert into store (store_no,store_name) values ('2018100012','莉莉服装店');
insert into store (store_no,store_name) values ('2018100013','羊族百货');
insert into store (store_no,store_name) values ('2018100014','巧虎乐园');
insert into store (store_no,store_name) values ('2018100015','老沪箱包馆');
insert into store (store_no,store_name) values ('2018100016','亮亮服装城');
insert into store (store_no,store_name) values ('2018100017','美至车模');
insert into store (store_no,store_name) values ('2018100017','和丰家居城');
insert into store (store_no,store_name,store_intro) values ('2018100018','林智生活商城','家电');
insert into store (store_no,store_name,store_intro) values ('2018100019','世纪百城家电',null);
insert into store (store_no,store_name,store_intro) values ('2018100020','美的专卖店',null);
insert into store (store_no,store_name,store_intro) values ('2018100021','小米专卖店',null);
insert into store (store_no,store_name,store_intro) values ('2018100022','创维数码广场',null);
insert into store (store_no,store_name,store_intro) values ('2018100023','索尼数码专营店',null);
insert into store (store_no,store_name,store_intro) values ('2018100024','酷动城','运动');
insert into store (store_no,store_name,store_intro) values ('2018100025','迪卡侬官方旗舰店','运动');
insert into store (store_no,store_name,store_intro) values ('2018100026','北山狼旗舰店','户外');
insert into store (store_no,store_name,store_intro) values ('2018100027','优衣库官方旗舰店',null);
insert into store (store_no,store_name,store_intro) values ('2018100028','李宁专卖店','运动');
insert into store (store_no,store_name,store_intro) values ('2018100029','超士运动专营店','运动');
insert into store (store_no,store_name,store_intro) values ('2018100030','9377页游大全','游戏点券');
insert into store (store_no,store_name,store_intro) values ('2018100031','17173游戏王','游戏点券');
insert into store (store_no,store_name,store_intro) values ('2018100032','意气书店',null);
insert into store (store_no,store_name,store_intro) values ('2018100033','博航丽鑫图书专营店',null);
insert into store (store_no,store_name,store_intro) values ('2018100034','北京联合出版社',null);
insert into store (store_no,store_name,store_intro) values ('2018100035','首都文史书店',null);
insert into store (store_no,store_name,store_intro) values ('2018100036','九九图书专营店',null);
insert into store (store_no,store_name,store_intro) values ('2018100037','三只松鼠专卖店',null);
insert into store (store_no,store_name,store_intro) values ('2018100038','品味轩食品专卖店',null);
insert into store (store_no,store_name,store_intro) values ('2018100039','老生鲜旗舰店',null);
insert into store (store_no,store_name,store_intro) values ('2018100040','林南食品专营店',null);
insert into store (store_no,store_name,store_intro) values ('2018100041','一方食品旗舰店',null);
insert into store (store_no,store_name,store_intro) values ('2018100042','盛师傅旗舰店',null);
insert into store (store_no,store_name,store_intro) values ('2018100043','知味观糕点',null);
insert into store (store_no,store_name,store_intro) values ('2018100044','静安寺素月饼',null);
insert into store (store_no,store_name,store_intro) values ('2018100045','一杯香茗旗舰店',null);
insert into store (store_no,store_name,store_intro) values ('2018100046','花香四季旗舰店','茶叶');
insert into store (store_no,store_name,store_intro) values ('2018100047','郑茗村旗舰店','茶叶');
insert into store (store_no,store_name,store_intro) values ('2018100048','清轩茶叶店','茶叶');
insert into store (store_no,store_name,store_intro) values ('2018100049','天宇奶茶',null);
insert into store (store_no,store_name,store_intro) values ('2018100050','gurado果然豆旗舰店',null);
insert into store (store_no,store_name,store_intro) values ('2018100051','香飘飘奶香店',null);
insert into store (store_no,store_name,store_intro) values ('2018100052','寻茶记1867',null);
insert into store (store_no,store_name,store_intro) values ('2018100053','西贝餐饮',null);
insert into store (store_no,store_name,store_intro) values ('2018100054','辣么棒',null);
insert into store (store_no,store_name,store_intro) values ('2018100055','H2','西餐');
insert into store (store_no,store_name,store_intro) values ('2018100056','义面屋',null);

delete from type_product_map;
delete from product_param;
delete from product;
insert into product (product_code,product_name,product_price,product_status,store_no)values ('0001100401','华硕鼠标',45.8,'0','0001'); 
insert into type_product_map (type_id,product_code) values ('040207','0001100401');
insert into product (product_code,product_name,product_price,product_status,store_no)values ('0002100402','弘基鼠标',60,'0','0002'); 
insert into type_product_map (type_id,product_code) values ('040207','0002100402');

insert into product (product_code,product_name,product_price,product_status,store_no)values ('0006100403','联想笔记本',6500,'0','0006'); 
insert into type_product_map (type_id,product_code) values ('040211','0006100403');
insert into product (product_code,product_name,product_price,product_status,store_no)values ('0006100404','戴尔笔记本',5500,'0','0006'); 
insert into type_product_map (type_id,product_code) values ('040211','0006100404');

insert into product (product_code,product_name,product_price,product_status,store_no)values ('0008100406','儿童益智恐龙模型',145,'0','0008'); 
insert into type_product_map (type_id,product_code) values ('0303','0008100406');
insert into product_param (product_code,param_name,param_value,show_order)values ('0006','适用年龄','5-7岁',1); 
insert into product_param (product_code,param_name,param_value,show_order)values ('0006','产品材质','塑料/胶制',2); 
insert into product_param (product_code,param_name,param_value,show_order)values ('0006','型号','幻影忍者',3); 
insert into product_param (product_code,param_name,param_value,show_order)values ('0006','颜色','黄',4);

insert into product (product_code,product_name,product_price,product_status,store_no)values ('0008100407','乐高积木巨龙战车',68,'0','0008'); 
insert into type_product_map (type_id,product_code) values ('030102','0008100407');
insert into product_param (product_code,param_name,param_value,show_order)values ('0007','适用年龄','3-4岁',1); 
insert into product_param (product_code,param_name,param_value,show_order)values ('0007','产品材质','木质',2); 
insert into product_param (product_code,param_name,param_value,show_order)values ('0007','颜色','蓝、绿',4);

insert into product (product_code,product_name,product_price,product_status,store_no)values ('0006100405','火银狐V6',50,'0','0006'); 
insert into type_product_map (type_id,product_code) values ('040207','0006100405');
insert into product (product_code,product_name,product_price,product_status,store_no)values ('0006100406','罗技 LINE FRIENDS',145,'0','0006'); 
insert into type_product_map (type_id,product_code) values ('040207','0006100406');
insert into product (product_code,product_name,product_price,product_status,store_no)values ('0006100407','小米 便携鼠标',145,'0','0006'); 
insert into type_product_map (type_id,product_code) values ('040207','0006100407');
insert into product (product_code,product_name,product_price,product_status,store_no)values ('0006100408','SILVER LINK 蓝牙',169,'0','0006'); 
insert into type_product_map (type_id,product_code) values ('040207','0006100408');

insert into product (product_code,product_name,product_price,product_status,store_no)values ('0001100402','华硕（ASUS）游戏笔记本电脑',7199,'0','0001'); 
insert into type_product_map (type_id,product_code) values ('040211','0001100402');
insert into product (product_code,product_name,product_price,product_status,store_no)values ('0001100403','华硕（ASUS）飞行堡垒五代笔记本手提电脑',6999,'0','0001'); 
insert into type_product_map (type_id,product_code) values ('040211','0001100403');
insert into product (product_code,product_name,product_price,product_status,store_no)values ('0001100404','华硕(ASUS)顽石YX560UD游戏本',4999,'0','0001'); 
insert into type_product_map (type_id,product_code) values ('040211','0001100404');

insert into product (product_code,product_name,product_price,product_status,store_no)values ('0002100403','Acer/宏碁 炫6 A615 笔记本电脑',3999,'0','0002'); 
insert into type_product_map (type_id,product_code) values ('040211','0002100403');

insert into product (product_code,product_name,product_price,product_status,store_no)values ('0002100404','Acer宏碁投影仪X118H',3099,'0','0002'); 
insert into type_product_map (type_id,product_code) values ('0402','0002100404');
insert into type_product_map (type_id,product_code) values ('09','0002100404');

insert into product (product_code,product_name,product_price,product_status,store_no)values ('0002100405','DLP主动快门式3D眼镜',69,'0','0002'); 
insert into type_product_map (type_id,product_code) values ('0402','0002100405');