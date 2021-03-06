ARG version=18.04

FROM ubuntu:$version

# Does prevent interactive questions on apt operations
ENV DEBIAN_FRONTEND=noninteractive

# Install the required packages for development. We do this in a single command
# so the cache of the layer is handled atomically.
#
# The `realpath` is specific for Ubuntu 14.04 as later it was included in
# `coreutils` package.
RUN apt-get update && \
    \
    apt-get install -y --no-install-recommends realpath || true && \
    apt-get install -y g++-arm-linux-gnueabihf gcc-arm-linux-gnueabihf && \
    \
    apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        chrpath \
        cpio \
        debianutils \
        diffstat \
        file \
        g++-multilib \
        gawk \
        gcc-multilib \
        git-core \
        glib-2.0-dev \
        iputils-ping \
        libegl1-mesa \
        libsdl1.2-dev \
        locales \
        openssh-client \
        openssl \
        python \
        python3 \
        socat \
        sudo \
        texinfo \
        unzip \
        wget \
        xterm \
        xz-utils \
        \
        jq \
        libncurses-dev \
        nano \
        procps \
        python3-lxml \
        rpm \
        tmux \
        xterm \
        \
        bc \
        bison \
        device-tree-compiler \
        flex \
        libssl-dev \
        lzop \
        python-dev \
        swig \
        \
        bash \
        zsh \
        && \
    rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR /
COPY entrypoint.sh .
COPY yocto-env .

ENTRYPOINT ["/entrypoint.sh"]
