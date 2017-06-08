FROM gsol/node:6.10.3-flow-2
MAINTAINER Global Solutions co., ltd.
LABEL version="1.3.1"

ENV NODE_USER=node
WORKDIR "/home/${NODE_USER}/app"

# git for @kadira/react-storybook
# expect for npm login
# g++, python, make for node-sass
# findutils for xargs and find
RUN chown ${NODE_USER}:${NODE_USER} .. -R && \
    deps="git ca-certificates expect g++ python make patch findutils" && \
    apk add --no-cache $deps && \
    rm -rf /var/lib/apt/lists/*

USER ${NODE_USER}

entrypoint ["npm"]
