---
title: Ubuntu linux下Shell批量重命名文件的实例
date: '2010-12-12'
slug: 2010-12-12-rename-multiple-files
tags:
- 信息技术 INFORMATICS
- 操作系统 LINUX
- rename
- script
- shell
- 脚本
- 重命名
---


**将当前目录下面的php文件全部改写为html文件**  
\[bash\]  
for it in \*.php;  
do  
mv $it “$it.pdf”;  
done  
\[/bash\]  
**将文件名中的URL转义字符%2E修正为点号.**  
有时候下载的文件名中含有URL的转义字符，如%2E，%2F等  
参见附录：URL转义字符。  
\[bash\]  
for it in \`ls \*.pdf\|grep “%2E”\`;  
do  
mv $it \`echo $it\|sed s/%2E/./g\`;  
done  
\[/bash\]  
**按照文件大小编号命名**  
\[bash\]  
let i=0;  
for it in \`ls -S\`;  
do  
mv $it “size${i}.txt”;  
let i=i+1;  
done  
\[/bash\]  
**将当前目录下面的php文件全部改写为html文件-修订版**  
上述的命名法仍然保留了php字符，如果想去掉的话，这样：  
\[bash\]  
for it in \`ls \*.php\`;  
do  
mv $it \`echo $it\|sed s/.php$/./g\`;  
done  
\[/bash\]

***附录：URL转义字符。***  
**URL转义字符原理**

为了安全或者网页数据的正常传递，需要将一些特殊的字符转换成ASCII码，格式为：%加字符的ASCII码，即一个百分号%，后面跟对应字符的ASCII（16进制）码值。例如
空格的编码值是”%20″。

URL特殊符号及对应的十六进制值编码：

|          |                       |                                 |
|----------|-----------------------|---------------------------------|
| **符号** | **在URL中的特殊意义** | **URL转义字符**                 |
| \+       | URL中+号表示空格      | %2B                             |
| 空格     |                       | URL中的空格可以用+号或者编码%20 |
| /        | 分隔目录和子目录      | %2F                             |
| ?        | 分隔实际的 URL 和参数 | %3F                             |
| %        | 指定特殊字符          | %25                             |
| \#       | 表示书签              | %23                             |
| &        | URL中多个参数的分隔符 | %26                             |
| =        | URL中指定参数的值     | %3D                             |

Posted from [GScribble](http://sourceforge.net/projects/gscribble/).
