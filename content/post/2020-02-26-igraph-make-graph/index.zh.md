---
title: 'igraph: 生成网络'
author: gaoch
date: '2020-02-26'
slug: igraph-make-graph
categories:
  - 信息技术
tags:
  - R
  - igraph
---



``` r
library(igraph)
notable_graph <- c("Bull", "Chvatal", "Coxeter", "Cubical", "Diamond", "Dodecahedral", "Dodecahedron", 
                   "Folkman", "Franklin", "Frucht", "Grotzsch", "Heawood", "Herschel", "House", 
                   "HouseX", "Icosahedral", "Icosahedron", "Krackhardt kite", "Levi", "McGee", 
                   "Meredith", "Noperfectmatching", "Nonline", "Octahedral", "Octahedron", 
                   "Petersen", "Robertson", "Smallestcyclicgroup", "Tetrahedral", "Tetrahedron", 
                   "Thomassen", "Tutte", "Uniquely3colorable", "Walther", "Zachary")

graph <- lapply(notable_graph,make_graph)
```

`make_graph()` 一共支持 35 个内置图形。


``` r
par(mfrow=c(5,7))

success <- lapply(notable_graph, function(x){
  graph <- make_graph(x)
  par(mar=c(1,1,1,1))
  plot(graph, main = x)
})
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-2-1.png" width="960" />



``` r
make_star(10) %>% plot
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-3-1.png" width="672" />

``` r
make_de_bruijn_graph(3,4) %>% plot
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-3-2.png" width="672" />

``` r
make_full_graph(10) %>% plot
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-3-3.png" width="672" />

``` r
make_kautz_graph(3,4) %>% plot
```

<img src="{{< blogdown/postref >}}index.zh_files/figure-html/unnamed-chunk-3-4.png" width="672" />

