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
    go get gopkg.in/mikefarah/yq.v2 && \
    mv $HOME/go/bin/yq.v2 /bin/yq && \
    rm -f go1.12.2.linux-amd64.tar.gz && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    mv kubectl /bin/ && chmod +x /bin/kubectl && \
    wget https://storage.googleapis.com/kubernetes-helm/helm-v2.14.0-linux-amd64.tar.gz && tar xzvf helm-v2.14.0-linux-amd64.tar.gz && mv linux-amd64/helm /bin/ && chmod +x /bin/helm && \
    apt-get remove --purge -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* *.tar.gz linux-amd64
