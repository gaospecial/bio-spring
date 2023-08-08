---
title: "[Ubuntu资料］配置引导资料从windows启动Ubuntu Desktop ISO，安装或者体验Ubuntu。"
date: "2008-04-19"
author: gaoch
tags:
  - 百度空间
---

**<http://forum.ubuntu.org.cn/viewtopic.php?t=26167>  
  
** **下载地址
<http://ftp.ubuntu.org.cn/home/gnix_oag/boot_livecd_from_hd/>  
（在此选择与你系统版本对应的配置文件，按照文件中的说明操作即可。  
下载用户名与密码 <http://forum.ubuntu.org.cn/viewtopic.php?t=9685>
（如果密码变更，请参看该帖子）  
当前用户名：ubuntu  
当前密码：ubuntuftp**  
  
***一、仅从硬盘启动Destdop ISO 并安装：  
{如果为了从windows安装，仅仅需要参看这一条}  
***  
1、从后面的链接下载相关引导文件并解压；  
  
2、在任意盘的根目录中新建一个文件夹，并重命名（如feisty、edgy等，menu.lst中用fd\_dir变量把要找的文件夹传给系统）  
把下载的桌面版光盘(\*.iso)文件放到此目录中，不要解压；  
  
3、把解压后的 boot 文件夹、grldr文件移到 C:\\，  
在 c:\\boot.ini 文件后面添加 c:\\grldr=" Ubuntu Linux "  
把 timeout=0 改成 timeout=3  
(可参照 boot.ini.txt 文件)(如不行的话，请学习grub for
dos来修改menu.lst配置文件，这也是必备知识 )  
  
4、启动后，先 sudo umount -a
取消已挂载好的分区，再按桌面的安装程序进行安装。  
  
二、免安装直接使用：  
在以上基础用下列方法可直接使用，  
  
1、用ubuntu.fs文件来保存数据：  
对于MS用户没有linux分区， 可用ubuntu.fs文件代替Linux分区，方法如下，  
从下载包的 "ubuntu.fs" 文件夹中选一个压缩的 ext2 分区映象，  
解压到要找的文件夹中（如feisty,edgy等），并重命名为 ubuntu.fs
(所有新加的数据在这里)，  
启动后，/hd\_rw中有ubuntu.fs 就表示成功；  
  
2、用ubuntu.fs 文件夹来保存数据：  
对于已用linux分区的用户，可把数据保存在一个文件夹中，  
这个文件夹要在所要找的文件夹中（如feisty,edgy等），并重命名为
ubuntu.fs  
启动后，/hd\_rw中有ubuntu.fs 就表示成功；  
  
3、用swap.fs文件来虚拟内存  
从 "swap.fs" 中选一个压缩的swap.fs映象  
解压到任意盘根目录或要找的文件夹中（如feisty,edgy等），并重命名为
swap.fs  
启动后，用 swapon -s 检查是否正在使用  
  
三、使用符加的软件包，简化程序的安装：  
  
1、下载安装好的软件符加包\*.rofs，（一般在有中文包与常用软件包）  
  
2、把它放入要找的文件夹中，（即与\*.iso放在同一文件夹中即可）。  
  
  
四、在U盘或移动硬盘上使用 a  
本引导包完全可在U盘或移动硬盘上使用，只要把引导程序安装好就行了（grub
for dos )  
1、安装grub for dos 引导程序：  
下载 http://ftp.ubuntu.org.cn/home/gnix\_oag/bootlace.com  
chmod +x ./bootlace.com  
sudo ./bootlace --floppy /dev/sda1 (u盘)  
  
2、再把 grub 相关文件(/boot /menu /grldr)
及iso文件（按前面的方法）放到u盘上  
  
3、在别人机子上使用时，可删除/etc/gnix.oag@gmail.com文件，这样启动时就能自动配置系统与驱动。
