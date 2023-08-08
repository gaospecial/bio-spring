---
title: 如何连接阿里云数据库RDS
date: '2015-08-21'
slug: 2015-08-21-connect-to-rds
tags:
- 云计算 CLOUD+
- 网站建设 WEBSITE
- RDS
- 云数据库
- 阿里云
---


### mysql客户端方式

用户安装MySQL客户端后，可进入命令行方式链接数据库。  
命令格式：mysql -u user\_name -h example.mysql.rds.aliyuncs.com -P3306
-pxxxx  
其中，-u 指定的是用户名， -h指定的是主机名， -P指定的是端口，
-p指定的是密码。

### WordPress使用RDS

添加服务器IP到白名单  
修改wp-config.php  
参见[WordPress迁移](http://bio-spring.top/?p=586)
