#!/bin/bash

echo "DOCKER LOGIN TOKEN: 4fe21160-51b6-4342-adab-b0577d3292dd"
docker login -u delirium

# retagging of local images
echo -e "retagging local images for push to cloud storage\n"
docker tag hcd-mca:latest delirium/horcrux-demonstrator:mca

# push all images
echo -e "starting to push images - this may take a while\n"
docker push delirium/horcrux-demonstrator:mca
