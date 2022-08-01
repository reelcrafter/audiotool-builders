FROM --platform=linux/amd64 amazonlinux:latest
# FROM --platform=linux/arm64 amazonlinux:latest
RUN yum -y update
RUN yum -y install tar wget make gcc-c++ nasm pkgconfig gzip git zlib-devel

COPY ./build.sh build.sh
RUN chmod +x build.sh
RUN ./build.sh
