---
title: cloudfs无法上传的故障排除
date: '2015-09-27'
slug: 2015-09-27-cloudfs-upload-failed
tags:
- 云计算 CLOUD+
- OSS
- Ubuntu
- 阿里云
---


之前设置WordPress使用阿里云OSS存储图片，今天出问题了。[设置方法在这里](http://bio-spring.top/cloudfs-wp-uploads/)

错误提示：cannot access oss: Transport endpoint is not connected

解决方案如下：

1.  去除挂载
2.  重启Cloudfs服务
3.  设置权限

\[cc lang=”bash”\]  
umount /mnt/oss  
service cloudfs restart  
chmod 666 /mnt/oss  
\[/cc\]
