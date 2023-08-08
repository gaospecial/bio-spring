---
title: Windows系统中固定R的Library目录
date: '2017-11-02'
slug: 2017-11-02-set-r-libs-user
tags:
- 生物信息 BIOINFORMATICS
- 生物软件 BIO-SOFTWARE
---


每次R语言版本更新，都在Windows下面新安装一个目录，原来的Library无法继续使用。

通过设置R的环境变量，可以实现将R\_LIBS\_USER固定到一个地方。

在Linux系统中，方法很简单，只需要在\~/.Rprofile文件中指定

``` lang:sh
R_LIBS_USER='~/Library/R'
```

在Windows下设置R\_LIBS\_USER的一个途径是在${R\_HOME}\\etc\\Rprofile.site文件中添加一句：

``` lang:r
.libPaths("D:/R_LIBS_USER")
```

别忘了运行下一条命令更新全部的包哦！

``` lang:r
rv_check::update_all()
```

 
