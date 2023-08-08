---
title: 使用BioPerl和primer3批量设计RT-PCR引物
date: '2010-11-12'
slug: 2010-11-12-rt-primer-bioperl
tags:
- BioPerl BIOPERL
- 原创教程 TUTORIAL
- BioPerl
- primer
- primer design
- primer3
- RT-PCR
- Ubuntu
---


Update：

我已经设置了一个[Massive RT-PCR Primer
Designer服务](http://tools.bio-spring.top/rtprimers.cgi)，有需要的朋友可以直接去上传自己基因序列的Fasta文件，然后服务器会将引物返回。

关于[Missing SEQUENCE
tag错误的处理](http://bio-spring.top/primer_error-missing-sequence-tag/)

以下为原文。  
———————————————————————————————–  
本文介绍批量设计RT-PCR引物的方法，基于Ubuntu 10.10系统和BioPerl
1.6.1。但是应当适用于大部分Linux系统。

本文假定你已经安装好BioPerl。

**安装primer3和Bio::PrimerDesigner**

\[bash\]  
&gt;sudo apt-get install primer3 libbio-primerdesigner-perl  
\[/bash\]

**修正程序Bug**

Primer3安装之后的可执行文件存在于/usr/bin/primer3\_core，而Bio::PrimerDesigner软件包找不到该文件，所以需要建立一个符号链接。  
\[bash\]  
&gt;sudo ln -s /usr/bin/primer3\_core /usr/local/bin/primer3  
\[/bash\]

**准备序列文件**

将要设计的文件以Fasta格式保存（也可以用其它BioPerl识别的任意格式保存）在当前目录中，此处以seqs.fa命名。

**代码**

然后在当前目录中新建文件designPrimer.pl。  
录入代码如下：  
\[perl\]  
\#! perl -w  
use Bio::SeqIO;  
use Bio::PrimerDesigner;

my $seqs = Bio::SeqIO-&gt;new(-file =&gt; ‘seqs.fa’);  
open OUT, ‘&gt;&gt; raw\_output.txt’;  
my $pd = Bio::PrimerDesigner-&gt;new;  
while( my $seq = $seqs-&gt;next\_seq() ) {  
my $seqid = $seq-&gt;id;  
my $dna = $seq-&gt;seq;  
my %params = (  
PRIMER\_NUM\_RETURN =&gt; 1,  
PRIMER\_SEQUENCE\_ID =&gt; $seqid,  
SEQUENCE =&gt; $dna,  
PRIMER\_PRODUCT\_SIZE\_RANGE =&gt; ‘150-250’,
\#注意此处参数在perl文档中是错误的，应更正为此  
);  
my $primers = $pd-&gt;design( %params ) or die $pd-&gt;error;  
my ($left\_primer,$right\_primer);  
if ( !$primers-&gt;left ) {  
warn “No primers found for $seqid\\n”;  
}  
else{  
$left\_primer = $primers-&gt;left;  
$right\_primer = $primers-&gt;right;  
}  
print join(‘,’, $seqid, $left\_primer, $right\_primer);  
print “\\n”;  
print OUT $primers-&gt;raw\_output;
\#此处的perl文档也是错误的，应更正为此  
}  
\[/perl\]

**保存引物**

打开终端，输入  
\[bash\]  
&gt; perl designprimer.pl  
\[/bash\]  
如果程序运行正常，引物设计的结果将在屏幕上显示，同时应当会有一些警告信息。

然后，可以将结果用管道命令保存：  
\[bash\]  
&gt; perl designprimer.pl &gt;primers.csv  
\[/bash\]

**注释**

raw\_output.txt中含有primer3程序运行的完整结果。可以作为额外参考。

Refers：  
http://search.cpan.org/\~smckay/Bio-PrimerDesigner-0.07/lib/Bio/PrimerDesigner.pm

Posted from [GScribble](http://sourceforge.net/projects/gscribble/).
