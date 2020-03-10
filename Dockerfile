FROM python:3.7.6-alpine3.11
LABEL maintainer="William Wang <william@10ln.com>"

USER root

RUN apk add --update bash ca-certificates openssl curl tzdata git git-lfs openssh nodejs npm \
autoconf automake build-base libtool nasm gcc zlib libxml2-dev libxslt-dev jpeg-dev zlib-dev && \
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo "Asia/Shanghai" > /etc/timezone && \
npm install -g npm && npm cache clean -f && npm install -g n && n stable

ENV PATH="$PATH"

# RUN npm config set registry https://registry.npm.taobao.org && \
# npm i -g yarn && yarn config set registry https://registry.npm.taobao.org

RUN pip install frida
# RUN npm install frida

ENV SHELL /bin/bash
USER root
