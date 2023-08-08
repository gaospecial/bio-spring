---
title: 常用假设检验方法的R语言实现
author: gaoch
date: '2019-09-23'
slug: basic-stats-in-R
categories:
  - R
tags:
  - statistics
  - ggplot2
---

# R中的假设检验

常用的统计方法见下表所示。

检验方法 | R函数 | 说明
---------| ----- | ----
T-test   | t.test() | 检验两组样品（参数）
Wilcoxon test | wilcox.test() | 检验两组样品（非参）
ANOVA    | aov()或者anova() | 检验多组样本（参数）
Kruskal-Wallis | kruskal.test() | 检验多组样本（非参）


> Mann-Whitney-Wilcoxon检验也被称为Wilcoxon检验。
> In statistics, the Mann–Whitney U test (also called the Mann–Whitney–Wilcoxon (MWW), Wilcoxon rank-sum test, or Wilcoxon–Mann–Whitney test) 
> https://en.wikipedia.org/wiki/Mann%E2%80%93Whitney_U_test

本文是阅读下列内容的读书笔记：http://www.sthda.com/english/wiki/comparing-means-in-r

