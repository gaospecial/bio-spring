---
title: 'STAMP: unknown error – Unicode encode error'
date: '2016-05-29'
slug: 2016-05-29-how-to-mending-stamp-unicode-encode-error
tags:
- 原创教程 TUTORIAL
- 生物信息 BIOINFORMATICS
- 生物软件 BIO-SOFTWARE
- biom
- Microbiome
- mothur
- QIIME
- STAMP
---


[STAMP](http://kiwi.cs.dal.ca/Software/STAMP)是一个支持Windows、Linux系统的微生物群落分析软件。与[Mothur或QIIME](http://bio-spring.top/mothur-and-qiime/)相比，感觉它更小巧、轻便。它没有从测序结果（MiSeq/454）出发直到分析结果的一整套流程，但是它具有从OTU
Table出发进行统计分析、作图的能力。借助于[scipy](http://www.scipy.org/)，[numpy](http://www.numpy.org/)，[matplotlib](http://matplotlib.org/)等Python库的支持，它的分析、绘图能力达到了一个非常令人满意的程度。相应结果基本可以直接在文章中使用。

> STAMP is a software package for analyzing taxonomic or metabolic
> profiles that promotes ‘best practices’ in choosing appropriate
> **statistical** techniques and **reporting results**. Statistical
> hypothesis tests for pairs of samples or groups of samples is support
> along with a wide range of exploratory plots. STAMP encourages the use
> of effect sizes and confidence intervals in assessing biological
> importance. **A user friendly, graphical interface** permits easy
> exploration of statistical results and generation of **publication
> quality plots** for inferring the biological relevance of features in
> a metagenomic profile. STAMP is open source, extensible via a plugin
> framework, and available for all major platforms.

它需要的数据有两个：Profile和metadata，分别由两个文件提供。profile是OTU
table等核心数据的来源，metadata则包含样品的分组、属性等实验关键设计。

profile文件可以由[biom](http://bio-spring.top/biom-format/)等文件格式转换。

在转换过程中出现了下图所示的UnicodeEncodeError：‘ascii’ codec can’t
encode character in position 25-31: ordinal not in
range(128)错误。经查是由于文件路径带非ascii字符（中文）造成的。将文件放在全英文的路径中就可以解决这一问题了。

<img src="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2016/05/STAMP_unknown-error-500x197.png" class="alignnone size-medium wp-image-822" sizes="(max-width: 500px) 100vw, 500px" srcset="https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2016/05/STAMP_unknown-error-500x197.png 500w, https://cloudfs-spring.oss-cn-qingdao.aliyuncs.com/bio_spring_uploads/2016/05/STAMP_unknown-error.png 506w" width="500" height="197" alt="STAMP_unknown error" />
