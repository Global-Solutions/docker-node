FROM node:6.9.3-alpine
MAINTAINER Global Solutions co., ltd.
LABEL version="0.6.7"

ENV NODE_USER=node \
    YARN_VERSION=0.17.10
WORKDIR "/home/${NODE_USER}/app"

# git for @kadira/react-storybook
# libelf-dev, libelf1 for flow-bin
# expect for npm login
# g++, python, make for fsevents (yarn install)
RUN mkdir ../.cache/yarn -p && \
    chown ${NODE_USER}:${NODE_USER} .. -R && \
    deps="git ca-certificates libelf-dev libelf expect g++ python make" && \
    apk add --no-cache $deps && \
    npm install -g yarn@${YARN_VERSION} && \
    npm cache -f clean && \
    rm -rf /var/lib/apt/lists/*

USER ${NODE_USER}

entrypoint ["npm"]
