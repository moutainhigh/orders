insert into store (store_no,store_name) values ('0001','��˶�콢��');

insert into store (store_no,store_name) values ('0002','���ר����');

insert into store (store_no,store_name) values ('0006','�绪�����̳�');

insert into store (store_no,store_name) values ('0008','�����ߵ�');



insert into product (product_code,product_name,product_price,product_status,store_no)values ('0001','��˶���',45.8,'0','0001'); 
insert into product (product_code,product_name,product_price,product_status,store_no)values ('0002','������',60,'0','0002'); 

insert into product (product_code,product_name,product_price,product_status,store_no)values ('0003','����ʼǱ�',6500,'0','0006'); 
insert into product (product_code,product_name,product_price,product_status,store_no)values ('0004','�����ʼǱ�',5500,'0','0006'); 

insert into product (product_code,product_name,product_price,product_status,store_no)values ('0006','��ͯ���ǿ���ģ��',145,'0','0008'); 

insert into product_param (product_code,param_name,param_value,show_order)values ('0006','��������','5-7��',1); 
insert into product_param (product_code,param_name,param_value,show_order)values ('0006','��Ʒ����','����/����',2); 
insert into product_param (product_code,param_name,param_value,show_order)values ('0006','�ͺ�','��Ӱ����',3); 
insert into product_param (product_code,param_name,param_value,show_order)values ('0006','��ɫ','��',4);

insert into product (product_code,product_name,product_price,product_status,store_no)values ('0007','�ָ߻�ľ����ս��',68,'0','0008'); 

insert into product_param (product_code,param_name,param_value,show_order)values ('0007','��������','3-4��',1); 
insert into product_param (product_code,param_name,param_value,show_order)values ('0007','��Ʒ����','ľ��',2); 
insert into product_param (product_code,param_name,param_value,show_order)values ('0007','��ɫ','������',4);


