---
title: "about:blank.la/g? o.exe msrs.exe 5.pif病毒"
date: "2008-07-31"
author: gaoch
tags:
  - 百度空间
---

<img src="http://hiphotos.baidu.com/spring%5Fgao/pic/item/96bb9623e2edfe53ad34ded0.jpg" class="blogimg" />

这个病毒，初步观察，目前不能用常规手段清除，产生如图的效果，中毒后无法显示系统文件，从而隐藏起来。

在命令提示符下面，可以用dir /a 查看，使用attrib -s -h autorun.inf
去除系统属性，然后用del autorun.inf删除。

----------------

**注意：**

根据<http://blog.sina.com.cn/s/blog_4e4ffc940100b2nx.html>的信息，以及本人观察，发现该病毒确实可以通过网络，发送arp攻击包，通过IE浏览器感染（即浏览网页就可以感染）。可以在C:\\Documents
and Settings\\Administrator\\Local Settings\\Temporary Internet
Files找到感染的exe文件（如1.exe，2.exe等）。

----------------

**症状：**

会修改IE默认主页，为about：blank.la/g?形式的主页，是一个导航页面；

系统日期会被改为2004年；

可以屏蔽一些工具，如安全卫士、超级兔子等；

在开始菜单-程序-启动下面创建，5.pif的快捷方式。

会禁用注册表，禁用安全模式，但是不禁用msconfig，不过通过msconfig修改启动项后，重启无效；

开机时，出现**5.pif**的进程，和**o.exe**的进程，以及**msrs.exe**的进程；

怀疑病毒是由IE感染的；

病毒会在硬盘根目录新建autorun.inf，和可执行msrs.exe，打开硬盘时运行病毒程序；

在C:\\Program Files\\Internet Explorer产生xx.pif、2.pif、4.pif等文件；

------------------

**解决方法：**

暂无，可以重装系统解决。

注意重装系统后，使用DOS工具或者WindowsPE工具，进入硬盘根目录，删除autorun.inf文件和autorun.inf文件中列出的可执行文件（以Windows徽标为图标）。
