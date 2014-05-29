#!/bin/sh
ROOTDIR="$(cd "$(dirname $0)" && pwd | sed 's!/build/deploy/mongo!!')"
source $ROOTDIR/env/environment.sh

LOGPATH="$ROOTDIR/run/mongo.log"
PIDPATH="$ROOTDIR/run/mongo.pid"
DBPATH="$ROOTDIR/run/db"

[ -f "$PIDPATH" ] && {
    echo "Mongo already running (pid $(cat $PIDPATH))!";
    exit 0;
}

mkdir -p $DBPATH
mongod --fork \
    --config /dev/null \
    --dbpath $DBPATH \
    --logpath $LOGPATH \
    --pidfilepath $PIDPATH \
    --port $MONGO_PORT \
    $MONGO_OPTS

sleep 1
