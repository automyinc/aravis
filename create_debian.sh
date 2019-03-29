#!/bin/bash

VERSION=$(cat VERSION)
ARCH=$(uname -m)
DIST=$(cat ~/DIST)
DST=libaravis-$VERSION-$ARCH-$DIST

rm -rf $DST
mkdir -p $DST/DEBIAN
mkdir -p $DST/usr

echo "Version: $VERSION" > $DST/DEBIAN/control
cat $ARCH/debian/control >> $DST/DEBIAN/control
cat debian/control >> $DST/DEBIAN/control

./make_install.sh --prefix=$PWD/$DST/usr

dpkg-deb --build $DST

mv ${DST}.deb $ARCH/

rm -rf $DST

