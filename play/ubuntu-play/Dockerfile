FROM ubuntu:18.04

LABEL Name=play Version=0.0.1

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update
RUN apt-get install -y apt-utils
RUN apt-get install -y ca-certificates

COPY src/sources.list /etc/apt/

RUN apt-get -y update
RUN apt-get install -y \
    git curl wget

WORKDIR /root

CMD ["/bin/bash"]
