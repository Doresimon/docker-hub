# mesatee

## setup

首先, 宿主机要装好 `sgx driver 2.6`, `sgx sdk 2.6`, `aesmd`, `jhi`

```bash
# build docker 镜像, 漫长的等待.........
sudo docker build . -t mesatee

# 使用 新创建的 mesatee 镜像创建容器, 挂载2个设备: /dev/isgx, /dev/mei0
sudo docker run --rm -it --device /dev/isgx --device /dev/mei0 -v /var/run/aesmd/aesm.socket:/var/run/aesmd/aesm.socket mesatee
# or 挂载本地文件系统
sudo docker run --rm -it --device /dev/isgx --device /dev/mei0 -v /var/run/aesmd/aesm.socket:/var/run/aesmd/aesm.socket -v ~/halo/doresimon/mesatee:/root/dev/mesatee mesatee
# or 直接进入已创建的容器
sudo docker exec -it $CONTAINER_ID /bin/bash

# 创建 ias_spid 和 ias_key
echo "1825E5672DE30E2F0C29C0CCBD193B74" > /root/mesatee/bin/ias_spid.txt
echo "3e8c48b2c12344b7807fd25761d06067" > /root/mesatee/bin/ias_key.txt

# 编译 4 个服务
mkdir /root/mesatee/build
cd /root/mesatee/build
cmake -DSGX_SDK=/opt/intel/sgxsdk -DSGX_MODE=HW -DCMAKE_BUILD_TYPE=DEBUG ..
make tms tdfs kms fns
make quickstart

# 启动 mesatee 的 4 个服务: tms, tdfs, fns, kms
cd /root/mesatee/
./service.sh start

# 随便测试一个 example
cd /root/mesatee/example/quickstart
./run.sh
# 输出如下
# [+] This is a single-party task: echo
# haha
# [+] successfully invoke single-party task echo
# [+] This is a multi-party task: psi
# ["a492f934-d9e0-4fa8-8fc1-f137cfba0379"]
# Ok([0, 1, 1, 0])
# [+] successfully invoke multi-party task psi
```
