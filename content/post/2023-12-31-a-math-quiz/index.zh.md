---
title: 一道数学题
author: gaoch
date: '2023-12-31'
slug: a-math-quiz
categories:
  - 信息技术
tags: R
---

用编程方法硬解小学奥赛题。

<!--more-->

朋友圈看到一道有趣的题目，小学二年级的。

> **题目：**
老师让菲菲从 1 ~ 9 这9个数字中选取 4 个不同的数字，组成一个四位数，使得这个四位数能被所有她没有选中的数整除，但不能被选中的任一个数字整除。那么，菲菲组成的四位数是_____。


```r
for (num in seq(1234, 9876)){
    contained = strsplit(as.character(num), split = "")[[1]]  |>
     unique() |> 
     as.integer()
    if (length(contained) != 4 | 0 %in% contained) next
    if (any(num %% contained == 0)) next
    other = (1:9)[!1:9 %in% contained]
    if (any(num %% other != 0)) next
    print(num)
}
```

```
## [1] 5936
```

