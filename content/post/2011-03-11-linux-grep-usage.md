---
title: Linux grep的用法
date: '2011-03-11'
slug: 2011-03-11-linux-grep-usage
tags:
- 信息技术 INFORMATICS
- 操作系统 LINUX
- grep
- linux
---


<div align="left">

在文件夹中搜索其中的js文件  

</div>

\[bash\]grep function \*.js\[/bash\]

在当前文件夹和子文件夹中搜索所有文件  
\[bash\]grep -d recurse -i ‘function\_input’ \*\[/bash\]  
注意，在此处使用\*.\*和\*，结果会有所不同。

从文件中读取**<u>Pattern</u>**  
\[bash\]grep -f pattern\_file search\_file\[/bash\]  
需要注意的是，在pattern\_file中，不能有空行存在，如果有空行存在，得不到想要的结果。这个bug困扰了我好久啊。
