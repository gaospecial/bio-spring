---
title: 如何检查BioPerl是否正确安装
date: '2010-12-31'
slug: 2010-12-31-check-bioperl
tags:
- BioPerl BIOPERL
- 生物软件 BIO-SOFTWARE
- BioPerl
- perldoc
---


为了检查BioPerl是否安装正确，我们可以使用perldoc命令来看一下。

如果你是Linux系统，随意打开一个终端；如果用的是Windows系统，那么打开命令提示符。输入以下命令：

\[bash\]

perldoc Bio::SeqIO

\[/bash\]

以上命令的作用是查看Bio::SeqIO模块的文档是否存在，如果存在，则会有相应的文档输出，则你安装Bio::SeqIO模块；如果没有，说明Perl找不到该模块，你还没有安装Bio::SeqIO模块。

引物Bio::SeqIO是BioPerl的基础模块，所以，你懂的，其它的一些模块也可以的，比如Bio::Seq 
Bio::SearchIO等等。

此外，对于Perl的其它模块是否正确安装，也可以用perldoc命令检查一下。比如Bio::Graphics模块，并不保护在BioPerl的“安装包”内，所以对于要使用Gbrowser的同学来讲，需要手动安装该模块。

 

新年到了，祝看到这篇文章的同学新年快乐。

<span style="color: #ff0000; font-size: large;">Happy new year！</span>

 
