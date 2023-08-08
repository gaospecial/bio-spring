---
title: 三分钟在阿里云中用上免费SSL
date: '2018-10-23'
slug: 2018-10-23-setup-ssl-in-aliyun
tags:
- 云计算 CLOUD+
- 原创教程 TUTORIAL
- 操作系统 LINUX
- 网站建设 WEBSITE
- 阿里云
---


> 给自己的网站添加SSL证书其实并不复杂，但是关键一点就是首先要拥有一个SSL证书。由于SSL证书价格不菲，很多个人站长会选择放弃使用Https。但是，自从开源、免费的Let’s
> Encrypt证书出现后，我觉得SSL也是我们草根站长可以玩的了。
> https://blog.csdn.net/ithomer/article/details/78075006

根据 https://certbot.eff.org/lets-encrypt/ubuntubionic-apache
官方教程指引，可以很快在阿里云的服务器中用上Let’s
Encrypt的证书，全程只需三分钟。

## 安装软件

``` lang:sh
$ sudo apt-get update
$ sudo apt-get install software-properties-common
$ sudo add-apt-repository ppa:certbot/certbot
$ sudo apt-get update
$ sudo apt-get install python-certbot-apache
```

## 获取证书

运行下述命令将启动一个向导，自动为你获取证书，并更新APACHE网站配置启用证书。

``` lang:sh
$ sudo certbot --apache
```

## 更新证书

从Let’s
Encrypt申请的证书有效期很短，只有90天。因此需要每隔一段时间续订一下。运行下列命令将模拟更新证书。

``` lang:sh
$ sudo certbot renew --dry-run
```

添加 cron 来自动化。

``` lang:sh
# crontab -e
```

在 crontab 中添加下列两行，将会每隔90天自动运行续订任务。

``` wp-block-preformatted
# renew Let's Encrypt SSL cert every 90 days
0  0  */90 * * certbot renew
```
