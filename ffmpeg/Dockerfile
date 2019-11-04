FROM amazonlinux:latest
RUN yum -y update
RUN yum -y install tar wget make gcc-c++ nasm pkgconfig gzip git

COPY ./build.sh build.sh
RUN chmod +x build.sh
RUN ./build.sh
