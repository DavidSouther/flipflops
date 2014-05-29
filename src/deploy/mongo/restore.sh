#!/bin/sh
ROOTDIR="$(cd "$(dirname $0)" && pwd | sed 's!/build/deploy/mongo!!')"
source $ROOTDIR/env/environment.sh

SNAP="$1"

[ -z "$1" ] && {
    # List snapshot files and their sizes in a menu format.
    ls -oh $ROOTDIR/snapshots | fgrep -iv total | awk '{ print $8 "\t" $4 }' | cat -n
    read -p 'Which snapshot? ' N
    SNAP=$(ls $ROOTDIR/snapshots | head -n $N | tail -n 1)
}

SNAPDIR=${SNAP%\.*}

sh $ROOTDIR/build/deploy/mongo/start.sh

cd $ROOTDIR/snapshots
tar xf $SNAP
mongorestore --port $MONGO_PORT $SNAPDIR
rm -rf $SNAPDIR
