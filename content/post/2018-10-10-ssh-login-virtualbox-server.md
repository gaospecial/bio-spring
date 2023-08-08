---
title: 设置VirtualBox Ubuntu虚拟机的SSH登录
date: '2018-10-10'
slug: 2018-10-10-ssh-login-virtualbox-server
tags:
- 原创教程 TUTORIAL
- ssh
- Ubuntu
- virtualBox
---


## 为什么要设置虚拟机SSH登录？

我的工作环境是Windows，但要时常用到Linux，于是在VirtualBox中部署了Ubuntu
Linux系统。

以前都是打开虚拟机上使用，但是虚拟机毕竟有桌面，占用资源比较多。窗口切来切去也不方便。

设置虚拟机SSH登录可以让虚拟机作为一个进程运行在后台，很Linux。

## 虚拟机Linux系统的ssh环境配置

要安装SSH server。

``` wp-block-code
sudo apt-get install openssh-server
```

生成密钥。公钥用来认证，私钥用来登录。

[密钥的处理参考之前的一篇文章](http://bio-spring.top/setup-putty-login-in-fedora/)。

## 虚拟机的设置

在虚拟机-设置-网络中，添加一个端口转发规则，指向子系统SSH服务端口22。

[参考这里](http://www.cnblogs.com/lxg0/p/6413965.html)

## Putty的设置

[putty的设置也参考之前的一篇文章](http://bio-spring.top/setup-putty-login-in-fedora/)。

服务器IP设为127.0.0.1或localhost，端口设为转发端口，用户名设为Linux系统的用户名，密钥选择前面生成的ppk密钥。保存为一个新的session，以后就可以一键登录了。

## 后台运行虚拟机

使用VBoxManage命令来管理虚拟机。其在Windows系统下的程序名称为VBoxManage.exe。

打开命令提示符，进入VirtualBox的安装目录，可以找到该程序。

``` wp-block-code
cd /d "C:\Program Files\Oracle\VirtualBox"
# 列出所有的虚拟机
VBoxManage.exe list vms

# 在后台运行选定的虚拟机
VBoxManage.exe startvm "vms Name" -type headless
```

其它一些有用的命令有：

``` wp-block-code
# 列出正在运行的虚拟机
VBoxManage.exe list runningvms

# 关闭虚拟机
VBoxManage controlvm <vm_name> acpipowerbutton


# 强制关闭虚拟机
VBoxManage controlvm <vm_name> poweroff
```

[参考资料](https://blog.csdn.net/kl28978113/article/details/54340683)
