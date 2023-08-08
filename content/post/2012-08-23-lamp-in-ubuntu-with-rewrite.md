---
title: 在Ubuntu 12.04系统中安装LAMP（网络服务器套件）并设置rewrite
date: '2012-08-23'
slug: 2012-08-23-lamp-in-ubuntu-with-rewrite
tags:
- 操作系统 LINUX
- apache
- linux
- mysql
- Ubuntu
---


打开终端，输入以下命令，一键完成安装：

\[bash\]sudo apt-get install apache2 php5  
libapache2-mod-php5 mysql-server  
libapache2-mod-auth-mysql php5-mysql  
phpmyadmin\[/bash\]

> 请安装提示根据需要设置密码。

一键打开 Rewrite：

\[bash\]sudo a2enmod rewrite  
sudo service apache2 restart\[/bash\]

最后一步：

\[bash\]sudo gedit /etc/apache2/site-available/default\[/bash\]

将其中的“Allow override NONE”改为“ALLOW OVERRIDE ALL”。
