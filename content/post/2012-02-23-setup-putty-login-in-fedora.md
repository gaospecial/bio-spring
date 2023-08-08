---
title: 在 Fedora 14 上配置 putty 自动认证
date: '2012-02-23'
slug: 2012-02-23-setup-putty-login-in-fedora
tags:
- 信息技术 INFORMATICS
- 原创教程 TUTORIAL
- 操作系统 LINUX
- bash
- fedora
- linux
- putty
- puttygen
- ssh
---


配置要点：

1.  在Fedora（服务器）端生成公钥和私钥；
2.  设置公钥和私钥的权限；
3.  下载或者拷贝私钥到要运行 putty 的电脑上（客户端）；
4.  导入私钥到putty中，保存配制；
5.  完成。

**具体操作**

以下在服务器端完成。

\[cc lang=”bash”\]  
ssh-keygen -t rsa  
cp .ssh/id\_rsa.pub .ssh/authorized\_keys  
chmod go-w .ssh  
chmod go-w .ssh/authorized\_keys  
\[/cc\]

将私钥拷贝到客户端计算机上，也可以使用“PSFTP”下载到客户端上，然后依下列操作导入密钥

打开“PUTTYGEN.EXE”以便导入私钥。

<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2012/02/1.png" width="475" height="460" />

将私钥导出为putty使用的“\*.ppk”格式文件

<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2012/02/2.png" width="477" height="460" />

退出该软件，打开putty配置文件

<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2012/02/3.png" width="448" height="435" />

在“Private key for authorization”项目下面选择刚才生成的ppk文档。

![](https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2012/02/4.png)

保存配置文件。

打开putty，便可以不再输入密码而直接通过认证了。
