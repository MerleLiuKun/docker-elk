## 说明

此项目为内部 ELK 系统的配置项目

项目 Fork源为 https://github.com/deviantony/docker-elk.

基于 Docker-Compose 进行多节点部署

## 准备

#### 镜像

如果再国内的服务器，由于 `ELK` 的官方镜像不再提交到 `docker` 官方仓库中，速度很慢。
可采用先将转移到某个账户下，进而使用加速器进行 `pull`.
详细步骤参见 [镜像加速](docker-image.md) 文件中


## 部署步骤

1. 设置环境变量

```bash
cp .env-template .env
```
并修改其中需要修改的变量

2. 使用 `docker-compose` 启动

编译启动

```bash
sudo docker-compose up --build
```
