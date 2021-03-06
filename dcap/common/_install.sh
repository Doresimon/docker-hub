#!/bin/bash
# install lib & driver & sdk
# source ./_env.sh
# source ../common/_function.sh

# root required
if test $(id -u) -ne 0; then
    echo "Root privilege is required."
    exit 1
fi

# folder created by download.sh
cd $INSTALLER_DIR

# install driver
__fn__notice "install dcap dirver"
./$FNAME_SGX_LINUX_X64_DRIVER
__fn__notice_done

# install sdk, interactive operation required
__fn__notice "install sgx sdk"
echo -e "no\n$SGX_DIR" | ./$FNAME_SGX_LINUX_X64_SDK
source $SGX_DIR/sgxsdk/environment
__fn__notice_done

# install lib
__fn__notice "install enclave common loader"
sudo dpkg -i $FNAME_LIBSGX_ENCLAVE_COMMON
sudo dpkg -i $FNAME_LIBSGX_ENCLAVE_COMMON_DEV
__fn__notice "install dcap ql lib"
sudo dpkg -i $FNAME_LIBSGX_DCAP_QL $FNAME_LIBSGX_DCAP_QL_DEV
__fn__notice "install dcap default qpl lib"
sudo dpkg -i $FNAME_LIBSGX_DCAP_DEFAULT_QPL $FNAME_LIBSGX_DCAP_DEFAULT_QPL_DEV
__fn__notice "install dcap pccs"
__fn__ensure_node # node 
sudo dpkg -i $FNAME_LIBSGX_DCAP_PCCS
__fn__notice_done

# setup pccs service 
__fn__notice "setup dcap pccs"
sed -i "s/\"hosts\": \"127.0.0.1\"/\"hosts\": \"0.0.0.0\"/g" $PCCS_CONFIG_FILE
sed -i "s/\"ApiKey\": \"\"/\"ApiKey\": \"$DCAP_API_KEY\"/g" $PCCS_CONFIG_FILE
cd $CUR_DIR/keystore
__fn__gen_self_signed_cert
cp $CUR_DIR/keystore/file.crt $SGX_DIR/libsgx-dcap-pccs/
cp $CUR_DIR/keystore/private.pem $SGX_DIR/libsgx-dcap-pccs/

cd $SGX_DIR/libsgx-dcap-pccs
echo -e "$PCCS_TOKEN\n$PCCS_TOKEN" | sudo ./install.sh
__fn__notice_done

# change qpl config to dev mode
__fn__notice "change qpl config to dev mode"
sed -i "s/USE_SECURE_CERT=TRUE/USE_SECURE_CERT=FALSE/g" /etc/sgx_default_qcnl.conf
__fn__notice_done

__fn__notice "ALL DOWN"