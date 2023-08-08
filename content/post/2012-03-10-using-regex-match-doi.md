---
title: 使用正则表达式匹配DOI
date: '2012-03-10'
slug: 2012-03-10-using-regex-match-doi
tags:
- 信息技术 INFORMATICS
- 原创教程 TUTORIAL
- 数据挖掘 DATA MINING
- DOI
- perl
- 正则表达式
---


先看几个DOI的例子：

-   10.1093/nar/gkh458
-   10.1146/annurev.micro.112408.134233
-   10.1183/09031936.02.00400202

可以看出，DOI的编码以“10”开始，可以含有数字\]0-9\]，小数点，斜杠等分隔，但是其中不会出现空格。鉴于此，在perl中使用以下正则表达式匹配：

\[cc lang=”perl”\]  
$str1 =\~ /10\\.\[^\\s\\/\]+\\/\[^\\s\]+/; \# borrowed from Zotero  
$str2 =\~ /\\b(10\\.\\d+\\/\[^\\s\]+)\\b/; \# another one  
\[/cc\]
