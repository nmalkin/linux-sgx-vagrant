#!/bin/sh

set -ex

apt-get update
# required tools to build the Intel(R) SGX SDK:
apt-get install -y build-essential ocaml automake autoconf libtool wget python
# additional required tools to build the Intel(R) SGX PSW:
apt-get install -y libssl-dev libcurl4-openssl-dev protobuf-compiler libprotobuf-dev
