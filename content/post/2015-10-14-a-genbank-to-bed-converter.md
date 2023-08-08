---
title: A Genbank to BED converter
date: '2015-10-14'
slug: 2015-10-14-a-genbank-to-bed-converter
tags:
- BioPerl BIOPERL
- 生物信息 BIOINFORMATICS
- BED
- BioPerl
- GenBank
- NCBI
- perl
---


Like [the previous Genbank -&gt; GTF
converter](http://bio-spring.top/a-genbenk-gtf-converter-derived-from-bioperl/),
this script is also depended on BioPerl, so you need firstly get the
module installed in your system ([Install
BioPerl](http://bio-spring.top/reinstall-bioperl/)). To check whether
BioPerl is ready, just refer to this post:
[bio-spring.top/check-bioperl/](http://bio-spring.top/check-bioperl/) .

## SYNOPSIS

`     gb2bed.pl [options] filename`

Options:  
--help -h display this message  
--input -i NCBI GenBank file  
--out -o filename of bed output. \[STDOUT\]  
--filter -f GenBank primary tag that will be filtered, may be set to
'gene', 'CDS', 'rRNA', etc.  
--keep -k GenBank primary tag will be keep. Default is CDS. \[CDS\]

Examples:

perl gb2bed.pl -i seq.gb -o seq.bed  
perl gb2bed.pl -i seq.gb -k CDS -o seq.bed  
perl gb2bed.pl seq.gb &gt; seq.bed  

Read Pod for further information.

` #!/usr/bin/perl `

=pod

=head1 NAME

gb2bed.pl -- Genbank -&gt; BED

=head1 SYNOPSIS

gb2bed.pl \[options\] filename

Options:  
--help -h display this message  
--input -i NCBI GenBank file  
--out -o filename of bed output. \[STDOUT\]  
--filter -f GenBank primary tag that will be filtered, may be set to
'gene', 'CDS', 'rRNA', etc.  
--keep -k GenBank primary tag will be keep. Default is CDS. \[CDS\]

Examples:

perl gb2bed.pl -i seq.gb -o seq.bed  
perl gb2bed.pl -i seq.gb -k CDS -o seq.bed  
perl gb2bed.pl seq.gb &gt; seq.bed

=head1 DESCRIPTION

Use this program to generate bioconductor friendly BED files from NCBI
GenBank.  
Six columns will be extracted:  
1. chrom - name of the chromosome or scaffold. Any valid
seq\_region\_name can be used, and chromosome names can be given with or
without the 'chr' prefix.  
2. chromStart - Start position of the feature in standard chromosomal
coordinates (i.e. first base is 0).  
3. chromEnd - End position of the feature in standard chromosomal
coordinates  
4. name - Label to be displayed under the feature, if turned on in
"Configure this page". \[locus\_tag\]  
5. score - A score between 0 and 1000. \[0\]  
6. strand - defined as + (forward) or - (reverse).

=head1 AUTHOR

Chun-Hui, Gao (gaoch@thelifesciencecentury.com)  
Copyright (c) 2015 www.thelifesciencecentury.com.

=cut

use strict;  
use Data::Dumper;  
use Pod::Usage;  
use Bio::SeqIO;  
use Getopt::Long;

my ($help, $genbank\_input, $output, @filters, @keep);

my $ok= GetOptions( 'help\|h' =&gt; \\$help,  
'input\|i=s' =&gt; \\$genbank\_input,  
'filter\|f=s' =&gt; \\@filters,  
'keep\|k=s' =&gt; \\@keep,  
'out\|o=s' =&gt; \\$output );  
pod2usage(2) if $help \|\| !$ok;

$genbank\_input = shift @ARGV unless ($genbank\_input );

@keep = ('gene') unless $\#keep &gt;= 0;

open \*IN, "&lt; $genbank\_input " or die pod2usage(2); my $out; if
($output) { open $out, "&gt; $output" or die "Can't open file
$output:$@\\n";  
}  
else {  
$out = \*STDOUT;  
}

my %filter;  
map {$filter{$\_}++} @filters;  
my %keep;  
map {$keep{$\_}++} @keep;  
my $in = Bio::SeqIO-&gt;new(-fh =&gt; \\\*IN, -format =&gt;
"genbank");  
while ( my $seq = $in-&gt;next\_seq() ) {  
my $chr = $seq-&gt;accession\_number;

my @all\_SeqFeatures = $seq-&gt;get\_all\_SeqFeatures;

\#\~ warn "\# working on $chr\\n";  
if ($\#filters &gt;= 0){  
@all\_SeqFeatures = grep { !defined $filter{$\_-&gt;primary\_tag} }
@all\_SeqFeatures;  
}  
if ($\#keep &gt;= 0) {  
@all\_SeqFeatures = grep { defined $keep{$\_-&gt;primary\_tag} }
@all\_SeqFeatures;  
}

\# abort if there are no features  
warn "$chr has no features, skipping\\n" and next  
if $\#all\_SeqFeatures &lt; 0; for my $feature ( @all\_SeqFeatures ) {
my ($start, $end, $name, $strand); $start = $feature-&gt;start - 1; \#
bed base is 0, while genbank is 1  
$end = $feature-&gt;end;  
($name) = $feature-&gt;get\_tag\_values('locus\_tag');  
$strand = $feature-&gt;strand;  
$strand = $strand &lt; 0 ? '-' : '+'; print $out join("\\t", $chr,
$start, $end, $name, 0, $strand), "\\n"; } }
