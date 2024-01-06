#!/bin/sh

cd src
make linux
cd ..

cd examples
make linux
cd ..
