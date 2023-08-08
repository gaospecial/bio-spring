---
title: 使用 renv
author: Chun-Hui Gao
date: '2021-04-28'
slug: using-renv
categories:
  - R
tags:
  - renv
---


使用 `renv` 是为了保证环境的一致。它可以单个项目创建 R 包的管理环境，而不是依赖全局的 R Library。

R Library 会保存在当前目录下的 `renv` 目录中，R Session 中的环境变量也会被修改。


``` r
# 本地安装 renv 包
install.packages("renv")

# 记录 renv 的快照
renv::snapshot()

# 根据快照安装项目依赖的 R 包
renv::restore()

# 检查
renv::status()
```

快照以 `renv.lock` 的名称保存在根目录。这是一个 JSON 文件，记录包的来源的版本。
更换电脑后，通过读取其中的信息，安装配置一个完全一样的 R 环境。


我因为在 R 的配置文件中自定义了 `.libPaths("D:/R_LIB_USER")`，所以出了点状况。
将其改为如下的内容即可：

```r
.libPaths(c('D:/R_LIBS_USER',.libPaths()))
```
