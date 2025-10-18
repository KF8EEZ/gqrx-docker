FROM ubuntu:24.04

ARG GQRX_VERSION=2.17.7

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    qtcreator \
    qtbase5-dev \
    qt5-qmake \
    qttools5-dev \
    libqt5svg5-dev \
    libqt5x11extras5-dev \
    gnuradio \
    gr-osmosdr \
    pulseaudio \
    gstreamer1.0-pulseaudio \
    libpulse-dev \
    cmake \
    less \
    wget

RUN mkdir -p /opt/gqrx && \
    cd /opt/gqrx &&\
    wget https://github.com/gqrx-sdr/gqrx/archive/refs/tags/v$GQRX_VERSION.tar.gz && \
    tar xf v$GQRX_VERSION.tar.gz

RUN cd /opt/gqrx/gqrx-$GQRX_VERSION && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install    



# # Build and install
# RUN cd /opt/gqrx/src/build && \
#     cmake .. && \
#     make && \
#     make install

