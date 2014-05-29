#!/bin/sh
ROOTDIR="$(cd "$(dirname $0)" && pwd | sed 's!/build/deploy/node!!')"
echo "Starting in $ROOTDIR"

source $ROOTDIR/env/environment.sh

# Start mongo, if needed
sh $ROOTDIR/build/deploy/mongo/start.sh

# Check that we aren't already started
[ -f $ROOTDIR/run/node.pid ] && {
    echo "Node already running ($(cat $ROOTDIR/run/node.pid))!"
    exit 0;
}

[ -f $ROOTDIR/run/node.log ] && {
    LOG=$ROOTDIR/run/node.log
    TMP=$LOG.$(date +%Y-%m-%dT%H-%M-%S)
    echo "log file [${LOG}] exists; copied to temporary file [${TMP}]"
    mv $LOG $TMP
}

nohup \
node   $ROOTDIR/node_modules/.bin/supervisor \
    -w $ROOTDIR/build/server -e coffee \
       $ROOTDIR/build/deploy/node/start.js \
       >| $ROOTDIR/run/node.log 2>&1 </dev/null \
       &

echo $! >| $ROOTDIR/run/node.pid

echo "Combined out/err node log at $ROOTDIR/run/node.log"
