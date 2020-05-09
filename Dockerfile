FROM python:3.7.7-buster
LABEL maintainer="William Wang <william@10ln.com>"

USER root

ENV ANDROID_HOME=/opt
ENV PATH=$ANDROID_HOME/platform-tools:$PATH

# RUN echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free" > /etc/apt/sources.list && \
# echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free" >> /etc/apt/sources.list && \
# echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free" >> /etc/apt/sources.list && \
# echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get upgrade -y

#Install Frida
RUN apt-get install -y unzip bash git nano gcc-multilib zlib1g-dev lib32z1-dev git git-lfs autotools-dev automake curl
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
apt-get install -y nodejs

ENV PATH="$PATH"

# RUN npm config set registry https://registry.npm.taobao.org && \
# npm i -g yarn && yarn config set registry https://registry.npm.taobao.org

RUN pip install frida && pip install frida-tools
# RUN npm install frida

RUN mkdir -pm 0750 ~/.android $ANDROID_HOME && \
curl -fsSL https://dl.google.com/android/repository/platform-tools-latest-linux.zip -o /tmp/adb.zip && \
unzip /tmp/adb.zip -d $ANDROID_HOME && rm -f /tmp/adb.zip

ENV SHELL /bin/bash
