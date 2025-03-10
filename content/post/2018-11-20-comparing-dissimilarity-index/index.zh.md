---
title: 比较不同差异系数的结果
author: gaoch
date: '2018-11-20'
slug: comparing-dissimilarity-index
categories:
  - 信息技术
tags:
  - R
  - statistics
---

`vegdist` 提供了多个计算差异度的算法。这些算法自然是各有各的适用范围。对于同一个数据集，其结果有什么直观上的差异呢？



``` r
library(vegan)
library(pheatmap)
library(cowplot)
data("varespec")
dist.methods <- c("manhattan", "euclidean", "canberra", "clark", "bray", "kulczynski", "jaccard", "gower", "altGower", "morisita", "horn", "mountford", "raup", "binomial", "chao", "cao" , "mahalanobis")
```

对于这17种方法，分别计算其距离，用 `pheatmap()` 比较其差异。


``` r
dist.plots <- vector("list",length(dist.methods))
for (i in seq_along(dist.methods)){
  dist <- vegdist(varespec,method = dist.methods[[i]])
  plot <- pheatmap(dist,cluster_cols = F,cluster_rows = F,main = dist.methods[[i]],silent = T)
  dist.plots[[i]] = plot[[4]]
}
```

```
## Warning in vegdist(varespec, method = dist.methods[[i]]): results may be
## meaningless with non-integer data in method "morisita"
```

```
## Warning in vegdist(varespec, method = dist.methods[[i]]): results may be
## meaningless with non-integer data in method "chao"
```

```
## Warning in vegdist(varespec, method = dist.methods[[i]]): results may be
## meaningless with non-integer data in method "cao"
```

差距还是挺大的。


``` r
plot_grid(plotlist = dist.plots,labels = "AUTO",ncol=4)
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-3-1.png" width="960" />

