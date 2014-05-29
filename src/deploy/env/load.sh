#!/bin/sh
ROOTDIR="$(cd "$(dirname $0)" && pwd | sed 's!/src/deploy/env!!')"

APPBRANCH=flipflops

ETC="$ROOTDIR/env"

rm -rf $ETC 2>/dev/null

git init $ETC >/dev/null && cd $ETC
git remote add secrets "git@github.com:DavidSouther/dotfiles.git" 2>/dev/null
git fetch secrets $APPBRANCH 2>/dev/null
git checkout FETCH_HEAD 2>/dev/null

[ "$1" ] && ln -s $1.sh environment.sh || echo "No default environment set."
