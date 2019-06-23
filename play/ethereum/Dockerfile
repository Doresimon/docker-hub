FROM ubuntu:18.04

LABEL Name=ethnode Version=0.0.1

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update
RUN apt-get install -y apt-utils
RUN apt-get install -y ca-certificates

COPY src/sources.list /etc/apt/

RUN apt-get -y update
RUN apt-get install -y \
    git curl wget

### ETH
RUN mkdir /root/eth
WORKDIR /root/eth

ENV GETH_NAME=geth-alltools-linux-amd64-1.8.27-4bcc0a37
ENV GETH_URL=https://gethstore.blob.core.windows.net/builds/${GETH_NAME}.tar.gz

# COPY src/${GETH_NAME}.tar.gz /root/tmp/
RUN cd /root/tmp \
    && wget ${GETH_URL} \
    && tar -xzvf ${GETH_NAME}.tar.gz \
    && cd ${GETH_NAME} \
    && cp * /usr/bin/ \
    && rm -rf /root/tmp

COPY src/genesis.json /root/eth/
COPY src/password /root/eth/
COPY src/private.1.key /root/eth/
COPY src/private.2.key /root/eth/

RUN geth --rpc --rpccorsdomain "*" --networkid 6666 init /root/eth/genesis.json 
RUN geth account import /root/eth/private.1.key --password /root/eth/password
RUN geth account import /root/eth/private.2.key --password /root/eth/password
RUN geth account new --password /root/eth/password

EXPOSE 8545 8546 30303 30303/udp
CMD ["/bin/bash"]