#!/bin/sh
ROOTDIR="$(cd "$(dirname $0)" && pwd | sed 's!/build/deploy/mongo!!')"
source $ROOTDIR/env/environment.sh
SNAPS=$ROOTDIR/snapshots

sh $ROOTDIR/build/deploy/mongo/start.sh

mkdir "$SNAPS"
TAG=${NODE_ENV}_$(date +%Y-%m-%dT%H-%M-%S)
set -x
cd "$SNAPS"
mongodump --port $MONGO_PORT --out $TAG
tar czf $TAG.tgz $TAG
rm -rf $TAG
