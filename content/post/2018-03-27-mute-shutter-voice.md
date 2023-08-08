---
title: 静音Office Lens快门声音
date: '2018-03-27'
slug: 2018-03-27-mute-shutter-voice
tags:
- 原创教程 TUTORIAL
- 生物软件 BIO-SOFTWARE
- andriod
- Lens
- Office
---


Office
Lens的快门声在一些手机上（比如我的Le2）无法关闭，这严重影响了该软件的使用。在Google上面查找，始终找不到解决方案，而只是一些吐槽。

<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2018/03/office-lens-500x350.jpg" class="alignnone size-medium wp-image-929" sizes="(max-width: 500px) 100vw, 500px" srcset="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2018/03/office-lens-500x350.jpg 500w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2018/03/office-lens.jpg 690w" width="500" height="350" />

大家对微软已经无力吐槽了。

机智如我，自然要想个办法。经过广泛调研，深入研究，最终得到解决方案。

具体思路是：**将快门声音对应的音频文件设为无法访问。**

安装Root
Explorer，定位到/system/media/audio/ui，找到camera\_click.ogg文件，将其权限设为000。如下图所示。

<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2018/03/camer-click-file-authority-396x500.jpg" class="alignnone size-medium wp-image-930" sizes="(max-width: 396px) 100vw, 396px" srcset="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2018/03/camer-click-file-authority-396x500.jpg 396w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2018/03/camer-click-file-authority.jpg 767w" width="396" height="500" />

设置完成后，再打开Office Lens，世界清静了。

<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2018/03/camera-click-480x500.jpg" class="alignnone size-medium wp-image-928" sizes="(max-width: 480px) 100vw, 480px" srcset="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2018/03/camera-click-480x500.jpg 480w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2018/03/camera-click-768x799.jpg 768w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2018/03/camera-click-984x1024.jpg 984w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2018/03/camera-click.jpg 1080w" width="480" height="500" />
