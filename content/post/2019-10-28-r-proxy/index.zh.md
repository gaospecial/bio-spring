---
title: 为 R 代理
author: gaoch
date: '2019-10-28'
slug: r-proxy
categories:
  - R
tags:
  - R
  - proxy
---

今天想用 scholar 包抓一下自己的 Google Scholar profile，发现不翻墙打不开。

要设代理，参考了 @GuangchuangYu 发表的[一次解决所有代理问题](https://guangchuangyu.github.io/cn/2018/09/proxychains/)，
却仍然没有解决自己的问题。

因为我用的是 Windows，proxychains 却只能用于类 Unix 系统。

经过 3 个小时的探索，终于发现了一个途径，居然比 proxychains 还要简单很多。

那就是，设置 Renviron 环境变量的方法。

新建一个 Renviron 文件，内容如下：

```
CURL_SSL_BACKEND=openssl

http_proxy=http://127.0.0.1:8080
https_proxy=http://127.0.0.1:8080
```

这个文件：

- 如果放在 "`~/.Renviorn`" 下面，那么每次 R 运行的时候都会设置使用相应的代理。
- 如果放在 R project 文件夹下面（如“`/path/to/project/.Renviron`”），那么只对相应的项目生效。
- 如果放在一个普通文件中（如“`proxy.Renviron`”），则只在调用的时候生效。


采用最后一种方法，在需要设置代理的脚本中，加入一行，就可以确保后续访问网络时使用代理设置。

```
readRenviron("proxy.Renviron")
```

# 说明

网上有很多关于设置 `http(s)_proxy` 变量来代理上网的方法，但是只设置这项是没有用的。

这是因为，当 R 从网上下载时，curl 包默认是采用的 **Windows Cert Store** 的后端，而该后端是不支持 https 协议代理上网的。

|rcurl SSL Backends |Secure Channel|OpenSSL|
|-------------------|--------------|--------|
|trust certificates |	Windows Cert Store|	curl-ca-bundle.crt file|
|works on corporate networks |	Usually Yes|	Maybe not|
|support http proxy server	|Yes	|Yes|
|support https proxy server|	**No**|	Yes|
|support client certificate authentication |	No |	Yes|

因此，需要先设置 `CURL_SSL_BACKEND=openssl`，然后在设置代理服务器。


*备注：这份资料在 curl 的文档中(`vignette("windows","curl")`)找到的。*


