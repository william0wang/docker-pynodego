FROM python:3.7.6-alpine3.11
LABEL maintainer="William Wang <william@10ln.com>"

RUN apk add --update bash ca-certificates openssl curl tzdata git git-lfs openssh nodejs npm \
autoconf automake build-base libtool nasm gcc zlib libxml2-dev libxslt-dev jpeg-dev zlib-dev && \
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo "Asia/Shanghai" > /etc/timezone

ENV SHELL /bin/bash

USER root

# RUN npm config set registry https://registry.npm.taobao.org && \
# npm i -g yarn && yarn config set registry https://registry.npm.taobao.org

RUN pip install frida
RUN npm install -g frida
