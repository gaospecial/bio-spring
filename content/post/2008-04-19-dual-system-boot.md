---
title: "[Ubuntu资料］Windows和Ubuntu双系统引导的问题（二）"
date: "2008-04-19"
author: gaoch
tags:
  - 百度空间
---

有时候我们找不到Ubuntu，有时候又没有了Windows。这里说一下如何在Windows界面下，使用windows的引导文件配置引导Linux。  
  
Windows的引导文件在C：盘下面，有一个boot.ini文件配置。  
配置引导需要一个grldr（估计就是grub
loadder）的意思，反正我是这么记忆的。  
  
把linux的/boot文件夹拷贝到C：盘根目录下面，和grldr在放在一起，在boot.ini里面加上一行，如下图所示：  
<img src="http://hiphotos.baidu.com/spring%5Fgao/pic/item/d52627a4055b68e59052ee93.jpg" class="blogimg" />  
  
<img src="http://hiphotos.baidu.com/spring%5Fgao/pic/item/af96e1cd9708ff430eb34564.jpg" class="blogimg" />表示：显示选择系统菜单时间为3秒，默认启动grldr（即linux）；  
注意：grldr这个文件是通用的，可以从网上下载到，而boot文件夹每个机器都不一样。

<u>***在Linux下面引导windows的方法。  
  
***</u>有關設置grub默認進入的操作系統的問題（通过编辑Linux下面的menu.lst设定默认启动系统）  
<http://forum.ubuntu.org.cn/viewtopic.php?t=2451>  
  
你想默認進入的操作系統位於第幾項（第n個title）（從0開始計算）。就把0改成n。  
  
下面是一個例子  
  
假定menu.lst如下：  
**代码:** default        0  
  
timeout        1  
  
title        Ubuntu, kernel 2.6.20-16-generic  
root        (hd0,1)  
kernel        /boot/vmlinuz-2.6.20-16-generic
root=UUID=1f9f427a-586a-40ec-a15e-5a3d3ed1cea5 ro quiet splash  
initrd        /boot/initrd.img-2.6.20-16-generic  
quiet  
savedefault  
  
title        Ubuntu, kernel 2.6.20-16-generic (recovery mode)  
root        (hd0,1)  
kernel        /boot/vmlinuz-2.6.20-16-generic
root=UUID=1f9f427a-586a-40ec-a15e-5a3d3ed1cea5 ro single  
initrd        /boot/initrd.img-2.6.20-16-generic  
  
title        Other operating systems:  
root  
  
title    Microsoft Windows XP Pro  
root    (hd0,0)  
savedefault  
makeactive  
chainloader +1  
  
  
  
假如你想把win xp作為默認的操作系統，那就把default 0改為default
3（从0开始数）;  
注意此处““Other operating systems”也算在内。  