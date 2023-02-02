FROM ubuntu:22.10

ARG TARGET
ENV TARGET $TARGET

RUN apt update; apt install -y wget

ADD ${TARGET}.sh /tmp/build.sh
RUN bash ./tmp/build.sh
RUN rm /tmp/build.sh

WORKDIR /root/main
