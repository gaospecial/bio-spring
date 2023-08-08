---
title: Zotero中分类包含子分类
date: '2017-12-04'
slug: 2017-12-04-include-subcolletion-items-in-collection
tags:
- 原创教程 TUTORIAL
- 生物软件 BIO-SOFTWARE
- zotero
---


Zotero中可以将不同文献分门别类，放在不同的文件夹中，称为（collection）。同时文件夹中还可以创建子文件夹，称为subcollection。默认情况下，除非你将对应条目添加到父文件夹中，否则子文件夹中的条目在上一级文件夹中并非是可见的。这不符合我们的使用习惯。

如何在上一级文件夹中包含下属文件夹中的所有文献信息呢？答案就是设置一个参数。

这个参数在高级设置里面。打开方式如下图：

<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/12/advanced-500x453.png" class="alignnone size-medium wp-image-921" sizes="(max-width: 500px) 100vw, 500px" srcset="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/12/advanced-500x453.png 500w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/12/advanced.png 616w" width="500" height="453" />

找到 recursiveCollections
这一行。其默认值是False，双击就可以将其改为True。

<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/12/advanced-2-500x182.png" class="alignnone size-medium wp-image-922" sizes="(max-width: 500px) 100vw, 500px" srcset="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/12/advanced-2-500x182.png 500w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/12/advanced-2-768x280.png 768w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/12/advanced-2.png 931w" width="500" height="182" />

搞定！

Ref: https://www.zotero.org/support/preferences/hidden\_preferences
