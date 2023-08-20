---
title: Edit link is wrong
author: gaoch
draft: true
date: '2023-08-20'
slug: edit-link-is-wrong
categories:
  - blogdown
tags:
  - Hugo
---

Hugo 使用变量 `.File.Path` 访问当前文件的目录。在 `correction.html` 中主要针对 R Markdown 文件存在的情况，找出对应的 `*.Rmd` 和 `*.Rmarkdown` 的路径。

``` html
{{ if (and .File .Site.Params.editLink) }}
<div>
  <div class="side side-left"><h3>{{ i18n "suggestChanges" }}</h3></div>
  {{ $filePath := .File.Path }}
  {{ $RmdFile := (print .File.Dir .File.BaseFileName ".Rmd") }}
  {{ if (fileExists (print "content/" $RmdFile)) }}
    {{ $filePath = $RmdFile }}
  {{ else }}
    {{ $RmdFile = (print .File.Dir .File.BaseFileName ".Rmarkdown") }}
    {{ if (fileExists (print "content/" $RmdFile)) }}
      {{ $filePath = $RmdFile }}
    {{ end }}
  {{ end }}
  {{ i18n "suggestChangesText1" }}<a href="{{ .Site.Params.editLink }}{{ $filePath }}" id="edit-link">{{ i18n "suggestChangesText2" }}</a>
</div>
{{ end }}
```

现在的问题是，`.File.Path` 的路径在 Windows 中生成时，会因为 `\` 的存在导致无法访问到正确的路径。

目前，还不清楚 Linux 系统中是否存在这一问题。

参考资料：<https://gohugo.io/variables/files/>