FROM ubuntu:xenial
MAINTAINER Rex Tsai <rex.cc.tsai@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y vim
RUN apt-get install -y \
        make \
        cmake \
        g++ \
        git-core \
        libboost-dev \
        libboost-system-dev \
        libboost-filesystem-dev \
        libexpat1-dev \
        zlib1g-dev \
        libbz2-dev \
        libpq-dev \
        libgeos-dev \
        libgeos++-dev \
        libproj-dev \
        lua5.2 \
        liblua5.2-dev && \
        rm -rf /var/lib/apt/lists/*

ENV OSM2PGSQL_VERSION 0.90.0
RUN cd /root && git clone --depth 1 --branch $OSM2PGSQL_VERSION https://github.com/openstreetmap/osm2pgsql.git && \
    mkdir -p osm2pgsql/build && \
    cd osm2pgsql/build  && \
    cmake .. && make install

ENTRYPOINT ["/bin/bash"]
