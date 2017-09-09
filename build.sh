#!/bin/bash

# Just to make debugging (especially in Jenkins) easier
set -x

IMAGE_NAME=sample-application
BUILDER_IMAGE_NAME=$IMAGE_NAME-builder
IMAGE_TAG=latest

echo Building the application using builder image

#Clean up the existing build
rm -rf target

# Build the builder image
docker build -t $BUILDER_IMAGE_NAME:$IMAGE_TAG -f Dockerfile.build .
if [ $? -ne 0 ]; then
   echo Building the builder image failed
   exit 1
fi

# Create container
docker create --name $BUILDER_IMAGE_NAME $BUILDER_IMAGE_NAME:$IMAGE_TAG
if [ $? -ne 0 ]; then
   echo Creating the container failed
   exit 1
fi

# Copy the built files to host machine
docker cp $BUILDER_IMAGE_NAME:/home/target .

# Remove the builder container and image
docker rm $BUILDER_IMAGE_NAME
docker rmi $BUILDER_IMAGE_NAME:$IMAGE_TAG

# Build the actual image
docker build -t $IMAGE_NAME:$IMAGE_TAG .

