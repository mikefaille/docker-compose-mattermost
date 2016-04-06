#!/bin/bash

# DB_IP=$(getent ahosts db | head -n 1 | cut -f 1 -d " " )
# ETCD_IP=$(getent ahosts etcd | head -n 1 | cut -f 1 -d " " )

echo -ne "Configure database connection..."

cd /data/templates; confd -onetime -backend etcd -node http://etcd:4001


# if [ ! -f $config ]
# then
#     cp /config.template.json $config
#     sed -Ei "s/DB_PORT/$DB_PORT_5432_TCP_PORT" $config
#     echo OK
# else
#     echo SKIP
# fi

echo "Wait until database is ready..."

# DB_IP=$(getent ahosts db | head -n 1 | cut -f 1 -d " " )
#DB_PORT_5432_TCP_PORT=5432
</dev/tcp/db/$DB_PORT_5432_TCP_PORT
if [ "$?" -ne 0 ]; then
    echo "Connection to $SERVER on port $PORT failed"
    sleep 1
    exit 1
else
    echo "Connection to $SERVER on port $PORT succeeded"
    exit 0
fi


echo "Starting platform"
cd /mattermost/bin
./platform
