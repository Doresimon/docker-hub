# v2ray
FROM ubuntu:18.04
RUN sed -i "s/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g"    /etc/apt/sources.list
RUN sed -i "s/security.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g"   /etc/apt/sources.list
RUN apt-get update

WORKDIR /work

RUN apt-get install curl zip -y
# RUN curl -L -o go.sh https://install.direct/go.sh
COPY go.sh ./go.sh
COPY v2ray-linux-64.zip ./v2ray-linux-64.zip
COPY config.json ./config.json
RUN chmod +x ./go.sh 
RUN ./go.sh --version v4.23.1 --local ./v2ray-linux-64.zip

RUN rm ./go.sh && \
    rm ./v2ray-linux-64.zip

ENV PATH /usr/bin/v2ray:$PATH
ENV V2RAY_CONFIG /work/config.json

CMD if [ -n "$V2RAY_PORT" ]; then sed -i -r "s/\"port\": (.*?),/\"port\": $V2RAY_PORT,/g" $V2RAY_CONFIG; fi && \
    if [ -n "$V2RAY_ID" ]; then sed -i -r "s/\"id\": \"(.*?)\",/\"id\": \"$V2RAY_ID\",/g" $V2RAY_CONFIG; fi && \
    if [ -n "$V2RAY_ALTERID" ]; then sed -i -r "s/\"alterId\": \"(.*?)\"/\"alterId\": \"$V2RAY_ALTERID\"/g" $V2RAY_CONFIG; fi && \
    sed -nr "/\"port\": (.*?),/"p   $V2RAY_CONFIG  && \
    sed -nr "/\"id\": (.*?),/"p     $V2RAY_CONFIG  && \
    sed -nr "/\"level\": (.*?)/"p   $V2RAY_CONFIG  && \
    sed -nr "/\"alterId\": (.*?)/"p $V2RAY_CONFIG  && \
    v2ray -config=/work/config.json

