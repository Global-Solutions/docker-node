FROM node:6.10.3-alpine
MAINTAINER Global Solutions co., ltd.
LABEL version="1.2.0"

ENV NODE_USER=node
WORKDIR "/home/${NODE_USER}/app"

# git for @kadira/react-storybook
# expect for npm login
# g++, python, make for node-sass
RUN chown ${NODE_USER}:${NODE_USER} .. -R && \
    deps="git ca-certificates expect g++ python make patch" && \
    apk add --no-cache $deps && \
    rm -rf /var/lib/apt/lists/*

USER ${NODE_USER}

entrypoint ["npm"]
