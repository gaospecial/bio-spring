---
title: 关于GFF3格式
date: '2010-10-28'
slug: 2010-10-28-about-gff3
tags:
  - 旧文
  - WordPress
  - GFF
  - GFF3
author: gaoch
categories:
  - 其它
  - 信息技术
  - 生物学
---


GFF3是GFF注释文件的新标准。文件中**每一行**为基因组的一个属性，分为**9**列，以TAB分开。

依次是：

1\. reference sequence：参照序列  
指出注释的对象。如一个染色体，克隆或片段。可以有多个参照序列。

2\. source ：来源  
注释的来源。如果未知，则用点（.）代替。

3\. type ：类型  
属性的类型。建议使用符合SO惯例的名称（sequence
ontology，参看\[\[Sequence Ontology Project\]\])
,如gene，repeat\_region，exon，CDS等。

4\. start position ：起点  
属性对应片段的起点。从1开始计数。

5\. end position ：终点  
属性对应片段的终点。一般比起点的数值要大。

6\. score ：得分  
对于一些可以量化的属性，可以在此设置一个数值以表示程度的不同。如果为空，用点（.）代替。

7\. strand ：链  
“＋”表示正链，“－”表示负链，“.”表示不需要指定正负链。

8\. phase ：步进  
对于编码蛋白质的CDS来说，本列指定下一个密码子开始的位置。可以是0，1或2，表示到达下一个密码子需要跳过的碱基个数。  
对于其它属性，则用点（.）代替。

9\. attributes ：属性  
一个包含众多属性的列表。格式为“标签＝值”（tag=value）。不同属性之间以分号相隔。可以存在空格，不过若有“,=;”则用URL转义（URL
escaping rule），同时TAB也需要转换为“%09”表示。  
下列的标签已定义：

ID  
指定一个唯一的标识。对属性分类是非常好用（例如查找一个转录单位中所以的外显子）。  
Name  
指定属性的名称。展示给用户的就是该属性。  
Alias  
名称的代称或其它。当存在其它名称时使用该属性。  
Note  
描述性的一些说明。  
Alias和Note可以有多个值，不同值之间以逗号分隔。  
如：Alias=M19211,gna-12,GAMMA-GLOBULIN

Other good stuff can go into the attributes field, as we shall see
later.

Posted from [GScribble](http://sourceforge.net/projects/gscribble/).
