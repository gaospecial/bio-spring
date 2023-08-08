---
title: 使用BioEdit生成和绘制蛋白质进化树
date: '2011-07-20'
slug: 2011-07-20-bioedit-tree
tags:
- 信息技术 INFORMATICS
- 原创教程 TUTORIAL
- 生物学 BIOLOGY
- 生物软件 BIO-SOFTWARE
- BioEdit
- TreeView
- 进化树
---


BioEdit是一个功能很强大的生物学软件，整合了很多常用的生物信息工具。如：多序列比对，质粒图谱的绘制，查看DNA序列的酶切位点等等。

使用BioEdit可以方便的生成和绘制进化树。（另请参考：[进化树大杀器MEGA的使用](http://bio-spring.top/mega6-constructing-a-phylogenetic-tree-on-multiple-sequences/)）

首先，打开序列。我们这里是一个含有6个蛋白质的Fasta格式的文件。如下所示：  
![](https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2011/07/menu.png)  
然后从菜单中选择“ClustalW多序列比对”，会弹出下一个对话框，设置一些程序运行的参数。  
![](https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2011/07/para.png)  
我们这里采用了默认配置，直接点击“Run
ClustalW”按钮。ClustalW程序会以命令行的形式运行，程序运行会在多序列比对完成之后，显示多序列比对的结果，并生成进化树。

“进化树”呢？别着急，进化树已经生成了。现在，我们关闭BioEdit软件。进化树已经在它该在的地方了，我们这就去把它挖出来。

我们来到了BioEdit的安装目录（通常是“C:\\BioEdit”），这里有一个Temp临时文件夹，打开临时文件夹，里面就要我们要的东西了。  
![](https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2011/07/output.png)  
我这里有5个文件，你那里说不定会有别的临时文件。如果无法确定，不妨把这些文件都删除了，重头运行一遍，就这剩下这5个文件了。

正如文件名昭示的那样，第一个文件是一个log文件，第二个文件时程序运行的参数设置，第三个文件是多序列比对的结果，第四个文件时我们的蛋白质序列的一份拷贝，最后一个就是我们需要的进化树了。  
这几个文件其实都是文本文件，可以用“记事本”之类的软件打开的。最后一个进化树用TreeView软件打开，就会得到这样的结果。  
![](https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2011/07/tree.png)  
这是一棵什么树？叶子的标示都不对啊。不好意思，忘记告诉你了，这个dnd文件需要修改一下。将这些“0000000XX”的编号改成我们的序列名称“Seq1，Seq2”等等。用文本编辑器打开最前面和最后面的那个文件。按照log文件中的指示，把dnd文件中的编号改过来吧。

会变成这个样子。  
![](https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2011/07/4.png)  
这是你想要的结果吗？

我们还有一下几种展示方案，敬请选择。  
![](https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2011/07/1.png)

![](https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2011/07/2.png)

![](https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2011/07/3.png)

好了，就这样结束了。如果觉得有问题，请留言吧。BioEdit的，进化树的都可以。

对了，忘记告诉你，如何安装Treeview这个软件了。BioEdit附带了这个软件，不过默认似乎没有安装，在BioEdit的安装目录，有安装包，自行安装一下吧。  
![](https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2011/07/soft.png)

**注意：以上内容在WindowsXP中测试通过，Win7什么的，不能保证哦！**
