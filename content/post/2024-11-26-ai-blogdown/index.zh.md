---
title: 使用 AI 优化 blogdown 的分类和标签
author: gaoch
date: '2024-11-26'
slug: ai-rename-blogdown-tags
categories:
  - 信息技术
tags:
  - blogdown
  - ChatGPT
---

要遍历 `blogdown` 站点下的每个文章，并对 `categories` 和 `tags` 进行合并和优化，可以按照以下步骤操作：

1. **读取文章文件**：遍历站点目录，找到所有的文章（通常是 `.Rmd` 或 `.md` 文件），读取文件中的元数据（如 `categories` 和 `tags`）。

2. **合并和优化元数据**：对每篇文章的 `categories` 和 `tags` 进行合并，移除重复项，并根据需要进行优化（例如，合并相似的类别或标签）。

3. **更新文章元数据**：将优化后的 `categories` 和 `tags` 写回文章的元数据。

## 获取全部 tags

下面是一个示例 R 代码，可以帮助实现这个过程：


``` r
library(blogdown)
library(yaml)

# 设置博客目录路径
site_dir <- "/Users/gaoch/GitHub/bio-spring"

# 获取所有文章文件
posts <- list.files(file.path(site_dir, "content", "post"), 
                    pattern = "\\.md$|\\.Rmd$", 
                    recursive = TRUE,
                    full.names = TRUE)

# 获取 tags 的函数
get_tags = function(post) {
  # 读取文章的元数据
  post_yaml <- blogdown:::split_yaml_body(xfun::read_utf8(post))[['yaml_list']]
  
  # 合并 categories 和 tags
  categories <- post_yaml$categories
  tags <- post_yaml$tags
  
  # 合并 categories 和 tags 并去除重复项
  tags <- unique(c(categories, tags))

  return(tags)
}

# 遍历每篇文章
all_tags = lapply(posts, get_tags) |> unlist() |> unique()

# 输出完成信息
head(all_tags)
```

## 使用 ChatGPT 处理和优化 tags


```
下面我将提供给你 200 多个标签，请分析它们之间的含义，把重复的标签合并成一个标签。给每一个标签分配一个分类（生物学，信息技术，其它中的一个）。以csv 格式返回原标签，合并后的标签，分类。

旧文, 百度空间, 研究, 软件分享, 科学研究, WordPress博客, Software, 信息技术 INFORMATICS, 操作系统 LINUX, XML-RPC, 言论 VOICE, 转载, 生物学 BIOLOGY, 生物软件 BIO-SOFTWARE, Bio-Rad, iQ5, Opticon Monitor, 伯乐, Matrix, Vector, 向量, 矩阵, 生物信息 BIOINFORMATICS, GFF, GFF3, BioPerl, Ubuntu, GScribble, gtkhtml2, Python, 博客客户端, BioPerl BIOPERL, 原创教程 TUTORIAL, primer, primer design, primer3, RT-PCR, bash, imagemagick, resize, 压缩图片, 压缩照片, 脚本, 时事 NEWS, 上海, 火灾, Cell封面图片, LWP, perl, rename, script, shell, 重命名, perldoc, blog, 转载 SHARE, 教育, 研究生, 实验方法 METHODS, 结核, 药物, 矩阵实验室 MATLAB, MATLAB, 作图, 折线图, 数据处理, 柱状图, 标准差, 误差线, grep, linux, vi, win7, windows7, 移动硬盘写保护, 移动硬盘只读, 移动硬盘故障, 数据挖掘 DATA MINING, 宋词, 数据挖掘, 团队, NCBI, SwissProt, firefox, zotero, 文献管理, movie, 电影, cygwin, unxutils, virtualBox, Windows, 虚拟机, china, map, 地图, 自然科学 NATURE & SCIENCE, 仪器, 实验室设备, 知识, 紫外灯, BioEdit, TreeView, 进化树, mount, 分区, 挂载, 硬盘, 磁盘, 错误, andriod, diskusage, RidNacs, 工具, 读后感, 张亭栋, 砒霜, 柚子茶, NOD32, 套接字, XP, 隐私, fedora, putty, puttygen, ssh, wordpress, mo, po, poEdit, theme, 主题, 汉化, Flash, SP3, system32, 声音, 故障, 没有声音, 系统文件, DOI, 正则表达式, sqlite, 网站建设 WEBSITE, post, SAM, bowtie, dna sequences, gedit, seq, fastq, formats, sra, 格式, apache, mysql, 随笔 NOTE, Tree, Time, Seneca, Lucilius, Death, Nature, Poverty, R Markdown, plot, regression, 自己 SPRING, 事故, 消防, 生命, NGS, SSPACE, 云计算 CLOUD+, RDS, 云数据库, 阿里云, apache2, OSS, 自做自受 DIY, camera, f60fd, fujifilm, repair, 数码, 相机, 研究进展 PROGRESS, InbR, publication, biobliography, PubMed, SCI, GenBank, GTF, BED, assemble, contig, ContigExpress, NTI, alignment, MEGA, Phylogeny, 多序列比对, ecology, mothur, QIIME, Reading, Thinker, Wealth, MetaPhlAn, PowerPoint, biom, Microbiome, STAMP, author, csl, journal, style, year, RNA-seq, rsem, Origin, aliyun, ecs, Win10, 系统清理, ggplot2, R, Aspera, FTP, 测序, Windows10, Lens, Office, blogdown, statistics, microbial ecology, PCA, PCoA, NMDS, RStudio, git, enrichplot, WordPress, PHP, ggrepel, directlabel, ht-seq, hisat2, ClusterProfiler, tibble, data.frame, Letter, Example, Friendship, Trust, anova, github, proxy, Zotero, Hugo, Chocolatey, ggraph, sf, DT, igraph, ggVennDiagram, renv, ggplot, hugo, 学习笔记, Julia, 科学计算, 数据结构, Makefile, MacOS, PicGo, 图床, dplyr, tidyverse, 算法, Posit, Shiny, AI, 人工智能, 计算机技术, GitHub, Webhook, Apache, COS, NAS, 机器学习
```

它返回的结果如下：


``` r
csv = '旧标签,合并后的标签,分类
ChatGPT,ChatGPT,信息技术
旧文,旧文,其它
研究,科学研究,生物学
软件分享,软件分享,信息技术
科学研究,科学研究,生物学
WordPress博客,WordPress,信息技术
Software,软件分享,信息技术
信息技术 INFORMATICS,信息技术,信息技术
操作系统 LINUX,Linux,信息技术
XML-RPC,XML-RPC,信息技术
言论 VOICE,言论,其它
转载,转载,其它
生物学 BIOLOGY,生物学,生物学
生物软件 BIO-SOFTWARE,生物软件,生物学
Bio-Rad,Bio-Rad,生物学
iQ5,iQ5,生物学
Opticon Monitor,Opticon Monitor,生物学
伯乐,伯乐,生物学
Matrix,矩阵,生物学
Vector,向量,生物学
向量,向量,生物学
矩阵,矩阵,生物学
生物信息 BIOINFORMATICS,生物信息,生物学
GFF,GFF,生物学
GFF3,GFF3,生物学
BioPerl,BioPerl,生物学
Ubuntu,Ubuntu,信息技术
GScribble,GScribble,信息技术
gtkhtml2,gtkhtml2,信息技术
Python,Python,信息技术
博客客户端,博客客户端,信息技术
BioPerl BIOPERL,BioPerl,生物学
原创教程 TUTORIAL,原创教程,其它
primer,primer design,生物学
primer design,primer design,生物学
primer3,primer design,生物学
RT-PCR,RT-PCR,生物学
bash,bash,信息技术
imagemagick,imagemagick,信息技术
resize,压缩图片,信息技术
压缩图片,压缩图片,信息技术
压缩照片,压缩图片,信息技术
脚本,脚本,信息技术
时事 NEWS,时事,其它
上海,上海,其它
火灾,火灾,其它
Cell封面图片,Cell封面图片,生物学
LWP,LWP,信息技术
perl,perl,信息技术
rename,重命名,信息技术
script,脚本,信息技术
shell,shell,信息技术
重命名,重命名,信息技术
perldoc,perldoc,信息技术
blog,WordPress,信息技术
转载 SHARE,转载,其它
教育,教育,其它
研究生,研究生,其它
实验方法 METHODS,实验方法,生物学
结核,结核,生物学
药物,药物,生物学
矩阵实验室 MATLAB,MATLAB,信息技术
MATLAB,MATLAB,信息技术
作图,作图,信息技术
折线图,作图,信息技术
数据处理,数据处理,信息技术
柱状图,作图,信息技术
标准差,作图,信息技术
误差线,作图,信息技术
grep,grep,信息技术
linux,Linux,信息技术
vi,vi,信息技术
win7,Windows,信息技术
windows7,Windows,信息技术
移动硬盘写保护,移动硬盘故障,信息技术
移动硬盘只读,移动硬盘故障,信息技术
移动硬盘故障,移动硬盘故障,信息技术
数据挖掘 DATA MINING,数据挖掘,信息技术
宋词,宋词,其它
数据挖掘,数据挖掘,信息技术
团队,团队,其它
NCBI,NCBI,生物学
SwissProt,SwissProt,生物学
firefox,firefox,信息技术
zotero,Zotero,信息技术
文献管理,Zotero,信息技术
movie,电影,其它
电影,电影,其它
cygwin,cygwin,信息技术
unxutils,unxutils,信息技术
virtualBox,虚拟机,信息技术
Windows,Windows,信息技术
虚拟机,虚拟机,信息技术
china,地图,其它
map,地图,其它
地图,地图,其它
自然科学 NATURE & SCIENCE,自然科学,生物学
仪器,实验室设备,生物学
实验室设备,实验室设备,生物学
知识,知识,其它
紫外灯,紫外灯,生物学
BioEdit,BioEdit,生物学
TreeView,TreeView,生物学
进化树,进化树,生物学
mount,挂载,信息技术
分区,挂载,信息技术
挂载,挂载,信息技术
硬盘,硬盘,信息技术
磁盘,硬盘,信息技术
错误,错误,信息技术
andriod,Android,信息技术
diskusage,diskusage,信息技术
RidNacs,RidNacs,信息技术
工具,工具,信息技术
读后感,读后感,其它
张亭栋,张亭栋,其它
砒霜,砒霜,其它
柚子茶,柚子茶,其它
NOD32,NOD32,信息技术
套接字,套接字,信息技术
XP,Windows,信息技术
隐私,隐私,其它
fedora,Fedora,信息技术
putty,putty,信息技术
puttygen,putty,信息技术
ssh,ssh,信息技术
wordpress,WordPress,信息技术
mo,mo,信息技术
po,po,信息技术
poEdit,poEdit,信息技术
theme,主题,信息技术
主题,主题,信息技术
汉化,汉化,信息技术
Flash,Flash,信息技术
SP3,SP3,信息技术
system32,system32,信息技术
声音,声音,其它
故障,故障,信息技术
没有声音,声音,其它
系统文件,系统文件,信息技术
DOI,DOI,信息技术
正则表达式,正则表达式,信息技术
sqlite,sqlite,信息技术
网站建设 WEBSITE,网站建设,信息技术
post,post,信息技术
SAM,SAM,生物学
bowtie,bowtie,生物学
dna sequences,dna sequences,生物学
gedit,gedit,信息技术
seq,seq,生物学
fastq,fastq,生物学
formats,formats,信息技术
sra,sra,生物学
格式,格式,信息技术
apache,Apache,信息技术
mysql,mysql,信息技术
随笔 NOTE,随笔,其它
Tree,Tree,其它
Time,Time,其它
Seneca,Seneca,其它
Lucilius,Lucilius,其它
Death,Death,其它
Nature,Nature,其它
Poverty,Poverty,其它
R Markdown,R Markdown,信息技术
plot,作图,信息技术
regression,regression,信息技术
自己 SPRING,自己,其它
事故,事故,其它
消防,消防,其它
生命,生命,其它
NGS,NGS,生物学
SSPACE,SSPACE,生物学
云计算 CLOUD+,云计算,信息技术
RDS,RDS,信息技术
云数据库,云数据库,信息技术
阿里云,阿里云,信息技术
apache2,Apache,信息技术
OSS,OSS,信息技术
自做自受 DIY,自做自受,其它
camera,相机,其它
f60fd,f60fd,其它
fujifilm,fujifilm,其它
repair,repair,其它
数码,数码,其它
相机,相机,其它
研究进展 PROGRESS,研究进展,生物学
InbR,InbR,生物学
publication,publication,生物学
biobliography,biobliography,生物学
PubMed,PubMed,生物学
SCI,SCI,生物学
GenBank,GenBank,生物学
GTF,GTF,生物学
BED,BED,生物学
assemble,assemble,生物学
contig,contig,生物学
ContigExpress,ContigExpress,生物学
NTI,NTI,生物学
alignment,alignment,生物学
MEGA,MEGA,生物学
Phylogeny,Phylogeny,生物学
多序列比对,多序列比对,生物学
ecology,ecology,生物学
mothur,mothur,生物学
QIIME,QIIME,生物学
Reading,Reading,其它
Thinker,Thinker,其它
Wealth,Wealth,其它
MetaPhlAn,MetaPhlAn,生物学
PowerPoint,PowerPoint,信息技术
biom,biom,生物学
Microbiome,Microbiome,生物学
STAMP,STAMP,生物学
author,author,其它
csl,csl,信息技术
journal,journal,生物学
style,style,信息技术
year,year,其它
RNA-seq,RNA-seq,生物学
rsem,rsem,生物学
Origin,Origin,信息技术
aliyun,阿里云,信息技术
ecs,ecs,信息技术
Win10,Windows,信息技术
系统清理,系统清理,信息技术
ggplot2,ggplot2,信息技术
R,R,信息技术
Aspera,Aspera,信息技术
FTP,FTP,信息技术
测序,测序,生物学
Windows10,Windows,信息技术
Lens,Lens,信息技术
Office,Office,信息技术
blogdown,blogdown,信息技术
statistics,statistics,信息技术
microbial ecology,microbial ecology,生物学
PCA,PCA,信息技术
PCoA,PCoA,信息技术
NMDS,NMDS,信息技术
RStudio,RStudio,信息技术
git,git,信息技术
enrichplot,enrichplot,信息技术
WordPress,WordPress,信息技术
PHP,PHP,信息技术
ggrepel,ggrepel,信息技术
directlabel,directlabel,信息技术
ht-seq,ht-seq,生物学
hisat2,hisat2,生物学
ClusterProfiler,ClusterProfiler,信息技术
tibble,tibble,信息技术
data.frame,data.frame,信息技术
Letter,Letter,其它
Example,Example,其它
Friendship,Friendship,其它
Trust,Trust,其它
anova,anova,信息技术
github,GitHub,信息技术
proxy,proxy,信息技术
Zotero,Zotero,信息技术
Hugo,Hugo,信息技术
Chocolatey,Chocolatey,信息技术
ggraph,ggraph,信息技术
sf,sf,信息技术
DT,DT,信息技术
igraph,igraph,信息技术
ggVennDiagram,ggVennDiagram,信息技术
renv,renv,信息技术
ggplot,ggplot2,信息技术
hugo,Hugo,信息技术
学习笔记,学习笔记,其它
Julia,Julia,信息技术
科学计算,科学计算,信息技术
数据结构,数据结构,信息技术
Makefile,Makefile,信息技术
MacOS,MacOS,信息技术
PicGo,PicGo,信息技术
图床,图床,信息技术
dplyr,dplyr,信息技术
tidyverse,tidyverse,信息技术
算法,算法,信息技术
Posit,Posit,信息技术
Shiny,Shiny,信息技术
AI,人工智能,信息技术
人工智能,人工智能,信息技术
计算机技术,信息技术,信息技术
GitHub,GitHub,信息技术
Webhook,Webhook,信息技术
Apache,Apache,信息技术
COS,COS,信息技术
NAS,NAS,信息技术
机器学习,机器学习,信息技术'
```


## 修改文章中的标签

读取上面的结果，并据此对文章进行修改。


``` r
all_tags = read.csv(text = csv)
tag2tag = all_tags$合并后的标签
tag2category = all_tags$分类
names(tag2tag) <- names(tag2category) <- all_tags$旧标签

for (file in posts){
  header = blogdown:::split_yaml_body(xfun::read_utf8(file))[['yaml_list']]
  header$file = file
  
  # 获取原有的 tags
  tags = unlist(header[c("categories","tags")]) |> unique() |> na.omit()
  
  # 处理 category
  header$categories <- tag2category[tags] |> unique() |> na.omit()
  header$tags <- tag2tag[tags] |> unique() |> na.omit()
  
  # 更新文件
  do.call(blogdown:::modify_yaml, header)
}
```

