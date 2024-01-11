---
title: dplyr::filter() 中的表达式
author: gaoch
date: '2024-01-11'
slug: dplyr-filter-expression
categories:
  - R
tags:
  - dplyr
  - tidyverse
---

dplyr 中的骚操作。

<!--more-->

今天遇到的这个问题，让我困惑了好半天。

给出一个 tibble，对它执行 `filter()` 操作。


```r
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
set.seed(0)
tbl = tibble(x = sample(letters, 60, TRUE), y = 1:60)
tbl
```

```
## # A tibble: 60 × 2
##    x         y
##    <chr> <int>
##  1 n         1
##  2 y         2
##  3 d         3
##  4 g         4
##  5 a         5
##  6 b         6
##  7 w         7
##  8 k         8
##  9 n         9
## 10 r        10
## # ℹ 50 more rows
```

如果变量与列名不一样，则结果很正常。


```r
let = c("a","b","c")
tbl |> filter(x %in% let)
```

```
## # A tibble: 6 × 2
##   x         y
##   <chr> <int>
## 1 a         5
## 2 b         6
## 3 a        12
## 4 b        29
## 5 a        34
## 6 c        36
```

但是，如果变量与列名相同，则会出现意想不到的结果。实际上，它执行了 `filter(tbl, .data$x %in% .data$x)` 的骚操作。


```r
x = c("a","b","c")
filter(tbl, .data$x %in% x)
```

```
## # A tibble: 60 × 2
##    x         y
##    <chr> <int>
##  1 n         1
##  2 y         2
##  3 d         3
##  4 g         4
##  5 a         5
##  6 b         6
##  7 w         7
##  8 k         8
##  9 n         9
## 10 r        10
## # ℹ 50 more rows
```

那么，该如何避免这个问题呢？

[这里](https://stackoverflow.com/questions/34219912/how-to-use-a-variable-in-dplyrfilter) 给出了很多答案。


```r
filter(tbl, .data$x %in% !!x)
```

```
## # A tibble: 6 × 2
##   x         y
##   <chr> <int>
## 1 a         5
## 2 b         6
## 3 a        12
## 4 b        29
## 5 a        34
## 6 c        36
```

```r
filter(tbl, .data$x %in% .env$x)
```

```
## # A tibble: 6 × 2
##   x         y
##   <chr> <int>
## 1 a         5
## 2 b         6
## 3 a        12
## 4 b        29
## 5 a        34
## 6 c        36
```

```r
filter(tbl, .data$x %in% get("x"))
```

```
## # A tibble: 60 × 2
##    x         y
##    <chr> <int>
##  1 n         1
##  2 y         2
##  3 d         3
##  4 g         4
##  5 a         5
##  6 b         6
##  7 w         7
##  8 k         8
##  9 n         9
## 10 r        10
## # ℹ 50 more rows
```

```r
filter(tbl, .data$x %in% UQ(x))
```

```
## # A tibble: 6 × 2
##   x         y
##   <chr> <int>
## 1 a         5
## 2 b         6
## 3 a        12
## 4 b        29
## 5 a        34
## 6 c        36
```

除了 `get()` 以外，其它的都有效。
