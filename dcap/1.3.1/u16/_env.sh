#!/bin/bash

SGX_DOWNLOAD_URL_BASE="https://download.01.org/intel-sgx/sgx-dcap/1.3.1/linux/distro/ubuntuServer16.04/"

# download file name
LIBSGX_DCAP_DEFAULT_QPL_DEV=libsgx-dcap-default-qpl-dev_1.3.101.3-xenial1_amd64.deb
LIBSGX_DCAP_DEFAULT_QPL=libsgx-dcap-default-qpl_1.3.101.3-xenial1_amd64.deb
LIBSGX_DCAP_PCCS=libsgx-dcap-pccs_1.3.101.3-xenial1_amd64.deb
LIBSGX_DCAP_QL_DEV=libsgx-dcap-ql-dev_1.3.101.3-xenial1_amd64.deb
LIBSGX_DCAP_QL=libsgx-dcap-ql_1.3.101.3-xenial1_amd64.deb
LIBSGX_ENCLAVE_COMMON_DEV=libsgx-enclave-common-dev_2.7.101.3-xenial1_amd64.deb
LIBSGX_ENCLAVE_COMMON=libsgx-enclave-common_2.7.101.3-xenial1_amd64.deb
SGX_LINUX_X64_DRIVER=sgx_linux_x64_driver_1.20.bin
SGX_LINUX_X64_SDK=sgx_linux_x64_sdk_2.7.101.3.bin

# download url
LIBSGX_DCAP_DEFAULT_QPL_DEV_URL="$SGX_DOWNLOAD_URL_BASE/$LIBSGX_DCAP_DEFAULT_QPL_DEV"
LIBSGX_DCAP_DEFAULT_QPL_URL="$SGX_DOWNLOAD_URL_BASE/$LIBSGX_DCAP_DEFAULT_QPL"
LIBSGX_DCAP_PCCS_URL="$SGX_DOWNLOAD_URL_BASE/$LIBSGX_DCAP_PCCS"
LIBSGX_DCAP_QL_DEV_URL="$SGX_DOWNLOAD_URL_BASE/$LIBSGX_DCAP_QL_DEV"
LIBSGX_DCAP_QL_URL="$SGX_DOWNLOAD_URL_BASE/$LIBSGX_DCAP_QL"
LIBSGX_ENCLAVE_COMMON_DEV_URL="$SGX_DOWNLOAD_URL_BASE/$LIBSGX_ENCLAVE_COMMON_DEV"
LIBSGX_ENCLAVE_COMMON_URL="$SGX_DOWNLOAD_URL_BASE/$LIBSGX_ENCLAVE_COMMON"
SGX_LINUX_X64_DRIVER_URL="$SGX_DOWNLOAD_URL_BASE/$SGX_LINUX_X64_DRIVER"
SGX_LINUX_X64_SDK_URL="$SGX_DOWNLOAD_URL_BASE/$SGX_LINUX_X64_SDK"

# saved file name
FNAME_LIBSGX_DCAP_DEFAULT_QPL_DEV=libsgx-dcap-default-qpl-dev
FNAME_LIBSGX_DCAP_DEFAULT_QPL=libsgx-dcap-default-qpl
FNAME_LIBSGX_DCAP_PCCS=libsgx-dcap-pccs
FNAME_LIBSGX_DCAP_QL_DEV=libsgx-dcap-ql-dev
FNAME_LIBSGX_DCAP_QL=libsgx-dcap-ql
FNAME_LIBSGX_ENCLAVE_COMMON_DEV=libsgx-enclave-common-dev
FNAME_LIBSGX_ENCLAVE_COMMON=libsgx-enclave-common
FNAME_SGX_LINUX_X64_DRIVER=sgx_linux_x64_driver.bin
FNAME_SGX_LINUX_X64_SDK=sgx_linux_x64_sdk.bin

# cur dir
CUR_DIR=$PWD

# downloaded file dir
INSTALLER_DIR=./installers

# SGX_DIR
SGX_DIR=/opt/intel

# pccs token => change this please
PCCS_TOKEN=1024
# pccs config file
PCCS_CONFIG_FILE=$SGX_DIR/libsgx-dcap-pccs/config/default.json # ^1.3

# api key
DCAP_API_KEY=17486f2b6a50461dace70550b246dea5
