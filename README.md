# Docker builder pattern implementation for Maven-based Java projects
This project contains a sample docker builder pattern implementation.

Docker builder pattern is implemented in following steps:

* Derive from a base image (usually heavy image containing build tools, git, etc.)
* Add source code
* Build the project
* Copy the built files to the host machine
* Derive from some lightweight runtime image (containing only the things required to run application)
* Add the built files
* Build the image and push to registry

A sample Spring Boot application will be used for the build.

## How to run the application
#### Step 1: build the image
``./build.sh``

#### Step 2: run the image
``docker run -it -p 8080:8080 sample-application:latest``

#### Step 3: all done! access it from your host machine
URL: http://localhost:8080/api/v1/hello/{yourName}


**Note!** *Since version 17.05, Docker has added support for multi-stage build. It can be used to achieve the*
*same purpose with just a single Dockerfile.*

[More info about the multi-stage build support in Docker](https://docs.docker.com/engine/userguide/eng-image/multistage-build/) 