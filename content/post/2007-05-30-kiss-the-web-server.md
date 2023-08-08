---
title: "KISS V0.2 互联网绿色服务器 PHP+MYSQL+APACHE2"
date: "2007-05-30"
author: gaoch
tags:
  - 百度空间
---

  

@  
http://hi.baidu.com/3244/blog/item/73fa57907949ea8da877a423%2Ehtml?tn=mozillacncb&

  

有人提到0.2版没有包含phpMyAdmin,这里,解释一下,顺带这说一下其他几个DBMS的在线管理工具.

PostgreSQL的管理工具是phpPgAdmin,最新版本是4.0.1,支持PostgreSQL
8.1.x及以往的版本,官方站点:http://phppgadmin.sourceforge.net/

MySQL的管理工具是phpMyAdmin,最新版本2.8.0.3,这个太有名了,获得SF.NET的社区选择大奖,支持MySQL5和PHP5,官方站点:http://www.phpmyadmin.net

Firebird/Interbase的管理工具是ibWebAdmin,这个可能很少有人知道,最新版本是1.0.1,支持Firebird1.5和2.0(FB的2.0还没出正式版),官方站点:http://www.ibwebadmin.net/

大家需要的话可以去上述站点下载最新的版本,然后放到Apache的网站根目录(\\kiss\\Apache\\htdocs)下,修改相应的配置文件(一般叫config.inc.php,configuration.inc.php等)即可使用

如果需要Desktop Application(桌面应用程序,区别于Web
based)的数据库管理工具,这里我提供一点消息,我常用的是EMS SQL Manager 2005
Lite,免费的,界面很漂亮,官方在这里:http://www.ibwebadmin.net/,有PostgreSQL,MySQL,Firebird,MS
SQL
Server,DB2的版本,大家可以自己去下载,这个网站要求注册才能下载,因此可以在网站上查到最新版本的版本号之后到betanews.com上下,这里不需要注册可以直接下.

还有一个不错的,是DBManager,在一个软件里面集成了对很多主流数据库(MySQL,
PostgreSQL, Interbase/Firebird, SQLite, DBF, MSAccess, MSSQL Server,
Sybase and Oracle) 的支持,:http://www.dbtools.com.br/EN/index.php

EMS系列和DBManager都是商业软件,EMS的Lite版可以免费使用,DBManager有试用版,我并不推荐,也不是为他们做广告,大家如果感兴趣可以自己去了解和使用.如果是用于商业用途,还是买正版的吧.

如果买不起正版又想看看正版的全部功能,可以在这里找破解:crackspider.net,一个很好的破解搜索网站,可惜搜出的结果往往带有色情广告:(
