---
title: Ubuntu 10.10环境下安装GScribble
date: '2010-10-28'
slug: 2010-10-28-ubuntu-gscribble
tags:
- 信息技术 INFORMATICS
- 操作系统 LINUX
- GScribble
- gtkhtml2
- Python
- Ubuntu
- 博客客户端
---


GScibble是Linux下面的优秀的博客程序客户端，比Blogtk界面友好。可以读取Wordpress的分类信息，还可以编辑已发布的条目。  
为了在我的Ubuntu
10.10环境下安装该程序，我还是处理了几个小问题，在这里Mark一下。  
[<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2010/10/2010-10-28-203549_714x532_scrot-300x223.png" title="GScribble界面" class="alignnone size-medium wp-image-28" sizes="(max-width: 300px) 100vw, 300px" srcset="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2010/10/2010-10-28-203549_714x532_scrot-300x223.png 300w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2010/10/2010-10-28-203549_714x532_scrot.png 714w" width="300" height="223" />](https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2010/10/2010-10-28-203549_714x532_scrot.png)  
首先，安装过程中的问题。  
安装文件可以从SF下载：http://sourceforge.net/projects/gscribble/  
按照安装文件INSTALL的说明操作即可。  
1. $ chmod +x setup.py  
2. $ sudo ./setup.py install  
我的系统缺少python-gtkhtml2的库，打开新立得软件包管理器，搜索之后安装，即可完成安装。

其次，Python的版本问题。  
我原先的Python版本为2.5。安装之后启动程序不成功。于是我安装了Python2.6,并将默认的Python链接到Python2.6上。

现在，可以使用GScribble方便的发布更新了。

小提示：如果程序无法正常启动，可以在终端输入gscribble的方式试试，终端中的错误提示会对你有帮助的。

Posted from [GScribble](http://sourceforge.net/projects/gscribble/).
