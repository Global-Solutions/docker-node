FROM ubuntu:xenial-20161121
MAINTAINER Global Solutions co., ltd.
LABEL version="0.3.2"

ENV NPM_CONFIG_LOGLEVEL=info \
    NODE_VERSION=6.9.2

# forked from https://github.com/nodejs/docker-node
# gpg keys listed at https://github.com/nodejs/node
RUN set -ex && \
    for key in \
      9554F04D7259F04124DE6B476D5A82AC7E37093B \
      94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
      0034A06D9D9B0064CE8ADF6BF1747F4AD2306D93 \
      FD3A5288F042B6850C66B31F09FE44734EB7990E \
      71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
      DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
      B9AE9905FFD7803F25714661B63B535A4C206CA9 \
      C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
    ; do \
      gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
    done && \
    buildDeps="xz-utils curl ca-certificates" && \
    nodeVer="v${NODE_VERSION}" && \
    dlBase="https://nodejs.org/dist/$nodeVer" && \
    tarName="node-$nodeVer-linux-x64.tar.xz" && \
    binDL="$dlBase/$tarName" && \
    shaName="SHASUMS256.txt" && \
    encShaName="$shaName.asc" && \
    shaDL="$dlBase/$encShaName" && \
    set -x && \
    apt-get update && apt-get install -y $buildDeps --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* && \
    curl -SLO  $binDL && \
    curl -SLO  $shaDL && \
    gpg --batch --decrypt --output $shaName $encShaName && \
    grep " $tarName\$" $shaName | sha256sum -c - && \
    tar -xJf "$tarName" -C /usr/local --strip-components=1 && \
    rm "$tarName" $encShaName $shaName && \
    apt-get purge -y --auto-remove $buildDeps && \
    ln -s /usr/local/bin/node /usr/local/bin/nodejs

CMD [ "node" ]

