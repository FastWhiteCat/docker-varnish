#!/bin/sh

CONF_FILE="/etc/varnish/varnish.vcl"

[ -z "$ACL_PURGE_HOST" ] && ACL_PURGE_HOST="127.0.0.1"

[ -n "$BACKEND_HOST" ] && sed -i "s/.*.host\ \=\ .*/.host\ \=\ \"$BACKEND_HOST\";/" $CONF_FILE
[ -n "$BACKEND_PORT" ] && sed -i "s/.*.port\ \=\ .*/.port\ \=\ \"$BACKEND_PORT\";/" $CONF_FILE
[ -n "$ACL_PURGE_HOST" ] && sed -i "s/.*acl_host.*/\"$ACL_PURGE_HOST\";/" $CONF_FILE

varnishd -f $CONF_FILE -F
