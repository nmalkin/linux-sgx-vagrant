#!/bin/sh

set -ex

BASE=/tmp/sgxsetup

mkdir -p $BASE
cd $BASE
git clone https://github.com/01org/linux-sgx.git
cd linux-sgx
./download_prebuilt.sh
