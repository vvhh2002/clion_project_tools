#!/usr/bin/env bash

echo "!!!!!!!!!!!!!!! Build 3rd Parts !!!!!!!!!!!!!!!"
echo "!!!!!!!!!!!!!!! 3rd Parts Build Type :${1}!!!!!!!!!!!!!!!"
mkdir tmp
cd tmp
pwd
cmake  -DCMAKE_BUILD_TYPE=${1} ..
make all
