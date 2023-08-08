---
title: MetaPhlAn：利用宏基因组分析种群结构
date: '2016-03-20'
slug: 2016-03-20-metaphlan-metagenomic-phylogenetic-analysis
tags:
- 生物信息 BIOINFORMATICS
- 生物软件 BIO-SOFTWARE
- MetaPhlAn
- mothur
- QIIME
---


宏基因组中包含了环境中各种微生物的基因组信息，理论上可以得出种群结构。该如何利用宏基因组高通量测序数据分析种群结构呢？是不是要从中提取16S
rRNA的数据，
组装之后使用[Mothur或QIIME](http://bio-spring.top/mothur-and-qiime/)分析呢？

[MetaPhlAn](http://huttenhower.sph.harvard.edu/metaphlan)有一个不一样的想法。

> MetaPhlAn is a computational tool for profiling the composition of
> microbial communities from metagenomic shotgun sequencing data.
> MetaPhlAn relies on **unique clade-specific marker genes** identified
> from 3,000 reference genomes, allowing:
>
> -   up to 25,000 reads-per-second (on one CPU) analysis speed (orders
>     of magnitude faster compared to existing methods);
> -   unambiguous taxonomic assignments as the MetaPhlAn markers are
>     clade-specific;
> -   accurate estimation of organismal relative abundance (in terms of
>     number of cells rather than fraction of reads);
> -   species-level resolution for bacterial and archaeal organisms;
> -   extensive validation of the profiling accuracy on several
>     synthetic datasets and on thousands of real metagenomes.
>
>  
>
> 它使用**物种特异性的标记基因**来进行分析，并且能够得到很好的种群分析结果。
>
>  
