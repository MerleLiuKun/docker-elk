## 说明

基于 `Docker-Compose` 进行单机多节点 `ELK` 部署
项目采用 `ELK` 的 `7.4.1` 版本

项目基于 [docker-elk](https://github.com/deviantony/docker-elk) 进行改造

## 准备

#### 镜像

如果部署 `ELK` 的服务器位于国内，由于 `ELK` 的官方镜像不再提交到 `docker` 的官方仓库中，
拉取镜像速度很慢, 所以可以采用先将所需镜像转移到某个 `Docker Hub` 的账户下，进而使用加速器进行拉取.

详细步骤参见 [镜像加速](docker-image.md) 文件中.

#### 访问 `Kibana`

由于 `X-Pack` 是付费服务，如果没有相应预算，可以使用基础的 `Nginx` 认证来替代。

详细步骤参见 [Nginx认证替换X-Pack](nginx/kibana-user-auth.md)


## 部署步骤

1. 设置环境变量

```bash
cp .env-template .env
```
并修改 `.env` 文件中需要修改的变量

2. 创建外部挂载的文件夹

```bash
mkdir es-master es-master-logs es-slave1 es-slave1-logs es-slave2-logs
```

3. 使用 `docker-compose` 启动

编译启动

```bash
sudo docker-compose up --build
```

经过验证成功之后，可以直接启动

```bash
sudo docker-compose up -d
```

移出实例以及创建的虚拟网络

```bash
sudo docker-compose down -v
```

## 其他

#### Filebeat

在 [Filebeat样例](filebeat/README.md) 中提供了简单部署 `Filebeat` 采集服务的样例