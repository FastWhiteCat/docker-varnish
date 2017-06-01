# Container with Varnish for Magento 2

Included:

- Varnish
- File configuration .vcl

## Description

Docker container Varnish for Magento 2 based on Alpine Linux.

## Quick Start

Run:

```bash
docker run -Pit --name=varnish fastwhitecat/varnish-docker
```
Run with configuration:

```bash
docker run -Pit --name=varnish \
        -e BACKEND_HOST="127.0.0.1" \
        -e BACKEND_PORT="8080" \
        -e ACL_PURGE_HOST="127.0.0.1" fastwhitecat/varnish-docker
```

Build:

```bash

docker build -t varnish .

```
