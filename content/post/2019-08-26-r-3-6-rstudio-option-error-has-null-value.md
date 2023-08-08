---
title: 升级R到3.6版本后，RStudio使用中出现“option error has NULL value”错误
author: gaoch
date: '2019-08-26'
slug: r-3-6-rstudio-option-error-has-null-value
categories:
  - R
tags:
  - RStudio
---

这个错误有点怪怪的。打开rmarkdown脚本运行时，会一直出现`Error: option error has NULL value`的提示，电脑基本也会卡死。

这个错误是在从R 3.5升级到3.6之后出现的。

其解决方法也很简单，就是升级RStudio软件。不过，发行版的RStudio软件并没有解决这个问题，需要使用preview版本的。

Preview版本的链接有点不大好找，在这里：(https://www.rstudio.com/products/rstudio/download/preview/)。

很多人都遇到了这个问题：(https://community.rstudio.com/t/options-error-in-rmd-code-chunks/30195)。也有人通过其它方法解决了这个问题。

