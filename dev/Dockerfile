FROM gsol/node:6.9.1
MAINTAINER Global Solutions co., ltd.
LABEL version="0.5.0"

ENV NODE_USER=node
WORKDIR "/home/${NODE_USER}/app"

# git for @kadira/react-storybook
# libelf-dev, libelf1 for flow-bin
# expect for npm login
RUN adduser --disabled-login ${NODE_USER} && \
    chown ${NODE_USER}:${NODE_USER} .. -R && \
    deps="git ca-certificates libelf-dev libelf1 expect" && \
    apt-get update && apt-get install --no-install-recommends -y $deps && \
    rm -rf /var/lib/apt/lists/*

USER ${NODE_USER}

entrypoint ["npm"]
