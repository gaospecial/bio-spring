---
title: “破解”zotero：打开zotero查找重复的功能
date: '2011-05-09'
slug: 2011-05-09-zotero-dup-remove
tags:
- 信息技术 INFORMATICS
- 原创教程 TUTORIAL
- firefox
- zotero
- 文献管理
---


在文献管理软件EndNote中，有一项功能“查找重复”，个人觉得很有用。但是你一旦发现作为一个后期之秀，免费开源的文献管理软件——zotero，却没有这个功能，很纠结对不？

我是很纠结。所以我一发现可以打开zotero的查找重复功能之后，马上分享给大家。

在查看zotero的源代码的时候，我发现zotero本身带有“Show
Duplicates”的菜单项，只是被开发者隐藏了。可能是正在开发中，但是我发现这个功能其实是可用的。我打开“Show
Duplicates”的功能之后，可以正确的在库中找到重复的文献，并列出来。

说了这么多废话，下面介绍一下怎么做：

首先，找到你的firefox的profile文件夹，具体可以参看：http://support.mozilla.com/en-US/kb/Profiles。  
在windows系统中，按住“win徽标键+R”，打开运行命令框，输入“%APPDATA%\\Mozilla\\Firefox\\Profiles\\”，回车就会打开profile文件夹。

然后，进入profile文件夹。通常只会有一个以“.default”结尾的文件夹，依次打开p8oh3vmw.default
》 extensions 》 zotero@chnm.gmu.edu 》chrome文件夹，会发现一个文件
zotero.jar
。这是一个zip格式压缩的文件，将该文件用winrar解压缩（到当前文件夹即可）。

接着，进入 content 》 zotero 文件，用文本编辑器打开  zoteroPane.xul
文件，找到下面一行：

<span class="filepath">&lt;menuitem
id=”zotero-tb-actions-showDuplicates” label=”Show Duplicates”
oncommand=”ZoteroPane\_Local.showDuplicates()” hidden=”true”/&gt;  
</span>  
<span class="filepath">将其改为：</span><span class="filepath">  
&lt;menuitem id=”zotero-tb-actions-showDuplicates” label=”Show
Duplicates” oncommand=”ZoteroPane\_Local.showDuplicates()”
hidden=”false”/&gt;</span>

然后，返回上级目录，将整个原来解压缩出来的东西重新打包，命名为zotero.jar，并替换掉相应的原文件。

恭喜你，成功了！

现在重新打开firefox试一试。你会发现在zotero的齿轮图标下面，多了一个”Show
duplicates“的项目，点点，看是不是你想要的。  
![](https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2011/05/1.png)

备注：  
本操作在zotero 2.1.6版本上实验成功，与2.1以下版本可能并不兼容。  
如果觉得麻烦，可以找我要改好的zotero文件，请自行查毒。
