---
title: 使用腾讯云开发平台代码托管服务
author: gaoch
date: '2019-07-08'
slug: tencent-dev
categories:
  - git
tags:
  - git
---

腾讯云开发平台几大优势：

- 国内访问快
- 免费空间大
- 仓库私有
- 用户名好起（gaoch通过了）


对于已有的Git项目，可以通过下列途径关联。


```
# 首先在服务器控制面板创建一个同名项目
# 参考这里：https://dev.tencent.com/help/git-import-tencentcloud

# 事实上，不用这么麻烦
git remote rm origin
git remote add origin https://git.dev.tencent.com/gaoch/myproject.git
git push --set-upstream origin master
```

然后我发现了腾讯云开发平台代码托管服务的一大缺点是：**URL太长了**。
