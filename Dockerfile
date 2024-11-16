FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y git make automake gcc libtool pkg-config python3-dev libglib2.0-dev

RUN git clone https://github.com/bieganski/atk_libsigrokdecode
WORKDIR atk_libsigrokdecode

RUN bash autogen.sh
RUN ./configure
RUN make -j6