---
title: WordPress开发实录
date: '2012-02-25'
slug: 2012-02-25-wordpress-diy
tags:
- 信息技术 INFORMATICS
- 原创教程 TUTORIAL
- wordpress
---


如果遇到后台编辑文件时没有发现“更新文件”菜单时，可能是文件没有权限被“www-data”用户修改造成的；

WordPress主题的执行顺序，见：http://ihacklog.com/php/wordpress/dig-into-wordpress/the-wordpress-theme-files-execution-hierarchy.html

<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2012/02/WP_CheatSheet_TemplateMap.jpg" width="517" height="400" />

更改一个主题CSS文件时，新建一个CSS文档，然后import到主题默认CSS文档中。由于CSS定义中“后来居上”，所以应当插入在最后面，以免引起冲突。如果冲突，可以尝试加入“!important”来提升优先级。

关于wordpress插件form-manager的使用，不要使用其“condition”，而应当自行编写脚本。可以使用jQuery，然后将脚本作为Note添加（插入一个script区块）。同时将用到的CSS也作为一个Note添加（CSS其实最好位于Header中，据说这样可以加快网页的渲染速度，而js则可以放在最后）。这样做的结果就是只有在有form的页面中，才会需要载入相应的js库，减少对其它页面载入速度的影响。

form-manager模板函数中的利用nickname获取数值函数很好用。然而对于文件上传来说，得到的是一个含有文件名和其它信息的数组，可以使用以下语句得到想要的东西。  
http://wordpress.org/support/topic/plugin-wordpress-form-manager-get-image-into-template

\[cc lang=”php”\]  
  
![](%3C?php%20echo%20$uploads%5B'url'%5D.'/'.$file%5B'filename'%5D;?%3E“/%3E%3Cbr%20/%3E%0A%5B/cc%5D%3C/p%3E%0A%3Cp%3E另外，HTML表格中的“%3Ctr%3E”元素中必须有“%3Ctd%3E”才会显示，因为这个浪费了半天时间。%3C/p%3E%0A)
