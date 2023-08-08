---
title: 处理设计引物时候的PRIMER_ERROR=Missing SEQUENCE tag错误
date: '2011-09-21'
slug: 2011-09-21-primer_error-missing-sequence-tag
tags:
- BioPerl BIOPERL
- 信息技术 INFORMATICS
- 原创教程 TUTORIAL
- 生物信息 BIOINFORMATICS
- 生物学 BIOLOGY
- BioPerl
- primer
---


###### Update：You May **directly** use our [Massive RT-PCR Primer Designer](http://tools.bio-spring.top/rtprimers.cgi) from Jan 16, 2016.

————————————————————————————————————-  
我先前曾经写过一个设计RT-PCR引物的脚本，当初运行良好，所以把它给分享了出来（**[在这里](http://bio-spring.top/?p=44)**）。最近又用发现会有错误，“Missing
SEQUENCE tag”，经过分析，最终解决了这个问题。

方法如下：

\[cc lang=’bash’\]sudo gedit
/usr/local/share/perl/5.10.1/Bio/PrimerDesigner/primer3.pm\[/cc\]  
将其中的SEQUENCE换成SEQUENCE\_TEMPLATE即可。总共要换三四个位置。

造成这一错误的原因在于Primer3和Bio::PrimerDesigner的API不兼容。
前者使用“SEQUENCE\_TEMPLATE”作为引物的模板，而后者确传递给primer3引物设计程序一个“SEQUENCE”参数，从而造成引物设计上的失败。
