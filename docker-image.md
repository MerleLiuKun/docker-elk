## 说明

此处说明如何转移 `ELK` 镜像到官方仓库中，并配置加速器访问。

## 步骤

#### 下载镜像

此处以一台亚马逊香港的服务器为例
登录服务器，执行如下命令(注意版本的不同,此处以 7.4.1 版本为例):

``` bash
sudo docker pull docker.elastic.co/elasticsearch/elasticsearch:7.4.1
sudo docker pull docker.elastic.co/logstash/logstash:7.4.1
sudo docker pull docker.elastic.co/kibana/kibana:7.4.1
```

#### 打Tag

首先需要准备一个 [Docker Hub](https://cloud.docker.com/) 下的账号,此处以账户 `merlelk` 为例.
分别对上述的镜像打上标签。

``` bash
sudo docker tag docker.elastic.co/elasticsearch/elasticsearch:7.4.1 merlelk/elasticsearch:7.4.1
sudo docker tag docker.elastic.co/logstash/logstash:7.4.1 merlelk/logstash:7.4.1
sudo docker tag docker.elastic.co/kibana/kibana:7.4.1 merlelk/kibana:7.4.1
```

#### 推送到官方仓库

首先需要执行登录操作

``` bash
sudo docker login
```
根据提示输入账号和密码(账号要与前一步的账号相同)

执行推送：

``` bash
sudo docker push merlelk/elasticsearch
sudo docker push merlelk/logstash
sudo docker push merlelk/kibana
```

登出

``` bash
sudo docker logout
```

此时镜像已经推送到了官方仓库该账户下的相应仓库下.

## 配置加速器

切换到 需要部署 `ELK` 的国内服务器上

#### 配置加速URL

主要将加速URL写入到 `/etc/docker/daemon.json` 文件中.

```
sudo vim /etc/docker/daemon.json
# 贴入如下语句
{
  "registry-mirrors": [
    "https://docker.mirrors.ustc.edu.cn/",
    "https://dockerhub.azk8s.cn/",
    "https://reg-mirror.qiniu.com/"
  ]
}
```
#### 启用加速

重启 `Docker` 服务之后，配置将会生效

需要注意的是，重启后所有实例都会被停止，注意检查当前服务器上运行的服务。

``` bash
sudo systemctl daemon-reload
sudo systemctl restart docker
```

此后可以将该镜像快速拉取到
