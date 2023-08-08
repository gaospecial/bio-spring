---
title: DT软件包的使用
author: gaoch
date: '2020-02-17'
slug: library-DT
categories:
  - R
tags:
  - DT
---

<script src="{{< blogdown/postref >}}index.zh_files/htmlwidgets/htmlwidgets.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/datatables-css/datatables-crosstalk.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/datatables-binding/datatables.js"></script>
<script src="{{< blogdown/postref >}}index.zh_files/jquery/jquery-3.6.0.min.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/dt-core/css/jquery.dataTables.min.css" rel="stylesheet" />
<link href="{{< blogdown/postref >}}index.zh_files/dt-core/css/jquery.dataTables.extra.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/dt-core/js/jquery.dataTables.min.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/crosstalk/css/crosstalk.min.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/crosstalk/js/crosstalk.min.js"></script>
<script src="{{< blogdown/postref >}}index.zh_files/htmlwidgets/htmlwidgets.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/datatables-css/datatables-crosstalk.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/datatables-binding/datatables.js"></script>
<script src="{{< blogdown/postref >}}index.zh_files/jquery/jquery-3.6.0.min.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/dt-core-bootstrap/css/dataTables.bootstrap.min.css" rel="stylesheet" />
<link href="{{< blogdown/postref >}}index.zh_files/dt-core-bootstrap/css/dataTables.bootstrap.extra.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/dt-core-bootstrap/js/jquery.dataTables.min.js"></script>
<script src="{{< blogdown/postref >}}index.zh_files/dt-core-bootstrap/js/dataTables.bootstrap.min.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/crosstalk/css/crosstalk.min.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/crosstalk/js/crosstalk.min.js"></script>
<script src="{{< blogdown/postref >}}index.zh_files/htmlwidgets/htmlwidgets.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/datatables-css/datatables-crosstalk.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/datatables-binding/datatables.js"></script>
<script src="{{< blogdown/postref >}}index.zh_files/jquery/jquery-3.6.0.min.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/dt-core/css/jquery.dataTables.min.css" rel="stylesheet" />
<link href="{{< blogdown/postref >}}index.zh_files/dt-core/css/jquery.dataTables.extra.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/dt-core/js/jquery.dataTables.min.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/crosstalk/css/crosstalk.min.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/crosstalk/js/crosstalk.min.js"></script>
<script src="{{< blogdown/postref >}}index.zh_files/htmlwidgets/htmlwidgets.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/datatables-css/datatables-crosstalk.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/datatables-binding/datatables.js"></script>
<script src="{{< blogdown/postref >}}index.zh_files/jquery/jquery-3.6.0.min.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/dt-core/css/jquery.dataTables.min.css" rel="stylesheet" />
<link href="{{< blogdown/postref >}}index.zh_files/dt-core/css/jquery.dataTables.extra.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/dt-core/js/jquery.dataTables.min.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/crosstalk/css/crosstalk.min.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/crosstalk/js/crosstalk.min.js"></script>
<script src="{{< blogdown/postref >}}index.zh_files/htmlwidgets/htmlwidgets.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/datatables-css/datatables-crosstalk.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/datatables-binding/datatables.js"></script>
<script src="{{< blogdown/postref >}}index.zh_files/jquery/jquery-3.6.0.min.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/dt-core/css/jquery.dataTables.min.css" rel="stylesheet" />
<link href="{{< blogdown/postref >}}index.zh_files/dt-core/css/jquery.dataTables.extra.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/dt-core/js/jquery.dataTables.min.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/crosstalk/css/crosstalk.min.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/crosstalk/js/crosstalk.min.js"></script>
<script src="{{< blogdown/postref >}}index.zh_files/htmlwidgets/htmlwidgets.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/datatables-css/datatables-crosstalk.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/datatables-binding/datatables.js"></script>
<script src="{{< blogdown/postref >}}index.zh_files/jquery/jquery-3.6.0.min.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/dt-core/css/jquery.dataTables.min.css" rel="stylesheet" />
<link href="{{< blogdown/postref >}}index.zh_files/dt-core/css/jquery.dataTables.extra.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/dt-core/js/jquery.dataTables.min.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/nouislider/jquery.nouislider.min.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/nouislider/jquery.nouislider.min.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/selectize/selectize.bootstrap3.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/selectize/selectize.min.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/crosstalk/css/crosstalk.min.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/crosstalk/js/crosstalk.min.js"></script>
<script src="{{< blogdown/postref >}}index.zh_files/htmlwidgets/htmlwidgets.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/datatables-css/datatables-crosstalk.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/datatables-binding/datatables.js"></script>
<script src="{{< blogdown/postref >}}index.zh_files/jquery/jquery-3.6.0.min.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/dt-core/css/jquery.dataTables.min.css" rel="stylesheet" />
<link href="{{< blogdown/postref >}}index.zh_files/dt-core/css/jquery.dataTables.extra.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/dt-core/js/jquery.dataTables.min.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/crosstalk/css/crosstalk.min.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/crosstalk/js/crosstalk.min.js"></script>
<script src="{{< blogdown/postref >}}index.zh_files/htmlwidgets/htmlwidgets.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/datatables-css/datatables-crosstalk.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/datatables-binding/datatables.js"></script>
<script src="{{< blogdown/postref >}}index.zh_files/jquery/jquery-3.6.0.min.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/dt-core/css/jquery.dataTables.min.css" rel="stylesheet" />
<link href="{{< blogdown/postref >}}index.zh_files/dt-core/css/jquery.dataTables.extra.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/dt-core/js/jquery.dataTables.min.js"></script>
<link href="{{< blogdown/postref >}}index.zh_files/crosstalk/css/crosstalk.min.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.zh_files/crosstalk/js/crosstalk.min.js"></script>

# 基础用法

``` r
library(DT)
datatable(iris)
```

<div class="datatables html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-1" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"filter":"none","vertical":false,"data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","126","127","128","129","130","131","132","133","134","135","136","137","138","139","140","141","142","143","144","145","146","147","148","149","150"],[5.1,4.9,4.7,4.6,5,5.4,4.6,5,4.4,4.9,5.4,4.8,4.8,4.3,5.8,5.7,5.4,5.1,5.7,5.1,5.4,5.1,4.6,5.1,4.8,5,5,5.2,5.2,4.7,4.8,5.4,5.2,5.5,4.9,5,5.5,4.9,4.4,5.1,5,4.5,4.4,5,5.1,4.8,5.1,4.6,5.3,5,7,6.4,6.9,5.5,6.5,5.7,6.3,4.9,6.6,5.2,5,5.9,6,6.1,5.6,6.7,5.6,5.8,6.2,5.6,5.9,6.1,6.3,6.1,6.4,6.6,6.8,6.7,6,5.7,5.5,5.5,5.8,6,5.4,6,6.7,6.3,5.6,5.5,5.5,6.1,5.8,5,5.6,5.7,5.7,6.2,5.1,5.7,6.3,5.8,7.1,6.3,6.5,7.6,4.9,7.3,6.7,7.2,6.5,6.4,6.8,5.7,5.8,6.4,6.5,7.7,7.7,6,6.9,5.6,7.7,6.3,6.7,7.2,6.2,6.1,6.4,7.2,7.4,7.9,6.4,6.3,6.1,7.7,6.3,6.4,6,6.9,6.7,6.9,5.8,6.8,6.7,6.7,6.3,6.5,6.2,5.9],[3.5,3,3.2,3.1,3.6,3.9,3.4,3.4,2.9,3.1,3.7,3.4,3,3,4,4.4,3.9,3.5,3.8,3.8,3.4,3.7,3.6,3.3,3.4,3,3.4,3.5,3.4,3.2,3.1,3.4,4.1,4.2,3.1,3.2,3.5,3.6,3,3.4,3.5,2.3,3.2,3.5,3.8,3,3.8,3.2,3.7,3.3,3.2,3.2,3.1,2.3,2.8,2.8,3.3,2.4,2.9,2.7,2,3,2.2,2.9,2.9,3.1,3,2.7,2.2,2.5,3.2,2.8,2.5,2.8,2.9,3,2.8,3,2.9,2.6,2.4,2.4,2.7,2.7,3,3.4,3.1,2.3,3,2.5,2.6,3,2.6,2.3,2.7,3,2.9,2.9,2.5,2.8,3.3,2.7,3,2.9,3,3,2.5,2.9,2.5,3.6,3.2,2.7,3,2.5,2.8,3.2,3,3.8,2.6,2.2,3.2,2.8,2.8,2.7,3.3,3.2,2.8,3,2.8,3,2.8,3.8,2.8,2.8,2.6,3,3.4,3.1,3,3.1,3.1,3.1,2.7,3.2,3.3,3,2.5,3,3.4,3],[1.4,1.4,1.3,1.5,1.4,1.7,1.4,1.5,1.4,1.5,1.5,1.6,1.4,1.1,1.2,1.5,1.3,1.4,1.7,1.5,1.7,1.5,1,1.7,1.9,1.6,1.6,1.5,1.4,1.6,1.6,1.5,1.5,1.4,1.5,1.2,1.3,1.4,1.3,1.5,1.3,1.3,1.3,1.6,1.9,1.4,1.6,1.4,1.5,1.4,4.7,4.5,4.9,4,4.6,4.5,4.7,3.3,4.6,3.9,3.5,4.2,4,4.7,3.6,4.4,4.5,4.1,4.5,3.9,4.8,4,4.9,4.7,4.3,4.4,4.8,5,4.5,3.5,3.8,3.7,3.9,5.1,4.5,4.5,4.7,4.4,4.1,4,4.4,4.6,4,3.3,4.2,4.2,4.2,4.3,3,4.1,6,5.1,5.9,5.6,5.8,6.6,4.5,6.3,5.8,6.1,5.1,5.3,5.5,5,5.1,5.3,5.5,6.7,6.9,5,5.7,4.9,6.7,4.9,5.7,6,4.8,4.9,5.6,5.8,6.1,6.4,5.6,5.1,5.6,6.1,5.6,5.5,4.8,5.4,5.6,5.1,5.1,5.9,5.7,5.2,5,5.2,5.4,5.1],[0.2,0.2,0.2,0.2,0.2,0.4,0.3,0.2,0.2,0.1,0.2,0.2,0.1,0.1,0.2,0.4,0.4,0.3,0.3,0.3,0.2,0.4,0.2,0.5,0.2,0.2,0.4,0.2,0.2,0.2,0.2,0.4,0.1,0.2,0.2,0.2,0.2,0.1,0.2,0.2,0.3,0.3,0.2,0.6,0.4,0.3,0.2,0.2,0.2,0.2,1.4,1.5,1.5,1.3,1.5,1.3,1.6,1,1.3,1.4,1,1.5,1,1.4,1.3,1.4,1.5,1,1.5,1.1,1.8,1.3,1.5,1.2,1.3,1.4,1.4,1.7,1.5,1,1.1,1,1.2,1.6,1.5,1.6,1.5,1.3,1.3,1.3,1.2,1.4,1.2,1,1.3,1.2,1.3,1.3,1.1,1.3,2.5,1.9,2.1,1.8,2.2,2.1,1.7,1.8,1.8,2.5,2,1.9,2.1,2,2.4,2.3,1.8,2.2,2.3,1.5,2.3,2,2,1.8,2.1,1.8,1.8,1.8,2.1,1.6,1.9,2,2.2,1.5,1.4,2.3,2.4,1.8,1.8,2.1,2.4,2.3,1.9,2.3,2.5,2.3,1.9,2,2.3,1.8],["setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Sepal.Length<\/th>\n      <th>Sepal.Width<\/th>\n      <th>Petal.Length<\/th>\n      <th>Petal.Width<\/th>\n      <th>Species<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[1,2,3,4]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>

在上面的表格中，搜索框提供了针对所有数据进行检索的功能，检索词可以是文本、数值或其它任意的数据项。检索结果实时显示，如果没有找到任何结果则显示为空白。

# 语法

`datatable` 的语法如下所示。

``` r
datatable(data, options = list(), class = "display",
    callback = JS("return table;"), rownames, colnames, container,
    caption = NULL, filter = c("none", "bottom", "top"), escape = TRUE,
    style = "default", width = NULL, height = NULL, elementId = NULL,
    fillContainer = getOption("DT.fillContainer", NULL),
    autoHideNavigation = getOption("DT.autoHideNavigation", NULL),
    selection = c("multiple", "single", "none"), extensions = list(),
    plugins = NULL, editable = FALSE)
```

## 样式和显示相关参数

- class：设置原始的类，类名来自于 default.css 或者 bootstrap.css

- style：默认仅支持 default 和 bootstrap 的 CSS 样式表

- rownames：是否显示行名，或者指定行名（向量或者一一对应的列表）

- colnames：是否显示列名，或者指定列名

- caption：表格的标题

- escape：是否转义 HTML 字符（默认为不转义）

bootstrap 样式的名称可以 [在此](http://getbootstrap.com/css/#tables)查询。

需要注意的是 DT 会自动矫正样式名称，使用下面的命令可以查看具体对应的样式。
此外，样式的实际显示效果与网站采用的基础CSS框架有很大关系，因此每个人运行下列代码得到的最终显示结果可能会有明显差别。

``` r
DT:::DT2BSClass('display')
```

    ## [1] "table table-striped table-hover row-border order-column display"

``` r
DT:::DT2BSClass(c('compact', 'cell-border'))
```

    ## [1] "table table-condensed table-bordered"

换一个样式看看。

``` r
# 使用 bootstrap.css
datatable(iris, style = 'bootstrap', class = 'table-bordered')
```

<div class="datatables html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-2" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-2">{"x":{"style":"bootstrap","filter":"none","vertical":false,"data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","126","127","128","129","130","131","132","133","134","135","136","137","138","139","140","141","142","143","144","145","146","147","148","149","150"],[5.1,4.9,4.7,4.6,5,5.4,4.6,5,4.4,4.9,5.4,4.8,4.8,4.3,5.8,5.7,5.4,5.1,5.7,5.1,5.4,5.1,4.6,5.1,4.8,5,5,5.2,5.2,4.7,4.8,5.4,5.2,5.5,4.9,5,5.5,4.9,4.4,5.1,5,4.5,4.4,5,5.1,4.8,5.1,4.6,5.3,5,7,6.4,6.9,5.5,6.5,5.7,6.3,4.9,6.6,5.2,5,5.9,6,6.1,5.6,6.7,5.6,5.8,6.2,5.6,5.9,6.1,6.3,6.1,6.4,6.6,6.8,6.7,6,5.7,5.5,5.5,5.8,6,5.4,6,6.7,6.3,5.6,5.5,5.5,6.1,5.8,5,5.6,5.7,5.7,6.2,5.1,5.7,6.3,5.8,7.1,6.3,6.5,7.6,4.9,7.3,6.7,7.2,6.5,6.4,6.8,5.7,5.8,6.4,6.5,7.7,7.7,6,6.9,5.6,7.7,6.3,6.7,7.2,6.2,6.1,6.4,7.2,7.4,7.9,6.4,6.3,6.1,7.7,6.3,6.4,6,6.9,6.7,6.9,5.8,6.8,6.7,6.7,6.3,6.5,6.2,5.9],[3.5,3,3.2,3.1,3.6,3.9,3.4,3.4,2.9,3.1,3.7,3.4,3,3,4,4.4,3.9,3.5,3.8,3.8,3.4,3.7,3.6,3.3,3.4,3,3.4,3.5,3.4,3.2,3.1,3.4,4.1,4.2,3.1,3.2,3.5,3.6,3,3.4,3.5,2.3,3.2,3.5,3.8,3,3.8,3.2,3.7,3.3,3.2,3.2,3.1,2.3,2.8,2.8,3.3,2.4,2.9,2.7,2,3,2.2,2.9,2.9,3.1,3,2.7,2.2,2.5,3.2,2.8,2.5,2.8,2.9,3,2.8,3,2.9,2.6,2.4,2.4,2.7,2.7,3,3.4,3.1,2.3,3,2.5,2.6,3,2.6,2.3,2.7,3,2.9,2.9,2.5,2.8,3.3,2.7,3,2.9,3,3,2.5,2.9,2.5,3.6,3.2,2.7,3,2.5,2.8,3.2,3,3.8,2.6,2.2,3.2,2.8,2.8,2.7,3.3,3.2,2.8,3,2.8,3,2.8,3.8,2.8,2.8,2.6,3,3.4,3.1,3,3.1,3.1,3.1,2.7,3.2,3.3,3,2.5,3,3.4,3],[1.4,1.4,1.3,1.5,1.4,1.7,1.4,1.5,1.4,1.5,1.5,1.6,1.4,1.1,1.2,1.5,1.3,1.4,1.7,1.5,1.7,1.5,1,1.7,1.9,1.6,1.6,1.5,1.4,1.6,1.6,1.5,1.5,1.4,1.5,1.2,1.3,1.4,1.3,1.5,1.3,1.3,1.3,1.6,1.9,1.4,1.6,1.4,1.5,1.4,4.7,4.5,4.9,4,4.6,4.5,4.7,3.3,4.6,3.9,3.5,4.2,4,4.7,3.6,4.4,4.5,4.1,4.5,3.9,4.8,4,4.9,4.7,4.3,4.4,4.8,5,4.5,3.5,3.8,3.7,3.9,5.1,4.5,4.5,4.7,4.4,4.1,4,4.4,4.6,4,3.3,4.2,4.2,4.2,4.3,3,4.1,6,5.1,5.9,5.6,5.8,6.6,4.5,6.3,5.8,6.1,5.1,5.3,5.5,5,5.1,5.3,5.5,6.7,6.9,5,5.7,4.9,6.7,4.9,5.7,6,4.8,4.9,5.6,5.8,6.1,6.4,5.6,5.1,5.6,6.1,5.6,5.5,4.8,5.4,5.6,5.1,5.1,5.9,5.7,5.2,5,5.2,5.4,5.1],[0.2,0.2,0.2,0.2,0.2,0.4,0.3,0.2,0.2,0.1,0.2,0.2,0.1,0.1,0.2,0.4,0.4,0.3,0.3,0.3,0.2,0.4,0.2,0.5,0.2,0.2,0.4,0.2,0.2,0.2,0.2,0.4,0.1,0.2,0.2,0.2,0.2,0.1,0.2,0.2,0.3,0.3,0.2,0.6,0.4,0.3,0.2,0.2,0.2,0.2,1.4,1.5,1.5,1.3,1.5,1.3,1.6,1,1.3,1.4,1,1.5,1,1.4,1.3,1.4,1.5,1,1.5,1.1,1.8,1.3,1.5,1.2,1.3,1.4,1.4,1.7,1.5,1,1.1,1,1.2,1.6,1.5,1.6,1.5,1.3,1.3,1.3,1.2,1.4,1.2,1,1.3,1.2,1.3,1.3,1.1,1.3,2.5,1.9,2.1,1.8,2.2,2.1,1.7,1.8,1.8,2.5,2,1.9,2.1,2,2.4,2.3,1.8,2.2,2.3,1.5,2.3,2,2,1.8,2.1,1.8,1.8,1.8,2.1,1.6,1.9,2,2.2,1.5,1.4,2.3,2.4,1.8,1.8,2.1,2.4,2.3,1.9,2.3,2.5,2.3,1.9,2,2.3,1.8],["setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica"]],"container":"<table class=\"table table-bordered\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Sepal.Length<\/th>\n      <th>Sepal.Width<\/th>\n      <th>Petal.Length<\/th>\n      <th>Petal.Width<\/th>\n      <th>Species<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[1,2,3,4]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>

再换一个样式看看，同时改变列名，显示caption。

``` r
# 使用 default.css
datatable(head(iris), class = 'cell-border stripe', 
          colnames = c('Another Better Name' = 2, 'Yet Another Name' = 4),
          caption = 'Table 1: This is a simple caption for the table.')
```

<div class="datatables html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-3" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-3">{"x":{"filter":"none","vertical":false,"caption":"<caption>Table 1: This is a simple caption for the table.<\/caption>","data":[["1","2","3","4","5","6"],[5.1,4.9,4.7,4.6,5,5.4],[3.5,3,3.2,3.1,3.6,3.9],[1.4,1.4,1.3,1.5,1.4,1.7],[0.2,0.2,0.2,0.2,0.2,0.4],["setosa","setosa","setosa","setosa","setosa","setosa"]],"container":"<table class=\"cell-border stripe\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Another Better Name<\/th>\n      <th>Sepal.Width<\/th>\n      <th>Yet Another Name<\/th>\n      <th>Petal.Width<\/th>\n      <th>Species<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[1,2,3,4]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>

当表格内容为 HTML 代码时，可以打开转义设置。

``` r
m = matrix(c(
  '<b>Bold</b>', '<em>Emphasize</em>', '<a href="http://rstudio.com">RStudio</a>',
  '<a href="#" onclick="alert(\'Hello World\');">Hello</a>'
), 2)
colnames(m) = c('<span style="color:red">Column 1</span>', '<em>Column 2</em>')
datatable(m, escape = FALSE)
```

<div class="datatables html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-4" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-4">{"x":{"filter":"none","vertical":false,"data":[["<b>Bold<\/b>","<em>Emphasize<\/em>"],["<a href=\"http://rstudio.com\">RStudio<\/a>","<a href=\"#\" onclick=\"alert('Hello World');\">Hello<\/a>"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th><span style=\"color:red\">Column 1<\/span><\/th>\n      <th><em>Column 2<\/em><\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>

## 实时编辑

- editable：允许双击启用实时编辑。不仅可以接受逻辑值，还可以接受字符和列表（用于配置可编辑的区域）。

编辑可以分为客户端和服务端，在下面的编辑只能保留在客户端。

``` r
DT::datatable(head(iris), editable = 'cell')
```

<div class="datatables html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-5" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-5">{"x":{"filter":"none","vertical":false,"editable":{"target":"cell","disable":{"columns":null},"numeric":[1,2,3,4],"date":[]},"data":[["1","2","3","4","5","6"],[5.1,4.9,4.7,4.6,5,5.4],[3.5,3,3.2,3.1,3.6,3.9],[1.4,1.4,1.3,1.5,1.4,1.7],[0.2,0.2,0.2,0.2,0.2,0.4],["setosa","setosa","setosa","setosa","setosa","setosa"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Sepal.Length<\/th>\n      <th>Sepal.Width<\/th>\n      <th>Petal.Length<\/th>\n      <th>Petal.Width<\/th>\n      <th>Species<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[1,2,3,4]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>

如果需要在服务端写入修改的结果，则需要配置服务端的响应（示例：https://yihui.shinyapps.io/DT-edit/）。

## 过滤数据

- filter：支持实时过滤数据

不同的类型将会以不同的形式提供过滤选项。

- 数字、时间、日期：显示为滑块，指定范围
- 因子：显示为复选框
- 文本：显示为文本输入

``` r
d = data.frame(
  names = rownames(mtcars),
  date = as.Date('2015-03-23') + 1:32,
  time = as.POSIXct('2015-03-23 12:00:00', tz = 'UTC') + (1:32) * 5000,
  stringsAsFactors = FALSE
)
str(d)
```

    ## 'data.frame':	32 obs. of  3 variables:
    ##  $ names: chr  "Mazda RX4" "Mazda RX4 Wag" "Datsun 710" "Hornet 4 Drive" ...
    ##  $ date : Date, format: "2015-03-24" "2015-03-25" ...
    ##  $ time : POSIXct, format: "2015-03-23 13:23:20" "2015-03-23 14:46:40" ...

``` r
datatable(d, filter = 'top', options = list(pageLength = 5))
```

<div class="datatables html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-6" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-6">{"x":{"filter":"top","vertical":false,"filterHTML":"<tr>\n  <td><\/td>\n  <td data-type=\"character\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"date\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none;position: absolute;width: 200px;opacity: 1\">\n      <div data-min=\"1427155200000\" data-max=\"1429833600000\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"time\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none;position: absolute;width: 200px;opacity: 1\">\n      <div data-min=\"1.427117e+12\" data-max=\"1.427272e+12\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n<\/tr>","data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32"],["Mazda RX4","Mazda RX4 Wag","Datsun 710","Hornet 4 Drive","Hornet Sportabout","Valiant","Duster 360","Merc 240D","Merc 230","Merc 280","Merc 280C","Merc 450SE","Merc 450SL","Merc 450SLC","Cadillac Fleetwood","Lincoln Continental","Chrysler Imperial","Fiat 128","Honda Civic","Toyota Corolla","Toyota Corona","Dodge Challenger","AMC Javelin","Camaro Z28","Pontiac Firebird","Fiat X1-9","Porsche 914-2","Lotus Europa","Ford Pantera L","Ferrari Dino","Maserati Bora","Volvo 142E"],["2015-03-24","2015-03-25","2015-03-26","2015-03-27","2015-03-28","2015-03-29","2015-03-30","2015-03-31","2015-04-01","2015-04-02","2015-04-03","2015-04-04","2015-04-05","2015-04-06","2015-04-07","2015-04-08","2015-04-09","2015-04-10","2015-04-11","2015-04-12","2015-04-13","2015-04-14","2015-04-15","2015-04-16","2015-04-17","2015-04-18","2015-04-19","2015-04-20","2015-04-21","2015-04-22","2015-04-23","2015-04-24"],["2015-03-23T13:23:20Z","2015-03-23T14:46:40Z","2015-03-23T16:10:00Z","2015-03-23T17:33:20Z","2015-03-23T18:56:40Z","2015-03-23T20:20:00Z","2015-03-23T21:43:20Z","2015-03-23T23:06:40Z","2015-03-24T00:30:00Z","2015-03-24T01:53:20Z","2015-03-24T03:16:40Z","2015-03-24T04:40:00Z","2015-03-24T06:03:20Z","2015-03-24T07:26:40Z","2015-03-24T08:50:00Z","2015-03-24T10:13:20Z","2015-03-24T11:36:40Z","2015-03-24T13:00:00Z","2015-03-24T14:23:20Z","2015-03-24T15:46:40Z","2015-03-24T17:10:00Z","2015-03-24T18:33:20Z","2015-03-24T19:56:40Z","2015-03-24T21:20:00Z","2015-03-24T22:43:20Z","2015-03-25T00:06:40Z","2015-03-25T01:30:00Z","2015-03-25T02:53:20Z","2015-03-25T04:16:40Z","2015-03-25T05:40:00Z","2015-03-25T07:03:20Z","2015-03-25T08:26:40Z"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>names<\/th>\n      <th>date<\/th>\n      <th>time<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"pageLength":5,"columnDefs":[{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false,"orderCellsTop":true,"lengthMenu":[5,10,25,50,100]}},"evals":[],"jsHooks":[]}</script>

## 指定显示框架

- container：可以将数据填入一个指定的 HTML 框架

``` r
# a custom table container
sketch = htmltools::withTags(table(
  class = 'display',
  thead(
    tr(
      th(rowspan = 2, 'Species'),
      th(colspan = 2, 'Sepal'),
      th(colspan = 2, 'Petal')
    ),
    tr(
      lapply(rep(c('Length', 'Width'), 2), th)
    )
  )
))
print(sketch)
```

    ## <table class="display">
    ##   <thead>
    ##     <tr>
    ##       <th rowspan="2">Species</th>
    ##       <th colspan="2">Sepal</th>
    ##       <th colspan="2">Petal</th>
    ##     </tr>
    ##     <tr>
    ##       <th>Length</th>
    ##       <th>Width</th>
    ##       <th>Length</th>
    ##       <th>Width</th>
    ##     </tr>
    ##   </thead>
    ## </table>

``` r
# use rownames = FALSE here because we did not generate a cell for row names in
# the header, and the header only contains five columns
datatable(iris[1:20, c(5, 1:4)], container = sketch, rownames = FALSE)
```

<div class="datatables html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-7" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-7">{"x":{"filter":"none","vertical":false,"class":"display","data":[["setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa"],[5.1,4.9,4.7,4.6,5,5.4,4.6,5,4.4,4.9,5.4,4.8,4.8,4.3,5.8,5.7,5.4,5.1,5.7,5.1],[3.5,3,3.2,3.1,3.6,3.9,3.4,3.4,2.9,3.1,3.7,3.4,3,3,4,4.4,3.9,3.5,3.8,3.8],[1.4,1.4,1.3,1.5,1.4,1.7,1.4,1.5,1.4,1.5,1.5,1.6,1.4,1.1,1.2,1.5,1.3,1.4,1.7,1.5],[0.2,0.2,0.2,0.2,0.2,0.4,0.3,0.2,0.2,0.1,0.2,0.2,0.1,0.1,0.2,0.4,0.4,0.3,0.3,0.3]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th rowspan=\"2\">Species<\/th>\n      <th colspan=\"2\">Sepal<\/th>\n      <th colspan=\"2\">Petal<\/th>\n    <\/tr>\n    <tr>\n      <th>Length<\/th>\n      <th>Width<\/th>\n      <th>Length<\/th>\n      <th>Width<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[1,2,3,4]}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>

## JS 回调函数

``` r
# 初始化后显示第二页
datatable(head(iris, 30), callback = JS('table.page("next").draw(false);'))
```

<div class="datatables html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-8" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-8">{"x":{"filter":"none","vertical":false,"data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"],[5.1,4.9,4.7,4.6,5,5.4,4.6,5,4.4,4.9,5.4,4.8,4.8,4.3,5.8,5.7,5.4,5.1,5.7,5.1,5.4,5.1,4.6,5.1,4.8,5,5,5.2,5.2,4.7],[3.5,3,3.2,3.1,3.6,3.9,3.4,3.4,2.9,3.1,3.7,3.4,3,3,4,4.4,3.9,3.5,3.8,3.8,3.4,3.7,3.6,3.3,3.4,3,3.4,3.5,3.4,3.2],[1.4,1.4,1.3,1.5,1.4,1.7,1.4,1.5,1.4,1.5,1.5,1.6,1.4,1.1,1.2,1.5,1.3,1.4,1.7,1.5,1.7,1.5,1,1.7,1.9,1.6,1.6,1.5,1.4,1.6],[0.2,0.2,0.2,0.2,0.2,0.4,0.3,0.2,0.2,0.1,0.2,0.2,0.1,0.1,0.2,0.4,0.4,0.3,0.3,0.3,0.2,0.4,0.2,0.5,0.2,0.2,0.4,0.2,0.2,0.2],["setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Sepal.Length<\/th>\n      <th>Sepal.Width<\/th>\n      <th>Petal.Length<\/th>\n      <th>Petal.Width<\/th>\n      <th>Species<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[1,2,3,4]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false},"callback":"function(table) {\ntable.page(\"next\").draw(false);\n}"},"evals":["callback"],"jsHooks":[]}</script>
