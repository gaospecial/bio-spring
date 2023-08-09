---
title: 主题介绍 
author: Yihui Xie
categories: [Hugo, Theme]
tags: [menu, TOC, sidenote, appendix, citation, numbered section]
menu:
  header:
    name: About
    weight: 4
appendix:
  acknowledgments: |
    We thank the authors of the [Wowchemy](https://wowchemy.com) theme, [tufte.css](https://github.com/edwardtufte/tufte.css), and the
    [Distill](https://distill.pub) framework for inspirations. Many users in the R community have asked
    for a Distill-like Hugo theme directly or indirectly, including but not limited to
    [Emi Tanaka](https://emitanaka.org/r/posts/2018-12-12-scientific-and-technical-blogging-radix-vs-blogdown/),
    [Duncan Garmonsway](https://twitter.com/nacnudus/status/1098910973266743296),
    [Frank Harrell](https://stackoverflow.com/q/54388451/559676),
    [Josiah Parry](https://twitter.com/JosiahParry/status/1231280231543164928), and
    [Alison Hill](https://twitter.com/apreshill/status/1070550028274429952). We are not sure if this Hugo
    Prose theme would make it easier or even harder to answer the frequently asked question "blogdown or
    distill?"
    
    The images on this page are from Wikipedia entries [Stoicism](https://en.wikipedia.org/wiki/Stoicism)
    and [清明上河图](https://zh.wikipedia.org/wiki/%E6%B8%85%E6%98%8E%E4%B8%8A%E6%B2%B3%E5%9C%96). The
    CSS style for draft posts was borrowed from Fabian Tamp's
    [paperesque](https://github.com/capnfabs/paperesque/) theme. [Wladimir Palant's tutorial](https://palant.info/2020/06/04/the-easier-way-to-use-lunr-search-with-hugo/)
    helped a lot with our implementation of the client-side search.
---

**Hugo Prose** 是一个非常轻量级的主题，拥有 [Wowchemy](https://wowchemy.com)、[Distill](https://distill.pub) 和 [tufte.css](https://github.com/edwardtufte/tufte.css) 的一些特性。这个主题仅使用了文本元素（不含任何图片、图标和表情）。这个主题默认集成了两个 JavaScript 库，分别是 [MathJax](https://www.mathjax.org/) 和 [highlight.js](https://highlightjs.org/)，用于显示数学公式和代码高亮。除此之外，还手打了几行 JavaScript 代码。该主题使用了 300 行自定义的 CSS，没有使用 CSS 库。

<div class="quote-right">

> 贫穷的不是拥有太少的人，而是渴望拥有更多的人。

>
> --- _《道德书简》_

</div>

本页将介绍该主题的各种功能，供您摆弄。

## 网站设置

以下是您可以为基于此主题的网站配置的选项。

### 菜单

每个页面的页眉和页脚都有一个菜单。页眉菜单在 `config.yaml` 中 `menu` 下面的 `header` 选项中定义；页脚菜单在 `menu` 下面的 `footer` 选项中定义。

``` yaml
menu:
  header:
    - name: Home
      url: "/"
      weight: 1
    - name: About
      url: "/about/"
      weight: 2
  footer:
    - name: Contact
      url: "/404.html"
      weight: 1
    - name: Categories
      url: "/categories/"
      weight: 2
      pre: "optional"
```

菜单项的 `url` 既可以相对 URL，也可以是外部链接（例如，`url: "https://github.com/yihui"`）。菜单项的顺序由权重值决定。如果菜单项有 `pre` 值，它将被用作菜单项的类。特殊值 `optional` 表示该菜单项将在小屏幕上隐藏[^1]。

[^1]: 例如，`pre: "optional"` 将生成菜单项 `<li class="optional">`。这可能是一个不重要的项目，在屏幕显示不完全时将被隐藏。

菜单中的链接除了可以在 `menu` 下的 `header` 中定义，还可以在每一个页面的 yaml 头中定义。

``` yaml
---
title: About Hugo Prose
menu:
  header:
    name: About
    weight: 2
```

如果没有 `name` 参数，则菜单将以 `title` 显示。这个特性可以将任一文档加入菜单中去。在提供了便捷性的同时，对于菜单的维护也造成了一些困扰。

可通过 `config.yaml` 中的参数 `stickyMenu` 使标题菜单悬停在页面上方：

``` yaml
params:
  stickyMenu: true
```

### 主页

主页的主体部分包括简介（introduction）、一系列信息卡（info cards），然后是一些最新的帖子（posts）和页面（pages）。

-   简介来源于 `content/_index.md`。Markdown 内容可以包含任意元素。

-   信息卡来源于 `content/card/` 目录。每个 Markdown 文件将被显示为一个独立的卡片。标题显示在左侧或者右侧[^2]。 在 yaml 区块使用 `style` 可以改变卡片的样式。

[^2]: 标题要短，否则一行显示不完全。

-   `homePosts` 设置主页显示帖子的数量（默认是 6）。

``` yaml
params:
  homePosts: 10
```

-   `mainSections` 设置主页显示页面的范围（例如 post、news 等）

``` yaml
params:
  mainSections: ["post", "news"]
```

### 页脚

在 `config.yaml` 的 `footer` 参数中添加版权声明。

``` yaml
params:
  footer: "&copy; Frida Gomam 2015 -- 2020"
```

### 评论

使用 Disqus 或 Utterances 实现。

### 搜索

This theme supports searching out of the box based on [Fuse.js](https://fusejs.io). A few critical configurations:

-   The site needs to generate a JSON index. This is done via a layout file `index.json.json` in `layouts/_default/`, and the config in `config.yaml`:

    ``` yaml
    outputs:
      home: [html, rss, json]
    ```

-   A menu item with the ID `menu-search` configured in `config.yaml`, e.g.,

    ``` yaml
    menu:
      header:
        - name: Search
          url: "#"
          identifier: menu-search
    ```

-   The version of Fuse can be configured via the parameter `fuseVersion` in `config.yaml`, e.g.,

    ``` yaml
    params:
      fuseVersion: 6.4.3
    ```

    If no `fuseVersion` is specified, the latest version of Fuse.js will be used. You may also download a copy of Fuse.js to the `static/` folder of your site and use this copy instead of loading it from CDN. To do that, you may download Fuse.js to, say, `static/js/fuse.js` and modify the partial template `layouts/partials/foot_custom.html`. Replace

    ``` html
    {{ with .Site.Params.fuseVersion }}
    <script src="https://cdn.jsdelivr.net/npm/fuse.js@{{ . }}"></script>
    {{ end }}
    ```

    with

    ``` html
    <script src="{{ relURL "/js/fuse.js" }}"></script>
    ```

    That way, you can also use search when viewing the site offline, because Fuse.js is no longer loaded from CDN.

## 文章

### 多个作者

如果有多个作者，使用 `author: [one, two]`。

作者的简介需要保存到 `data/authors.yaml`。

### 目录

目录使用标题自动生成。

### 编号

标题中的编号也会自动生成。

### 脚注、引文和侧记

脚注和引文默认显示在页面右侧[^citation]。如果想显示在左侧，可以使用 `side` 和 `side-left`/`side-right` 类。

[^citation]: 引文需要使用 [the R Markdown format](https://bookdown.org/yihui/blogdown/output-format.html) 格式才能支持。Markdown 不支持插入引文。

<div class="side side-left">

This is a sidenote on the left side. You can include anything in the note. For example, here is a bullet list:

- Get up
- Do the work
- Go to bed

</div>

``` html
<div class="side side-left">

Content to be displayed as a sidenote.

</div>
```

### 附录

包括下列内容：

-   Author's bio

-   Custom fields

-   License

-   Suggest changes

### 标记草稿

Mark an article as draft by adding `draft: true` to the YAML metadata. Draft articles are styled with a background of diagonal lines and a watermark "Draft." For listing pages, draft articles are also indicated by the background.

## 悬浮

### Full-width elements

Apply the class `fullwidth`, e.g.,

``` html
<div class="fullwidth">

Content to be displayed with its maximum width.

</div>
```

<div class="fullwidth">

{{< figure src="https://upload.wikimedia.org/wikipedia/en/timeline/c8fff6bec6e98dfe6399084a540293e3.png" alt="History of stoics" caption="Figure 3.1: Beginning around 301 BC, Zeno taught philosophy at the Stoa Poikile (\"Painted Porch\"), from which his philosophy got its name. Unlike the other schools of philosophy, such as the Epicureans, Zeno chose to teach his philosophy in a public space, which was a colonnade overlooking the central gathering place of Athens, the Agora." >}}

</div>

If you want the full-width element to be scrollable, you can apply an additional class `fullscroll`, e.g.,

``` html
<div class="fullwidth fullscroll">

Super wide content to be scrolled horizontally.

</div>
```

<div class="fullwidth fullscroll">

{{< figure src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Along_the_River_During_the_Qingming_Festival_%28Qing_Court_Version%29.jpg/10000px-Along_the_River_During_the_Qingming_Festival_%28Qing_Court_Version%29.jpg" alt="Along the River During the Qingming Festival" caption="Figure 3.2: This painting is known as the \"Qing Court Version\" of _Along the River During the Qingming Festival_. Here, the figural scenes are numerous and detailed, happening around noteworthy landmarks and places such as the serene rustic countryside, the Rainbow Bridge (虹橋) and its crowded markets, the lively surroundings and throughways at the city walls and gates, the busy streets and various packed shops, the secluded literati gardens, the Songzhu Hall (松竹軒) as well as the beautiful site of the Jinming Lake (金明池)." >}}

</div>

### Embedded elements

Use the `embed-left` or `embed-right` class to embed a content block to be floated to the left or right, and the block will exceed the article margin by 200px, e.g.,

``` html
<div class="embed-right">

Content to be embedded onto the margin.

</div>
```

<div class="embed-right">
<iframe src="https://player.vimeo.com/video/469252441" width="640" height="400" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>
</div>

One application is to embed videos in an article, when the video needs a narrative. For example, you can embed a video on the right side, and provide a narrative in the body of the article, which will be on the left side of the video.

By default, the `max-width` of the embedded element is 600px (the actual width could be smaller), out of which 200px will be in the margin, meaning that there will be at least 400px left for the narrative in the article body.

When the screen width is smaller than 1200px, the embedded elements will be floated back into the article as normal block-level elements.

### 引用

Use the `quote-left` or `quote-right` class to make content float to the left or right.

``` html
<div class="quote-left">

A quote to be floated to the left.

</div>
```

The quotes do not have to be literally quotes. These environments can contain any content, although quotes may be the most common application.

<div class="quote-left">

> Here is a quote that I've never said.

</div>

内容的默认宽度是容器的 45%。当屏幕宽度小于 800px 时，引用将停止浮动，变成正常的块级元素。

## 列出页面

### Open face characters

The first alphabetical character in each summary block is converted to an [open face character](https://www.w3.org/TR/xml-entity-names/double-struck.html) such as:

<div style="font-size: 3em; line-height: 1em;">

> &Aopf; &Bopf; &Copf; &Dopf; &Eopf; &Fopf; &Gopf; &Hopf; &Iopf; &Jopf; &Kopf; &Lopf; &Mopf; &Nopf; &Oopf; &Popf; &Qopf; &Ropf; &Sopf; &Topf; &Uopf; &Vopf; &Wopf; &Xopf; &Yopf; &Zopf; &aopf; &bopf; &copf; &dopf; &eopf; &fopf; &gopf; &hopf; &iopf; &jopf; &kopf; &lopf; &mopf; &nopf; &oopf; &popf; &qopf; &ropf; &sopf; &topf; &uopf; &vopf; &wopf; &xopf; &yopf; &zopf;

</div>

### Navigation links

（导航链接无内容）

## 交互设计

### 屏幕大小

|                   | Attribute \\ width | 650 - 800px | 800 - 1280px  | \> 1280px                  |
|---------------|---------------|---------------|---------------|---------------|
| Menu              | optional items     | hidden      | shown         | \<=                        |
| Table of contents | position           | =\>         | body / static | left margin / sticky       |
| Floats            | position           | =\>         | body / static | beside or overlapping body |
| Sidenotes         | position           | =\>         | body / static | side                       |
| Home posts        | layout             | one column  | two columns   | \<=                        |

### 夜间模式

This theme uses the [`prefer-color-scheme`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-color-scheme) CSS media feature to respond to the dark color theme of the system. If you change your system to the dark mode, the web pages will automatically switch to the dark mode.

## Custom layouts

（自定义页面布局）

## TODO

- section anchors
- 多语言支持
