# courtesy of https://stackoverflow.com/a/71513191

ARG BASE_DEBIAN=ghcr.io/kidq330/mise_dockerfile:main
FROM $BASE_DEBIAN

# install dependencies
RUN \
    apt-get update -y && \
    apt-get install -y --no-install-recommends \
        curl \
        libnuma-dev \
        zlib1g-dev \
        libgmp-dev \
        libgmp10 \
        git \
        wget \
        lsb-release \
        software-properties-common \
        gnupg2 \
        apt-transport-https \
        gcc \
        autoconf \
        automake \
        build-essential

# install gpg keys
ARG GPG_KEY=7784930957807690A66EBDBE3786C5262ECB4A3F
RUN gpg --batch --keyserver keys.openpgp.org --recv-keys $GPG_KEY

# install ghcup
RUN \
    curl https://downloads.haskell.org/~ghcup/x86_64-linux-ghcup > /usr/bin/ghcup && \
    chmod +x /usr/bin/ghcup && \
    ghcup config set gpg-setting GPGStrict