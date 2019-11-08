FROM jenkins/jenkins:lts

LABEL maintainer="xuchao@gen-iot.com" 

USER root

ARG docker_gid=999

RUN echo '' > /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/debian stretch main contrib non-free" > /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/debian stretch-proposed-updates main contrib non-free" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/debian stretch-updates main contrib non-free" >> /etc/apt/sources.list \
    && apt-get update -y \
    && apt-get install -y sudo \
    && apt-get install -y libltdl7 \
    && rm -rf /var/lib/apt/lists/* \
    && echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers \
    && echo "docker:x:${docker_gid}:jenkins" >> /etc/group \
    && mkdir -p /etc/docker  \ 
    && echo "{  \"registry-mirrors\": [\"https://bdembhvo.mirror.aliyuncs.com\"\]}" > /etc/docker/daemon.json 

USER jenkins