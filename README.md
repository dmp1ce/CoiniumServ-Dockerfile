# Dockerized CoiniumServ

To run a CoiniumServ as a docker container, create a configuration directory to store the configuration file and then run the Docker container with a local host bind mount. Then edit the config file to meet your needs and restart the docker container.

For example:

```
mkdir CoiniumServ-config
docker run -p 8888:80 --rm -it --mount type=volume,dst=/home/user/CoiniumServ/build/bin/Release/config,volume-driver=local,volume-opt=type=none,volume-opt=o=bind,volume-opt=device=$(pwd)/CoiniumServ-config dmp1ce/coiniumserv
```

The press CTRL-C to cancel the process. Then edit the file in `CoiniumServ-config/config.json`, save changes, and run the server again with the same command.

```
docker run -p 8888:80 --rm -it --mount type=volume,dst=/home/user/CoiniumServ/build/bin/Release/config,volume-driver=local,volume-opt=type=none,volume-opt=o=bind,volume-opt=device=$(pwd)/CoiniumServ-config dmp1ce/coiniumserv
```

[See Stack Overflow answer for the reason for the complicated looking docker mount command.](https://stackoverflow.com/a/52167722/350221)

A `start.bash` script is included in the git repository where the Dockerfile lives. It will create the config folder and run the `docker run` command above. Just use `./start.bash`.

The CoiniumServ server should then be available at http://localhost:8888/.
