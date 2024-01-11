---
title: 常见排序分析方法及R语言实现
author: gaoch
date: '2018-10-22'
slug: ordination-analysis-in-R
categories:
  - R
tags:
  - PCA
  - PCoA
  - NMDS
  - microbial ecology
---

# 常用排序分析方法

相信大家在做微生物多样性研究时经常听到PCA分析、PCoA分析，NMDS分析，CCA分析，RDA分析。它们对物种（或基因、功能）的分析具有重要作用，因而频频出现在16S测序及宏基因组测序中。以上分析本质上都属于排序分析（Ordination analysis）。

排序分析（ordination analysis），最早是生态学（ecology）中研究群落（communities）的一大类多元分析手段，将某个地区调查的不同环境（site）以及所对应的物种组成（species），按照相似度（similarity）或距离（distance）对site在排序轴上（ordination axes）进行排序，将其表示为沿一个或多个排序轴排列的点，从而分析各个site或species与环境因子之间的关系。其目的是把多维空间压缩到低维空间（如二维），并且保证因维数降低而导致的信息量损失尽量少，实体（site或species）按其相似关系重新排列，提高其可理解性（interpretability）；同时，通过统计手段检验排序轴（ordination axes）是否能真正代表环境因子的梯度（gradient）[^4]。

因此，排序分析的作用可以总结为两个方面：①降维；②探索性分析；


常用的排序方法如下[^1]：

排序分析方法   | Raw data based （线性模型） | Raw data based （单峰模型） | Distance based 
---------------| ----------------------------| ----------------------------|----------------
间接排序法  （非限制性）| PCA                 | CA，DCA                    | PCoA，NMDS
直接排序法  （限制性）  | RDA                 | CCA                        | dbRDA


其中间接排序法包括：

- PCA（principal components analysis，主成分分析）
- CA（correspondence analysis，对应分析）
- DCA（Detrended correspondenceanalysis, 去趋势对应分析) 
- PCoA（principal coordinate analysis，主坐标分析）
- NMDS（non-metric multi-dimensional scaling，非度量多维尺度分析）；

直接排序法包括： 

- RDA（Redundancy analysis，冗余分析）
- CCA（canonical correspondence analysis，典范对应分析）
- dbRDA（distance based redundancy analysis，基于距离的冗余分析）
- CAP（canonical analysis of principal coordinates，主要坐标的典型分析）

其中PCA和RDA是基于线性模型（linear model）的，而CA、DCA、CCA、DCCA是基于单峰（unimodal）模型。


# 选择单峰模型还是线性模型？

1. 用DCA（`vegan::decorana()`）先对数据（site-species）进行分析；
2. 查看结果中的“Axis lengths”的第一轴DCA1的值，根据该值判断该采用线性模型还是单峰模型：
    + 如果大于4.0，就应该选单峰模型；
    + 如果3.0-4.0之间，选线性模型或者单峰模型均可；
    + 如果小于3.0, 线性模型的结果要好于单峰模型


# 如何选择一种合适的方法？ 

排序方法的选择取决于1）您拥有的数据类型，2）您想要/可以使用的相似距离矩阵，以及3）您想说的内容。所有这些排序方法都基于数据构建的相似距离矩阵，使用不同的方法（例如Euclidean，Bray-Curtis，Jaccard等）来计算样本之间的距离。但是，不同方法计算相似度矩阵将不会给出相同的结果。不同的排序方法使用不同的相似度矩阵，并可能对结果产生显著影响。

例如，PCA和PCoA将只使用欧几里得距离，而nMDS使用任何你想要的相似距离。 

在 ResearchGate 上有一个高赞答案[^3]，回答了这个问题。

- 如果您有一个包含空值的数据集（例如某些样本中存在细菌OTU，而其他样本中则没有），我建议您使用Bray-Curtis相似性矩阵和nMDS排序。选择Bray-Curtis距离是因为它不受像欧几里得距离之类的样本之间的零值数量的影响，并且选择nMDS是因为您可以选择任何相似度矩阵，而不像PCA。 
- 如果您的数据集不包含空值（例如环境变量），则可以使用欧几里得距离，并使用PCA或nMDS，在这种情况下，您会看到它会给出相同的结果。


有时候一种方法会比其他方法更好，可以显示复杂群落或因素的特定影响。如果你对结果不满意，尝试不同的方法是很好的做法。但是记住，这些方法仅仅**只是排序**，你需要针对不同组之间的显著差异进行检验（例如`ANOSIM`，`ADONIS`，`PERMANOVA` ，`MRPP` ...）。


# R语言实现

## 示例数据集

使用 `vegan` 的数据集作为示例数据，该数据集描述了苔原土壤上生长的植物多样性信息和土壤的物理化学性质。其中，`varespec` 描述了24块样地中44个物种的丰度信息，`varechem` 描述了这24块样地土壤的14个性质参数。


```r
library("vegan")
```

```
## Loading required package: permute
```

```
## Loading required package: lattice
```

```
## This is vegan 2.6-4
```

```r
data("varespec")
data("varechem")

# 查看变量
knitr::kable(varespec[1:3,1:5])
```



|   | Callvulg| Empenigr| Rhodtome| Vaccmyrt| Vaccviti|
|:--|--------:|--------:|--------:|--------:|--------:|
|18 |     0.55|    11.13|        0|     0.00|    17.80|
|15 |     0.67|     0.17|        0|     0.35|    12.13|
|24 |     0.10|     1.55|        0|     0.00|    13.47|

```r
knitr::kable(varechem[1:3,1:5])
```



|   |    N|    P|     K|    Ca|    Mg|
|:--|----:|----:|-----:|-----:|-----:|
|18 | 19.8| 42.1| 139.9| 519.4|  90.0|
|15 | 13.4| 39.1| 167.3| 356.7|  70.7|
|24 | 20.2| 67.7| 207.1| 973.3| 209.1|

## 选择模型

为了确定该选择线性模型还是单峰模型，首先对数据进行DCA分析。在 `vegan` 中，对应的函数为 `decorana()`。


```r
decorana(varespec)
```

```
## 
## Call:
## decorana(veg = varespec) 
## 
## Detrended correspondence analysis with 26 segments.
## Rescaling of axes with 4 iterations.
## Total inertia (scaled Chi-square): 2.0832 
## 
##                        DCA1   DCA2    DCA3    DCA4
## Eigenvalues          0.5235 0.3253 0.20010 0.19176
## Additive Eigenvalues 0.5235 0.3217 0.17919 0.11922
## Decorana values      0.5249 0.1572 0.09669 0.06075
## Axis lengths         2.8161 2.2054 1.54650 1.64864
```

在本例中，Axis lengths 最大值为 2.8161，小于3，因此采用线性模型会比较好。

## PCA分析

在R语言中，PCA分析和RDA分析是一个函数：`rda()`。如果只用了物种矩阵（`rda(X)`）就表示PCA分析，如果同时有物种矩阵和环境因子矩阵（`rda(X,Y)`）就表示RDA分析。


```r
rda(varespec)
```

```
## Call: rda(X = varespec)
## 
##               Inertia Rank
## Total            1826     
## Unconstrained    1826   23
## Inertia is variance 
## 
## Eigenvalues for unconstrained axes:
##   PC1   PC2   PC3   PC4   PC5   PC6   PC7   PC8 
## 983.0 464.3 132.3  73.9  48.4  37.0  25.7  19.7 
## (Showing 8 of 23 unconstrained eigenvalues)
```

输出结果告诉我们总的特征根（Inertia）为1826，这个值是物种矩阵中各个物种的方差和（`sum(apply(varespec,2,var))` = 1825.6594047 ），可以理解为物种分布的总变化量。

PCA排序结果中的 Eigenvalues for unconstrained axes 表示每个非约束排序轴所负荷的特征根的量，也可以表示每个轴所能解释的方差变化的量。例如，对于第一轴来说，其解释度为：`983.0/1826` = 53.8335159%。

## CA分析

CA和CCA也是用同一个函数 `cca()` 实现的。如果参数只有一个物种矩阵，就表示CA分析；如果同时有物种矩阵和环境因子矩阵，那么表示CCA分析。


```r
cca(varespec)
```

```
## Call: cca(X = varespec)
## 
##               Inertia Rank
## Total           2.083     
## Unconstrained   2.083   23
## Inertia is scaled Chi-square 
## 
## Eigenvalues for unconstrained axes:
##    CA1    CA2    CA3    CA4    CA5    CA6    CA7    CA8 
## 0.5249 0.3568 0.2344 0.1955 0.1776 0.1216 0.1155 0.0889 
## (Showing 8 of 23 unconstrained eigenvalues)
```
## RDA分析和CCA分析

在分析物种分布与环境因子关系的时候，需要用到约束分析（Constrained ordination），主要类型是RDA和CCA。

约束排序和非约束排序的区别在于：在约束排序里，只展示能被环境因子所解释的物种分布变化量。因此，约束排序轴比非约束排序轴的解释量明显要小。


```r
# RDA
rda(varespec,varechem)
```

```
## Call: rda(X = varespec, Y = varechem)
## 
##                 Inertia Proportion Rank
## Total         1825.6594     1.0000     
## Constrained   1459.8891     0.7997   14
## Unconstrained  365.7704     0.2003    9
## Inertia is variance 
## 
## Eigenvalues for constrained axes:
##  RDA1  RDA2  RDA3  RDA4  RDA5  RDA6  RDA7  RDA8  RDA9 RDA10 RDA11 RDA12 RDA13 
## 820.1 399.3 102.6  47.6  26.8  24.0  19.1  10.2   4.4   2.3   1.5   0.9   0.7 
## RDA14 
##   0.3 
## 
## Eigenvalues for unconstrained axes:
##    PC1    PC2    PC3    PC4    PC5    PC6    PC7    PC8    PC9 
## 186.19  88.46  38.19  18.40  12.84  10.55   5.52   4.52   1.09
```


```r
# CCA
cca(varespec,varechem)
```

```
## Call: cca(X = varespec, Y = varechem)
## 
##               Inertia Proportion Rank
## Total          2.0832     1.0000     
## Constrained    1.4415     0.6920   14
## Unconstrained  0.6417     0.3080    9
## Inertia is scaled Chi-square 
## 
## Eigenvalues for constrained axes:
##   CCA1   CCA2   CCA3   CCA4   CCA5   CCA6   CCA7   CCA8   CCA9  CCA10  CCA11 
## 0.4389 0.2918 0.1628 0.1421 0.1180 0.0890 0.0703 0.0584 0.0311 0.0133 0.0084 
##  CCA12  CCA13  CCA14 
## 0.0065 0.0062 0.0047 
## 
## Eigenvalues for unconstrained axes:
##     CA1     CA2     CA3     CA4     CA5     CA6     CA7     CA8     CA9 
## 0.19776 0.14193 0.10117 0.07079 0.05330 0.03330 0.01887 0.01510 0.00949
```

# 延伸阅读

1. 赖江山等，基于Vegan 软件包的生态学数据排序分析。http://blog.sciencenet.cn/blog-267448-463699.html



[^1]: http://ordination.okstate.edu/overview.htm
[^2]: A. Ramette (2007) Multivariate analyses in microbial ecology, FEMS Microbiology Ecology, 62, 142-160.
[^3]: https://www.researchgate.net/post/How_to_choose_ordination_method_such_as_PCA_CA_PCoA_and_NMDS
[^4]: https://github.com/ricket-sjtu/bi028/wiki/%E6%8E%92%E5%BA%8F%E5%88%86%E6%9E%90%EF%BC%88Ordination-Analysis%EF%BC%89

