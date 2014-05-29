#!/bin/sh
ROOTDIR="$(cd "$(dirname $0)" && pwd | sed 's!/build/deploy/node!!')"

source $ROOTDIR/env/environment.sh

PIDPATH=$ROOTDIR/run/node.pid

[ -f $PIDPATH ] || {
    echo "Node not running." ;
    exit 0 ;
}

kill $(cat $PIDPATH)
rm $PIDPATH

sh $ROOTDIR/build/deploy/mongo/stop.sh
