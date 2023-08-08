---
title: "硬盘安装Ubuntu 8.04"
date: "2008-08-25"
author: gaoch
tags:
  - 百度空间
---

1 设置Grub  
  
将grldr复制到C盘根目录下面，并且从Ubuntu的iso文件中提取出grub，置于C盘根目录下。设置boot.ini文件，加上一行：C:\\grldr=“Grub”  
  
2 准备文件  
  
提取iso文件中的casper文件夹中的initrd.gz和vmlinuz文件，将其放置于ubuntu的iso同一分区下面。  
重新启动电脑  
  
3 进入LiveCD环境  
  
选择Grub，进入Grub环境，按“c“进入命令模式：  
  
注意：root命令下面的内容因人而异。如果不行，请试试0,3 0,5之类的。  
root （hd0,4)  
kernel /vmlinuz的路径/vmlinz boot=casper
iso-scan/filename=/iso文件的目录/ubuntu.iso  
initrd /initrd的路径/initrd.gz  
boot  
  
4 从LiveCD安装Ubuntu  
  
该步骤从略。  
  
资源：http://hi.baidu.com/clceline/blog/item/5af866605b24c444ebf8f890.html  
