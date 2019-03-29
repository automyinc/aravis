#!/bin/bash

./autogen.sh --enable-usb $@

make -j8 install

