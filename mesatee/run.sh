### on host machine ###
# install icls
sudo alien --scripts iclsClient-1.45.449.12-1.x86_64.rpm
sudo dpkg -i iclsclient_1.45.449.12-2_amd64.deb

# install jhi service 
sudo apt install -y cmake pkg-config uuid-dev libxml2-dev libsystemd-dev

git clone https://github.com/01org/dynamic-application-loader-host-interface.git
cd dynamic-application-loader-host-interface
cmake .
make
sudo make install

# build docker image
sudo docker build . -t sgx
# start container
sudo docker run --rm -it --device /dev/isgx --device /dev/mei0 -v /var/run/aesmd/aesm.socket:/var/run/aesmd/aesm.socket sgx


##### failed sample 
# 1. RemoteAttestation
# 2. SampleEnclavePCL