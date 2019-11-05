#!/bin/bash
# OS=ubuntu 18.04

source ./_env.sh
source ../common/_function.sh

# root required
if test $(id -u) -ne 0; then
    echo "Root privilege is required."
    exit 1
fi

__fn__notice "stop aesmd"
sudo service aesmd stop
__fn__notice_done

__fn__notice "stop pccs"
sudo pm2 stop pccs
sudo pm2 stop pccs_server
__fn__notice_done

__fn__notice "uninstall sdk"
sudo $SGX_DIR/sgxsdk/uninstall.sh
__fn__notice_done

__fn__notice "uninstall driver"
sudo $SGX_DIR/sgxdriver/uninstall.sh
__fn__notice_done


__fn__notice "uninstall libs"
sudo dpkg -r $FNAME_LIBSGX_DCAP_PCCS
sudo dpkg -r $FNAME_LIBSGX_DCAP_DEFAULT_QPL $FNAME_LIBSGX_DCAP_DEFAULT_QPL_DEV
sudo dpkg -r $FNAME_LIBSGX_DCAP_QL $FNAME_LIBSGX_DCAP_QL_DEV
sudo dpkg -r $FNAME_LIBSGX_ENCLAVE_COMMON $FNAME_LIBSGX_ENCLAVE_COMMON_DEV

sudo dpkg --purge $FNAME_LIBSGX_DCAP_PCCS
sudo dpkg --purge $FNAME_LIBSGX_DCAP_DEFAULT_QPL
sudo dpkg --purge $FNAME_LIBSGX_ENCLAVE_COMMON

sudo rm -rf $SGX_DIR/libsgx-dcap-pccs
__fn__notice_done

__fn__notice "ALL DONE"