# cmd

## docker

```bash
# build image
$ docker build . --tag ethnode
# run a container
$ docker run --rm -it -p 8545:8545 -p 30303:30303 ethnode

# run a container with file system mapping
$ docker run --rm -it -v $PWD/node:/root/eth ethnode
$ docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp [image] [cmd]
```

## geth

```bash
# in docker, start an eth private network and mining
# following 2 addresses own many eth coins, their private keys are located in ./src/*.key
$ geth --rpc --rpccorsdomain "*" --rpcaddr 0.0.0.0 --networkid 6666 --nodiscover --verbosity 3 --unlock 0xB33A1E07A250B8390aA3B0528864754107f5016a,0x8AF96F264057285341d367f90E30Ab3B280C399A --password /root/eth/password --mine --miner.threads 1
```
