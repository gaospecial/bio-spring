---
title: 整理老文章
author: gaoch
date: '2023-08-08'
slug: tidy-old-blog-post
categories:
  - R
tags:
  - blogdown
  - 百度空间
  - wordpress
---

今天，花时间整理了一下个人网站，主要做了下面这些工作：

1.  选择了一个主题 hugo-prose。选择这个主题的原因是它足够简单，体积小，而且拥有不少需要的功能。如导航条、网站地图、目录、卡片、版权、引文等。
2.  整理了之前的老文章。删掉了一些完全没有营养的帖子。大多数予以保留，并添加了 slug 标签，调整目录结构。写了一个脚本完成这项工作。

``` r
# find all files
files = list.files(path = "content/post/", pattern = stringr::regex("*.(md|rmd)", ignore.case = TRUE), full.names = TRUE)
lapply(files, function(file){
  # retrieve slug from filename
  filename = basename(file)
  ext = xfun::file_ext(file)
  basename = gsub(paste0(".", ext), "", filename)
  slug = gsub("[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}-", "", basename)

  # add tags to those posts
  header = blogdown:::split_yaml_body(xfun::read_utf8(file))[['yaml_list']]
  header$file = file
  if (is.null(header[['slug']])) header$slug = slug
  if (is.null(header[["author"]])) header$author = "gaoch"
  if (header$date < "2008-11-25"){
    header$categories = c("旧文","百度空间")
  } else if (header$date < "2018-10-17"){
    header$categories = c("旧文","WordPress博客")
  } 
  
  do.call(blogdown:::modify_yaml, header)
  
  # move post to new place
  path = paste0("content/post/", basename)
  dir.create(path)
  success = file.copy(from = file,
            to = paste(path, paste0("index.zh.", ext), sep = "/"))
  if(success){
    file.remove(file)
  }
})
```
