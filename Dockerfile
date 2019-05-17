FROM openjdk:11

MAINTAINER Michael Trezzi <michael.trezzi@zentity.com>

RUN apt-get update && \
    apt-get install -y git && \
    wget https://dl.google.com/go/go1.12.2.linux-amd64.tar.gz && \
    tar -xvf go1.12.2.linux-amd64.tar.gz && \
    mv go /usr/local && \
    export GOROOT=/usr/local/go  && \
    export PATH=$GOROOT/bin:$PATH && \
    go get -u github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login && \
    mv $HOME/go/bin/docker-credential-ecr-login /bin && \
    rm -f go1.12.2.linux-amd64.tar.gz && \
    apt-get remove --purge -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
