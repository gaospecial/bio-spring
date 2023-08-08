---
title: 使用poEdit汉化wordpress插件、主题攻略
date: '2012-02-26'
slug: 2012-02-26-poedit-wordpress-plugins
tags:
- 信息技术 INFORMATICS
- 原创教程 TUTORIAL
- mo
- po
- poEdit
- theme
- wordpress
- 主题
- 汉化
---


<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2012/02/565px-Pic1.jpg" width="565" height="600" />

关于“*.pot”文档、“*.po”文档和“\*.mo”文档的来历见上面图片。

简而言之，这是一个开源软件本地化（或者国际化）的系统。而且是一个能够自动化运行的系统。使用该系统仅仅需要一个前提，就是在调用文本相关的函数时遵循一个特定的约定。例如WordPress
使用 \_e 和 \_\_ 函数来本地化。如下所示：

\[cc lang=”php”\]\[/cc\]

现在要汉化一个插件或者主题，就打开源文件，看看是否存在这样的语句。如果存在，则进入下一步。

先简介一下（<http://www.jinbo123.com/2503.html>）：

一、三种文件  
.po文件，.mo文件，.pot文件是由gettext程序生成或者使用的源代码和编译结果。

1、.pot文件  
是一种模板文件，其实质与.po文件一样，其中包含了从源代码中提取所有的翻译字符串的列表。  
2、.po文件  
各语言对应的po文件，比如中文就是zh\_CN.po，法语就是fr.po文件。  
PO是Portable
Object（可移植对象）的缩写形式，它是面向翻译人员的、提取于源代码的一种资源文件。  
.po文件可以用任何编辑器如poEdit，vi，Emacs，editplus打开，交给翻译人员来将其中的文字翻译成本国语言。  
3.mo文件  
mo文件是一个二进制文件，不能直接编辑。  
MO是Machine
Object（机器对象）的缩写形式，它是面向计算机的、由.po文件通过GNU
gettext工具包编译而成的二进制文件，应用程序通过读取.mo文件使自身的界面转换成用户使用的语言，如简体中文。  
可以用工具如msgunfmt命令将.mo文件反编译为.po文件。

一般情况下，我们在汉化的时候会碰上如下几种情况：

二、几种情形  
1、如果程序本身提供了.po文件，直接使用poEdit汉化，并自动生成.mo文件。  
2、如果程序提供了.pot文件，复制一份并更改后缀名为.po，再使用poEdit汉化，最后生成.mo文件。  
3、程序既没有提供.po文件，也没有提供.pot文件，只提供了.mo文件，那么将.mo文件转换成.po文件。

汉化需要用到的软件就是PoEdit（<http://www.poedit.net/>）。参见<http://laycher.com/?p=738>

将汉化的文档命名为“zh\_CN.po”和“zh\_CN.mo”，复制到插件或主题中的“languages”文件夹中，如没有该文件夹，则新建一个。

然后，刷新一下，就会看到主题被汉化了（注意：wordpress设置的语言需为zh\_CN）。
