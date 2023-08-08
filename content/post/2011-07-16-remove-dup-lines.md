---
title: 使用shell删除文本中的重复行
date: '2011-07-16'
slug: 2011-07-16-remove-dup-lines
tags:
- 信息技术 INFORMATICS
- 操作系统 LINUX
- bash
- shell
---


**使用uniq命令得到不重复的行**  
现有文件如下：  
—————————————————  
my friends, chenhong  
my friends, chenhong  
my friends, chenhong  
my teacher, liyong  
my teacher, liyong  
my teacher, liyong  
my father, wuzhongyi  
my father, wuzhongyi  
my father, wuzhongyi  
my sister, wushiying  
my sister, wushiying  
my sister, wushiying  
—————————————————  
现在欲把文件变成如下：  
—————————————————  
my friends, chenhong  
my teacher, liyong  
my father, wuzhongyi  
my sister, wushiying  
—————————————————

命令：  
\[cc lang=”bash”\]uniq file\[/cc\]

**使用sort和awk删除存在特定列重复的行**

有<span class="t_tag"
href="http://bbs.chinaunix.net/tag.php?name=%CE%C4%BC%FE">文件</span>如下：  
———————-

aa  cc  dd ee

11 34  45 22

bb  cc dd ee

ff cc dd ee

———————-  
现在欲把文件变成如下：  
———————-

aa  cc  dd ee

11 34  45 22

———————-  
\[cc lang=”bash”\]sort -k2,3 \|awk
‘{if(str!=$2$3){str=$2$3;print}}'\[/cc\]

http://bbs.chinaunix.net/viewthread.php?tid=473706  
http://www.linuxsir.org/bbs/thread132848.html
