---
title: "Not permitted to open the USB device, check usbfs options"
date: "2008-09-11"
author: gaoch
tags:
  - 百度空间
---

source:<http://www.giannistsakiris.com/index.php/2007/10/16/not-permitted-to-open-the-usb-device-check-usbfs-options/>

如果你的virtualBox虚拟机使用U盘时出现题目中所出的错误，请试一下下面的方法。

使用root编辑*/etc/udev/rules.d/40-permissions.rules*文件：

> `sudo gedit /etc/udev/rules.d/40-permissions.rules`

找到

> `# USB devices (usbfs replacement)SUBSYSTEM=="usb_device", MODE="0664"`

  
将其修改为：

> `# USB devices (usbfs replacement)SUBSYSTEM=="usb_device", MODE="0666"`

`然后保存文件，重新启动计算机。`

`解决了我的问题（Ubuntu7.04，VirtualBox1.5.4）。`

``
