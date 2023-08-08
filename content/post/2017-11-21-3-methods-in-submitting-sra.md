---
title: 三种向NCBI提交SRA高通量测序原始数据的方法
date: '2017-11-21'
slug: 2017-11-21-3-methods-in-submitting-sra
tags:
- 原创教程 TUTORIAL
- 生物信息 BIOINFORMATICS
- Aspera
- FTP
- NCBI
- sra
- 测序
---


将测序原始数据提交到SRA已经逐渐成为投稿的必备条件。对于高通量测序数据来说，动辄几百兆或者更大文件的传输是一个相对比较耗时的部分。NCBI提供了3种方式来提交这部分数据：

1.  网页形式（包括浏览器上传和Aspera Connect插件上传）；
2.  Aspera命令行方式提交；
3.  FTP方式提交。

<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/11/preload1-500x287.png" class="alignnone size-medium wp-image-913" sizes="(max-width: 500px) 100vw, 500px" srcset="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/11/preload1-500x287.png 500w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/11/preload1.png 501w" width="500" height="287" />

## 第一种方式

网页提交应当是用户最熟悉的方式，跟日常上网的操作一样。但是，如果不使用Aspera
Connect插件，一次只能提交一个文件。而且整个提交过程中没有进度提示，是最低效率的方式。然而，通过使用Aspera
Connect插件，可以同时提交多个文件并看到进度。

一般情况下，使用Aspera插件在网页上提交是最方便的、推荐的上传方式。

不过，有时候由于浏览器、网络等存在问题，浏览器并不能正确调用Aspera软件。那就只能用其它方式传输了。

后面两种，都属于先将文件上传到临时文件夹（preloaded），随后再与SRA中的meta
table中的文件列表一一对应起来的方法。

## 第二种方式

第二种方式是我最近一次使用的方式。当时，在浏览器上无法正确启动Aspera软件，并且使用时出现多次蓝屏。当你选择这种方式，需要打开一个命令行，输入网页上提示的命令即可。

下图即网页上面的提示。注意你需要下载一个key
file在命令中使用。同时，还有把所有文件放在一个文件夹中。**相应文件夹中的所有文件都会被上传。**

<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/11/preload5-500x152.png" class="alignnone size-medium wp-image-912" sizes="(max-width: 500px) 100vw, 500px" srcset="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/11/preload5-500x152.png 500w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/11/preload5.png 716w" width="500" height="152" />

命令运行时的界面如下：

<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/11/preload4-500x69.png" class="alignnone size-medium wp-image-911" sizes="(max-width: 500px) 100vw, 500px" srcset="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/11/preload4-500x69.png 500w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/11/preload4-768x106.png 768w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/11/preload4.png 966w" width="500" height="69" />

这种方式传输速度也很快。我用WIFI是的连接速度在30 Mbps左右。

## 第三种方式

第三种方式，应当是最传统的文件传输方式，即FTP方式。选择FTP方式时，网页上会显示FTP服务器的地址、用户名、密码、用户目录等信息。需要注意的是，你并没有服务器根目录的访问权限，因此需要在设置FTP服务器时指定目录（FileZilla）。

首先，打开站点管理器，新建站点，填写主机、用户名、密码等信息。

<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/11/preload2-500x424.png" class="alignnone size-medium wp-image-909" sizes="(max-width: 500px) 100vw, 500px" srcset="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/11/preload2-500x424.png 500w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/11/preload2.png 529w" width="500" height="424" />

其次，进入“高级”标签页，在上面把用户目录填写上。

<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/11/preload3.png" class="alignnone size-full wp-image-910" width="320" height="295" />

这时候就可以连接了。需要注意的是，连接之后，需要在用户目录中新建一个子文件夹（必选操作）。然后才能将文件通过FTP传输到用户目录的新建子文件夹内。

根据我的使用情况，FTP传输的速度只有第二种方法的十分之一不到。除非你网络环境很好，否则不值得推荐。

===================================

综上所述，上传文件首选**带有Aspera插件**的浏览器模式，其次是Aspera命令行模式，再次FTP模式。
