---
title: 修复Bio::Tree::Draw::Cladogram 输出EPS BoundingBox错误的问题
date: '2013-12-25'
slug: 2013-12-25-fix-eps-boundingbox-error
tags:
- BioPerl BIOPERL
- 原创教程 TUTORIAL
- BioPerl
- perl
- Tree
---


使用Bio::Tree::Draw::Cladogram 输出的 EPS 文档在很多 EPS
查看软件（如Windows下面的ACDsee，gsView等）中不能打开，经查是由于
BoundingBox 出现浮点数所致，具体设计的代码为 Cladogram.pm 的 new 方法和
print 方法，简便起见，可以在原先的 443
行代码前面添加两行代码，以解决该问题。

 

如下所示 ：

\[perl\]

print $INFO “%!PS-Adobe-\\n”;  
$width = int($width + 1); \# BoundingBox should be int  
$height = int($height +1);  
print $INFO “%%BoundingBox: 0 0 “, $width, ” “, $height, “\\n”;  
print $INFO “1 setlinewidth\\n”;  
print $INFO “/$font findfont\\n”;  
print $INFO “$size scalefont\\n”;  
print $INFO “setfont\\n”;

\[/perl\]

经测试，修改此处后，生成的　ＥＰＳ　文档不会再由于该错误无法打开和查看。
