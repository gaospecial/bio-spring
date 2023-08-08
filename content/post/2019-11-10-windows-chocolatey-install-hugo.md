---
title: Windows中使用Chocolatey包管理系统安装Hugo
author: gaoch
date: '2019-11-10'
slug: windows-chocolatey-install-hugo
categories:
  - Windows
tags:
  - Hugo
  - Chocolatey
---

[Chocolatey](https://chocolatey.org/install) 提供一个命令行下安装程序的环境。


https://chocolatey.org/install

# 配置 PowerShell

```
# 使用管理员运行 PowerShell
Set-ExecutionPolicy Bypass -Scope Process

# 下面应当返回 bypass
Get-ExecutionPolicy
```

安装 Chocolatey

```

# 安装Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

# 安装 Hugo

打开 PowerShell，然后运行下面的命令。

```
choco install hugo -confirm

# or

choco install hugo-extended -confirm

```