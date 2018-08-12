#!/bin/sh

CONF_FILE="/etc/varnish/varnish.vcl"
SECRET_FILE="/etc/varnish/secret"

if [ -z "$MALLOC_SIZE" ]; then
    MALLOC_SIZE="1G"
fi

[ -z "$ACL_PURGE_HOST" ] && ACL_PURGE_HOST="127.0.0.1"
[ -z "$ACL_PURGE_PORT" ] && ACL_PURGE_PORT=""

[ -n "$BACKEND_HOST" ] && sed -i "s/.*.host\ \=\ .*/.host\ \=\ \"$BACKEND_HOST\";/" $CONF_FILE
[ -n "$BACKEND_PORT" ] && sed -i "s/.*.port\ \=\ .*/.port\ \=\ \"$BACKEND_PORT\";/" $CONF_FILE
[ -n "$ACL_PURGE_HOST" ] && sed -i "s/acl_host/$ACL_PURGE_HOST/" $CONF_FILE

sed -i "s/acl_port/$ACL_PURGE_PORT/" $CONF_FILE


varnishd -f $CONF_FILE \
    -S $SECRET_FILE -F \
    -s malloc,$MALLOC_SIZE
