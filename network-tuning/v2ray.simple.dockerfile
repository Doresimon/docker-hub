############################
# use official image
############################

FROM v2ray/official:latest

RUN apk add -U tzdata

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

############################
# rewrite CMD
############################
CMD if [ -n "$V2RAY_PORT" ]; then sed -i -r "s/\"port\": (.*?),/\"port\": $V2RAY_PORT,/g" /etc/v2ray/config.json; fi && \
    if [ -n "$V2RAY_ID" ]; then sed -i -r "s/\"id\": \"(.*?)\",/\"id\": \"$V2RAY_ID\",/g" /etc/v2ray/config.json; fi && \
    if [ -n "$V2RAY_ALTERID" ]; then sed -i -r "s/\"alterId\": \"(.*?)\"/\"alterId\": \"$V2RAY_ALTERID\"/g" /etc/v2ray/config.json; fi && \
    sed -nr "/\"port\": (.*?),/"p   /etc/v2ray/config.json  && \
    sed -nr "/\"id\": (.*?),/"p     /etc/v2ray/config.json  && \
    sed -nr "/\"level\": (.*?)/"p   /etc/v2ray/config.json  && \
    sed -nr "/\"alterId\": (.*?)/"p /etc/v2ray/config.json  && \
    v2ray -config=/etc/v2ray/config.json

