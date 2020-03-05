FROM python:3.7.6-alpine3.11
MAINTAINER William Wang <william@10ln.com>

RUN echo "https://mirrors.tuna.tsinghua.edu.cn/alpine/v3.11/main" > /etc/apk/repositories && \
echo "https://mirrors.tuna.tsinghua.edu.cn/alpine/v3.11/community" >> /etc/apk/repositories && \
apk add --update bash ca-certificates openssl curl tzdata libstdc++ && \
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo "Asia/Shanghai" > /etc/timezone && \
mkdir -p ~/.pip && echo "[global]" > ~/.pip/pip.conf && \
echo "index-url = https://pypi.tuna.tsinghua.edu.cn/simple" >> ~/.pip/pip.conf && \
pip install -U pip && pip install pipenv 

ENV VERSION=v12.16.1
ENV DISTRO=linux-x64
ENV SHELL /bin/bash

RUN mkdir -p /usr/local/lib/nodejs && \
wget https://nodejs.org/dist/$VERSION/node-$VERSION-$DISTRO.tar.xz && \
tar -xJvf node-v12.16.1-linux-x64.tar.xz -C /usr/local/lib/nodejs && \
rm -f node-$VERSION-$DISTRO.tar.xz

RUN export PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH

RUN npm config set registry https://registry.npm.taobao.org && \
npm i -g yarn && yarn config set registry https://registry.npm.taobao.org

RUN mkdir -p /usr/local/work

WORKDIR /usr/local/work

ENTRYPOINT ["/usr/local/work/run.sh"]
