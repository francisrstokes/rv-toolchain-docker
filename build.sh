#!/bin/sh

docker build --build-arg UID=$(id -u) -t francisstokes/rv-toolchain .
./generate-bin-dir.sh
