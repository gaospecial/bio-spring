---
title: the_content()和the_excerpt()
date: '2012-06-05'
slug: 2012-06-05-the_content-the_excerpt
tags:
- 信息技术 INFORMATICS
- 原创教程 TUTORIAL
- 网站建设 WEBSITE
- blog
- post
- wordpress
- 主题
---


这是wordpress中用以提取post内容的常用函数。它们用法基本相同，很多时候可以相互取代，分别用于显示post全部内容和post摘要。

然而，事实上在应用中它们最大的区别在于，前者输出格式化的内容，而后者则输出文字（格式错乱，没有超链接，换行，样式定义等）。所以，大多数时候，我只用前一个函数。

有些主题作者喜欢用the\_excerpt()（特别是在分类列表中），我常常将其改为the\_content()。

> **the\_content** Display the post content.  
> void the\_content (\[string $more\_link\_text = null\], \[bool
> $stripteaser = false\])  
> string $more\_link\_text: Optional. Content for when there is more
> text.  
> bool $stripteaser: Optional. Strip teaser content before the more
> text. Default is false.
>
> **the\_excerpt** Display the post excerpt.  
> uses: apply\_filters() – Calls ‘the\_excerpt’ hook on post excerpt.  
> void the\_excerpt ()

 
