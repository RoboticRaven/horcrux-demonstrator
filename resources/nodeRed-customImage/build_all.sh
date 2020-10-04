#!/bin/bash

cd bchain
echo -e "buildling Node-RED image: hcd-bchain\n"
./build.sh > build.log
echo -e "build complete\n"

cd ../bops
echo -e "buildling Node-RED image: hcd-bops\n"
./build.sh > build.log
echo -e "build complete\n"

cd ../identity-hub
echo -e "buildling Node-RED image: hcd-identity-hub\n"
./build.sh > build.log
echo -e "build complete\n"

cd ../issuer
echo -e "buildling Node-RED image: hcd-issuer\n"
./build.sh > build.log
echo -e "build complete\n"

cd ../mca
echo -e "buildling Node-RED image: hcd-mca\n"
./build.sh > build.log
echo -e "build complete\n"

cd ../verifier
echo -e "buildling Node-RED image: hcd-verifier\n"
./build.sh > build.log
echo -e "build complete\n"

