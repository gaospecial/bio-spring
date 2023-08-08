---
title: 不要在RStudio中使用Git GUI
author: gaoch
date: '2018-10-24'
slug: donot-use-the-git-gui-of-rstudio
categories:
  - R
tags:
  - RStudio
  - git
---

有一个数据分析的小项目，使用Git记录分析过程。

在添加了一些文件、删除了一些文件之后，在RStudio的Git标签页下面点击复选框Stage，界面失去响应。反复重启，仍然如此。

上网查了一下，确实很多人吐槽类似的问题。

不过，在当前Git目录下打开Git GUI使用，一切正常。

RStudio的Git GUI性能确实比较差。