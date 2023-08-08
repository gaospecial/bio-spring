---
title: "再续-linux shell 提示符---ANSI颜色码"
date: "2007-12-11"
author: gaoch
tags:
  - 百度空间
---

上一次的shell提示符文章好像已经被多处转载了,虽然没有注明出处,但是俺还是很高兴,所以再来补充一下.  
现在的shell:  
[<img src="http://hiphotos.baidu.com/spring%5Fgao/abpic/item/3b28aa34080434bad1a2d364.jpg" class="blogimg" />](http://hiphotos.baidu.com/spring%5Fgao/pic/item/3b28aa34080434bad1a2d364.jpg)这里的图像是从编辑-当前配制文件里面改的,可以很方便的设置.设置成透明也很炫的.  
自己去发掘一下吧?  
  
ANSI颜色码.  
上次提到\\\[\\033\[01;32m\\\]表示了shell中它后面的成分的格式.  
这里补齐一下:  
00:关闭所有属性   01:粗体   02:浅色   04:下划线   05:闪烁   07:反转  
30-37:字体的颜色\[共有八种,不记得谁是谁了,不妨每个试一下吧\]  
40-47:背景的颜色(和上面的颜色一一对应的)  
  
关于shell,还可以设置一下alias方便你的执行.  
更多的linux的问题,请参看鸟哥的私房菜吧.\[本文是原创\]
