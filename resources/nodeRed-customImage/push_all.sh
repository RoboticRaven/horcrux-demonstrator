#!/bin/bash

echo "DOCKER LOGIN TOKEN: 4fe21160-51b6-4342-adab-b0577d3292dd"
docker login -u delirium

# retagging of local images
echo -e "retagging local images for push to cloud storage\n"
docker tag hcd-bchain:latest delirium/horcrux-demonstrator:bchain
docker tag hcd-bops:latest delirium/horcrux-demonstrator:bops
docker tag hcd-identity-hub:latest delirium/horcrux-demonstrator:identity-hub
docker tag hcd-issuer:latest delirium/horcrux-demonstrator:issuer
docker tag hcd-mca:latest delirium/horcrux-demonstrator:mca
docker tag hcd-verifier:latest delirium/horcrux-demonstrator:verifier

# push all images
echo -e "starting to push images - this may take a while\n"
docker push delirium/horcrux-demonstrator:bchain
docker push delirium/horcrux-demonstrator:bops
docker push delirium/horcrux-demonstrator:identity-hub
docker push delirium/horcrux-demonstrator:issuer
docker push delirium/horcrux-demonstrator:mca
docker push delirium/horcrux-demonstrator:verifier
