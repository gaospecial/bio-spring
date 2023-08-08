---
title: Tibble与Data.frame中的group
author: gaoch
date: '2019-07-17'
slug: tibble-data-frame-group
categories:
  - R
tags:
  - tibble
  - data.frame
---

Tibble 和 Data.frame 一般可以通用，但是 Tibble 中含有的分组信息，如果不注意，有时可能会引起错误。


## ggpubr使用grouped tibble时自动添加group的小坑


```{r}
> error_rate_summary
# A tibble: 81 x 8
# Groups:   enzyme, nps [27]
   id    enzyme    nps   rep   type  Error_Rate     mean       std
   <fct> <fct>     <fct> <fct> <chr>      <dbl>    <dbl>     <dbl>
 1 NP1   rtaq      Fe2O3 rep1  B       0.00141  0.00125  0.000139 
 2 NP10  extaq     Fe2O3 rep1  B       0.00137  0.00138  0.000107 
 3 NP100 primestar Fe2O3 rep3  Y       0.000908 0.000810 0.0000899
 4 NP101 primestar ZnO   rep3  Y       0.000919 0.000816 0.0000904
 5 NP102 primestar CeO2  rep3  Y       0.000930 0.000785 0.000126 
 6 NP103 primestar Fe3O4 rep3  Y       0.000934 0.000800 0.000117 
 7 NP104 primestar Al2O3 rep3  Y       0.000866 0.000817 0.0000839
 8 NP105 primestar CuO   rep3  Y       0.000892 0.000795 0.0000920
 9 NP106 primestar TiO2  rep3  Y       0.000879 0.000796 0.0000832
10 NP107 primestar CK    rep3  Y       0.000884 0.000786 0.0000915
# ... with 71 more rows
```
有一个tibble，group by enzyme和nps。

使用compare_mean()时会报错。

```{r}
> compare_means(Error_Rate ~ enzyme,error_rate_summary,group.by = "type",paired = F,ref.group = ".all.")
Adding missing grouping variables: `nps`
Error in mutate_impl(.data, dots) : 
  Column `.group.` must be length 3 (the group size) or one, not 81
```

注意上面有一个**“Adding missing grouping variables: `nps`”**的提示。它确实告诉你了。注意看提示，可以帮助定位错误的来源。

转变成 `data.frame` 之后则发挥正常。

```{r}
> compare_means(Error_Rate ~ enzyme,as.data.frame(error_rate_summary),group.by = "type",paired = F,ref.group = ".all.")
# A tibble: 4 x 9
  type  .y.        group1 group2        p p.adj p.format p.signif method  
  <chr> <chr>      <chr>  <chr>     <dbl> <dbl> <chr>    <chr>    <chr>   
1 B     Error_Rate .all.  rtaq      0.492 1     0.49     ns       Wilcoxon
2 B     Error_Rate .all.  extaq     0.406 1     0.41     ns       Wilcoxon
3 Y     Error_Rate .all.  phusion   0.213 0.851 0.21     ns       Wilcoxon
4 Y     Error_Rate .all.  primestar 0.361 1     0.36     ns       Wilcoxon
```

其原因应该是转变 `Data.frame` 的时候，`group` 信息会被丢弃。

当然，也可以使用 `ungroup(x)` 来去掉 `Tibble` 中本来的分组信息。