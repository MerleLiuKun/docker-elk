## Filebeat

[Filebeat](https://www.elastic.co/cn/products/beats/filebeat) 是 `ELK` 提供的轻量型的日志采集器

你可以在需要文件日志产生的地方将日志数据通过 `Filebeat` 打入到 `ELK` 中。

## 部署步骤

#### 修改配置文件

修改 [Filebeta配置样例](config/filebeat.yml) 文件

需要修改的地方主要有：
- paths  实例内部日志文件位置 与下方的启动脚本中的内部映射一致
- fields.type 附加到每条日志上的 `type` 字段
- output.hosts `Logstash` 的接入地址

修改完毕之后需要修改 `filebeat.yml` 文件的权限

```bash
sudo chown root:root filebeat.yml
sudo chmod go-w filebeat.yml
```
 
#### 修改启动脚本 

修改 `start_filebeat.sh` 文件

需要配置上方的几个变量

- containerName: `Docker` 实例的名称
- logPath: 本地日志目录
- filebeatConfigPath: `Filebeat` 配置文件

#### 启动

为 `start_filebeat.sh` 脚本的权限添加可执行权限

```bash
sudo chmod u+x start_filebeat.sh
```

执行脚本

```bash
./start_filebeat.sh
```

此后修改配置之后直接执行此脚本即可