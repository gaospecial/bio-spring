---
title: 将 WordPress 迁移到 阿里云
date: '2015-08-21'
slug: 2015-08-21-wordpress-cloud
tags:
- 云计算 CLOUD+
- 原创教程 TUTORIAL
- 网站建设 WEBSITE
- Ubuntu
- wordpress
- 阿里云
---


最近将国外的主机迁移到了阿里云（参见：[Site
Changelog](http://bio-spring.top/?page_id=16)）。没办法，GFW太厉害了。留在外面只能做僵尸网站。

**本文简要介绍了将WordPress迁移到云服务器ECS、云数据库RDS，域名绑定到云解析的方法。**

如果要购买 ECS 云服务器，使用我的邀请码（**U6FOVY**，有效期截止
2015-11-30）可以得到 **九折** 优惠。

### 新服务器

安装LAMP：[Ubuntu快速安装 LAMP](http://bio-spring.top/?p=584)  
安装phpmyadmin：  
\[cc lang=”bash”\]  
sudo apt-get install phpmyadmin  
ln -s /usr/share/phpmyadmin/ /var/www/html/phpmyadmin  
\[/cc\]

### 旧服务器

WordPress整站打包下载。  
使用一个插件生成数据库备份wp-DB-backup：wp\_backup.sql.gz

### 迁移

上传整站到/var/www/html，只需要修改wp-config.php更新数据库信息。  
打开http://newsite.com/phpmyadmin，创建一个数据库，将wp\_backup.sql.gz
导入（import）。  
进入options工作表，更新home和siteurl的值。  
\[cc lang=”mysql”\]  
mysql&gt; use wordpress;  
mysql&gt; source wp.sql;  
mysql&gt; update \`wp1\_options\` set \`option\_value\` =
“http://bio-spring.top/” where \`option\_name\` = “siteurl”;  
mysql&gt; update \`wp1\_options\` set \`option\_value\` =
“http://bio-spring.top/” where \`option\_name\` = “home”;  
\[/cc\]

### 使用云数据库 RDS

在RDS控制面板创建database，然后登录到RDS，同上设置。  
\[cc lang=”bash”\]  
bash$ mysql -uuser -ppasswd -husername.mysql.rds.aliyuncs.com \#
登录到RDS  
\[/cc\]

### 绑定域名到阿里云解析

进入域名注册上后台，修改NameServer为万网NS。  
[<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2015/08/clipboard.png" class="alignnone size-full wp-image-588" width="609" height="465" alt="godaddy_dns" />](https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2015/08/clipboard.png)

### 在阿里云解析“添加解析”，等待生效即可。

[<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2015/08/aliyun_dns.png" class="alignnone size-full wp-image-587" width="1093" height="78" alt="aliyun_dns" />](https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2015/08/aliyun_dns.png)  
搞定了。
