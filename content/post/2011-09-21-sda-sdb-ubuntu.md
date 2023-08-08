---
title: 怎么办，ubuntu系统中的sda变成了sdb了？
date: '2011-09-21'
slug: 2011-09-21-sda-sdb-ubuntu
tags:
- 信息技术 INFORMATICS
- 原创教程 TUTORIAL
- 操作系统 LINUX
- mount
- Ubuntu
- 分区
- 挂载
- 硬盘
- 磁盘
- 错误
---


**使用UUID的方法挂载分区**

打开电脑发现，系统中各个盘符都挂载到/media下面了，导致很多程序不能正常运行了。使用“sudo
umount -a”命令全部卸载，然好再使用“sudo mount
-a”，重新按照/etc/fstab中的设置挂载，结果出现错误。经过查看，发现硬盘的分区从sda变成了sdb了。原来的sda5现在变成了sdb5,而fstab中的设置中是将/dev/sda5挂载到/var/ftp怪不得挂载不上了。如下：

> \# /etc/fstab: static file system information.  
> \#  
> \# &lt;file system&gt; &lt;mount point&gt;   &lt;type&gt; 
> &lt;options&gt;       &lt;dump&gt;  &lt;pass&gt;  
> \# /dev/sda7  
> /dev/sda7          /var/ftp               ext3      relatime          
> 0             2

怎么办？  
这么办。我们使用UUID来标示设备，这样就不会出现这种错误了(点击查看wiki百科)。

> [一组 UUID，系由一串 16 位组（亦称 16 字节，或 128
> 位）的16进位数字所构成，是故UUID理论上的总数为2<sup>16 x
> 8</sup>=2<sup>128</sup>，约等于3.4 x
> 10<sup>38</sup>。也就是说若每奈秒产生1兆个UUID，要花100亿年才会将所有UUID用完。](http://zh.wikipedia.org/wiki/UUID)

输入命令，得到各设备的UUID。  
\[cc lang=”bash”\]ls -l /dev/disk/by-uuid/\[/cc\]

根据得到的UUID，将fstab中的设置更改一下，上面的例子，改为：

> \# /etc/fstab: static file system information.  
> \#  
> \# &lt;file system&gt;                       &lt;mount point&gt;      
> &lt;type&gt;  &lt;options&gt;  &lt;dump&gt; &lt;pass&gt;  
> \# /dev/sda7  
> UUID=d51b2056-6825-456c-957d-ebb16edd349d    /var/ftp      ext3      
> relatime     0   2

重新启动计算机，或者输入命令“sudo mount -a”，所有的设备就会正确挂载。

另外，为什么会出现这种错误呢，原来是因为我插了一个U盘在电脑上。这个忘记拔掉的U盘，占据了sda的标示，而它只有一个分区，所以在挂载的时候，所有的分区都不能得到正确挂载了（还好ROOT分区系统默认使用了UUID的方法挂载，要不然岂不是启动不了系统了吗）。
