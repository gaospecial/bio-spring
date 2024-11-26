---
title: 更改 blogdown 主题
author: Chun-Hui Gao
date: '2023-08-20'
draft: no
slug: modifying-blogdown-hugo-theme
categories:
  - 信息技术
tags:
  - blogdown
  - Hugo
  - 主题
---

Hugo Prose 主题中，网站主页的元素是通过 `/themes/hugo-prose/layouts/_default/list.html` 生成的。

有几个地方想改一下：

1.  显示卡片时，标题统一放在左边。原来左一下右一下看起来有点多余。

2.  显示 blog post 时，以一句话标题显示，不使用小卡片的形式。

## 调整卡片标题的位置

``` html
{{ if .IsHome }}
{{ range $i, $p := (where .Site.RegularPages "Section" "card") }}
<section class="article-list"{{ with .Params.style }}{{ printf " style=%q" . | safeHTMLAttr }}{{ end }}>
  <table>
<tbody>
<tr>
{{if (eq (mod $i 2) 0) }}
<td class="side-title"><h1>{{ $p.Title }}</h1></td>
<td class="spacer spacer-left"></td>
<td>{{ $p.Content }}</td>
{{ else }}
<td>{{ $p.Content }}</td>
<td class="spacer spacer-right"></td>
<td class="side-title"><h1>{{ $p.Title }}</h1></td>
{{ end }}
</tr>
</tbody>
</table>
</section>
{{ end }}
{{ end }}
```

`{{ range $i, $p := (where .Site.RegularPages "Section" "card") }}` 表示在全部页面中搜索，`section = card` 的页面。这里的 `section` 指的是 `content` 目录下面的子文件夹，即 `content/card/` 目录。这个命令的作用就是把这里的文件序号赋值给 `$i`，把内容对象赋值给 `$p`。

接下来，根据编号 `$i` 是否是偶数，分别设置不同的 CSS 类（`.side-title`，`spacer-left`，等等），只需要稍作改动即可使达到目的。

### HTML 模板

``` html
{{ if .IsHome }}
{{ range $i, $p := (where .Site.RegularPages "Section" "card") }}
<section class="article-list"{{ with .Params.style }}{{ printf " style=%q" . | safeHTMLAttr }}{{ end }}>
  <table>
<tbody>
<tr>
<td class="side-title"><h1>{{ $p.Title }}</h1></td>
<td class="spacer spacer-left"></td>
<td>{{ $p.Content }}</td>
</tr>
</tbody>
</table>
</section>
{{ end }}
{{ end }}
```

值得一提的是，`<section class="article-list"{{ with .Params.style }}{{ printf " style=%q" . | safeHTMLAttr }}{{ end }}>` 将从页面的 YAML 头文件中读取额外的 CSS 定义，并将其应用到 `card` 中去。下面的 YAML 头文件将使对应页面的背景色与众不同。而其中的 `weight` 将在排列元素间的先后顺序时用到。

``` yaml
title: PROJECTS
style: 'background: #f7f9fb;'
weight: 2
```

### CSS 设置

观察一下效果，发现页面中标题的朝向仍然有问题。这是因为 CSS 定义的缘故。

``` css
.article-list .side-title { transform: rotate(90deg); }
.article-list:nth-child(even):not(.post-card) .side-title { transform: rotate(-90deg); }
```

它会将表格 `.article-list` 偶数行的标题 `.side-title` 逆时针旋转 90 度，而不是默认的顺时针旋转 90 度。因此，将第 2 行删掉即可。

## 调整 Post 的显示样式

在卡片下面，包含了其它的一些内容，这里显示的内容是由依据下面的设置筛选得到的。

``` html
{{ $pages := .Pages }}
{{ if .IsHome }}
{{ $pages = first (default 6 .Site.Params.homePosts) (sort (where .Site.RegularPages "Type" "in" .Site.Params.mainSections) "Date" "desc") }}
{{ else }}
{{ $pages = (.Paginate $pages).Pages }}
{{ end }}
```

首先，获取全部的页面并将其保存在 `$pages` 变量中。然后通过读取 `.Site.Params.homeposts` 变量和 `.Site.Params.mainSections` 变量，对按照时间降序排列的页面中选取几个。这些变量都保存在 `config.yaml` 文件中。

``` yaml
params:
  homePosts: 6
  mainSections: ["post"]
```

如果是主页的话，那么仅获取默认 6 个 Posts，并将其保存在 `$pages` 变量中；如果不是的话，则将其进行分页处理。这里仅考虑是主页的情况。

文章列表在一个表格中显示。表格没有表头元素（`<th></th>`），只有行元素（`<tr></tr>`）和列元素（`<td></td>`）。每行有 3 列。第一列是内容，第二列是分隔符，第三列是 Section Name。

``` html
{{ range $pages }}
  <section class="article-list post-card{{ if .Draft }} draft {{ end }}">
    <table>
  <tbody>
  <tr>
  <td>
  {{ with .Params.categories }}
  {{ range first 1 . }}
  <div class="categories">
<a href="{{ relURL (print "/categories/" . "/" | urlize) }}">{{ . }}</a>
  </div>
  {{ end }}
  {{ end }}
  <h1><a href="{{ .RelPermalink }}">{{ .Title }}</a></h1>
  <div>
{{ if .Date }}<span>{{ .Date.Format "2006-01-02" }}</span>{{ end }}
{{ with .Params.author }}<span>{{ . }}</span>{{ end }}
  </div>
  <div class="summary">
{{ $summary := .Description }}
{{ if $summary }}
{{ $summary = (markdownify $summary) }}
{{ else }}
{{ $summary = ((delimit (findRE "(<p.*?>(.|\n)*?</p>\\s*)+" .Content) "[&hellip;] ") | plainify | truncate (default 200 .Site.Params.summaryLength) (default " &hellip;" .Site.Params.textTruncated ) | replaceRE "&amp;" "&") }}
{{ end }}
{{ $summary | replaceRE "^([A-Za-z])" "&$1 opf;" | replaceRE "^(&[A-Za-z]) (opf;)" "$1$2" | safeHTML }}
<a href="{{ .RelPermalink }}" class="more" title={{ i18n "readMore" }}>{{ i18n "readMore" }} &rarr;</a>
  </div>
  </td>
  {{ if $.IsHome }}
  <td class="spacer spacer-right"></td>
  <td class="side-title">{{ with .Section }}<h1><a href="{{ print "/" . "/" | relURL }}">{{ . }}</a></h1>{{ end }}</td>
  {{ end }}
  </tr>
  </tbody>
</table>
  </section>
{{ end }}
```

`<section class="article-list post-card{{ if .Draft }} draft {{ end }}">` 这里根据页面设置 `draft: true/false` 来添加一个额外的 `.post-card .draft` 类，用来给草稿做特殊标记（底纹、背景，以及是否在发布时显示[^1]）。

[^1]: 默认情况下，draft 仅在本地预览时可见，而使用 `blogdown::build_site()` 时不可见。

-   给卡片添加 `category` 标签，这里仅显示了 1 个标签，并将标签连接到其固定链接。

    ``` html
    {{ with .Params.categories }}
    {{ range first 1 . }}
    <div class="categories">
      <a href="{{ relURL (print "/categories/" . "/" | urlize) }}">{{ . }}</a>
    </div>
    {{ end }}
    {{ end }}
    ```

-   添加标题、发布时间和作者。

    ``` html
    <h1><a href="{{ .RelPermalink }}">{{ .Title }}</a></h1>
    <div>
      {{ if .Date }}<span>{{ .Date.Format "2006-01-02" }}</span>{{ end }}
      {{ with .Params.author }}<span>{{ . }}</span>{{ end }}
    </div>
    ```

-   添加摘要。摘要首先从 `description` 中读取，如果没有设置的话，那么将从文章正文（`.Content`）中截取。在显示时，通过 `replaceRE` 将首字符替换为大字。最后，添加上正文的固定链接。

    ``` html
    <div class="summary">
      {{ $summary := .Description }}
      {{ if $summary }}
      {{ $summary = (markdownify $summary) }}
      {{ else }}
      {{ $summary = ((delimit (findRE "(<p.*?>(.|\n)*?</p>\\s*)+" .Content) "[&hellip;] ") | plainify | truncate (default 200 .Site.Params.summaryLength) (default " &hellip;" .Site.Params.textTruncated ) | replaceRE "&amp;" "&") }}
      {{ end }}
      {{ $summary | replaceRE "^([A-Za-z])" "&$1 opf;" | replaceRE "^(&[A-Za-z]) (opf;)" "$1$2" | safeHTML }}
    <a href="{{ .RelPermalink }}" class="more" title={{ i18n "readMore" }}>{{ i18n "readMore" }} &rarr;</a>
    </div>
    ```

-   添加 Section。显示在右侧，并链接到 Section 的目录。

    ``` html
    {{ if $.IsHome }}
      <td class="spacer spacer-right"></td>
      <td class="side-title">
        {{ with .Section }}
          <h1><a href="{{ print "/" . "/" | relURL }}">{{ . }}</a></h1>
        {{ end }}
      </td>
    {{ end }}
    ```

### HTML 模板

将这一部分的代码改成下面的样子。

``` html
{{ $pages := .Pages }}
{{ if .IsHome }}
{{ $pages = first (default 6 .Site.Params.homePosts) (sort (where .Site.RegularPages "Type" "in" .Site.Params.mainSections) "Date" "desc") }}
{{ else }}
{{ $pages = (.Paginate $pages).Pages }}
{{ end }}

{{ range $pages }}
<section class="article-list post-card{{ if .Draft }} draft{{ end }}">
<table>
  <tbody>
    <tr>
      <td>{{ if .Date }}<span>{{ .Date.Format "2006-01-02" }}</span>{{ end }}</td>
      <td>{{ with .Params.author }}<span>{{ . }}</span>{{ end }}</td>
      <td><h1><a href="{{ .RelPermalink }}">{{ .Title }}</a></h1></td>
    </tr>
  </tbody>
</table>
</section>
{{ end }}
```

### CSS 设置

接下来对相应的 CSS 代码动一下手脚。

-   将卡片显示的宽度从 50% 调整到 100%；

    ``` css
    .list main > .post-card {
      flex: 0 0 calc(50% - .5em);
    }

    /* 改为下面的样子 */

    .list main > .post-card {
      flex: 0 0 100%;
    }
    ```

-   设置时间列、作者列的宽度

    ``` css
    .post-card td:nth-child(1) {width: 15%}
    .post-card td:nth-child(2) {width: 20%}
    ```

-   去掉标题下面的细线

    ``` css
    .article-list h1 {
      margin: 5px 0px 10px;
    }
    ```

## 小结

-   先改 HTML 模板，设置内容和框架；

-   再改 CSS 设置，调整对象的显示效果。
