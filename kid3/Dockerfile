FROM amazonlinux:latest
RUN yum -y update
RUN yum -y install cmake3 wget tar xz git gcc-c++ nasm make automoc qt5-qtbase-static qt5-linguist qt5-qtmultimedia-devel libxslt docbook-style-xsl texinfo zlib-static

COPY ./build.sh build.sh
RUN chmod +x build.sh
RUN ./build.sh
