FROM gsol/node:6.9.1
MAINTAINER Global Solutions co., ltd.
LABEL version="0.6.2"

ENV NODE_USER=node
WORKDIR "/home/${NODE_USER}/app"

# git for @kadira/react-storybook
# libelf-dev, libelf1 for flow-bin
# expect for npm login
# g++ for fsevents (yarn install)
RUN adduser --disabled-login ${NODE_USER} && \
    mkdir ../.cache/yarn -p && \
    chown ${NODE_USER}:${NODE_USER} .. -R && \
    deps="git ca-certificates libelf-dev libelf1 expect g++" && \
    apt-get update && apt-get install --no-install-recommends -y $deps && \
    npm install -g yarn && \
    npm cache -f clean && \
    rm -rf /var/lib/apt/lists/*

USER ${NODE_USER}

entrypoint ["npm"]
