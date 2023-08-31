FROM ubuntu:22.10

ARG TARGET
ENV TARGET $TARGET

RUN apt update && apt install -y wget sudo

ENV USERNAME runner
RUN adduser --disabled-password --gecos "" "${USERNAME}" && \
    echo "%${USERNAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER ${USERNAME}
WORKDIR /judge

ADD --chown=runner:runner ${TARGET}.sh /tmp/build.sh
RUN bash /tmp/build.sh
RUN rm /tmp/build.sh

