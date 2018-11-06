# Container with Varnish for Magento 2

[![Docker Stars](https://img.shields.io/docker/stars/fastwhitecat/varnish.svg)](https://hub.docker.com/r/fastwhitecat/varnish/)
[![Docker Pulls](https://img.shields.io/docker/pulls/fastwhitecat/varnish.svg)](https://hub.docker.com/r/fastwhitecat/varnish/)

Included:

- Varnish 4.1.9
- File configuration .vcl

## Description

Docker container Varnish for Magento 2 based on Alpine Linux.

## Quick Start

Run:

```bash
docker run -Pit --name=varnish fastwhitecat/varnish
```
Run with configuration:

```bash
docker run -Pit --name=varnish \
        -e BACKEND_HOST="127.0.0.1" \
        -e BACKEND_PORT="8080" \
        -e MALLOC_SIZE="1G" \
        -e HTTP_RESP_HDR_LEN="8k" \
        -e HTTP_RESP_SIZE="32k" \
        -e WORKSPACE_BACKEND="64k" \
        -e THREAD_POOL_MIN="100" \
        -e THREAD_POOL_MAX="5000" \
        -e ACL_PURGE_HOST="127.0.0.1" \
        -e ACL_PURGE_PORT="" fastwhitecat/varnish
```

Build:

```bash

docker build -t varnish .

```
