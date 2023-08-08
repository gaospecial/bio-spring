---
title: A Genbank –> GTF converter derived from BioPerl
date: '2015-10-14'
slug: 2015-10-14-a-genbank-gtf-converter-derived-from-bioperl
tags:
- BioPerl BIOPERL
- 生物信息 BIOINFORMATICS
- BioPerl
- GenBank
- GFF
- GTF
---


BioPerl has a Genbank –&gt; GFF converter (the script is
bp\_genbank2gff3.pl), however, this converter generated GFF/GTF file
could not work in Bioconductor when using the function
**maketxdbfromGFF** to construct a transcript database.

Currently, I have developed such a converter that may extract
information from a NCBI Genbank file and write them to GFF version 2, or
GTF format. This script is derived from BioPerl, so you need firstly
[get the module installed](http://bio-spring.top/reinstall-bioperl/) in
your system. To check whether BioPerl is ready, just refer to this post:
<http://bio-spring.top/check-bioperl/> .

Here is the synopsis of this script.

## SYNOPSIS

`     NCBI_genbank2gtf.pl [options] filename`

Options:  
--help -h display this message  
--input -i NCBI GenBank file  
--out -o filename of GTF output

Examples:

perl NCBI\_genbank2gtf.pl -i seq.gb -o seq.gtf  
perl NCBI\_genbank2gtf.pl seq.gb &gt; seq.gtf  

The codes is as follows:  
` #!/usr/bin/perl `

=pod

=head1 NAME

NCBI\_genbank2gtf.pl -- Genbank -&gt; Bioconductor friendly GTF

=head1 SYNOPSIS

NCBI\_genbank2gtf.pl \[options\] filename

Options:  
--help -h display this message  
--input -i NCBI GenBank file  
--out -o filename of GTF output

Examples:

perl NCBI\_genbank2gtf.pl -i seq.gb -o seq.gtf  
perl NCBI\_genbank2gtf.pl seq.gb &gt; seq.gtf

=head1 DESCRIPTION

Use this program to generate bioconductor friendly GTF files from NCBI
GenBank.  
The file may be used in \*maketxdbfromGFF\* function and should work
well.

=head1 AUTHOR

Chun-Hui, Gao (gaoch@thelifesciencecentury.com)

Copyright (c) 2015 www.thelifesciencecentury.com.

=cut

use strict;  
use Data::Dumper;  
use Pod::Usage;  
use Bio::SeqIO;  
use Getopt::Long;

my ($help, $genbank\_input, $gtf\_output);

my $ok= GetOptions( 'help\|h' =&gt; \\$help,  
'input\|i=s' =&gt; \\$genbank\_input,  
'out\|o=s' =&gt; \\$gtf\_output );  
pod2usage(2) if $help \|\| !$ok;

$genbank\_input = shift @ARGV unless ($genbank\_input );

open \*IN, "&lt; $genbank\_input " or die pod2usage(2); my $out; if
($gtf\_output) { open $out, "&gt; $gtf\_output" or die "Can't open file
$gtf\_output:$@\\n";  
}  
else {  
$out = \*STDOUT;  
}

my %seen;  
my $in = Bio::SeqIO-&gt;new(-fh =&gt; \\\*IN, -format =&gt;
"genbank");  
while ( my $seq = $in-&gt;next\_seq() ) {  
my $seq\_acc = $seq-&gt;accession\_number;

\# abort if there are no features  
warn "$seq\_acc has no features, skipping\\n" and next  
if !$seq-&gt;all\_SeqFeatures;

\# construct a GFF header  
\# add: get source\_type from attributes of source feature? chromosome=X
tag  
\# also combine 1st ft line here with source ft from $seq ..  
my $header = gff\_header($seq);  
print $out $header;  
warn "\# working on $seq\_acc\\n";

for my $feature ( $seq-&gt;get\_all\_SeqFeatures ) {

my $method = $feature-&gt;primary\_tag;  
$seen{$method} ++;  
$feature = maptags2gff($feature);  
print $out $feature-&gt;gff\_string(), "\\n";  
if ($method eq 'CDS'){  
$feature-&gt;primary\_tag("exon");  
$feature-&gt;add\_tag\_value("exon\_number", 1);  
$feature-&gt;add\_tag\_value("exon\_id",
$feature-&gt;get\_tag\_values("transcript\_id"));  
$feature = maptags2gff($feature);  
print $out $feature-&gt;gff\_string(), "\\n";  
}

}

}

warn "\# Count of features in $genbank\_input:\\n";  
map {warn sprintf("\# %20s:%6d\\n", $\_, $seen{$\_});} keys %seen;

sub gff\_header {  
my ($seq) = @\_;  
my $head = sprintf("\#\#gff-version 2\\n\# sequence-region: %s
(1..%d)\\n", $seq-&gt;accession\_number, $seq-&gt;length);  
$head .= sprintf( "\# %s\\n", $seq-&gt;desc);  
$head .= "\# converted by NCBI\_genbank2gtf.pl\\n";

\#\~ print Dumper $acc, $desc, $end;  
return $head;

}

sub maptags2gff {  
my $f = shift;  
my $method = $f-&gt;primary\_tag;  
my %TAG\_MAP;  
if ($method eq 'gene' \|\| $method eq 'misc\_RNA' \|\| $method eq 'rRNA'
\|\| $method eq 'tRNA'){  
$f-&gt;add\_tag\_value('transcript\_id',$f-&gt;get\_tag\_values('locus\_tag'));  
%TAG\_MAP = ( gene =&gt; 'gene\_name',  
transcript\_id =&gt; 'transcript\_id',  
locus\_tag =&gt; 'gene\_id' );  
}  
elsif ($method eq 'CDS') {  
$f-&gt;add\_tag\_value('transcript\_id',$f-&gt;get\_tag\_values('locus\_tag'));  
%TAG\_MAP = ( locus\_tag =&gt; 'gene\_id',  
protein\_id =&gt; 'protein\_id',  
transcript\_id =&gt; 'transcript\_id',  
gene =&gt; 'gene\_name',  
product =&gt; 'product');

}  
elsif ($method eq 'exon') {

%TAG\_MAP = ( gene\_id =&gt; 'gene\_id',  
protein\_id =&gt; 'protein\_id',  
transcript\_id =&gt; 'transcript\_id',  
exon\_number =&gt; 'exon\_number',  
exon\_id =&gt; 'exon\_id',  
gene\_name =&gt; 'gene\_name');

}  
elsif ($method eq 'source') {  
%TAG\_MAP = ( organism =&gt; 'organism' );

}  
else {

}

my @all\_tags = $f-&gt;get\_all\_tags();  
\#\~ print Dumper \\@all\_tags;  
for my $tag (@all\_tags){

if (exists $TAG\_MAP{$tag}){  
my $newtag= $TAG\_MAP{$tag};  
my @v= $f-&gt;get\_tag\_values($tag);  
$f-&gt;remove\_tag($tag);  
$f-&gt;add\_tag\_value($newtag,@v);  
}  
else {  
$f-&gt;remove\_tag($tag);  
}  
}

return $f;  
}

If you would like to access the full document, run:  
`perldoc NCBI_genbank2gtf.pl`

Feedback is welcome.

Here is also a GenBank -&gt; BED converter:
[](http://bio-spring.top/a-genbank-to-bed-converter/)
