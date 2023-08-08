---
title: "发布 `ggVennDiagram` 0.5.0"
author: Chun-Hui Gao
date: '2021-03-01'
slug: release-ggvenndiagram-0-5-0
categories:
  - R
  - ggplot2
tags:
  - R
  - ggVennDiagram
---


昨天正式发布了 `ggVennDiagram` 0.5.0. 上一个在 CRAN 的版本是 0.3，之所以中间跳了
一下，是因为当初自己还不清楚如何更新已经发布在 CRAN 上的 R 包。

这次是通过 `devtools::release()` 来自动化发布的。不得不说这个工具的出现，真的大大
方便了 R 包的开发。对包作者的崇敬之情油然而生。

简单来说还是分成以下几个步骤：

- 更新软件包的功能；
- 按照 `release()` 函数的指引一步步完成发布前的准备工作，并将其提交到 CRAN；
- 到作者邮箱中检查 CRAN 发来的确认邮件，确认提交；
- 如果 CRAN 有邮件回复，解决其提出来的问题；
- 最后，CRAN 会在 R 包上线后发出一封邮件通知；
- 这时，回到自己的 GitHub，为新版本创建一个 tag。

![新鲜出炉的新版本](https://vnote-1251564393.cos.ap-chengdu.myqcloud.com/typora-img/ggVennDiagram_0.5.0.png)

新版本刚刚上线，可以看到只有源代码更新了，Windows 等系统下的二进制还没有编译更新。

到如今，才算是真正走通了 R 包开发的流程。
