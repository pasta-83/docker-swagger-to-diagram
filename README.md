# docker-swagger-to-diagram
A Docker image that can be used to generate UML diagrams from Swagger definitions

Run with:

docker run --rm -v $PWD:/data ngeor/docker-swagger-to-diagram swagger2png.sh swagger.yml diagram.png
