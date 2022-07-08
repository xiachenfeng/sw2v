FROM phusion/baseimage

RUN apt-get update && apt-get install -y git

RUN apt-get install -y build-essential wget libboost-dev libboost-system-dev

# wget ssl 问题
RUN echo "check_certificate = off" > /root/.wgetrc

# git ssl问题
RUN git config --global http.sslVerify false

RUN rm -rf /tmp/sw2v/

#http -> https
RUN git clone --recursive http://github.com/xiachenfeng/sw2v /tmp/sw2v

RUN cd /tmp/sw2v/ps-lite && make

RUN echo "begin build 2"

RUN cd /tmp/sw2v && make -f Makefile.ps

RUN mkdir -p /mnt/dcos

#ENTRYPOINT ["/tmp/sw2v/sw2v"]

