---
title: WordPress内部错误原是PHP7未配置
author: gaoch
date: '2019-07-08'
slug: wordpress-php7
categories:
  - WordPress
tags:
  - PHP
---

服务器网页显示：**内部错误500**，在日志文件中：`/var/log/apache2/error.log`提示以下错误：


```
Invalid command 'php_value', perhaps misspelled or defined by a module not included in the server configuration
```

Google了半天，没有查到可用的解决方案。考虑到之前做了服务器或者WordPress升级，参考其中一些信息，提示可能是 PHP5 升级到 PHP7 的兼容性问题。

PHP7对性能提升很大。而我的服务器还没有安装 PHP7。
先安装 PHP7。

```
apt-get install php7.2
```

安装后，前台不再提示“内部错误”。而是提示：**您的PHP似乎没有安装运行WordPress所必需的MySQL扩展。**


查阅WordPress需要的系统配置，得到：

- PHP version 5.2.4 or higher.
- MySQL version 5.0 or higher.

**Recommendations**

- PHP version 7.2 or higher.
- MySQL version 5.6 or higher.
- The mod_rewrite Apache module.
- HTTPS support.
- A link to wordpress.org on your site.


那所谓的 PHP MySQL扩展在哪里呢？再安装一个：


```
apt-get install php7.2-mysql
```

搞定了！

**果然，治病救人，确定病根很重要。**


