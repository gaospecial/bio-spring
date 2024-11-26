---
title: 在 RStudio 中使用 Julia
author: gaoch
date: '2023-08-23'
slug: using-julia-in-rstudio
categories:
  - 其它
  - 信息技术
tags:
  - 学习笔记
  - Julia
  - R Markdown
  - RStudio
  - 科学计算
---

因为要运行 [cNODE](https://github.com/michel-mata/cNODE.jl) 程序，所以接触了一下 Julia 语言。

## Julia

> 一群拥有各种语言丰富编程经验的Matlab高级用户，对现有的科学计算编程工具感到不满------这些软件对自己专长的领域表现得非常棒，但在其它领域却非常糟糕。他们想要的是一个开源的软件，它要像C语言一般快速而有拥有如同Ruby的动态性；要具有Lisp般真正的同像性而又有Matlab般熟悉的数学记号；要像Python般通用、像R般在统计分析上得心应手、像Perl般自然地处理字符串、像Matlab般具有强大的线性代数运算能力、像shell般胶水语言的能力，易于学习而又不让真正的黑客感到无聊；还有，它应该是交互式的，同时又是编译型的......


- 快！


![](https://julialang.org/assets/images/benchmarks.svg)

由上图可以看出，Julia 的运行速度是除 C 语言以外几乎最快的。

Julia 一开始就是为[高性能](https://cn.julialang.org/benchmarks/)而设计的。 Julia 程序通过 LLVM 编译成高效的 [多平台](https://cn.julialang.org/downloads/#support_tiers) 机器码。

- 动态

Julia 是[动态类型的](https://docs.juliacn.com/latest/manual/types/)，使用起来像脚本语言，同时有很好的[交互](https://docs.juliacn.com/latest/stdlib/REPL/)体验。

- 可选类型

Julia 有丰富的[数据类型描述语言](https://docs.juliacn.com/latest/manual/types/)，标注类型声明可以使程序更清晰可靠。

- 通用

Julia 使用[多分派](https://docs.juliacn.com/latest/manual/methods/)范式，很容易表达面向对象和[函数式](https://docs.juliacn.com/latest/manual/metaprogramming/)编程模式。 同时提供了[异步 I/O](https://docs.juliacn.com/latest/manual/networking-and-streams/)、[调试](https://github.com/JuliaDebug/Debugger.jl)、[日志](https://docs.juliacn.com/latest/stdlib/Logging/)、[性能分析](https://docs.juliacn.com/latest/manual/profile/)、[包管理](https://docs.juliacn.com/latest/stdlib/Pkg/index.html)等工具。

- 易用

Julia 拥有高阶的语法，这让具有不同编程语言背景和经验的程序员都能使用它。[查看 Julia 的微基准](https://github.com/JuliaLang/Microbenchmarks/blob/master/perf.jl)来感受这门语言吧。


## 示例

-   Julia与MATLAB语言较为类似。

``` julia
function mandelbrot(a)
    z = 0
    for i=1:50
        z = z^2 + a
    end
    return z
end

for y=1.0:-0.05:-1.0
    for x=-2.0:0.0315:0.5
        abs(mandelbrot(complex(x, y))) < 2 ? print("*") : print(" ")
    end
    println()
end

# Taken from: https://rosettacode.org/wiki/Mandelbrot_set#Julia
```

## 包管理

[为什么 Julia 装包这么困难](https://discourse.juliacn.com/t/topic/3154)

-   使用Pkg管理包。打开命令提示符，按 \] 即可进入包管理器。

``` julia
julia> ]
(v1.1) pkg> status
(v1.1) pkg> add NewPackage
<press Backspace>
julia>
```

-   更改软件源

``` julia
using PkgServerClient # 在 using 时会自动切换到最近的服务器
PkgServerClient.registry_response_time() # 查看所有服务器的延迟
PkgServerClient.set_mirror("NJU") # 使用南京大学的服务器

using Pkg
Pkg.Registry.rm("General")  # 重置 General 注册表，相当于在提示符下输入 pkg> registry rm General
Pkg.Registry.add("General")  # 重置 General 注册表，这样才会直接从镜像站拉取数据
Pkg.update()
```

## 语法参考

-   [Introduction-to-Julia](https://github.com/JuliaAcademy/Introduction-to-Julia)
-   [同步视频课程](https://juliaacademy.com/courses/375479/)
-   [Julia 手册中文版](https://docs.juliacn.com/latest/manual/)

### suppress warnings

-   启动 Julia 时，加入 `--depwarn=no` 参数；

-   使用 `Suppressor`

    ``` julia
    using Suppressor

    @suppress_err begin
    include("script.jl")
    end
    ```
