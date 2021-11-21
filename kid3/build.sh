#!/bin/sh

### THIS IS IN A NON-WORKING STATE - WORK IN PROGRESS ###

set -ex

git clone https://github.com/irwir/id3lib.git
cd id3lib
sh configure
make -j6 install
cd /

git clone https://github.com/taglib/taglib.git
cd taglib
cmake3 -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_BUILD_TYPE=Release .
make -j6 install
cd /

wget http://ftp.gnu.org/gnu/gengetopt/gengetopt-2.23.tar.xz
tar xf gengetopt-2.23.tar.xz
cd gengetopt-2.23
sh configure
make -j6 install
cd /

git clone https://github.com/qt/qt5.git
cd qt5
./init-repository
sh configure -static -release -no-pch -prefix /notsure -skip webengine -nomake tools -nomake tests -nomake examples
make -j6 install
cd /

git clone https://github.com/KDE/kid3.git
cd kid3
#cmake3 . -DCMAKE_BUILD_TYPE=MinSizeRel -DWITH_APPS=CLI -DWITH_VORBIS=OFF -DWITH_FLAC=OFF -DWITH_CHROMAPRINT=OFF -DWITH_DBUS=OFF -DWITH_READLINE=OFF -DQT_MOC_EXECUTABLE=/usr/bin/automoc4 -DBUILD_SHARED_LIBS=OFF
cmake3 . -DCMAKE_BUILD_TYPE=Release -DWITH_APPS=CLI -DWITH_VORBIS=OFF -DWITH_FLAC=OFF -DWITH_CHROMAPRINT=OFF -DWITH_DBUS=OFF -DWITH_READLINE=OFF -DBUILD_SHARED_LIBS=OFF
sed -i '/#include "kid3api.h"/s/^/#include <QByteArray>\n/' src/core/model/coretaggedfileiconprovider.h
make
