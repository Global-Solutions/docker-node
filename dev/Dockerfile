FROM node:6.7.0-slim
MAINTAINER Global Solutions co., ltd.
LABEL version="0.1.0"

ENV NODE_USER=node

# git for @kadira/react-storybook
# libelf-dev, libelf1 for flow-bin
RUN adduser --disabled-login ${NODE_USER} && \
    apt-get update && apt-get install --no-install-recommends -y git libelf-dev libelf1

WORKDIR "/home/${NODE_USER}/app"
USER ${NODE_USER}

entrypoint ["npm"]
