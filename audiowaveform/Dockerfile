FROM --platform=linux/amd64 amazonlinux:latest
# FROM --platform=linux/arm64 amazonlinux:latest
RUN yum -y update
RUN yum -y install make cmake3 autogen automake libtool gcc gcc-c++ wget tar \
  gzip zip libcurl-devel zlib-static libpng-static xz git python-devel \
  bzip2-devel which gd-devel

COPY ./build.sh build.sh
RUN chmod +x build.sh
RUN ./build.sh
