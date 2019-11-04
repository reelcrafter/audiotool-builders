FROM amazonlinux:latest
RUN yum -y install make cmake3 autogen automake libtool gcc gcc-c++ wget tar \
  gzip zip gd-devel flac-devel libvorbis-devel boost-devel libcurl-devel

# libid3tag
WORKDIR /root
RUN wget https://netix.dl.sourceforge.net/project/mad/libid3tag/0.15.1b/libid3tag-0.15.1b.tar.gz
RUN tar xzf libid3tag-0.15.1b.tar.gz
WORKDIR /root/libid3tag-0.15.1b
RUN sed -i 's/ -fforce-mem//' configure
RUN ./configure && make && make install

# libmad
WORKDIR /root
RUN wget https://netix.dl.sourceforge.net/project/mad/libmad/0.15.1b/libmad-0.15.1b.tar.gz
RUN tar xzf libmad-0.15.1b.tar.gz
WORKDIR /root/libmad-0.15.1b
RUN sed -i 's/ -fforce-mem//' configure
RUN ./configure && make && make install

# libsndfile (Amazon repo only has earlier 1.0.25 release)
# Requires autogen, automake, and libtool packages
WORKDIR /root
RUN wget https://github.com/erikd/libsndfile/archive/1.0.28.tar.gz
RUN tar xzf 1.0.28.tar.gz
WORKDIR /root/libsndfile-1.0.28
RUN sed -i 's/flac >= 1.3.1/flac >= 1.3.0/' configure.ac
RUN ./autogen.sh
RUN ./configure && make && make install

# aws-lambda-cpp (We only need this for the cmake module files,
# which provide aws_lambda_package_target for cma)
# Requires libcurl-devel package
WORKDIR /root
RUN wget https://github.com/awslabs/aws-lambda-cpp/archive/v0.2.4.tar.gz
RUN tar xzf v0.2.4.tar.gz
WORKDIR /root/aws-lambda-cpp-0.2.4
RUN mkdir build
WORKDIR /root/aws-lambda-cpp-0.2.4/build
RUN cmake3 .. -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF
RUN make && make install

# Finally, audiowaveform:
WORKDIR /root
RUN wget https://github.com/bbc/audiowaveform/archive/1.4.0.tar.gz
RUN tar xzf 1.4.0.tar.gz
WORKDIR /root/audiowaveform-1.4.0
RUN echo "list(APPEND CMAKE_MODULE_PATH \"/usr/local/lib/aws-lambda-runtime/cmake\")" >> CMakeLists.txt
RUN echo "find_package(aws-lambda-runtime REQUIRED)" >> CMakeLists.txt
RUN echo "aws_lambda_package_target(audiowaveform)" >> CMakeLists.txt
RUN mkdir build
WORKDIR /root/audiowaveform-1.4.0/build
RUN cmake3 -D ENABLE_TESTS=0 ..
RUN make
RUN make aws-lambda-package-audiowaveform

# AWS Lamda package file: /root/audiowaveform-1.4.0/build/audiowaveform.zip

# TODO: for audiowaveform to run after make install requires this in CMakeLists.txt:
# set_target_properties(audiowaveform PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE)
