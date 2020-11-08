#!/bin/bash

cd mca
echo -e "buildling Node-RED image: hcd-mca\n"
./build.sh > build.log
echo -e "build complete\n"

