---
title: 删除Zotero自动生成的Tags或关键词
date: '2012-03-14'
slug: 2012-03-14-delete-zotero-autotags
tags:
- 信息技术 INFORMATICS
- 原创教程 TUTORIAL
- 生物信息 BIOINFORMATICS
- 生物软件 BIO-SOFTWARE
- 自然科学 NATURE & SCIENCE
- 转载 SHARE
- firefox
- sqlite
---


添加项目时，Zotero默认将关键词以Tag的形式加入，这样可以快速的查看与某一关键词相关的条目。可是自动加入的Tag或关键词有太多太多，时间一长，Zotero数据库中会产生成百上千个关键词或Tag，导致其失去了便于检索的应用价值。

所以，建议在取消该选项，而改为人工添加更加简单易记的关键词或Tag。

那么，对于已经存在的Tag如何一下子全部删除呢？按照下面的步骤操作即可。

-   打开Zotero配置页面，选择高级（Advanced），点击“打开数据名录”（Show
    data directory）；
-   关闭Firefox，关闭之前将本文用IE打开，或复制到一个文档中，以便随时参考；
-   复制“数据目录”中的“zotero.sqlite”为“zotero.sqlite.bak”，即备份Zotero数据库；
-   下面对Zotero数据库进行查询，可以使用任何熟悉的数据库工具，这里以“<span
    style="font-family: Arial;"><span
    style="font-family: Arial; color: #000000; font-size: 12pt;">SharpPlus
    SQlite Developer”，操作如下：</span></span>

> 1.  <span style="font-family: Arial;"><span
>     style="font-family: Arial; color: #000000; font-size: 12pt;">注册数据库，根据向导选择zotero.sqlite文件。</span></span>
> 2.  <span style="font-family: Arial;"><span
>     style="font-family: Arial; color: #000000; font-size: 12pt;">双击导入的数据库。</span></span>
> 3.  选择“工具”-“SQL编辑器”，在其中输入以下代码：  
>     \[cc lang=”sql”\]delete from itemTags where itemTags.tagID in
>     (select  
>     tags.TagID from tags where type = 1);  
>     delete from tags where type = 1;\[/cc\]
> 4.  选择“运行”，即窗口中第一个图标。
> 5.  这时候，窗口下半部分应当有信息出现“Query OK…”等等。

-   关闭该工具，重新打开Firefox。
-   完成。

Refer：<http://forums.zotero.org/discussion/4051/remove-all-tags/>
