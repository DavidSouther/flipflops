#!/bin/sh
ROOTDIR="$(cd "$(dirname $0)" && pwd | sed 's!/build/deploy/mongo!!')"
source $ROOTDIR/env/environment.sh

sh $ROOTDIR/build/deploy/mongo/stop.sh

rm -rf $ROOTDIR/run/db

echo "Mongo DB dropped."
