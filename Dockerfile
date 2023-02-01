FROM ubuntu:22.10

ARG TARGET
ENV TARGET $TARGET

RUN apt update; apt install -y wget
WORKDIR /atcoder

ADD ${TARGET}.sh ./build.sh
RUN bash ./build.sh
