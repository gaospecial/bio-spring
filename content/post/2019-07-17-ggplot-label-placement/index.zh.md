---
title: ggplot label placement
author: gaoch
date: '2019-07-17'
slug: ggplot-label-placement
categories:
  - 信息技术
tags:
  - ggplot2
  - R
  - ggrepel
  - directlabel
---

*本文曾经发表在 biobabble 微信公众号 [链接](https://mp.weixin.qq.com/s/6MMVsO22n9oKZNC7qC7g5A)*

ggplot在绘制label的时候很容易出现字体溢出，位置难以调整的问题。Y叔曾经在公众号上吐槽过。


实际上，标签如何在图片中展示，还真不是一个简单的问题。有一个领域“[Automatic label placement](https://en.wikipedia.org/wiki/Automatic_label_placement)”就是研究该问题的。

下面介绍一下如何处理这个标签定位的问题。

## 方法一：使用hjust，vjust，nudge_x，nudge_y等参数调整

我们从mpg数据集中提取10行数据画图，默认情况下是这样的情况。

> mpg数据集是ggplot2自带的一个234行和11个变量的数据，包含了38种流行车型的燃油经济性数据。

> 包括：生产厂家（manufacturer），型号（model），发动机排量（displ，单位为L），生产年份（year），气缸数目（cyl），传动类型（trans），驱动类型（drv，f=前驱，r=后驱，4=四驱），每加仑燃油在城市和高速公路上的里程数（cty和hwy），汽油种类（fl）和汽车类型（class）等。



``` r
library(ggplot2)
## 生成数据集
set.seed(0)
df <- mpg[sample(nrow(mpg),10),]

## 发动机排量和良好路况情况下单位耗油所能行驶的里程数
ggplot(df,aes(displ,hwy)) + 
  geom_point() + 
  geom_text(aes(label=model))
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-1-1.png" width="672" />

这种情况下，边缘的字符串会溢出。可以添加`hjust="inward"`来避免这一情况。


``` r
## hjust="inward"把左侧的label右对齐，右侧的label左对齐。
ggplot(df,aes(displ,hwy)) + 
  geom_point() + 
  geom_text(aes(label=model),hjust="inward")
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-2-1.png" width="672" />

但是这种情形仍然会出现point和label重叠的情况。因此需要进一步调节。使用`nudge_x`和`nudge_y`可以设置标签显示位置的微小偏移。

由于标签是水平显示的，左右两侧容易出现溢出，而竖直方向上则一般不会，所以我们将竖直方向设为居中，并微调-0.5，这样就可以保证标签显示比较正常了。


``` r
ggplot(df,aes(displ,hwy)) + 
  geom_point() + 
  geom_text(aes(label=model),hjust="inward",vjust="center",nudge_y = -.5)
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-3-1.png" width="672" />

> hjust, vjust = c("left","right","center","inward","outward");
> nudge_x, nudge_y = value.

如果在Y轴边缘有溢出的话，则在结合调整xlim，ylim可以解决。如下所示：



``` r
ggplot(df,aes(displ,hwy)) + 
  geom_point() + 
  geom_text(aes(label=model),size=12,hjust="inward",vjust="center",nudge_y = -.5) + 
  xlim(c(0,8))
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-4-1.png" width="672" />

如上图所示，虽然确保了标签没有溢出，但是同时又会有标签重叠的情况。

> 也可以参考 vignette("ggplot2-specs") 中的部分内容。

实际上，标签如何在图片中展示，还真不是一个简单的问题。有一个领域“[Automatic label placement](https://en.wikipedia.org/wiki/Automatic_label_placement)”就是研究该问题的。

不过，有一些R包可以帮助我们解决这一难题。

## 方法二：ggrepel

ggrepel包就是为了处理ggplot label而开发的。



``` r
library(ggrepel)
```

```
## Warning: package 'ggrepel' was built under R version 4.3.3
```

``` r
## 使用geom_text_repel可以一步完成上面类似的操作
ggplot(df,aes(displ,hwy)) + 
  geom_point() + 
  geom_text_repel(aes(label=model))
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-5-1.png" width="672" />

> 更多信息，请参考ggrepel文档中的ggrepel examples


## 方法三：directlabels

directlabels则是另外一个选择。这个包不仅能够用于ggplot图，还可以用于latitice基础绘图系统。



``` r
## 安装和载入
# install.packages("directlabels")
library("directlabels")

## 看一下效果
ggplot(df,aes(displ,hwy)) + 
  geom_point() + 
  geom_dl(aes(label=model),method = "smart.grid")
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-6-1.png" width="672" />

这个smart.grid方法特别适合于point作图中points非常多的情况，避免使用legend，让图片更美观更易读。

比较一下下面两幅图，显然后者更好。


``` r
## 使用legend和颜色
ggplot(mpg,aes(displ,hwy,color=class)) + 
  geom_point()
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-7-1.png" width="672" />

``` r
## 使用label和颜色
ggplot(mpg,aes(displ,hwy,color=class)) + 
  geom_point(show.legend=F) + 
  geom_dl(aes(label=class),method="smart.grid")
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-7-2.png" width="672" />


> geom_dl这里有一个method参数，可以有“last.points”，“first.points”，“top.qp”，“first.qp”，“last.qp”，“smart.grid”等不同选择。针对不同的绘图类型会有不同的可选项。

> 不同作图类型可用的方法可以参见：http://directlabels.r-forge.r-project.org/docs/index.html



## 外：check_overlap

`check_overlap`也是`ggplot2`的`geom_text`自带的一个小参数，可以避免label重叠。应用时，会依次检查后面的label是否与前面的重叠，有重叠的话，就不显示。



``` r
## df数据集含有mpg中的十行数据
ggplot(df,aes(displ,hwy)) + 
  geom_point() + 
  geom_text(aes(label=model),check_overlap=T)
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-8-1.png" width="672" />

``` r
## mpg数据集含有234行数据
ggplot(mpg,aes(displ,hwy)) + 
  geom_point() + 
  geom_text(aes(label=model),check_overlap=T)
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-8-2.png" width="672" />

这个参数，label少的时候用不上，label多的时候也不能随便用。食之无味，弃之可惜。鸡肋啊~~
