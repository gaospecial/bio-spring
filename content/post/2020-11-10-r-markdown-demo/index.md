---
title: "R Markdown Demo"
author: "Yihui Xie"
date: '2020-11-10'
slug: r-markdown-demo
bibliography: packages.bib
---

## Floats

### Full-width figures

Use a fenced `Div` with the class `fullwidth`, e.g.,

```` md
::: {.fullwidth}
Any Markdown content or code blocks here.

```{r, echo=FALSE, fig.dim=c(14, 4)}
plot(sunspots)
```
:::
````

<div class="fullwidth">

<div class="figure">

<img src="{{< blogdown/postref >}}index_files/figure-html/sunspots-1.svg" alt="Monthly mean relative sunspot numbers from 1749 to 1983. Collected at Swiss Federal Observatory, Zurich until 1960, then Tokyo Astronomical Observatory." width="1344" />
<p class="caption">
<span id="fig:sunspots"></span>Figure 1: Monthly mean relative sunspot numbers from 1749 to 1983. Collected at Swiss Federal Observatory, Zurich until 1960, then Tokyo Astronomical Observatory.
</p>

</div>

</div>

If you add the class `fullscroll` to the `Div`, the figure will be scrollable,
e.g.,

``` md
::: {.fullwidth .fullscroll}

:::
```

<div class="fullwidth fullscroll">

<div class="figure">

<img src="{{< blogdown/postref >}}index_files/figure-html/scroll-1.svg" alt="This is a super wide figure that you need to scroll to view it fully." width="2880" />
<p class="caption">
<span id="fig:scroll"></span>Figure 2: This is a super wide figure that you need to scroll to view it fully.
</p>

</div>

</div>

### Embedded figures

You can embed any elements (typically figures) that span into the page margin.
Use a fenced `Div` with the class `embed-left` or `embed-right`, e.g.,

<div class="embed-right">

<div class="figure">

<img src="{{< blogdown/postref >}}index_files/figure-html/embed-plot-1.svg" alt="This is a figure embedded on the right." width="480" />
<p class="caption">
<span id="fig:embed-plot"></span>Figure 3: This is a figure embedded on the right.
</p>

</div>

</div>

```` md
::: {.embed-right}

Here is a special figure.

```{r}
plot(cars)
```
:::
````

If you want to embed a table, that will be okay, too. Really, you can embed
anything.

```` md
::: {.embed-left}
```{r, echo=FALSE}
knitr::kable(head(mtcars), caption = 'An example dataset.')
```
:::
````

<div class="embed-left">

|                   |  mpg | cyl | disp |  hp | drat |    wt |  qsec |  vs |  am | gear | carb |
|:------------------|-----:|----:|-----:|----:|-----:|------:|------:|----:|----:|-----:|-----:|
| Mazda RX4         | 21.0 |   6 |  160 | 110 | 3.90 | 2.620 | 16.46 |   0 |   1 |    4 |    4 |
| Mazda RX4 Wag     | 21.0 |   6 |  160 | 110 | 3.90 | 2.875 | 17.02 |   0 |   1 |    4 |    4 |
| Datsun 710        | 22.8 |   4 |  108 |  93 | 3.85 | 2.320 | 18.61 |   1 |   1 |    4 |    1 |
| Hornet 4 Drive    | 21.4 |   6 |  258 | 110 | 3.08 | 3.215 | 19.44 |   1 |   0 |    3 |    1 |
| Hornet Sportabout | 18.7 |   8 |  360 | 175 | 3.15 | 3.440 | 17.02 |   0 |   0 |    3 |    2 |
| Valiant           | 18.1 |   6 |  225 | 105 | 2.76 | 3.460 | 20.22 |   1 |   0 |    3 |    1 |

<span id="tab:unnamed-chunk-1"></span>Table 1: An example dataset.

</div>

Now I have generate some text to fill the space on the right:
hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer hold my beer.

## Text elements

### Table of contents

TOC should be automatically generated unless it is disabled via
`features: [-toc]` in YAML. To define the TOC title, use the `toc-title` field
in YAML.

### Section numbers

Sections should be automatically numbered unless Pandoc has already numbered
them,[^1] or the feature is disabled via `features: [-number_sections]`.

### Footnotes

Footnotes should be automatically moved to the right margin,[^2] unless the
feature is disabled via `features: [-sidenotes]`.

### Sidenotes

Sidenotes can be generated via a div with classes `side` and `side-left` or
`side-right`. You can use either the HTML syntax `<div class="side side-left">`
or Pandoc’s fenced `Div`, e.g.,

<div class="side side-right">

This is a **sidenote** on the right side when the window is wider than 1280px.

</div>

``` md
::: {.side .side-right}
This is a **sidenote** on the right.
:::
```

### Citations

Use `bibliography` or `references` in YAML to include the bibliography database,
and use `@` to cite items, e.g., `@R-base` generates R Core Team (2023).

``` r
knitr::write_bib('base', 'packages.bib')
```

As you can see above, we generated a `.bib` database with `knitr::write_bib()`.

Citation entries are displayed in the right margin by default like footnotes. To
disable this behavior, set `features: [-sidenotes]` in YAML.

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-R-base" class="csl-entry">

R Core Team. 2023. *R: A Language and Environment for Statistical Computing*. Vienna, Austria: R Foundation for Statistical Computing. <https://www.R-project.org/>.

</div>

</div>

[^1]: Apply the option `number_sections: true` to the output format
    `blogdown::html_page` in YAML.

[^2]: For example, this is a footnote.
