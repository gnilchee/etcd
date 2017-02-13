FROM alpine:latest

ADD https://github.com/coreos/etcd/releases/download/v3.1.0/etcd-v3.1.0-linux-amd64.tar.gz /tmp/etcd-v3.1.0-linux-amd64.tar.gz

RUN mkdir -p /tmp/etcd && tar xzvf /tmp/etcd-v3.1.0-linux-amd64.tar.gz -C /tmp/etcd --strip-components=1 \
    && rm -f /tmp/etcd-v3.1.0-linux-amd64.tar.gz && mv /tmp/etcd/etcd* /usr/local/bin/ && rm -rf /tmp/etcd \
    && chown root. /usr/local/bin/etcd*

WORKDIR /root

EXPOSE 4001 2380 2379
