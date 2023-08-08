---
title: 解决Windows XP SP3系统中播放flash没有声音的故障
date: '2012-03-07'
slug: 2012-03-07-win-sound-error
tags:
- 信息技术 INFORMATICS
- 原创教程 TUTORIAL
- Flash
- SP3
- system32
- Windows
- 声音
- 故障
- 没有声音
- 系统文件
---


这是一个很诡异的故障，我在网络上查探了多日，中英文解决方案参考了无数，却仍然没有解决。最终，通过自己的实践，发现了一个简单的解决方案。

**故障的情形如下：**

1.  在系统中使用Media
    player播放音乐，使用射手影音播放器播放视频均有声音。
2.  使用电话会议功能也正常。
3.  网页中播放Flash没有声音。
4.  系统自带录音机不能使用。
5.  音量图标始终不能显示在托盘中。

既然你来到这里，肯定参考了网络上广为流传的关于在注册表中添加一个项目“msacm32.drv”的文章，我也是在相应的位置：HKEY\_LOCAL\_MACHINE\\SOFTWARE\\Microsoft\\Windows
NT\\CurrentVersion\\Drivers32
上面添加了名为“wavemapper”的项目，可是仍然没有解决。

我于是怀疑这里指定的文件是否丢失了，于是在System32文件夹中查找“msacm32.drv”，发现同名文件也还存在。

我觉得事已至此，应当尝试一下替换该文件，于是从网上下载了原始的“msacm32.drv”文件，文件大小20kB。与我机子上原有的同名文件差别巨大，原有文件大小为848KB。将原有文件备份，将原始文件复制到System32文件夹中，重启计算机，一切正常了。

**<span
style="font-size: large;">故障原因分析：系统文件损坏造成的。</span>**

**<span
style="font-size: large;">故障解决方案：使用原始系统文件替换即可。</span>**
