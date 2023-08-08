---
title: 'RSEM: rsem-prepare-reference with NCBI GenBank/GFF3 File'
date: '2017-06-01'
slug: 2017-06-01-rsem-rsem-prepare-reference-with-ncbi-genbankgff3-file
tags:
- BioPerl BIOPERL
- 原创教程 TUTORIAL
- 生物信息 BIOINFORMATICS
- BioPerl
- GenBank
- GFF3
- RNA-seq
- rsem
---


解决方案如下：

1.  Download Genbank from NCBI;
2.  Convert Genbank to GFF3 with
    [BioPerl](http://bio-spring.top/reinstall-bioperl/);
3.  Modify the GFF3 file;
4.  Download Fasta from NCBI or use Genbank conversion;
5.  Use the modified GFF3 file in rsem-prepare-reference;

主要代码如下：  
` bp_genbank2gff3  --GFF_VERSION 3 file.gb awk '$3!~/pseudo/' file.gb.gff > file.rsem.gff # or more restrictly with only protein coding genes awk '$3~/^(gene|mRNA|exon|polypeptide)$/' file.gb.gff > file.cds.gff # remove the version number in fasta accession if no transcript is extract rsem-prepare-reference file.fasta --gff3 file.rsem.gff reference_name`

这里主要解决了以下错误：  
**Line x does not have attribute Parent**

由于rsem遵循gene-&gt;transcript-&gt;exon的结构，并利用exon来作为RNA的最后形式（经过剪切和后处理的RNA），要求exon都有(且仅有）一个Parent。而GFF3文件中pseudogene和pseudogenic\_exon是没有Parent的。

以下为rsem-gff3-to-gtf line
27-32。细菌基因组的GFF3文件在gene-&gt;transcript-&gt;exon中的映射关系如下：gene
= type\_gene, mRNA(tRNA, etc) = type\_transcript, CDS = exon.

` type_gene = ["gene", "snRNA_gene", "transposable_element_gene", "ncRNA_gene", "telomerase_RNA_gene",     "rRNA_gene", "tRNA_gene", "snoRNA_gene", "mt_gene", "miRNA_gene", "lincRNA_gene", "RNA", "VD_gene_segment"] type_transcript = ["transcript", "primary_transcript", "mRNA", "ncRNA", "tRNA", "rRNA", "snRNA", "snoRNA", "miRNA",     "pseudogenic_transcript", "lincRNA", "NMD_transcript_variant", "aberrant_processed_transcript",     "nc_primary_transcript", "processed_pseudogene", "mRNA_TE_gene"] type_exon = ["exon", "CDS", "five_prime_UTR", "three_prime_UTR", "UTR", "noncoding_exon", "pseudogenic_exon"]`
