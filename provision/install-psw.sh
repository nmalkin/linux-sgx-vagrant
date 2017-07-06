#!/bin/sh

set -ex

BASE=/tmp/sgxsetup

# To use Trusted Platform Service functions:
# Ensure mei_me driver is enabled and /dev/mei0 exists.
cd /vagrant/provision
INSTALLER=iclsClient-1.45.449.12-1.x86_64.rpm
if [ -f $INSTALLER ]; then
    apt-get install alien
    alien --scripts $INSTALLER
    dpkg -i iclsclient_1.45.449.12-2_amd64.deb
    rm iclsclient_1.45.449.12-2_amd64.deb
else
    echo "WARNING: iclsClient client installer ($INSTALLER) missing."
    echo "Download it from https://software.intel.com/en-us/sgx-sdk/download and put it in the provision/ directory"
    echo "Skipping this step for now"
fi


# Download source code from dynamic-application-loader-host-interface project. In the source code folder, build and install the JHI service using the following commands:
cd $BASE
git clone https://github.com/01org/dynamic-application-loader-host-interface.git
cd dynamic-application-loader-host-interface
apt-get install -y uuid-dev libxml2-dev cmake pkg-config
cmake .;make;sudo make install;sudo systemctl enable jhi

cd $BASE/linux-sgx
cd linux/installer/bin

CMD=`ls | grep sgx_linux_x64_psw_`
bash $CMD
