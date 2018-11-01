# docker-swagger-to-diagram
A Docker image that can be used to generate UML diagrams from Swagger definitions

[![Build Status](https://travis-ci.org/ngeor/docker-swagger-to-diagram.svg?branch=master)](https://travis-ci.org/ngeor/docker-swagger-to-diagram)

Run with:

```bash
docker run --rm -v $PWD:/data \
    ngeor/swagger-to-diagram swagger2png.sh \
    swagger-input.yml diagram-output.png
```
