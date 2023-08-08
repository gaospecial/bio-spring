---
title: "[Ubuntu资料］配置华为认证客户端上网"
date: "2008-04-19"
author: gaoch
tags:
  - 百度空间
---

<http://forum.ubuntu.org.cn/viewtopic.php?t=10523>  
  
下载客户端h3c802.1xClient.tar.gz，解压到某一目录，假定是h3c，请阅读一下里面Readme，这里不再赘述里面的内容。  
  
cd到h3c目录，里面有三个文件需要可执行权限，分别是linux1x、pre.ps、renew.ps，没有的话请给它们加上  
**代码:** $ sudo chmod a+x linux1x pre.ps renew.ps  
  
执行里面的pre.ps，把软件安装到系统中去，一般是装到/usr/local/bin  
**代码:** $ sudo ./pre.ps  
  
把上网方式改成dhcp，我建议你在图形环境下配置，也可以直接修改/etc/network/interfaces文件，把里面带有eth0的部分改成  
**代码:** iface eth0 inet dhcp  
auto eth0  
第一行是把eth0改成dhcp方式，第二行是自动激活eth0，eth0代表第一块以太网网卡，可能需要重新启动网络  
**代码:** $ sudo /etc/init.d/networking restart  
  
这时候可以试着执行一下linux1x，第一次执行需要输入用户名和密码，以后就不用了  
**代码:** $ sudo linux1x -d  
-d选项可以让linux1x验证成功后在后台运行  
  
<u>**如果遇到错误提示缺少libstdc++-libc6.2-2.so.3**</u>，就在在
/usr/lib下做一个名为libstdc++-libc6.2-2.so.3的c++标准库文件**<u>(这种方法最简单）</u>**  
  
办法:
在/usr/lib下做一个名为libstdc++-libc6.2-2.so.3的软链接到高版本的libstdc++  
**代码:** $ cd /usr/lib  
$ ls libstdc++\*  
在我的系统上ls命令的结果是 libstdc++.so.5.0.7 libstdc++.so.6.0.8  
libstdc++.so.6.0.8就是我们要找的，给它做个链接  
**代码:** $ sudo ln -s libstdc++.so.6.0.8 libstdc++-libc6.2-2.so.3  
这时候你可以再试一下linux1x命令  
或者直接将libstdc++.so.x.x.x复制一份到/usr/lib下面，命名为libstdc++-libc6.2-2.so.3即可。  
**代码:** $ sudo cp libstdc++.so.6.0.8 libstdc++-libc6.2-2.so.3  
===========  
第一次运行linux1x都提示缺少一个文件（记得好像是以libstdc++开头的──标准的c++库。）其实系统中有这个库文件在系统中存在，只是现
在不叫这个名字了而已。你可以使用命令“locate
libstdc++”找到一个与提示中最相近的文件（位于/usr/share/lib下面吧，记不清了），然后在那个文件所在的目录复制一个，命名为提
示中提示的文件名，就可以用了（要用到sudo权限）。
