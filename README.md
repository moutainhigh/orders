# orders

## 一、概述

**一个简单的电子商务平台，探讨了以下情况：**
1. 高并发环境下订单的受理。
2. 商品搜索(ES)。
3. 高吞吐量的订单流转。  

**This is a simple e-commerce platform.We discuss these topics:**
1. Receiving orders in high concurrency environment.
2. Searching porducts(ES).
3. Order circulation in high throughput capacity.

## 二、流程图

### 购物流程
```
                               ┌-> 开启物流流程 -> 签收
                ┌----------┐   | 
  下订单 -> 支付 ┴> 确认订单 ┴> 出库  ┬> (确认收货) -┬> 清结算 -> 打款 -> 交易成功(结束) 
     |       |       |         |    |             |
  (取消)    (取消) (取消)    (取消)  └->(时限到期)--┘
     └---┬---┘       └---┬-----┘
         |               |
         |               V 
         |              退款
         |               |
         |               V
         └--------->交易取消(结束)
```

### 退货流程
```
                                    ┌-> 开启物流流程 -> 卖家签收
                                    |
买家发起退货 -> 卖家确认 -(同意)-> 买家发货 ┬-> (确认收货)-┬->打款给买家->对卖家进行清结算->退货成功(结束) 
                   |                ↑    └-> (时限到期)-┘
	     (拒绝或超时)            |
                   |                |
                   V                |
               平台方审核            |
                   ├----(同意退货)---┘
                   |
              (不同意退货)
                   |
                   V
             退货取消(结束)
	     
	     
                   ┌-> 开启物流流程 -> 卖家签收
                   |
卖家发起召回 -> 买家发货 ┬-> (确认收货)-┬->打款给买家->对卖家进行清结算->召回成功(结束) 
                   |   └-> (时限到期)-┘
	     (拒绝或超时)            
                   |                
                   V                
             召回取消(结束)
  ```

## 三、如何运行本项目

### 1、安装数据库

先安装一个MySql实例。

以root用户登录Mysql,执行以下脚本，创建orders数据库：
```
CREATE USER 'ordersUser'@'%' IDENTIFIED BY 'xiaoke_1256';

create schema orders default character set utf8 collate utf8_general_ci;

GRANT ALL ON orders.* TO 'ordersUser'@'%';
```

### 2、安装Elasticsearch

### 3、安装redis

### 4、安装zookeeper

### 5、配置各个服务器的域名

### 6、启动应用
