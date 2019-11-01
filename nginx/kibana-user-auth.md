## 说明

由于 `XPack` 属于增值服务, 所以为了稍微增加一些安全性，我们使用`Nginx`的认证模块 `ngx_http_auth_basic_module` 来进行网页登录.

## 步骤

一般来说 认证模块被集成在 `nginx` 中, 如果没有需要安装一下.

#### 生成认证用户

安装`apache`提供的密码生成工具

``` bash
# CentOS
sudo yum install httpd-tools
# Ubuntu
sudo apt install apache2-utils
```

在合适的地方(此处以/etc/nginx/目录下为例)生成密码对文件:

``` bash
htpasswd -c /etc/nginx/.htpasswd.db ubuntu
# 安装提示走完步骤
```

#### 配置 Nginx

nginx的内容模板 参考同级目录下的 `auth.conf`.

主要注意 密码对的位置和需要保护的服务的地址

重启`Nginx`服务即可
