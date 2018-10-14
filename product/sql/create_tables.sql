create table product
(
  product_code    CHAR(10) primary key not null comment '��Ʒ��ţ�����',
  product_name    VARCHAR(256) comment '��Ʒ����',
  product_price DECIMAL(19,2) comment '�۸�',
  store_no      VARCHAR(32) comment '���̺�',
  product_status  CHAR(1) not null comment '״̬��0=�¼ܣ�1=�ϼ�',
  on_sale_time TIMESTAMP comment '�ϼ�ʱ�䣬������������ɼ�����(�ϳ�����update_time�ֶ��ж�)',
  product_intro	VARCHAR(500) comment '���',
  brand VARCHAR(128) comment 'Ʒ��',
  insert_time TIMESTAMP not null  DEFAULT NOW() comment '����ʱ��',
  update_time TIMESTAMP not null  DEFAULT NOW() comment '�޸�ʱ��'
) comment='��Ʒ��';

create table product_type(
	type_id VARCHAR(12) primary key not null comment '���ͱ�ţ�����',
	type_name VARCHAR(256) comment '��������',
	parent_type_id VARCHAR(12) comment '�����ͱ��',
	type_desc	VARCHAR(500) comment '��������',
	show_order INT comment '��ʾ˳��',
	insert_time TIMESTAMP not null  DEFAULT NOW() comment '����ʱ��',
    update_time TIMESTAMP not null  DEFAULT NOW() comment '�޸�ʱ��'
) comment = '��Ʒ����';

create table product_param(
	param_id	BIGINT primary key auto_increment comment '����',
	product_code    CHAR(10) not null comment '��Ʒ��ţ����',
	param_name   VARCHAR(128) comment '������',
	param_value  VARCHAR(256) comment '����ֵ',
	param_desc	VARCHAR(500) comment '��������',
	show_order INT comment '��ʾ˳��'
) comment = '��Ʒ����';

create table product_attached_option(
  option_code CHAR(12) primary key comment 'ѡ����룬����',
  product_code    CHAR(10) not null comment '��Ʒ��ţ����',
  option_type CHAR(1) not null  comment 'ѡ�����ͣ�1=���룬2=��ɫ��3=��װ��4=�ͺţ�9=����',
  option_name VARCHAR(128) comment 'ѡ������',
  option_value VARCHAR(128) comment 'ѡ��ֵ������ѡ��ɫʱ�����Խ���ɫ�ı���ֵ�������ڴˡ�',
  price DECIMAL(19,2) comment '�۸�ָ����ѡ���Ժ�ļ۸�',
  show_order INT comment '��ʾ˳��'
) comment = '��Ʒ����ѡ��';

create table store
(
  store_no      VARCHAR(32) primary key not null comment '���̱�ţ�����',
  store_name	VARCHAR(256) comment '��������',
  store_intro	VARCHAR(500) comment '���̼��',
  insert_time TIMESTAMP not null  DEFAULT NOW() comment '����ʱ��',
  update_time TIMESTAMP not null  DEFAULT NOW() comment '�޸�ʱ��'
)comment = '����';

