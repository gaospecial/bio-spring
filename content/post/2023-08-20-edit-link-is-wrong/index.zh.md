---
title: Edit link is wrong
author: gaoch
draft: false
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

然而，如果在 Linux 系统中使用 `blogdown::build_site()` 生成的网站，则不存在这一问题。

通过查阅参考资料，发现 `.File.Path` 变量储存的文件路径中，其分隔符是跟随系统的。

> The path separators (slash or backslash) in .File.Path, .File.Dir, and .File.Filename depend on the operating system.
> 
> **See also**: <https://gohugo.io/variables/files/>

这在通常时候并不会有问题。而现在，虽然路径是在 Windows 系统中生成的，但是 GitHub 中的路径却是以 "/" 分隔的。这就出现了本文章所描述的情况。

为此，需要对 `correction.html` 模板进行修改。这里使用 `path.Clean` 函数[^1]将路径转变为 Linux 格式路径。

[^1]: `path.Clean` replaces path separators with slashes (`/`) and removes extraneous separators, including trailing separators.

``` html
  {{ $filePath := path.Clean .File.Path }}
```

> On a Windows system, if `.File.Path` is `foo\bar.md`, then:
>
> `{{ path.Clean .File.Path }} → "foo/bar.md"`
>
> **See also**: <https://gohugo.io/functions/path.clean/>

这样的话，通过 GitHub 修改的功能就更加易用了。