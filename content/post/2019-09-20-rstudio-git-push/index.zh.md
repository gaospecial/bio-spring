---
title: RStudio 中使用 Git push 时要求输入用户名和密码
author: gaoch
date: '2019-09-20'
slug: rstudio-git-push
categories:
  - git
tags:
  - RStudio
  - git
---

昨天遇到一个怪事，同一个 Git 目录，使用 Git Shell 时，可以直接 Push；而在 RStudio 中 push 时，则会请求输入账户名和密码。

在 Google 中以 “Rstudio git push need username” 搜索，在第三条结果的第三个高票回答中找到了解决方法。

```

git remote show origin

#  Push  URL: https://github.com/username/reponame.git

git remote set-url origin git+ssh://git@github.com/username/reponame.git
```

想起来，似乎是因为设置 `usethis` "options" 时候选择了 “usethis.protocol = "ssh" ” 所致。

```
# usethis options
options(
  usethis.full_name = "Chun-Hui Gao",
  usethis.description = list(
    `Authors@R` = 'person("Chun-Hui", "Gao", email = "gaospecial@gmail.com", role = c("aut", "cre"), comment = c(ORCID = "0000-0002-1445-7939"))',
    License = "GPL3 + file LICENSE",
    Version = "0.0.1"
  ),
  usethis.protocol  = "ssh"
)
```
