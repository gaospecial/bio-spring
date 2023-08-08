---
title: Perl LWP：从“国家地理每日图片”到“Cell最近一期的封面”
date: '2010-12-08'
slug: 2010-12-08-perl-lwp-image-fetch
tags:
- 信息技术 INFORMATICS
- 生物学 BIOLOGY
- Cell封面图片
- LWP
- perl
---


在网上看到了一个从国家地理杂志网站下载每日图片的Perl程序。因为网站改版，脚本已经不能正常运行，经过修改后，经测试可以将每日图片下载到当前目录，代码如下：

``` lang:perl
#!/usr/bin/perl
# author:
# Seraphxby
# Purpose:
# 查看国家地理每日图片的Perl脚本
# history:
# v0.1 first draft
# 2010-12-8 modified by gaospecial
use warnings;
use strict;
use LWP::Simple;
my $url='http://photography.nationalgeographic.com/photography/photo-of-the-day';
my $content = get( "$url" ) || die "get the page failed!\n";
my $img;
if ($content =~ m/(.*?<\/a>)/s) {
$content = $1;
if($content =~ m/<img.*?src="([^\t]*?)"/){ # 非贪婪的数量词 *?,匹配中不含有跳格\t
$img = $1;
if($img =~ m/^(.*?)([^\/]+$)/){
$url = $1;
$img = $2;
getstore($url.$img,$img) || die "get img failed!\n";

}
}
}
```

 

然后，为了能够下载Cell的封面，将脚本中的相应参数修改后，类似的，可以从cell网站下载封面图片到当前目录。代码如下：

 

``` lang:perl
#!/usr/bin/perl
# author:
# gaospecial@gmail.com 2010-12
# Purpose:
# 获取最近一期Cell杂志封面的Perl脚本

use warnings;
use strict;
use LWP::Simple;
my $url='http://www.cell.com/current';
my $content = get( "$url" ) || die "get the page failed!\n";
my $img;
if ($content =~ m/(.*?<\/div>)/s) {
$content = $1;
if($content =~ m/<img.*?src="([^\t]*?)".*<p.*>(.*)<\/p>/){ # get url and cation
my $img_src = $1;
my $img_cation = $2;
if($img_src =~ m/^.*?([^\/]+$)/){ # get image name
my $img_name = $1;
getstore($img_src,$img_name) || die "get img failed!\n"; # save image to current dir
}
}
}
```

 

<div class="primary_photo">

<div id="coverpopup">

此处的两部分代码，可以作为Perl LWP模块的入门范例。

Posted from [GScribble](http://sourceforge.net/projects/gscribble/).

</div>

</div>
