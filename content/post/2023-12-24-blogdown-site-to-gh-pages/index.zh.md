---
title: '部署网站到 gh-pages'
author: gaoch
date: '2023-12-24'
slug: blogdown-site-to-gh-pages
categories:
  - 学习笔记
tags:
  - blogdown
  - github
---

## relURL 的用法

参见：<https://gohugo.io/functions/urls/relurl/#input-begins-with-a-slash>

在将 `blogdown` 创建的静态网站部署到 GitHub Pages 时，确保在 `config.toml` 或 `config.yaml` 文件中设置了正确的 `baseURL`。这是指向你的 GitHub Pages 网站的基本 URL。

在配置文件中添加如下行：

```yaml
baseURL = "https://<username>.github.io/<repository-name>/"
```

确保将 `<username>` 替换为你的 GitHub 用户名，`<repository-name>` 替换为你的仓库名称。

另外，请确保 `publishDir`（默认是 `public` 文件夹）的内容正确地推送到 `gh-pages` 分支。你可以使用如下命令将内容推送到 `gh-pages`：

```bash
git subtree push --prefix public origin gh-pages
```

这个命令会将 `public` 文件夹的内容推送到 `gh-pages` 分支。确保在推送之前已经生成了静态网站，可以通过以下命令：

```bash
blogdown::build_site()
```

