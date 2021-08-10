# tron-docker
Dockerfile for tron


# Building

```bash
docker build -t tron .
```

# Running

```bash
# block dir
mkdir -p data
docker run --rm -itd --name trx -p 8090:8090 -p 8091:8091 -v `pwd`/data:/opt/coin/data tron
```


# Using block snapshot

Download from <https://backups.trongrid.io/> and extract (overwrite) to `data/blocks` before running.



# Using pre-built docker image

Using automated build image from <https://hub.docker.com/r/wshub/tron/>:

```bash
docker run --rm -itd --name trx -p 8090:8090 -p 8091:8091 -v `pwd`/data:/opt/coin/data wshub/tron
```
