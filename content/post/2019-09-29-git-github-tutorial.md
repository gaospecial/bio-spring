---
title: Git 和 GitHub 使用指北
author: gaoch
date: '2019-09-29'
slug: git-github-tutorial
categories:
  - git
tags:
  - github
---

今天[小丫画图](https://mp.weixin.qq.com/s?__biz=Mzg3NTA1MTM0NQ==&mid=100000025&idx=1&sn=f060e32833de25870a2a29a47870b643&chksm=4ec6212779b1a8312d1cb4f27823477e3168473ae4058cb89f1e3a6e96793f002e655b6a7407&scene=18&key=5b7091b0813876942fc85075a8cc8f984e6d4d87ecd805316b742ba8b7794eb227a20a153ace81fd88748619448f3068bd5e2e38cc501ad515cb9e6b4bfe1be54018f8e337780e22607fdb65e336bb4d&ascene=1&uin=NDI5ODQ5OTc1&devicetype=Windows+10&version=62060833&lang=zh_CN&pass_ticket=ETbgcY5wOJmK6csItr5E373xuGaeAaR3QUgLT8wGyYhEjdGAp%2FMxQxWTejbUuRqX)群里在讨论 GitHub 的使用。大家都说GitHub的使用挺简单的，我觉得也是。但是，要找一个比较系统的介绍的话，我还真没找到。所以，说说自己的使用经历吧。**这些都是干货。**


我对 GitHub 的使用时间不长，但是觉得真是个好东西。总的来说，特别适合于存放**文本文件**，例如代码，markdown写成的文档，rmarkdown写成的书等。

GitHub其实是支持Git版本控制软件的公共仓库，[类似的网站](#github-alternative)其实不止一个，但是GitHub是最流行的一个。

所以，要想使用GitHub，你必须做的只有两件事：一、安装一个Git客户端[点击下载](https://git-scm.com/downloads)。二、在GitHub注册一个账号[点击注册](https://github.com)。这两步操作按住不提。

# 使用 Git

在Windows下面，安装完Git客户端之后，鼠标右键菜单中会多出来两个命令：“Git GUI here”和“Git Bash here”。前者打开一个图形界面，后者打开一个终端。使用这两个传送门便可以进入Git的世界。

如果当前的目录是一个Git目录，则自动会被Git识别出来。否则，你可以选择“新建一个”或者“克隆”一个。


## Git 常用操作

Git常用的命令有下面几个：


- `git init sample`

在当前目录新建一个“sample”目录，在目录中启用Git版本控制系统。

- `git clone https://github.com/GuangchuangYu/course_bioinfo_training.git`

从GitHub克隆一个软件源到当前目录。这将在当前目录新建一个“course_bioinfo_training”文件夹，其中包含所有文件和版本历史。

- `git status`

显示当前Git仓库的状态。如果有修改，新建，删除等操作，将会自动列举出来。

- `git add newfile.R`

newfile.R 是一个新建的文件，其中我写了一些代码。要使用Git纪录版本历史，必须将其添加进来。

- `git commit` 或者 `git commit -a`

这个命令将生成一次操作，系统会打开默认的文本编辑器，让你写一下操作的主要内容。


# GitHub 的使用

GitHub 事实上提供了一个远程 Git 仓库。这个远程仓库与本地仓库是关联在一起的，但有相互独立。在上面，我们已经使用过了 `git pull` 命令，这个命令就是从远程向本地输送。与之对应，`git push` 是本地向远程服务器传输，将本地的修改记录在服务器中。

在 push 的过程中，需要验证身份，因此，我们需要配置认证信息。

## GitHub 配置 SSH 密钥 

SSH 密钥是成对的，包括公钥和私钥，公钥登记到 GitHub 网站，私钥存储在本地计算机（私有）。

密钥在本地生成。点击鼠标右键，选择“Git Bash here”，输入下列命令将生成一对SSH密钥。
默认情况下，私钥保存在 “`~/.ssh/id_rsa`” 文件中，公钥保存在 “`~/.ssh/id_rsa.pub`"文件中
（没错，在Windows下的Git bash下面也可以使用~代表家目录）。


```
ssh-keygen
cat ./.ssh/id_rsa.pub
```

复制这个公钥的全部内容，进入GitHub-Setting-SSH and GPG keys，选择“New SSH key”，将公钥粘贴进去，点击“Add SSH key”，即可完成公钥添加。

这样，以后就调用 “Git bash shell” 时，便会自动提供私钥认证，不需要输入用户名和密码了。

## 在 GitHub 上创建一个 repository

点击GitHub右上角的“+”，选择“Create a new repository”，按照提示操作即可。也就是在今年，GitHub上针对于免费用户才刚刚开放了“Private”的选项，如果有保密代码（暂时）不公开的，可以选择该选项。

这步操作其实相当于在 GitHub 服务器上新建了一个目录。目录名称，也就是 Repository name。目录的路径就是 `username/repository_name`。对应的网址（绝对路径）便是 `https://github.com/username/repository_name`。对应的 Git 地址是 `git://git@github.com/username/repository_name.git`。对应的 SSH 地址是`ssh://git@github.com/username/repository_name.git`。


## 创建一个本地仓库

以我的 GitHub 上面创建的 “myfirstrepo” 为例，可以有两种方法：

- 克隆一个

    
```
git clone  https://github.com/gaospecial/myfirstrepo.git
```

克隆自己的 repository，由于前面已经配置好了 SSH 认证，
所以可以直接 Push。

- 新建并配置一个


```
# 鼠标右键选择 "Git bash here"，进入 Git bash

# 在本地新建一个同名目录 myfirstrepo
mkdir myfirstrepo
cd myfirstrepo

# 配置远程 origin
git remote add origin https://github.com/gaospecial/myfirstrepo.git

# 更新文件
echo "# myfirstrepo" >> README.md
git add README.md
git commit -m "first commit"

git push -u origin master
```

新建的 repository 默认是没有 remote 链接的，所以需要使用 `git remote add` 命令，
将远程的 `https://github.com/gaospecial/myfirstrepo.git` 设置为 remote origin。
但要想 push 还需要进行至少一次 commit，这里是添加了一个 README.md 文件。

顺便提一下，下面的命令与 remote url 的设置与变更有关。


```
git remote show

git remote show origin

git remote set-url origin https://github.com/gaospecial/myfirstrepo.git
```


# 我的 Git/GitHub 使用流程

下面的操作，模拟了我完成一个小目标并将其记录在案的操作历史。

```
# 用喜欢的方式进入本地 repository 目录
# 用喜欢的方式新建一个文件，xiaomubiao.R
# 用喜欢的文本编辑器打开 xiaomubiao.R
# 用喜欢的方式在 xiaomubiao.R 中敲了100行代码，完成了一个小目标
# 鼠标右键选择 "Git bash here"

# 查看状态，Git 自动发现了我的小目标
git status  

# 那我们把它添加进来
git add xiaomubiao.R

# 记录在案
git commit
# 在弹出的文本编辑器中，输入“完成了一个小目标”，保存并关闭文件

# 告诉大家我完成了一个小目标
git push

# 看看我完成了几个小目标了，
# 完成的小目标多了，有朝一日便可以变成大目标
git log
```


# 在 GitHub 上使用 Pull request 贡献代码


GitHub 相关的操作，上面提到的主要是三个“clone”，“pull”，“push”，可以被认为是“新建”，“更新（读）”和“更新（写）”三个操作。前两个操作不需要 SSH 权限，而“写操作”需要SSH权限。如果自己改正了别人repository 中的错误，那么则需要用 Pull request 来提请 repository 的管理员从我们这里 “更新” 一下。


Pull request 需要在 GitHub 网站上操作。进入 repository 之后，有一个 Pull request 标签，里面有一个 “compare across forks” 链接，点击之后，GitHub 里面所有与该 repository 关联的 repository 都会显示出来。

以 `GuangchuangYu/rvcheck` 为例，我更新了其中的一些代码，想贡献出来。那么首先，我需要在这里 “Fork” 一个 “rvcheck” 到我自己那里，得到一个 `gaospecial/rvcheck` 分枝。然后在自己的自留地里面随意修改，完成 commit 和 push 操作。

这样，在点击 “compare across forks” 之后，我的 `gaospecial/rvcheck` 便处于可选状态。这时候，选择 `base repository: GuanchuangYu/rvchek`， `head repository: gaospecial/rvcheck`，继续按提示操作即可创建一个 Pull request。


作为 repository 的管理员，可以在 Pull request 下面看到别人提交的 Pull request 中的代码和说明，并通过回复进行交流。如果认为没问题，则可以选择 Merge Pull request，将Pull request 中的更改添加进来（执行了一次 git merge操作）。有些管理员还会联系你签一个版权协议（之前向 rstudio 提交 pull request 的时候遇到过。


# GitHub 的替代品 {#github-alternative}

## 可以替代 GitHub 的代码托管服务

以腾讯云为例：

腾讯云开发平台的优势是：

- 国内访问快，不会被墙
- 用户名好起（毕竟用户少嘛）


对于已有的Git项目，可以通过下列途径关联。


```
# 首先在服务器控制面板创建一个同名项目
# 参考这里：https://dev.tencent.com/help/git-import-tencentcloud

# 事实上，不用那么麻烦，用什么学过的几条命令就可以解决
git remote rm origin
git remote add origin https://git.dev.tencent.com/gaoch/myproject.git
git push --set-upstream origin master
```

然后我发现了腾讯云开发平台代码托管服务的缺点是：**URL太长了**。

## 自建 Git 服务器

只要能够进行 SSH 操作的远程服务器，理论上都可以作为自建 Git 服务器。

可以是阿里云这样的主机服务商，也可以是你能访问的任意一台Linux主机。

具体的内容参见我以前写的一个帖子：[设置私有Git服务器](/2018/12/29/private-git-server/)。

# 在 RStudio 中使用 Git/GitHub

RStudio 打开一个 R project 之后，如果发现启用了 Git，会多出来一个 Git 标签（默认在右上方）。但是，这个 Git 点击起来真的反应很慢，[不推荐初学者和电脑配置不高的人士使用](/2018/10/24/donot-use-the-git-gui-of-rstudio/)。