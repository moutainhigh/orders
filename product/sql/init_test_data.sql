--���Ի���ģ������
delete from store;
insert into store (store_no,store_name) values ('0001','��˶�콢��');
insert into store (store_no,store_name) values ('0002','���ר����');
insert into store (store_no,store_name) values ('0006','�绪�����̳�');
insert into store (store_no,store_name) values ('0008','�����ߵ�');
insert into store (store_no,store_name) values ('2018100009','���������');
insert into store (store_no,store_name) values ('2018100010','����ҵ��');
insert into store (store_no,store_name) values ('2018100011','�����ٻ�');
insert into store (store_no,store_name) values ('2018100012','�����װ��');
insert into store (store_no,store_name) values ('2018100013','����ٻ�');
insert into store (store_no,store_name) values ('2018100014','�ɻ���԰');
insert into store (store_no,store_name) values ('2018100015','�ϻ������');
insert into store (store_no,store_name) values ('2018100016','������װ��');
insert into store (store_no,store_name) values ('2018100017','������ģ');
insert into store (store_no,store_name) values ('2018100017','�ͷ�Ҿӳ�');
insert into store (store_no,store_name,store_intro) values ('2018100018','���������̳�','�ҵ�');
insert into store (store_no,store_name,store_intro) values ('2018100019','���ͰٳǼҵ�',null);
insert into store (store_no,store_name,store_intro) values ('2018100020','����ר����',null);
insert into store (store_no,store_name,store_intro) values ('2018100021','С��ר����',null);
insert into store (store_no,store_name,store_intro) values ('2018100022','��ά����㳡',null);
insert into store (store_no,store_name,store_intro) values ('2018100023','��������רӪ��',null);
insert into store (store_no,store_name,store_intro) values ('2018100024','�ᶯ��','�˶�');
insert into store (store_no,store_name,store_intro) values ('2018100025','�Ͽ�ٯ�ٷ��콢��','�˶�');
insert into store (store_no,store_name,store_intro) values ('2018100026','��ɽ���콢��','����');
insert into store (store_no,store_name,store_intro) values ('2018100027','���¿�ٷ��콢��',null);
insert into store (store_no,store_name,store_intro) values ('2018100028','����ר����','�˶�');
insert into store (store_no,store_name,store_intro) values ('2018100029','��ʿ�˶�רӪ��','�˶�');
insert into store (store_no,store_name,store_intro) values ('2018100030','9377ҳ�δ�ȫ','��Ϸ��ȯ');
insert into store (store_no,store_name,store_intro) values ('2018100031','17173��Ϸ��','��Ϸ��ȯ');
insert into store (store_no,store_name,store_intro) values ('2018100032','�������',null);
insert into store (store_no,store_name,store_intro) values ('2018100033','��������ͼ��רӪ��',null);
insert into store (store_no,store_name,store_intro) values ('2018100034','�������ϳ�����',null);
insert into store (store_no,store_name,store_intro) values ('2018100035','�׶���ʷ���',null);
insert into store (store_no,store_name,store_intro) values ('2018100036','�ž�ͼ��רӪ��',null);
insert into store (store_no,store_name,store_intro) values ('2018100037','��ֻ����ר����',null);
insert into store (store_no,store_name,store_intro) values ('2018100038','Ʒζ��ʳƷר����',null);
insert into store (store_no,store_name,store_intro) values ('2018100039','�������콢��',null);
insert into store (store_no,store_name,store_intro) values ('2018100040','����ʳƷרӪ��',null);
insert into store (store_no,store_name,store_intro) values ('2018100041','һ��ʳƷ�콢��',null);
insert into store (store_no,store_name,store_intro) values ('2018100042','ʢʦ���콢��',null);
insert into store (store_no,store_name,store_intro) values ('2018100043','֪ζ�۸��',null);
insert into store (store_no,store_name,store_intro) values ('2018100044','���������±�',null);
insert into store (store_no,store_name,store_intro) values ('2018100045','һ�������콢��',null);
insert into store (store_no,store_name,store_intro) values ('2018100046','�����ļ��콢��','��Ҷ');
insert into store (store_no,store_name,store_intro) values ('2018100047','֣�����콢��','��Ҷ');
insert into store (store_no,store_name,store_intro) values ('2018100048','������Ҷ��','��Ҷ');
insert into store (store_no,store_name,store_intro) values ('2018100049','�����̲�',null);
insert into store (store_no,store_name,store_intro) values ('2018100050','gurado��Ȼ���콢��',null);
insert into store (store_no,store_name,store_intro) values ('2018100051','��ƮƮ�����',null);
insert into store (store_no,store_name,store_intro) values ('2018100052','Ѱ���1867',null);
insert into store (store_no,store_name,store_intro) values ('2018100053','��������',null);
insert into store (store_no,store_name,store_intro) values ('2018100054','��ô��',null);
insert into store (store_no,store_name,store_intro) values ('2018100055','H2','����');
insert into store (store_no,store_name,store_intro) values ('2018100056','������',null);

delete from type_product_map;
delete from product_param;
delete from product;
insert into product (product_code,product_name,product_price,product_status,store_no)values ('0001100401','��˶���',45.8,'0','0001'); 
insert into type_product_map (type_id,product_code) values ('040207','0001100401');
insert into product (product_code,product_name,product_price,product_status,store_no)values ('0002100402','������',60,'0','0002'); 
insert into type_product_map (type_id,product_code) values ('040207','0002100402');

insert into product (product_code,product_name,product_price,product_status,store_no)values ('0006100403','����ʼǱ�',6500,'0','0006'); 
insert into type_product_map (type_id,product_code) values ('040211','0006100403');
insert into product (product_code,product_name,product_price,product_status,store_no)values ('0006100404','�����ʼǱ�',5500,'0','0006'); 
insert into type_product_map (type_id,product_code) values ('040211','0006100404');

insert into product (product_code,product_name,product_price,product_status,store_no)values ('0008100406','��ͯ���ǿ���ģ��',145,'0','0008'); 
insert into type_product_map (type_id,product_code) values ('0303','0008100406');
insert into product_param (product_code,param_name,param_value,show_order)values ('0006','��������','5-7��',1); 
insert into product_param (product_code,param_name,param_value,show_order)values ('0006','��Ʒ����','����/����',2); 
insert into product_param (product_code,param_name,param_value,show_order)values ('0006','�ͺ�','��Ӱ����',3); 
insert into product_param (product_code,param_name,param_value,show_order)values ('0006','��ɫ','��',4);

insert into product (product_code,product_name,product_price,product_status,store_no)values ('0008100407','�ָ߻�ľ����ս��',68,'0','0008'); 
insert into type_product_map (type_id,product_code) values ('030102','0008100407');
insert into product_param (product_code,param_name,param_value,show_order)values ('0007','��������','3-4��',1); 
insert into product_param (product_code,param_name,param_value,show_order)values ('0007','��Ʒ����','ľ��',2); 
insert into product_param (product_code,param_name,param_value,show_order)values ('0007','��ɫ','������',4);

insert into product (product_code,product_name,product_price,product_status,store_no)values ('0006100405','������V6',50,'0','0006'); 
insert into type_product_map (type_id,product_code) values ('040207','0006100405');
insert into product (product_code,product_name,product_price,product_status,store_no)values ('0006100406','�޼� LINE FRIENDS',145,'0','0006'); 
insert into type_product_map (type_id,product_code) values ('040207','0006100406');
insert into product (product_code,product_name,product_price,product_status,store_no)values ('0006100407','С�� ��Я���',145,'0','0006'); 
insert into type_product_map (type_id,product_code) values ('040207','0006100407');
insert into product (product_code,product_name,product_price,product_status,store_no)values ('0006100408','SILVER LINK ����',169,'0','0006'); 
insert into type_product_map (type_id,product_code) values ('040207','0006100408');

insert into product (product_code,product_name,product_price,product_status,store_no)values ('0001100402','��˶��ASUS����Ϸ�ʼǱ�����',7199,'0','0001'); 
insert into type_product_map (type_id,product_code) values ('040211','0001100402');
insert into product (product_code,product_name,product_price,product_status,store_no)values ('0001100403','��˶��ASUS�����б�������ʼǱ��������',6999,'0','0001'); 
insert into type_product_map (type_id,product_code) values ('040211','0001100403');
insert into product (product_code,product_name,product_price,product_status,store_no)values ('0001100404','��˶(ASUS)��ʯYX560UD��Ϸ��',4999,'0','0001'); 
insert into type_product_map (type_id,product_code) values ('040211','0001100404');

insert into product (product_code,product_name,product_price,product_status,store_no)values ('0002100403','Acer/�곞 ��6 A615 �ʼǱ�����',3999,'0','0002'); 
insert into type_product_map (type_id,product_code) values ('040211','0002100403');

insert into product (product_code,product_name,product_price,product_status,store_no)values ('0002100404','Acer�곞ͶӰ��X118H',3099,'0','0002'); 
insert into type_product_map (type_id,product_code) values ('0402','0002100404');
insert into type_product_map (type_id,product_code) values ('09','0002100404');

insert into product (product_code,product_name,product_price,product_status,store_no)values ('0002100405','DLP��������ʽ3D�۾�',69,'0','0002'); 
insert into type_product_map (type_id,product_code) values ('0402','0002100405');