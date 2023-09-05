#!/usr/bin/env bash
set -o errexit

[ -n $PLATFORM ] || fail "No PLATFORM was supplied."
[ -n $BRANCH ] || fail "No BRANCH was supplied."
[ -n $DEPSBASE ] || fail "No DEPSBASE was supplied."

tagarg=""
if ! [[ $TAG = "" ]] ; then
    tagarg="-t ${TAG}"
fi

echo $GITHUB_WORKSPACE
ls -l $GITHUB_WORKSPACE/

mkdir $GITHUB_WORKSPACE/out
ln -s $GITHUB_WORKSPACE/out /out
/build -p $PLATFORM -b $BRANCH -d $DEPSBASE $tagarg

