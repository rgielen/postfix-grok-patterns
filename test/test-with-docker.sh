#!/usr/bin/env bash

ORIGDIR=$(pwd)
TESTDIR=$(dirname $0)
TESTDIR_RELATIVE=$(basename $TESTDIR)

cd $TESTDIR; cd ..

docker build -t postfix-grok-patterns-test -f $TESTDIR_RELATIVE/Dockerfile .

docker run --rm -it -v "$PWD":/var/work postfix-grok-patterns-test

STATUS=$?
cd $ORIGDIR
exit $STATUS
