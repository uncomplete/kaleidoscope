FROM ubuntu:20.04 as base

RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y locales
RUN locale-gen en_US.UTF-8  
ENV LANG=en_US.UTF-8  
ENV LANGUAGE=en_US:en  
ENV LC_ALL=en_US.UTF-8

ENV DEBIAN_FRONTEND=noninteractive
# Clang requirements
RUN apt-get install -qqy --no-install-recommends \
        ca-certificates \ 
        dpkg-dev file make patch cmake \
        libc-dev libc++-dev libgcc-9-dev libstdc++-9-dev  \
        dirmngr gnupg wget curl lbzip2 xz-utils libtinfo5 zlib1g-dev && \
    ln -s /usr/lib/x86_64-linux-gnu/libtinfo.so.6.2 /usr/lib/x86_64-linux-gnu/libtinfo.so

# Install Clang and LLVM
# Version info
ENV LLVM_RELEASE 12
ENV LLVM_VERSION 12.0.0
COPY install-llvm.sh .
RUN bash install-llvm.sh
