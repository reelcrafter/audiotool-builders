FROM amazonlinux:latest
RUN yum -y update
RUN yum -y install make cmake3 autogen automake libtool gcc gcc-c++ wget tar \
  gzip zip gd-devel flac-devel libvorbis-devel boost-devel libcurl-devel \
  zlib-static libpng-static xz git

COPY ./build.sh build.sh
RUN chmod +x build.sh
RUN ./build.sh
# just echo to throw out bad return code on previous command
RUN echo Done
