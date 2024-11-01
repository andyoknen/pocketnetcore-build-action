#!/usr/bin/env bash
set -o errexit

[ -n $PLATFORM ] || fail "No PLATFORM was supplied."
[ -n $BRANCH ] || fail "No BRANCH was supplied."

tagarg=""
if ! [[ $TAG = "" ]] ; then
    tagarg="-t ${TAG}"
fi

/build -p $PLATFORM -b $BRANCH $tagarg

mkdir $GITHUB_WORKSPACE/out
cp /out/* $GITHUB_WORKSPACE/out/
