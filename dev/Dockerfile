FROM gsol/node:6.10.3-flow
MAINTAINER Global Solutions co., ltd.
LABEL version="1.3.0"

ENV NODE_USER=node
WORKDIR "/home/${NODE_USER}/app"

# git for @kadira/react-storybook
# expect for npm login
# g++, python, make for node-sass
# findutils for xargs, find
RUN chown ${NODE_USER}:${NODE_USER} .. -R && \
    deps="git ca-certificates expect g++ python make patch findutils" && \
    apk add --no-cache $deps && \
    rm -rf /var/lib/apt/lists/*

USER ${NODE_USER}

entrypoint ["npm"]
