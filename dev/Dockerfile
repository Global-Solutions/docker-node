FROM node:8.12.0-alpine
MAINTAINER Global Solutions co., ltd.
LABEL version="2.5.1"

ENV GLIBC_VERSION=2.28-r0
ENV NODE_USER=node
WORKDIR "/home/${NODE_USER}/app"

# git for @kadira/react-storybook
# findutils for xargs and find
# glibc for flow
RUN chown ${NODE_USER}:${NODE_USER} .. -R && \
    deps="git ca-certificates patch findutils wget" && \
    apk add --no-cache $deps && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk && \
    apk add glibc-${GLIBC_VERSION}.apk && \
    rm -rf /var/lib/apt/lists/* glibc-${GLIBC_VERSION}.apk /etc/apk/keys/sgerrand.rsa.pub

USER ${NODE_USER}

entrypoint ["npm"]
