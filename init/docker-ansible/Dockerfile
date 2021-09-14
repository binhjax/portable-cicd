FROM gitlab/gitlab-runner:alpine

LABEL MAINTAINER "Hoang Dinh Du <duhd@vnpay.vn>"


ENV PYTHONUNBUFFERED 1

ENV ANSIBLE_VERSION "2.8.0"
# ENV DOCKER_VERSION "18.09.5"

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories && \
  apk -U update && \
  apk add --upgrade apk-tools && \
  # ansible dependencies
  apk add \
      openssh \
      openssl \
      openssl-dev && \
  apk add --no-cache gcc && \
  apk apk --update add --virtual build-dependencies libffi-dev openssl-dev python-dev py-pip build-base  && \
  apk add \
      cairo \
      cairo-dev \
      cargo \
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
      rust \
      sshpass \
      shadow 
RUN apk del build-dependencies
# install Docker:
# RUN curl https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz | \
  # tar -zxC /usr/bin/ --strip-components=1 docker/docker 

# ENV PATH="/root/.cargo/bin:${PATH}"
# ENV RUSTFLAGS="-C target-feature=-crt-static"
# RUN wget https://sh.rustup.rs -O rustup-init \
#   && sh rustup-init -y --default-toolchain nightly-2020-09-14

# upgrade PIP, install Ansible and Docker python bindings
RUN pip3 install --no-cache-dir --upgrade pip && \
  pip3 install --no-cache-dir \ 
  ansible==$ANSIBLE_VERSION
  # docker 

# clean up
RUN  apk del build-base curl && \
  rm -rf /var/cache/apk/*

COPY bin/ /usr/bin/
ENTRYPOINT [ "/usr/bin/ansible-stash-vault-pass" ]
