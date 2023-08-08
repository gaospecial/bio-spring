---
title: 生物信息学中的 SAM 格式介绍
date: '2012-08-16'
slug: 2012-08-16-sam-format
tags:
- 生物信息 BIOINFORMATICS
- 生物学 BIOLOGY
- 转载 SHARE
- SAM
---


Following is a brief description of the
[SAM](http://samtools.sourceforge.net/SAM1.pdf) format as output by
**bowtie** when the **-S**/**–sam** option is specified. For more
details, see the [SAM format
specification](http://samtools.sourceforge.net/SAM1.pdf).

When **-S**/**–sam** is specified, **bowtie** prints a SAM header with
**@HD**, **@SQ** and **@PG** lines. When one or more **–sam-RG**
arguments are specified, **bowtie** will also print an **@RG** line that
includes all user-specified **–sam-RG** tokens separated by tabs.

Each subsequnt line corresponds to a read or an alignment. Each line is
a collection of at least 12 fields separated by tabs; from left to
right, the fields are:

1.  Name of read that aligned

2.  Sum of all applicable flags. Flags relevant to Bowtie are:  

    |         |                                                                                       |
    |---------|---------------------------------------------------------------------------------------|
    | **1**   | The read is one of a pair                                                             |
    | **2**   | The alignment is one end of a proper paired-end alignment                             |
    | **4**   | The read has no reported alignments                                                   |
    | **8**   | The read is one of a pair and has no reported alignments                              |
    | **16**  | The alignment is to the reverse reference strand                                      |
    | **32**  | The other mate in the paired-end alignment is aligned to the reverse reference strand |
    | **64**  | The read is the first (\#1) mate in a pair                                            |
    | **128** | The read is the second (\#2) mate in a pair                                           |

    Thus, an unpaired read that aligns to the reverse reference strand
    will have flag 16. A paired-end read that aligns and is the first
    mate in the pair will have flag 83 (= 64 + 16 + 2 + 1).

3.  Name of reference sequence where alignment occurs, or ordinal ID if
    no name was provided

4.  1-based offset into the forward reference strand where leftmost
    character of the alignment occurs

5.  Mapping quality

6.  CIGAR string representation of alignment

7.  Name of reference sequence where mate’s alignment occurs. Set to
    **=** if the mate’s reference sequence is the same as this
    alignment’s, or **\*** if there is no mate.

8.  1-based offset into the forward reference strand where leftmost
    character of the mate’s alignment occurs. Offset is 0 if there is no
    mate.

9.  Inferred insert size. Size is negative if the mate’s alignment
    occurs upstream of this alignment. Size is 0 if there is no mate.

10. Read sequence (reverse-complemented if aligned to the reverse
    strand)

11. ASCII-encoded read qualities (reverse-complemented if the read
    aligned to the reverse strand). The encoded quality values are on
    the [Phred
    quality](http://en.wikipedia.org/wiki/FASTQ_format#Variations) scale
    and the encoding is ASCII-offset by 33 (ASCII char **!**), similarly
    to a [FASTQ](http://en.wikipedia.org/wiki/FASTQ_format) file.

12. Optional fields. Fields are tab-separated. For descriptions of all
    possible optional fields, see the SAM format specification.
    **bowtie**outputs some of these optional fields for each alignment,
    depending on the type of the alignment:

-   NM:i:&lt;N&gt; Aligned read has an edit distance of &lt;N&gt;.
-   CM:i:&lt;N&gt; Aligned read has an edit distance of &lt;N&gt; in
    colorspace. This field is present in addition to the NM field in
    -C/–color mode, but is omitted otherwise.
-   MD:Z:&lt;S&gt; For aligned reads, &lt;S&gt; is a string
    representation of the mismatched reference bases in the alignment.
    See SAM format specification for details. For colorspace alignments,
    &lt;S&gt; describes the decoded nucleotide alignment, not the
    colorspace alignment.
-   XA:i:&lt;N&gt; Aligned read belongs to stratum &lt;N&gt;. See Strata
    for definition.
-   XM:i:&lt;N&gt; For a read with no reported alignments, &lt;N&gt; is
    0 if the read had no alignments. If -m was specified and the read’s
    alignments were supressed because the -m ceiling was exceeded,
    &lt;N&gt; equals the -m ceiling + 1, to indicate that there were at
    least that many valid alignments (but all were suppressed). In -M
    mode, if the alignment was randomly selected because the -M ceiling
    was exceeded, &lt;N&gt; equals the -M ceiling + 1, to indicate that
    there were at least that many valid alignments (of which one was
    reported at random).

 

SAM文件定义

SAM是一种序列比对格式标准，
由sanger制定，是以TAB为分割符的文本格式。主要应用于测序序列mapping到基因组上的结果表示，当然也可以表示任意的多重比对结果。

不同的软件，不同的时期，不同的研究方向，都会创建一种或者多种格式标准，当然根据当时的需要，创建符合需求的标准，也是最容易的事情，而反过来想
要真正的理解标准，也必须理解为什么要创建这样的标准，解决什么样的需要。我前面的有篇文章已经对于现有的多重比对的格式进行总结，但其更多的站在比较基
因组学的角度。当我们去了解sam标准格式是什么的时候，就要思考既然以及有了这么多得标准，为什么还要定义SAM标准，当然拿所有的格式进行比较也并非
易事，但是简单的对比，就可以了解其中一二，比如aln格式，是比对视图化的展示，存储的信息不够结构化，无法方便的作为另外程序的输入；表示信息的有限
性，如果100个多重比对序列放到一个文件中，查看维护就会非常困难；还有些格式标准挺强大，但是太繁琐，同时不够灵活。那么反过来就是SAM格式的优
点，那么SAM如何做到这一点的呢？

SAM要处理好的问题：

-   非常多序列（read)，mapping到多个参考基因组（reference）上；
-   同一条序列，分多段（segment）比对到参考基因组上；
-   无限量的，结构化信息表示，包括错配、删除、插入等比对信息；

SAM分为两部分，注释信息（header section）和比对结果部分（alignment
section），注释信息可有可无，都是以@开头，用不同的tag表示不同的信息，主要有@HD，说明符合标准的版本、对比序列的排列顺序；@SQ，参
考序列说明；@RG，比对上的序列（read）说明；@PG，使用的程序说明；@CO，任意的说明信息。

[<img src="http://boyun.sh.cn/bio/wp-content/uploads/2012/07/btp352f1.jpg" title="SAM格式示例" class="alignnone size-full wp-image-1891" width="447" height="360" alt="SAM格式示例" />](http://boyun.sh.cn/bio/wp-content/uploads/2012/07/btp352f1.jpg)

比对结果部分（alignment
section），每一行表示一个片段（segment）的比对信息，包括11个必须的字段（mandatory
fields）和一个可选的字段，字段之间用tag分割。必须的字段有11个，顺序固定，不可用时，根据字段定义，可以为’0‘或者’\*‘，这是11个字
段包括：

1.  QNAME，比对片段的（template）的编号；
2.  FLAG，位标识，template
    mapping情况的数字表示，每一个数字代表一种比对情况，这里的值是符合情况的数字相加总和；
3.  RNAME，参考序列的编号，如果注释中对SQ-SN进行了定义，这里必须和其保持一致，另外对于没有mapping上的序列，这里是’\*‘；
4.  POS，比对上的位置，注意是从1开始计数，没有比对上，此处为0；
5.  MAPQ，mappint的质量；
6.  CIGAR，简要比对信息表达式（Compact Idiosyncratic Gapped Alignment
    Report），其以参考序列为基础，使用数字加字母表示比对结果，比如3S6M1P1I4M，前三个碱基被剪切去除了，然后6个比对上了，然后打开了一
    个缺口，有一个碱基插入，最后是4个比对上了，是按照顺序的；
7.  RNEXT，下一个片段比对上的参考序列的编号，没有另外的片段，这里是’\*‘，同一个片段，用’=‘；
8.  PNEXT，下一个片段比对上的位置，如果不可用，此处为0；
9.  TLEN，Template的长度，最左边得为正，最右边的为负，中间的不用定义正负，不分区段（single-segment)的比对上，或者不可用时，此处为0；
10. SEQ，序列片段的序列信息，如果不存储此类信息，此处为’\*‘，注意CIGAR中M/I/S/=/X对应数字的和要等于序列长度；
11. QUAL，序列的质量信息，格式同FASTQ一样。

可选字段（optional
fields)，格式如：TAG:TYPE:VALUE，其中TAG有两个大写字母组成，每个TAG代表一类信息，每一行一个TAG只能出现一次，TYPE表示TAG对应值的类型，可以是字符串、整数、字节、数组等。

要注意的几个概念，以及与之对应的模型：

-   reference
-   read
-   segment
-   template（参考序列和比对上的序列共同组成的序列为template）
-   alignment
-   seq

 

http://bowtie-bio.sourceforge.net/manual.shtml\#sam-bowtie-output

http://boyun.sh.cn/bio/?p=1890
