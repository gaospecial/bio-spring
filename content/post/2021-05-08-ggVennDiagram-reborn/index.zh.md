---
title: ggVennDiagram 的新生
author: Chun-Hui Gao
date: '2021-05-08'
categories:
  - 信息技术
tags:
  - ggplot2
  - ggVennDiagram
slug: ggvenndiagram-reborn
---

`ggVennDiagram` 是一个用于绘制 Venn 图的 R 语言软件包。最初，我只是在需要画 Venn 
图的时候，发现没有一件趁手的工具，而最终不得不写了一个给自己用的工具。随后，
抱着试一试的态度发布到了 GitHub 和 CRAN 上面。结果引起了用户持续的关注和好评，
截止今日已经获得了超过 100 个小星星。


<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-1-1.png" width="672" />

在 CRAN 上面也已经被累计下载了 2 万多次了。

[![](http://cranlogs.r-pkg.org/badges/grand-total/ggVennDiagram)](https://cran.r-project.org/package=ggVennDiagram)
[![](https://www.r-pkg.org/badges/version/ggVennDiagram?color=green)](https://cran.r-project.org/package=ggVennDiagram)


考虑到原来的设计和代码是十分粗糙的，所以我在 1.0 版本的时候，完全重构了 `ggVennDiagram`[^paper]。

[^paper]: 同时也是为了能够作为一篇文章发表。

为此，系统调研了 R 环境中可用的 Venn 图绘制工具，博取众家之长，并增强了自己原有的特色和优势。
重生后的 `ggVennDiagram` 用起来更加方便，功能也更加强大，同时以后的扩展性也会非常好。

下面是一些使用的示例：

先生成一个示例数据：


``` r
pak::pak("gaospecial/ggVennDiagram@V1.1")
```

```
## ℹ Loading metadata database
```

```
## ✔ Loading metadata database ... done
```

```
## 
```

```
## 
```

```
## ℹ No downloads are needed
```

```
## ✔ 1 pkg + 90 deps: kept 62 [4s]
```



``` r
genes <- paste0("gene",1:1000)
set.seed(20210502)
gene_list <- list(A = sample(genes,100),
                  B = sample(genes,200),
                  C = sample(genes,300),
                  D = sample(genes,200))

library(ggVennDiagram)
```


## 设置集合标签的内容，颜色和大小

标签图层在最上面，不会被填充遮盖。但是如果是非常长的标签，可能会显示不完整。
此时只需要应用一个 `ggplot2` 函数即可。


``` r
ggVennDiagram(gene_list, 
              category.names = c("a very long name","short name","name","another name"),
              set_color = c("red1","red2","red3","red4"),
              set_size = 6) +
  scale_x_continuous(expand = expansion(mult = .2))
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-4-1.png" width="672" />

## 显示区域中的成员

我们使用 `plotly` 对区域成员进行了可视化，现在鼠标悬停即可以查看区域成员。
同时，也支持将成员打印出来。


``` r
ggVennDiagram(gene_list, show_intersect = TRUE)
```

## 设定区域标签的内容、颜色和大小


``` r
ggVennDiagram(gene_list, label = "count", label_color = "blue", label_size = 4)
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-6-1.png" width="672" />


``` r
ggVennDiagram(gene_list, label = "both", label_percent_digit = 1, label_size = 3)
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-7-1.png" width="672" />

## 设定椭圆的边


``` r
ggVennDiagram(gene_list, edge_lty = "dashed", edge_size = 1)
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-8-1.png" width="672" />

## 换一个配色

填充色映射到不同的区域中。


``` r
ggVennDiagram(gene_list) + scale_fill_distiller(palette = "RdBu")
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-9-1.png" width="672" />

线条颜色映射到不同的集合上。


``` r
ggVennDiagram(gene_list) + scale_color_brewer(palette = "Set1")
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-10-1.png" width="672" />

## 更多维度的 Venn 图

通过导入另一个 R 包 `venn` 中的数据集，将 5-7 维度的 Venn 图画法移植了过来。


``` r
genes <- paste0("gene",1:1000)
set.seed(20210507)
x <- list(A = sample(genes,100),
          B = sample(genes,150),
          C = sample(genes,200),
          D = sample(genes,250),
          E = sample(genes,300),
          F = sample(genes,350),
          G = sample(genes,400))
```

由于是用的不规则多边形，所以这些 Venn 图可能辨别起来会比较费劲，但是乍看上去还是蛮漂亮的。


``` r
ggVennDiagram(x, label = "none", edge_size = 2) + scale_fill_distiller(palette = "RdBu")
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-12-1.png" width="672" />

``` r
ggVennDiagram(x[1:6], label = "none", edge_size = 2) + scale_fill_distiller(palette = "RdBu")
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-12-2.png" width="672" />

``` r
ggVennDiagram(x[1:5], label = "none", edge_size = 2) + scale_fill_distiller(palette = "RdBu")
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-12-3.png" width="672" />

## 自由定制

`ggVennDiagram` 将 Venn 图分为了 3 个部分，集合的标签，集合的边缘，集合的交叉，
分别称为 `setLabel`，`setEdge` 和 `region`。我们所做的主要工作是将繁琐的集合间计算
过程包装了起来（包括多边形区域的坐标及其对应成员的统计），并将计算的结果返回，
然后使用 `ggplot` 画图。


``` r
venn <- Venn(gene_list)
data <- process_data(venn)
ggplot() +
  # 1. region count layer
  geom_sf(aes(fill = count), data = venn_region(data)) +
  # 2. set edge layer
  geom_sf(aes(color = id), data = venn_setedge(data), show.legend = FALSE) +
  # 3. set label layer
  geom_sf_text(aes(label = name), data = venn_setlabel(data)) +
  # 4. region label layer
  geom_sf_label(aes(label = count), data = venn_region(data)) +
  theme_void()
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-13-1.png" width="672" />

对于熟悉 `ggplot` 作图的用户来说，他完全可以任意定制作图的格式。


``` r
ggplot() +
  # change mapping of color filling
  geom_sf(aes(fill = id), data = venn_region(data), show.legend = FALSE) +  
  # adjust edge size and color
  geom_sf(color="grey", size = 3, data = venn_setedge(data), show.legend = FALSE) +  
  # show set label in bold
  geom_sf_text(aes(label = name), fontface = "bold", data = venn_setlabel(data)) +  
  # add a alternative region name
  geom_sf_label(aes(label = name), data = venn_region(data), alpha = 0.5) +  
  theme_void()
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-14-1.png" width="672" />

新的 `ggVennDiagram` 更好用，更优雅。每一个绘制 Venn 图的朋友可能都会用得上。
