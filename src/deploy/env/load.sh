#!/bin/sh
ROOTDIR="$(cd "$(dirname $0)/../../.." && pwd)"

APPBRANCH=$(node -e 'console.log(require("./package").name)')

ETC="$ROOTDIR/env"

rm -rf $ETC 2>/dev/null

[ -z "$DOTREPO" ] && read -p 'DOTFILE Repo (remote reference): ' DOTREPO

git init $ETC >/dev/null && cd $ETC
git remote add secrets $DOTREPO 2>/dev/null
git fetch secrets $APPBRANCH 2>/dev/null
git checkout FETCH_HEAD 2>/dev/null

[ "$1" ] && ln -s $1.sh environment.sh || echo "No default environment set."
