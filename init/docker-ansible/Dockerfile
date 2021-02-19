FROM alpine:3.7

LABEL MAINTAINER "Hoang Dinh Du <duhd@vnpay.vn>"

ENV ANSIBLE_VERSION "2.8.0"
ENV DOCKER_VERSION "18.09.5"

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories && \
  apk -U update && \
  apk add --upgrade apk-tools && \
  # ansible dependencies
  apk add \
  libc-dev \
  bash \
  build-base \
  curl \
  git \
  gosu \
  libffi \
  libffi-dev \
  musl-dev \
  openssh \
  openssl \
  openssl-dev \
  py3-pip \
  python3 \
  python3-dev \
  sshpass \
  shadow && \
  # install Docker:
  curl https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz | \
  tar -zxC /usr/bin/ --strip-components=1 docker/docker && \
  # upgrade PIP, install Ansible and Docker python bindings
  pip3 install --no-cache-dir --upgrade pip && \
  pip3 install --no-cache-dir \
  ansible==$ANSIBLE_VERSION \
  docker==4.0.1 \
  docker-pycreds==0.4.0 && \
  # clean up
  apk del build-base curl && \
  rm -rf /var/cache/apk/*

COPY bin/ /usr/bin/
ENTRYPOINT [ "/usr/bin/ansible-stash-vault-pass" ]
