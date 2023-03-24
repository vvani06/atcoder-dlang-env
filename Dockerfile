FROM ubuntu:22.10

ARG TARGET
ENV TARGET $TARGET

RUN apt update; apt install -y wget sudo

ARG USERNAME=runner
ARG GROUPNAME=runner
ARG UID=1000
ARG GID=1000

RUN echo "root:root" | chpasswd && \
    adduser --disabled-password --gecos "" "${USERNAME}" && \
    echo "${USERNAME}:${GROUPNAME}" | chpasswd && \
    echo "%${USERNAME}    ALL=(ALL)   NOPASSWD:    ALL" >> /etc/sudoers

USER ${USERNAME}
WORKDIR /judge

ADD ${TARGET}.sh /tmp/build.sh
RUN bash /tmp/build.sh
RUN sudo rm /tmp/build.sh

