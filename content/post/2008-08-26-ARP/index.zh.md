---
title: ARP
date: '2008-08-26'
author: gaoch
tags:
  - 旧文
slug: ARP
categories:
  - 其它
---

三個重要的通訊協定：  
ARP（Address Resolution Protocol；位址解析協定）、ICMP（Internet Control
Message Protocol；網際網路控制訊息協定）及HTTP（Hypertext Transfer
Protocol；超文字傳輸協定）。  
  
ARP协议（Address Resolution Protocol）,
或称地址解析协议。ARP协议的基本功能就是通过目标设备的IP地址，查询目标设备的MAC地址，以保证通信的顺利进行。他是IPv4中网络层必不可少的协议，不过在IPv6中已不再适用，并被icmp
v6所替代。  
  
ARP欺骗  
例如某一网络闸道的IP位址是192.168.0.254，其MAC位址为00-11-22-33-44-55，网络上的电脑内ARP表会有这一笔ARP记录。攻击者发动攻击时，会大量发出已将192.168.0.254的MAC位址篡改为00-55-44-33-22-11的ARP封包。那么网络上的电脑若将此伪造的ARP写入自身的ARP表后，电脑若要透过网络闸道连到其他电脑时，封包将被导到00-55-44-33-22-11这个MAC位址，因此攻击者可从此MAC位址截收到封包，可篡改后再送回真正的闸道，或是什么也不做，让网络无法连线。  
  
防制方法  
最理想的防制方法是网络内的每电脑的ARP一律改用静态的方式
