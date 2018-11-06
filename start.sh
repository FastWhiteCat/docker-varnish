#!/bin/sh

CONF_FILE="/etc/varnish/varnish.vcl"
SECRET_FILE="/etc/varnish/secret"

if [ -z "$MALLOC_SIZE" ]; then
    MALLOC_SIZE="1G"
fi

[ -z "$ACL_PURGE_HOST" ] && ACL_PURGE_HOST="127.0.0.1"
[ -z "$ACL_PURGE_PORT" ] && ACL_PURGE_PORT=""

[ -z "$THREAD_POOL_MIN" ] && THREAD_POOL_MIN=100
[ -z "$THREAD_POOL_MAX" ] && THREAD_POOL_MAX=5000

[ -z "$HTTP_RESP_HDR_LEN" ] && HTTP_RESP_HDR_LEN=8k
[ -z "$HTTP_RESP_SIZE" ] && HTTP_RESP_SIZE=32k

[ -z "$WORKSPACE_BACKEND" ] && WORKSPACE_BACKEND=64k
[ -z "$WORKSPACE_CLIENT" ] && WORKSPACE_CLIENT=64k

[ -n "$BACKEND_HOST" ] && sed -i "s/.*.host\ \=\ .*/.host\ \=\ \"$BACKEND_HOST\";/" $CONF_FILE
[ -n "$BACKEND_PORT" ] && sed -i "s/.*.port\ \=\ .*/.port\ \=\ \"$BACKEND_PORT\";/" $CONF_FILE

[ -n "$ACL_PURGE_HOST" ] && sed -i "s/acl_host/$ACL_PURGE_HOST/" $CONF_FILE

sed -i "s/acl_port/$ACL_PURGE_PORT/" $CONF_FILE

varnishd -f $CONF_FILE \
    -p thread_pool_min=$THREAD_POOL_MIN \
    -p thread_pool_max=$THREAD_POOL_MAX \
    -p http_resp_hdr_len=$HTTP_RESP_HDR_LEN \
    -p http_resp_size=$HTTP_RESP_SIZE \
    -p workspace_backend=$WORKSPACE_BACKEND \
    -p workspace_client=$WORKSPACE_CLIENT \
    -S $SECRET_FILE -F \
    -s malloc,$MALLOC_SIZE
