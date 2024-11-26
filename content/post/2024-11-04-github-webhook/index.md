---
title: GitHub Webhook
author: gaoch
date: '2024-11-04'
slug: github-webhook
categories:
  - 信息技术
tags:
  - GitHub
  - Webhook
  - Ubuntu
  - Apache
  - PHP
---

使用 GitHub Webhook 自动更新个人网站。[bio-spring.top](https://bio-spring.top) 是我的个人网站，其源代码托管在 [GitHub](https://github.com/gaospecial/bio-spring) 上。通过使用 GitHub Actions 可以自动构建网站并部署到 GitHub Pages，实现自动更新网站在 [gaospecial.github.io/bio-spring/](https://gaospecial.github.io/bio-spring/) 上的展示。通过使用 netlify 可以实现自动更新网站在 netlify 服务器上的展示。现在想要自动化部署到我的阿里云服务器上，该如何实现呢？

这里要用到几个部分的技术：

- GitHub Webhook
- 配置 Hook server
- 设置 Hook server 要执行的任务

## 配置 GitHub Webhook

GitHub Webhook 是一种自动化工具，它允许在 GitHub 仓库发生特定事件时向外部服务器发送通知。当配置的事件（如 push、pull request 等）发生时，GitHub 会向指定的 URL 发送 HTTP POST 请求，包含相关事件的详细信息。

### 访问 Webhook 设置

1. 进入 GitHub 仓库
2. 点击 "Settings" 选项卡
3. 在左侧菜单中选择 "Webhooks"
4. 点击 "Add webhook" 按钮

### 配置 Webhook

在添加 Webhook 时需要设置以下内容：

1. **Payload URL**: 接收 webhook 请求的服务器地址
   - 例如：`http://webhook.bio-spring.top/`
   - 确保该 URL 可以从公网访问

2. **Content type**: 选择数据传输格式
   - 通常选择 `application/json`

3. **Secret**: 设置密钥（可选但推荐）
   - 用于验证请求来源的合法性
   - 确保安全传输
   - 生成一个随机的秘钥字符串：`openssl rand -hex 20`

4. **事件触发选项**:
   - "Just the push event": 仅推送事件
   - "Send me everything": 所有事件
   - "Let me select individual events": 自定义选择事件

配置完成后，GitHub 会向指定的 URL 发送一个 ping 事件来测试连接。

## 配置 Hook server

上面配置完，会得到一个提示“Last delivery was not successful”，这是因为还没有配置 Hook server。接下来做这部分工作。

### 配置 Hook server 的 URL


要配置 webhook.bio-spring.top，需要在 Apache2 中添加一个虚拟主机配置。具体步骤如下：

1. 创建虚拟主机配置文件：

    ```apache
    <VirtualHost *:443>
        # 设置服务器名称
        ServerName webhook.bio-spring.top
        ServerAlias webhook.bio-spring.top

        # 启用 SSL
        SSLEngine on
        SSLCertificateFile /etc/letsencrypt/live/webhook.bio-spring.top/fullchain.pem
        SSLCertificateKeyFile /etc/letsencrypt/live/webhook.bio-spring.top/privkey.pem

        # 设置日志路径
        ErrorLog ${APACHE_LOG_DIR}/webhook-error.log
        CustomLog ${APACHE_LOG_DIR}/webhook-access.log combined

        # 设置文档根目录
        DocumentRoot /var/www/html/webhook
    </VirtualHost>
    ```

2. 重启 Apache 服务：

    ```bash
    sudo a2ensite webhook.conf
    sudo service apache2 restart
    ```

3. 添加 DNS 解析

    在 DNS 解析中添加 webhook.bio-spring.top 的解析，指向阿里云服务器的公网 IP 地址。

4. 配置 https 证书

    在阿里云服务器上安装 certbot 并配置 https 证书。

    ```bash
    sudo apt install certbot
    sudo certbot --apache -d webhook.bio-spring.top
    ```

### 配置 Hook Server 的脚本

在 Hook Server 的文档根目录下创建一个 `index.php` 文件，内容如下：

```php
<?php
// 配置
$secret = "your-secret-key";
$log_file = "/var/log/webhook/deploy-php.log";
$deploy_script = "/path/to/deploy-hook.sh";

// 记录日志
function write_log($message) {
    global $log_file;
    $date = date('Y-m-d H:i:s');
    file_put_contents($log_file, "[$date] $message\n", FILE_APPEND);
}

// 验证签名
function verify_signature($payload, $signature) {
    global $secret;
    $expected = "sha256=" . hash_hmac('sha256', $payload, $secret);
    return hash_equals($expected, $signature);
}

// 确保是POST请求
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    die('Method Not Allowed');
}

// 获取GitHub签名
$headers = getallheaders();
$signature = isset($headers['X-Hub-Signature-256']) ? $headers['X-Hub-Signature-256'] : '';

if (empty($signature)) {
    write_log("Error: No signature provided");
    http_response_code(403);
    die('No signature');
}

// 获取请求体
$payload = file_get_contents('php://input');

// 验证签名
if (!verify_signature($payload, $signature)) {
    write_log("Error: Invalid signature");
    http_response_code(403);
    die('Invalid signature');
}

// 解析payload
$data = json_decode($payload, true);

// 检查是否是push事件
if (isset($data['ref']) && $data['ref'] === 'refs/heads/master') {
    write_log("Received push to master branch");
    
    // 执行部署脚本
    $output = [];
    $return_var = 0;
    exec("bash $deploy_script 2>&1", $output, $return_var);
    
    // 记录执行结果
    $output_str = implode("\n", $output);
    write_log("Deploy script output:\n$output_str");
    
    if ($return_var === 0) {
        write_log("Deploy completed successfully");
        echo "Deploy successful";
    } else {
        write_log("Deploy failed with code $return_var");
        http_response_code(500);
        echo "Deploy failed";
    }
} else {
    write_log("Ignored non-master push event");
    echo "Ignored";
}
?>
```

重启 Apache 服务器之后，访问 webhook.bio-spring.top 应该会返回 "Method Not Allowed"。

### 配置 deploy-hook.sh 脚本

```bash
#!/bin/bash

# 设置工作目录
SITE_DIR="/var/www/html/bio-spring.top"
LOG_FILE="/var/log/webhook/deploy-sh.log"
REPO_DIR="/home/git/bio-spring"

# 如果日志文件不存在则创建
if [ ! -f "$LOG_FILE" ]; then
    mkdir -p "$(dirname "$LOG_FILE")"
    touch "$LOG_FILE"
    chown www-data:www-data "$LOG_FILE"
    chmod 644 "$LOG_FILE"
fi


# 记录部署时间
echo "Deployment started at $(date)" >> $LOG_FILE

# 更新代码仓库
cd $REPO_DIR || exit
GIT_SSH_COMMAND='ssh -i /home/git/.ssh/id_rsa' git pull origin master >> $LOG_FILE 2>&1
GIT_SSH_COMMAND='ssh -i /home/git/.ssh/id_rsa' git submodule update --recursive >> $LOG_FILE 2>&1

# 安装 hugo
# wget https://github.com/gohugoio/hugo/releases/download/v0.136.5/hugo_0.136.5_linux-amd64.deb
# dpkg -i hugo_0.136.5_linux-amd64.deb

# 构建网站
Rscript -e 'blogdown::build_site(baseURL = "/")' >> $LOG_FILE 2>&1

# 同步到网站目录
rsync -av --delete public/ $SITE_DIR/ >> $LOG_FILE 2>&1

echo "Deployment completed at $(date)" >> $LOG_FILE
```

## 测试

在 GitHub 仓库中推送代码，应该会看到阿里云服务器上的网站自动更新。同时，GitHub Webhook 的日志中也会记录 delivery 信息。

**注意**：由于 GitHub Webhook 的超时时间为 10 s，如果超过 10 s 没有响应（脚本没有执行完毕），GitHub 的状态会显示为“time out”。这种情况可以通过异步执行脚本解决。或者也可以忽略。

### 异步执行脚本

在 PHP 中实现异步处理，可以使用 `exec()` 或 `shell_exec()` 命令来启动后台进程。通过在命令末尾添加 `&` 符号，可以让该进程在后台运行，而不阻塞主进程。

```php
// 异步启动任务
exec("bash /path/to/deploy-hook.sh &");
```

以上代码会在后台执行 `deploy-hook.sh`，避免输出内容影响主进程。
