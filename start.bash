#!/bin/bash

CONFIG_DIR=CoiniumServ-config

mkdir -p "$CONFIG_DIR"
docker run -p 8888:80 --rm -it --mount type=volume,dst=/home/user/CoiniumServ/build/bin/Release/config,volume-driver=local,volume-opt=type=none,volume-opt=o=bind,volume-opt=device="$(pwd)/$CONFIG_DIR" dmp1ce/coiniumserv
