---
title: 清理Windows 10系统盘
date: '2017-10-11'
slug: 2017-10-11-cleaning-drive-c-in-win10
tags:
- 原创教程 TUTORIAL
- 操作系统 LINUX
- Win10
- 系统清理
---


Windows最近发了个大更新。自国庆节期间更新系统之后，50G的系统盘已经几乎被填满了。Windows就是这么臃肿，越用越慢。这方面真是大不如Linux。用了几年的Ubuntu根目录才1G左右，简直把Windows吊打的渣都不剩。

吐槽归吐槽，但是还是不得不着手对系统进行清理。

首先打开系统自带的磁盘清理工具，19.2G的Windows.old清理之后，感觉清爽了不少。

其次，打开磁盘占用分析神器
[RidNacs](http://bio-spring.top/disk-usage-tools-in-different-platform/)
扫描C盘，发现 System32\\DriverStore 臃肿的不堪入目。居然占用了15G空间。

<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/10/disk-usage-of-C-500x415.png" class="alignnone size-medium wp-image-888" sizes="(max-width: 500px) 100vw, 500px" srcset="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/10/disk-usage-of-C-500x415.png 500w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/10/disk-usage-of-C.png 603w" width="500" height="415" />

使用 [DriverStore
Explorer](https://github.com/lostindark/DriverStoreExplorer/releases)
查看，可以发现，绝大多数都是N卡的显卡驱动。每个驱动400M，总共有好几十个。

<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/10/graphic-drivers-500x343.png" class="alignnone size-medium wp-image-889" sizes="(max-width: 500px) 100vw, 500px" srcset="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/10/graphic-drivers-500x343.png 500w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/10/graphic-drivers-768x527.png 768w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/10/graphic-drivers.png 945w" width="500" height="343" />

NVIDIA也是个怀旧的公司，每次更新驱动，都会将老版驱动做一个备份，于是这个文件夹就越来越大了。不得不说，在这一点上跟Windows还是挺一致的。

下一步，准备把所有旧驱动删掉。通过设备管理器确认现在正在使用的显卡驱动就是上面图片中最新的哪一款，于是将其它所有NV驱动选中，使用
DriverStore Explorer 删除。

<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/10/NV0-407x500.png" class="alignnone size-medium wp-image-891" sizes="(max-width: 407px) 100vw, 407px" srcset="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/10/NV0-407x500.png 407w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/10/NV0.png 479w" width="407" height="500" />

<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/10/NV-358x500.png" class="alignnone size-medium wp-image-890" sizes="(max-width: 358px) 100vw, 358px" srcset="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/10/NV-358x500.png 358w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2017/10/NV.png 408w" width="358" height="500" />

此外，还发现一个文件夹非常大。就是这个：C:\\Users\\All
Users\\Microsoft\\DataMart\\PaidWiFi\\OffersCache\\Offers

从命名上来看，这纯粹是个广告嘛。于是保留了 zh-cn 以外，其余全部删除。

 

<http://www.gqgtpc.com/thread-102248-1-1.html>
