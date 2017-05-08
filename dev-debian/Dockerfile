FROM node:6.10.3
MAINTAINER Global Solutions co., ltd.
LABEL version="0.1.1"

ENV NODE_USER=node
WORKDIR "/home/${NODE_USER}/app"

# git for @kadira/react-storybook
# libelf-dev, libelf1 for flow-bin
# expect for npm login
# g++, python, make for node-sass
RUN mkdir ../.cache/yarn -p && \
    chown ${NODE_USER}:${NODE_USER} .. -R && \
    deps="git ca-certificates libelf-dev libelf1 expect g++ python make patch" && \
    apt-get update && apt-get install --no-install-recommends -y $deps && \
    npm install -g yarn@${YARN_VERSION} && \
    npm cache -f clean && \
    rm -rf /var/lib/apt/lists/*

USER ${NODE_USER}

entrypoint ["npm"]
