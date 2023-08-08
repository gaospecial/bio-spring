---
title: Perl中的split函数和join函数：不同的参数书写样式
date: '2011-03-13'
slug: 2011-03-13-perl-split-join
tags:
- 信息技术 INFORMATICS
- perl
---


这两个函数其实是一对孪生函数，它们的作用是恰恰相反的。而我，就一直以为这两个函数的用法相同，其实它们是有很大的不同的。

split的用法

> **split /PATTERN/,EXPR**

\[perl\]split(/(?=\\w)/, ‘hi there!’);\[/perl\]

join的用法

> **join EXPR,LIST**

\[perl\]$rec = join(‘:’,
$login,$passwd,$uid,$gid,$gcos,$home,$shell);\[/perl\]

呵呵，搞不懂我想说什么。其实只是我在使用join函数的时候，用//把第一个参数圈起来了。

你有没有犯过这种错误。
