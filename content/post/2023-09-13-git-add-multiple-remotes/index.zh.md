---
title: Git 添加多个 remote
author: gaoch
date: '2023-09-13'
slug: git-add-multiple-remotes
categories:
  - 信息技术
tags:
  - git
  - GitHub
---

在 Git 中设置，从一个源 pull，向多个源 push，实现修改后一键 push 到多个服务器（如 GitHub + Gitee）。

将 GitHub 作为主源，本地修改同时 push 到 GitHub 和 Gitee。

```bash
git remote add origin git@github.com:user/repository.git
git remote set-url --add --push origin git@github.com:user/repository.git
git remote set-url --add --push origin git@gitee.com:user/repository.git
```

查看配置结果。

```bash
git remote show origin
```

删掉无用的源

```bash
git remote set-url --delete --push origin git@gitee.com:user/repository.git
```

实在不行，还可以直接修改 `.git/config` 文件。
