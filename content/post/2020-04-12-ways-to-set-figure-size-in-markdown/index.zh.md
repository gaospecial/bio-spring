---
title: 在RMarkdown中设定图片大小的方法
author: gaoch
date: '2020-04-13'
slug: ways-to-set-figure-size-in-markdown
categories:
  - 信息技术
tags:
  - R
  - R Markdown
---

本文是 [英文原文](https://sebastiansauer.github.io/figure_sizing_knitr/) 的翻译。

1. 使用 YAML 头部文件

```
--- 
title: "My Document" 
output: html_document: 
fig_width: 6 
fig_height: 4 
--- 
```

统一设置每个图片的宽 6 英寸，高 4 英寸。


``` r
plot(pressure)
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-1-1.png" width="672" />


2. 使用 chunk option

这将影响后面所有代码生成图片的大小。


``` r
knitr::opts_chunk$set(fig.width=4, fig.height=4)
plot(pressure)
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-2-1.png" width="672" />

如果仅需要改变单一图片，则可以将chunk option 写到对应的 chunk 中。如`{r fig2, fig.height = 8, fig.width = 6, fig.align = "center"}`。


``` r
plot(pressure)
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-3-1.png" width="576" style="display: block; margin: auto;" />

此外，还有 `fig.asp=0.7` 和 `out.width="80%"` 等参数可供使用。

**`out.width`使用后对于优化手持设备、PDF文件等的显示很有帮助。**

下面的例子与前面相比就是加入了`out.width="80%"`的设置，当用手机浏览时可以看到二者的差别。


``` r
plot(pressure)
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-4-1.png" width="80%" style="display: block; margin: auto;" />

3. 使用 Pandoc 的 Markdown 语法

Rmarkdown 默认使用 Pandoc 来转换，因此可以使用 Pandoc 语法改变图片大小。如上一篇帖子使用的一个图片如果这样设置，会得到下面的结果。 `![](https://vnote-1251564393.cos.ap-chengdu.myqcloud.com/1586666475_20200412124107047_26263.png){ width=50% }`

![](https://vnote-1251564393.cos.ap-chengdu.myqcloud.com/1586666475_20200412124107047_26263.png){ width=50% }

4. 使用 HTML 语法

Markdown 天生支持原生的 HTML 语法。因此也可以使用 HTML 来对图片大小进行修改。

```html
<center><img src="https://vnote-1251564393.cos.ap-chengdu.myqcloud.com/1586666475_20200412124107047_26263.png" width="75%" title="HTML图片"/></center>

```

<center><img src="https://vnote-1251564393.cos.ap-chengdu.myqcloud.com/1586666475_20200412124107047_26263.png" width="75%" title="HTML图片"/></center>

4. 使用 `knitr::include_graphics()` 函数

这个函数提供了一种统一的语法来使用 chunk option 完成图片大小的设置。如下面的图片使用的参数`{r fig.width=5,fig.height=5,out.width="40%",fig.align="right"}`。


``` r
knitr::include_graphics("https://vnote-1251564393.cos.ap-chengdu.myqcloud.com/1586666475_20200412124107047_26263.png")
```

<img src="https://vnote-1251564393.cos.ap-chengdu.myqcloud.com/1586666475_20200412124107047_26263.png" width="40%" style="display: block; margin: auto 0 auto auto;" />

