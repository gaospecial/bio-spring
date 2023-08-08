---
title: 设置私有 Git 服务器
author: gaoch
date: '2018-12-29'
slug: private-git-server
categories:
  - git
tags:
  - git
---

既然说到 Git，GitHub 你一定是了解的。GitHub 对于私有仓库是收费的。如果你项目还在进行中，需要一个仓库却又不想付高昂的服务费。使用自己的服务器当然也是可以的，而且很方便。

自己的服务器可以是阿里云这样的主机服务商，也可以是你能访问的任意一台Linux主机。只要能够 SSH 登录即可。

# 从服务器中开始

如果你的文件目前存储在服务器端，想在本地开展工作并使用服务器同步更新，可以参考下面的操作。

## 服务器端配置

- 添加一个新用户(也可以使用原有用户).

```{bash}
adduser git
```

在添加用户git时, 会创建 `/home/git` 目录, 同时还会创建 `git` 用户组.

- 在服务器上创建一个git仓库("sample").

```{bash}
cd /home/git
mkdir sample.git
git init --bare sample.git
# 由于使用的是 root 用户新建的文件夹, 需要修订文件夹权限
chown -R git:git sample.git
```

- 添加git的ssh认证.

```{bash}
mkdir /home/git/.ssh
cat ~/.ssh/authorized_keys << EOF
将你的 ssh.pub 公钥粘贴到这里, 每行一个人.
将合作用户的 公钥粘贴到这里, 每行一个人.
EOF
```

你的 ssh.pub 公钥可以在本地电脑上使用`cat ~/.ssh/id_rsa.pub`查看.

## 客户端操作

- 从服务器clone repository.

```{bash}
git clone git@remote.com:/home/git/sample.git
```
- 添加内容, 修改, 更新....

```{bash}
cd sample
cat > README << EOF
This is readme. For test.
EOF
git add .
git commit --message "Initial Commit"

git push
```

# 从本地开始

如果你本地有一个 Git 仓库，想把它上传到服务器中以便于随时随地访问和多人协同作业，则可以参考下面的操作。

## 客户端使用

对于一个本地已有的仓库, 将其上传到自建git服务器上需要以下几个步骤:

1. git 服务器中创建一个对应目录;
2. 在本地软件仓库中添加远程映射;
3. 将本地仓库上传到远程服务器.


```{bash}
# Server
cd
mkdir new.git
# 如果是用root用户创建的文件夹, 则需要将文件夹完整权限转交给git用户
chown -R git:git new.git
git init --bare new.git

# Local
cd /path/to/my/existed/git/project
git remote add origin git@remote.com:/home/git/new.git
# 对库做一些更新
# 如添加文件，git add
git push --set-upstream origin master
git push origin master
```

*注意：本地文件有更新才能操作成功。*

如果要变更远程仓库的地址，可以使用`git remote remove origin`来删除指定的远程链接。`git remote`命令可用于查看当前的远程链接。

# git bare repository的特点

`git init --bare project.git` 会创建一个 **bare** repository。它与`git init`创建的 repository 的不同之处在于：

- bare 不保存工作目录和文件，只有 git 需要的文件；
- 标准 repository 可见的是工作目录和文件，git 需要的文件被隐藏到 `.git` 文件夹中；
- bare 其实就是 `.git` 文件夹中的内容；
- 因此，bare 命名通常会在目录名末尾加上 `.git` 以示区别(当然不加也可以)；
- 如果只用作仓库时，选择 bare 可以节省空间；
- 两种 repository 都可以进行 `clone`，`log` 等操作。

# 客户端配置

其他用户使用时, 需要:
- 下载安装Git(https://git-scm.com/downloads);
- 对Git进行设置, 包括用户名, 邮箱等信息;

参考下面的代码.

```{bash}
# 首先打开 Git Bash 软件
# Windows 下在任意目录点击右键, 选择 Git Bash here 即可
# 输入下面的代码
# 设置用户名和邮箱
git config --global user.name=your_user_name
git config --global user.email=your@email.com
```

用户名和邮箱是为了区分不同协作者之用.

- 生成一对密钥. 私钥自己保存,  "公钥" 提交给管理员, 由管理员添加到服务器中;

继续输入以下代码即可.

```{bash}
# 在 .ssh 目录创建密钥
ssh-keygen

# 查看公钥
cat ~/.ssh/id_rsa.pub

# 查看私钥
cat ~/.ssh/id_rsa
```

然后, 就可以从服务器中新建项目(clone), 提取项目更新(pull), 更新(push).

```{bash}
git clone git@remote.com:/home/git/new.git
```

然后就可以在本地的 new 文件夹下面看到项目的内容. 可以编辑. 编辑完之后, 按下面操作.

```{bash}
# 如果有新文件, 需要加入仓库
git add R/newfile.R

# 如果仅对现有文件有改动(编辑/删除)
git commit -a -m "对文件改动的说明"

# 将这些修改提交到服务器上
git push

# 如果服务器上的文件有更新(其他人已经push过)
# 则先要将本地仓库与服务器仓库对齐
# 然后再执行前面的几条命令
git pull
```

# 将本地与服务器用 Git 关联起来

在服务器端：


```
vi ~/.ssh/authorized_keys
# 把 Git 程序使用的 SSH id_rsa.pub 添加进去

mkdir ~/demo.git
git init --bare ~/demo.git
```

在本地端：


```
git init
# add and commit
# empty repository is not allowed while push
git remote add origin user@host:/home/demo.git origin
git push --set-upstream origin master
```
