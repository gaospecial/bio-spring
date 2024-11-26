---
title: Fix “getopts.pl can not be located in @INC” error in SSPACE_Standard_v3.0.pl
date: '2015-08-16'
slug: 2015-08-16-sspace-getopts-error
tags:
  - 旧文
  - WordPress
  - NGS
  - perl
  - SSPACE
  - Ubuntu
  - 错误
author: gaoch
categories:
  - 其它
  - 信息技术
  - 生物学
---


SSPACE是一个常用的Scaffolding软件.当你有新的测序数据时,你可以使用SSPACE将原有的contigs延长,scaffolding等.

在Ubuntu
14.04系统中运行该软件v3.0会出现错误.谷歌也没有发现好的解决方法,最终通过研究源代码,发现这是一个简单的问题,修订源代码之后,终于能够成功运行.

两处修订如下:

\[cc lang=”perl”\]  
\#\~ require “getopts.pl”;  
use Getopt::Std;  
\[/cc\]

\[cc lang=”perl”\]  
\#\~ &Getopts(‘m:o:v:p:k:a:z:s:b:n:l:x:T:g:r:S:’);  
getopt(‘m:o:v:p:k:a:z:s:b:n:l:x:T:g:r:S:’);  
\[/cc\]
