FROM phusion/baseimage

RUN apt-get update && apt-get install -y git

RUN apt-get install -y build-essential wget libboost-dev libboost-system-dev

RUN rm -rf /tmp/sw2v/

RUN sed -i -e 's/^::1\slocalhost\s\(.*\)/::1 \1/' /etc/hosts

RUN git clone --recursive http://github.com/xiachenfeng/sw2v /tmp/sw2v

RUN cd /tmp/sw2v/ps-lite && make

RUN echo "begin build 2"

RUN cd /tmp/sw2v && make -f Makefile.ps

RUN mkdir -p /mnt/dcos

ENTRYPOINT ["/tmp/sw2v/sw2v"]

