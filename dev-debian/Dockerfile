FROM node:10.12.0
MAINTAINER Global Solutions co., ltd.
LABEL version="1.6.0"

ENV NODE_USER=node
WORKDIR "/home/${NODE_USER}/app"

# git for @kadira/react-storybook
RUN mkdir ../.cache/yarn -p && \
    chown ${NODE_USER}:${NODE_USER} .. -R && \
    deps="git ca-certificates patch" && \
    apt-get update && apt-get install --no-install-recommends -y $deps && \
    npm cache -f clean && \
    rm -rf /var/lib/apt/lists/*

USER ${NODE_USER}

entrypoint ["npm"]
