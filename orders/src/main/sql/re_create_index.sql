alter table PAY_ORDER drop constraint PK_PAY_ORDER;

alter table PAY_ORDER
  add constraint PK_PAY_ORDER primary key (pay_order_id) using  index reverse;
  
alter table SUB_ORDER drop constraint PK_SUB_ORDER;
  
alter table SUB_ORDER
  add constraint PK_SUB_ORDER primary key (SUB_ORDER_ID) using  index reverse;
  
DROP INDEX IDX_SUB_ORDER_ORDER_ID;

CREATE INDEX IDX_SUB_ORDER_ORDER_ID ON SUB_ORDER (PAY_ORDER_ID) reverse online;