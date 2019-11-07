#!/bin/bash
sudo apt update

sudo apt-get install -y -q \
build-essential ocaml automake autoconf libtool wget python libssl-dev libcurl4-openssl-dev protobuf-compiler libprotobuf-dev debhelper cmake zip alien dkms
