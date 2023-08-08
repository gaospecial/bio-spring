---
title: 'MEGA6: Constructing a Phylogenetic Tree on Multiple Sequences'
date: '2016-01-19'
slug: 2016-01-19-mega6-constructing-a-phylogenetic-tree-on-multiple-sequences
tags:
- 生物信息 BIOINFORMATICS
- 生物软件 BIO-SOFTWARE
- alignment
- MEGA
- Phylogeny
- Tree
- 多序列比对
- 进化树
---


[使用BioEdit生成和绘制蛋白质进化树](http://bio-spring.top/bioedit-tree/)
虽然方法简单、上手快，但是由于 BioEdit
功能有限，使用起来很不方便。如果经常进行类似分析，那还是要使用 MEGA 6
这一个系统进化分析的“大杀器”。

第一步：下载和安装 MEGA 6。各平台均有发行版，在此不再赘述。

第二步：多序列比对，这是构建系统进化树的必要条件。

点击第一个按钮，选择 Edit/Build Alignment。  
<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2016/01/mega0.png" class="alignnone size-full wp-image-782" width="392" height="61" alt="mega0" />

正如题目所说的，我们需要选择一个含有多个序列的 Fasta 文件。  
<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2016/01/mega1.png" class="alignnone size-full wp-image-784" width="223" height="146" alt="mega1" />

从菜单选择 Alignment – Align By xxx
如果序列比较多，那比对需要花上一些时间。

<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2016/01/mega2-500x307.png" class="alignnone size-medium wp-image-785" sizes="(max-width: 500px) 100vw, 500px" srcset="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2016/01/mega2-500x307.png 500w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2016/01/mega2.png 753w" width="500" height="307" alt="mega2" />

第三步：进化分析。  
在比对完成的窗口中直接选择 Phylogenetic Analysis。  
<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2016/01/mega3-500x307.png" class="alignnone size-medium wp-image-781" sizes="(max-width: 500px) 100vw, 500px" srcset="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2016/01/mega3-500x307.png 500w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2016/01/mega3.png 753w" width="500" height="307" alt="mega3" />

第四步：构建进化树。  
在主窗口页面上点击 Phylogeny 这个按钮，选择一种方法构建进化树，  
<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2016/01/mega6.png" class="alignnone size-full wp-image-783" width="336" height="201" alt="mega6" />

点击 Compute 开始计算。  
<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2016/01/mega4-500x476.png" class="alignnone size-medium wp-image-779" sizes="(max-width: 500px) 100vw, 500px" srcset="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2016/01/mega4-500x476.png 500w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2016/01/mega4.png 504w" width="500" height="476" alt="mega4" />

现在你将得到你所需要的进化树了。  
<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2016/01/mega7-490x500.png" class="alignnone size-medium wp-image-780" sizes="(max-width: 490px) 100vw, 490px" srcset="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2016/01/mega7-490x500.png 490w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2016/01/mega7.png 540w" width="490" height="500" alt="mega7" />
