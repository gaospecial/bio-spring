---
title: Makefile 怎么写
author: Package Build
date: '2023-12-24'
slug: makefile-howto
categories:
  - 学习笔记
tags:
  - Makefile
  - shell
  - 操作系统 LINUX
---

当一个目标需要执行多个命令时，可以在 Makefile 中为该目标提供多行命令。每一行命令都必须以制表符开始。以下是一个简单的示例：

```makefile
all: clean build run

clean:
    rm -f my_program

build:
    gcc -Wall -o my_program main.c util.c

run:
    ./my_program
```

在这个示例中：

- `all` 是默认目标，它依赖于 `clean`、`build` 和 `run`。
- `clean` 目标删除 `my_program` 可执行文件。
- `build` 目标编译源文件生成可执行文件。
- `run` 目标运行可执行文件。

你可以使用以下命令来执行默认目标 `all`：

```bash
make
```

或者直接指定目标：

```bash
make build
```

当你运行 `make` 命令时，它将按照依赖关系执行目标，确保每个目标都是最新的。在上面的示例中，`all` 依赖于 `clean`、`build` 和 `run`，因此这些目标将按照指定的顺序执行。

**注意**：在 Makefile 中，确保使用制表符而不是空格，因为 Make 工具对此有特殊的要求。

如果你想在 `clean` 目标中添加多个 Shell 命令，可以将它们放在同一行，并使用分号 `;` 将它们分隔。下面是一个示例：

```makefile
clean:
    rm -f my_program; \
    rm -f *.o; \
    echo "Cleanup complete"
```

在这个例子中，`clean` 目标包含三个 Shell 命令。每个命令都以分号 `;` 结尾，表示命令的结束。使用 `\` 来表示命令在多行上续行。

如果你希望多个命令按照顺序执行，但是希望其中一个失败时不会中断整个 Makefile 的执行，可以使用 `;` 将它们分隔开。如果你希望后续命令只在前面的命令成功时执行，可以使用 `&&` 连接命令，例如：

```makefile
clean:
    rm -f my_program && \
    rm -f *.o && \
    echo "Cleanup complete"
```

这样，如果其中一个 `rm` 命令失败，后续的命令将不会执行。

**常见错误**

`makefile:8: *** missing separator.  Stop.`

这个错误通常表示在 Makefile 中使用了不正确的缩进。在 Makefile 中，必须使用 Tab（制表符）来缩进命令，而不是空格。
