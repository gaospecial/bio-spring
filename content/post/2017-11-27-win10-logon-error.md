---
title: 解决Windows10卡在登录界面或登录成功后失去响应的问题
date: '2017-11-27'
slug: 2017-11-27-win10-logon-error
tags:
- 原创教程 TUTORIAL
- Win10
- Windows
- Windows10
---


**症状如下：**电脑自动重启更新，卡在更新界面不能继续。强制重启后，可以正常引导，但是在登录时候容易卡死，随后进去之后，鼠标在任务栏上显示“繁忙”，桌面不能成功加载。可以进安全模式。

通过查看Windows更新记录，显示Windows
Defender更新后，开始出现这一情况，因此决定将Windows
Defender禁用。禁用后恢复正常。

禁用方法如下：

在安全模式下，打开系统管理员权限的命令提示符，在其中输入<span
class="lang:default decode:true crayon-inline">reg add
“HKLM\\SOFTWARE\\Microsoft\\Windows Defender” /v DisableAntiSpyware /t
REG\_DWORD /d 1 /f</span> 。

参考资料：[http://tieba.baidu.com/p/3939957170](http://tieba.baidu.com/p/3939957170?traceid=)

 
