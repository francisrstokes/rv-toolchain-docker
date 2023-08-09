FROM ubuntu:18.04

ENV TOP /riscv/
ENV RISCV /riscv/build/
ENV PATH /opt/riscv/bin:${PATH}

RUN apt-get update
RUN apt-get install -y git

RUN git clone https://github.com/riscv/riscv-gnu-toolchain --recursive --depth 1 /riscv/

RUN apt-get install -y \
    autoconf \
    automake \
    autotools-dev \
    curl \
    libmpc-dev \
    libmpfr-dev  \
    libgmp-dev  \
    gawk  \
    build-essential  \
    bison  \
    flex  \
    texinfo  \
    gperf  \
    libtool  \
    patchutils  \
    bc  \
    zlib1g-dev  \
    libexpat-dev \
    python3 \
    python2.7

RUN cd /riscv/ && ./configure --prefix=/opt/riscv --enable-multilib
RUN cd /riscv/ && make linux -j4
RUN rm -rf /riscv
