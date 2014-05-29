#!/bin/sh
ROOTDIR="$(cd "$(dirname $0)" && pwd | sed 's!/build/deploy/mongo!!')"
source $ROOTDIR/env/environment.sh

PIDPATH="$ROOTDIR/run/mongo.pid"

[ -f $PIDPATH ] || {
    echo "Mongo not running." ;
    exit 0 ;
}

kill $(cat $PIDPATH)
rm $PIDPATH
