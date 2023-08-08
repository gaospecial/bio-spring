---
title: "在ubuntu中安装Cn3D 4.1"
date: "2009-03-09"
author: gaoch
tags:
  - 百度空间
---

Cn3D依赖以下库，系统默认没有安装。  
libgtk  
libpng  
libtiff  
Cn3D dependence  
  
可以选择新版本的安装，安装之后，做一个链接或者直接复制一下，否则版本号不一致，程序还是启动不了。  
  
在/usr/lib文件夹下面，输入sudo cp libtiff.so.4
libtiff.so.3(libpng的方法类似)  
  
这样就可以用啦。  
