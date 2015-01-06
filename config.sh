#!/bin/sh

git apply build/node.diff 2> /dev/null

if [ $CC ]; then
  echo "Warning using a pre-set compiler $CC"
fi

if [ ! $PYTHON ]; then
   PYTHON=`which python`;
   echo "No python environment set, assuming $PYTHON"
   $PYTHON -V
fi

if [ ! -f "./libraries/node/" ]; then
  git submodule init
  git submodule update
fi

$PYTHON ./tools/tint_conf.py --subsystem=console --without-snapshot --dest-cpu=x64 --xcode --tag= > /dev/null
