---
title: 在Ubuntu环境中设置Bowtie
date: '2012-08-20'
slug: 2012-08-20-ubuntu-bowtie
tags:
- 生物信息 BIOINFORMATICS
- bowtie
- dna sequences
- gedit
- seq
---


<div>

<div>

**什么是Bowtie？What is Bowtie？**

</div>

<div>

[Bowtie](http://bowtie-bio.sf.net/) is an ultrafast, memory-efficient
short read aligner geared toward quickly aligning large sets of short
DNA sequences (reads) to large genomes. It aligns 35-base-pair reads to
the human genome at a rate of 25 million reads per hour on a typical
workstation. Bowtie indexes the genome with a
[Burrows-Wheeler](http://en.wikipedia.org/wiki/Burrows-Wheeler_transform)
index to keep its memory footprint small: for the human genome, the
index is typically about 2.2 GB (for unpaired alignment) or 2.9 GB (for
paired-end or colorspace alignment). Multiple processors can be used
simultaneously to achieve greater alignment speed. Bowtie can also
output alignments in the standard
[SAM](http://samtools.sourceforge.net/SAM1.pdf) format, allowing Bowtie
to interoperate with other tools supporting SAM, including the
[SAMtools](http://samtools.sourceforge.net/) consensus, SNP, and indel
callers. Bowtie runs on the command line under Windows, Mac OS X, Linux,
and Solaris.

[Bowtie](http://bowtie-bio.sf.net/) also forms the basis for other
tools, including [TopHat](http://tophat.cbcb.umd.edu/): a fast splice
junction mapper for RNA-seq reads,
[Cufflinks](http://cufflinks.cbcb.umd.edu/): a tool for transcriptome
assembly and isoform quantitiation from RNA-seq reads,
[Crossbow](http://bowtie-bio.sf.net/crossbow): a cloud-computing
software tool for large-scale resequencing data,and
[Myrna](http://bowtie-bio.sf.net/myrna): a cloud computing tool for
calculating differential gene expression in large RNA-seq datasets.

<div>

If you use [Bowtie](http://bowtie-bio.sf.net/) for your published
research, please cite the [Bowtie
paper](http://genomebiology.com/2009/10/3/R25).

</div>

</div>

<div>

</div>

<div>

简而言之，Bowtie是分析比对高通量（下一代）测序技术数据的一个工具软件。

</div>

<div>

</div>

<div>

**Bowtie的安装**

</div>

<div>

\[bash\]sudo apt-get install bowtie\[/bash\]

</div>

<div>

</div>

<div>

**设置Bowtie的Index所在位置**

</div>

<div>

\[bash\]gedit \~/.bashrc\[/bash\]

</div>

<div>

在其中添加一行（请根据实际情况修改文件夹名称）：

</div>

<div>

\[bash\]export BOWTIE\_INDEXES=”\~/bowtie-index”;\[/bash\]

</div>

<div>

保存、关闭gedit。

</div>

<div>

重新读取设置：\[bash\]source \~/.bashrc\[/bash\]

</div>

<div>

这时运行：\[bash\]export\|grep BOWTIE\[/bash\]

</div>

<div>

会得到BOWTIE\_INDEXES的变量设置情况。以后既可以将Bowtie运行所需要的Index文件下载下来（或者自己生成）放置到该文件夹中。

</div>

</div>

<div>

</div>

<div>

如此这般，既可以使用Bowtie了。如果使用Bowtie时发生内存不够的错误，多加点内存吧，别无他法。

</div>
