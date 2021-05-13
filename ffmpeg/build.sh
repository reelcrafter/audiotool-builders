#!/bin/sh

set -ex

# Build libmp3lame
wget https://sourceforge.net/projects/lame/files/lame/3.100/lame-3.100.tar.gz/download -O lame.tar.gz
tar xf lame.tar.gz
cd lame-3.100
./configure --disable-shared --enable-static --libdir=/lib64
make install
cd /

git clone https://github.com/FFmpeg/FFmpeg.git
cd FFmpeg
./configure --disable-everything --disable-doc --enable-static \
  --enable-decoder=pcm*,flac,mp3,wavpack,aac --enable-libmp3lame --enable-gpl \
  --enable-nonfree --enable-encoder=libmp3lame \
  --enable-muxer=hls,segment,tee,mp3,ffmetadata \
  --enable-demuxer=wav,mp3,mov,aiff,ffmetadata --enable-protocol=file,pipe \
  --enable-filter=aresample,afade
make
