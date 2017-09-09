# Docker builder pattern implementation for Maven-based Java projects
This project contains a sample docker builder pattern implementation

Docker builder pattern is implemented in following steps:

* Derive from a base image (usually heavy image containing build tools, git, etc.)
* Add source code
* Build the project
* Copy the built files to the host machine
* Derive from some lightweight runtime image (containing only the things required to run application)
* Add the built files
* Build the image and push to registry

A sample Spring Boot application will be used for the build

*Note! since version 17.05, Docker has added support for multi-stage build. It can be used to implement*
*builder image.*

[More info about the multi-stage build support in Docker](https://docs.docker.com/engine/userguide/eng-image/multistage-build/) 