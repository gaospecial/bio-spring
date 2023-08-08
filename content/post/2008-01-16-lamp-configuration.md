---
title: "LAMP Project[part A]-概述:使用Linux,apache,mySQL和Perl创建cgi动态网页项目[上部]"
date: "2008-01-16"
author: gaoch
tags:
  - 百度空间
---

最近几天,
尝试创建了一个基于LAMP的cgi项目,说是项目,其实只是一个小玩具,不过麻雀虽小,五脏俱全,本人由此得到了不少的体会.  
本着相互交流,相互促进的原则(communicate可是我博客的主题呢!),我把具体过程给予一定的整理,由此发布出来,相当于固化学习成果了.  
  
版权声明:本文为原创,转载请遵循"保持署名一致,非商业使用"原则.  
**  
概述:**  
LAMP是一套开源的强大工具,
本次通过创建网页查询,从数据库中查询出相应记录并在网页上展示出来.  
涉及以下部分,近期将依次发布,敬请留意:  
    LAMP的安装和设置;  
    mySQL数据库的创建及数据导入；  
    使用CGI创建动态网页,对查询数据进行处理,返回查询结果.  
  
  
## LAMP的安装和设置
  
本人使用的linux发行版是Ubuntu
Feisty(7.04),在这个版本中可以一键完成整个系统的安装.整个过程在ubuntu
forum中有详述,在此不在赘述.  
\#在Apache服务器中进行cgi的设置.  
在site-enabled的配置文件中,需要添加你的cgi脚本目录并给予相应的说明.  

\[code\]  
        ScriptAlias /mycgi/ /var/www/cgi/  
    &lt;Directory "/var/www/cgi/"&gt;  
        AllowOverride None  
        Options ExecCGI -MultiViews +SymLinksIfOwnerMatch  
        Order allow,deny  
        Allow from all  
    &lt;/Directory&gt;  
\[/code\]  

首先定义一下alias,这样在服务器上输入mycgi则会在/var/www/cgi/目录执行.  
很简单.需要注意的就是相应目录的权限,要给所有人以执行的权利(755)
设置完成之后,注意重启apache服务器,  

sudo /etc/init.d/apache2 restart  
  
## 创建mySQL数据库,并导入数据 
  
**\#数据的结构**  
我们要导入的是一个科技论文影响因子的列表,如下显示了它的结构:  
[<img src="http://hiphotos.baidu.com/spring%5Fgao/pic/item/cf97b5fb95cfa72c4e4aea31.jpg" class="blogimg" />](http://hiphotos.baidu.com/spring%5Fgao/pic/item/e8e74010dea102f2c2ce794a.jpg)  
每一行是一个记录,共有四栏column,栏间以","相隔,分别是缩写的标题,06,05,04年的impact
factor;  
  
**\#创建数据库和导入上面的数据**  
  
注:shell&gt;表示在命令行下输入的命令; mySQL&gt;表示输入的sql命令；  
shell&gt;mysql -uroot -p  
\*\*\*\*\*(root的密码)  
mysql&gt;create database test;  
mysql&gt;create table ifactor(  
    myid int(6),  
    title varchar(30) not null,  
    if04 float,  
    if05 float,  
    if06 float  
);  
mysql&gt;alter table ifactor add primary key('myid');  
mysql&gt;alter table ifactor change myid int(6) auto\_increment;  
*数据库的结构如下:*  
<img src="http://hiphotos.baidu.com/spring%5Fgao/pic/item/23549c506b381f6c84352411.jpg" class="blogimg" />  
mysql&gt;load data local infile
'数据文件的绝对路径,eg,/home/test/Desktop/if.txt'  
    into table ifactor(title,if06,if05,if04);  
mysql&gt;select \* from ifactor limit 0,5;  
<img src="http://hiphotos.baidu.com/spring%5Fgao/pic/item/8fa231d32ce87c0e3bf3cf29.jpg" class="blogimg" />至此,数据库建立完成.  
  
**\#mysql查询,模式匹配简介**  
  
在mysql中可以使用两个命令进行模式匹配.一个是LIKE,一个是RLIKE(REGEXP)；  
前者使用"\_"代替一个字符,"%"代替多个字符,RLIKE则使用扩展的正则表达式进行匹配.  
如上第一条记录,可以写成:  
mysql&gt;select \* from ifactor where title like 'aap%bu%';
\[后面必须有%,因为还有字符\]  
mysql&gt;select \* from ifactor where title rlike 'aap.\*bu';  
后面将要使用这个东西.  
  
## 使用DBI,CGI
  
dbi和cgi是perl的模块, 因此使用dbi,cgi要对perl有所了解.  
**\#建立cgi中使用的mysql账户(为了安全的考虑)**  
mysql&gt;grant select on test.ifactor to test@localhost identified by
'testpasswd';  
  
下面的代码只是其中的一部分,请确保你的代码前面几行是这个东西:  
\[code\]  
\#!/usr/bin/perl -w  
use DBI;  
use use CGI ':standard';  
use strict;  
\[/code\]  
  
**\#创建DBI,mysql数据库连接**  
  
my $dbh = DBI-&gt;connect('DBI:mysql:people', 'apache', 'lampiscool')  
        or die "Can't connect: " . DBI-&gt;errstr();  
**\#进行数据库查询**  
  
    my $sth = $dbh-&gt;prepare('SELECT title,if04,if05,if06 FROM
ifactor  
                       WHERE title RLIKE ? ')  
           or handle\_error("Can't prepare SQL: " . $dbh-&gt;errstr(),
$dbh);  
  
    $sth-&gt;execute($query)  
           or handle\_error("Can't execute SQL: " . $dbh-&gt;errstr(),  
                            $dbh, $sth);  
  
**\#对查询结果进行处理**  
  
    my($title,$if04,$if05,$if06);  
    while (($title,$if04,$if05,$if06) = $sth-&gt;fetchrow()) {  
      print
"&lt;tr&gt;&lt;th&gt;$title&lt;/th&gt;&lt;th&gt;$if04&lt;/th&gt;&lt;th&gt;$if05&lt;/th&gt;&lt;th&gt;$if06&lt;/th&gt;&lt;/tr&gt;\\n";  
    }  
  
  
