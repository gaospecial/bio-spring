---
title: Linux下命令行压缩照片或图片的脚本
date: '2010-11-17'
slug: 2010-11-17-linux-image-resize
tags:
- 操作系统 LINUX
- bash
- imagemagick
- resize
- 压缩图片
- 压缩照片
- 脚本
---


硬盘空间不足。  
有一些毕业时候拍摄的照片，量很多，每个都有2M多，非常占用空间。在windows下面，常常用光影魔术手进行批处理，在Linux下面，那就用到了imagemagick（翻译过来也是“图片魔术师”——说不定是光影魔术手的祖师爷呢，哈哈）。

**安装imagemagick**  
\[bash\]  
&gt;sudo apt-get install imagemagick  
\[/bash\]

**压缩图片**  
最长边设为700px，并在图片左上角添加风格化的水印。  
然后，删除原来的照片。  
\[bash\]  
&gt;mkdir to  
&gt;for file in \*.JPG; do  
&gt;convert $file -resize 700×700 -pointsize 16 -fill white -stroke
black -strokewidth 5 -annotate +20+25 ‘2008 summer’ -stroke none
-annotate +20+25 ‘2008 summer’ to/\`basename $file\`;  
&gt;done  
&gt;rm \*.JPG  
\[/bash\]

**备注**  
imagemagick的功能非常强大，在
[http://www.imagemagick.org/Usage/resize/](http://www.imagemagick.org/Usage/resize/%20)
和<http://www.imagemagick.org/Usage/fonts/>有很多叹为观止的例子参考。

Posted from [GScribble](http://sourceforge.net/projects/gscribble/).
