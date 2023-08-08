---
title: 整合 OSS 开放存储到 WordPress 系统
date: '2015-08-23'
slug: 2015-08-23-cloudfs-wp-uploads
tags:
- 云计算 CLOUD+
- 原创教程 TUTORIAL
- OSS
- Ubuntu
- wordpress
- 挂载
- 阿里云
---


使用 OSS 存储 WordPress 相当于将 云服务器 的存储免费扩大了。

### 安装cloudfs

-在云市场搜索cloudfs，获取下载链接。  
-将下载的安装包上传至云服务器。  
-安装依赖包。  
-以默认设置安装。

\[cc lang=”bash”\]  
\# Install dependence  
apt-get install libcurl4-openssl-dev libssl-dev pkg-config libxml2
libxml2-dev libfuse-dev libunwind8-dev  
\[/cc\]

### 配置cloudfs

\[cc lang=”bash”\]  
vi /usr/local/cloudfs/conf/cloudfs.conf  
\[/cc\]

需要配置的项目有： HOST 、ID 、KEY 、BUCKET 等 4 项必须；若干可选项。

### 测试

\[cc lang=”bash”\]  
\# Start cloudfs  
service cloudfs start  
service cloudfs status  
\# 目录和文件测试，在 OSS 控制台会看到相应变化  
mkdir /mnt/oss/test  
touch /mnt/oss/test/test.txt  
\[/cc\]

### 迁移和设置媒体库

\[cc lang=”bash”\]  
\# 设置 WordPress 媒体库位置  
cd /mnt/oss  
mkdir wp\_uploads  
\# 将原有媒体库内容迁移过来  
cp -R /var/www/html/wp-content/uploads/\* wp\_uploads/  
\# 备份原有媒体库，同时腾出挂载点  
mv /var/www/html/wp-content/uploads/
/var/www/html/wp-content/uploads\_bak  
\# 挂载 OSS cloudfs 到 WordPress 媒体库  
ln -s /mnt/oss/wp\_uploads/ /var/www/html/wp-content/uploads  
\[/cc\]

[<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2015/08/wp-cloudfs-300x103.png" class="alignnone size-medium wp-image-600" sizes="(max-width: 300px) 100vw, 300px" srcset="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2015/08/wp-cloudfs-300x103.png 300w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2015/08/wp-cloudfs.png 867w" width="300" height="103" alt="wp-cloudfs" />](https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2015/08/wp-cloudfs.png)

在 WordPress 媒体库上传一个新内容，检查是否可用。

参考资料：  
http://www.513624.com/archives/829.html  
http://bbs.aliyun.com/read/236273.html
