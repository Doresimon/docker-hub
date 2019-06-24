# cmd

## docker

```
$ docker build . --tag ethnode
$ docker run --rm -it -p 8545:8545 -p 30303:30303 ethnode
$ docker run --rm -it -v $PWD/node:/root/eth ethnode

$ docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp [image] [cmd]
```

## geth

```
$ geth --rpc --rpccorsdomain "*" --rpcaddr 0.0.0.0 --networkid 6666 --nodiscover --verbosity 4

$ geth --rpc --rpccorsdomain "*" --rpcaddr 0.0.0.0 --networkid 6666 --nodiscover --verbosity 4 --unlock 0xB33A1E07A250B8390aA3B0528864754107f5016a,0x8AF96F264057285341d367f90E30Ab3B280C399A --password /root/eth/password --mine --miner.threads 1

$ geth --rpc --rpccorsdomain "*" --rpcaddr 0.0.0.0 --networkid 6666 --nodiscover --datadir /root/eth --verbosity 5 --identity "node_identity"
$ geth --rpc --rpccorsdomain "*" --rpcaddr 0.0.0.0 --networkid 6666 --nodiscover --datadir /root/eth --verbosity 4 --identity "node_identity"

$ geth --config ./dump.config.toml --rpc --rpccorsdomain * --rpcaddr 0.0.0.0 --debug --networkid 6666 --mine --minerthreads 1 --etherbase 0x0000000000000000000000000000000000000000
```
