#!/bin/sh
ROOTDIR="$(cd "$(dirname $0)/../../.." && pwd)"

[ -d env ] && [ -f env/environment.sh ] && source $ROOTDIR/env/environment.sh

# Not testing for passenger, there are better ways to kill it?

PIDPATH=$ROOTDIR/run/node.pid

[ -f $PIDPATH ] || {
    echo "Node not running." ;
    exit 0 ;
}

kill $(cat $PIDPATH)
rm $PIDPATH
