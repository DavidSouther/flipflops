#!/bin/sh
ROOTDIR="$(cd "$(dirname $0)/../../.." && pwd)"
echo "Starting in $ROOTDIR"

cd $ROOTDIR

[ -d env ] && [ -f env/environment.sh ] && source $ROOTDIR/env/environment.sh

if [ -x "$(which passenger)" ] ; then
    passenger start
else
    [ -d $ROOTDIR/run ] || mkdir $ROOTDIR/run

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
        -w $ROOTDIR/src/server -e coffee \
           $ROOTDIR/app.js \
           >| $ROOTDIR/run/node.log 2>&1 </dev/null \
           &

    echo $! >| $ROOTDIR/run/node.pid

    echo "Combined out/err node log at $ROOTDIR/run/node.log"
fi
