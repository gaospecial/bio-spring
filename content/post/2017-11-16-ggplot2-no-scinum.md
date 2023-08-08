---
title: ggplot2作图中不使用科学计数法
date: '2017-11-16'
slug: 2017-11-16-ggplot2-no-scinum
tags:
- 生物信息 BIOINFORMATICS
- ggplot2
- R
- 作图
---


科学计数法（1E+5）这种形式不适合大多数图片。拒绝使用的方法有很多，一个比较简单粗暴的方法是设置scipen参数：<span
class="lang:r decode:true crayon-inline">options(scipen = 200)</span> 。

非常好用。
