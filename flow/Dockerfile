FROM node:6.10.3-alpine
MAINTAINER Global Solutions co., ltd.

ENV FLOW_VERSION=0.46.0

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
 && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
 && apk add --no-cache --virtual .build-deps-flow \
     alpine-sdk \
     bash \
     diffutils \
     elfutils-dev \
     git \
     linux-headers \
     m4 \
     ncurses \
     ocaml \
     opam \
     curl \
 && opam init -y \
 && eval `opam config env` \
 && opam update \
 && opam install -y ocamlfind sedlex \
 && git clone --depth 1 --branch "v$FLOW_VERSION" https://github.com/facebook/flow.git \
 && cd flow \
 && yarn \
 && make test \
 && cp bin/flow /usr/bin/flow \
 && apk del .build-deps-flow \
 && apk add --no-cache elfutils-libelf \
 && cd .. \
 && rm -rf flow ~/.opam /tmp/* /var/lib/apt/lists/*
