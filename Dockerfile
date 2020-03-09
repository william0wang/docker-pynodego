FROM python:3.7.6-alpine3.11
LABEL maintainer="William Wang <william@10ln.com>"

RUN apk add --update bash ca-certificates openssl curl tzdata git git-lfs openssh python3 \
autoconf automake build-base libtool nasm gcc zlib libxml2-dev libxslt-dev jpeg-dev zlib-dev && \
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo "Asia/Shanghai" > /etc/timezone && \
python3 -m ensurepip \
&& pip3 install --upgrade pip setuptools \
&& rm -r /usr/lib/python*/ensurepip && \
if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
rm -r /root/.cache

ENV SHELL /bin/bash

RUN pip install frida
RUN npm install frida
