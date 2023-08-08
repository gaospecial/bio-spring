---
title: 重新安装bioperl
date: '2010-10-28'
slug: 2010-10-28-reinstall-bioperl
tags:
- 信息技术 INFORMATICS
- 操作系统 LINUX
- 生物软件 BIO-SOFTWARE
- BioPerl
- Ubuntu
---


**此文适合一下情况：**  
更新BioPerl时，想彻底删除旧版程序，安装一个完整的全新BioPerl；  
安装BioPerl后出错，需要从头安装。

重新安装时不会自动覆盖老板本，因此需要手动删除以下文件：  
*bioperl位于以下目录：*  
/usr/local/man/man3/Bio::\*  
/usr/local/bin/bp\_\*  
/usr/local/man/man1/bp\_\*  
/usr/local/share/perl/5.8.8/Bio/

然后再进行安装即可。

&gt;perl Build.PL  
&gt;./Build test

&gt;./Build install

If your system is Ubuntu, just type the following command in terminal:  
` sudo apt-get install bioperl `

Posted from [GScribble](http://sourceforge.net/projects/gscribble/).
