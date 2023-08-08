---
title: 使用 devtools 速写 R 包
author: gaoch
date: '2019-09-19'
slug: using-devtools-in-writing-r-pkgs
categories:
  - R
tags: []
---

因为“包治百病”，所以每个人都会到需要写包的时候。作为一个讲原则的开发者，Hadley Wickham 的[写包指南](https://r-pkgs.org/index.html)还是要看一下的。写包，“so easy！”

----

# 使用 `devtools` 创建一个 R 包的流程

``` r
# 在指定路径创建一个包的骨架，包括文件夹结构和配置文件
create_package("~/path/to/foofactors")

# 初始化 git
use_git()

# 在 R 目录下面新建一个 fbind.R 文件
use_r("fbind")

# 导入编写好的代码（引入fbind函数），测试函数代码
load_all()

# 检测包的可用性
check()

```

`load_all()` 是测试代码的时候用起来非常方便的命令。

接下来，需要编辑 `DESCRIPTION` 文件，为包写一个简单的说明（略）。


``` r
# 应用一个开源软件协议
use_mit_license("Jane Doe")

# 生成帮助文档
document()

# 再次检查包的可用性
check()

# 安装包
install()
```

安装完成后，可以使用真实环境测试一下。


``` r
library(foofactors)

a <- factor(c("character", "hits", "your", "eyeballs"))
b <- factor(c("but", "integer", "where it", "counts"))

fbind(a, b)
```

到此为止，已经完成了一个包的创建。当然，在实际的开发环境中，代码会不断更新，也需要对包的功能进行测试，还需要写使用文档等内容，这会需要一个 Git、测试和代码托管等操作，下面介绍的命令可以帮助你完成这些任务。

## 使用 `use_testthat()`


```
# 将会生成一个 tests/testthat.R 文件，使 testthat 流程可用
use_testthat()

# 将会生成一个 tests/test-fbind.R 文件
use_test("fbind")
```

在 `tests/test-fbind.R` 文件中，写入下列测试代码。


``` r
test_that("fbind() binds factor (or character)", {
  x <- c("a", "b")
  x_fact <- factor(x)
  y <- c("c", "d")
  z <- factor(c("a", "b", "c", "d"))

  expect_identical(fbind(x, y), z)
  expect_identical(fbind(x_fact, y), z)
})
```

运行测试。


``` r
test()
```

`expect_equal()` 和 `expect_identical()` 是常用的两个测试函数。其中 `expect_equal()` 使用 `all.equal()` 函数来比较数值，有一定的敏感性（检测不出非常小的差异）；`expect_identical()` 则使用 `identical()` 来进行比较 [2]。


## 使用其它软件包中的函数


```
# 导入 forcats 包
use_package("forcats")

# 创建一个新函数 fcount
use_r("fcount")

```

接下来编写 `fcount.R` 其中的代码。重复上面的步骤进行测试和安装。

## 使用 GitHub

`use_github()` 将帮助你使用 GitHub 的一些功能。

## 使用 README

`use_readme_rmd()` 帮助你创建一个 `README.rmd` 的模板。根据模板的提示，编写基本的使用说明，加入一些示例等。

使用下面的命令生成 `README.md` 文件。


``` r
rmarkdown::render("README.Rmd") ## or use "Knit HTML" in RStudio
```

还可以使用 `use_vignette("my-vignette")` 来生成一个文档模板。

**参考资料**

1. https://r-pkgs.org/whole-game.htm
2. https://r-pkgs.org/tests.html

# 使用 `.Rbuildignore` 排除部分文件

`.Rbuildignore` 中列举了打包软件包时需要排除的文件。

# 起个好名字

有个包可以帮助你检查包的名称是否可用。不过，Google 一下也是未尝不可的（就不用安装一个用处不大的available了）。

```
library(available)

available("doofus")
```

# 代码向后兼容

如果要改变一个函数，最好先声明废弃，然后在后来的版本中才去掉它。


```
# 0.6.0
fun <- function(x, y, z) {
  .Deprecated("sum")
  x + y + z
}

fun(1, 2, 3)
#> Warning: 'fun' is deprecated.
#> Use 'sum' instead.
#> See help("Deprecated")
#> [1] 6
```

如上所示，在调用 `fun(1,2,3)` 时，会有相应的提示。

参见：https://r-pkgs.org/release.html

# 编写函数的文档

函数文档一般使用 roxygen comments 自动生成。


```
#' Add together two numbers.
#' 
#' @param x A number.
#' @param y A number.
#' @return The sum of \code{x} and \code{y}.
#' @examples
#' add(1, 1)
#' add(10, 1)
add <- function(x, y) {
  x + y
}

```

`@` 在 roxygen 中具有特殊含义，如果需要 “@”，则必须写成`@@`才可以。类似地，`%` 写成 `\%`，`\` 写成 `\\`。

除了最常用的几个以外，还有下列一些经常会用到的 Tag。

- `@section Warning:` 开始一个小标题。
- `@seealso \url{http://a.cn}, \code{\link{func}}` 添加一些链接。
- `@family aggregate functions` 函数家族
- `@alias alias1 alias2` alias
- `@keywords key1 key2`
- `@name foo` 取个名字
- `@inheritParams foo` 继承 `foo` 函数的参数说明
- `@rdname foo` 多个函数复用一个 Rd 文档， `foo` 可以是函数名或者 `@name` 指定的位置。

## 文档的格式化

这部分内容是学习 https://r-pkgs.org/man.html 的笔记。

### 设定字符格式

* `\emph{italics}`: _italics_.
* `\strong{bold}`: __bold__.
* `\code{r_function_call(with = "arguments")}`: 
  `r_function_call(with = "arguments")` (format inline code)
* `\preformatted{}`: format text as-is, can be used for multi-line code

### 超链接

To other documentation:

* `\code{\link{function}}`: function in this package.
* `\code{\link[MASS]{abbey}}`: function in another package.
* `\link[=dest]{name}`: link to dest, but show name.
* `\code{\link[MASS:abbey]{name}}`: link to function in another package, but show name.
* `\linkS4class{abc}`: link to an S4 class.

To the web:

* `\url{http://rstudio.com}`: a url.
* `\href{http://rstudio.com}{Rstudio}`:, a url with custom link text.
* `\email{hadley@@rstudio.com}` (note the doubled `@`): an email address.

### 有序列表和无序列表

* Ordered (numbered) lists:

    ```{r}
    #' \enumerate{
    #'   \item First item
    #'   \item Second item
    #' }
    ```

* Unordered (bulleted) lists:

    ```{r}
    #' \itemize{
    #'   \item First item
    #'   \item Second item
    #' }
    ```

* Definition (named) lists:

    ```{r}
    #' \describe{
    #'   \item{One}{First item}
    #'   \item{Two}{Second item}
    #' }
    ```

### 数学公式

You can use standard LaTeX math (with no extensions). Choose between either inline or block display:

* `\eqn{a + b}`: inline equation.
* `\deqn{a + b}`: display (block) equation.
 
# 配置 `usethis` options

将下面的内容加入到 `.Rprofile` 文件中,使用 `usethis` 时更加便捷。

```
# usethis options
options(
  usethis.full_name = "Chun-Hui Gao",
  usethis.description = list(
    `Authors@R` = 'person("Chun-Hui", "Gao", email = "gaospecial@gmail.com", 
                    role = c("aut", "cre"), comment = c(ORCID = "0000-0002-1445-7939"))',
    License = "GPL3 + file LICENSE",
    Version = "0.0.1"
  ),
  usethis.protocol  = "ssh"
)
```
