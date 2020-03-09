FROM python:3.7.6-alpine3.11
LABEL maintainer="William Wang <william@10ln.com>"

RUN apk add --update bash ca-certificates openssl curl tzdata git git-lfs openssh \
autoconf automake build-base libtool nasm gcc zlib libxml2-dev libxslt-dev jpeg-dev zlib-dev && \
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo "Asia/Shanghai" > /etc/timezone

ENV SHELL /bin/bash
ENV VERSION=v12.16.1
ENV DISTRO=linux-x64

USER root

RUN mkdir -p /usr/local/lib/nodejs && \
wget https://nodejs.org/dist/$VERSION/node-$VERSION-$DISTRO.tar.xz && \
tar -xJvf node-v12.16.1-linux-x64.tar.xz -C /usr/local/lib/nodejs && \
rm -f node-$VERSION-$DISTRO.tar.xz

ENV PATH="/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:${PATH}"

RUN npm config set registry https://registry.npm.taobao.org && \
npm i -g yarn && yarn config set registry https://registry.npm.taobao.org

RUN pip install frida
RUN npm install -g frida
