---
title: 在阿里云ECS上设置swap分区
date: '2017-10-10'
slug: 2017-10-10-enable-swap-in-aliyun-ecs
tags:
- 云计算 CLOUD+
- aliyun
- ecs
---


对于内存比较小的ECS来说，开启swap可以避免偶尔的内存溢出。

``` lang:sh
#查看内存和虚拟分区情况
free -h

#创建虚拟分区(1GB)
dd if=/dev/zero of=/mnt/swap bs=1M count=1000
mkswap /mnt/swap

#启用swap
swapon /mnt/swap
echo 10 > /proc/sys/vm/swappiness

#查看swap
free -h

#写入配置
echo -e "\n/mnt/swap swap swap defaults 0 0\n" >> /etc/fstab
vi /etc/sysctl.conf
# 将其中的对应行的数值从0更改为10,10%剩余内存时使用swap
# vm.swapiness=10
```

以上的代码将创建1000M的swap分区（bs × count），即时启用。在剩余10%
（swapiness）物理内存时将会使用swap。

同时，将配置写入系统文件。重启之后仍然会使用上述配置。
