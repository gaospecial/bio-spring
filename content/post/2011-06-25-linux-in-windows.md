---
title: 在windows中获得Linux使用环境
date: '2011-06-25'
slug: 2011-06-25-linux-in-windows
tags:
- 信息技术 INFORMATICS
- 操作系统 LINUX
- cygwin
- unxutils
- virtualBox
- Windows
- 虚拟机
---


<span lang="EN-US"><http://www.virtualbox.org/></span>

<span lang="EN-US"><http://www.cygwin.com/></span>

<span lang="EN-US"><http://unxutils.sourceforge.net/></span>

<span lang="EN-US">Linux</span><span style="font-family:宋体;
mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:
宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;
mso-hansi-theme-font:minor-latin">系统中的一些优越性特别是</span><span
lang="EN-US">bash</span><span
style="font-family:宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:
Calibri;mso-hansi-theme-font:minor-latin">的优越性是</span><span
lang="EN-US">windows</span><span
style="font-family:宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:
Calibri;mso-hansi-theme-font:minor-latin">系统不具备的。然而</span><span
lang="EN-US">Linux</span><span
style="font-family:宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:
Calibri;mso-hansi-theme-font:minor-latin">运行在</span><span
lang="EN-US">PC</span><span
style="font-family:宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:
Calibri;mso-hansi-theme-font:minor-latin">上，却又无法提供如</span><span
lang="EN-US">Windows</span><span
style="font-family:宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:
Calibri;mso-hansi-theme-font:minor-latin">般的优越的用户界面，特别是</span><span
lang="EN-US">office</span><span
style="font-family:宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:
Calibri;mso-hansi-theme-font:minor-latin">之类的常用软件。</span><span
lang="EN-US"></span>

<span style="font-family:宋体;mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin">为了同时得到</span><span
lang="EN-US">Windows</span><span
style="font-family:宋体;mso-ascii-font-family:
Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin">和</span><span
lang="EN-US">Linux</span><span
style="font-family:宋体;mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin">提供给我们的便利，有很多种方法。比如，你可以安装双系统，双系统带来的是“实质性”的体验。然而，为了能随时在“系统”之间切换，我会选择安装一个虚拟机。那么，</span><span
lang="EN-US">VirtualBox</span><span
style="font-family:宋体;mso-ascii-font-family:
Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin">是个不错的选择。</span><span
lang="EN-US"></span>

<span lang="EN-US">VirtualBox</span><span style="font-family:
宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:
宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;
mso-hansi-theme-font:minor-latin">的性能与“实体机”十分相似，界面友好，速度很快。值得推荐。</span><span
lang="EN-US"></span>

<span style="font-family:宋体;mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin">慢慢的，你会觉得虚拟机用起来还是不太方便。你不得不打开虚拟机软件，运行你的“虚拟机”，内存慢慢的不足，系统反应变慢。渐渐地，我觉得不应该这么对待我的老爷机了。寻找别的方法吧。</span><span
lang="EN-US"></span>

<span style="font-family:宋体;mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin">于是安装了</span><span
lang="EN-US">cygwin</span><span
style="font-family:宋体;mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin">。该软件在</span><span
lang="EN-US">windows</span><span
style="font-family:宋体;mso-ascii-font-family:
Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin">系统中构建一个完整的</span><span
lang="EN-US">Linux</span><span
style="font-family:宋体;mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin">命令提示符，甚至还可以安装图形界面。</span><span
lang="EN-US"></span>

<span style="font-family:宋体;mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin">不过呢，我发觉大部分用到</span><span
lang="EN-US">Linux</span><span
style="font-family:宋体;mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin">的时候，仅仅是为了适应</span><span
lang="EN-US">grep</span><span
style="font-family:宋体;mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin">，</span><span
lang="EN-US">awk</span><span
style="font-family:宋体;mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin">等命令。于是我就单纯的把这么几个可执行程序放到了</span><span
lang="EN-US">Windows</span><span
style="font-family:宋体;mso-ascii-font-family:
Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin">系统中了。于是下载了</span><span
lang="EN-US">unxutils</span><span
style="font-family:宋体;mso-ascii-font-family:
Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin">。该程序只有</span><span
lang="EN-US">1M</span><span
style="font-family:宋体;mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin">多哦，只有</span><span
lang="EN-US">1M</span><span
style="font-family:宋体;mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin">多。安装之后，提供了</span><span
lang="EN-US">34</span><span
style="font-family:宋体;mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin">个常用命令。</span><span
lang="EN-US">  
</span><span
style="font-family:宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:
minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;
mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin">遗憾地是，失去了对管道的支持了。</span><span
lang="EN-US"></span>

<span lang="EN-US"> </span>

<span style="font-family:宋体;mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin">以上</span><span
lang="EN-US">3</span><span
style="font-family:宋体;mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin">种方法，各有优略，视情况各取所需吧。</span><span
lang="EN-US"></span>
