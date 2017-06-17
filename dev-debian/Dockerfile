FROM node:6.11.0
MAINTAINER Global Solutions co., ltd.
LABEL version="0.2.0"

ENV NODE_USER=node
WORKDIR "/home/${NODE_USER}/app"

# git for @kadira/react-storybook
# expect for npm login
# g++, python, make for node-sass
RUN mkdir ../.cache/yarn -p && \
    chown ${NODE_USER}:${NODE_USER} .. -R && \
    deps="git ca-certificates expect g++ python make patch" && \
    apt-get update && apt-get install --no-install-recommends -y $deps && \
    npm cache -f clean && \
    rm -rf /var/lib/apt/lists/*

USER ${NODE_USER}

entrypoint ["npm"]
