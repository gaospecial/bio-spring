---
title: Mac OS 安装 PicGo 提示“文件已损坏”
author: gaoch
date: '2023-12-29'
slug: mac-os-picgo
categories:
  - MacOS
tags:
  - 错误
  - PicGo
  - 图床
---

安装完成后，打开终端，运行下面的命令。

`sudo xattr -d com.apple.quarantine "/Applications/PicGo.app/"`

这个命令的作用是删除指定文件或目录的扩展属性（extended attributes）中的“com.apple.quarantine”属性。在 macOS 中，文件或应用程序首次从互联网上下载并存储在磁盘上时，系统可能会自动添加“com.apple.quarantine”属性，用于标记文件的来源，并在首次运行时显示安全提示。

具体来说，`sudo xattr -d com.apple.quarantine "/Applications/PicGo.app/"` 这个命令尝试删除 "/Applications/PicGo.app/" 目录的 quarantine 属性。这样，当你运行 PicGo 应用程序时，就不会再收到系统的安全提示，因为你已经明确告诉系统这个应用是可信的。
