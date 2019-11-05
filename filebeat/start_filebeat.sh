#!/usr/bin/env bash

####  相关变量配置  ####
# Docker 实例名称
containerName=ik-filebeat
# 日志目录地址
logPath=path/to/logs
# filebeat 配置文件位置
filebeatConfigPath=path/to/filebeats/config/filebeat.yml
####  变量配置结束  ####

#### 以下代码尽量勿动

# 检查是否当前有同名实例正在运行
containerStatus=$(sudo docker inspect --format="{{ .State.Running }}" ${containerName} 2>/dev/null)

# 如果正在运行强制停止并删除该实例
if [[ ${containerStatus} ]]; then
  echo "存在同名的实例"
  echo "正在删除已存在的实例"
  sudo docker rm -f ${containerName}
else
  echo "当前没有同名实例"
fi
echo "开始创建新实例"
sudo docker run --name=${containerName} \
  -v ${filebeatConfigPath}:/usr/share/filebeat/filebeat.yml \
  -v ${logPath}:/var/share/log \
  -d merlelk/filebeat:7.4.1
echo "实例创建完成"
exit
