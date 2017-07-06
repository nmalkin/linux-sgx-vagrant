#!/bin/sh

set -ex

BASE=/tmp/sgxsetup

cd $BASE/linux-sgx
make DEBUG=1
make sdk_install_pkg DEBUG=1
make psw_install_pkg DEBUG=1
