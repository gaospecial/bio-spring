---
title: Setup blogdown site
author: gaoch
date: '2018-10-16'
slug: setup-blogdown-site
categories:
  - R
tags:
  - blogdown
---

设置 blogdown 主要参考了 [这里](https://cosx.org/2018/01/build-blog-with-blogdown-hugo-netlify-github/)，设置 git 认证参考了 [这里](https://www.r-bloggers.com/rstudio-pushing-to-github-with-ssh-authentication/).

软件的安装不提，简单的步骤如下：

1. 在 GitHub 上创建一个 Repository。
2. 在 RStudio 中使用 Git 创建一个 Project，与 GitHub 关联上。
3. 在 RStudio 中新建一个 Project （是的，要创建两次），属性设为 Website from blogdown，目录设置为 Git 项目的本地文件夹。
4. **网站设置完毕**。写完新文章之后，可以 Commit，可以 Push 到 GitHub。
5. 托管到 netlify，按照提示一步步进行就可以。
6. 但是要设置一下 `HUGO_VERSION = 0.48`（ > 0.20 即可，默认的 0.17 是不能编译成功的）。
7. 设置 Git 密钥，添加 public key 到 Github 上面。
8. 设置 Git 参数：`git config remote.origin.url git@github.com:your_username/your_project.git`。