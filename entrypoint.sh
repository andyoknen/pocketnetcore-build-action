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
mkdir $GITHUB_WORKSPACE/out
echo "1" > $GITHUB_WORKSPACE/out/1.txt
ln -s $GITHUB_WORKSPACE/out /out
ls -l /out/
/build -p $PLATFORM -b $BRANCH -d $DEPSBASE $tagarg
ls -l /out/
ls -l $GITHUB_WORKSPACE/out/
