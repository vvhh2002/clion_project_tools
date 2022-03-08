#!/usr/bin/env bash
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  RUNDIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
RUNDIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
ROOTDIR="$( cd -P "$( dirname "$RUNDIR/.././" )" >/dev/null 2>&1 && pwd )"
echo "This is stand CMake develop project tools"
echo "script run at ${RUNDIR}"

echo "!!!!!!!!!!!!!!! Build 3rd Parts !!!!!!!!!!!!!!!"
echo "!!!!!!!!!!!!!!! 3rd Parts Build Type :${1}!!!!!!!!!!!!!!!"
mkdir "$RUNDIR"/tmp
cd "$RUNDIR"/tmp
pwd
cmake  -DCMAKE_BUILD_TYPE=${1} ..
make all
