FROM gsol/node:6.11.3-flow
MAINTAINER Global Solutions co., ltd.
LABEL version="2.1.1"

ENV NODE_USER=node
WORKDIR "/home/${NODE_USER}/app"

# git for @kadira/react-storybook
# findutils for xargs and find
RUN chown ${NODE_USER}:${NODE_USER} .. -R && \
    deps="git ca-certificates patch findutils" && \
    apk add --no-cache $deps && \
    rm -rf /var/lib/apt/lists/*

USER ${NODE_USER}

entrypoint ["npm"]
