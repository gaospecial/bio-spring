---
title: 配置私有 Git LFS 服务器
author: gaoch
date: '2024-11-11'
slug: private-git-lfs-server
categories:
  - 计算机技术
tags:
  - git
  - GitHub
  - OSS
  - COS
  - NAS
---

在 Git 项目中使用大文件已经成为非常普遍的事情了，例如在 Hugging face 下面的仓库中这样的情况比比皆是。

为了能够“专业地”存储大文件，或许可以有以下几种方式：

## 使用 NAS 服务器

要将 NAS 作为 Git LFS 服务器，关键是让 NAS 提供 HTTP 或 SSH 文件存储服务，并将其作为 LFS 对象的存储端点。具体步骤如下：

### 1. 在 NAS 上设置文件存储服务

确保 NAS 服务器支持 HTTP、HTTPS 或 SSH 服务，以便用于存储 LFS 对象。以下是常见设置方式：

- **HTTP/HTTPS**：如果 NAS 支持 Web 服务器功能，可以配置一个虚拟主机用于存储 LFS 对象。
- **SSH**：确保 SSH 服务已启用，并为 LFS 服务器创建一个专门用户。

### 2. 初始化 Git 仓库

在本地创建或初始化一个 Git 仓库，并使用 `git lfs` 初始化 LFS 配置：

```bash
git init
git lfs install
```

### 3. 配置 LFS 远程端点

将 LFS 端点配置为 NAS 的 HTTP 或 SSH 地址。编辑 `.lfsconfig` 文件，并添加以下内容：

```ini
[lfs]
url = "http://<NAS_IP>/path/to/lfs"   # 使用 HTTP/HTTPS
# url = "ssh://user@<NAS_IP>/path/to/lfs"  # 使用 SSH
```

将 `<NAS_IP>` 替换为 NAS 的 IP 地址，`path/to/lfs` 为存储 LFS 对象的目录路径。

### 4. 上传 LFS 对象

在配置好 NAS 地址后，添加大文件并推送到 LFS：

```bash
git lfs track "*.largefile"
git add .gitattributes
git add <large_file>
git commit -m "Add large file"
git push origin main
```

### 5. 测试 LFS 存储

通过 NAS 的管理界面或命令行确认文件已存储到 LFS 目录。


## 使用阿里云的 OSS 存储服务

要将阿里云作为 Git LFS 文件服务器，可以使用阿里云对象存储 OSS (Object Storage Service) 来存储 LFS 对象。这里是具体的配置步骤：

### 1. 开通 OSS 服务

在阿里云控制台开通 OSS 服务并创建一个存储桶 (Bucket)，用于存放 Git LFS 对象。

### 2. 创建访问密钥

前往阿里云控制台的 **访问控制**（RAM），创建一个专用用户，并生成访问密钥（Access Key ID 和 Access Key Secret），授予 OSS 的读写权限。

### 3. 配置 OSS 存储桶权限

将 OSS 存储桶设置为私有，以确保数据安全。然后，您可以选择通过 **OSS 签名 URL** 或 **自定义的 API** 访问这些文件。

### 4. 配置 Git LFS 指向 OSS

Git LFS 本身不支持直接与 OSS 交互，所以需要通过 LFS 代理来实现，例如 [lfs-test-server](https://github.com/git-lfs/lfs-test-server)。以下是主要配置步骤：

#### a. 在服务器上安装和配置 lfs-test-server

将 lfs-test-server 部署到您的服务器上，并将其配置为中转 Git LFS 请求到 OSS。您可以使用 Docker 部署 lfs-test-server，命令如下：

```bash
docker run -d -p 9999:8080 \
  -e LFS_BASE_URL=https://<your-domain>/lfs \
  -e LFS_AUTH=true \
  -e AWS_ACCESS_KEY_ID=<your-access-key-id> \
  -e AWS_SECRET_ACCESS_KEY=<your-access-key-secret> \
  -e LFS_STORE_DIR=/data \
  -v /path/to/data:/data \
  -e LFS_ENDPOINT=https://<oss-endpoint>/<bucket-name> \
  ghcr.io/git-lfs/lfs-test-server
```

替换以下参数：

- `<your-domain>`：服务器域名或 IP 地址
- `<your-access-key-id>` 和 `<your-access-key-secret>`：阿里云的访问密钥
- `<oss-endpoint>`：OSS 终端，例如 `oss-cn-shanghai.aliyuncs.com`
- `<bucket-name>`：OSS 存储桶名称

#### b. 配置 Git LFS 使用代理

在 Git 仓库中创建或编辑 `.lfsconfig` 文件，指向您服务器上配置的 lfs-test-server：

```ini
[lfs]
url = "https://<your-domain>/lfs"
```

### 5. 使用 Git LFS 推送和拉取文件

完成配置后，您可以像平常一样使用 Git LFS 进行文件的添加和推送：

```bash
git lfs track "*.largefile"
git add .gitattributes
git add <large_file>
git commit -m "Add large file"
git push origin main
```

### 6. 测试 OSS 存储

通过 OSS 控制台查看存储桶，确认文件已成功上传到 OSS。

## 使用腾讯云的 COS 存储服务

要将腾讯云配置为 Git LFS 的服务器，可以使用腾讯云对象存储 COS (Cloud Object Storage) 来存储 Git LFS 对象。以下是具体的步骤：

### 1. 开通 COS 服务

在腾讯云控制台开通 COS 服务，并创建一个存储桶 (Bucket) 来存储 Git LFS 对象。可以根据实际需求设置桶的访问权限为私有或公有读。

### 2. 获取访问密钥

前往腾讯云控制台的 **访问管理**（CAM），创建一个新用户或使用已有用户，确保有 COS 读写权限，并获取该用户的 **SecretId** 和 **SecretKey**。

### 3. 配置 COS 存储桶权限

建议将 COS 存储桶的权限设置为私有，以确保数据安全。通过 COS 的签名 URL 或代理服务来实现 Git LFS 的访问控制。

### 4. 部署 Git LFS 服务器代理

由于 Git LFS 本身无法直接与 COS 交互，需要部署一个 LFS 代理服务器来实现对 COS 的中转。可以使用 [lfs-test-server](https://github.com/git-lfs/lfs-test-server) 作为 Git LFS 的服务器代理。以下是具体步骤：

#### a. 安装和配置 lfs-test-server

在您的服务器上安装 `lfs-test-server`，可以使用 Docker 快速部署：

```bash
docker run -d -p 9999:8080 \
  -e LFS_BASE_URL=https://<your-domain>/lfs \
  -e LFS_AUTH=true \
  -e AWS_ACCESS_KEY_ID=<your-secret-id> \
  -e AWS_SECRET_ACCESS_KEY=<your-secret-key> \
  -e LFS_STORE_DIR=/data \
  -v /path/to/data:/data \
  -e LFS_ENDPOINT=https://<cos-endpoint>/<bucket-name> \
  ghcr.io/git-lfs/lfs-test-server
```

替换以下参数：

- `<your-domain>`：服务器的域名或 IP 地址
- `<your-secret-id>` 和 `<your-secret-key>`：腾讯云的 SecretId 和 SecretKey
- `<cos-endpoint>`：COS 终端（例如 `cos.ap-guangzhou.myqcloud.com`）
- `<bucket-name>`：COS 存储桶名称

#### b. 配置 Git LFS 使用代理

在 Git 仓库中创建或编辑 `.lfsconfig` 文件，将 LFS 的 URL 配置为代理服务器地址：

```ini
[lfs]
url = "https://<your-domain>/lfs"
```

### 5. 添加大文件并推送到 LFS

完成配置后，可以像常规 Git LFS 操作一样，添加大文件并推送到 LFS：

```bash
git lfs track "*.largefile"
git add .gitattributes
git add <large_file>
git commit -m "Add large file"
git push origin main
```

### 6. 验证 COS 存储

在腾讯云 COS 控制台查看存储桶，确认 Git LFS 对象已成功上传至 COS。


## 局部访问权限

在 GitHub Organization 内部公开的仓库中使用私有化的 OSS 存储，并希望仅对组织内具有仓库访问权限的成员开放 LFS 文件的访问，可以采用以下方法，以确保访问控制在组织范围内实现：

### 1. 使用 OSS 的临时访问凭证和签名 URL

利用阿里云 RAM（资源访问管理）中的 **STS（Security Token Service）**，生成带有临时访问权限的签名 URL。这种方法适用于为每位有权限的组织成员提供有限时效的访问链接。

#### 设置步骤：

1. **配置 RAM 角色**：

   - 在阿里云控制台中，创建一个 RAM 角色，并授予该角色对 OSS 存储桶的读取权限。
   - 在 GitHub Actions 或其他自动化脚本中，使用该角色来生成签名 URL。

2. **使用 STS 生成临时签名 URL**：

   - 利用阿里云 SDK 或 API 生成具有临时访问凭证的签名 URL。
   - 生成的 URL 可直接嵌入到 GitHub 的 README 或发布页面，但由于有时间限制，URL 可能需要定期刷新。

   示例 Python 代码：
   ```python
   import oss2
   import time

   # 使用 STS 获取临时访问凭证
   auth = oss2.Auth('<AccessKeyId>', '<AccessKeySecret>')
   bucket = oss2.Bucket(auth, 'http://oss-cn-shanghai.aliyuncs.com', '<bucket-name>')

   # 设置有效期，单位为秒（如 3600 秒即 1 小时）
   signed_url = bucket.sign_url('GET', 'path/to/largefile', 3600)
   print("Signed URL:", signed_url)
   ```

3. **将签名 URL 提供给组织成员**：

   - 可在 GitHub Actions 中自动生成签名 URL，将其写入 README 或通知组织成员。

### 2. 使用 GitHub Actions 动态生成访问权限

利用 GitHub Actions 在特定工作流中动态生成签名 URL，并通过 GitHub Secrets 管理 Access Key 信息。这样，组织内部访问者可以使用 Actions 生成的临时 URL。

#### 设置步骤：

1. **配置 GitHub Secrets**：

   - 在仓库设置中，将阿里云的 Access Key 和 Secret Key 添加为 Secrets。
   
2. **配置 GitHub Actions 工作流**：

   - 使用 GitHub Actions 定义一个工作流，生成签名 URL，供组织内成员访问。例如：

   ```yaml
   name: Generate LFS Signed URL

   on:
     workflow_dispatch:  # 手动触发工作流

   jobs:
     generate-url:
       runs-on: ubuntu-latest
       steps:
         - name: Set up Python
           uses: actions/setup-python@v2
           with:
             python-version: '3.x'

         - name: Install oss2
           run: pip install oss2

         - name: Generate Signed URL
           env:
             ACCESS_KEY_ID: ${{ secrets.ACCESS_KEY_ID }}
             ACCESS_KEY_SECRET: ${{ secrets.ACCESS_KEY_SECRET }}
           run: |
             import oss2
             auth = oss2.Auth('${{ secrets.ACCESS_KEY_ID }}', '${{ secrets.ACCESS_KEY_SECRET }}')
             bucket = oss2.Bucket(auth, 'http://oss-cn-shanghai.aliyuncs.com', 'bucket-name')
             signed_url = bucket.sign_url('GET', 'path/to/largefile', 3600)
             print("Signed URL:", signed_url)
   ```

3. **通知组织成员**：

   - 执行该工作流生成的 URL 可发布到 GitHub Issues、Wiki 或 README 中的受限访问部分。组织内具有仓库访问权限的成员即可使用该 URL。

### 3. 使用专用的 Web 代理服务控制权限

部署一个内部 Web 代理服务来充当 Git LFS 文件访问的中介，通过组织成员的 GitHub 登录信息控制访问。该代理服务从 OSS 获取文件，并将其返回给经过验证的用户。

#### 设置步骤：

1. **构建 Web 代理**：
   - 使用例如 OAuth 的 GitHub 登录认证方式来验证用户是否为组织成员。
   - 验证通过后，代理服务使用 Access Key 从 OSS 下载 LFS 文件，并提供下载服务。

2. **配置组织内用户访问**：
   - 将 Web 代理的 URL 公开在 GitHub 仓库中，供组织成员访问。
   - 该代理服务可根据用户请求动态生成签名 URL，并将文件传递给用户。

这种方法适合需要精细控制访问权限的情况。通过代理服务，只有组织成员能够访问文件内容，同时避免了将 OSS 存储桶直接公开。

## 费用

云存储的存储、访问、取回都要收费。以阿里云为例，其 OSS 的费用主要包括以下几部分：

### 1. 存储费用

存储费用基于存储在 OSS 中的数据量，按 GB 每月收费。价格因存储类型不同而异：

- **标准存储**：适合频繁访问的数据，价格最高。
- **低频访问存储**：适合不频繁访问的数据，价格较低，但有最低存储时间要求（通常为30天）。
- **归档存储**：适合长期备份的数据，价格更低，但有更长的存储时间要求，数据恢复速度较慢。
- **冷归档存储**：适合极少访问的冷数据，价格最低，恢复数据可能需要数小时。

> **注意**：如果文件存储在低频或归档类型中，但被频繁访问，额外的读取请求费用可能较高。

### 2. 请求费用

请求费用基于对 OSS 的操作次数，包括上传、下载、删除等请求，按千次请求数计费。不同存储类型的请求费用略有差异。

- **PUT、COPY、POST 和 LIST 请求**：上传或列出文件的请求收费较低。
- **GET 和 HEAD 请求**：读取文件的请求通常费用较高。

### 3. 数据传输费用

数据传输费用指从 OSS 传出数据的费用。主要根据流量计费：

- **出网流量**：从 OSS 下载数据到公网（例如下载到本地或其他网络）的流量按 GB 收费。
- **内网流量**：阿里云同一地域内的云服务间的数据传输通常免费，例如 OSS 与 ECS 实例在同一区域内传输数据。
- **跨区域流量**：数据在不同地域间传输会收取费用，按 GB 计费。

### 4. 数据处理费用（可选）

如果使用 OSS 提供的附加功能（如图片处理、音视频转码），则会产生额外费用。这些费用基于处理请求的次数和数据量。

### 费用示例

假设您使用 **标准存储**，存储了 100 GB 数据，产生了 1,000 次上传请求和 1,000 次下载请求，并传输了 10 GB 数据到公网。大致费用如下（具体价格需参考阿里云官网最新信息）：

- **存储费用**：100 GB × 标准存储单价
- **请求费用**：1,000 PUT 请求 × 单价 + 1,000 GET 请求 × 单价
- **传输费用**：10 GB × 出网流量单价

阿里云 OSS 价格会随时更新，访问 [阿里云 OSS 价格页面](https://cn.aliyun.com/price/detail/oss?from_alibabacloud=) 获取最新和详细的费用信息。