FROM ubuntu:18.04
LABEL Boris Mansencal boris.mansencal@labri.fr

RUN sed -i 's/ports.ubuntu.com/mirrors.huaweicloud.com/g' /etc/apt/sources.list \
    && apt-get update \
    && DEBIAN_FRONTEND="noninteractive" \
        apt-get install -y -q tzdata wget unzip libc++-dev libc++abi-dev libopencv-dev \
        qtbase5-dev qtdeclarative5-dev libqt5xmlpatterns5-dev cmake


# RUN wget https://github.com/DocCreator/DocCreator/archive/master.zip
# RUN unzip master.zip
ADD . ./DocCreator

RUN cd DocCreator && mkdir build && cd build \
    && cmake -DBUILD_OTHER_PROGS=ON .. \
    && make && make install

