---
title: "什么是 Load ? 什么是 Load Average ?"
date: "2008-09-17"
author: gaoch
tags:
  - 百度空间
---

什么是 Load ? 什么是 Load Average ?

Load 就是对计算机干活多少的度量。也有简单的说是进程队列的长度. Load
Average 就是一段时间 (1 分钟、5分钟、15分钟) 内平均 Load 。

下面是一个 uptime 命令输出：

  
如何判断系统是否已经 Over Load ?

对一般的系统来说，根据 CPU 数量去判断，如上面的例子， 如果平均负载始终在
1.2 以下，而你是 2 颗 CPU 的机器。那么基本不会出现 CPU
不够用的情况。也就是 Load 平均要小于 CPU 的数量。
