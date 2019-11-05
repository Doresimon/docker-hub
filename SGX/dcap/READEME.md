# dcap environment set up

## for intel sgx & dcap

- library and tool

```bash
sudo apt-get update
# ubuntu 16
sudo apt-get install \
build-essential ocaml automake autoconf libtool wget python libssl-dev libcurl4-openssl-dev protobuf-compiler libprotobuf-dev debhelper cmake zip alien dkms
# ubuntu 18
sudo apt-get install \
build-essential ocaml ocamlbuild automake autoconf libtool wget python libssl-dev libcurl4-openssl-dev protobuf-compiler libprotobuf-dev debhelper cmake zip alien
```

- nodejs >= 10

```bash
# Using Ubuntu
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
```

## for mesatee

```bash
# install Libs
sudo apt-get install \
    build-essential \
    ocaml ocamlbuild \
    automake autoconf \
    libtool \
    wget \
    python \
    libssl-dev libcurl4-openssl-dev \
    protobuf-compiler libprotobuf-dev \
    sudo \
    kmod \
    vim \
    curl \
    git-core \
    libprotobuf-c0-dev \
    libboost-thread-dev \
    libboost-system-dev \
    liblog4cpp5-dev \
    libjsoncpp-dev \
    alien \
    uuid-dev \
    libxml2-dev \
    cmake \
    pkg-config \
    expect \
    systemd-sysv \
    gdb \
    debhelper \
    zip

# install Rust
export RUST_TOOLCHAIN=nightly-2019-08-01
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
    . $HOME/.cargo/env                                                      && \
    rustup default $RUST_TOOLCHAIN                                          && \
    rustup component add rust-src rls rust-analysis clippy rustfmt          && \
    rustup target install aarch64-unknown-linux-gnu                         && \
    cargo install xargo                                                     && \
    cargo install sccache
```

## mei check

https://www.intel.com/content/www/us/en/support/products/34227/software/chipset-software/intel-management-engine.html
