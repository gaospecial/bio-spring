---
title: biom 格式
date: '2016-05-26'
slug: 2016-05-26-biom-format
tags:
- 生物信息 BIOINFORMATICS
- 生物软件 BIO-SOFTWARE
- biom
- Microbiome
- mothur
- QIIME
---


官方网址：<http://biom-format.org/index.html>  
格式说明：<http://biom-format.org/documentation/biom_format.html>

biom 是**The Biological Observation Matrix (BIOM)** 的缩写。

## 概述

这个格式是微生物生态研究中衍生出的文件格式，扩展名建议是\*.biom，由
www.biom-format.org 开发。

开发此文件格式的目的由以下三点：

1.  存储和操作大规模的生物多样性数据
2.  存储核心的元数据（metadata，如样品，分组等重要的相关信息，这些信息在分析时是必需的。）
3.  统一专有文件格式，促进文件在不同分析工具间的流通。（QIIME，MG-RAST和VAMPS等分析工具都可以支持该文件格式）

## 版本

目前，biom格式已经有了3个版本。

版本1.0基于**JSON**格式开发。  
版本2.0和2.1基于[**HDF格式**](http://www.nsmc.cma.gov.cn/NSMC_EN/CMACast/docs/HDF5.0_chinese.pdf)开发。

HDF格式是专门为存储大规模、多对象的科学研究数据开发的。“Solutions to
Data Challenges”。

## 开发工具

biom格式是纯文本文件，可以用文本编辑器打开（我指的不是Windows的记事本，而是专业一点的开发工具。如Notepad++）。

Python版工具  
` pip install numpy pip install biom-format pip install h5py`

R版工具  
` install.packages("biom")`
