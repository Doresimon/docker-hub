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

$ geth --rpc --rpccorsdomain "*" --rpcaddr 0.0.0.0 --networkid 6666 --nodiscover --datadir /root/eth --verbosity 5 --identity "node_identity"
$ geth --rpc --rpccorsdomain "*" --rpcaddr 0.0.0.0 --networkid 6666 --nodiscover --datadir /root/eth --verbosity 4 --identity "node_identity"

$ geth --config ./dump.config.toml --rpc --rpccorsdomain * --rpcaddr 0.0.0.0 --debug --networkid 6666 --mine --minerthreads 1 --etherbase 0x0000000000000000000000000000000000000000
```
