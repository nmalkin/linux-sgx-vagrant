#!/bin/sh

set -ex

BASE=/tmp/sgxsetup

cd $BASE/linux-sgx
cd linux/installer/bin

CMD=`ls | grep sgx_linux_x64_sdk_`
bash $CMD <<EOF
no
/opt/intel
EOF

echo "source /opt/intel/sgxsdk/environment" >> /home/ubuntu/.bashrc
